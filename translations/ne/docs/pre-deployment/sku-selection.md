<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-17T20:05:29+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "ne"
}
-->
# SKU चयन मार्गदर्शक - Azure सेवा स्तरहरू सही रूपमा छनोट गर्ने

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ६ - पूर्व-परिनियोजन मान्यता र योजना
- **⬅️ अघिल्लो**: [क्षमता योजना](capacity-planning.md)
- **➡️ अर्को**: [पूर्व-उडान जाँच](preflight-checks.md)
- **🚀 अर्को अध्याय**: [अध्याय ७: समस्या समाधान](../troubleshooting/common-issues.md)

## परिचय

यो विस्तृत मार्गदर्शकले विभिन्न वातावरण, कार्यभार, र आवश्यकताहरूका लागि उपयुक्त Azure सेवा SKUs (स्टक कीपिङ युनिट्स) छनोट गर्न मद्दत गर्दछ। प्रदर्शन आवश्यकताहरू, लागत विचारहरू, र स्केलेबिलिटी आवश्यकताहरू विश्लेषण गर्न सिक्नुहोस् ताकि Azure Developer CLI परिनियोजनहरूको लागि सबैभन्दा उपयुक्त सेवा स्तरहरू छनोट गर्न सकियोस्।

## सिक्ने लक्ष्यहरू

यो मार्गदर्शक पूरा गरेपछि, तपाईं:
- Azure SKU अवधारणाहरू, मूल्य निर्धारण मोडेलहरू, र सुविधाहरूको भिन्नता बुझ्नुहुनेछ
- विकास, परीक्षण, र उत्पादनका लागि वातावरण-विशिष्ट SKU छनोट रणनीतिहरूमा निपुण हुनुहुनेछ
- कार्यभार आवश्यकताहरू विश्लेषण गर्नुहोस् र तिनीहरूलाई उपयुक्त सेवा स्तरहरूसँग मिलाउनुहोस्
- बुद्धिमानी SKU छनोट मार्फत लागत अनुकूलन रणनीतिहरू कार्यान्वयन गर्नुहोस्
- SKU छनोटहरूको लागि प्रदर्शन परीक्षण र मान्यता प्रविधिहरू लागू गर्नुहोस्
- स्वचालित SKU सिफारिस र निगरानी कन्फिगर गर्नुहोस्

## सिक्ने परिणामहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- कार्यभार आवश्यकताहरू र सीमाहरूको आधारमा उपयुक्त Azure सेवा SKUs छनोट गर्नुहोस्
- उचित स्तर चयनको साथ लागत-प्रभावकारी बहु-वातावरण आर्किटेक्चर डिजाइन गर्नुहोस्
- SKU छनोटहरूको लागि प्रदर्शन बेंचमार्किंग र मान्यता कार्यान्वयन गर्नुहोस्
- SKU सिफारिस र लागत अनुकूलनका लागि स्वचालित उपकरणहरू सिर्जना गर्नुहोस्
- बदलिँदो आवश्यकताहरूका लागि SKU माइग्रेशन र स्केलिंग रणनीतिहरू योजना गर्नुहोस्
- Azure Well-Architected Framework सिद्धान्तहरू सेवा स्तर चयनमा लागू गर्नुहोस्

## सामग्री तालिका

- [SKUs बुझ्दै](../../../../docs/pre-deployment)
- [वातावरण-आधारित चयन](../../../../docs/pre-deployment)
- [सेवा-विशिष्ट दिशानिर्देशहरू](../../../../docs/pre-deployment)
- [लागत अनुकूलन रणनीतिहरू](../../../../docs/pre-deployment)
- [प्रदर्शन विचारहरू](../../../../docs/pre-deployment)
- [द्रुत सन्दर्भ तालिकाहरू](../../../../docs/pre-deployment)
- [मान्यता उपकरणहरू](../../../../docs/pre-deployment)

---

## SKUs बुझ्दै

### SKUs के हुन्?

SKUs (स्टक कीपिङ युनिट्स) Azure स्रोतहरूको लागि विभिन्न सेवा स्तरहरू र प्रदर्शन स्तरहरू प्रतिनिधित्व गर्दछ। प्रत्येक SKU ले फरक प्रदान गर्दछ:

- **प्रदर्शन विशेषताहरू** (CPU, मेमोरी, थ्रूपुट)
- **सुविधा उपलब्धता** (स्केलिंग विकल्पहरू, SLA स्तरहरू)
- **मूल्य निर्धारण मोडेलहरू** (उपभोग-आधारित, आरक्षित क्षमता)
- **क्षेत्रीय उपलब्धता** (सबै SKUs सबै क्षेत्रहरूमा उपलब्ध छैनन्)

