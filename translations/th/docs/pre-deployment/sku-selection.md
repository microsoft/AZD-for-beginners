<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T22:02:25+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "th"
}
-->
# คู่มือการเลือก SKU - การเลือกระดับบริการ Azure ที่เหมาะสม

## บทนำ

คู่มือฉบับสมบูรณ์นี้ช่วยให้คุณเลือก SKU (Stock Keeping Units) ของบริการ Azure ที่เหมาะสมที่สุดสำหรับสภาพแวดล้อม งาน และความต้องการที่แตกต่างกัน เรียนรู้วิธีวิเคราะห์ความต้องการด้านประสิทธิภาพ การพิจารณาด้านต้นทุน และความต้องการด้านการปรับขนาด เพื่อเลือกระดับบริการที่เหมาะสมที่สุดสำหรับการใช้งาน Azure Developer CLI ของคุณ

## เป้าหมายการเรียนรู้

เมื่อจบคู่มือนี้ คุณจะ:
- เข้าใจแนวคิด SKU ของ Azure รูปแบบการกำหนดราคา และความแตกต่างของฟีเจอร์
- เชี่ยวชาญกลยุทธ์การเลือก SKU ตามสภาพแวดล้อมสำหรับการพัฒนา การทดสอบ และการใช้งานจริง
- วิเคราะห์ความต้องการของงานและจับคู่กับระดับบริการที่เหมาะสม
- ใช้กลยุทธ์การเพิ่มประสิทธิภาพต้นทุนผ่านการเลือก SKU อย่างชาญฉลาด
- ใช้เทคนิคการทดสอบและตรวจสอบประสิทธิภาพสำหรับการเลือก SKU
- ตั้งค่าคำแนะนำ SKU อัตโนมัติและการตรวจสอบ

## ผลลัพธ์การเรียนรู้

เมื่อจบคู่มือนี้ คุณจะสามารถ:
- เลือก SKU ของบริการ Azure ที่เหมาะสมตามความต้องการและข้อจำกัดของงาน
- ออกแบบสถาปัตยกรรมหลายสภาพแวดล้อมที่คุ้มค่าด้วยการเลือกระดับที่เหมาะสม
- ใช้การวัดประสิทธิภาพและการตรวจสอบสำหรับการเลือก SKU
- สร้างเครื่องมืออัตโนมัติสำหรับคำแนะนำ SKU และการเพิ่มประสิทธิภาพต้นทุน
- วางแผนการย้าย SKU และกลยุทธ์การปรับขนาดสำหรับความต้องการที่เปลี่ยนแปลง
- ใช้หลักการของ Azure Well-Architected Framework ในการเลือกระดับบริการ

## สารบัญ

- [การทำความเข้าใจ SKU](../../../../docs/pre-deployment)
- [การเลือกตามสภาพแวดล้อม](../../../../docs/pre-deployment)
- [แนวทางเฉพาะบริการ](../../../../docs/pre-deployment)
- [กลยุทธ์การเพิ่มประสิทธิภาพต้นทุน](../../../../docs/pre-deployment)
- [ข้อพิจารณาด้านประสิทธิภาพ](../../../../docs/pre-deployment)
- [ตารางอ้างอิงด่วน](../../../../docs/pre-deployment)
- [เครื่องมือการตรวจสอบ](../../../../docs/pre-deployment)

---

## การทำความเข้าใจ SKU

### SKU คืออะไร?

SKU (Stock Keeping Units) แสดงถึงระดับบริการและระดับประสิทธิภาพที่แตกต่างกันสำหรับทรัพยากร Azure แต่ละ SKU มีข้อเสนอที่แตกต่างกัน:

- **ลักษณะประสิทธิภาพ** (CPU, หน่วยความจำ, ความเร็วในการประมวลผล)
- **ความพร้อมใช้งานของฟีเจอร์** (ตัวเลือกการปรับขนาด, ระดับ SLA)
- **รูปแบบการกำหนดราคา** (ตามการใช้งาน, ความจุที่จองไว้)
- **ความพร้อมใช้งานในภูมิภาค** (ไม่ใช่ทุก SKU ที่มีในทุกภูมิภาค)

### ปัจจัยสำคัญในการเลือก SKU

1. **ความต้องการของงาน**
   - รูปแบบการรับส่งข้อมูล/โหลดที่คาดการณ์ไว้
   - ความต้องการด้านประสิทธิภาพ (CPU, หน่วยความจำ, I/O)
   - ความต้องการพื้นที่จัดเก็บและรูปแบบการเข้าถึง

