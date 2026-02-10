# คู่มือการเลือก SKU - การเลือกชั้นบริการ Azure ที่เหมาะสม

**การนำทางบทเรียน:**
- **📚 หน้าหลักคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 6 - การตรวจสอบและวางแผนก่อนการปรับใช้
- **⬅️ ก่อนหน้า**: [การวางแผนความจุ](capacity-planning.md)
- **➡️ ถัดไป**: [การตรวจสอบก่อนการบิน](preflight-checks.md)
- **🚀 บทถัดไป**: [บทที่ 7: การแก้ไขปัญหา](../chapter-07-troubleshooting/common-issues.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้ช่วยให้คุณเลือก SKU ของบริการ Azure (Stock Keeping Units) ที่เหมาะสมสำหรับสภาพแวดล้อม งาน และข้อกำหนดต่างๆ เรียนรู้การวิเคราะห์ความต้องการด้านประสิทธิภาพ การพิจารณาต้นทุน และความต้องการด้านการขยายตัวเพื่อเลือกชั้นบริการที่เหมาะสมที่สุดสำหรับการปรับใช้ด้วย Azure Developer CLI ของคุณ

## วัตถุประสงค์การเรียนรู้

เมื่อทำคู่มือนี้เสร็จสิ้น คุณจะ:
- เข้าใจแนวคิด SKU ของ Azure แบบจำลองการคิดราคา และความแตกต่างของฟีเจอร์
- เชี่ยวชาญกลยุทธ์การเลือก SKU ตามสภาพแวดล้อมสำหรับการพัฒนา สเตจ และการผลิต
- วิเคราะห์ข้อกำหนดของงานและจับคู่กับชั้นบริการที่เหมาะสม
- นำกลยุทธ์การเพิ่มประสิทธิภาพต้นทุนมาใช้ผ่านการเลือก SKU อย่างชาญฉลาด
- ใช้เทคนิคการทดสอบประสิทธิภาพและการตรวจสอบสำหรับการเลือก SKU
- กำหนดค่าการแนะนำ SKU อัตโนมัติและการติดตาม

## ผลการเรียนรู้

เมื่อเสร็จสิ้น คุณจะสามารถ:
- เลือก SKU ของบริการ Azure ที่เหมาะสมตามข้อกำหนดและข้อจำกัดของงาน
- ออกแบบสถาปัตยกรรมหลายสภาพแวดล้อมที่คุ้มค่าด้วยการเลือกชั้นอย่างเหมาะสม
- ดำเนินการวัดประสิทธิภาพและการยืนยันสำหรับการเลือก SKU
- สร้างเครื่องมืออัตโนมัติสำหรับการแนะนำ SKU และการเพิ่มประสิทธิภาพต้นทุน
- วางแผนการย้ายและกลยุทธ์การปรับขนาด SKU เมื่อความต้องการเปลี่ยนแปลง
- ประยุกต์ใช้หลักการของ Azure Well-Architected Framework ในการเลือกชั้นบริการ

## สารบัญ

- [ความเข้าใจเกี่ยวกับ SKUs](../../../../docs/chapter-06-pre-deployment)
- [การเลือกตามสภาพแวดล้อม](../../../../docs/chapter-06-pre-deployment)
- [แนวทางเฉพาะบริการ](../../../../docs/chapter-06-pre-deployment)
- [กลยุทธ์การเพิ่มประสิทธิภาพต้นทุน](../../../../docs/chapter-06-pre-deployment)
- [การพิจารณาด้านประสิทธิภาพ](../../../../docs/chapter-06-pre-deployment)
- [ตารางอ้างอิงด่วน](../../../../docs/chapter-06-pre-deployment)
- [เครื่องมือการตรวจสอบ](../../../../docs/chapter-06-pre-deployment)

---

## ความเข้าใจเกี่ยวกับ SKUs

### SKUs คืออะไร?

SKU (Stock Keeping Units) แทนชั้นบริการและระดับประสิทธิภาพต่างๆ สำหรับทรัพยากร Azure แต่ละ SKU มีความแตกต่างในด้าน:

- **ลักษณะประสิทธิภาพ** (CPU, memory, throughput)
- **ความพร้อมใช้งานของฟีเจอร์** (ตัวเลือกการปรับขนาด ระดับ SLA)
- **รูปแบบการคิดราคา** (แบบจ่ายตามการใช้งาน แบบจองความจุ)
- **ความพร้อมใช้งานตามภูมิภาค** (ไม่ใช่ทุก SKU ที่มีในทุกภูมิภาค)

### ปัจจัยสำคัญในการเลือก SKU

1. **ข้อกำหนดของงาน**
   - รูปแบบการรับส่ง/โหลดที่คาดการณ์
   - ความต้องการด้านประสิทธิภาพ (CPU, memory, I/O)
   - ความต้องการพื้นที่จัดเก็บและรูปแบบการเข้าถึง

2. **ประเภทสภาพแวดล้อม**
   - การพัฒนา/ทดสอบ เทียบกับการผลิต
   - ความต้องการด้านความพร้อมใช้งาน
   - ความต้องการด้านความปลอดภัยและการปฏิบัติตามข้อกำหนด

3. **ข้อจำกัดงบประมาณ**
   - ต้นทุนเริ่มต้นเทียบกับต้นทุนปฏิบัติการ
   - ส่วนลดการจองความจุ
   - ผลกระทบของการปรับขนาดอัตโนมัติต่อต้นทุน

4. **ประมาณการการเติบโต**
   - ข้อกำหนดการปรับขนาด
   - ฟีเจอร์ที่อาจต้องการในอนาคต
   - ความซับซ้อนในการย้าย

---

## การเลือกตามสภาพแวดล้อม

### สภาพแวดล้อมการพัฒนา

**ลำดับความสำคัญ**: การเพิ่มประสิทธิภาพต้นทุน ฟังก์ชันพื้นฐาน การจัดเตรียม/ยกเลิกการจัดเตรียมได้ง่าย

#### SKU ที่แนะนำ
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Free"          # Free tier (400 RU/s)
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "Free" # First 5GB free
```

#### ลักษณะ
- **App Service**: F1 (Free) หรือ B1 (Basic) สำหรับการทดสอบง่ายๆ
- **Databases**: ชั้น Basic พร้อมทรัพยากรขั้นต่ำ
- **Storage**: แบบ Standard พร้อมความซ้ำซ้อนท้องถิ่นเท่านั้น
- **Compute**: ยอมรับการใช้ทรัพยากรร่วมได้
- **Networking**: การกำหนดค่าพื้นฐาน

### สภาพแวดล้อมสเตจ/ทดสอบ

**ลำดับความสำคัญ**: การตั้งค่าคล้ายการผลิต สมดุลต้นทุน ความสามารถในการทดสอบประสิทธิภาพ

#### SKU ที่แนะนำ
```yaml
# Staging environment configuration
environment: staging
skus:
  app_service: "S1"          # Standard tier
  sql_database: "S2"         # Standard tier, 50 DTU
  storage: "Standard_GRS"    # Geo-redundant
  cosmos_db: "Standard"      # 400 RU/s provisioned
  container_apps: "Consumption" # Pay-per-use
```

#### ลักษณะ
- **ประสิทธิภาพ**: 70-80% ของความจุการผลิต
- **ฟีเจอร์**: เปิดใช้งานฟีเจอร์ส่วนใหญ่ของการผลิต
- **ความซ้ำซ้อน**: มีความซ้ำซ้อนในบางภูมิภาค
- **การปรับขนาด**: การปรับขนาดอัตโนมัติจำกัดสำหรับการทดสอบ
- **การตรวจสอบ**: ชุดการตรวจสอบครบถ้วน

### สภาพแวดล้อมการผลิต

**ลำดับความสำคัญ**: ประสิทธิภาพ ความพร้อมใช้งาน ความปลอดภัย การปฏิบัติตามข้อกำหนด ความสามารถในการขยาย

#### SKU ที่แนะนำ
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Premium_GRS"     # Premium geo-redundant
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### ลักษณะ
- **ความพร้อมใช้งานสูง**: ความต้องการ SLA 99.9%+
- **ประสิทธิภาพ**: ทรัพยากรเฉพาะ ประสิทธิภาพสูง
- **ความปลอดภัย**: ฟีเจอร์ความปลอดภัยระดับพรีเมียม
- **การปรับขนาด**: ความสามารถในการปรับขนาดอัตโนมัติเต็มรูปแบบ
- **การตรวจสอบ**: การสังเกตการณ์อย่างครอบคลุม

---

## แนวทางเฉพาะบริการ

### Azure App Service

#### เมทริกซ์การตัดสินใจ SKU

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | คุ้มค่าสำหรับต้นทุน เพียงพอสำหรับการทดสอบ |
| Small production apps | S1 (Standard) | โดเมนกำหนดเอง, SSL, การปรับขนาดอัตโนมัติ |
| Medium production apps | P1V3 (Premium V3) | ประสิทธิภาพดีกว่า ฟีเจอร์มากขึ้น |
| High-traffic apps | P2V3 or P3V3 | ทรัพยากรเฉพาะ ประสิทธิภาพสูง |
| Mission-critical apps | I1V2 (Isolated V2) | การแยกเครือข่าย ฮาร์ดแวร์เฉพาะ |

#### ตัวอย่างการกำหนดค่า

**การพัฒนา**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-dev'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
  properties: {
    reserved: false
  }
}
```

**การผลิต**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-prod'
  location: location
  sku: {
    name: 'P1V3'
    tier: 'PremiumV3'
    capacity: 3
  }
  properties: {
    reserved: false
  }
}
```

### Azure SQL Database

#### กรอบการเลือก SKU

1. **แบบ DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - การพัฒนา/ทดสอบ
   - **Standard**: S0-S12 (10-3000 DTU) - วัตถุประสงค์ทั่วไป
   - **Premium**: P1-P15 (125-4000 DTU) - งานที่ต้องการประสิทธิภาพสูง

2. **แบบ vCore** (แนะนำสำหรับการผลิต)
   - **General Purpose**: สมดุลระหว่างคอมพิวต์และพื้นที่จัดเก็บ
   - **Business Critical**: ความหน่วงต่ำ IOPS สูง
   - **Hyperscale**: พื้นที่จัดเก็บที่ปรับขนาดได้สูง (สูงสุดถึง 100TB)

#### ตัวอย่างการกำหนดค่า

```bicep
// Development
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-dev'
  parent: sqlServer
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    maxSizeBytes: 2147483648 // 2GB
  }
}

