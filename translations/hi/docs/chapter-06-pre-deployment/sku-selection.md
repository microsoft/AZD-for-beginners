# SKU चयन गाइड - सही Azure सर्विस टियर कैसे चुनें

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 6 - प्री-डिप्लॉयमेंट वैलिडेशन और योजना
- **⬅️ पिछला**: [Capacity Planning](capacity-planning.md)
- **➡️ अगला**: [Pre-flight Checks](preflight-checks.md)
- **🚀 अगला अध्याय**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## परिचय

यह व्यापक गाइड विभिन्न पर्यावरणों, वर्कलोड और आवश्यकताओं के लिए अनुकूल Azure सर्विस SKUs (Stock Keeping Units) चुनने में मदद करता है। प्रदर्शन आवश्यकताओं, लागत विचारों और स्केलेबिलिटी आवश्यकताओं का विश्लेषण करना सीखें ताकि आप अपने Azure Developer CLI डिप्लॉयमेंट्स के लिए सबसे उपयुक्त सर्विस टियर चुन सकें।

## सीखने के लक्ष्य

इस गाइड को पूरा करके, आप:
- Azure SKU अवधारणाओं, प्राइसिंग मॉडल और फीचर अंतर को समझेंगे
- विकास, स्टेजिंग और प्रोडक्शन के लिए वातावरण-विशिष्ट SKU चयन रणनीतियों में निपुण होंगे
- वर्कलोड आवश्यकताओं का विश्लेषण करेंगे और उन्हें उपयुक्त सर्विस टियर से मेल कराएँगे
- बुद्धिमान SKU चयन के माध्यम से लागत अनुकूलन रणनीतियाँ लागू करेंगे
- SKU विकल्पों के लिए प्रदर्शन परीक्षण और सत्यापन तकनीकों को लागू करेंगे
- ऑटोमेटेड SKU सिफारिशों और मॉनिटरिंग को कॉन्फ़िगर करेंगे

## सीखने के परिणाम

पूरा करने पर, आप सक्षम होंगे:
- वर्कलोड आवश्यकताओं और प्रतिबंधों के आधार पर उपयुक्त Azure सर्विस SKUs का चयन करना
- उपयुक्त टियर चयन के साथ लागत-प्रभावी मल्टी-एन्वायरनमेंट आर्किटेक्चर डिज़ाइन करना
- SKU विकल्पों के लिए प्रदर्शन बेंचमार्किंग और सत्यापन लागू करना
- SKU अनुशंसा और लागत अनुकूलन के लिए ऑटोमेटेड उपकरण बनाना
- बदलती आवश्यकताओं के लिए SKU माइग्रेशन और स्केलिंग रणनीतियों की योजना बनाना
- सर्विस टियर चयन में Azure Well-Architected Framework सिद्धांतों को लागू करना

## सामग्री तालिका

- [SKUs को समझना](../../../../docs/chapter-06-pre-deployment)
- [पर्यावरण-आधारित चयन](../../../../docs/chapter-06-pre-deployment)
- [सर्विस-विशिष्ट मार्गदर्शन](../../../../docs/chapter-06-pre-deployment)
- [लागत अनुकूलन रणनीतियाँ](../../../../docs/chapter-06-pre-deployment)
- [प्रदर्शन पर विचार](../../../../docs/chapter-06-pre-deployment)
- [त्वरित संदर्भ तालिकाएँ](../../../../docs/chapter-06-pre-deployment)
- [वैलिडेशन टूल्स](../../../../docs/chapter-06-pre-deployment)

---

## SKUs को समझना

### SKUs क्या हैं?

SKUs (Stock Keeping Units) Azure संसाधनों के लिए विभिन्न सर्विस टियर और प्रदर्शन स्तरों का प्रतिनिधित्व करते हैं। हर SKU विभिन्न पेशकश करता है:

- **प्रदर्शन विशेषताएँ** (CPU, मेमोरी, थ्रूपुट)
- **फीचर उपलब्धता** (स्केलिंग विकल्प, SLA स्तर)
- **प्राइसिंग मॉडल** (कंजम्प्शन-आधारित, रिज़र्व्ड कैपेसिटी)
- **क्षेत्रीय उपलब्धता** (सभी SKUs सभी क्षेत्रों में उपलब्ध नहीं होते)

### SKU चयन में प्रमुख कारक

1. **वर्कलोड आवश्यकताएँ**
   - अपेक्षित ट्रैफिक/लोड पैटर्न
   - प्रदर्शन आवश्यकताएँ (CPU, मेमोरी, I/O)
   - स्टोरेज आवश्यकताएँ और एक्सेस पैटर्न

2. **पर्यावरण प्रकार**
   - डेवलपमेंट/टेस्टिंग बनाम प्रोडक्शन
   - उपलब्धता आवश्यकताएँ
   - सुरक्षा और अनुपालन आवश्यकताएँ