2. **ประเภทสภาพแวดล้อม**
   - การพัฒนา/การทดสอบ vs. การใช้งานจริง
   - ความต้องการด้านความพร้อมใช้งาน
   - ความต้องการด้านความปลอดภัยและการปฏิบัติตามข้อกำหนด

3. **ข้อจำกัดด้านงบประมาณ**
   - ต้นทุนเริ่มต้น vs. ต้นทุนการดำเนินงาน
   - ส่วนลดสำหรับความจุที่จองไว้
   - ผลกระทบด้านต้นทุนจากการปรับขนาดอัตโนมัติ

4. **การคาดการณ์การเติบโต**
   - ความต้องการด้านการปรับขนาด
   - ความต้องการฟีเจอร์ในอนาคต
   - ความซับซ้อนในการย้ายข้อมูล

---

## การเลือกตามสภาพแวดล้อม

### สภาพแวดล้อมการพัฒนา

**ลำดับความสำคัญ**: การเพิ่มประสิทธิภาพต้นทุน ฟังก์ชันพื้นฐาน การตั้งค่าและยกเลิกการตั้งค่าง่าย

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
- **App Service**: F1 (ฟรี) หรือ B1 (พื้นฐาน) สำหรับการทดสอบง่ายๆ
- **ฐานข้อมูล**: ระดับพื้นฐานที่มีทรัพยากรน้อยที่สุด
- **พื้นที่จัดเก็บ**: มาตรฐานที่มีการสำรองข้อมูลในพื้นที่เท่านั้น
- **การประมวลผล**: ทรัพยากรที่ใช้ร่วมกัน
- **เครือข่าย**: การตั้งค่าพื้นฐาน

### สภาพแวดล้อมการทดสอบ/การตรวจสอบ

**ลำดับความสำคัญ**: การตั้งค่าที่คล้ายกับการใช้งานจริง ความสมดุลด้านต้นทุน ความสามารถในการทดสอบประสิทธิภาพ

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
- **ประสิทธิภาพ**: 70-80% ของความจุการใช้งานจริง
- **ฟีเจอร์**: เปิดใช้งานฟีเจอร์การใช้งานจริงส่วนใหญ่
- **การสำรองข้อมูล**: การสำรองข้อมูลในบางภูมิภาค
- **การปรับขนาด**: การปรับขนาดอัตโนมัติแบบจำกัดสำหรับการทดสอบ
- **การตรวจสอบ**: ระบบตรวจสอบเต็มรูปแบบ

### สภาพแวดล้อมการใช้งานจริง

**ลำดับความสำคัญ**: ประสิทธิภาพ ความพร้อมใช้งาน ความปลอดภัย การปฏิบัติตามข้อกำหนด การปรับขนาด

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
- **ประสิทธิภาพ**: ทรัพยากรเฉพาะ ความเร็วในการประมวลผลสูง
- **ความปลอดภัย**: ฟีเจอร์ความปลอดภัยระดับพรีเมียม
- **การปรับขนาด**: ความสามารถในการปรับขนาดอัตโนมัติเต็มรูปแบบ
- **การตรวจสอบ**: การสังเกตการณ์ที่ครอบคลุม

---

## แนวทางเฉพาะบริการ

### Azure App Service

#### ตารางการตัดสินใจ SKU

| กรณีการใช้งาน | SKU ที่แนะนำ | เหตุผล |
|----------------|--------------|---------|
| การพัฒนา/การทดสอบ | F1 (ฟรี) หรือ B1 (พื้นฐาน) | คุ้มค่า เพียงพอสำหรับการทดสอบ |
| แอปขนาดเล็กสำหรับการใช้งานจริง | S1 (มาตรฐาน) | โดเมนที่กำหนดเอง, SSL, การปรับขนาดอัตโนมัติ |
| แอปขนาดกลางสำหรับการใช้งานจริง | P1V3 (พรีเมียม V3) | ประสิทธิภาพที่ดีขึ้น, ฟีเจอร์มากขึ้น |
| แอปที่มีการรับส่งข้อมูลสูง | P2V3 หรือ P3V3 | ทรัพยากรเฉพาะ, ประสิทธิภาพสูง |
| แอปที่มีความสำคัญสูง | I1V2 (แยก V2) | การแยกเครือข่าย, ฮาร์ดแวร์เฉพาะ |

#### ตัวอย่างการตั้งค่า

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

**การใช้งานจริง**
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