// Production
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-prod'
  parent: sqlServer
  location: location
  sku: {
    name: 'GP_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 4
  }
  properties: {
    maxSizeBytes: 536870912000 // 500GB
  }
}
```

### Azure Container Apps

#### ประเภทสภาพแวดล้อม

1. **แบบจ่ายตามการใช้งาน (Consumption-based)**
   - จ่ายตามการใช้งาน
   - เหมาะสำหรับการพัฒนาและงานที่มีความผันผวนของโหลด
   - โครงสร้างพื้นฐานร่วมกัน

2. **แบบเฉพาะ (Dedicated) (Workload Profiles)**
   - ทรัพยากรคอมพิวต์เฉพาะ
   - ประสิทธิภาพที่คาดการณ์ได้
   - เหมาะสำหรับงานการผลิตมากกว่า

#### ตัวอย่างการกำหนดค่า

**การพัฒนา (Consumption)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-dev'
  location: location
  properties: {
    zoneRedundant: false
  }
}

resource containerApp 'Microsoft.App/containerApps@2022-10-01' = {
  name: 'ca-${environmentName}-dev'
  location: location
  properties: {
    managedEnvironmentId: containerAppEnvironment.id
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
      }
    }
    template: {
      containers: [{
        name: 'main'
        image: 'nginx:latest'
        resources: {
          cpu: json('0.25')
          memory: '0.5Gi'
        }
      }]
      scale: {
        minReplicas: 0
        maxReplicas: 1
      }
    }
  }
}
```

