# SKU चयन मार्गदर्शक - सही Azure सेवा टियरहरू छान्ने

**Chapter Navigation:**
- **📚 Course Home**: [AZD नवप्रवेशीहरूका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 6 - प्रि-डिप्लोयमेन्ट मान्यकरण र योजना
- **⬅️ Previous**: [Capacity Planning](capacity-planning.md)
- **➡️ Next**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Next Chapter**: [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/common-issues.md)

## परिचय

यो व्यापक मार्गदर्शकले विभिन्न वातावरणहरू, वर्कलोडहरू, र आवश्यकताहरूका लागि उपयुक्त Azure सेवा SKU (Stock Keeping Units) छनोट गर्न मद्दत गर्दछ। Azure Developer CLI डिप्लोयमेन्टहरूका लागि प्रदर्शन आवश्यकताहरू, लागत विचारहरू, र स्केलेबिलिटी आवश्यकता विश्लेषण गर्न सिक्नुहोस् र सबैभन्दा उपयुक्त सेवा टियरहरू छनोट गर्नुहोस्।

## सिकाइ लक्ष्यहरू

यस मार्गदर्शक पूरा गर्दा तपाईंले:
- Azure SKU अवधारणाहरू, मूल्य निर्धारण मोडेलहरू, र सुविधाहरूका भिन्नताहरू बुझ्ने
- विकास, स्टेजिङ, र उत्पादनका लागि वातावरण-विशिष्ट SKU छनोट रणनीतिहरूमा दक्ष हुने
- वर्कलोड आवश्यकताहरू विश्लेषण गरी उपयुक्त सेवा टियरसँग मिलाउने
- बुद्धिमानीपूर्ण SKU छनोट मार्फत लागत अनुकूलन रणनीतिहरू कार्यान्वयन गर्ने
- SKU छनोटका लागि प्रदर्शन परीक्षण र मान्यकरण प्रविधिहरू लागू गर्ने
- स्वचालित SKU सिफारिस र निगरानी कन्फिगर गर्ने

## सिकाइ परिणामहरू

समाप्त भएपछि, तपाईं सक्षम हुनुहुनेछ:
- वर्कलोड आवश्यकताहरू र सीमाहरूको आधारमा उपयुक्त Azure सेवा SKU हरू छनोट गर्न
- सही टियर छनोटसहित लागत-प्रभावी बहु-पर्यावरण वास्तुकलाहरू डिजाइन गर्न
- SKU छनोटका लागि प्रदर्शन बेंचमार्किङ र मान्यकरण कार्यान्वयन गर्न
- SKU सिफारिस र लागत अनुकूलनका लागि स्वचालित उपकरणहरू सिर्जना गर्न
- परिवर्तनशील आवश्यकताहरूका लागि SKU माइग्रेशन र स्केलिंग रणनीतिहरू योजना बनाउने
- सेवा टियर छनोटमा Azure Well-Architected Framework सिद्धान्तहरू लागू गर्ने

## विषय सूची

- [SKU हरू बुझ्ने](../../../../docs/chapter-06-pre-deployment)
- [पर्यावरण-आधारित छनोट](../../../../docs/chapter-06-pre-deployment)
- [सेवा-विशिष्ट मार्गदर्शन](../../../../docs/chapter-06-pre-deployment)
- [लागत अनुकूलन रणनीतिहरू](../../../../docs/chapter-06-pre-deployment)
- [प्रदर्शन सम्बन्धी विचारहरू](../../../../docs/chapter-06-pre-deployment)
- [छिटो संदर्भ तालिकाहरू](../../../../docs/chapter-06-pre-deployment)
- [मान्यता उपकरणहरू](../../../../docs/chapter-06-pre-deployment)

---

## SKU हरू बुझ्ने

### SKU के हुन्?

SKU हरू (Stock Keeping Units) Azure स्रोतहरूको लागि विभिन्न सेवा टियर र प्रदर्शन स्तरहरू प्रतिनिधित्व गर्दछन्। प्रत्येक SKU ले फरक-फरक प्रदान गर्दछ:

- **प्रदर्शन विशेषताहरू** (CPU, मेमोरी, थ्रूपुट)
- **फिचर उपलब्धता** (स्केलिङ विकल्पहरू, SLA स्तरहरू)
- **मूल्य निर्धारण मोडेलहरू** (उपभोग-आधारित, रिजर्भ गरिएको क्षमताहरू)
- **क्षेत्रीय उपलब्धता** (सबै SKU सबै क्षेत्रहरूमा उपलब्ध हुँदैनन्)

### SKU छनोटका लागि प्रमुख कारकहरू

1. **वर्कलोड आवश्यकताहरू**
   - अपेक्षित ट्राफिक/लोड ढाँचाहरू
   - प्रदर्शन आवश्यकताहरू (CPU, मेमोरी, I/O)
   - भण्डारण आवश्यकताहरू र पहुँच ढाँचाहरू

2. **वातावरण प्रकार**
   - विकास/परीक्षण बनाम उत्पादन
   - उपलब्धता आवश्यकताहरू
   - सुरक्षा र अनुपालन आवश्यकताहरू

3. **बजेट सीमाहरू**
   - आरम्भिक लागत बनाम सञ्चालन लागत
   - रिजर्भ गरिएको क्षमता छुट
   - अटो-स्केलिङका लागत प्रभावहरू

4. **बृद्धि प्रोजेक्सनहरू**
   - स्केलेबिलिटी आवश्यकताहरू
   - भविष्यका फिचर आवश्यकताहरू
   - माइग्रेशन जटिलता

---

## वातावरण-आधारित छनोट

### विकास वातावरण

**प्राथमिकताहरू**: लागत अनुकूलन, आधारभूत कार्यक्षमता, सजिलो प्रावधान/हटाउने

#### Recommended SKUs
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

#### विशेषताहरू
- **App Service**: F1 (Free) वा B1 (Basic) सामान्य परीक्षणका लागि
- **Databases**: न्यूनतम स्रोतसहित Basic टियर
- **Storage**: स्थानीय रेन्डन्सी मात्र सहित Standard
- **Compute**: साझा स्रोतहरू स्वीकार्य
- **Networking**: आधारभूत कन्फिगरेसनहरू

### स्टेजिङ/परीक्षण वातावरण

**प्राथमिकताहरू**: उत्पादन-जस्तै कन्फिगरेसन, लागत सन्तुलन, प्रदर्शन परीक्षण क्षमता

#### Recommended SKUs
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

#### विशेषताहरू
- **प्रदर्शन**: उत्पादन क्षमताको 70-80%
- **फिचरहरू**: अधिकांश उत्पादन फिचरहरू सक्षम
- **रेन्डन्सी**: केहि भौगोलिक रेन्डन्सी
- **स्केलिङ**: परीक्षणका लागि सीमित अटो-स्केलिङ
- **निगरानी**: पूर्ण निगरानी स्ट्याक

### उत्पादन वातावरण

**प्राथमिकताहरू**: प्रदर्शन, उपलब्धता, सुरक्षा, अनुपालन, स्केलेबिलिटी

#### Recommended SKUs
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

#### विशेषताहरू
- **उच्च उपलब्धता**: 99.9%+ SLA आवश्यकताहरू
- **प्रदर्शन**: समर्पित स्रोतहरू, उच्च थ्रूपुट
- **सुरक्षा**: प्रिमियम सुरक्षा सुविधाहरू
- **स्केलिङ**: पूर्ण अटो-स्केलिङ क्षमताहरू
- **निगरानी**: व्यापक अवरोधक्षमता

---

## सेवा-विशिष्ट मार्गदर्शन

### Azure App Service

#### SKU निर्णय म्याट्रिक्स

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | लागत-प्रभावी, परीक्षणका लागि पर्याप्त |
| Small production apps | S1 (Standard) | कस्टम डोमेन्स, SSL, अटो-स्केलिङ |
| Medium production apps | P1V3 (Premium V3) | राम्रो प्रदर्शन, बढी सुविधाहरू |
| High-traffic apps | P2V3 or P3V3 | समर्पित स्रोतहरू, उच्च प्रदर्शन |
| Mission-critical apps | I1V2 (Isolated V2) | नेटवर्क पृथकीकरण, समर्पित हार्डवेयर |

#### कन्फिगरेसन उदाहरणहरू

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

#### SKU छनोट फ्रेमवर्क

1. **DTU-आधारित (Database Transaction Units)**
   - **Basic**: 5 DTU - विकास/परीक्षण
   - **Standard**: S0-S12 (10-3000 DTU) - सामान्य प्रयोजन
   - **Premium**: P1-P15 (125-4000 DTU) - प्रदर्शन-सम्वन्धी महत्वपूर्ण

2. **vCore-आधारित** (उत्पादनका लागि सिफारिश गरिएको)
   - **General Purpose**: सन्तुलित कम्प्युट र भण्डारण
   - **Business Critical**: कम लेटेन्सी, उच्च IOPS
   - **Hyperscale**: अत्यधिक स्केलेबल भण्डारण (सम्म 100TB)

#### उदाहरण कन्फिगरेसनहरू

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

#### वातावरण प्रकारहरू

1. **Consumption-based**
   - Pay-per-use मूल्य निर्धारण
   - विकास र परिवर्तनशील वर्कलोडका लागि उपयुक्त
   - साझा इन्फ्रास्ट्रक्चर

2. **Dedicated (Workload Profiles)**
   - समर्पित कम्प्युट स्रोतहरू
   - पूर्वानुमानयोग्य प्रदर्शन
   - उत्पादन वर्कलोडहरूको लागि राम्रो

#### कन्फिगरेसन उदाहरणहरू

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

#### थ्रूपुट मोडेलहरू

1. **Manual Provisioned Throughput**
   - पूर्वानुमानयोग्य प्रदर्शन
   - रिजर्भ गरिएको क्षमतामा छुट
   - स्थिर वर्कलोडका लागि उत्तम

2. **Autoscale Provisioned Throughput**
   - प्रयोगको आधारमा स्वचालित स्केलिङ
   - प्रयोगअनुसार तिर्नुहोस् (न्यूनतमसहित)
   - परिवर्तनशील वर्कलोडका लागि राम्रो

3. **Serverless**
   - प-प्रति-प्रश्न तिर्नुहोस्
   - कुनै provisioned throughput आवश्यक छैन
   - विकास र बीचबीचमा हुने वर्कलोडका लागि आदर्श

#### SKU उदाहरणहरू

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

#### स्टोरेज खाता प्रकारहरू

1. **Standard_LRS** - विकास, गैर-नाजुक डेटा
2. **Standard_GRS** - उत्पादन, जियो-रेन्डन्सी आवश्यक
3. **Premium_LRS** - उच्च-प्रदर्शन अनुप्रयोगहरू
4. **Premium_ZRS** - जोन रेन्डन्सीसहित उच्च उपलब्धता

#### प्रदर्शन टियरहरू

- **Standard**: सामान्य प्रयोजन, लागत-प्रभावी
- **Premium**: उच्च-प्रदर्शन, कम लेटेन्सी परिदृश्य

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

## लागत अनुकूलन रणनीतिहरू

### 1. रिजर्भ गरिएको क्षमता

1-3 वर्षका लागि स्रोतहरू रिजर्भ गर्दा महत्वपूर्ण छुटहरू पाउन सकिन्छ:

```bash
# आरक्षण विकल्पहरू जाँच गर्नुहोस्
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. ठीक-साइजिङ (Right-Sizing)

सुरुमा साना SKU हरूबाट सुरु गरेर वास्तविक प्रयोगको आधारमा स्केल अप गर्नुहोस्:

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

### 3. अटो-स्केलिङ कन्फिगरेसन

लागत अनुकूलन गर्न बुद्धिमानीपूर्ण स्केलिङ लागू गर्नुहोस्:

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

### 4. निर्धारित स्केलिङ

अफ-आवर्समा स्केल डाउन गर्नुहोस्:

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

## प्रदर्शन सम्बन्धी विचारहरू

### बेसलाइन प्रदर्शन आवश्यकताहरू

SKU छनोट गर्नु अघि स्पष्ट प्रदर्शन आवश्यकताहरू परिभाषित गर्नुहोस्:

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

### लोड परीक्षण

विभिन्न SKU हरू परीक्षण गरेर प्रदर्शन मान्य गर्नुहोस्:

```bash
# Azure लोड परीक्षण सेवा
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### निगरानी र अनुकूलन

व्यापक निगरानी सेटअप गर्नुहोस्:

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

## छिटो संदर्भ तालिकाहरू

### App Service SKU छिटो संदर्भ

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | साना एपहरू |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | उत्पादन |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | उच्च प्रदर्शन |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | एन्त्रप्राइज |

### SQL Database SKU छिटो संदर्भ

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | सानो उत्पादन |
| P2 | Premium | 250 DTU | 1TB | $$$ | उच्च प्रदर्शन |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | सन्तुलित |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | मिशन क्रिटिकल |

### Container Apps SKU छिटो संदर्भ

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, परिवर्तनशील लोड |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | उत्पादन |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | उच्च प्रदर्शन |

---

## मान्यता उपकरणहरू

### SKU उपलब्धता चेकर

```bash
#!/bin/bash
# लक्षित क्षेत्रमा SKU उपलब्धता जाँच गर्नुहोस्

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

# प्रयोग
check_sku_availability "eastus" "app-service" "P1V3"
```

### लागत अनुमान स्क्रिप्ट

```powershell
# लागत अनुमानको लागि PowerShell स्क्रिप्ट
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
        
        # Azure मूल्य निर्धारण API वा क्यालकुलेटर प्रयोग गर्नुहोस्
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# प्रयोग
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### प्रदर्शन मान्यकरण

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

## उत्तम अभ्यास सारांश

### गर्नु पर्नेहरू

1. **सुरु सानोबाट गर्नुहोस् र वास्तविक प्रयोगका आधारमा स्केल अप गर्नुहोस्**
2. **विभिन्न वातावरणहरूको लागि फरक SKU हरू प्रयोग गर्नुहोस्**
3. **प्रदर्शन र लागतहरू निरन्तर निगरानी गर्नुहोस्**
4. **उत्पादन वर्कलोडहरूका लागि रिजर्भ गरिएको क्षमता प्रयोग गर्नुहोस्**
5. **उपयुक्त स्थानमा अटो-स्केलिङ लागू गर्नुहोस्**
6. **यथार्थपरक वर्कलोडसँग प्रदर्शन परीक्षण गर्नुहोस्**
7. **बृद्धिका लागि योजना बनाउनुहोस् तर ओभर-प्रोभिजनिङबाट बच्नुहोस्**
8. **विकासका लागि सम्भव भएमा निःशुल्क टियरहरू प्रयोग गर्नुहोस्**

### गर्न नहुनेहरू

1. **विकासका लागि उत्पादन SKU हरू प्रयोग नगर्नुहोस्**
2. **क्षेत्रीय SKU उपलब्धतालाई बेवास्ता नगर्नुहोस्**
3. **डेटा ट्रान्सफर लागतहरू बिर्सनुहोस्**
4. **औचित्य बिना ओभर-प्रोभिजन नगर्नुहोस्**
5. **निर्भरता हरूको प्रभावलाई बेवास्ता नगर्नुहोस्**
6. **अटो-स्केलिङ सीमाहरू अत्यधिक उच्च राख्नुहोस्**
7. **अनुपालन आवश्यकताहरूलाई बिर्सनुहोस्**
8. **मात्र मूल्यको आधारमा निर्णय नगर्नुहोस्**

---

**प्रो टिप**: Azure Cost Management र Advisor प्रयोग गरी वास्तविक प्रयोग ढाँचाहरूको आधारमा तपाईंका SKU छनोटहरू अनुकूलन गर्ने व्यक्तिगत सिफारिसहरू प्राप्त गर्नुहोस्।

---

**Navigation**
- **Previous Lesson**: [Capacity Planning](capacity-planning.md)
- **Next Lesson**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौँ, तथापि कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुन सक्छ। मूल दस्तावेजलाई त्यसको मूल भाषामा आधिकारिक स्रोत मान्नुपर्छ। महत्वपूर्ण जानकारीको लागि पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौँ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->