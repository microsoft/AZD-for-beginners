<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T17:29:08+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "hi"
}
-->
# SKU चयन गाइड - सही Azure सेवा स्तर चुनना

## परिचय

यह व्यापक गाइड आपको विभिन्न वातावरणों, कार्यभार, और आवश्यकताओं के लिए आदर्श Azure सेवा SKUs (स्टॉक कीपिंग यूनिट्स) चुनने में मदद करता है। प्रदर्शन आवश्यकताओं, लागत विचारों, और स्केलेबिलिटी आवश्यकताओं का विश्लेषण करना सीखें ताकि आप अपने Azure Developer CLI डिप्लॉयमेंट्स के लिए सबसे उपयुक्त सेवा स्तर चुन सकें।

## सीखने के लक्ष्य

इस गाइड को पूरा करने के बाद, आप:
- Azure SKU की अवधारणाओं, मूल्य निर्धारण मॉडल, और फीचर अंतर को समझेंगे
- विकास, स्टेजिंग, और उत्पादन के लिए वातावरण-विशिष्ट SKU चयन रणनीतियों में महारत हासिल करेंगे
- कार्यभार आवश्यकताओं का विश्लेषण करेंगे और उन्हें उपयुक्त सेवा स्तरों से मिलाएंगे
- बुद्धिमान SKU चयन के माध्यम से लागत अनुकूलन रणनीतियों को लागू करेंगे
- SKU विकल्पों के लिए प्रदर्शन परीक्षण और सत्यापन तकनीकों को लागू करेंगे
- स्वचालित SKU अनुशंसाओं और निगरानी को कॉन्फ़िगर करेंगे

## सीखने के परिणाम

गाइड पूरा करने के बाद, आप सक्षम होंगे:
- कार्यभार आवश्यकताओं और सीमाओं के आधार पर उपयुक्त Azure सेवा SKUs का चयन करना
- सही स्तर चयन के साथ लागत प्रभावी बहु-वातावरण आर्किटेक्चर डिज़ाइन करना
- SKU विकल्पों के लिए प्रदर्शन बेंचमार्किंग और सत्यापन लागू करना
- SKU अनुशंसा और लागत अनुकूलन के लिए स्वचालित उपकरण बनाना
- बदलती आवश्यकताओं के लिए SKU माइग्रेशन और स्केलिंग रणनीतियों की योजना बनाना
- Azure Well-Architected Framework सिद्धांतों को सेवा स्तर चयन में लागू करना

## सामग्री तालिका

- [SKUs को समझना](../../../../docs/pre-deployment)
- [वातावरण-आधारित चयन](../../../../docs/pre-deployment)
- [सेवा-विशिष्ट दिशानिर्देश](../../../../docs/pre-deployment)
- [लागत अनुकूलन रणनीतियाँ](../../../../docs/pre-deployment)
- [प्रदर्शन विचार](../../../../docs/pre-deployment)
- [त्वरित संदर्भ तालिकाएँ](../../../../docs/pre-deployment)
- [सत्यापन उपकरण](../../../../docs/pre-deployment)

---

## SKUs को समझना

### SKUs क्या हैं?

SKUs (स्टॉक कीपिंग यूनिट्स) Azure संसाधनों के लिए विभिन्न सेवा स्तरों और प्रदर्शन स्तरों का प्रतिनिधित्व करते हैं। प्रत्येक SKU विभिन्न प्रदान करता है:

- **प्रदर्शन विशेषताएँ** (CPU, मेमोरी, थ्रूपुट)
- **फीचर उपलब्धता** (स्केलिंग विकल्प, SLA स्तर)
- **मूल्य निर्धारण मॉडल** (उपभोग-आधारित, आरक्षित क्षमता)
- **क्षेत्रीय उपलब्धता** (सभी SKUs सभी क्षेत्रों में उपलब्ध नहीं हैं)

### SKU चयन में प्रमुख कारक

