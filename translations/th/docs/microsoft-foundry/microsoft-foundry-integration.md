# การผสานรวม Microsoft Foundry กับ AZD

**สารบัญบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาที่เน้น AI
- **⬅️ บทก่อนหน้า**: [บทที่ 1: โปรเจกต์แรกของคุณ](../getting-started/first-project.md)
- **➡️ ถัดไป**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **🚀 บทถัดไป**: [บทที่ 3: การตั้งค่า](../getting-started/configuration.md)

## ภาพรวม

คู่มือนี้แสดงวิธีการผสานรวมบริการ Microsoft Foundry กับ Azure Developer CLI (AZD) เพื่อการปรับใช้แอปพลิเคชัน AI ที่มีประสิทธิภาพ Microsoft Foundry เป็นแพลตฟอร์มที่ครอบคลุมสำหรับการสร้าง ปรับใช้ และจัดการแอปพลิเคชัน AI ในขณะที่ AZD ช่วยลดความซับซ้อนของกระบวนการโครงสร้างพื้นฐานและการปรับใช้

## Microsoft Foundry คืออะไร?

Microsoft Foundry เป็นแพลตฟอร์มแบบครบวงจรของ Microsoft สำหรับการพัฒนา AI ซึ่งรวมถึง:

- **Model Catalog**: การเข้าถึงโมเดล AI ที่ล้ำสมัย
- **Prompt Flow**: เครื่องมือออกแบบเวิร์กโฟลว์ AI แบบภาพ
- **AI Foundry Portal**: สภาพแวดล้อมการพัฒนาที่ผสานรวมสำหรับแอปพลิเคชัน AI
- **Deployment Options**: ตัวเลือกการโฮสต์และการปรับขนาดที่หลากหลาย
- **Safety and Security**: คุณสมบัติ AI ที่รับผิดชอบในตัว

## AZD + Microsoft Foundry: การทำงานร่วมกันที่ดียิ่งขึ้น

| คุณสมบัติ | Microsoft Foundry | ประโยชน์จากการผสานรวม AZD |
|-----------|-------------------|-----------------------------|
| **การปรับใช้โมเดล** | การปรับใช้ผ่านพอร์ทัลแบบแมนนวล | การปรับใช้ที่อัตโนมัติและทำซ้ำได้ |
| **โครงสร้างพื้นฐาน** | การตั้งค่าผ่านคลิก | โครงสร้างพื้นฐานเป็นโค้ด (Bicep) |
| **การจัดการสภาพแวดล้อม** | โฟกัสที่สภาพแวดล้อมเดียว | หลายสภาพแวดล้อม (dev/staging/prod) |
| **การผสานรวม CI/CD** | จำกัด | รองรับ GitHub Actions โดยตรง |
| **การจัดการต้นทุน** | การตรวจสอบขั้นพื้นฐาน | การปรับต้นทุนให้เหมาะสมตามสภาพแวดล้อม |

## ข้อกำหนดเบื้องต้น

- การสมัครใช้งาน Azure พร้อมสิทธิ์ที่เหมาะสม
- ติดตั้ง Azure Developer CLI
- การเข้าถึงบริการ Azure OpenAI
- ความคุ้นเคยพื้นฐานกับ Microsoft Foundry

## รูปแบบการผสานรวมหลัก

### รูปแบบที่ 1: การผสานรวม Azure OpenAI

**กรณีการใช้งาน**: ปรับใช้แอปพลิเคชันแชทด้วยโมเดล Azure OpenAI

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

**โครงสร้างพื้นฐาน (main.bicep):**
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

### รูปแบบที่ 2: การผสานรวม AI Search + RAG

**กรณีการใช้งาน**: ปรับใช้แอปพลิเคชัน Retrieval-Augmented Generation (RAG)

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

### รูปแบบที่ 3: การผสานรวม Document Intelligence

**กรณีการใช้งาน**: เวิร์กโฟลว์การประมวลผลและวิเคราะห์เอกสาร

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

## 🔧 รูปแบบการตั้งค่า

### การตั้งค่าตัวแปรสภาพแวดล้อม

**การตั้งค่าการผลิต:**
```bash
# บริการ AI หลัก
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# การตั้งค่ารูปแบบ
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# การตั้งค่าประสิทธิภาพ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**การตั้งค่าการพัฒนา:**
```bash
# การตั้งค่าที่ปรับแต่งค่าใช้จ่ายสำหรับการพัฒนา
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ระดับฟรี
```

### การตั้งค่าความปลอดภัยด้วย Key Vault

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

## เวิร์กโฟลว์การปรับใช้

### การปรับใช้ด้วยคำสั่งเดียว

```bash
# ปรับใช้ทุกอย่างด้วยคำสั่งเดียว
azd up

# หรือปรับใช้ทีละขั้นตอน
azd provision  # เฉพาะโครงสร้างพื้นฐาน
azd deploy     # เฉพาะแอปพลิเคชัน
```

### การปรับใช้ตามสภาพแวดล้อม

```bash
# สภาพแวดล้อมการพัฒนา
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# สภาพแวดล้อมการผลิต
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## การตรวจสอบและการสังเกตการณ์

