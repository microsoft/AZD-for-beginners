# SKU चयन गाइड - सही Azure सेवा स्तर चुनना

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 6 - प्री-डिप्लॉयमेंट सत्यापन और योजना
- **⬅️ पिछला**: [क्षमता योजना](capacity-planning.md)
- **➡️ अगला**: [प्री-फ्लाइट चेक्स](preflight-checks.md)
- **🚀 अगला अध्याय**: [अध्याय 7: ट्रबलशूटिंग](../chapter-07-troubleshooting/common-issues.md)

## परिचय

यह व्यापक गाइड विभिन्न वातावरणों, वर्कलोड्स और आवश्यकताओं के लिए आदर्श Azure सेवा SKU (स्टॉक कीपिंग यूनिट्स) चुनने में आपकी मदद करता है। प्रदर्शन आवश्यकताओं, लागत विचारों, और स्केलेबिलिटी आवश्यकताओं का विश्लेषण सीखें ताकि आप अपने Azure Developer CLI डिप्लॉयमेंट्स के लिए सबसे उपयुक्त सेवा स्तर चुन सकें।

## सीखने के लक्ष्य

इस गाइड को पूरा करने पर आप:
- Azure SKU अवधारणाओं, मूल्य निर्धारण मॉडलों, और विशेषता भेदों को समझेंगे
- विकास, स्टेजिंग, और उत्पादन के लिए वातावरण-विशिष्ट SKU चयन रणनीतियों में निपुण होंगे
- वर्कलोड आवश्यकताओं का विश्लेषण करेंगे और उन्हें उपयुक्त सेवा स्तरों से मेल करेंगे
- बुद्धिमान SKU चयन के माध्यम से लागत अनुकूलन रणनीतियाँ लागू करेंगे
- SKU विकल्पों के लिए प्रदर्शन परीक्षण और सत्यापन तकनीकों को लागू करेंगे
- स्वचालित SKU प्रस्तावना और निगरानी कॉन्फ़िगर करेंगे

## सीखने के परिणाम

पूर्णता पर, आप सक्षम होंगे:
- वर्कलोड आवश्यकताओं और सीमाओं के आधार पर उचित Azure सेवा SKU चुनना
- उचित स्तर चयन के साथ लागत-प्रभावी मल्टी-एवंवायरमेंट आर्किटेक्चर डिज़ाइन करना
- SKU विकल्पों के लिए प्रदर्शन बेंचमार्किंग और सत्यापन लागू करना
- SKU सिफारिश और लागत अनुकूलन के लिए स्वचालित उपकरण बनाना
- बदलती आवश्यकताओं के लिए SKU माइग्रेशन और स्केलिंग रणनीतियाँ योजना बनाना
- सेवा स्तर चयन के लिए Azure वेल-आर्किटेक्टेड फ्रेमवर्क सिद्धांत लागू करना

## विषय सूची