### SKU चयनमा मुख्य कारकहरू

1. **कार्यभार आवश्यकताहरू**
   - अपेक्षित ट्राफिक/लोड ढाँचाहरू
   - प्रदर्शन आवश्यकताहरू (CPU, मेमोरी, I/O)
   - भण्डारण आवश्यकताहरू र पहुँच ढाँचाहरू

2. **वातावरण प्रकार**
   - विकास/परीक्षण बनाम उत्पादन
   - उपलब्धता आवश्यकताहरू
   - सुरक्षा र अनुपालन आवश्यकताहरू

3. **बजेट सीमाहरू**
   - प्रारम्भिक लागत बनाम सञ्चालन लागत
   - आरक्षित क्षमता छुटहरू
   - स्वचालित स्केलिंग लागत प्रभावहरू

4. **वृद्धि प्रक्षेपणहरू**
   - स्केलेबिलिटी आवश्यकताहरू
   - भविष्य सुविधाहरूको आवश्यकता
   - माइग्रेशन जटिलता

---

## वातावरण-आधारित चयन

### विकास वातावरण

**प्राथमिकताहरू**: लागत अनुकूलन, आधारभूत कार्यक्षमता, सजिलो प्रावधान/डि-प्रावधान

#### सिफारिस गरिएको SKUs
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
- **एप सेवा**: F1 (नि:शुल्क) वा B1 (आधारभूत) साधारण परीक्षणका लागि
- **डाटाबेसहरू**: न्यूनतम स्रोतहरूसहित आधारभूत स्तर
- **भण्डारण**: स्थानीय पुनरावृत्तिसहित मानक
- **कम्प्युट**: साझा स्रोतहरू स्वीकार्य
- **नेटवर्किङ**: आधारभूत कन्फिगरेसनहरू

### परीक्षण/स्टेजिङ वातावरण

**प्राथमिकताहरू**: उत्पादन-जस्तै कन्फिगरेसन, लागत सन्तुलन, प्रदर्शन परीक्षण क्षमता

#### सिफारिस गरिएको SKUs
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
- **प्रदर्शन**: उत्पादन क्षमताको ७०-८०%
- **सुविधाहरू**: अधिकांश उत्पादन सुविधाहरू सक्षम
- **पुनरावृत्ति**: केही भौगोलिक पुनरावृत्ति
- **स्केलिंग**: परीक्षणका लागि सीमित स्वचालित स्केलिंग
- **निगरानी**: पूर्ण निगरानी स्ट्याक

### उत्पादन वातावरण

**प्राथमिकताहरू**: प्रदर्शन, उपलब्धता, सुरक्षा, अनुपालन, स्केलेबिलिटी

#### सिफारिस गरिएको SKUs
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
- **उच्च उपलब्धता**: ९९.९%+ SLA आवश्यकताहरू
- **प्रदर्शन**: समर्पित स्रोतहरू, उच्च थ्रूपुट
- **सुरक्षा**: प्रिमियम सुरक्षा सुविधाहरू
- **स्केलिंग**: पूर्ण स्वचालित स्केलिंग क्षमता
- **निगरानी**: व्यापक अवलोकनीयता

---

## सेवा-विशिष्ट दिशानिर्देशहरू

### Azure एप सेवा

#### SKU निर्णय म्याट्रिक्स

| प्रयोग केस | सिफारिस गरिएको SKU | कारण |
|------------|--------------------|-------|
| विकास/परीक्षण | F1 (नि:शुल्क) वा B1 (आधारभूत) | लागत-प्रभावकारी, परीक्षणका लागि पर्याप्त |
| साना उत्पादन एपहरू | S1 (मानक) | कस्टम डोमेन, SSL, स्वचालित स्केलिंग |
| मध्यम उत्पादन एपहरू | P1V3 (प्रिमियम V3) | राम्रो प्रदर्शन, थप सुविधाहरू |
| उच्च ट्राफिक एपहरू | P2V3 वा P3V3 | समर्पित स्रोतहरू, उच्च प्रदर्शन |
| मिशन-क्रिटिकल एपहरू | I1V2 (आइसोलेटेड V2) | नेटवर्क अलगाव, समर्पित हार्डवेयर |

#### कन्फिगरेसन उदाहरणहरू

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

