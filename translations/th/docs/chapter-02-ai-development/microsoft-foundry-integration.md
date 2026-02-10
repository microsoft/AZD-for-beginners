# การผสาน Microsoft Foundry กับ AZD

**การนำทางบทเรียน:**
- **📚 หน้าหลักของหลักสูตร**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: Chapter 2 - AI-First Development
- **⬅️ บทก่อนหน้า**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ ถัดไป**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 บทถัดไป**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## ภาพรวม

คำแนะนำนี้แสดงวิธีการผสานบริการ Microsoft Foundry กับ Azure Developer CLI (AZD) เพื่อการปรับใช้แอป AI ที่ราบรื่น Microsoft Foundry ให้แพลตฟอร์มแบบครบวงจรสำหรับการสร้าง ปรับใช้ และจัดการแอป AI ขณะที่ AZD ช่วยลดความซับซ้อนของโครงสร้างพื้นฐานและกระบวนการปรับใช้

## Microsoft Foundry คืออะไร?

Microsoft Foundry เป็นแพลตฟอร์มรวมของ Microsoft สำหรับการพัฒนา AI ซึ่งรวมถึง:

- **แคตตาล็อกโมเดล**: เข้าถึงโมเดล AI ที่ทันสมัย
- **Prompt Flow**: เครื่องมือออกแบบแบบภาพสำหรับเวิร์กโฟลว์ AI
- **AI Foundry Portal**: สภาพแวดล้อมการพัฒนาแบบบูรณาการสำหรับแอป AI
- **ตัวเลือกการปรับใช้**: ตัวเลือกโฮสติ้งและการปรับขนาดหลายแบบ
- **ความปลอดภัยและความรับผิดชอบ**: ฟีเจอร์ด้าน AI ที่รับผิดชอบในตัว

## AZD + Microsoft Foundry: ดีขึ้นเมื่อใช้ร่วมกัน

| คุณสมบัติ | Microsoft Foundry | ประโยชน์จากการผสานกับ AZD |
|---------|-----------------|------------------------|
| **การปรับใช้โมเดล** | ปรับใช้ผ่านพอร์ทัลด้วยตนเอง | การปรับใช้แบบอัตโนมัติและทำซ้ำได้ |
| **โครงสร้างพื้นฐาน** | การจัดเตรียมแบบคลิกผ่าน | โครงสร้างพื้นฐานเป็นโค้ด (Bicep) |
| **การจัดการสภาพแวดล้อม** | มุ่งเน้นสภาพแวดล้อมเดี่ยว | หลายสภาพแวดล้อม (dev/staging/prod) |
| **การผสาน CI/CD** | จำกัด | รองรับ GitHub Actions โดยตรง |
| **การจัดการค่าใช้จ่าย** | การตรวจสอบพื้นฐาน | การปรับแต่งค่าใช้จ่ายเฉพาะสภาพแวดล้อม |

## ข้อกำหนดเบื้องต้น

- มีการสมัครใช้งาน Azure พร้อมสิทธิ์ที่เหมาะสม
- ติดตั้ง Azure Developer CLI แล้ว
- เข้าถึงบริการ Azure OpenAI
- มีความคุ้นเคยพื้นฐานกับ Microsoft Foundry

## รูปแบบการผสานหลัก

### รูปแบบที่ 1: การผสาน Azure OpenAI

**กรณีการใช้งาน**: ปรับใช้แอปแชทด้วยโมเดล Azure OpenAI

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

### รูปแบบที่ 2: การผสาน AI Search + RAG

**กรณีการใช้งาน**: ปรับใช้แอป Retrieval-Augmented Generation (RAG)

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

### รูปแบบที่ 3: การผสาน Document Intelligence

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

## 🔧 รูปแบบการกำหนดค่า

### การตั้งค่าตัวแปรสภาพแวดล้อม

**การกำหนดค่าสำหรับโปรดักชัน:**
```bash
# บริการ AI หลัก
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# การกำหนดค่าโมเดล
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# การตั้งค่าประสิทธิภาพ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**การกำหนดค่าสำหรับการพัฒนา:**
```bash
# การตั้งค่าที่ปรับให้เหมาะสมด้านต้นทุนสำหรับการพัฒนา
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ระดับฟรี
```

### การกำหนดค่าอย่างปลอดภัยด้วย Key Vault

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

# หรือปรับใช้ทีละส่วน
azd provision  # เฉพาะโครงสร้างพื้นฐาน
azd deploy     # เฉพาะแอปพลิเคชัน
```

