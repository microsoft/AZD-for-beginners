# SKU चयन मार्गदर्शिका - सही Azure सेवा तहहरू चयन गर्दै

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 6 - प्री-डिप्लोयमेन्ट प्रमाणीकरण र योजना बनाउने
- **⬅️ अघिल्लो**: [क्षमता योजना](capacity-planning.md)
- **➡️ अर्को**: [प्री-फ्लाइट जाँचहरू](preflight-checks.md)
- **🚀 अर्को अध्याय**: [अध्याय 7: समस्या समाधान](../chapter-07-troubleshooting/common-issues.md)

## परिचय

यो व्यापक मार्गदर्शिकाले विभिन्न वातावरणहरू, कार्यभारहरू, र आवश्यकताहरूका लागि उपयुक्त Azure सेवा SKU (स्टक कीपिंग युनिटहरू) चयन गर्न तपाईंलाई सहयोग गर्दछ। प्रदर्शन आवश्यकताहरू, लागत विचार, र स्केलेबिलिटी आवश्यकताहरू विश्लेषण गर्न सिक्नुहोस् ताकि तपाईंका Azure Developer CLI डिप्लोयमेन्टहरूको लागि सबैभन्दा उपयुक्त सेवा तहहरू चयन गर्न सकुन्।

## सिकाइ लक्ष्यहरू

यस मार्गदर्शिका पूरा गरेपछि, तपाईं:
- Azure SKU अवधारणाहरू, मूल्य निर्धारण मोडेलहरू, र सुविधाहरूको भिन्नता बुझ्न सक्नुहुनेछ
- विकास, स्टेजिङ, र उत्पादनका लागि वातावरण-विशेष SKU चयन रणनीतिहरूमा निपूर्ण हुनुहुनेछ
- कार्यभार आवश्यकताहरू विश्लेषण गरी तिनीहरूलाई उपयुक्त सेवा तहसँग मेल गर्ने सक्नुहुनेछ
- समझदार SKU चयन मार्फत लागत अनुकूलन रणनीतिहरू लागू गर्न सक्नुहुनेछ
- SKU विकल्पहरूको लागि प्रदर्शन परीक्षण र प्रमाणीकरण प्रविधिहरू लागू गर्न सक्नुहुनेछ
- स्वचालित SKU सिफारिस र निगरानी कन्फिगर गर्न सक्नुहुनेछ

## सिकाइ नतिजाहरू

पूरा भएपछि, तपाईं सक्षम हुनुहुनेछ:
- कार्यभार आवश्यकताहरू र सीमाहरूको आधारमा उपयुक्त Azure सेवा SKUs चयन गर्न
- उचित तह चयनका साथ लागत-प्रभावी बहु-पर्यावरण आर्किटेक्चर डिजाइन गर्न
- SKU विकल्पहरूको लागि प्रदर्शन मापन र प्रमाणीकरण कार्यान्वयन गर्न
- SKU सिफारिस र लागत अनुकूलनका लागि स्वचालित उपकरणहरू सिर्जना गर्न
- परिवर्तनशील आवश्यकताहरूका लागि SKU माइग्रेशन र स्केलिंग रणनीतिहरू योजना बनाउन
- सेवा तह चयनमा Azure Well-Architected Framework सिद्धान्तहरू लागू गर्न

## सामग्रीको तालिका

