<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T19:49:37+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "mr"
}
-->
# SKU निवड मार्गदर्शक - योग्य Azure सेवा स्तर निवडणे

## परिचय

ही सविस्तर मार्गदर्शिका तुम्हाला विविध वातावरण, कार्यभार आणि गरजांसाठी सर्वोत्तम Azure सेवा SKUs (स्टॉक कीपिंग युनिट्स) निवडण्यास मदत करते. Azure Developer CLI डिप्लॉयमेंटसाठी योग्य सेवा स्तर निवडण्यासाठी कार्यक्षमता गरजा, खर्च विचार आणि स्केलेबिलिटी गरजा कशा विश्लेषित करायच्या ते शिका.

## शिकण्याची उद्दिष्टे

ही मार्गदर्शिका पूर्ण करून तुम्ही:
- Azure SKU संकल्पना, किंमत मॉडेल्स आणि वैशिष्ट्यांमधील फरक समजून घ्याल
- विकास, स्टेजिंग आणि उत्पादनासाठी वातावरण-विशिष्ट SKU निवड रणनीती आत्मसात कराल
- कार्यभाराच्या गरजा विश्लेषित करून योग्य सेवा स्तरांशी जुळवून घ्याल
- बुद्धिमान SKU निवडीद्वारे खर्च ऑप्टिमायझेशन रणनीती अंमलात आणाल
- SKU निवडीसाठी कार्यक्षमता चाचणी आणि सत्यापन तंत्र लागू कराल
- स्वयंचलित SKU शिफारसी आणि मॉनिटरिंग कॉन्फिगर कराल

## शिकण्याचे परिणाम

पूर्ण झाल्यावर तुम्ही:
- कार्यभाराच्या गरजा आणि मर्यादांनुसार योग्य Azure सेवा SKUs निवडू शकाल
- योग्य स्तर निवडीसह खर्च-प्रभावी बहु-वातावरण आर्किटेक्चर डिझाइन करू शकाल
- SKU निवडीसाठी कार्यक्षमता बेंचमार्किंग आणि सत्यापन अंमलात आणू शकाल
- SKU शिफारसी आणि खर्च ऑप्टिमायझेशनसाठी स्वयंचलित साधने तयार करू शकाल
- बदलत्या गरजांसाठी SKU स्थलांतर आणि स्केलिंग रणनीतींची योजना करू शकाल
- Azure Well-Architected Framework च्या तत्त्वांचा सेवा स्तर निवडीत उपयोग करू शकाल

## विषय सूची

- [SKUs समजून घेणे](../../../../docs/pre-deployment)
- [वातावरण-आधारित निवड](../../../../docs/pre-deployment)
- [सेवा-विशिष्ट मार्गदर्शक](../../../../docs/pre-deployment)
- [खर्च ऑप्टिमायझेशन रणनीती](../../../../docs/pre-deployment)
- [कार्यक्षमता विचार](../../../../docs/pre-deployment)
- [जलद संदर्भ तक्ते](../../../../docs/pre-deployment)
- [सत्यापन साधने](../../../../docs/pre-deployment)

---

## SKUs समजून घेणे

### SKUs म्हणजे काय?

SKUs (स्टॉक कीपिंग युनिट्स) म्हणजे Azure संसाधनांसाठी विविध सेवा स्तर आणि कार्यक्षमता स्तरांचे प्रतिनिधित्व. प्रत्येक SKU वेगवेगळे ऑफर करते:

- **कार्यक्षमता वैशिष्ट्ये** (CPU, मेमरी, थ्रूपुट)
- **वैशिष्ट्य उपलब्धता** (स्केलिंग पर्याय, SLA स्तर)
- **किंमत मॉडेल्स** (वापर-आधारित, आरक्षित क्षमता)
- **प्रादेशिक उपलब्धता** (सर्व SKUs सर्व प्रदेशांमध्ये उपलब्ध नाहीत)

### SKU निवडीत महत्त्वाचे घटक

1. **कार्यभाराच्या गरजा**
   - अपेक्षित ट्रॅफिक/लोड पॅटर्न
   - कार्यक्षमता गरजा (CPU, मेमरी, I/O)
   - स्टोरेज गरजा आणि प्रवेश पॅटर्न