### การผสานรวม Application Insights

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

### การตรวจสอบต้นทุน

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

## 🔐 แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย

### การตั้งค่าตัวตนที่มีการจัดการ

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

### ความปลอดภัยของเครือข่าย

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

## การเพิ่มประสิทธิภาพ

### กลยุทธ์การแคช

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

### การตั้งค่าการปรับขนาดอัตโนมัติ

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

## การแก้ไขปัญหาทั่วไป

### ปัญหา 1: เกินโควต้า OpenAI

**อาการ:**
- การปรับใช้ล้มเหลวพร้อมข้อผิดพลาดโควต้า
- ข้อผิดพลาด 429 ในบันทึกแอปพลิเคชัน

**วิธีแก้ไข:**
```bash
# ตรวจสอบการใช้งานโควตาปัจจุบัน
az cognitiveservices usage list --location eastus

# ลองใช้ภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up

# ลดความจุชั่วคราว
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ปัญหา 2: การยืนยันตัวตนล้มเหลว

**อาการ:**
- ข้อผิดพลาด 401/403 เมื่อเรียกใช้บริการ AI
- ข้อความ "Access denied"

**วิธีแก้ไข:**
```bash
# ตรวจสอบการกำหนดบทบาท
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ตรวจสอบการตั้งค่าการจัดการตัวตน
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ตรวจสอบการเข้าถึง Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ปัญหา 3: ปัญหาการปรับใช้โมเดล

**อาการ:**
- โมเดลไม่พร้อมใช้งานในการปรับใช้
- เวอร์ชันโมเดลเฉพาะล้มเหลว

**วิธีแก้ไข:**
```bash
# แสดงรายการโมเดลที่มีอยู่ตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเวอร์ชันโมเดลในเทมเพลต bicep
# ตรวจสอบข้อกำหนดความจุของโมเดล
```

## ตัวอย่างเทมเพลต

### แอปพลิเคชันแชทพื้นฐาน

**ที่เก็บ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**บริการ**: Azure OpenAI + Cognitive Search + App Service

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ท่อประมวลผลเอกสาร

**ที่เก็บ**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**บริการ**: Document Intelligence + Storage + Functions

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template ai-document-processing
azd up
```

### แชทองค์กรด้วย RAG

**ที่เก็บ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**บริการ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template contoso-chat
azd up
```

## ขั้นตอนถัดไป

1. **ลองตัวอย่าง**: เริ่มต้นด้วยเทมเพลตที่สร้างไว้ล่วงหน้าที่ตรงกับกรณีการใช้งานของคุณ
2. **ปรับแต่งตามความต้องการของคุณ**: แก้ไขโครงสร้างพื้นฐานและโค้ดแอปพลิเคชัน
3. **เพิ่มการตรวจสอบ**: ใช้การสังเกตการณ์ที่ครอบคลุม
4. **ปรับต้นทุนให้เหมาะสม**: ปรับแต่งการตั้งค่าให้เหมาะกับงบประมาณของคุณ
5. **รักษาความปลอดภัยการปรับใช้ของคุณ**: ใช้รูปแบบความปลอดภัยระดับองค์กร
6. **ปรับขนาดสู่การผลิต**: เพิ่มคุณสมบัติหลายภูมิภาคและความพร้อมใช้งานสูง

## 🎯 แบบฝึกหัดปฏิบัติ

### แบบฝึกหัด 1: ปรับใช้แอป Azure OpenAI Chat (30 นาที)
**เป้าหมาย**: ปรับใช้และทดสอบแอปพลิเคชันแชท AI ที่พร้อมใช้งานจริง

```bash
# เริ่มต้นแม่แบบ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ตั้งค่าตัวแปรสภาพแวดล้อม
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ปรับใช้
azd up

# ทดสอบแอปพลิเคชัน
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ตรวจสอบการทำงานของ AI
azd monitor

# ล้างข้อมูล
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] การปรับใช้เสร็จสมบูรณ์โดยไม่มีข้อผิดพลาดโควต้า
- [ ] สามารถเข้าถึงอินเทอร์เฟซแชทในเบราว์เซอร์
- [ ] สามารถถามคำถามและรับคำตอบจาก AI
- [ ] Application Insights แสดงข้อมูลเทเลเมตริก
- [ ] ล้างทรัพยากรสำเร็จ

**ต้นทุนโดยประมาณ**: $5-10 สำหรับการทดสอบ 30 นาที

### แบบฝึกหัด 2: ตั้งค่าการปรับใช้หลายโมเดล (45 นาที)
**เป้าหมาย**: ปรับใช้โมเดล AI หลายตัวด้วยการตั้งค่าที่แตกต่างกัน

```bash
# สร้างการกำหนดค่าของ Bicep แบบกำหนดเอง
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