**การผลิต (Dedicated)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 2
      maximumCount: 10
    }]
  }
}
```

### Azure Cosmos DB

#### แบบโมเดล Throughput

1. **Manual Provisioned Throughput**
   - ประสิทธิภาพที่คาดการณ์ได้
   - ส่วนลดการจองความจุ
   - เหมาะสำหรับงานที่มีความคงที่

2. **Autoscale Provisioned Throughput**
   - การปรับขนาดอัตโนมัติตามการใช้งาน
   - จ่ายตามการใช้งานจริง (มีค่าขั้นต่ำ)
   - ดีสำหรับงานที่มีความผันผวน

3. **Serverless**
   - จ่ายตามคำขอ
   - ไม่มีการจัดเตรียม throughput
   - เหมาะสำหรับการพัฒนาและงานที่เป็นช่วงๆ

#### ตัวอย่าง SKU

```bicep
// Development - Serverless
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-dev'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [{
      locationName: location
    }]
    capabilities: [{
      name: 'EnableServerless'
    }]
  }
}

// Production - Provisioned with Autoscale
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-prod'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
      }
      {
        locationName: secondaryLocation
        failoverPriority: 1
      }
    ]
    enableAutomaticFailover: true
    enableMultipleWriteLocations: false
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  name: 'main'
  parent: cosmosAccount
  properties: {
    resource: {
      id: 'main'
    }
    options: {
      autoscaleSettings: {
        maxThroughput: 4000
      }
    }
  }
}
```

### Azure Storage Account

#### ประเภทบัญชีจัดเก็บ

1. **Standard_LRS** - การพัฒนา ข้อมูลที่ไม่สำคัญ
2. **Standard_GRS** - การผลิต เมื่อต้องการความซ้ำซ้อนแบบภูมิภาค
3. **Premium_LRS** - แอปพลิเคชันที่ต้องการประสิทธิภาพสูง
4. **Premium_ZRS** - ความพร้อมใช้งานสูงพร้อมความซ้ำซ้อนแบบโซน

#### ชั้นประสิทธิภาพ

- **Standard**: วัตถุประสงค์ทั่วไป คุ้มค่า
- **Premium**: ประสิทธิภาพสูง สถานการณ์หน่วงต่ำ

```bicep
// Development
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}dev'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}