- [SKU समझना](#understanding-skus)
- [पर्यावरण आधारित चयन](#environment-based-selection)
- [सेवा-विशिष्ट दिशानिर्देश](#service-specific-guidelines)
- [लागत अनुकूलन रणनीतियाँ](#cost-optimization-strategies)
- [प्रदर्शन विचार](#performance-considerations)
- [त्वरित संदर्भ तालिकाएँ](#quick-reference-tables)
- [सत्यापन उपकरण](#validation-tools)

---

## SKU समझना

> **उदाहरण सीमा:** नीचे YAML SKU मानचित्र और प्रदर्शन विन्यास डिज़ाइन नोट्स हैं, न कि `azure.yaml` स्कीमा या लोड-टूल कॉन्फ़िगरेशन। Bicep ब्लॉक्स विकल्प/टुकड़े हैं: उनके पैरामीटर और पैरेंट संसाधनों को घोषित करें, संयोजन करते समय अद्वितीय प्रतीकात्मक नामों का उपयोग करें, और मॉड्यूल को कार्यशील परियोजना में वायर करें। कीमतें, सीमाएं, और क्षेत्र/SKU उपलब्धता आपके सब्सक्रिप्शन के लिए तैनाती से पहले जांचनी चाहिए।

### SKU क्या हैं?

SKUs (स्टॉक कीपिंग यूनिट्स) Azure संसाधनों के लिए विभिन्न सेवा स्तरों और प्रदर्शन स्तरों का प्रतिनिधित्व करते हैं। प्रत्येक SKU अलग-अलग प्रदान करती है:

- **प्रदर्शन विशेषताएं** (CPU, मेमोरी, थ्रूपुट)
- **विशेषता उपलब्धता** (स्केलिंग विकल्प, SLA स्तर)
- **मूल्य निर्धारण मॉडल** (उपभोग-आधारित, निख़ारित क्षमता)
- **क्षेत्रीय उपलब्धता** (सभी SKU सभी क्षेत्रों में उपलब्ध नहीं)

### SKU चयन में मुख्य कारक

1. **वर्कलोड आवश्यकताएं**
   - अपेक्षित ट्रैफ़िक/लोड पैटर्न
   - प्रदर्शन आवश्यकताएं (CPU, मेमोरी, I/O)
   - संग्रहण आवश्यकताएं और पहुँच पैटर्न

2. **पर्यावरण प्रकार**
   - विकास/परीक्षण बनाम उत्पादन
   - उपलब्धता आवश्यकताएं
   - सुरक्षा और अनुपालन आवश्यकताएं

3. **बजट सीमाएँ**
   - प्रारंभिक लागत बनाम संचालन लागत
   - निख़ारित क्षमता छूट
   - स्वचालित स्केलिंग लागत प्रभाव

4. **विकास पूर्वानुमान**
   - स्केलेबिलिटी आवश्यकताएं
   - भविष्य की विशेषता आवश्यकताएं
   - माइग्रेशन जटिलता

---

## पर्यावरण आधारित चयन

### विकास पर्यावरण

**प्राथमिकताएं**: लागत अनुकूलन, बुनियादी कार्यक्षमता, आसान प्रोविजनिंग/डी-प्रोविजनिंग

#### अनुशंसित SKU
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

#### विशेषताएं
- **ऐप सेवा**: सरल परीक्षण के लिए F1 (मुफ्त) या B1 (मूल)
- **डेटाबेस**: न्यूनतम संसाधनों के साथ बुनियादी स्तर
- **संग्रहण**: केवल स्थानीय पुनरावृत्ति के साथ मानक
- **कंप्यूट**: साझा संसाधन स्वीकार्य
- **नेटवर्किंग**: बुनियादी विन्यास

### स्टेजिंग/परीक्षण पर्यावरण

**प्राथमिकताएं**: उत्पादन-जैसी कॉन्फ़िगरेशन, लागत संतुलन, प्रदर्शन परीक्षण क्षमता

#### अनुशंसित SKU
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

#### विशेषताएं
- **प्रदर्शन**: 70-80% उत्पादन क्षमता का
- **विशेषताएं**: अधिकांश उत्पादन विशेषताएं सक्षम
- **पुनरावृत्ति**: कुछ भौगोलिक पुनरावृत्ति
- **स्केलिंग**: परीक्षण के लिए सीमित स्वचालित स्केलिंग
- **निगरानी**: पूर्ण निगरानी स्टैक

### उत्पादन पर्यावरण

**प्राथमिकताएं**: प्रदर्शन, उपलब्धता, सुरक्षा, अनुपालन, स्केलेबिलिटी

#### अनुशंसित SKU
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

#### विशेषताएं
- **उच्च उपलब्धता**: 99.9%+ SLA आवश्यकताएं
- **प्रदर्शन**: समर्पित संसाधन, उच्च थ्रूपुट
- **सुरक्षा**: प्रीमियम सुरक्षा विशेषताएं
- **स्केलिंग**: पूर्ण स्वचालित स्केलिंग क्षमता
- **निगरानी**: व्यापक अवलोकनीयता

---

## सेवा-विशिष्ट दिशानिर्देश

### Azure ऐप सेवा

#### SKU निर्णय मैट्रिक्स

| उपयोग मामला | अनुशंसित SKU | कारण |
|----------|----------------|-----------|
| विकास/परीक्षण | F1 (मुफ्त) या B1 (मूल) | लागत-प्रभावी, परीक्षण के लिए पर्याप्त |
| छोटे उत्पादन ऐप्स | S1 (मानक) | कस्टम डोमेन, SSL, स्वचालित स्केलिंग |
| मध्यम उत्पादन ऐप्स | P1V3 (प्रीमियम V3) | बेहतर प्रदर्शन, अधिक विशेषताएं |
| उच्च ट्रैफ़िक ऐप्स | P2V3 या P3V3 | समर्पित संसाधन, उच्च प्रदर्शन |
| मिशन-क्रिटिकल ऐप्स | I1V2 (आइसोलेटेड V2) | नेटवर्क पृथक्करण, समर्पित हार्डवेयर |

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

1. **DTU-आधारित (डेटाबेस ट्रांजैक्शन यूनिट्स)**
   - **बेसिक**: 5 DTU - विकास/परीक्षण
   - **मानक**: S0-S12 (10-3000 DTU) - सामान्य प्रयोजन
   - **प्रीमियम**: P1-P15 (125-4000 DTU) - प्रदर्शन-संवेदनशील

2. **vCore-आधारित** (उत्पादन के लिए अनुशंसित)
   - **सामान्य प्रयोजन**: संतुलित कंप्यूट और संग्रहण
   - **बिजनेस क्रिटिकल**: कम विलंबता, उच्च IOPS
   - **हाइपरस्केल**: अत्यधिक स्केलेबल संग्रहण; वर्तमान आकार सीमाओं और क्षेत्रीय समर्थन की जांच करें

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

#### पर्यावरण प्रकार

1. **उपभोग-आधारित**
   - उपयोग के अनुसार भुगतान
   - विकास और परिवर्तनीय वर्कलोड्स के लिए उपयुक्त
   - साझा आधारभूत संरचना

2. **समर्पित (वर्कलोड प्रोफाइल)**
   - समर्पित कंप्यूट संसाधन
   - पूर्वानुमेय प्रदर्शन
   - उत्पादन वर्कलोड्स के लिए बेहतर

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

**उत्पादन (समर्पित)**
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

ज़ोन पुनरावृत्ति के लिए समर्थित-क्षेत्र आधारभूत संरचना और उपयुक्त VNet/सबनेट कॉन्फ़िगरेशन भी आवश्यक है, जो यहाँ छोड़ा गया है। यह उदाहरण तीन समर्पित नोड बजट करता है; क्रॉस-ज़ोन वितरण के लिए कम से कम दो ऐप प्रतियों को कॉन्फ़िगर करें और ज़ोन विफलता के लिए प्रतिलिपियों और नोड दोनों का आकार निर्धारित करें। देखें [कंटेनर ऐप्स विश्वसनीयता दिशानिर्देश](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps)। इस प्रोफ़ाइल पर एक ऐप लगाने के लिए, इसका `workloadProfileName: 'production-profile'` सेट करें; केवल प्रोफ़ाइल बनाना ऐप को इसमें नहीं ले जाता।

### Azure कॉसमॉस DB

#### थ्रूपुट मॉडल

1. **मैनुअल प्रोविजन थ्रूपुट**
   - पूर्वानुमेय प्रदर्शन
   - निख़ारित क्षमता छूट
   - स्थिर वर्कलोड्स के लिए सर्वोत्तम

2. **ऑटोस्केल प्रोविजन थ्रूपुट**
   - उपयोग के आधार पर स्वचालित स्केलिंग
   - उपयोग के अनुसार भुगतान (न्यूनतम के साथ)
   - परिवर्तनीय वर्कलोड्स के लिए अच्छा

3. **सर्वरलेस**
   - प्रति अनुरोध भुगतान
   - कोई प्रोविजन थ्रूपुट नहीं
   - विकास और अस्थायी वर्कलोड के लिए आदर्श

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

1. **Standard_LRS** - विकास, गैर-महत्वपूर्ण डेटा
2. **Standard_GRS** - उत्पादन, ज्यो-रिडंडेंसी आवश्यक
3. **Premium_LRS** - उच्च प्रदर्शन वाले अनुप्रयोग
4. **Premium_ZRS** - उच्च उपलब्धता के साथ ज़ोन रिडंडेंसी

#### प्रदर्शन स्तर

- **मानक**: सामान्य प्रयोजन, लागत-प्रभावी
- **प्रीमियम**: उच्च प्रदर्शन, कम विलंबता वाले परिदृश्य

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

### 1. निख़ारित क्षमता

1-3 वर्षों के लिए संसाधन आरक्षित करें और महत्वपूर्ण छूट पाएं:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

आरक्षण ऑफ़रिंग्स और पात्र संसाधन प्रकार अलग-अलग होते हैं; हर सेवा/SKU में आरक्षण का समर्थन होने का अनुमान लगाने के बजाय कैटलॉग और खरीद शर्तों की जांच करें।

### 2. सही आकार निर्धारण

छोटे SKU से शुरू करें और वास्तविक उपयोग के आधार पर स्केल करें:

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

लागतों को अनुकूलित करने के लिए बुद्धिमान स्केलिंग लागू करें:

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

### 4. अनुसूचित स्केलिंग

ऑफ-आवर्स के दौरान स्केल डाउन करें:

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

### आधारभूत प्रदर्शन आवश्यकताएं

SKU चयन से पहले स्पष्ट प्रदर्शन आवश्यकताएं परिभाषित करें:

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

प्रदर्शन सत्यापित करने के लिए विभिन्न SKU का परीक्षण करें:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
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

## त्वरित संदर्भ तालिकाएँ

### ऐप सेवा SKU त्वरित संदर्भ

| SKU | स्तर | vCPU | RAM | संग्रहण | मूल्य सीमा | उपयोग मामला |
|-----|------|------|-----|---------|-------------|----------|
| F1 | मुफ्त | साझा | 1GB | 1GB | मुफ्त | विकास |
| B1 | मूल | 1 | 1.75GB | 10GB | $ | छोटे ऐप्स |
| S1 | मानक | 1 | 1.75GB | 50GB | $$ | उत्पादन |
| P1V3 | प्रीमियम V3 | 2 | 8GB | 250GB | $$$ | उच्च प्रदर्शन |
| I1V2 | आइसोलेटेड V2 | 2 | 8GB | 1TB | $$$$ | उद्यम |

### SQL डेटाबेस SKU त्वरित संदर्भ

| SKU | स्तर | DTU/vCore | संग्रहण | मूल्य सीमा | उपयोग मामला |
|-----|------|-----------|---------|-------------|----------|
| बेसिक | बेसिक | 5 DTU | 2GB | $ | विकास |
| S2 | मानक | 50 DTU | 250GB | $$ | छोटे उत्पादन |
| P2 | प्रीमियम | 250 DTU | 1TB | $$$ | उच्च प्रदर्शन |
| GP_Gen5_4 | सामान्य प्रयोजन | 4 vCore | 4TB | $$$ | संतुलित |
| BC_Gen5_8 | बिजनेस क्रिटिकल | 8 vCore | 4TB | $$$$ | मिशन-क्रिटिकल |

### कंटेनर ऐप्स SKU त्वरित संदर्भ

| मॉडल | मूल्य निर्धारण | CPU/मेमोरी | उपयोग मामला |
|-------|---------|------------|----------|
| उपभोग | उपयोग के अनुसार भुगतान | समर्थित CPU/मेमोरी संयोजन पर्यावरण/प्रोफ़ाइल पर निर्भर | विकास या उत्पादन, परिवर्तनीय लोड |
| समर्पित D4 | समर्पित नोड बिलिंग | 4 vCPU, 16GiB प्रति नोड | निरंतर लोड/पृथक्करण आवश्यकताएं |
| समर्पित D8 | समर्पित नोड बिलिंग | 8 vCPU, 32GiB प्रति नोड | उच्च निरंतर लोड |

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

### लागत अनुमान स्क्रिप्ट

**केवल छद्मकोड:** नीचे `Get-ResourceCost` एक परियोजना-विशिष्ट फ़ंक्शन है जिसे आपको वर्तमान क्षेत्रीय/अनुबंध मूल्य निर्धारण और उपयोग अनुमानों के साथ लागू करना होगा। यह PowerShell या Azure cmdlet नहीं है।

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

निम्न YAML एक आवश्यकताओं का स्केच है, **नहीं** Azure Load Testing, JMeter, Locust, या k6 इनपुट स्कीमा। इसके उपयोग से पहले इसे अपने चयनित टूल के वास्तविक कॉन्फ़िगरेशन में अनुवाद करें।

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

## सर्वोत्तम प्रथाएँ सारांश

### करें

1. **छोटे से शुरू करें और वास्तविक उपयोग के आधार पर स्केल करें**
2. **विभिन्न वातावरणों के लिए विभिन्न SKU का उपयोग करें**
3. **प्रदर्शन और लागत की लगातार निगरानी करें**
4. **उत्पादन वर्कलोड के लिए निख़ारित क्षमता का लाभ उठाएं**
5. **जहाँ उचित हो स्वचालित स्केलिंग लागू करें**
6. **यथार्थवादी वर्कलोड के साथ प्रदर्शन परीक्षण करें**
7. **विकास के लिए योजना बनाएं लेकिन अधिक आवंटन से बचें**
8. **संभावित विकास के लिए मुफ्त स्तर का उपयोग करें**

### न करें

1. **विकास के लिए उत्पादन SKU का उपयोग न करें**
2. **क्षेत्रीय SKU उपलब्धता को नजरअंदाज न करें**
3. **डेटा ट्रांसफर लागतों को न भूलें**
4. **बिना उचित कारण के अधिक आवंटन न करें**
5. **निर्भरता के प्रभाव को न अवहेलना करें**
6. **ऑटो-स्केलिंग सीमा बहुत उच्च सेट न करें**
7. **अनुपालन आवश्यकताओं को न भूलें**
8. **मूल्य के आधार पर अकेले निर्णय न लें**

---

**प्रो टिप**: Azure कॉस्ट मैनेजमेंट और एडवाइजर का उपयोग करें ताकि आपके SKU चयन को वास्तविक उपयोग पैटर्न के आधार पर अनुकूलित करने के लिए व्यक्तिगत सिफारिशें मिल सकें।

---

**नेविगेशन**
- **पिछला पाठ**: [क्षमता योजना](capacity-planning.md)
- **अगला पाठ**: [प्रीफ्लाइट चेक्स](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->