1. **ตาม DTU (Database Transaction Units)**
   - **พื้นฐาน**: 5 DTU - การพัฒนา/การทดสอบ
   - **มาตรฐาน**: S0-S12 (10-3000 DTU) - วัตถุประสงค์ทั่วไป
   - **พรีเมียม**: P1-P15 (125-4000 DTU) - ประสิทธิภาพสูง

2. **ตาม vCore** (แนะนำสำหรับการใช้งานจริง)
   - **วัตถุประสงค์ทั่วไป**: การประมวลผลและพื้นที่จัดเก็บที่สมดุล
   - **ธุรกิจที่สำคัญ**: ความหน่วงต่ำ, IOPS สูง
   - **Hyperscale**: พื้นที่จัดเก็บที่ปรับขนาดได้สูง (สูงสุด 100TB)

#### ตัวอย่างการตั้งค่า

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

1. **ตามการใช้งาน**
   - การกำหนดราคาตามการใช้งาน
   - เหมาะสำหรับการพัฒนาและงานที่มีโหลดแปรผัน
   - โครงสร้างพื้นฐานที่ใช้ร่วมกัน

2. **แบบเฉพาะ (Workload Profiles)**
   - ทรัพยากรการประมวลผลเฉพาะ
   - ประสิทธิภาพที่คาดการณ์ได้
   - เหมาะสำหรับงานการใช้งานจริง

#### ตัวอย่างการตั้งค่า

**การพัฒนา (ตามการใช้งาน)**
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

**การใช้งานจริง (แบบเฉพาะ)**
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

#### รูปแบบการจัดการ Throughput

1. **Throughput ที่จัดเตรียมแบบ Manual**
   - ประสิทธิภาพที่คาดการณ์ได้
   - ส่วนลดสำหรับความจุที่จองไว้
   - เหมาะสำหรับงานที่มีโหลดคงที่

2. **Throughput ที่ปรับขนาดอัตโนมัติ**
   - การปรับขนาดอัตโนมัติตามการใช้งาน
   - จ่ายตามการใช้งาน (มีขั้นต่ำ)
   - เหมาะสำหรับงานที่มีโหลดแปรผัน

3. **Serverless**
   - จ่ายตามคำขอ
   - ไม่มี Throughput ที่จัดเตรียมไว้
   - เหมาะสำหรับการพัฒนาและงานที่ไม่ต่อเนื่อง

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

#### ประเภทบัญชีพื้นที่จัดเก็บ

1. **Standard_LRS** - การพัฒนา, ข้อมูลที่ไม่สำคัญ
2. **Standard_GRS** - การใช้งานจริง, ต้องการการสำรองข้อมูลในภูมิภาค
3. **Premium_LRS** - แอปพลิเคชันที่มีประสิทธิภาพสูง
4. **Premium_ZRS** - ความพร้อมใช้งานสูงพร้อมการสำรองข้อมูลในโซน

#### ระดับประสิทธิภาพ

- **มาตรฐาน**: วัตถุประสงค์ทั่วไป, คุ้มค่า
- **พรีเมียม**: ประสิทธิภาพสูง, ความหน่วงต่ำ

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

### 1. ความจุที่จองไว้

จองทรัพยากรเป็นเวลา 1-3 ปีเพื่อรับส่วนลดสำคัญ:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. การปรับขนาดให้เหมาะสม

เริ่มต้นด้วย SKU ขนาดเล็กและปรับขนาดขึ้นตามการใช้งานจริง:

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

### 3. การตั้งค่าการปรับขนาดอัตโนมัติ

ใช้การปรับขนาดอัจฉริยะเพื่อเพิ่มประสิทธิภาพต้นทุน:

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

### 4. การปรับขนาดตามเวลา

ปรับขนาดลงในช่วงเวลาที่ไม่ได้ใช้งาน:

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

## ข้อพิจารณาด้านประสิทธิภาพ

### ความต้องการประสิทธิภาพพื้นฐาน

กำหนดความต้องการด้านประสิทธิภาพที่ชัดเจนก่อนการเลือก SKU:

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
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### การตรวจสอบและการเพิ่มประสิทธิภาพ

ตั้งค่าการตรวจสอบที่ครอบคลุม:

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

### ตารางอ้างอิง SKU ของ App Service