# ปรับใช้และตรวจสอบ
azd provision
azd show
```

**เกณฑ์ความสำเร็จ:**
- [ ] ปรับใช้โมเดลหลายตัวสำเร็จ
- [ ] ใช้การตั้งค่าความจุที่แตกต่างกัน
- [ ] โมเดลสามารถเข้าถึงได้ผ่าน API
- [ ] สามารถเรียกใช้โมเดลทั้งสองจากแอปพลิเคชัน

### แบบฝึกหัด 3: ใช้การตรวจสอบต้นทุน (20 นาที)
**เป้าหมาย**: ตั้งค่าแจ้งเตือนงบประมาณและติดตามต้นทุน

```bash
# เพิ่มการแจ้งเตือนงบประมาณใน Bicep
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

# ปรับใช้การแจ้งเตือนงบประมาณ
azd provision

# ตรวจสอบค่าใช้จ่ายปัจจุบัน
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างการแจ้งเตือนงบประมาณใน Azure
- [ ] ตั้งค่าการแจ้งเตือนทางอีเมล
- [ ] สามารถดูข้อมูลต้นทุนใน Azure Portal
- [ ] ตั้งค่าเกณฑ์งบประมาณอย่างเหมาะสม

## 💡 คำถามที่พบบ่อย

<details>
<summary><strong>ฉันจะลดต้นทุน Azure OpenAI ระหว่างการพัฒนาได้อย่างไร?</strong></summary>

1. **ใช้ Free Tier**: Azure OpenAI มีโควต้าฟรี 50,000 โทเค็น/เดือน
2. **ลดความจุ**: ตั้งค่าความจุเป็น 10 TPM แทนที่จะเป็น 30+ สำหรับการพัฒนา
3. **ใช้ azd down**: ปลดทรัพยากรเมื่อไม่ได้พัฒนา
4. **แคชคำตอบ**: ใช้ Redis cache สำหรับคำถามที่ซ้ำกัน
5. **ใช้ Prompt Engineering**: ลดการใช้โทเค็นด้วย prompt ที่มีประสิทธิภาพ

```bash
# การกำหนดค่าการพัฒนา
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>ความแตกต่างระหว่าง Azure OpenAI และ OpenAI API คืออะไร?</strong></summary>

**Azure OpenAI**:
- ความปลอดภัยและการปฏิบัติตามข้อกำหนดระดับองค์กร
- การผสานรวมเครือข่ายส่วนตัว
- การรับประกัน SLA
- การยืนยันตัวตนด้วย Managed Identity
- โควต้าที่สูงกว่า

**OpenAI API**:
- การเข้าถึงโมเดลใหม่ได้เร็วกว่า
- การตั้งค่าที่ง่ายกว่า
- อุปสรรคในการเริ่มต้นต่ำกว่า
- เครือข่ายสาธารณะเท่านั้น

สำหรับแอปพลิเคชันที่ใช้งานจริง **แนะนำให้ใช้ Azure OpenAI**
</details>

<details>
<summary><strong>ฉันจะจัดการข้อผิดพลาดโควต้าเกินของ Azure OpenAI ได้อย่างไร?</strong></summary>

```bash
# ตรวจสอบโควตาปัจจุบัน
az cognitiveservices usage list --location eastus2

# ลองใช้ภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up

# ลดความจุชั่วคราว
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ขอเพิ่มโควตา
# ไปที่ Azure Portal > Quotas > ขอเพิ่ม
```
</details>

<details>
<summary><strong>ฉันสามารถใช้ข้อมูลของตัวเองกับ Azure OpenAI ได้หรือไม่?</strong></summary>

ได้! ใช้ **Azure AI Search** สำหรับ RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

ดูเทมเพลต [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)
</details>

<details>
<summary><strong>ฉันจะรักษาความปลอดภัยให้กับ endpoints ของโมเดล AI ได้อย่างไร?</strong></summary>

**แนวทางปฏิบัติที่ดีที่สุด**:
1. ใช้ Managed Identity (ไม่ใช้ API keys)
2. เปิดใช้งาน Private Endpoints
3. ตั้งค่ากลุ่มความปลอดภัยเครือข่าย
4. ใช้การจำกัดอัตรา
5. ใช้ Azure Key Vault สำหรับการจัดการความลับ

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

## ชุมชนและการสนับสนุน

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ปัญหาและการสนทนา](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/azure/ai-studio/)

---

**สารบัญบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาที่เน้น AI
- **⬅️ บทก่อนหน้า**: [บทที่ 1: โปรเจกต์แรกของคุณ](../getting-started/first-project.md)
- **➡️ ถัดไป**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **🚀 บทถัดไป**: [บทที่ 3: การตั้งค่า](../getting-started/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมการสนทนาของชุมชนหรือเปิดปัญหาในที่เก็บ ชุมชน Azure AI + AZD พร้อมช่วยให้คุณประสบความสำเร็จ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามนุษย์ที่มีความเชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->