// Production
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}prod'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    networkAcls: {
      defaultAction: 'Deny'
      virtualNetworkRules: []
      ipRules: []
    }
  }
}
```

---

## กลยุทธ์การเพิ่มประสิทธิภาพต้นทุน

### 1. การจองความจุ (Reserved Capacity)

จองทรัพยากร 1-3 ปีเพื่อรับส่วนลดอย่างมีนัยสำคัญ:

```bash
# ตรวจสอบตัวเลือกการจอง
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. การปรับขนาดให้เหมาะสม (Right-Sizing)

เริ่มด้วย SKU ที่เล็กกว่าแล้วปรับขึ้นตามการใช้งานจริง:

```yaml
# Progressive scaling approach
development:
  app_service: "F1"    # Free tier
testing:
  app_service: "B1"    # Basic tier  
staging:
  app_service: "S1"    # Standard tier
production:
  app_service: "P1V3"  # Premium tier
```

### 3. การกำหนดการปรับขนาดอัตโนมัติ

นำการปรับขนาดอัจฉริยะมาใช้เพื่อเพิ่มประสิทธิภาพต้นทุน:

```bicep
resource autoScaleSettings 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'autoscale-${appServicePlan.name}'
  location: location
  properties: {
    profiles: [{
      name: 'default'
      capacity: {
        minimum: '1'
        maximum: '10'
        default: '2'
      }
      rules: [
        {
          metricTrigger: {
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'GreaterThan'
            threshold: 70
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Increase'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
        {
          metricTrigger: {
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'LessThan'
            threshold: 30
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Decrease'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
      ]
    }]
    enabled: true
    targetResourceUri: appServicePlan.id
  }
}
```