2. **वातावरण प्रकार**
   - विकास/चाचणी विरुद्ध उत्पादन
   - उपलब्धता गरजा
   - सुरक्षा आणि अनुपालन गरजा

3. **बजेट मर्यादा**
   - प्रारंभिक खर्च विरुद्ध ऑपरेशनल खर्च
   - आरक्षित क्षमता सवलती
   - ऑटो-स्केलिंग खर्च परिणाम

4. **वाढीचे अंदाज**
   - स्केलेबिलिटी गरजा
   - भविष्यातील वैशिष्ट्य गरजा
   - स्थलांतर जटिलता

---

## वातावरण-आधारित निवड

### विकास वातावरण

**प्राधान्ये**: खर्च ऑप्टिमायझेशन, मूलभूत कार्यक्षमता, सोपी प्रोव्हिजनिंग/डी-प्रोव्हिजनिंग

#### शिफारस केलेले SKUs
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

#### वैशिष्ट्ये
- **App Service**: F1 (फ्री) किंवा B1 (बेसिक) सोप्या चाचणीसाठी
- **Databases**: कमी संसाधनांसह बेसिक स्तर
- **Storage**: स्थानिक पुनरावृत्ती असलेले स्टँडर्ड
- **Compute**: सामायिक संसाधने स्वीकार्य
- **Networking**: मूलभूत कॉन्फिगरेशन

### स्टेजिंग/चाचणी वातावरण

**प्राधान्ये**: उत्पादनासारखी कॉन्फिगरेशन, खर्च संतुलन, कार्यक्षमता चाचणी क्षमता

#### शिफारस केलेले SKUs
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

#### वैशिष्ट्ये
- **कार्यक्षमता**: उत्पादन क्षमतेच्या 70-80%
- **वैशिष्ट्ये**: बहुतेक उत्पादन वैशिष्ट्ये सक्षम
- **पुनरावृत्ती**: काही भौगोलिक पुनरावृत्ती
- **स्केलिंग**: चाचणीसाठी मर्यादित ऑटो-स्केलिंग
- **मॉनिटरिंग**: पूर्ण मॉनिटरिंग स्टॅक

### उत्पादन वातावरण

**प्राधान्ये**: कार्यक्षमता, उपलब्धता, सुरक्षा, अनुपालन, स्केलेबिलिटी

#### शिफारस केलेले SKUs
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

#### वैशिष्ट्ये
- **उच्च उपलब्धता**: 99.9%+ SLA गरजा
- **कार्यक्षमता**: समर्पित संसाधने, उच्च थ्रूपुट
- **सुरक्षा**: प्रीमियम सुरक्षा वैशिष्ट्ये
- **स्केलिंग**: पूर्ण ऑटो-स्केलिंग क्षमता
- **मॉनिटरिंग**: व्यापक निरीक्षण

---

## सेवा-विशिष्ट मार्गदर्शक

### Azure App Service

#### SKU निर्णय मॅट्रिक्स

| उपयोग प्रकरण | शिफारस केलेले SKU | कारण |
|--------------|------------------|-------|
| विकास/चाचणी | F1 (फ्री) किंवा B1 (बेसिक) | खर्च-प्रभावी, चाचणीसाठी पुरेसे |
| लहान उत्पादन अ‍ॅप्स | S1 (स्टँडर्ड) | कस्टम डोमेन, SSL, ऑटो-स्केलिंग |
| मध्यम उत्पादन अ‍ॅप्स | P1V3 (प्रीमियम V3) | चांगली कार्यक्षमता, अधिक वैशिष्ट्ये |
| उच्च ट्रॅफिक अ‍ॅप्स | P2V3 किंवा P3V3 | समर्पित संसाधने, उच्च कार्यक्षमता |
| मिशन-क्रिटिकल अ‍ॅप्स | I1V2 (आयसोलेटेड V2) | नेटवर्क आयसोलेशन, समर्पित हार्डवेअर |

#### कॉन्फिगरेशन उदाहरणे

**विकास**
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

**उत्पादन**
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

#### SKU निवड फ्रेमवर्क