### การปรับใช้เฉพาะสภาพแวดล้อม

```bash
# สภาพแวดล้อมการพัฒนา
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# สภาพแวดล้อมการใช้งานจริง
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## การตรวจสอบและความสามารถในการสังเกตการณ์

### การผสาน Application Insights

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

### การตรวจสอบค่าใช้จ่าย

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

## 🔐 แนวปฏิบัติด้านความปลอดภัยที่ดีที่สุด

### การกำหนดค่า Managed Identity

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

### ความปลอดภัยเครือข่าย

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

## การปรับแต่งประสิทธิภาพ

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

### การกำหนดค่าการปรับขนาดอัตโนมัติ

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

### ปัญหา 1: โควต้า OpenAI ถูกเกิน

**อาการ:**
- การปรับใช้ล้มเหลวด้วยข้อผิดพลาดโควต้า
- ข้อผิดพลาด 429 ในบันทึกแอปพลิเคชัน

**วิธีแก้:**
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

### ปัญหา 2: การตรวจสอบสิทธิ์ล้มเหลว

**อาการ:**
- ข้อผิดพลาด 401/403 เมื่อเรียกใช้บริการ AI
- ข้อความ "Access denied"

**วิธีแก้:**
```bash
# ตรวจสอบการมอบหมายบทบาท
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ตรวจสอบการกำหนดค่าตัวตนที่มีการจัดการ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ตรวจสอบการเข้าถึง Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ปัญหา 3: ปัญหาการปรับใช้โมเดล

**อาการ:**
- โมเดลไม่พร้อมใช้งานในการปรับใช้
- เวอร์ชันโมเดลเฉพาะล้มเหลว

**วิธีแก้:**
```bash
# แสดงรายการโมเดลที่มีตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเวอร์ชันของโมเดลในเทมเพลต Bicep
# ตรวจสอบข้อกำหนดด้านความจุของโมเดล
```

## ตัวอย่างเทมเพลต

### แอปแชทพื้นฐาน

**ที่เก็บ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**บริการ**: Azure OpenAI + Cognitive Search + App Service

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ท่อการประมวลผลเอกสาร

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

1. **ลองตัวอย่าง**: เริ่มด้วยเทมเพลตสำเร็จรูปที่ตรงกับกรณีการใช้งานของคุณ
2. **ปรับแต่งตามความต้องการ**: แก้ไขโครงสร้างพื้นฐานและโค้ดแอปพลิเคชัน
3. **เพิ่มการตรวจสอบ**: นำการสังเกตการณ์แบบครบวงจรมาใช้
4. **ปรับค่าใช้จ่าย**: ปรับแต่งการกำหนดค่าให้สอดคล้องกับงบประมาณ
5. **ปกป้องการปรับใช้ของคุณ**: นำรูปแบบความปลอดภัยระดับองค์กรมาใช้
6. **ขยายสู่โปรดักชัน**: เพิ่มหลายภูมิภาคและฟีเจอร์ความพร้อมใช้งานสูง

## 🎯 แบบฝึกหัดเชิงปฏิบัติ

### แบบฝึกหัด 1: ปรับใช้แอปแชท Azure OpenAI (30 นาที)
**เป้าหมาย**: ปรับใช้และทดสอบแอปแชท AI ที่พร้อมใช้งานจริง

```bash
# เริ่มต้นเทมเพลต
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

# ตรวจสอบการดำเนินงานของ AI
azd monitor

# ทำความสะอาด
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] การปรับใช้เสร็จสมบูรณ์โดยไม่มีข้อผิดพลาดโควต้า
- [ ] สามารถเข้าถึงอินเทอร์เฟซแชทในเบราว์เซอร์
- [ ] สามารถถามคำถามและได้รับคำตอบจาก AI
- [ ] Application Insights แสดงข้อมูลเทเลเมทรี
- [ ] ทำการล้างทรัพยากรสำเร็จ

**ค่าใช้จ่ายโดยประมาณ**: $5-10 สำหรับการทดสอบ 30 นาที

### แบบฝึกหัด 2: กำหนดค่าการปรับใช้หลายโมเดล (45 นาที)
**เป้าหมาย**: ปรับใช้โมเดล AI หลายตัวด้วยการกำหนดค่าที่แตกต่าง

```bash
# สร้างการกำหนดค่า Bicep แบบกำหนดเอง
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
- [ ] โมเดลหลายตัวถูกปรับใช้สำเร็จ
- [ ] ใช้การตั้งค่าความจุต่างกัน
- [ ] โมเดลเข้าถึงได้ผ่าน API
- [ ] สามารถเรียกใช้ทั้งสองโมเดลจากแอปพลิเคชัน