- [SKU बुझ्न](#understanding-skus)
- [वातावरण-आधारित चयन](#environment-based-selection)
- [सेवा-विशेष निर्देशिका](#service-specific-guidelines)
- [लागत अनुकूलन रणनीतिहरू](#cost-optimization-strategies)
- [प्रदर्शन विचारहरू](#performance-considerations)
- [छिटो सन्दर्भ तालिकाहरू](#quick-reference-tables)
- [प्रमाणीकरण उपकरणहरू](#validation-tools)

---

## SKU बुझ्न

> **उदाहरण दायरा:** तलका YAML SKU नक्साहरू र प्रदर्शन कन्फिगरेसनहरू डिजाइन नोटहरू हुन्, `azure.yaml` स्किम वा लोड-टुल कन्फिगरेसन होइन। बाइसेप ब्लकहरू विकल्प / अंशहरू हुन्: तिनीहरूका प्यारामिटरहरू र अभिभावक स्रोतहरू घोषणा गर्नुहोस्, जब तिनीहरूलाई संयोजन गर्दै हुनुहुन्छ तब अद्वितीय प्रतीकात्मक नामहरू प्रयोग गर्नुहोस्, र मोड्युलहरूलाई कार्यरत परियोजनामा वायर गर्नुहोस्। मूल्य, सीमाहरू, र क्षेत्र / SKU उपलब्धता तपाईंको सदस्यताका लागि परिनियोजन अघि जाँच्नुपर्छ।

### SKU के हुन्?

SKU (Stock Keeping Units) Azure स्रोतहरूको लागि विभिन्न सेवा तहहरू र प्रदर्शन स्तरहरू प्रतिनिधित्व गर्छन्। प्रत्येक SKU ले फरक:

- **प्रदर्शन विशेषताहरू** (CPU, मेमोरी, थ्रुपुट)
- **विशेषता उपलब्धता** (स्केलिङ विकल्पहरू, SLA स्तरहरू)
- **मूल्य निर्धारण मोडेलहरू** (उपभोग-आधारित, आरक्षित क्षमता)
- **क्षेत्रीय उपलब्धता** (सबै क्षेत्रहरूमा सबै SKU उपलब्ध हुँदैनन्)

### SKU चयनका मुख्य कारकहरू

1. **कार्यभार आवश्यकताहरू**
   - अपेक्षित ट्राफिक/लोड ढाँचाहरू
   - प्रदर्शन आवश्यकताहरू (CPU, मेमोरी, I/O)
   - भण्डारण आवश्यकताहरू र पहुँच ढाँचाहरू

2. **वातावरण प्रकार**
   - विकास/टेस्टिङ विरुद्ध उत्पादन
   - उपलब्धता आवश्यकताहरू
   - सुरक्षा र अनुपालन आवश्यकताहरू

3. **बजेट सीमाहरू**
   - सुरुमा लागतहरू बनाम सञ्चालन लागतहरू
   - आरक्षित क्षमता छुटहरू
   - अटो-स्केलिङ लागत प्रभावहरू

4. **वृद्धि प्रक्षेपणहरू**
   - स्केलेबिलिटी आवश्यकताहरू
   - भविष्यका फीचर आवश्यकताहरू
   - माइग्रेशन जटिलता

---

## वातावरण-आधारित चयन

### विकास वातावरण

**प्राथमिकताहरू**: लागत अनुकूलन, आधारभूत कार्यक्षमता, सजिलो प्रावधान / डी-प्रावधान

#### सिफारिस गरिएका SKU हरू
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

#### विशेषताहरू
- **एप सेवा**: सरल परीक्षणका लागि F1 (नि:शुल्क) वा B1 (आधारभूत)
- **डाटाबेसहरू**: न्यूनतम स्रोतका साथ आधारभूत तह
- **भण्डारण**: स्थानीय लालुसी वितरणसहित सामान्य स्तर
- **कम्प्युट**: साझा स्रोतहरू स्वीकार्य
- **नेटवर्किङ**: आधारभूत कन्फिगरेसनहरू

### स्टेजिङ/टेस्टिङ वातावरण

**प्राथमिकताहरू**: उत्पादन-जस्तो कन्फिगरेसन, लागत सन्तुलन, प्रदर्शन परीक्षण क्षमता

#### सिफारिस गरिएका SKU हरू
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
- **फीचरहरू**: धेरैजसो उत्पादन सुविधाहरू सक्षम
- **लालुसी वितरण**: केही भौगोलिक लालुसी वितरण
- **स्केलिङ**: परीक्षणको लागि सीमित अटो-स्केलिङ
- **निगरानी**: पूर्ण निगरानी स्ट्याक

### उत्पादन वातावरण

**प्राथमिकताहरू**: प्रदर्शन, उपलब्धता, सुरक्षा, अनुपालन, स्केलेबिलिटी

#### सिफारिस गरिएका SKU हरू
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

#### विशेषताहरू
- **उच्च उपलब्धता**: ९९.९%+ SLA आवश्यकताहरू
- **प्रदर्शन**: समर्पित स्रोतहरू, उच्च थ्रुपुट
- **सुरक्षा**: प्रिमियम सुरक्षा सुविधाहरू
- **स्केलिङ**: पूर्ण अटो-स्केलिङ क्षमताहरू
- **निगरानी**: व्यापक अवलोकनक्षमता

---

## सेवा-विशेष निर्देशिका

### Azure एप सेवा

#### SKU निर्णय म्याट्रिक्स

| प्रयोग केस | सिफारिस गरिएको SKU | कारण |
|----------|----------------|-----------|
| विकास/परीक्षण | F1 (नि:शुल्क) वा B1 (आधारभूत) | लागत-प्रभावी, परीक्षणका लागि पर्याप्त |
| साना उत्पादन एपहरू | S1 (मानक) | कस्टम डोमेनहरू, SSL, अटो-स्केलिङ |
| मध्यम उत्पादन एपहरू | P1V3 (प्रिमियम V3) | राम्रो प्रदर्शन, बढी सुविधाहरू |
| उच्च-ट्राफिक एपहरू | P2V3 वा P3V3 | समर्पित स्रोतहरू, उच्च प्रदर्शन |
| मिशन-महत्त्वपूर्ण एपहरू | I1V2 (आइसोलेटेड V2) | नेटवर्क अलगाव, समर्पित हार्डवेयर |

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

1. **DTU-आधारित (डाटाबेस ट्रान्जेक्शन युनिटहरू)**
   - **आधारभूत**: 5 DTU - विकास/परीक्षण
   - **मानक**: S0-S12 (10-3000 DTU) - सामान्य प्रयोजन
   - **प्रिमियम**: P1-P15 (125-4000 DTU) - प्रदर्शन-महत्त्वपूर्ण

2. **vCore-आधारित** (उत्पादनका लागि सिफारिस गरिएको)
   - **सामान्य प्रयोजन**: सन्तुलित कम्प्युट र भण्डारण
   - **व्यापार-महत्त्वपूर्ण**: कम विलम्बता, उच्च IOPS
   - **हाइपरस्केल**: अत्यधिक स्केलेबल भण्डारण; वर्तमान आकार सीमाहरू र क्षेत्रीय समर्थन जाँच गर्नुहोस्

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
   - प्रयोग अनुसार मूल्य निर्धारण
   - विकास र परिवर्तनशील कार्यभारहरूको लागि उपयुक्त
   - साझा पूर्वाधार

2. **समर्पित (कार्यभार प्रोफाइलहरू)**
   - समर्पित कम्प्युट स्रोतहरू
   - पूर्वानुमानयोग्य प्रदर्शन
   - उत्पादन कार्यभारहरूको लागि उपयुक्त

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

जोन लालुसी स्वास्थ्यका लागि समर्थित-क्षेत्र पूर्वाधार र उपयुक्त VNet/सबनेट कन्फिगरेसन आवश्यक हुन्छ, यहाँ उल्लेख गरिएको छैन। यो उदाहरणले तीन समर्पित नोटहरूको बजेट बनाउँछ; क्रस-जोन वितरणका लागि कम्तिमा दुई एप रेप्लिका कन्फिगर गर्नुहोस् र जोन विफलताको लागि दुबै रेप्लिका र नोटहरूको साइज मिलाउनुहोस्। हेर्नुहोस् [कन्टेनर एप्स विश्वसनीयता मार्गदर्शन](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps)। यस प्रोफाइलमा एप राख्न, यसको `workloadProfileName: 'production-profile'` सेट गर्नुहोस्; प्रोफाइल सिर्जना मात्रले एपहरू त्यहाँ सार्दैन।

### Azure Cosmos DB

#### थ्रुपुट मोडेलहरू

1. **म्यानुअल प्रोभिजन गरिएको थ्रुपुट**
   - पूर्वानुमानयोग्य प्रदर्शन
   - आरक्षित क्षमता छुटहरू
   - स्थिर कार्यभारहरूको लागि उत्तम

2. **अटोस्केल प्रोभिजन गरिएको थ्रुपुट**
   - प्रयोगमा आधारित स्वचालित स्केलिङ
   - के प्रयोग गरिन्छ तेस्रो तिर्नुहोस् (न्यूनतमसँग)
   - परिवर्तनशील कार्यभारहरूका लागि राम्रो

3. **सर्भरलेस**
   - अनुरोध प्रति भुक्तानी
   - प्रोभिजन गरिएको थ्रुपुट छैन
   - विकास र अस्थायी कार्यभारहरूको लागि उपयुक्त

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

### Azure स्टोरेज अकाउन्ट

#### स्टोरेज अकाउन्ट प्रकारहरू

1. **Standard_LRS** - विकास, गैर-गंभीर डेटा
2. **Standard_GRS** - उत्पादन, ज्यो-रेडन्डेन्सी आवश्यक
3. **Premium_LRS** - उच्च प्रदर्शन अनुप्रयोगहरू
4. **Premium_ZRS** - जोन लालुसी सहित उच्च उपलब्धता

#### प्रदर्शन तहहरू

- **मानक**: सामान्य प्रयोजन, लागत-प्रभावी
- **प्रिमियम**: उच्च प्रदर्शन, कम विलम्बता परिदृश्यहरू

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

### 1. आरक्षित क्षमता

१-३ वर्षको लागि स्रोतहरू रिजर्भ गर्नुहोस् र ठूलो छुटहरू पाउनुहोस्:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

आरक्षण प्रस्तावहरू र पात्र स्रोत प्रकारहरू फरक हुन सक्छन्; प्रत्येक सेवा/SKU ले आरक्षण समर्थन गर्छ भन्ने सोच्ने सट्टा सूची र खरिद सर्तहरू जाँच गर्नुहोस्।

### 2. सही आकार चयन

सानो SKU बाट सुरु गरी वास्तविक प्रयोगको आधारमा स्केल अप गर्नुहोस्:

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

लागत अनुकूलन गर्न समझदार स्केलिङ लागू गर्नुहोस्:

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

### 4. निर्धारित स्केलिङ

अफ-घण्टा समयमा स्केल डाउन गर्नुहोस्:

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

प्रदर्शन प्रमाणीकरणका लागि फरक SKU हरू परीक्षण गर्नुहोस्:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### निगरानी र अनुकूलन

पूर्ण निगरानी सेटअप गर्नुहोस्:

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

## छिटो सन्दर्भ तालिकाहरू

### एप सेवा SKU छिटो सन्दर्भ

| SKU | तह | vCPU | RAM | भण्डारण | मूल्य दायरा | प्रयोग केस |
|-----|------|------|-----|---------|-------------|----------|
| F1 | नि:शुल्क | साझा | 1GB | 1GB | नि:शुल्क | विकास |
| B1 | आधारभूत | 1 | 1.75GB | 10GB | $ | साना एपहरू |
| S1 | मानक | 1 | 1.75GB | 50GB | $$ | उत्पादन |
| P1V3 | प्रिमियम V3 | 2 | 8GB | 250GB | $$$ | उच्च प्रदर्शन |
| I1V2 | आइसोलेटेड V2 | 2 | 8GB | 1TB | $$$$ | एन्त्रप्राइज |

### SQL डाटाबेस SKU छिटो सन्दर्भ

| SKU | तह | DTU/vCore | भण्डारण | मूल्य दायरा | प्रयोग केस |
|-----|------|-----------|---------|-------------|----------|
| आधारभूत | आधारभूत | 5 DTU | 2GB | $ | विकास |
| S2 | मानक | 50 DTU | 250GB | $$ | सानो उत्पादन |
| P2 | प्रिमियम | 250 DTU | 1TB | $$$ | उच्च प्रदर्शन |
| GP_Gen5_4 | सामान्य प्रयोजन | 4 vCore | 4TB | $$$ | सन्तुलित |
| BC_Gen5_8 | व्यापार-महत्त्वपूर्ण | 8 vCore | 4TB | $$$$ | मिशन महत्त्वपूर्ण |

### कन्टेनर एप् SKU छिटो सन्दर्भ

| मोडेल | मूल्य निर्धारण | CPU/मेमोरी | प्रयोग केस |
|-------|---------|------------|----------|
| उपभोग | प्रयोग अनुसार तिर्नुहोस् | वातावरण/प्रोफाइल अनुसार CPU/मेमोरी संयोजन समर्थन | विकास वा उत्पादन, परिवर्तनशील लोड |
| समर्पित D4 | समर्पित नोट बिलिङ | 4 vCPU, 16GiB प्रति नोट | निरन्तर लोड/अलगाव आवश्यकताहरू |
| समर्पित D8 | समर्पित नोट बिलिङ | 8 vCPU, 32GiB प्रति नोट | उच्च निरन्तर लोड |

---

## प्रमाणीकरण उपकरणहरू

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

**स्यूडोकोड मात्र:** तलको `Get-ResourceCost` एक परियोजना-विशिष्ट कार्य हो जुन तपाईंले वर्तमान क्षेत्रीय/सम्झौता मूल्य निर्धारण र प्रयोग अनुमानहरू प्रयोग गरेर लागू गर्नुपर्छ। यो PowerShell वा Azure cmdlet होइन।

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

### प्रदर्शन प्रमाणीकरण

तलको YAML आवश्यकताहरूको रूपमा हो, **Azure Load Testing, JMeter, Locust, वा k6 इनपुट स्किम होइन**। प्रयोग गर्नु अघि तपाईंको छनोट गरेको उपकरणको वास्तविक कन्फिगरेसनमा यसलाई रूपान्तरण गर्नुहोस्।

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

## राम्रो अभ्यास सारांश

### गर्नेहरू

१. **सानोबाट सुरु गरी वास्तविक प्रयोगको आधारमा स्केल अप गर्नुहोस्**
२. **विभिन्न वातावरणका लागि फरक SKU प्रयोग गर्नुहोस्**
३. **प्रदर्शन र लागत निरन्तर निगरानी गर्नुहोस्**
४. **उत्पादन कार्यभारका लागि आरक्षित क्षमता प्रयोग गर्नुहोस्**
५. **उपयुक्त ठाउँमा अटो-स्केलिङ लागू गर्नुहोस्**
६. **यथार्थवादी कार्यभारहरूसँग प्रदर्शन परीक्षण गर्नुहोस्**
७. **वृद्धि योजना बनाउनुहोस् तर अत्यधिक प्रावधान गर्नबाट बच्नुहोस्**
८. **विकासको लागि सम्भव भए नि:शुल्क तहहरू प्रयोग गर्नुहोस्**

### नगर्नेहरू

१. **विकासका लागि उत्पादन SKU प्रयोग नगर्नुहोस्**
२. **क्षेत्रीय SKU उपलब्धता बेवास्ता नगर्नुहोस्**
३. **डेटा स्थानान्तरण लागतहरू बिर्सनुहोस्**
४. **विवरण बिना अत्यधिक प्रावधान नगर्नुहोस्**
५. **निर्भरता प्रभाव बेवास्ता नगर्नुहोस्**
६. **अटो-स्केलिङ सीमाहरूलाई धेरै उच्च नसेट गर्नुहोस्**
७. **अनुपालन आवश्यकताहरू बिर्सनुहोस्**
८. **मूल्य आधारमा मात्र निर्णय नगर्नुहोस्**

---

**परो टिप:** Azure लागत व्यवस्थापन र सल्लाहकार प्रयोग गरी तपाईंको SKU चयनहरूलाई वास्तविक प्रयोग ढाँचाहरूको आधारमा व्यक्तिगत सिफारिसहरू प्राप्त गर्नुहोस्।

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [क्षमता योजना](capacity-planning.md)
- **अर्को पाठ**: [प्रीफ्लाइट जाँचहरू](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->