### Azure SQL डाटाबेस

#### SKU चयन फ्रेमवर्क

1. **DTU-आधारित (डाटाबेस ट्रान्जेक्शन युनिट्स)**
   - **आधारभूत**: ५ DTU - विकास/परीक्षण
   - **मानक**: S0-S12 (१०-३००० DTU) - सामान्य उद्देश्य
   - **प्रिमियम**: P1-P15 (१२५-४००० DTU) - प्रदर्शन-क्रिटिकल

2. **vCore-आधारित** (उत्पादनका लागि सिफारिस गरिएको)
   - **सामान्य उद्देश्य**: सन्तुलित कम्प्युट र भण्डारण
   - **व्यापारिक क्रिटिकल**: कम विलम्बता, उच्च IOPS
   - **हाइपरस्केल**: अत्यधिक स्केलेबल भण्डारण (१००TB सम्म)

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

### Azure कन्टेनर एपहरू

#### वातावरण प्रकारहरू

1. **उपभोग-आधारित**
   - प्रयोग-प्रति-भुक्तानी मूल्य निर्धारण
   - विकास र परिवर्तनशील कार्यभारका लागि उपयुक्त
   - साझा पूर्वाधार

2. **समर्पित (कार्यभार प्रोफाइलहरू)**
   - समर्पित कम्प्युट स्रोतहरू
   - पूर्वानुमान योग्य प्रदर्शन
   - उत्पादन कार्यभारका लागि राम्रो

#### कन्फिगरेसन उदाहरणहरू

**विकास (उपभोग)**
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

#### थ्रूपुट मोडेलहरू

1. **म्यानुअल प्रावधान गरिएको थ्रूपुट**
   - पूर्वानुमान योग्य प्रदर्शन
   - आरक्षित क्षमता छुटहरू
   - स्थिर कार्यभारका लागि राम्रो

2. **स्वचालित स्केल प्रावधान गरिएको थ्रूपुट**
   - प्रयोगको आधारमा स्वचालित स्केलिंग
   - तपाईंले प्रयोग गर्नुभएकोको लागि मात्र भुक्तानी गर्नुहोस् (न्यूनतमसहित)
   - परिवर्तनशील कार्यभारका लागि राम्रो

3. **सर्भरलेस**
   - अनुरोध-प्रति-भुक्तानी
   - कुनै प्रावधान गरिएको थ्रूपुट छैन
   - विकास र अनियमित कार्यभारका लागि आदर्श

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

### Azure स्टोरेज खाता

#### स्टोरेज खाता प्रकारहरू

1. **Standard_LRS** - विकास, गैर-क्रिटिकल डाटा
2. **Standard_GRS** - उत्पादन, भू-पुनरावृत्ति आवश्यक
3. **Premium_LRS** - उच्च-प्रदर्शन अनुप्रयोगहरू
4. **Premium_ZRS** - क्षेत्र पुनरावृत्तिसहित उच्च उपलब्धता

#### प्रदर्शन स्तरहरू

- **मानक**: सामान्य उद्देश्य, लागत-प्रभावकारी
- **प्रिमियम**: उच्च-प्रदर्शन, कम विलम्बता परिदृश्यहरू

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

### १. आरक्षित क्षमता

१-३ वर्षका लागि स्रोतहरू आरक्षित गरेर महत्वपूर्ण छुटहरू प्राप्त गर्नुहोस्:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### २. सही आकार निर्धारण

साना SKUs बाट सुरु गर्नुहोस् र वास्तविक प्रयोगको आधारमा स्केल गर्नुहोस्:

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

### ३. स्वचालित स्केलिंग कन्फिगरेसन

लागत अनुकूलन गर्न बुद्धिमानी स्केलिंग कार्यान्वयन गर्नुहोस्:

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

### ४. निर्धारित स्केलिंग

अफ-घण्टामा स्केल डाउन गर्नुहोस्:

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

## प्रदर्शन विचारहरू

### आधारभूत प्रदर्शन आवश्यकताहरू

SKU चयन अघि स्पष्ट प्रदर्शन आवश्यकताहरू परिभाषित गर्नुहोस्:

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

प्रदर्शन मान्यता गर्न विभिन्न SKUs परीक्षण गर्नुहोस्:

