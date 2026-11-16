# SKU தேர்வு கையேடு - சரியான Azure சேவை தளங்களை தேர்வு செய்தல்

**அத்தியாய நகர்வு:**
- **📚 பாடநூல் முகப்பு**: [AZD இல் தொடங்குவோருக்கு](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 6 - முன்-விதானச் சரிபார்ப்பு மற்றும் திட்டமிடல்
- **⬅️ முந்தையது**: [திறன் திட்டமிடல்](capacity-planning.md)
- **➡️ அடுத்தது**: [முன்-பிரயாண பரிசோதனைகள்](preflight-checks.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 7: சிக்கல் தீர்க்கல்](../chapter-07-troubleshooting/common-issues.md)

## அறிமுகம்

இந்த விரிவான கையேடு, வெவ்வேறு சூழல்கள், பணிச்சுமைகள் மற்றும் தேவைகளுக்காக சிறந்த Azure சேவை SKUகளை (ஸ்டாக் கீப்பிங் யூனிட்ஸ்) தேர்ந்தெடுக்க உதவுகிறது. செயல்திறன் தேவைகள், செலவு கவனிப்புகள் மற்றும் அளவுகோல் தேவைகளை பகுப்பாய்வு செய்து Azure Developer CLI பிரயோகங்களுக்கு தகுந்த சேவை தளங்களை தேர்வுசெய்ய கற்றுக்கொள்ளுங்கள்.

## கற்றல் குறிக்கோள்கள்

இந்தக் கையேட்டை முடித்தபின், நீங்கள்:
- Azure SKU கருதுகோள்கள், விலை மாடல்கள் மற்றும் அம்ச வேறுபாடுகளை புரிந்துகொள்வீர்கள்
- மேம்பாடு, ச்டேஜிங் மற்றும் பயன்பாட்டுக்கான சூழல்-சார்ந்த SKU தேர்வு தரவுகளை செய்திகள் செய்வீர்கள்
- பணிச்சுமை தேவைகளை பகுப்பாய்வு செய்து அவற்றுக்கு பொருத்தமான சேவை தளங்களை பொருத்துவீர்கள்
- அறிவார்ந்த SKU தேர்வு மூலம் செலவு செயல்திறன்மிக்க முறைகளை அமர்த்துவீர்கள்
- SKU தேர்வுகளுக்கான செயல்திறன் சோதனை மற்றும் சரிபார்ப்பு முறைகளை நடைமுறைப்படுத்துவீர்கள்
- தானாக SKU பரிந்துரைகள் மற்றும் கண்காணிப்புகளை அமைப்பீர்கள்

## கற்றல் முடிவுகள்

முடிந்ததும், நீங்கள் செய்யக்கூடியவை:
- பணிச்சுமை தேவைகள் மற்றும் வரையறைகளுக்கேற்ப பொருத்தமான Azure சேவை SKUகளை தேர்ந்தெடுக்கலாம்
- சரியான தள தேர்வுடன் செலவு-செயல்திறன் பல்வகை சூழல் கட்டமைப்புகளை வடிவமைக்கலாம்
- SKU தேர்வுகளுக்கான செயல்திறன் தரவுத்தளமிடல் மற்றும் சரிபார்ப்பை நடைமுறைப்படுத்தலாம்
- SKU பரிந்துரைக்கும் மற்றும் செலவு செயல்திறன் மேம்பாட்டு தானாக இயங்கும் கருவிகளை உருவாக்கலாம்
- தேவைகளில் மாற்றங்களுக்கு SKU மைக்ரேஷன் மற்றும் அளவுகோல் முறைகளை திட்டமிடலாம்
- சேவை தள தேர்வுக்கு Azure நன்றாக வடிவமைக்கப்பட்ட கட்டமைப்பு விதிகளை பின்பற்றலாம்

## உள்ளடக்க அட்டவணை

- [SKUகளை புரிந்து கொள்வது](#understanding-skus)
- [சூழல் அடிப்படையிலான தேர்வு](#environment-based-selection)
- [சேவை-சார்ந்த வழிகாட்டல்கள்](#service-specific-guidelines)
- [செலவு செயல்திறன் நடவடிக்கைகள்](#cost-optimization-strategies)
- [செயல்திறன் கவனிப்புகள்](#performance-considerations)
- [விரைவான குறிப்பு அட்டவணைகள்](#quick-reference-tables)
- [சரிபார்ப்பு கருவிகள்](#validation-tools)

---

## SKUகளை புரிந்து கொள்வது

> **உதாரண விரிவாக்கம்:** கீழுள்ள YAML SKU வரைபடங்கள் மற்றும் செயல்திறன் அமைப்புகள் வடிவமைப்பு குறிப்புகள் ஆகும், `azure.yaml` தேர்வுக் கட்டமைப்பு அல்லது லோடு-கருவி அமைப்பு அல்ல. Bicep பிளாக் அறிமுகங்கள் மாற்று/உறுப்பு ஆகும்: அவை தங்களின் அளவுருவாகவும் பெற்றோர் வளங்களாகவும் அறிவிக்கப்பட வேண்டும், சேர்ப்பதில் தனிச்சின்ன பெயர்களைப் பயன்படுத்தி, செயல்முறை திட்டத்தில் இணைக்கப்பட வேண்டும். விலை, வரம்புகள் மற்றும் மண்டல/SKU கிடைக்கும் நிலை உங்கள் சந்தா முன் சரிபார்க்கப்பட வேண்டும்.

### SKUகள் என்ன?

SKUகள் (ஸ்டாக் கீப்பிங் யூனிட்ஸ்) Azure வளங்களுக்கான வித்தியாசமான சேவை தளங்களும் செயல்திறன் அளவுகளும் ஆகும். ஒவ்வொரு SKUயும் தரும் வித்தியாசங்கள்:

- **செயல்திறன் குறிப்புகள்** (CPU, நினைவகம், தகவல் ஓட்டம்)
- **அம்ச கிடைக்கும் நிலை** (அளவிடும் விருப்பங்கள், SLA நிலைகள்)
- **விலை மாடல்கள்** (விளக்கு-அடிப்படையிலான, முன்பதிவு கொள்ளளவு)
- **மண்டல கிடைக்கும் நிலை** (அனைத்து SKUகளும் அனைத்து மண்டலங்களிலும் கிடைக்கும் என்று இல்லை)

### SKU தேர்வில் முக்கிய காரணிகள்

1. **பனிச்சுமை தேவைகள்**
   - எதிர்பார்க்கப்படும் போக்குவரத்து/வேலை மாதிரிகள்
   - செயல்திறன் தேவைகள் (CPU, நினைவகம், I/O)
   - சேமிப்பு தேவைகள் மற்றும் அணுகல் மாதிரிகள்

2. **சூழல் வகை**
   - மேம்பாடு/சோதனை மற்றும் பயன்பாடு
   - கிடைக்கும் நிலை தேவைகள்
   - பாதுகாப்பு மற்றும் இணக்கம் தேவைகள்

3. **பட்ஜெட் வரம்புக்கள்**
   - முதன்மையான செலவுகள் மற்றும் செயல்பாட்டு செலவுகள்
   - முன்பதிவு கொள்ளளவு தள்ளுபடிகள்
   - தானாக அளவுகோல் செலவு பாதிப்புகள்

4. **வளர்ச்சி முன்பாய்வுகள்**
   - அளவுகோல் தேவைகள்
   - எதிர்கால அம்ச தேவைகள்
   - மைக்ரேஷன் சிக்கலான தன்மை

---

## சூழல் அடிப்படையிலான தேர்வு

### மேம்பாடு சூழல்

**முதன்மை பொருட்கள்**: செலவு செயல்திறன், அடிப்படை செயல்பாடு, எளிதான பிரதிபடுத்து/பிறப்பித்தல்

#### பரிந்துரைக்கப்படும் SKUகள்
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

#### பண்புகள்
- **ஆப் சேவை**: எளிய சோதனைக்கு F1 (இலவசம்) அல்லது B1 (அடிப்படை)
- **தரவுத்தளங்கள்**: குறைந்த வளங்களுடன் அடிப்படை தளம்
- **சேமிப்பு**: உள்ளூர் தரவு பழுப்பு மட்டுமே கொண்ட நிலையான சேமிப்பு
- **கணினி**: பகிர்ந்த வளங்கள் ஏற்றுக்கொள்ளக்கூடியவை
- **பிணையம்**: அடிப்படை அமைப்புகள்

### ச்டேஜிங்/சோதனை சூழல்

**முதன்மை பொருட்கள்**: பயன்பாட்டை போன்ற அமைப்பு, செலவு சமநிலை, செயல்திறன் சோதனை திறன்

#### பரிந்துரைக்கப்படும் SKUகள்
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

#### பண்புகள்
- **செயல்திறன்**: பயன்பாட்டு திறன் 70-80%
- **அம்சங்கள்**: பெரும்பாலான பயன்பாட்டு அம்சங்கள் இயங்கும்
- **தரவு பழுப்பு**: சில புவியியல் பழுப்பு
- **அளவுகோல்**: சோதனைக்கு குறைவான தானாக அளவுகோல்
- **கண்காணிப்பு**: முழுமையான கண்காணிப்பு தொகுப்பு

### பயன்பாட்டு சூழல்

**முதன்மை பொருட்கள்**: செயல்திறன், கிடைக்கும் நிலை, பாதுகாப்பு, இணக்கம், அளவுகோல்

#### பரிந்துரைக்கப்படும் SKUகள்
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

#### பண்புகள்
- **உயர் கிடைக்கும் நிலை**: 99.9%+ SLA தேவை
- **செயல்திறன்**: அர்ப்பணிக்கப்பட்ட வளங்கள், உயர் தகவல் ஓட்டம்
- **பாதுகாப்பு**: பிரீமியம் பாதுகாப்பு அம்சங்கள்
- **அளவுகோல்**: முழுமையான தானாகவே அளவுகோல் திறன்கள்
- **கண்காணிப்பு**: விரிவான கண்காணிப்பு

---

## சேவை சார்ந்த வழிகாட்டல்கள்

### Azure ஆப் சேவை

#### SKU முடிவு அட்டவணை

| பயன்பாட்டு வழக்கு | பரிந்துரைக்கப்படும் SKU | காரணம் |
|----------|----------------|-----------|
| மேம்பாடு/சோதனை | F1 (இலவசம்) அல்லது B1 (அடிப்படை) | செலவு-செயல்திறன், சோதனைக்குப் போதுமானது |
| சிறிய பயன்பாட்டு பயன்பாடுகள் | S1 (நிலையான) | தனிப்பயன் டொமைன்கள், SSL, தானாக அளவுகோல் |
| நடுத்தர பயன்பாடுகள் | P1V3 (பிரீமியம் V3) | மேம்பட்ட செயல்திறன், அதிக அம்சங்கள் |
| அதிக வருமான பயன்பாடுகள் | P2V3 அல்லது P3V3 | அர்ப்பணிக்கப்பட்ட வளங்கள், உயர் செயல்திறன் |
| மிக அவசர பயன்பாடுகள் | I1V2 (பிரிக்கப்பட்ட V2) | பிணைய பிரிப்பி, அர்ப்பணிக்கப்பட்ட ஹார்டுவேர் |

#### அமைப்பு உதாரணங்கள்

**மேம்பாடு**
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

**பயன்பாடு**
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

### Azure SQL தரவுத்தளம்

#### SKU தேர்வு மேடைகள்

1. **DTU அடிப்படையிலான (தரவுத்தள பரிவர்த்தனை யூனிட்ஸ்)**
   - **அடிப்படை**: 5 DTU - மேம்பாடு/சோதனை
   - **நிலையான**: S0-S12 (10-3000 DTU) - பொது பயன்பாடு
   - **பிரீமியம்**: P1-P15 (125-4000 DTU) - செயல்திறன் முக்கியமானது

2. **vCore அடிப்படையிலான** (பயன்பாட்டுக்கு பரிந்துரைக்கப்பட்டது)
   - **பொது பயன்பாடு**: சமநிலை கணினி மற்றும் சேமிப்பு
   - **வணிக முக்கியம்**: குறைந்த தாமதம், உயர் IOPS
   - **ஹைப்பர்ஸ்கேல்**: மிக உயர்ந்த அளவுகோல் சேமிப்பு; தற்போதைய அளவு வரம்புகள் மற்றும் மண்டல ஆதரவு சரிபார்

#### உதாரண அமைப்புகள்

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

### Azure கண்டெயனர் ஆப்ஸ்கள்

#### சூழல் வகைகள்

1. **விளக்கு அடிப்படையிலான**
   - பயன்படுத்தியதற்கே கட்டணம்
   - மேம்பாடு மற்றும் மாறும் பணிச்சுமைகளுக்கு பொருத்தமானது
   - பகிர்ந்த இன்ஃப்ராஸ்டிரக்சர்

2. **அர்ப்பணிக்கப்பட்ட (பணிச்சுமை சுயவிவரங்கள்)**
   - அர்ப்பணிக்கப்பட்ட கணினி வளங்கள்
   - கணிசமான செயல்திறன்
   - பயன்பாட்டு பணிச்சுமைக்கு சிறந்ததாகும்

#### அமைப்பு உதாரணங்கள்

**மேம்பாடு (விளக்கு)**
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

**பயன்பாடு (அர்ப்பணிக்கப்பட்ட)**
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

மண்டல பழுப்பு மேலும் ஆதரிக்கப்பட்ட மண்டல இன்ஃப்ராஸ்டிரக்சர் மற்றும் பொருத்தமான VNet/உப்மண்டல அமைப்பை தேவைப்படுத்துகிறது, இங்கே விட்டுவைக்கப்பட்டுள்ளது. இந்த உதாரணம் மூன்று அர்ப்பணிக்கப்பட்ட நோடுகளுக்கு பட்ஜெட் ஒதுக்குகிறது; குறைந்தது இரண்டு ஆப் நகல்களைக் கடல் மண்டல விநியோகம் செய்யவும், நகல்கள் மற்றும் நோடுகளின் அளவையும் மண்டல தோல்விக்கு ஏற்ப அளவிடவும் அமைக்கவும். [Container Apps நம்பகதன்மை வழிகாட்டி](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps) பார்க்கவும். இந்த சுயவிவரத்தில் ஒரு ஆப்பை வைக்க, அதன் `workloadProfileName: 'production-profile'` அமைக்க வேண்டும்; சுயவிவரத்தை உருவாக்குவது மட்டும் ஆப்களை அதற்கு மாற்றாது.

### Azure கோஸ்மோஸ் டிபி

#### தகவல் ஓட்ட மாதிரிகள்

1. **கையேடு ஒதுக்கிய throughput**
   - கண்காணிக்கக்கூடிய செயல்திறன்
   - முன்பதிவு கொள்ளளவு தள்ளுபடிகள்
   - நிலையான பணிச்சுமைகளுக்கு சிறந்தது

2. **தானாக அளவுகோல் நிகழ்த்தப்பட்ட throughput**
   - பயன்பாட்டின்பிடி தானாக அளவுகோல்
   - நீங்கள் பயன்படுத்துவதைத் தான் கட்டணம் செலுத்துவீர்கள் (குறைந்தபட்சத்துடன்)
   - மாறும் பணிச்சுமைகளுக்கு நல்லது

3. **சேவையில்லாத சேவை (Serverless)**
   - கோரிக்கைக்கு வாய்ப்பில் கட்டணம்
   - முன்பதிவு throughput இல்லை
   - மேம்பாடு மற்றும் இடைஞ்சல் பணிச்சுமைகளுக்கு சிறந்தது

#### SKU உதாரணங்கள்

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

### Azure சேமிப்பு கணக்கு

#### சேமிப்பு கணக்கு வகைகள்

1. **Standard_LRS** - மேம்பாடு, முக்கியமற்ற தரவு
2. **Standard_GRS** - பயன்பாடு, புவியியல் பழுப்பு தேவை
3. **Premium_LRS** - உயர் செயல்திறன் பயன்பாடுகள்
4. **Premium_ZRS** - மண்டல பழுப்புடன் உயர்ந்த கிடைக்கும் நிலை

#### செயல்திறன் தளங்கள்

- **நிலையான**: பொது பயன்பாடு, செலவு-செயல்திறன்
- **பிரீமியம்**: உயர் செயல்திறன், குறைந்த தாமத நிலைகள்

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

## செலவு செயல்திறன் நடவடிக்கைகள்

### 1. முன்பதிவு கொள்ளளவு

1-3 ஆண்டுகளுக்கான வளங்களை முன்பதிவு செய்து பெரிய தள்ளுபடிகளை பெறுங்கள்:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

முன்பதிவு வழங்கல் மற்றும் தகுதிச் செய்திகள் வேறுபடும்; அனைத்து சேவை/SKUகளும் முன்பதிவு ஆதரவு தரும் என்று எதிர்பார்க்காமல் பட்டியலையும் வாங்க வேண்டிய ஒப்பந்தங்களையும் பரிசீலியுங்கள்.

### 2. சரியான அளவு வைப்பது

சிறிய SKUகள் கொண்டு தொடங்கி, தகவல் பயன்பாடு அடிப்படையில் அளவு உயர்த்துங்கள்:

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

### 3. தானாக அளவுகோல் அமைப்பு

அறிவார்ந்த அளவுகோலை நடைமுறைப்படுத்தி செலவுக்களை செயல்திறன்மிகு படுத்தவும்:

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

### 4. திட்டமிடப்பட்ட அளவுகோல்

வேலை நேரத்திற்கு வெளியாக அளவு குறைத்தல்:

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

## செயல்திறன் கவனிப்புகள்

### அடிப்படை செயல்திறன் தேவைகள்

SKU தேர்வுக்கு முன் தெளிவான செயல்திறன் தேவைகளை வரையறுக்கவும்:

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

### சுமைச் சோதனை

செயல்திறனை சரிபார்க்க வித்தியாசமான SKUகளை சோதிக்கவும்:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### கண்காணிப்பு மற்றும் மேம்படுத்தல்

விரிவான கண்காணிப்பை அமைக்கவும்:

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

## விரைவான குறிப்பு அட்டவணைகள்

### ஆப் சேவை SKU விரைவான குறிப்பு

| SKU | தளம் | vCPU | நினைவகம் | சேமிப்பு | விலை வரம்பு | பயன்பாடு |
|-----|------|------|-----|---------|-------------|----------|
| F1 | இலவசம் | பகிர்ந்தளவு | 1GB | 1GB | இலவசம் | மேம்பாடு |
| B1 | அடிப்படை | 1 | 1.75GB | 10GB | $ | சிறிய பயன்பாடுகள் |
| S1 | நிலையான | 1 | 1.75GB | 50GB | $$ | பயன்பாடு |
| P1V3 | பிரீமியம் V3 | 2 | 8GB | 250GB | $$$ | உயர் செயல்திறன் |
| I1V2 | பிரிக்கப்பட்ட V2 | 2 | 8GB | 1TB | $$$$ | நிறுவன பயன்பாடு |

### SQL தரவுத்தளம் SKU விரைவான குறிப்பு

| SKU | தளம் | DTU/vCore | சேமிப்பு | விலை வரம்பு | பயன்பாடு |
|-----|------|-----------|---------|-------------|----------|
| அடிப்படை | அடிப்படை | 5 DTU | 2GB | $ | மேம்பாடு |
| S2 | நிலையான | 50 DTU | 250GB | $$ | சிறிய பயன்பாட்டு |
| P2 | பிரீமியம் | 250 DTU | 1TB | $$$ | உயர் செயல்திறன் |
| GP_Gen5_4 | பொது பயன்பாடு | 4 vCore | 4TB | $$$ | சமநிலை |
| BC_Gen5_8 | வணிக முக்கியம் | 8 vCore | 4TB | $$$$ | மிக முக்கியமான |

### கண்டெயனர் ஆப்ஸ் SKU விரைவான குறிப்பு

| மாதிரி | விலை நிர்ணயம் | CPU/நினைவகம் | பயன்பாடு |
|-------|---------|------------|----------|
| விளக்கு | பயன்படுத்தியதற்கே கட்டணம் | சூழல்/சுயவிவர மேற்பார்வை CPU/நினைவகம் இணைப்புகள் ஆதரிக்கப்படும் | மேம்பாடு அல்லது பயன்பாடு, மாறும் பணிச்சுமை |
| அர்ப்பணிக்கப்பட்ட D4 | அர்ப்பணிக்கப்பட்ட நோடு பில்லிங் | 4 vCPU, 16GiB ஒரு நோடு | தொடர் பணிச்சுமை/ பிரிக்கப்பட்ட தேவை |
| அர்ப்பணிக்கப்பட்ட D8 | அர்ப்பணிக்கப்பட்ட நோடு பில்லிங் | 8 vCPU, 32GiB ஒரு நோடு | உயர் தொடர் பணிச்சுமை |

---

## சரிபார்ப்பு கருவிகள்

### SKU கிடைக்கும் நிலை சரிபார்ப்பான்

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

### செலவு மதிப்பீட்டு ஸ்கிரிப்ட்

**நிரல் வடிவத்தில் மட்டும்:** கீழே `Get-ResourceCost` என்பது ஒரு திட்ட-சார்ந்த செயல்பாடு ஆக இது தற்போதைய மண்டல/ஒப்பந்த விலை மற்றும் பயன்படுத்தல் ஊகங்களை பயன்படுத்தி நீங்கள் உருவாக்க வேண்டும். இது PowerShell அல்லது Azure கட்டளை அல்ல.

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

### செயல்திறன் சரிபார்ப்பு

கீழே உள்ள YAML தேவைகளுக்கான வரைபடம், **ஆமாம் அல்ல** Azure Load Testing, JMeter, Locust, அல்லது k6 உள்ளீடு கட்டமைப்பு. இதை உங்கள் தேர்ந்த கருவி வழக்கமைப்பு ஆகியவற்றுக்கு மாற்றி, மேலே உள்ள load-test கட்டளையை பயன்படுத்தி பரிசோதிக்கவும்.

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

## சிறந்த நடைமுறைகள் சுருக்கம்

### செய்யவேண்டியவை

1. **சிறியதாக தொடங்கி, உண்மையான பயன்பாடு அடிப்படையில் அளவிடுப்பது**
2. **வித்தியாசமான சூழலுக்கு வித்தியாசமான SKUகளை பயன்படுத்துவது**
3. **செயல்திறன் மற்றும் செலவுகளை தொடர்ந்து கண்காணித்தல்**
4. **பயன்பாட்டுக்கான முன்பதிவு கொள்ளளவை பயன்படுத்துதல்**
5. **தாக்-அளவுகோலை பொருத்துசெய்தல்**
6. **உண்மையான பணிச்சுமைகளுடன் செயல்திறன் சோதனை செய்வது**
7. **வளர்ச்சிக்கு திட்டமிடவும் ஆனால் மீறிய அளவுக்கு பராமரிய வேண்டாம்**
8. **இலவச தளங்களை மேம்பாட்டுக்கு பயன்படுத்துவதை முயற்சிக்கவும்**

### செய்யக்கூடாதவை

1. **மேம்பாட்டிற்கு பயன்பாட்டு SKUகளை பயன்படுத்த வேண்டாம்**
2. **மண்டல SKU கிடைக்கும் நிலையை புறக்கணிக்க வேண்டாம்**
3. **தரவு பரிமாற்ற செலவுகளை மறக்க வேண்டாம்**
4. **வழக்கம் இல்லாமல் அதிக அளவிலான வளங்களை ஒதுக்க வேண்டாம்**
5. **நிலையான சார்புகளின் தாக்கத்தை புறக்கணிக்க வேண்டாம்**
6. **தானாக அளவுகோல் வரம்புகளை மிக உயர்வாக அமைக்க வேண்டாம்**
7. **இணக்கம் தேவைகளை மறக்க வேண்டாம்**
8. **விலை மட்டும் அடிப்படையாக்கொள்ள வேண்டாம்**

---

**திறமையான பரிந்துரை**: உங்கள் SKU தேர்வுகளை சிறப்பான முறையில் செயல்திறன் மாதிரிகளுக்கு ஏற்ப செய்ய Azure Cost Management மற்றும் Advisor பயன்படுத்தி தனிப்பயன் பரிந்துரைகளை பெறவும்.

---

**நகர்வு**
- **முந்தைய பாடம்**: [திறன் திட்டமிடல்](capacity-planning.md)
- **அடுத்த பாடம்**: [முன்-பிரயாண பரிசோதனைகள்](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->