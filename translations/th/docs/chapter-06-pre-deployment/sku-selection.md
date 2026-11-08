# คู่มือการเลือก SKU - การเลือกระดับบริการ Azure ที่เหมาะสม

**การนำทางบทเรียน:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 6 - การตรวจสอบและวางแผนก่อนการปรับใช้งาน
- **⬅️ ก่อนหน้า**: [การวางแผนความจุ](capacity-planning.md)
- **➡️ ถัดไป**: [การตรวจสอบก่อนบิน](preflight-checks.md)
- **🚀 บทถัดไป**: [บทที่ 7: การแก้ไขปัญหา](../chapter-07-troubleshooting/common-issues.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้ช่วยให้คุณเลือก SKU (Stock Keeping Units) บริการ Azure ที่เหมาะสมสำหรับสภาพแวดล้อม ปริมาณงาน และความต้องการที่แตกต่างกัน เรียนรู้การวิเคราะห์ความต้องการประสิทธิภาพ การพิจารณาค่าใช้จ่าย และความต้องการขยายตัว เพื่อเลือกระดับบริการที่เหมาะสมที่สุดสำหรับการปรับใช้ Azure Developer CLI ของคุณ

## วัตถุประสงค์การเรียนรู้

เมื่อทำคู่มือนี้จบคุณจะ:
- เข้าใจแนวคิด SKU ของ Azure รูปแบบการตั้งราคา และความแตกต่างของฟีเจอร์
- เชี่ยวชาญกลยุทธ์การเลือก SKU ตามสภาพแวดล้อม เช่น การพัฒนา การทดสอบ และการใช้งานจริง
- วิเคราะห์ความต้องการของปริมาณงานและจับคู่กับระดับบริการที่เหมาะสม
- ใช้กลยุทธ์การเพิ่มประสิทธิภาพต้นทุนผ่านการเลือก SKU อย่างชาญฉลาด
- ใช้เทคนิคการทดสอบและตรวจสอบประสิทธิภาพสำหรับการเลือก SKU
- กำหนดค่าแนะนำ SKU แบบอัตโนมัติและการตรวจสอบ

## ผลลัพธ์การเรียนรู้

เมื่อสำเร็จคุณจะสามารถ:
- เลือก SKU บริการ Azure ที่เหมาะสมตามความต้องการและข้อจำกัดของปริมาณงาน
- ออกแบบสถาปัตยกรรมหลายสภาพแวดล้อมที่คุ้มค่าด้วยการเลือกระดับที่เหมาะสม
- ดำเนินการวัดและตรวจสอบประสิทธิภาพสำหรับการเลือก SKU
- สร้างเครื่องมืออัตโนมัติสำหรับการแนะนำ SKU และการเพิ่มประสิทธิภาพค่าใช้จ่าย
- วางแผนการย้ายและกลยุทธ์การปรับขนาด SKU สำหรับความต้องการที่เปลี่ยนไป
- ใช้หลักการของ Azure Well-Architected Framework ในการเลือกระดับบริการ

## สารบัญ

- [ความเข้าใจเกี่ยวกับ SKUs](#understanding-skus)
- [การเลือกตามสภาพแวดล้อม](#environment-based-selection)
- [แนวทางเฉพาะบริการ](#service-specific-guidelines)
- [กลยุทธ์เพิ่มประสิทธิภาพต้นทุน](#cost-optimization-strategies)
- [ข้อพิจารณาด้านประสิทธิภาพ](#performance-considerations)
- [ตารางอ้างอิงด่วน](#quick-reference-tables)
- [เครื่องมือสำหรับการตรวจสอบ](#validation-tools)

---

## ความเข้าใจเกี่ยวกับ SKUs

> **ตัวอย่างขอบเขต:** แผนผัง YAML SKU และการตั้งค่าประสิทธิภาพด้านล่างเป็นบันทึกการออกแบบ ไม่ใช่ `azure.yaml` สคีมา หรือการตั้งค่าเครื่องมือโหลด บล็อก Bicep เป็นตัวเลือก/ชิ้นส่วน: ประกาศพารามิเตอร์และทรัพยากรแม่ ใช้ชื่อสัญลักษณ์ที่ไม่ซ้ำกันเมื่อผสมผสาน และเชื่อมต่อโมดูลกับโครงการทำงาน ราคาจำกัด และความพร้อมใช้งานตามภูมิภาค/SKU ต้องตรวจสอบก่อนการปรับใช้ในระบบสมัครสมาชิกของคุณ

### SKUs คืออะไร?

SKUs (Stock Keeping Units) แสดงถึงระดับบริการและระดับประสิทธิภาพที่แตกต่างกันสำหรับทรัพยากร Azure แต่ละ SKU มี:

- **ลักษณะประสิทธิภาพ** (CPU, หน่วยความจำ, ปริมาณงาน)
- **ความพร้อมของฟีเจอร์** (ตัวเลือกการสเกล, ระดับ SLA)
- **รูปแบบการตั้งราคา** (บนพื้นฐานการใช้งาน, ความจุที่จอง)
- **ความพร้อมในภูมิภาค** (ไม่ใช่ทุก SKU ที่ใช้งานได้ในทุกภูมิภาค)

### ปัจจัยสำคัญในการเลือก SKU

1. **ความต้องการปริมาณงาน**
   - รูปแบบการจราจร/โหลดที่คาดหวัง
   - ความต้องการประสิทธิภาพ (CPU, หน่วยความจำ, I/O)
   - ความต้องการพื้นที่เก็บข้อมูลและรูปแบบการเข้าถึง

2. **ประเภทสภาพแวดล้อม**
   - การพัฒนา/ทดสอบ เทียบกับการใช้งานจริง
   - ความต้องการความพร้อมใช้งาน
   - ความต้องการความปลอดภัยและกำกับดูแล

3. **ข้อจำกัดงบประมาณ**
   - ต้นทุนเริ่มต้นเทียบกับต้นทุนการดำเนินงาน
   - ส่วนลดจากความจุที่จอง
   - ผลกระทบของค่าใช้จ่ายการปรับสเกลอัตโนมัติ

4. **การคาดการณ์การเจริญเติบโต**
   - ความต้องการการขยายตัว
   - ความต้องการฟีเจอร์ในอนาคต
   - ความซับซ้อนของการโยกย้าย

---

## การเลือกตามสภาพแวดล้อม

### สภาพแวดล้อมการพัฒนา

**ลำดับความสำคัญ**: การเพิ่มประสิทธิภาพค่าใช้จ่าย ฟังก์ชันพื้นฐาน การจัดเตรียมและยกเลิกอย่างง่าย

#### SKUs แนะนำ
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Standard"      # Free tier is an account opt-in, not a SKU
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "workspace-based" # Consumption billing; no Free SKU
```

#### ลักษณะ
- **App Service**: F1 (ฟรี) หรือ B1 (พื้นฐาน) สำหรับการทดสอบง่ายๆ
- **ฐานข้อมูล**: ระดับพื้นฐานพร้อมทรัพยากรขั้นต่ำ
- **การจัดเก็บ**: มาตรฐานที่มีความซ้ำซ้อนภายในท้องถิ่นเท่านั้น
- **คอมพิวต์**: ทรัพยากรร่วมได้
- **เครือข่าย**: การตั้งค่าพื้นฐาน

### สภาพแวดล้อมทดสอบ/เตรียมพร้อม

**ลำดับความสำคัญ**: การตั้งค่าคล้ายกับการใช้งานจริง การสมดุลค่าใช้จ่าย ความสามารถในการทดสอบประสิทธิภาพ

#### SKUs แนะนำ
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
- **ความซ้ำซ้อน**: มีความซ้ำซ้อนทางภูมิศาสตร์บางส่วน
- **การปรับขนาด**: การปรับขนาดอัตโนมัติจำกัดสำหรับการทดสอบ
- **การตรวจสอบ**: สแต็กการตรวจสอบครบถ้วน

### สภาพแวดล้อมการผลิต

**ลำดับความสำคัญ**: ประสิทธิภาพ ความพร้อมใช้งาน ความปลอดภัย การปฏิบัติตามข้อกำหนด การขยายตัว

#### SKUs แนะนำ
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Standard_GRS"    # Geo-redundant; Premium_GRS is not a storage SKU
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### ลักษณะ
- **ความพร้อมใช้งานสูง**: ความต้องการ SLA 99.9%+
- **ประสิทธิภาพ**: ทรัพยากรเฉพาะ เจาะจง ทรัพยากรสูง
- **ความปลอดภัย**: ฟีเจอร์ความปลอดภัยระดับพรีเมียม
- **การปรับขนาด**: ความสามารถปรับขนาดอัตโนมัติเต็มรูปแบบ
- **การตรวจสอบ**: การสังเกตการณ์อย่างครบถ้วน

---

## แนวทางเฉพาะบริการ

### Azure App Service

#### ตารางการตัดสินใจ SKU

| กรณีใช้งาน | SKU แนะนำ | เหตุผล |
|----------|----------------|-----------|
| การพัฒนา/ทดสอบ | F1 (ฟรี) หรือ B1 (พื้นฐาน) | คุ้มค่าเพียงพอสำหรับการทดสอบ |
| แอปผลิตขนาดเล็ก | S1 (มาตรฐาน) | โดเมนกำหนดเอง, SSL, ปรับขนาดอัตโนมัติ |
| แอปผลิตขนาดกลาง | P1V3 (พรีเมียม V3) | ประสิทธิภาพดีกว่า, ฟีเจอร์มากขึ้น |
| แอปที่มีทราฟฟิกสูง | P2V3 หรือ P3V3 | ทรัพยากรเฉพาะ, ประสิทธิภาพสูง |
| แอปสำคัญระดับภารกิจ | I1V2 (แยก V2) | การแยกเครือข่าย, ฮาร์ดแวร์เฉพาะ |

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
   - **พื้นฐาน**: 5 DTU - การพัฒนา/ทดสอบ
   - **มาตรฐาน**: S0-S12 (10-3000 DTU) - การใช้งานทั่วไป
   - **พรีเมียม**: P1-P15 (125-4000 DTU) - งานที่ต้องการประสิทธิภาพสูง

2. **แบบ vCore** (แนะนำสำหรับการผลิต)
   - **การใช้งานทั่วไป**: สมดุลระหว่างคอมพิวต์และพื้นที่เก็บข้อมูล
   - **ธุรกิจสำคัญ**: ความหน่วงต่ำ, IOPS สูง
   - **ไฮเปอร์สเกล**: พื้นที่เก็บข้อมูลที่ปรับขนาดสูง; ตรวจสอบขีดจำกัดขนาดปัจจุบันและการสนับสนุนภูมิภาค

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

1. **แบบการใช้งานตามการบริโภค**
   - การตั้งราคาจ่ายตามการใช้
   - เหมาะสำหรับการพัฒนาและปริมาณงานที่เปลี่ยนแปลงได้
   - โครงสร้างพื้นฐานที่ใช้ร่วมกัน

2. **แบบเฉพาะ (โปรไฟล์ปริมาณงาน)**
   - ทรัพยากรคอมพิวต์เฉพาะ
   - ประสิทธิภาพคาดการณ์ได้
   - เหมาะสมกับปริมาณงานการผลิต

#### ตัวอย่างการตั้งค่า

**การพัฒนา (แบบการใช้งานตามการบริโภค)**
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
        targetPort: 80 // nginx listens on 80 by default
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

**การผลิต (แบบเฉพาะ)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 3
      maximumCount: 10
    }]
  }
}
```

การมีความซ้ำซ้อนระดับโซนยังต้องการโครงสร้างพื้นฐานในภูมิภาคที่รองรับและการตั้งค่า VNet/subnet ที่เหมาะสม ซึ่งถูกตัดไว้ที่นี่ ตัวอย่างนี้ประมาณการสามโหนดเฉพาะ; กำหนดค่าระดับแอปอย่างน้อยสองชุดสำหรับการกระจายข้ามโซนและปรับขนาดทั้งรีพลิกาและโหนดสำหรับกรณีล้มเหลวในโซน ดู [คำแนะนำความน่าเชื่อถือของ Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps) การวางแอปบนโปรไฟล์นี้ตั้งค่าเพียง `workloadProfileName: 'production-profile'`; การสร้างโปรไฟล์เพียงอย่างเดียวไม่ได้ย้ายแอปไปยังโปรไฟล์นี้

### Azure Cosmos DB

#### แบบจำลองความสามารถในการประมวลผล (Throughput Models)

1. **การจัดเตรียมแบบแมนนวล (Manual Provisioned Throughput)**
   - ประสิทธิภาพที่คาดการณ์ได้
   - ส่วนลดความจุที่จอง
   - เหมาะสำหรับปริมาณงานคงที่

2. **การจัดเตรียมด้วยการปรับสเกลอัตโนมัติ (Autoscale Provisioned Throughput)**
   - การปรับขนาดอัตโนมัติตามการใช้งาน
   - จ่ายตามการใช้งานจริง (มีขั้นต่ำ)
   - เหมาะสำหรับปริมาณงานที่เปลี่ยนแปลง

3. **เซิร์ฟเลส (Serverless)**
   - จ่ายตามคำร้องขอ
   - ไม่มีความสามารถที่จัดเตรียมไว้ล่วงหน้า
   - เหมาะสำหรับการพัฒนาและปริมาณงานเป็นช่วง

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

### บัญชีเก็บข้อมูล Azure Storage Account

#### ประเภทบัญชีเก็บข้อมูล

1. **Standard_LRS** - การพัฒนา ข้อมูลที่ไม่สำคัญ
2. **Standard_GRS** - การผลิต ต้องการความซ้ำซ้อนเชิงภูมิศาสตร์
3. **Premium_LRS** - แอปที่ต้องการประสิทธิภาพสูง
4. **Premium_ZRS** - ความพร้อมใช้งานสูงพร้อมความซ้ำซ้อนระดับโซน

#### ระดับประสิทธิภาพ

- **มาตรฐาน**: การใช้งานทั่วไป คุ้มค่า
- **พรีเมียม**: ประสิทธิภาพสูง สถานการณ์หน่วงต่ำ

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

## กลยุทธ์การเพิ่มประสิทธิภาพค่าใช้จ่าย

### 1. ความจุที่จองล่วงหน้า

สำรองทรัพยากรล่วงหน้า 1-3 ปีเพื่อรับส่วนลดมาก:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

ข้อเสนอเกี่ยวกับการจองและประเภททรัพยากรที่มีสิทธิ์แตกต่างกัน; ตรวจสอบแคตตาล็อกและเงื่อนไขการซื้อแทนที่จะสมมติว่าทุกบริการ/SKU รองรับการจอง

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

ใช้การปรับขนาดอย่างชาญฉลาดเพื่อเพิ่มประสิทธิภาพค่าใช้จ่าย:

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
            statistic: 'Average'
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
            statistic: 'Average'
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

ลดขนาดในช่วงเวลาที่ไม่ได้ใช้งาน:

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

กำหนดความต้องการประสิทธิภาพให้ชัดเจนก่อนการเลือก SKU:

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

### การทดสอบภาระงาน

ทดสอบ SKU ต่างๆ เพื่อยืนยันประสิทธิภาพ:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### การตรวจสอบและเพิ่มประสิทธิภาพ

ตั้งค่าการตรวจสอบอย่างครบถ้วน:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    IngestionMode: 'LogAnalytics'
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

### ตารางอ้างอิง SKU App Service ด่วน

| SKU | ระดับ | vCPU | RAM | พื้นที่เก็บข้อมูล | ช่วงราคา | กรณีใช้งาน |
|-----|------|------|-----|---------|-------------|----------|
| F1 | ฟรี | ใช้ร่วม | 1GB | 1GB | ฟรี | การพัฒนา |
| B1 | พื้นฐาน | 1 | 1.75GB | 10GB | $ | แอปขนาดเล็ก |
| S1 | มาตรฐาน | 1 | 1.75GB | 50GB | $$ | การผลิต |
| P1V3 | พรีเมียม V3 | 2 | 8GB | 250GB | $$$ | ประสิทธิภาพสูง |
| I1V2 | แยก V2 | 2 | 8GB | 1TB | $$$$ | องค์กรใหญ่ |

### ตารางอ้างอิง SKU SQL Database ด่วน

| SKU | ระดับ | DTU/vCore | พื้นที่เก็บข้อมูล | ช่วงราคา | กรณีใช้งาน |
|-----|------|-----------|---------|-------------|----------|
| Basic | พื้นฐาน | 5 DTU | 2GB | $ | การพัฒนา |
| S2 | มาตรฐาน | 50 DTU | 250GB | $$ | การผลิตขนาดเล็ก |
| P2 | พรีเมียม | 250 DTU | 1TB | $$$ | ประสิทธิภาพสูง |
| GP_Gen5_4 | การใช้งานทั่วไป | 4 vCore | 4TB | $$$ | สมดุล |
| BC_Gen5_8 | ธุรกิจสำคัญ | 8 vCore | 4TB | $$$$ | สำคัญระดับภารกิจ |

### ตารางอ้างอิง SKU Container Apps ด่วน

| แบบ | การตั้งราคา | CPU/หน่วยความจำ | กรณีใช้งาน |
|-------|---------|------------|----------|
| การบริโภค | จ่ายตามการใช้ | การผสมผสาน CPU/หน่วยความจำที่รองรับขึ้นอยู่กับสภาพแวดล้อม/โปรไฟล์ | การพัฒนาหรือผลิต, โหลดเปลี่ยนแปลง |
| Dedicated D4 | คิดค่าบริการโหนดเฉพาะ | 4 vCPU, 16GiB ต่อโหนด | โหลดต่อเนื่อง/ความต้องการแยกตัว |
| Dedicated D8 | คิดค่าบริการโหนดเฉพาะ | 8 vCPU, 32GiB ต่อโหนด | โหลดต่อเนื่องสูงกว่า |

---

## เครื่องมือสำหรับการตรวจสอบ

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
            # Name availability is not SKU availability.
            az storage sku list --query "[?name=='$sku'].{name:name,locations:locations,restrictions:restrictions}" --output json
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### สคริปต์ประเมินค่าใช้จ่าย

**โค้ดลวงเท่านั้น:** `Get-ResourceCost` ด้านล่างเป็นฟังก์ชันเฉพาะโครงการที่คุณต้องดำเนินการโดยใช้ราคาปัจจุบันตามภูมิภาค/สัญญาและสมมติฐานการใช้งาน ไม่ใช่ PowerShell หรือคำสั่ง Azure cmdlet

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

YAML ด้านล่างเป็นโครงร่างความต้องการ, **ไม่ใช่** สคีมาป้อนข้อมูลของ Azure Load Testing, JMeter, Locust หรือ k6 แปลงเป็นการตั้งค่าจริงของเครื่องมือที่คุณเลือกก่อนใช้คำสั่งทดสอบโหลดด้านบน

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

## สรุปแนวปฏิบัติที่ดีที่สุด

### สิ่งที่ควรทำ

1. **เริ่มต้นเล็กและปรับขนาดขึ้น** ตามการใช้งานจริง
2. **ใช้ SKU ต่างกันสำหรับสภาพแวดล้อมต่างๆ**
3. **ตรวจสอบประสิทธิภาพและค่าใช้จ่ายอย่างต่อเนื่อง**
4. **ใช้ความจุที่จองสำหรับงานผลิต**
5. **ใช้การปรับขนาดอัตโนมัติเมื่อเหมาะสม**
6. **ทดสอบประสิทธิภาพด้วยภาระงานที่สมจริง**
7. **วางแผนการเติบโตแต่หลีกเลี่ยงการจัดสรรเกินความจำเป็น**
8. **ใช้ระดับฟรีสำหรับการพัฒนาเมื่อเป็นไปได้**

### สิ่งที่ไม่ควรทำ

1. **อย่าใช้ SKU สำหรับการผลิตในการพัฒนา**
2. **อย่ามองข้ามความพร้อมใช้งาน SKU ตามภูมิภาค**
3. **อย่าลืมต้นทุนการถ่ายโอนข้อมูล**
4. **อย่าจัดสรรเกินความจำเป็นโดยไม่มีเหตุผล**
5. **อย่าเพิกเฉยผลกระทบของการพึ่งพา**
6. **อย่ากำหนดขีดจำกัดการปรับสเกลอัตโนมัติสูงเกินไป**
7. **อย่าลืมข้อกำหนดการปฏิบัติตามข้อกำหนด**
8. **อย่าตัดสินใจโดยพิจารณาจากราคาเพียงอย่างเดียว**

---

**เคล็ดลับมือโปร**: ใช้ Azure Cost Management และ Advisor เพื่อรับคำแนะนำส่วนบุคคลสำหรับการเพิ่มประสิทธิภาพการเลือก SKU ตามรูปแบบการใช้งานจริงของคุณ

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [การวางแผนความจุ](capacity-planning.md)
- **บทเรียนถัดไป**: [การตรวจสอบก่อนบิน](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->