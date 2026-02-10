# Tích hợp Microsoft Foundry với AZD

**Điều hướng Chương:**
- **📚 Trang Khóa học**: [AZD Cho Người Mới](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển Ưu tiên AI
- **⬅️ Chương trước**: [Chương 1: Dự án Đầu tiên của Bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [Triển khai Mô hình AI](ai-model-deployment.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

## Tổng quan

Hướng dẫn này trình bày cách tích hợp dịch vụ Microsoft Foundry với Azure Developer CLI (AZD) để triển khai các ứng dụng AI một cách tinh gọn. Microsoft Foundry cung cấp một nền tảng toàn diện để xây dựng, triển khai và quản lý ứng dụng AI, trong khi AZD đơn giản hóa quy trình hạ tầng và triển khai.

## Microsoft Foundry là gì?

Microsoft Foundry là nền tảng thống nhất của Microsoft cho phát triển AI bao gồm:

- **Danh mục Mô hình**: Truy cập các mô hình AI tiên tiến
- **Prompt Flow**: Trình thiết kế trực quan cho luồng công việc AI
- **AI Foundry Portal**: Môi trường phát triển tích hợp cho ứng dụng AI
- **Tùy chọn Triển khai**: Nhiều phương án lưu trữ và mở rộng
- **An toàn và Bảo mật**: Các tính năng AI có trách nhiệm được tích hợp

## AZD + Microsoft Foundry: Tốt hơn khi kết hợp

| Tính năng | Microsoft Foundry | Lợi ích khi tích hợp với AZD |
|---------|-----------------|------------------------|
| **Triển khai Mô hình** | Triển khai thủ công qua cổng | Triển khai tự động, có thể lặp lại |
| **Cơ sở hạ tầng** | Cấp phát qua nhấp chuột | Hạ tầng dưới dạng mã (Bicep) |
| **Quản lý Môi trường** | Tập trung vào một môi trường | Nhiều môi trường (dev/staging/prod) |
| **Tích hợp CI/CD** | Hạn chế | Hỗ trợ GitHub Actions nguyên bản |
| **Quản lý Chi phí** | Giám sát cơ bản | Tối ưu chi phí theo môi trường |

## Yêu cầu trước

- Đăng ký Azure với quyền phù hợp
- Đã cài đặt Azure Developer CLI
- Truy cập dịch vụ Azure OpenAI
- Có kiến thức cơ bản về Microsoft Foundry

## Các mẫu tích hợp chính

### Mẫu 1: Tích hợp Azure OpenAI

**Trường hợp sử dụng**: Triển khai ứng dụng chat với các mô hình Azure OpenAI

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**Hạ tầng (main.bicep):**
```bicep
// Azure OpenAI Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Mẫu 2: Tích hợp AI Search + RAG

**Trường hợp sử dụng**: Triển khai ứng dụng RAG (retrieval-augmented generation)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Mẫu 3: Tích hợp Document Intelligence

**Trường hợp sử dụng**: Luồng xử lý và phân tích tài liệu

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Mẫu cấu hình

### Thiết lập Biến Môi trường

**Cấu hình Sản xuất:**
```bash
# Các dịch vụ AI cốt lõi
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Cấu hình mô hình
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Cài đặt hiệu suất
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Cấu hình Phát triển:**
```bash
# Cài đặt tối ưu chi phí cho phát triển
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Hạng miễn phí
```

### Cấu hình an toàn với Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Luồng triển khai

### Triển khai bằng một lệnh

```bash
# Triển khai mọi thứ bằng một lệnh
azd up

# Hoặc triển khai từng phần
azd provision  # Chỉ cơ sở hạ tầng
azd deploy     # Chỉ ứng dụng
```

### Triển khai theo từng môi trường

```bash
# Môi trường phát triển
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Môi trường sản xuất
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Giám sát và Khả năng quan sát

### Tích hợp Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Giám sát chi phí

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

## 🔐 Thực hành bảo mật tốt nhất

### Cấu hình Managed Identity

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Bảo mật mạng

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## Tối ưu hiệu năng

### Chiến lược caching

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

### Cấu hình tự động mở rộng

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Khắc phục sự cố thường gặp

### Vấn đề 1: Vượt hạn mức OpenAI

**Triệu chứng:**
- Triển khai thất bại với lỗi hạn mức
- Lỗi 429 trong nhật ký ứng dụng

**Giải pháp:**
```bash
# Kiểm tra mức sử dụng hạn ngạch hiện tại
az cognitiveservices usage list --location eastus

# Thử khu vực khác
azd env set AZURE_LOCATION westus2
azd up

# Giảm công suất tạm thời
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Vấn đề 2: Lỗi xác thực

**Triệu chứng:**
- Lỗi 401/403 khi gọi dịch vụ AI
- Thông báo "Access denied"

**Giải pháp:**
```bash
# Xác minh việc gán vai trò
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kiểm tra cấu hình danh tính được quản lý
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Xác minh truy cập Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Vấn đề 3: Sự cố triển khai mô hình

**Triệu chứng:**
- Mô hình không có sẵn trong triển khai
- Các phiên bản mô hình cụ thể bị lỗi

**Giải pháp:**
```bash
# Liệt kê các mô hình có sẵn theo khu vực
az cognitiveservices model list --location eastus

# Cập nhật phiên bản mô hình trong mẫu Bicep
# Kiểm tra yêu cầu về dung lượng của mô hình
```

## Mẫu ví dụ

### Ứng dụng Chat Cơ bản

**Kho chứa**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dịch vụ**: Azure OpenAI + Cognitive Search + App Service

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Quy trình xử lý tài liệu

**Kho chứa**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Dịch vụ**: Document Intelligence + Storage + Functions

**Bắt đầu nhanh**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat Doanh nghiệp với RAG

**Kho chứa**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dịch vụ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Bắt đầu nhanh**:
```bash
azd init --template contoso-chat
azd up
```

## Bước tiếp theo

1. **Thử các ví dụ**: Bắt đầu với một mẫu có sẵn phù hợp với trường hợp sử dụng của bạn
2. **Tùy chỉnh theo nhu cầu của bạn**: Sửa đổi hạ tầng và mã ứng dụng
3. **Thêm giám sát**: Triển khai khả năng quan sát toàn diện
4. **Tối ưu chi phí**: Tinh chỉnh cấu hình theo ngân sách của bạn
5. **Bảo mật triển khai của bạn**: Thực hiện các mẫu bảo mật doanh nghiệp
6. **Mở rộng tới môi trường sản xuất**: Thêm tính năng đa vùng và khả năng sẵn sàng cao

## 🎯 Bài tập Thực hành

### Bài tập 1: Triển khai Ứng dụng Chat Azure OpenAI (30 phút)
**Mục tiêu**: Triển khai và kiểm thử ứng dụng chat AI sẵn sàng cho sản xuất

```bash
# Khởi tạo mẫu
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Thiết lập biến môi trường
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Triển khai
azd up

# Kiểm thử ứng dụng
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Giám sát hoạt động AI
azd monitor

# Dọn dẹp
azd down --force --purge
```

**Tiêu chí Thành công:**
- [ ] Triển khai hoàn tất mà không gặp lỗi hạn mức
- [ ] Có thể truy cập giao diện chat trên trình duyệt
- [ ] Có thể đặt câu hỏi và nhận phản hồi do AI cung cấp
- [ ] Application Insights hiển thị dữ liệu telemetri
- [ ] Đã dọn dẹp tài nguyên thành công

**Chi phí ước tính**: $5-10 cho 30 phút thử nghiệm

### Bài tập 2: Cấu hình Triển khai Nhiều Mô hình (45 phút)
**Mục tiêu**: Triển khai nhiều mô hình AI với các cấu hình khác nhau

```bash
# Tạo cấu hình Bicep tùy chỉnh
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Triển khai và xác minh
azd provision
azd show
```

**Tiêu chí Thành công:**
- [ ] Nhiều mô hình được triển khai thành công
- [ ] Áp dụng các cài đặt dung lượng khác nhau
- [ ] Mô hình có thể truy cập qua API
- [ ] Có thể gọi cả hai mô hình từ ứng dụng

### Bài tập 3: Triển khai Giám sát Chi phí (20 phút)
**Mục tiêu**: Thiết lập cảnh báo ngân sách và theo dõi chi phí

```bash
# Thêm cảnh báo ngân sách vào Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
EOF

# Triển khai cảnh báo ngân sách
azd provision

# Kiểm tra chi phí hiện tại
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Tiêu chí Thành công:**
- [ ] Tạo cảnh báo ngân sách trong Azure
- [ ] Cấu hình thông báo qua email
- [ ] Có thể xem dữ liệu chi phí trong Azure Portal
- [ ] Ngưỡng ngân sách được đặt phù hợp

## 💡 Câu hỏi thường gặp

<details>
<summary><strong>Làm thế nào để giảm chi phí Azure OpenAI trong quá trình phát triển?</strong></summary>

1. **Sử dụng tầng miễn phí**: Azure OpenAI cung cấp 50.000 token/tháng miễn phí
2. **Giảm Dung lượng**: Đặt dung lượng về 10 TPM thay vì 30+ cho môi trường phát triển
3. **Sử dụng azd down**: Giải phóng tài nguyên khi không đang phát triển tích cực
4. **Lưu vào bộ nhớ đệm**: Triển khai Redis cache cho các truy vấn lặp lại
5. **Sử dụng Prompt Engineering**: Giảm lượng token sử dụng bằng cách tối ưu prompt

```bash
# Cấu hình phát triển
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Sự khác biệt giữa Azure OpenAI và OpenAI API là gì?</strong></summary>

**Azure OpenAI**:
- Bảo mật doanh nghiệp và tuân thủ
- Tích hợp mạng riêng
- Cam kết SLA
- Xác thực bằng Managed Identity
- Hạn mức cao hơn sẵn có

**OpenAI API**:
- Truy cập nhanh hơn tới các mô hình mới
- Thiết lập đơn giản hơn
- Rào cản gia nhập thấp hơn
- Chỉ qua internet công cộng

Đối với ứng dụng sản xuất, **khuyến nghị sử dụng Azure OpenAI**.
</details>

<details>
<summary><strong>Làm thế nào để xử lý lỗi vượt hạn mức Azure OpenAI?</strong></summary>

```bash
# Kiểm tra hạn mức hiện tại
az cognitiveservices usage list --location eastus2

# Thử khu vực khác
azd env set AZURE_LOCATION westus2
azd up

# Giảm dung lượng tạm thời
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Yêu cầu tăng hạn mức
# Đi tới Azure Portal > Hạn mức > Yêu cầu tăng
```
</details>

<details>
<summary><strong>Tôi có thể sử dụng dữ liệu riêng với Azure OpenAI không?</strong></summary>

Có! Sử dụng **Azure AI Search** cho RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Xem mẫu [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Làm thế nào để bảo mật các endpoint mô hình AI?</strong></summary>

**Thực hành tốt nhất**:
1. Sử dụng Managed Identity (không dùng API keys)
2. Bật Private Endpoints
3. Cấu hình nhóm bảo mật mạng
4. Triển khai giới hạn tần suất (rate limiting)
5. Sử dụng Azure Key Vault để lưu bí mật

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Cộng đồng và Hỗ trợ

- **Microsoft Foundry Discord**: [kênh #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues và thảo luận](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Tài liệu chính thức](https://learn.microsoft.com/azure/ai-studio/)

---

**Điều hướng Chương:**
- **📚 Trang Khóa học**: [AZD Cho Người Mới](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển Ưu tiên AI
- **⬅️ Chương trước**: [Chương 1: Dự án Đầu tiên của Bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [Triển khai Mô hình AI](ai-model-deployment.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

**Cần trợ giúp?** Tham gia thảo luận cộng đồng của chúng tôi hoặc mở một issue trong kho chứa. Cộng đồng Azure AI + AZD ở đây để giúp bạn thành công!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ gốc của nó nên được coi là nguồn có thẩm quyền. Đối với những thông tin quan trọng, nên sử dụng bản dịch chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->