```bash
# Azure Load Testing service
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

## द्रुत सन्दर्भ तालिकाहरू

### एप सेवा SKU द्रुत सन्दर्भ

| SKU | स्तर | vCPU | RAM | भण्डारण | मूल्य दायरा | प्रयोग केस |
|-----|------|------|-----|---------|-------------|----------|
| F1 | नि:शुल्क | साझा | १GB | १GB | नि:शुल्क | विकास |
| B1 | आधारभूत | १ | १.७५GB | १०GB | $ | साना एपहरू |
| S1 | मानक | १ | १.७५GB | ५०GB | $$ | उत्पादन |
| P1V3 | प्रिमियम V3 | २ | ८GB | २५०GB | $$$ | उच्च प्रदर्शन |
| I1V2 | आइसोलेटेड V2 | २ | ८GB | १TB | $$$$ | उद्यम |

### SQL डाटाबेस SKU द्रुत सन्दर्भ

| SKU | स्तर | DTU/vCore | भण्डारण | मूल्य दायरा | प्रयोग केस |
|-----|------|-----------|---------|-------------|----------|
| आधारभूत | आधारभूत | ५ DTU | २GB | $ | विकास |
| S2 | मानक | ५० DTU | २५०GB | $$ | सानो उत्पादन |
| P2 | प्रिमियम | २५० DTU | १TB | $$$ | उच्च प्रदर्शन |
| GP_Gen5_4 | सामान्य उद्देश्य | ४ vCore | ४TB | $$$ | सन्तुलित |
| BC_Gen5_8 | व्यापारिक क्रिटिकल | ८ vCore | ४TB | $$$$ | मिशन क्रिटिकल |

### कन्टेनर एप SKU द्रुत सन्दर्भ

| मोडेल | मूल्य निर्धारण | CPU/मेमोरी | प्रयोग केस |
|-------|---------------|------------|----------|
| उपभोग | प्रयोग-प्रति-भुक्तानी | ०.२५-२ vCPU | विकास, परिवर्तनशील लोड |
| समर्पित D4 | आरक्षित | ४ vCPU, १६GB | उत्पादन |
| समर्पित D8 | आरक्षित | ८ vCPU, ३२GB | उच्च प्रदर्शन |

---

## मान्यता उपकरणहरू

### SKU उपलब्धता चेकर

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

### लागत अनुमान स्क्रिप्ट

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

### प्रदर्शन मान्यता

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

## उत्कृष्ट अभ्यासहरूको सारांश

### गर्नुपर्ने

1. **सानोबाट सुरु गर्नुहोस् र वास्तविक प्रयोगको आधारमा स्केल गर्नुहोस्**
2. **विभिन्न वातावरणका लागि विभिन्न SKUs प्रयोग गर्नुहोस्**
3. **प्रदर्शन र लागत निरन्तर निगरानी गर्नुहोस्**
4. **उत्पादन कार्यभारका लागि आरक्षित क्षमता प्रयोग गर्नुहोस्**
5. **उपयुक्त ठाउँमा स्वचालित स्केलिंग लागू गर्नुहोस्**
6. **यथार्थपरक कार्यभारहरूसँग प्रदर्शन परीक्षण गर्नुहोस्**
7. **वृद्धिको योजना बनाउनुहोस् तर अत्यधिक प्रावधान नगर्नुहोस्**
8. **विकासका लागि नि:शुल्क स्तरहरू प्रयोग गर्नुहोस् जब सम्भव छ**

### नगर्नुपर्ने

1. **विकासका लागि उत्पादन SKUs प्रयोग नगर्नुहोस्**
2. **क्षेत्रीय SKU उपलब्धता बेवास्ता नगर्नुहोस्**
3. **डाटा स्थानान्तरण लागतहरू बेवास्ता नगर्नुहोस्**
4. **अत्यधिक प्रावधान बिना कारण नगर्नुहोस्**
5. **निर्णयहरू केवल मूल्यको आधारमा नगर्नुहोस्**
6. **स्वचालित स्केलिंग सीमा धेरै उच्च सेट नगर्नुहोस्**
7. **अनुपालन आवश्यकताहरू बेवास्ता नगर्नुहोस्**
8. **निर्भरता प्रभाव बेवास्ता नगर्नुहोस्**

---

**प्रो टिप**: Azure लागत व्यवस्थापन र सल्लाहकार प्रयोग गरेर वास्तविक प्रयोग ढाँचाहरूको आधारमा SKU चयनहरू अनुकूलन गर्न व्यक्तिगत सिफारिसहरू प्राप्त गर्नुहोस्।

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [क्षमता योजना](capacity-planning.md)
- **अर्को पाठ**: [पूर्व-उडान जाँच](preflight-checks.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।