1. **कार्यभार आवश्यकताएँ**
   - अपेक्षित ट्रैफ़िक/लोड पैटर्न
   - प्रदर्शन आवश्यकताएँ (CPU, मेमोरी, I/O)
   - स्टोरेज आवश्यकताएँ और एक्सेस पैटर्न

2. **वातावरण प्रकार**
   - विकास/परीक्षण बनाम उत्पादन
   - उपलब्धता आवश्यकताएँ
   - सुरक्षा और अनुपालन आवश्यकताएँ

3. **बजट सीमाएँ**
   - प्रारंभिक लागत बनाम परिचालन लागत
   - आरक्षित क्षमता छूट
   - ऑटो-स्केलिंग लागत प्रभाव

4. **विकास प्रक्षेपण**
   - स्केलेबिलिटी आवश्यकताएँ
   - भविष्य की फीचर आवश्यकताएँ
   - माइग्रेशन जटिलता

---

## वातावरण-आधारित चयन

### विकास वातावरण

**प्राथमिकताएँ**: लागत अनुकूलन, बुनियादी कार्यक्षमता, आसान प्रोविजनिंग/डी-प्रोविजनिंग

#### अनुशंसित SKUs
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
- **ऐप सेवा**: F1 (फ्री) या B1 (बेसिक) साधारण परीक्षण के लिए
- **डेटाबेस**: न्यूनतम संसाधनों के साथ बेसिक स्तर
- **स्टोरेज**: केवल स्थानीय रेडंडेंसी के साथ स्टैंडर्ड
- **कंप्यूट**: साझा संसाधन स्वीकार्य
- **नेटवर्किंग**: बुनियादी कॉन्फ़िगरेशन

### स्टेजिंग/परीक्षण वातावरण

**प्राथमिकताएँ**: उत्पादन-जैसा कॉन्फ़िगरेशन, लागत संतुलन, प्रदर्शन परीक्षण क्षमता

#### अनुशंसित SKUs
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
- **प्रदर्शन**: उत्पादन क्षमता का 70-80%
- **फीचर**: अधिकांश उत्पादन फीचर सक्षम
- **रेडंडेंसी**: कुछ भौगोलिक रेडंडेंसी
- **स्केलिंग**: परीक्षण के लिए सीमित ऑटो-स्केलिंग
- **निगरानी**: पूर्ण निगरानी स्टैक

### उत्पादन वातावरण

**प्राथमिकताएँ**: प्रदर्शन, उपलब्धता, सुरक्षा, अनुपालन, स्केलेबिलिटी

#### अनुशंसित SKUs
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
- **सुरक्षा**: प्रीमियम सुरक्षा फीचर
- **स्केलिंग**: पूर्ण ऑटो-स्केलिंग क्षमताएँ
- **निगरानी**: व्यापक अवलोकन

---

## सेवा-विशिष्ट दिशानिर्देश

### Azure ऐप सेवा

#### SKU निर्णय मैट्रिक्स

| उपयोग का मामला | अनुशंसित SKU | कारण |
|----------------|--------------|-------|
| विकास/परीक्षण | F1 (फ्री) या B1 (बेसिक) | लागत प्रभावी, परीक्षण के लिए पर्याप्त |
| छोटे उत्पादन ऐप्स | S1 (स्टैंडर्ड) | कस्टम डोमेन, SSL, ऑटो-स्केलिंग |
| मध्यम उत्पादन ऐप्स | P1V3 (प्रीमियम V3) | बेहतर प्रदर्शन, अधिक फीचर |
| उच्च ट्रैफ़िक ऐप्स | P2V3 या P3V3 | समर्पित संसाधन, उच्च प्रदर्शन |
| मिशन-क्रिटिकल ऐप्स | I1V2 (आइसोलेटेड V2) | नेटवर्क आइसोलेशन, समर्पित हार्डवेयर |

#### कॉन्फ़िगरेशन उदाहरण

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

### Azure SQL डेटाबेस

#### SKU चयन फ्रेमवर्क