### แบบฝึกหัด 3: ตั้งค่าการตรวจสอบค่าใช้จ่าย (20 นาที)
**เป้าหมาย**: ตั้งค่าแจ้งเตือนงบประมาณและการติดตามค่าใช้จ่าย

```bash
# เพิ่มการแจ้งเตือนงบประมาณให้กับ Bicep
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
- [ ] สามารถดูข้อมูลค่าใช้จ่ายใน Azure Portal
- [ ] ตั้งค่าขีดจำกัดงบประมาณอย่างเหมาะสม

## 💡 คำถามที่พบบ่อย

<details>
<summary><strong>ฉันจะลดค่าใช้จ่าย Azure OpenAI ในระหว่างการพัฒนาได้อย่างไร?</strong></summary>

1. **ใช้ระดับฟรี**: Azure OpenAI มีโควต้าฟรี 50,000 โทเค็น/เดือน
2. **ลดความจุ**: ตั้งความจุเป็น 10 TPM แทน 30+ สำหรับการพัฒนา
3. **ใช้ azd down**: ปลดการจัดสรรทรัพยากรเมื่อไม่ใช้งานในการพัฒนา
4. **แคชคำตอบ**: ใช้ Redis cache สำหรับคำถามที่ซ้ำกัน
5. **ใช้การออกแบบพรอมต์**: ลดการใช้โทเค็นด้วยพรอมต์ที่มีประสิทธิภาพ

```bash
# การกำหนดค่าสำหรับการพัฒนา
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>ความแตกต่างระหว่าง Azure OpenAI และ OpenAI API คืออะไร?</strong></summary>

**Azure OpenAI**:
- ความปลอดภัยระดับองค์กรและการปฏิบัติตามข้อกำหนด
- การผสานเครือข่ายส่วนตัว
- ข้อรับประกัน SLA
- การตรวจสอบสิทธิ์ด้วย Managed Identity
- โควต้าที่สูงขึ้น

**OpenAI API**:
- เข้าถึงโมเดลใหม่ได้เร็วกว่า
- การตั้งค่าที่ง่ายกว่า
- เข้าถึงได้ง่ายกว่า
- ใช้งานผ่านอินเทอร์เน็ตสาธารณะเท่านั้น

สำหรับแอปในสภาพแวดล้อมการผลิต ขอแนะนำให้ใช้ **Azure OpenAI**.
</details>

<details>
<summary><strong>ฉันจะแก้ไขข้อผิดพลาดโควต้า Azure OpenAI เกินได้อย่างไร?</strong></summary>

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
# ไปที่พอร์ทัล Azure > โควตา > ขอเพิ่มโควตา
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

ดูเทมเพลต [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>ฉันจะปกป้องจุดเชื่อมต่อโมเดล AI ได้อย่างไร?</strong></summary>

**แนวปฏิบัติที่ดีที่สุด**:
1. ใช้ Managed Identity (ไม่ใช้ API keys)
2. เปิดใช้งาน Private Endpoints
3. กำหนดค่า Network Security Groups
4. ใช้มาตรการจำกัดอัตราการร้องขอ
5. ใช้ Azure Key Vault สำหรับความลับ

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

- **Discord ของ Microsoft Foundry**: [#Azure channel](https://discord.gg/microsoft-azure)
- **GitHub ของ AZD**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/azure/ai-studio/)

---

**การนำทางบทเรียน:**
- **📚 หน้าหลักของหลักสูตร**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: Chapter 2 - AI-First Development
- **⬅️ บทก่อนหน้า**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ ถัดไป**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 บทถัดไป**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมการสนทนาในชุมชนหรือเปิด issue ในที่เก็บรหัส ชุมชน Azure AI + AZD พร้อมช่วยให้คุณประสบความสำเร็จ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
คำปฏิเสธความรับผิด:
เอกสารฉบับนี้ถูกแปลโดยใช้บริการแปลด้วยปัญญาประดิษฐ์ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้การแปลมีความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่แม่นยำได้ เอกสารต้นฉบับในภาษาต้นทางควรถูกถือเป็นแหล่งอ้างอิงที่เป็นทางการ สำหรับข้อมูลสำคัญ แนะนำให้ใช้บริการแปลโดยนักแปลมืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่คลาดเคลื่อนใดๆ ที่เกิดจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->