1. **DTU-आधारित (डेटाबेस ट्रान्झॅक्शन युनिट्स)**
   - **बेसिक**: 5 DTU - विकास/चाचणी
   - **स्टँडर्ड**: S0-S12 (10-3000 DTU) - सामान्य उद्देश
   - **प्रीमियम**: P1-P15 (125-4000 DTU) - कार्यक्षमता-क्रिटिकल

2. **vCore-आधारित** (उत्पादनासाठी शिफारस केलेले)
   - **सामान्य उद्देश**: संतुलित संगणन आणि स्टोरेज
   - **बिझनेस क्रिटिकल**: कमी लेटन्सी, उच्च IOPS
   - **हायपरस्केल**: अत्यंत स्केलेबल स्टोरेज (100TB पर्यंत)

#### उदाहरण कॉन्फिगरेशन

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

#### वातावरण प्रकार

1. **वापर-आधारित**
   - वापरानुसार किंमत
   - विकास आणि बदलत्या कार्यभारासाठी योग्य
   - सामायिक पायाभूत सुविधा

2. **समर्पित (वर्कलोड प्रोफाइल्स)**
   - समर्पित संगणन संसाधने
   - अंदाजे कार्यक्षमता
   - उत्पादन कार्यभारासाठी चांगले

#### कॉन्फिगरेशन उदाहरणे

**विकास (वापर-आधारित)**
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

**उत्पादन (समर्पित)**
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

#### थ्रूपुट मॉडेल्स

1. **मॅन्युअल प्रोव्हिजनड थ्रूपुट**
   - अंदाजे कार्यक्षमता
   - आरक्षित क्षमता सवलती
   - स्थिर कार्यभारासाठी सर्वोत्तम

2. **ऑटोस्केल प्रोव्हिजनड थ्रूपुट**
   - वापरानुसार स्वयंचलित स्केलिंग
   - वापरासाठी पैसे (किमानासह)
   - बदलत्या कार्यभारासाठी चांगले

3. **सर्व्हरलेस**
   - प्रति-रिक्वेस्ट पैसे
   - प्रोव्हिजनड थ्रूपुट नाही
   - विकास आणि अधूनमधून कार्यभारासाठी आदर्श

#### SKU उदाहरणे

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

#### स्टोरेज खाते प्रकार

1. **Standard_LRS** - विकास, गैर-क्रिटिकल डेटा
2. **Standard_GRS** - उत्पादन, भौगोलिक पुनरावृत्ती आवश्यक
3. **Premium_LRS** - उच्च-कार्यक्षमता अनुप्रयोग
4. **Premium_ZRS** - झोन पुनरावृत्तीसह उच्च उपलब्धता

#### कार्यक्षमता स्तर

- **स्टँडर्ड**: सामान्य उद्देश, खर्च-प्रभावी
- **प्रीमियम**: उच्च-कार्यक्षमता, कमी लेटन्सी परिस्थिती

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

## खर्च ऑप्टिमायझेशन रणनीती

### 1. आरक्षित क्षमता

1-3 वर्षांसाठी संसाधने आरक्षित करा आणि मोठ्या सवलती मिळवा:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. योग्य आकार निवडणे

लहान SKUs सह प्रारंभ करा आणि वास्तविक वापरावर आधारित स्केल करा:

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

### 3. ऑटो-स्केलिंग कॉन्फिगरेशन

खर्च ऑप्टिमायझेशनसाठी बुद्धिमान स्केलिंग अंमलात आणा:

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

### 4. नियोजित स्केलिंग

ऑफ-ऑर्स दरम्यान स्केल कमी करा:

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

## कार्यक्षमता विचार

### मूलभूत कार्यक्षमता गरजा

SKU निवडीपूर्वी स्पष्ट कार्यक्षमता गरजा परिभाषित करा:

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

### लोड चाचणी

कार्यक्षमता सत्यापित करण्यासाठी विविध SKUs चाचणी करा:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### मॉनिटरिंग आणि ऑप्टिमायझेशन

व्यापक मॉनिटरिंग सेट करा:

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

## जलद संदर्भ तक्ते

### App Service SKU जलद संदर्भ