1. **DTU-आधारित (डेटाबेस ट्रांजेक्शन यूनिट्स)**
   - **बेसिक**: 5 DTU - विकास/परीक्षण
   - **स्टैंडर्ड**: S0-S12 (10-3000 DTU) - सामान्य उद्देश्य
   - **प्रीमियम**: P1-P15 (125-4000 DTU) - प्रदर्शन-क्रिटिकल

2. **vCore-आधारित** (उत्पादन के लिए अनुशंसित)
   - **सामान्य उद्देश्य**: संतुलित कंप्यूट और स्टोरेज
   - **बिजनेस क्रिटिकल**: कम विलंबता, उच्च IOPS
   - **हाइपरस्केल**: अत्यधिक स्केलेबल स्टोरेज (100TB तक)

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

### Azure कंटेनर ऐप्स

#### वातावरण प्रकार

1. **उपभोग-आधारित**
   - उपयोग-आधारित मूल्य निर्धारण
   - विकास और परिवर्तनशील कार्यभार के लिए उपयुक्त
   - साझा बुनियादी ढांचा

2. **समर्पित (कार्यभार प्रोफाइल)**
   - समर्पित कंप्यूट संसाधन
   - पूर्वानुमानित प्रदर्शन
   - उत्पादन कार्यभार के लिए बेहतर

#### कॉन्फ़िगरेशन उदाहरण

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

#### थ्रूपुट मॉडल

1. **मैनुअल प्रोविजन्ड थ्रूपुट**
   - पूर्वानुमानित प्रदर्शन
   - आरक्षित क्षमता छूट
   - स्थिर कार्यभार के लिए सर्वश्रेष्ठ

2. **ऑटोस्केल प्रोविजन्ड थ्रूपुट**
   - उपयोग के आधार पर स्वचालित स्केलिंग
   - उपयोग के लिए भुगतान करें (न्यूनतम के साथ)
   - परिवर्तनशील कार्यभार के लिए अच्छा

3. **सर्वरलेस**
   - प्रति-रिक्वेस्ट भुगतान
   - कोई प्रोविजन्ड थ्रूपुट नहीं
   - विकास और अस्थायी कार्यभार के लिए आदर्श

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

### Azure स्टोरेज अकाउंट

#### स्टोरेज अकाउंट प्रकार

1. **Standard_LRS** - विकास, गैर-क्रिटिकल डेटा
2. **Standard_GRS** - उत्पादन, भू-रेडंडेंसी आवश्यक
3. **Premium_LRS** - उच्च-प्रदर्शन एप्लिकेशन
4. **Premium_ZRS** - उच्च उपलब्धता के साथ ज़ोन रेडंडेंसी

#### प्रदर्शन स्तर

- **स्टैंडर्ड**: सामान्य उद्देश्य, लागत प्रभावी
- **प्रीमियम**: उच्च-प्रदर्शन, कम विलंबता परिदृश्य

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

### 1. आरक्षित क्षमता

1-3 वर्षों के लिए संसाधन आरक्षित करें ताकि महत्वपूर्ण छूट प्राप्त हो:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. सही आकार देना

छोटे SKUs से शुरू करें और वास्तविक उपयोग के आधार पर स्केल करें:

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

### 4. अनुसूचित स्केलिंग

ऑफ-ऑवर्स के दौरान स्केल डाउन करें:

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

## प्रदर्शन विचार

### आधारभूत प्रदर्शन आवश्यकताएँ

SKU चयन से पहले स्पष्ट प्रदर्शन आवश्यकताओं को परिभाषित करें:

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

प्रदर्शन को सत्यापित करने के लिए विभिन्न SKUs का परीक्षण करें:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### निगरानी और अनुकूलन

व्यापक निगरानी सेट करें:

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

### ऐप सेवा SKU त्वरित संदर्भ