### 4. การปรับขนาดตามตารางเวลา

ปรับลดในช่วงเวลาที่ใช้งานน้อย:

```json
{
  "profiles": [
    {
      "name": "business-hours",
      "capacity": {
        "minimum": "2",
        "maximum": "10", 
        "default": "3"
      },
      "recurrence": {
        "frequency": "Week",
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [8],
          "minutes": [0]
        }
      }
    },
    {
      "name": "off-hours",
      "capacity": {
        "minimum": "1",
        "maximum": "2",
        "default": "1"
      },
      "recurrence": {
        "frequency": "Week", 
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [18],
          "minutes": [0]
        }
      }
    }
  ]
}
```

---

## การพิจารณาด้านประสิทธิภาพ

### ข้อกำหนดประสิทธิภาพพื้นฐาน

กำหนดข้อกำหนดประสิทธิภาพให้ชัดเจนก่อนการเลือก SKU:

```yaml
performance_requirements:
  response_time:
    p95: "< 500ms"
    p99: "< 1000ms"
  throughput:
    requests_per_second: 1000
    concurrent_users: 500
  availability:
    uptime: "99.9%"
    rpo: "15 minutes"
    rto: "30 minutes"
```

### การทดสอบโหลด

ทดสอบ SKU ต่างๆ เพื่อยืนยันประสิทธิภาพ:

```bash
# บริการทดสอบโหลดของ Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### การตรวจสอบและการปรับให้เหมาะสม

ตั้งค่าการตรวจสอบอย่างครอบคลุม:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    RetentionInDays: 90
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'law-${environmentName}'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}
```

---

## ตารางอ้างอิงด่วน

### ตารางอ้างอิงด่วนของ App Service SKU

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | การพัฒนา |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | แอปเล็กๆ |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | การผลิต |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | ประสิทธิภาพสูง |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | ภาคธุรกิจระดับองค์กร |

### ตารางอ้างอิงด่วนของ SQL Database SKU

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | การพัฒนา |
| S2 | Standard | 50 DTU | 250GB | $$ | การผลิตขนาดเล็ก |
| P2 | Premium | 250 DTU | 1TB | $$$ | ประสิทธิภาพสูง |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | สมดุล |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | งานที่สำคัญต่อภารกิจ |

### ตารางอ้างอิงด่วนของ Container Apps SKU

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | การพัฒนา โหลดผันผวน |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | การผลิต |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | ประสิทธิภาพสูง |

---

## เครื่องมือการตรวจสอบ

### ตัวตรวจสอบความพร้อมใช้งาน SKU

```bash
#!/bin/bash
# ตรวจสอบความพร้อมใช้งานของ SKU ในภูมิภาคเป้าหมาย

check_sku_availability() {
    local region=$1
    local resource_type=$2
    local sku=$3
    
    echo "Checking $sku availability for $resource_type in $region..."
    
    case $resource_type in
        "app-service")
            az appservice list-locations --sku $sku --output table
            ;;
        "sql-database")
            az sql db list-editions --location $region --output table
            ;;
        "storage")
            az storage account check-name --name "test" --output table
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# วิธีใช้
check_sku_availability "eastus" "app-service" "P1V3"
```

### สคริปต์ประมาณต้นทุน