| SKU | ระดับ | vCPU | RAM | พื้นที่จัดเก็บ | ช่วงราคา | กรณีการใช้งาน |
|-----|-------|------|-----|----------------|----------|----------------|
| F1 | ฟรี | ใช้ร่วมกัน | 1GB | 1GB | ฟรี | การพัฒนา |
| B1 | พื้นฐาน | 1 | 1.75GB | 10GB | $ | แอปขนาดเล็ก |
| S1 | มาตรฐาน | 1 | 1.75GB | 50GB | $$ | การใช้งานจริง |
| P1V3 | พรีเมียม V3 | 2 | 8GB | 250GB | $$$ | ประสิทธิภาพสูง |
| I1V2 | แยก V2 | 2 | 8GB | 1TB | $$$$ | องค์กร |

### ตารางอ้างอิง SKU ของ SQL Database

| SKU | ระดับ | DTU/vCore | พื้นที่จัดเก็บ | ช่วงราคา | กรณีการใช้งาน |
|-----|-------|-----------|----------------|----------|----------------|
| พื้นฐาน | พื้นฐาน | 5 DTU | 2GB | $ | การพัฒนา |
| S2 | มาตรฐาน | 50 DTU | 250GB | $$ | การใช้งานจริงขนาดเล็ก |
| P2 | พรีเมียม | 250 DTU | 1TB | $$$ | ประสิทธิภาพสูง |
| GP_Gen5_4 | วัตถุประสงค์ทั่วไป | 4 vCore | 4TB | $$$ | สมดุล |
| BC_Gen5_8 | ธุรกิจที่สำคัญ | 8 vCore | 4TB | $$$$ | ความสำคัญสูง |

### ตารางอ้างอิง SKU ของ Container Apps

| รูปแบบ | การกำหนดราคา | CPU/หน่วยความจำ | กรณีการใช้งาน |
|--------|--------------|------------------|----------------|
| ตามการใช้งาน | จ่ายตามการใช้งาน | 0.25-2 vCPU | การพัฒนา, โหลดแปรผัน |
| เฉพาะ D4 | จองไว้ | 4 vCPU, 16GB | การใช้งานจริง |
| เฉพาะ D8 | จองไว้ | 8 vCPU, 32GB | ประสิทธิภาพสูง |

---

## เครื่องมือการตรวจสอบ

### ตัวตรวจสอบความพร้อมใช้งาน SKU

```bash
#!/bin/bash
# Check SKU availability in target region

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

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### สคริปต์ประมาณการต้นทุน

```powershell
# PowerShell script for cost estimation
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
        
        # Use Azure Pricing API or calculator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Usage
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### การตรวจสอบประสิทธิภาพ

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

1. **เริ่มต้นเล็กและปรับขนาดขึ้น** ตามการใช้งานจริง
2. **ใช้ SKU ต่างกันสำหรับสภาพแวดล้อมต่างๆ**
3. **ตรวจสอบประสิทธิภาพและต้นทุนอย่างต่อเนื่อง**
4. **ใช้ความจุที่จองไว้สำหรับงานการใช้งานจริง**
5. **ตั้งค่าการปรับขนาดอัตโนมัติในกรณีที่เหมาะสม**
6. **ทดสอบประสิทธิภาพด้วยโหลดที่สมจริง**
7. **วางแผนการเติบโตแต่หลีกเลี่ยงการจัดสรรเกิน**
8. **ใช้ระดับฟรีสำหรับการพัฒนาเมื่อเป็นไปได้**

### สิ่งที่ไม่ควรทำ

1. **อย่าใช้ SKU การใช้งานจริงสำหรับการพัฒนา**
2. **อย่ามองข้ามความพร้อมใช้งาน SKU ในภูมิภาค**
3. **อย่าลืมต้นทุนการถ่ายโอนข้อมูล**
4. **อย่าจัดสรรเกินโดยไม่มีเหตุผล**
5. **อย่ามองข้ามผลกระทบของการพึ่งพา**
6. **อย่าตั้งค่าขีดจำกัดการปรับขนาดอัตโนมัติสูงเกินไป**
7. **อย่าลืมข้อกำหนดด้านการปฏิบัติตามข้อกำหนด**
8. **อย่าตัดสินใจโดยพิจารณาจากราคาเพียงอย่างเดียว**

---

**เคล็ดลับ**: ใช้ Azure Cost Management และ Advisor เพื่อรับคำแนะนำเฉพาะบุคคลสำหรับการเพิ่มประสิทธิภาพการเลือก SKU ของคุณตามรูปแบบการใช้งานจริง

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [การวางแผนความจุ](capacity-planning.md)
- **บทเรียนถัดไป**: [การตรวจสอบก่อนเริ่มใช้งาน](preflight-checks.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้