| SKU | स्तर | vCPU | RAM | स्टोरेज | मूल्य सीमा | उपयोग का मामला |
|-----|------|------|-----|---------|-------------|----------------|
| F1 | फ्री | साझा | 1GB | 1GB | फ्री | विकास |
| B1 | बेसिक | 1 | 1.75GB | 10GB | $ | छोटे ऐप्स |
| S1 | स्टैंडर्ड | 1 | 1.75GB | 50GB | $$ | उत्पादन |
| P1V3 | प्रीमियम V3 | 2 | 8GB | 250GB | $$$ | उच्च प्रदर्शन |
| I1V2 | आइसोलेटेड V2 | 2 | 8GB | 1TB | $$$$ | एंटरप्राइज़ |

### SQL डेटाबेस SKU त्वरित संदर्भ

| SKU | स्तर | DTU/vCore | स्टोरेज | मूल्य सीमा | उपयोग का मामला |
|-----|------|-----------|---------|-------------|----------------|
| बेसिक | बेसिक | 5 DTU | 2GB | $ | विकास |
| S2 | स्टैंडर्ड | 50 DTU | 250GB | $$ | छोटे उत्पादन |
| P2 | प्रीमियम | 250 DTU | 1TB | $$$ | उच्च प्रदर्शन |
| GP_Gen5_4 | सामान्य उद्देश्य | 4 vCore | 4TB | $$$ | संतुलित |
| BC_Gen5_8 | बिजनेस क्रिटिकल | 8 vCore | 4TB | $$$$ | मिशन क्रिटिकल |

### कंटेनर ऐप्स SKU त्वरित संदर्भ

| मॉडल | मूल्य निर्धारण | CPU/मेमोरी | उपयोग का मामला |
|------|---------------|------------|----------------|
| उपभोग | उपयोग-आधारित | 0.25-2 vCPU | विकास, परिवर्तनशील लोड |
| समर्पित D4 | आरक्षित | 4 vCPU, 16GB | उत्पादन |
| समर्पित D8 | आरक्षित | 8 vCPU, 32GB | उच्च प्रदर्शन |

---

## सत्यापन उपकरण

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

## सर्वोत्तम प्रथाओं का सारांश

### करें

1. **छोटे से शुरू करें और वास्तविक उपयोग के आधार पर स्केल करें**
2. **विभिन्न वातावरणों के लिए अलग-अलग SKUs का उपयोग करें**
3. **प्रदर्शन और लागत को लगातार मॉनिटर करें**
4. **उत्पादन कार्यभार के लिए आरक्षित क्षमता का लाभ उठाएं**
5. **जहाँ उपयुक्त हो, ऑटो-स्केलिंग लागू करें**
6. **यथार्थवादी कार्यभार के साथ प्रदर्शन का परीक्षण करें**
7. **विकास की योजना बनाएं लेकिन अति-प्रोविजनिंग से बचें**
8. **विकास के लिए मुफ्त स्तरों का उपयोग करें जब संभव हो**

### न करें

1. **विकास के लिए उत्पादन SKUs का उपयोग न करें**
2. **क्षेत्रीय SKU उपलब्धता को नज़रअंदाज़ न करें**
3. **डेटा ट्रांसफर लागत को नज़रअंदाज़ न करें**
4. **बिना कारण अति-प्रोविजनिंग न करें**
5. **निर्णय लेते समय निर्भरता के प्रभाव को नज़रअंदाज़ न करें**
6. **ऑटो-स्केलिंग सीमा बहुत अधिक सेट न करें**
7. **अनुपालन आवश्यकताओं को नज़रअंदाज़ न करें**
8. **केवल कीमत के आधार पर निर्णय न लें**

---

**प्रो टिप**: Azure Cost Management और Advisor का उपयोग करें ताकि वास्तविक उपयोग पैटर्न के आधार पर SKU चयन को अनुकूलित करने के लिए व्यक्तिगत अनुशंसाएँ प्राप्त की जा सकें।

---

**नेविगेशन**
- **पिछला पाठ**: [क्षमता योजना](capacity-planning.md)
- **अगला पाठ**: [प्रीफ्लाइट चेक्स](preflight-checks.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।