| SKU | स्तर | vCPU | RAM | स्टोरेज | किंमत श्रेणी | उपयोग प्रकरण |
|-----|------|------|-----|---------|-------------|--------------|
| F1 | फ्री | सामायिक | 1GB | 1GB | फ्री | विकास |
| B1 | बेसिक | 1 | 1.75GB | 10GB | $ | लहान अ‍ॅप्स |
| S1 | स्टँडर्ड | 1 | 1.75GB | 50GB | $$ | उत्पादन |
| P1V3 | प्रीमियम V3 | 2 | 8GB | 250GB | $$$ | उच्च कार्यक्षमता |
| I1V2 | आयसोलेटेड V2 | 2 | 8GB | 1TB | $$$$ | एंटरप्राइज |

### SQL Database SKU जलद संदर्भ

| SKU | स्तर | DTU/vCore | स्टोरेज | किंमत श्रेणी | उपयोग प्रकरण |
|-----|------|-----------|---------|-------------|--------------|
| बेसिक | बेसिक | 5 DTU | 2GB | $ | विकास |
| S2 | स्टँडर्ड | 50 DTU | 250GB | $$ | लहान उत्पादन |
| P2 | प्रीमियम | 250 DTU | 1TB | $$$ | उच्च कार्यक्षमता |
| GP_Gen5_4 | सामान्य उद्देश | 4 vCore | 4TB | $$$ | संतुलित |
| BC_Gen5_8 | बिझनेस क्रिटिकल | 8 vCore | 4TB | $$$$ | मिशन क्रिटिकल |

### Container Apps SKU जलद संदर्भ

| मॉडेल | किंमत | CPU/मेमरी | उपयोग प्रकरण |
|-------|-------|-----------|--------------|
| वापर-आधारित | प्रति-वापर | 0.25-2 vCPU | विकास, बदलता लोड |
| समर्पित D4 | आरक्षित | 4 vCPU, 16GB | उत्पादन |
| समर्पित D8 | आरक्षित | 8 vCPU, 32GB | उच्च कार्यक्षमता |

---

## सत्यापन साधने

### SKU उपलब्धता तपासक

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

### खर्च अंदाज स्क्रिप्ट

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

### कार्यक्षमता सत्यापन

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

## सर्वोत्तम पद्धतींचा सारांश

### करावे

1. **लहान सुरुवात करा आणि वास्तविक वापरावर आधारित स्केल करा**
2. **विविध वातावरणांसाठी वेगवेगळे SKUs वापरा**
3. **सतत कार्यक्षमता आणि खर्च मॉनिटर करा**
4. **उत्पादन कार्यभारासाठी आरक्षित क्षमता वापरा**
5. **योग्य ठिकाणी ऑटो-स्केलिंग अंमलात आणा**
6. **वास्तविक कार्यभारांसह कार्यक्षमता चाचणी करा**
7. **वाढीची योजना करा पण जास्त प्रोव्हिजनिंग टाळा**
8. **विकासासाठी शक्य असल्यास फ्री स्तर वापरा**

### करू नये

1. **विकासासाठी उत्पादन SKUs वापरू नका**
2. **प्रादेशिक SKU उपलब्धता दुर्लक्षित करू नका**
3. **डेटा ट्रान्सफर खर्च विसरू नका**
4. **जास्त प्रोव्हिजनिंग न करता निर्णय घ्या**
5. **अवलंबित्वांचा परिणाम दुर्लक्षित करू नका**
6. **ऑटो-स्केलिंग मर्यादा खूप जास्त सेट करू नका**
7. **अनुपालन गरजा दुर्लक्षित करू नका**
8. **फक्त किंमतीवर आधारित निर्णय घेऊ नका**

---

**प्रो टिप**: Azure Cost Management आणि Advisor वापरून तुमच्या SKU निवडीसाठी वास्तविक वापर पॅटर्नवर आधारित वैयक्तिकृत शिफारसी मिळवा.

---

**नेव्हिगेशन**
- **मागील धडा**: [क्षमता नियोजन](capacity-planning.md)
- **पुढील धडा**: [प्रीफ्लाइट तपासणी](preflight-checks.md)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून निर्माण होणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार नाही.