3. **बजट सीमाएँ**
   - प्रारंभिक लागत बनाम संचालन लागत
   - रिज़र्व्ड कैपेसिटी छूट
   - ऑटो-स्केलिंग के लागत प्रभाव

4. **विकास प्रोजेक्शंस**
   - स्केलेबिलिटी आवश्यकताएँ
   - भविष्य की फीचर जरूरतें
   - माइग्रेशन जटिलता

---

## वातावरण-आधारित चयन

### डेवलपमेंट वातावरण

**प्राथमिकताएँ**: लागत अनुकूलन, बुनियादी कार्यक्षमता, आसान प्रोविजन/डी-प्रोविजन

#### सिफारिश की गई SKUs
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

#### विशेषताएँ
- **App Service**: F1 (मुफ्त) या B1 (बेसिक) सरल परीक्षण के लिए
- **Databases**: न्यूनतम संसाधनों के साथ Basic tier
- **Storage**: केवल स्थानीय redundancy के साथ Standard
- **Compute**: साझा संसाधन स्वीकार्य
- **Networking**: बुनियादी कॉन्फ़िगरेशन

### स्टेजिंग/टेस्टिंग वातावरण

**प्राथमिकताएँ**: प्रोडक्शन-जैसी कॉन्फ़िगरेशन, लागत संतुलन, प्रदर्शन परीक्षण क्षमता

#### सिफारिश की गई SKUs
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

#### विशेषताएँ
- **प्रदर्शन**: प्रोडक्शन क्षमता का 70-80%
- **फीचर**: अधिकांश प्रोडक्शन फीचर सक्षम
- **रेडंडेंसी**: कुछ भौगोलिक redundancy
- **स्केलिंग**: परीक्षण के लिए सीमित ऑटो-स्केलिंग
- **मानिटरिंग**: पूर्ण मॉनिटरिंग स्टैक

### प्रोडक्शन वातावरण

**प्राथमिकताएँ**: प्रदर्शन, उपलब्धता, सुरक्षा, अनुपालन, स्केलेबिलिटी

#### सिफारिश की गई SKUs
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

#### विशेषताएँ
- **उच्च उपलब्धता**: 99.9%+ SLA आवश्यकताएँ
- **प्रदर्शन**: समर्पित संसाधन, उच्च थ्रूपुट
- **सुरक्षा**: प्रीमियम सुरक्षा सुविधाएँ
- **स्केलिंग**: पूर्ण ऑटो-स्केलिंग क्षमता
- **मानिटरिंग**: व्यापक ऑब्ज़र्वबिलिटी

---

## सर्विस-विशिष्ट मार्गदर्शन

### Azure App Service

#### SKU निर्णय मैट्रिक्स

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### कॉन्फ़िगरेशन उदाहरण

**Development**
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

**Production**
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

#### SKU चयन फ्रेमवर्क

1. **DTU-आधारित (Database Transaction Units)**
   - **Basic**: 5 DTU - डेवलपमेंट/टेस्टिंग
   - **Standard**: S0-S12 (10-3000 DTU) - सामान्य प्रयोजन
   - **Premium**: P1-P15 (125-4000 DTU) - प्रदर्शन-सम्वेदनशील

2. **vCore-आधारित** (प्रोडक्शन के लिए अनुशंसित)
   - **General Purpose**: संतुलित compute और storage
   - **Business Critical**: कम लेटेंसी, उच्च IOPS
   - **Hyperscale**: अत्यधिक स्केलेबल स्टोरेज (100TB तक)

#### उदाहरण कॉन्फ़िगरेशन

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

#### वातावरण के प्रकार

1. **Consumption-based**
   - उपयोग के अनुसार भुगतान
   - विकास और परिवर्तनशील वर्कलोड के लिए उपयुक्त
   - साझा इनफ्रास्ट्रक्चर

2. **Dedicated (Workload Profiles)**
   - समर्पित compute संसाधन
   - अनुमानित प्रदर्शन
   - प्रोडक्शन वर्कलोड के लिए बेहतर

#### कॉन्फ़िगरेशन उदाहरण

**Development (Consumption)**
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

**Production (Dedicated)**
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

#### थ्रूपुट मॉडल

1. **Manual Provisioned Throughput**
   - अनुमानित प्रदर्शन
   - रिज़र्व्ड कैपेसिटी छूट
   - स्थिर वर्कलोड के लिए सर्वोत्तम

2. **Autoscale Provisioned Throughput**
   - उपयोग के आधार पर स्वचालित स्केलिंग
   - आप जितना उपयोग करते हैं उसके लिए भुगतान (न्यूनतम के साथ)
   - परिवर्तनशील वर्कलोड के लिए अच्छा

3. **Serverless**
   - प्रति-रिक्वेस्ट भुगतान
   - कोई provisioned throughput नहीं
   - विकास और अंतरालिक वर्कलोड के लिए उपयुक्त