```powershell
# สคริปต์ PowerShell สำหรับการประเมินค่าใช้จ่าย
function Get-AzureCostEstimate {
    param(
        [string]$SubscriptionId,
        [string]$ResourceGroup,
        [hashtable]$Resources
    )
    
    $totalCost = 0
    
    foreach ($resource in $Resources.GetEnumerator()) {
        $resourceType = $resource.Key
        $sku = $resource.Value
        
        # ใช้ Azure Pricing API หรือเครื่องมือคำนวณราคา
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# การใช้งาน
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### การยืนยันประสิทธิภาพ

```yaml
# Load test configuration for SKU validation
test_configuration:
  duration: "10m"
  users:
    spawn_rate: 10
    max_users: 100
  
  scenarios:
    - name: "sku_performance_test"
      requests:
        - url: "https://myapp.azurewebsites.net/api/health"
          method: "GET"
          expect:
            - status_code: 200
            - response_time_ms: 500
        
        - url: "https://myapp.azurewebsites.net/api/data"
          method: "POST"
          expect:
            - status_code: 201
            - response_time_ms: 1000

  thresholds:
    http_req_duration:
      - "p(95)<500"  # 95% of requests under 500ms
      - "p(99)<1000" # 99% of requests under 1s
    http_req_failed:
      - "rate<0.1"   # Less than 10% failure rate
```

---

## สรุปแนวทางปฏิบัติที่ดีที่สุด

### สิ่งที่ควรทำ

1. **เริ่มจากขนาดเล็กแล้วปรับขึ้น** ตามการใช้งานจริง
2. **ใช้ SKU ต่างกันสำหรับสภาพแวดล้อมต่างๆ**
3. **ตรวจสอบประสิทธิภาพและต้นทุนอย่างต่อเนื่อง**
4. **ใช้การจองความจุสำหรับงานการผลิต**
5. **นำการปรับขนาดอัตโนมัติมาใช้อย่างเหมาะสม**
6. **ทดสอบประสิทธิภาพด้วยภาระงานที่สมจริง**
7. **วางแผนการเติบโตแต่หลีกเลี่ยงการจัดเตรียมเกินความจำเป็น**
8. **ใช้ชั้นฟรีสำหรับการพัฒนาเมื่อเป็นไปได้**

### สิ่งที่ไม่ควรทำ

1. **อย่าใช้ SKU สำหรับการผลิตในสภาพแวดล้อมการพัฒนา**
2. **อย่าเพิกเฉยต่อความพร้อมใช้งานของ SKU ตามภูมิภาค**
3. **อย่าลืมต้นทุนการโอนข้อมูล**
4. **อย่าเตรียมเกินความจำเป็นโดยไม่มีเหตุผล**
5. **อย่าเพิกเฉยต่อผลกระทบของการพึ่งพา**
6. **อย่าเซ็ตขีดจำกัดการปรับขนาดอัตโนมัติสูงเกินไป**
7. **อย่าลืมข้อกำหนดการปฏิบัติตามข้อบังคับ**
8. **อย่าตัดสินใจโดยดูแค่ราคาเพียงอย่างเดียว**

---

**เคล็ดลับ**: ใช้ Azure Cost Management และ Advisor เพื่อรับคำแนะนำส่วนบุคคลในการเพิ่มประสิทธิภาพการเลือก SKU ของคุณตามรูปแบบการใช้งานจริง

---

**การนำทาง**
- **บทก่อนหน้า**: [การวางแผนความจุ](capacity-planning.md)
- **บทถัดไป**: [การตรวจสอบก่อนการบิน](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิดชอบ:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลด้วยปัญญาประดิษฐ์ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อนได้ เอกสารต้นฉบับในภาษาต้นฉบับควรถูกนับเป็นแหล่งข้อมูลหลักและมีความน่าเชื่อถือ สำหรับข้อมูลที่มีความสำคัญ แนะนำให้ใช้การแปลโดยผู้เชี่ยวชาญด้านมนุษย์ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใดๆ ที่เกิดจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->