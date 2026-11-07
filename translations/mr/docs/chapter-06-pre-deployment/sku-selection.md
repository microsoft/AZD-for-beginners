# SKU निवड मार्गदर्शक - योग्य Azure सेवा स्तरांची निवड

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD सुरुवातीसाठी](../../README.md)
- **📖 चालू अध्याय**: अध्याय 6 - पूर्व-स्थापना तपासणी आणि नियोजन
- **⬅️ मागील**: [क्षमता नियोजन](capacity-planning.md)
- **➡️ पुढील**: [पूर्व-उड्डाण तपासण्या](preflight-checks.md)
- **🚀 पुढील अध्याय**: [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/common-issues.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक विविध वातावरणे, कामाचा भार, आणि गरजांसाठी सर्वोत्तम Azure सेवा SKU (स्टॉक कीपिंग युनिट्स) निवडण्यात मदत करतो. Azure Developer CLI तैनातीसाठी योग्य सेवा स्तर निवडण्यासाठी कार्यक्षमता गरजा, खर्च विचार, आणि विस्तार क्षमता गरजांचा विश्लेषण कसा करायचा ते शिका.

## शिकण्याचे उद्दिष्टे

हा मार्गदर्शक पूर्ण केल्यावर तुम्ही:
- Azure SKU संकल्पना, किंमतीचे मॉडेल्स, आणि वैशिष्ट्य भिन्नता समजून घेऊ शकता
- विकास, स्टेजिंग, आणि प्रोडक्शनसाठी वातावरण-विशिष्ट SKU निवड धोरणात पारंगत व्हाल
- कामाचा भार गरजा विश्लेषित करून योग्य सेवा स्तरांशी जुळवून घेऊ शकता
- बुद्धिमत्तापूर्ण SKU निवडीद्वारे खर्च बचत धोरणे अमलात आणू शकता
- SKU निवडीसाठी कार्यक्षमता परीक्षण व पडताळणी तंत्रे लागू करू शकता
- स्वयंचलित SKU शिफारस आणि देखरेख संरचना करू शकता

## शिकण्याची अपेक्षित परिणाम

पूर्ण केल्यावर तुम्ही:
- कामाचा भार गरजा आणि अटींवर आधारित योग्य Azure सेवा SKU निवडू शकता
- योग्य स्तर निवडून किफायतशीर बहुआयामी वातावरण आर्किटेक्चर्स डिझाइन करू शकता
- SKU निवडीसाठी कार्यक्षमता बेंचमार्किंग आणि पडताळणी लागू करू शकता
- SKU शिफारस व खर्चोत्कर्षासाठी स्वयंचलित साधने तयार करू शकता
- बदलत्या गरजांसाठी SKU स्थलांतर आणि स्केलिंग धोरणे आखू शकता
- Azure Well-Architected Framework तत्त्वे सेवा स्तर निवडीत लागू करू शकता

## अनुक्रमणिका

- [SKU समजून घेणे](#understanding-skus)
- [वातावरण-आधारित निवड](#environment-based-selection)
- [सेवा-विशिष्ट मार्गदर्शक](#service-specific-guidelines)
- [खर्च मिती धोरणे](#cost-optimization-strategies)
- [कार्यक्षमता विचार](#performance-considerations)
- [लवकर संदर्भ सारणी](#quick-reference-tables)
- [पडताळणी साधने](#validation-tools)

---

## SKU समजून घेणे

> **उदाहरण परिप्रेक्ष्य:** खालील YAML SKU नकाशे आणि कार्यक्षमता संरचना डिझाइन नोट्स आहेत, `azure.yaml` यंत्रणा किंवा लोड-टूल संरचना नाहीत. Bicep ब्लॉक्स पर्यायी/फ्रेगमेंट्स आहेत: त्यांचे पॅरामीटर्स आणि मुख्य संसाधने घोषित करा, त्यांना एकत्र वापरताना अद्वितीय चिन्हे वापरा, आणि मॉड्यूल्स कार्यरत प्रकल्पात जोडाः. किंमती, मर्यादा आणि प्रांत/SKU उपलब्धता तुमच्या सदस्यत्वासाठी तैनातीपूर्वी तपासणे आवश्यक आहे.

### SKU म्हणजे काय?

SKU (स्टॉक कीपिंग युनिट्स) विविध सेवा स्तर आणि कार्यक्षमता पातळ्यांचे प्रतिनिधित्व करतात. प्रत्येक SKU वेगवेगळे ऑफर करतो:

- **कार्यक्षमता गुणधर्म** (CPU, मेमरी, थ्रूपुट)
- **वैशिष्ट्य उपलब्धता** (स्केलिंग पर्याय, SLA पातळ्या)
- **किंमत मॉडेल्स** (वापर-आधारित, राखीव क्षमता)
- **क्षेत्रीय उपलब्धता** (सर्व क्षेत्रांत SKU उपलब्ध नसते)

### SKU निवडीतील मुख्य घटक

1. **कामाचा भार गरजा**
   - अपेक्षित ट्रॅफिक/लोड नमुने
   - कार्यक्षमता गरजा (CPU, मेमरी, I/O)
   - संग्रहण गरजा आणि प्रवेश नमुने

2. **वातावरण प्रकार**
   - विकास/परीक्षण विरुद्ध प्रोडक्शन
   - उपलब्धता गरजा
   - सुरक्षितता आणि अनुपालन गरजा

3. **बजेट मर्यादा**
   - प्रारंभिक खर्च विरुद्ध ऑपरेशनल खर्च
   - राखीव क्षमता सवलती
   - ऑटो-स्केलिंगच्या खर्च परिणाम

4. **वाढीच्या अंदाज**
   - विस्तार क्षमतांची गरज
   - भविष्यातील वैशिष्ट्य गरजा
   - स्थलांतर क्लिष्टता

---

## वातावरण-आधारित निवड

### विकास वातावरण

**प्राथमिकता**: खर्च बचत, मूलभूत कार्यक्षमता, सोपे प्राविजनिंग/डि-प्राविजनिंग

#### शिफारस केलेले SKU
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

#### गुणधर्म
- **ऍप सेवा**: सोपी चाचणीसाठी F1 (मुक्त) किंवा B1 (मुलभूत)
- **डेटाबेस**: कमी संसाधने असलेला बेसिक स्तर
- **साठवण**: फक्त स्थानिक प्रतिबद्धता असलेली स्टँडर्ड
- **कंप्युट**: सामायिक संसाधने मंजूर
- **नेटवर्किंग**: मूलभूत संरचना

### स्टेजिंग/चाचणी वातावरण

**प्राथमिकता**: प्रोडक्शनसारखी संरचना, खर्च संतुलन, कार्यक्षमता परीक्षण क्षमता

#### शिफारस केलेले SKU
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

#### गुणधर्म
- **कार्यक्षमता**: प्रोडक्शन क्षमतेचा 70-80%
- **वैशिष्ट्ये**: बहुतेक प्रोडक्शन वैशिष्ट्ये सक्षम
- **प्रतिबद्धता**: काही भौगोलिक प्रतिबद्धता
- **स्केलिंग**: चाचणीसाठी मर्यादित ऑटो-स्केलिंग
- **मॉनिटरिंग**: संपूर्ण निरीक्षण संच

### प्रोडक्शन वातावरण

**प्राथमिकता**: कार्यक्षमता, उपलब्धता, सुरक्षितता, अनुपालन, विस्तार क्षमता

#### शिफारस केलेले SKU
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

#### गुणधर्म
- **उच्च उपलब्धता**: 99.9%+ SLA गरजा
- **कार्यक्षमता**: समर्पित संसाधने, उच्च थ्रूपुट
- **सुरक्षितता**: प्रीमियम सुरक्षा वैशिष्ट्ये
- **स्केलिंग**: पूर्ण ऑटो-स्केलिंग क्षमता
- **मॉनिटरिंग**: सर्वसमावेशक निरीक्षण

---

## सेवा-विशिष्ट मार्गदर्शक

### Azure ऍप सेवा

#### SKU निर्णय मॅट्रिक्स

| वापर प्रकरण | शिफारस केलेला SKU | कारण |
|----------|----------------|-----------|
| विकास/चाचणी | F1 (मुक्त) किंवा B1 (मुलभूत) | खर्च-किफायतशीर, चाचणीसाठी पुरेसे |
| लहान प्रोडक्शन ऍप्स | S1 (स्टँडर्ड) | कस्टम डोमेन्स, SSL, ऑटो-स्केलिंग |
| मध्यम प्रोडक्शन ऍप्स | P1V3 (प्रीमियम V3) | चांगली कार्यक्षमता, अधिक वैशिष्ट्ये |
| उच्च-ट्रॅफिक ऍप्स | P2V3 किंवा P3V3 | समर्पित संसाधने, उच्च कार्यक्षमता |
| मिशन-क्लिष्ट ऍप्स | I1V2 (आइसोलेटेड V2) | नेटवर्क स्वतंत्रता, समर्पित हार्डवेअर |

#### संरचना उदाहरणे

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

**प्रोडक्शन**
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

#### SKU निवड फ्रेमवर्क

1. **DTU-आधारित (डेटाबेस ट्रान्झॅक्शन युनिट्स)**
   - **बेसिक**: 5 DTU - विकास/चाचणी
   - **स्टँडर्ड**: S0-S12 (10-3000 DTU) - सामान्य उपयोग
   - **प्रीमियम**: P1-P15 (125-4000 DTU) - कार्यक्षमता-गंभीर

2. **vCore-आधारित** (प्रोडक्शनसाठी शिफारस केली जाते)
   - **सामान्य उद्देश**: संतुलित कंप्युट आणि साठवण
   - **बिझनेस क्रिटिकल**: कमी विलंब, जास्त IOPS
   - **हायपरस्केल**: अत्यंत विस्तारक्षम साठवण; सध्याचे आकार मर्यादा आणि प्रादेशिक समर्थन तपासा

#### उदाहरण संरचना

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

### Azure कंटेनर ऍप्स

#### वातावरण प्रकार

1. **वापर-आधारित**
   - वापर प्रमाणे पैसे भरा
   - विकास आणि बदलत्या कामाचा भारासाठी योग्य
   - सामायिक पायाभूत सुविधा

2. **समर्पित (कामाचा भार प्रोफाइल)**
   - समर्पित कंप्युट संसाधने
   - पूर्वसूचित कार्यक्षमता
   - प्रोडक्शन कामाचा भारासाठी अधिक उपयुक्त

#### संरचना उदाहरणे

**विकास (वापर)**
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

**प्रोडक्शन (समर्पित)**
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

झोन प्रतिबद्धता देखील समर्थन-क्षेत्र पायाभूत सुविधा आणि योग्य VNet/उपनेट संरचना आवश्यक आहे, येथे वगळले आहे. या उदाहरणात तीन समर्पित नोडसाठी बजेट आहे; झोन-अपसर्गासाठी किमान दोन ऍप पुनरावृत्त्या कॉन्फिगर करा आणि झोन अयशस्वीतेसाठी पुनरावृत्त्या व नोडचे आकार निश्चित करा. पहा [कंटेनर ऍप्स विश्वसनीयता मार्गदर्शन](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). या प्रोफाइलवर ऍप ठिकाणासाठी त्याचा `workloadProfileName: 'production-profile'` सेट करा; फक्त प्रोफाइल तयार करणे ऍप हलवत नाही.

### Azure Cosmos DB

#### थ्रूपुट मॉडेल्स

1. **मॅन्युअल प्रदान थ्रूपुट**
   - पूर्वसूचित कार्यक्षमता
   - राखीव क्षमता सवलत
   - स्थिर कामाचे भारासाठी सर्वोत्तम

2. **ऑटोस्केल प्रदान थ्रूपुट**
   - वापरावर आधारित स्वयंचलित स्केलिंग
   - तुम्ही जे वापरता त्यासाठी पैसे द्या (किमान सह)
   - बदलत्या कामाचा भारासाठी चांगले

3. **सर्व्हरलेस**
   - विनंती-प्रति-भरणा
   - कोणतीही प्रदान थ्रूपुट नाही
   - विकास आणि इंटरमिटंट कामाचा भारासाठी आदर्श

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

### Azure स्टोरेज अकाउंट

#### स्टोरेज अकाउंट प्रकार

1. **Standard_LRS** - विकास, गैर-गंभीर डेटा
2. **Standard_GRS** - उत्पादन, भू-प्रतिबद्धता आवश्यक
3. **Premium_LRS** - उच्च कार्यक्षमता ऍप्लिकेशन्स
4. **Premium_ZRS** - झोन प्रतिबद्धता सह उच्च उपलब्धता

#### कार्यक्षमता स्तर

- **स्टँडर्ड**: सामान्य उपयोग, किफायतशीर
- **प्रीमियम**: उच्च कार्यक्षमता, कमी विलंब परिस्थिती

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

## खर्च मिती धोरणे

### 1. राखीव क्षमता

महत्त्वपूर्ण सवलतीसाठी 1-3 वर्षे संसाधने राखीव ठेवा:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

आरक्षण ऑफरिंग्ज आणि पात्र संसाधन प्रकार वेगळे असू शकतात; प्रत्येक सेवा/SKU आरक्षण समर्थन करते असे समजू नका, कॅटलॉग आणि खरेदी अटी तपासा.

### 2. योग्य आकार देणे

लहान SKU ने प्रारंभ करा आणि वास्तविक वापरावर आधारित स्केल करा:

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

### 3. ऑटो-स्केलिंग संरचना

खर्च मितीसाठी बुद्धिमत्तापूर्ण स्केलिंग अमलात आणा:

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

### 4. नियोजित स्केलिंग

ऑफ-आवर्स दरम्यान स्केल डाउन करा:

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

### बेसलाइन कार्यक्षमता गरजा

SKU निवडीपूर्वी स्पष्ट कार्यक्षमता गरजा निश्चित करा:

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

कार्यक्षमता पडताळणीसाठी विविध SKU चाचणी करा:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### निरीक्षण आणि सुधारणा

संपूर्ण निरीक्षण सेटअप करा:

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

## लवकर संदर्भ सारणी

### ऍप सेवा SKU लवकर संदर्भ

| SKU | स्तर | vCPU | RAM | साठवण | किमती श्रेणी | वापर प्रकरण |
|-----|------|------|-----|---------|-------------|----------|
| F1 | मुक्त | सामायिक | 1GB | 1GB | मुक्त | विकास |
| B1 | मुलभूत | 1 | 1.75GB | 10GB | $ | लहान ऍप्स |
| S1 | स्टँडर्ड | 1 | 1.75GB | 50GB | $$ | उत्पादन |
| P1V3 | प्रीमियम V3 | 2 | 8GB | 250GB | $$$ | उच्च कार्यक्षमता |
| I1V2 | आइसोलेटेड V2 | 2 | 8GB | 1TB | $$$$ | एंटरप्राइझ |

### SQL डेटाबेस SKU लवकर संदर्भ

| SKU | स्तर | DTU/vCore | साठवण | किमती श्रेणी | वापर प्रकरण |
|-----|------|-----------|---------|-------------|----------|
| बेसिक | बेसिक | 5 DTU | 2GB | $ | विकास |
| S2 | स्टँडर्ड | 50 DTU | 250GB | $$ | लहान उत्पादन |
| P2 | प्रीमियम | 250 DTU | 1TB | $$$ | उच्च कार्यक्षमता |
| GP_Gen5_4 | सामान्य उद्देश | 4 vCore | 4TB | $$$ | संतुलित |
| BC_Gen5_8 | बिझनेस क्रिटिकल | 8 vCore | 4TB | $$$$ | मिशन क्रिटिकल |

### कंटेनर ऍप्स SKU लवकर संदर्भ

| मॉडेल | किंमंत निर्धारण | CPU/मेमरी | वापर प्रकरण |
|-------|---------|------------|----------|
| वापर | वापर-प्रति-भरणा | समर्थित CPU/मेमरी संयोजन वातावरण/प्रोफाइलवर अवलंबून | विकास किंवा उत्पादन, बदलत्या लोडसाठी |
| समर्पित D4 | समर्पित नोड बिलिंग | 4 vCPU, 16GiB प्रति नोड | सातत्यपूर्ण लोड/स्वतंत्रतेसाठी |
| समर्पित D8 | समर्पित नोड बिलिंग | 8 vCPU, 32GiB प्रति नोड | अधिक सातत्यपूर्ण लोड |

---

## पडताळणी साधने

### SKU उपलब्धता तपासणी

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

### खर्च अंदाज स्क्रिप्ट

**केवळ प्सूडोकोड:** खालील `Get-ResourceCost` प्रकल्प-विशिष्ट फंक्शन आहे जे तुम्हाला चालू प्रादेशिक/कॉन्ट्रॅक्ट किमती आणि वापर धारणा वापरून अंमलात आणणे आवश्यक आहे. हा पॉवरशेल किंवा Azure cmdlet नाही.

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

### कार्यक्षमता पडताळणी

खालील YAML गरजांची मागणी आहे, **नाही** Azure Load Testing, JMeter, Locust, किंवा k6 इनपुट यंत्रणा. वर दिलेल्या लोड-टेस्ट कमांड वापरण्यापूर्वी तुमच्या निवडलेल्या साधनात याचे वास्तविक रूपांतर करा.

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

## सर्वोत्तम प्रॅक्टिस सारांश

### करत राहा

1. **लहानपासून सुरुवात करा आणि वास्तविक वापरावर आधारित स्केल करा**
2. **वेगळ्या वातावरणांसाठी वेगवेगळे SKU वापरा**
3. **कार्यक्षमता आणि खर्च सतत निरीक्षण करा**
4. **प्रोडक्शन कामाचा भारासाठी राखीव क्षमता वापरा**
5. **ज्याठिकाणी योग्य आहे तिथे ऑटो-स्केलिंग लागू करा**
6. **प्रत्यक्ष कामांच्या लोडसह कार्यक्षमता चाचणी करा**
7. **वाढीसाठी योजनेत रहा पण खूप पुरवठा करू नका**
8. **विकासासाठी शक्य असल्यास मुक्त स्तरांचा वापर करा**

### टाळा

1. **विकासासाठी प्रोडक्शन SKU वापरू नका**
2. **प्रादेशिक SKU उपलब्धतेकडे दुर्लक्ष करू नका**
3. **डेटा हस्तांतरण खर्च विसरू नका**
4. **विना कारणाच्या जास्त पुरवठा टाळा**
5. **आश्रिततेचा परिणाम दुर्लक्ष करू नका**
6. **ऑटो-स्केलिंग मर्यादा खूप जास्त ठेवू नका**
7. **अनुपालन गरजा विसरू नका**
8. **किंमतीच्या आधारे फक्त निर्णय घ्यू नका**

---

**प्रो टिप**: Azure खर्च व्यवस्थापन आणि सल्लागार वापरून तुमच्या SKU निवडींचे वैयक्तिकृत शिफारशी मिळवा.

---

**नेव्हिगेशन**
- **मागील धडा**: [क्षमता नियोजन](capacity-planning.md)
- **पुढील धडा**: [पूर्व-उड्डाण तपासण्या](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->