#### SKU उदाहरण

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

#### स्टोरेज अकाउंट प्रकार

1. **Standard_LRS** - विकास, गैर-महत्वपूर्ण डेटा
2. **Standard_GRS** - प्रोडक्शन, भौगोलिक redundancy आवश्यक
3. **Premium_LRS** - उच्च-प्रदर्शन एप्लिकेशन
4. **Premium_ZRS** - ज़ोन redundancy के साथ उच्च उपलब्धता

#### प्रदर्शन टियर

- **Standard**: सामान्य प्रयोजन, लागत-प्रभावी
- **Premium**: उच्च-प्रदर्शन, कम-लेटेंसी परिदृश्य

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

## लागत अनुकूलन रणनीतियाँ

### 1. रिज़र्व्ड कैपेसिटी

1-3 वर्षों के लिए संसाधन आरक्षित करें ताकि महत्वपूर्ण छूट मिले:

```bash
# आरक्षण विकल्पों की जाँच करें
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. राइट-साइजिंग

छोटे SKUs के साथ शुरू करें और वास्तविक उपयोग के आधार पर ऊपर स्केल करें:

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

### 3. ऑटो-स्केलिंग कॉन्फ़िगरेशन

लागत अनुकूलन के लिए बुद्धिमान स्केलिंग लागू करें:

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

### 4. निर्धारित स्केलिंग

ऑफ-आवर्स के दौरान डाउन-स्केल करें:

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

## प्रदर्शन पर विचार

### बेसलाइन प्रदर्शन आवश्यकताएँ

SKU चयन से पहले स्पष्ट प्रदर्शन आवश्यकताएँ परिभाषित करें:

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

### लोड टेस्टिंग

विभिन्न SKUs का परीक्षण करके प्रदर्शन को सत्यापित करें:

```bash
# एज़्योर लोड परीक्षण सेवा
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### मॉनिटरिंग और अनुकूलन

विस्तृत मॉनिटरिंग सेट अप करें:

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

## त्वरित संदर्भ तालिकाएँ

### App Service SKU त्वरित संदर्भ

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU त्वरित संदर्भ

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Container Apps SKU त्वरित संदर्भ

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## वैलिडेशन टूल्स

### SKU उपलब्धता चेकर

```bash
#!/bin/bash
# लक्षित क्षेत्र में SKU की उपलब्धता की जाँच करें

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

# उपयोग
check_sku_availability "eastus" "app-service" "P1V3"
```

### लागत अनुमान स्क्रिप्ट

```powershell
# लागत अनुमान के लिए PowerShell स्क्रिप्ट
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
        
        # Azure प्राइसिंग API या कैलकुलेटर का उपयोग करें
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# उपयोग
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### प्रदर्शन सत्यापन

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

## सर्वश्रेष्ठ प्रथाओं का सारांश

### क्या करें

1. **छोटे से शुरू करें और वास्तविक उपयोग के आधार पर ऊपर स्केल करें**
2. **विभिन्न वातावरणों के लिए अलग-अलग SKUs का उपयोग करें**
3. **प्रदर्शन और लागत की निरंतर निगरानी करें**
4. **प्रोडक्शन वर्कलोड के लिए रिज़र्व्ड कैपेसिटी का लाभ उठाएँ**
5. **जहाँ उपयुक्त हो वहाँ ऑटो-स्केलिंग लागू करें**
6. **वास्तविक वर्कलोड के साथ प्रदर्शन का परीक्षण करें**
7. **विकास की योजना बनाएं पर ओवर-प्रोविजनिंग से बचें**
8. **विकास के लिए जहाँ संभव हो मुफ्त टियर का उपयोग करें**

### क्या न करें

1. **डेवलपमेंट के लिए प्रोडक्शन SKUs का उपयोग न करें**
2. **क्षेत्रीय SKU उपलब्धता की अनदेखी न करें**
3. **डेटा ट्रांसफर लागत को न भूलें**
4. **बिना औचित्य के ओवर-प्रोविजनिंग न करें**
5. **निर्भरता के प्रभाव की अनदेखी न करें**
6. **ऑटो-स्केलिंग लिमिट्स बहुत अधिक न सेट करें**
7. **अनुपालन आवश्यकताओं को न भूलें**
8. **केवल कीमत के आधार पर निर्णय न लें**

---

**प्रो टिप**: Azure Cost Management और Advisor का उपयोग करें ताकि वास्तविक उपयोग पैटर्न के आधार पर आपके SKU चयन को अनुकूलित करने के लिए व्यक्तिगत सिफारिशें मिल सकें।

---

**नेविगेशन**
- **पिछला पाठ**: [Capacity Planning](capacity-planning.md)
- **अगला पाठ**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सही अनुवाद के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असमानताएँ हो सकती हैं। मूल भाषा में उपलब्ध दस्तावेज़ को प्रामाणिक (अधिकृत) स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत अर्थ निकालने के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->