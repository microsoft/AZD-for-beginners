# SKU തിരഞ്ഞെടുക്കൽ ഗൈഡ് - ശരിയായ Azure സർവീസ് ടിയറുകൾ തിരഞ്ഞെടുക്കൽ

**ചാപ്റ്റർ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD തുടക്കക്കാര്ക്ക്](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അദ്ധ്യായം 6 - പൂರ್ವ-ഡിപ്ലോയ്മെന്റ് പരിശോധന & പദ്ധതിയിടൽ
- **⬅️ മുൻപ്**: [ശേഷി പദ്ധതിയിടൽ](capacity-planning.md)
- **➡️ അടുത്തത്**: [പ്രീ-ഫ്ലൈറ്റ് പരിശോധനകൾ](preflight-checks.md)
- **🚀 അടുത്ത അധ്യായം**: [അദ്ധ്യായം 7: പ്രശ്നപരിഹാരം](../chapter-07-troubleshooting/common-issues.md)

## ആമുഖം

ഈ സമഗ്രമായ ഗൈഡ് വിവിധ പരിസ്ഥിതികൾ, വർക്ക്‌ലോഡുകൾ, ആവശ്യകത എന്നിവയ്ക്ക് അനുയോജ്യമായ Azure സർവീസ് SKUകൾ (Stock Keeping Units) തിരഞ്ഞെടുക്കുന്നതിൽ സഹായിക്കുന്നു. പ്രകടന ആവശ്യകതകൾ, ചെലവ് പരിഗണനകൾ, സ്കെയിലബിലിറ്റി ആവശ്യകതകൾ എന്നിവ വിശകലനം ചെയ്ത് Azure Developer CLI ഡിപ്ലോയ്മെന്റുകൾക്കായി ഏറ്റവും അനുയോജ്യമായ സർവീസ് ടിയറുകൾ തിരഞ്ഞെടുക്കാൻ പഠിക്കൂ.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തീകരിച്ചാൽ നിങ്ങൾ കഴിയും:
- Azure SKU ആശയം, വിലനിർണ്ണയ മോഡലുകൾ, സവിശേഷത വ്യത്യാസങ്ങൾ മനസിലാക്കുക
- ഡെവലപ്പ്മെന്റ്, സ്റ്റേജിംഗ്, പ്രൊഡക്ഷൻ എന്നിവയ്ക്കുള്ള പരിസ്ഥിതി-നിർദിഷ്ട SKU തിരഞ്ഞെടുപ്പ് നയങ്ങൾ കൈകാര്യം ചെയ്യുക
- വർക്ക്‌ലോഡ് ആവശ്യകതകൾ വിശകലനം ചെയ്ത് അവ അനുയോജ്യമായ സർവീസ് ടിയറുകളുമായി మ్యాచ్ ചെയ്യുക
- ബുദ്ധിമുട്ടില്ലാത്ത SKU തിരഞ്ഞെടുപ്പിലൂടെ ചെലവ് ഒപ്റ്റിമൈസേഷൻ തന്ത്രങ്ങൾ നടപ്പിൽ കൊണ്ടുകൂടുക
- SKU തിരഞ്ഞെടുപ്പുകൾക്കുള്ള പ്രകടന പരിശോധനയും സത്യാപന രീതികളും പ്രയോഗിക്കുക
- സ്വയംമാറ്റി SKU ശുപാർശകളും മേൽനോട്ട സംവിധാനങ്ങളും ക്രമീകരിക്കുക

## പഠന ഫലങ്ങൾ

പൂർത്തിയാക്കിയാൽ, നിങ്ങൾ കഴിയും:
- വർക്ക്‌ലോഡ് ആവശ്യകതകൾക്കും നിയന്ത്രണങ്ങൾക്കും അടിസ്ഥാനപ്പെടുത്തി അനുയോജ്യമായ Azure സർവീസ് SKUകൾ തിരഞ്ഞെടുക്കുക
- സ്തരബന്ധമായ ടിയർ തെരഞ്ഞെടുപ്പിലൂടെ ചെലവുകുറഞ്ഞ മൾട്ടി-പരിസ്ഥിതി ആർക്കിടെക്ചറുകൾ രൂപകൽപ്പന ചെയ്യുക
- SKU തിരഞ്ഞെടുപ്പുകൾക്കായുള്ള പ്രകടന ബെഞ്ച്മാർക്കിംഗ് மற்றும் സത്യാപനം നടപ്പാക്കുക
- SKU ശുപാർശയും ചെലവ് ഒപ്റ്റിമൈസേഷനും വേണ്ടി ഓटोമേറ്റഡ് ഉപകരണങ്ങൾ സൃഷ്‌ടിക്കുക
- മാറുന്ന ആവശ്യങ്ങളിലേക്ക് SKU മാറ്റങ്ങളും സ്കെയ്ലിംഗ് തന്ത്രങ്ങളും പദ്ധതിയിടുക
- സർവീസ് ടിയർ തിരഞ്ഞെടുപ്പിൽ Azure Well-Architected Framework സിദ്ധാന്തങ്ങൾ പ്രയോഗിക്കുക

## ഉള്ളടക്ക പട്ടിക

- [SKU-കൾ മനസിലാക്കൽ](../../../../docs/chapter-06-pre-deployment)
- [പരിസ്ഥിതി അടിസ്ഥാനമുള്ള തിരഞ്ഞെടുപ്പ്](../../../../docs/chapter-06-pre-deployment)
- [സേവന-നിർദിഷ്ട മാർഗ്ഗനിർദേശങ്ങൾ](../../../../docs/chapter-06-pre-deployment)
- [ചെലവ് ഓപ്‌ടിമൈസേഷൻ തന്ത്രങ്ങൾ](../../../../docs/chapter-06-pre-deployment)
- [പ്രകടന പരിഗണനകൾ](../../../../docs/chapter-06-pre-deployment)
- [ദ്രുത റഫറൻസ് പട്ടികകൾ](../../../../docs/chapter-06-pre-deployment)
- [സത്യാപന ഉപകരണങ്ങൾ](../../../../docs/chapter-06-pre-deployment)

---

## SKU-കൾ മനസിലാക്കൽ

### SKU-കൾ എന്താണ്?

SKUകൾ (Stock Keeping Units) Azure റിസോഴ്‌സുകൾക്കുള്ള വ്യത്യസ്ത സർവീസ് ടിയറുകളും പ്രകടന നിലകളും പ്രതിനിധീകരിക്കുന്നു. ഓരോ SKU-വും വ്യത്യസ്തമായ דברים ഉപയോഗിക്കാം:

- **പ്രകടന സവിശേഷതകൾ** (CPU, മെമ്മറി, ത്രൂപുട്ട്)
- **സവിശേഷത ലഭ്യത** (സ്കെയ്ലിങ് ഓപ്ഷനുകൾ, SLA ലെവലുകൾ)
- **വിലനിർണ്ണയ മോഡലുകൾ** (കൺസംപ്ഷൻ-ആധാരിതം, റിസർവഡ് കപ്പാസിറ്റി)
- **പ്രാദേശിക ലഭ്യത** (എല്ലാ പ്രാദേശങ്ങളിലുമില്ലാത്ത SKUകൾ)

### SKU തിരഞ്ഞെടുപ്പിലെ പ്രധാന ഘടകങ്ങൾ

1. **വർക്ക്‌ലോഡ് ആവശ്യകതകൾ**
   - പ്രതീക്ഷിച്ച ട്രാഫിക്/ലോഡ് പാറ്റേണുകൾ
   - പ്രകടന ആവശ്യകതകൾ (CPU, മെമ്മറി, I/O)
   - സ്റ്റോറേജ് ആവശ്യങ്ങൾ και ആക്സസ് പാറ്റേണുകൾ

2. **പരിസ്ഥിതി തരം**
   - ഡെവലപ്പ്മെന്റ്/ടെസ്റ്റിംഗ് vs. പ്രൊഡക്ഷൻ
   - ലഭ്യത ആവശ്യകതകൾ
   - സുരക്ഷയും комп്ലയൻസ് ആവശ്യങ്ങളും

3. **ബജറ്റ് പരിധികൾ**
   - പ്രാരംഭ ചെലവുകൾ vs. പ്രവര്‍ത്തന ചെലവുകൾ
   - റിസർവഡ് കപ്പാസിറ്റി ഡിസ്‌കൗണ്ടുകൾ
   - ഓട്ടോ-സ്കെയ്ലിങ്ങിന്റെ ചെലവ് നിഗമനങ്ങൾ

4. **വളർച്ച പ്രവചനങ്ങൾ**
   - സ്കെയിലബിലിറ്റി ആവശ്യകതകൾ
   - ഭാവിയിലെ സവിശേഷത ആവശ്യങ്ങൾ
   - മൈഗ്രേഷൻ സങ്കീർണ്ണത

---

## പരിസ്ഥിതി അടിസ്ഥാനമുള്ള തിരഞ്ഞെടുപ്പ്

### Development Environment

**പ്രാധാന്യങ്ങൾ**: ചെലവ് ഒപ്റ്റിമൈസേഷൻ, അടിസ്ഥാന ഫംഗ്ഷണലിറ്റി, എളുപ്പം പ്രൊവിജനിംഗ്/ഡി-പ്രൊവിജനിംഗ്

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

#### പ്രത്യേകതകൾ
- **App Service**: ലളിതമായ ടെസ്റ്റിംഗിന് F1 (Free) അല്ലെങ്കിൽ B1 (Basic)
- **Databases**: മിനിമൽ റിസോഴ്‌സുകളോടെ Basic ടിയർ
- **Storage**: ലോക്കൽ റിഡണ്ടൻസി മാത്രം ഉള്ള Standard
- **Compute**: ഷേഡ് ചെയ്ത റിസോഴ്‌സുകൾ അംഗീകരിക്കുന്നതാണ്
- **Networking**: അടിസ്ഥാന കോൺഫിഗറേഷനുകൾ

### Staging/Testing Environment

**പ്രാധാന്യങ്ങൾ**: പ്രൊഡക്ഷൻ-പോലെ കോൺഫിഗറേഷൻ, ചെലവ്-ബാലൻസ്, പ്രകടന പരിശോധനാ ശേഷി

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

#### പ്രത്യേകതകൾ
- **Performance**: ഉത്പാദന ശേഷിയുടെ 70-80%
- **Features**: ഭൂരിഭാഗം പ്രൊഡക്ഷൻ സവിശേഷതകൾ സജീവമാക്കി
- **Redundancy**: ചില ജിയോഗ്രാഫിക് റിഡണ്ടൻസി
- **Scaling**: ടെസ്റ്റിംഗിന് പരിമിതമായ ഓട്ടോ-സ്കെയ്ലിംഗ്
- **Monitoring**: പൂർത്തിയായ മോണിറ്ററിംഗ് സ്റ്റാക്ക്

### Production Environment

**പ്രാധാന്യങ്ങൾ**: പ്രകടനം, ലഭ്യത, സുരക്ഷ, കംപ്ലയൻസ്, സ്കെയ്ലബിലിറ്റി

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

#### പ്രത്യേകതകൾ
- **High availability**: 99.9%+ SLA ആവശ്യകതകൾ
- **Performance**: ഡെഡിക്കേറ്റഡ് റിസോഴ്‌സുകൾ, ഉയർന്ന ത്രൂപുട്ട്
- **Security**: പ്രീമിയം സുരക്ഷാ സവിശേഷതകൾ
- **Scaling**: പൂര്‍ണ്ണ ഓട്ടോ-സ്കെയ്ലിംഗ് കഴിവുകൾ
- **Monitoring**: സമഗ്രമായ ഒബ്സർവബിലിറ്റി

---

## സേവന-നിർദിഷ്ട മാർഗ്ഗനിർദേശങ്ങൾ

### Azure App Service

#### SKU നിർണയ മാട്രിക്സ്

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | ചെലവ്-ഫലപ്രദം, ടെസ്റ്റിംഗിന് തൃപ്തികരമാണ് |
| Small production apps | S1 (Standard) | കസ്റ്റം ഡൊമെയ്ൻ, SSL, ഓട്ടോ-സ്കെയ്ലിംഗ് |
| Medium production apps | P1V3 (Premium V3) | മെച്ചപ്പെട്ട പ്രകടനം, കൂടുതൽ സവിശേഷതകൾ |
| High-traffic apps | P2V3 or P3V3 | ഡെഡിക്കേറ്റഡ് റിസോഴ്‌സുകൾ, ഉയർന്ന പ്രകടനം |
| Mission-critical apps | I1V2 (Isolated V2) | നെറ്റ്‌വർക്ക് ഐസൊലേഷൻ, ഡെഡിക്കേറ്റഡ് ഹാർഡ്‌വെയർ |

#### കോൺഫിഗറേഷൻ ഉദാഹരണങ്ങൾ

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

#### SKU തിരഞ്ഞെടുപ്പ് ഫ്രെയിംവർക്ക്

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - ഡെവലപ്പ്മെന്റ്/ടെസ്റ്റിംഗ്
   - **Standard**: S0-S12 (10-3000 DTU) - ജനറൽ പർപ്പസ്
   - **Premium**: P1-P15 (125-4000 DTU) - പ്രകടന-നിർണായകങ്ങൾ

2. **vCore-based** (പ്രൊഡക്ഷനിനായി ശുപാർശ ചെയ്യപ്പെട്ടത്)
   - **General Purpose**: ബലൻസ്ഡ് കമ്പ്യൂട്ട് და സ്റ്റോറേജ്
   - **Business Critical**: കുറഞ്ഞ ലേറ്റൻസി, ഉയർന്ന IOPS
   - **Hyperscale**: വളരെ സ്കെയിലബിള്‍ സ്റ്റോറേജ് (ഓരോ 100TB വരെ)

#### ഉദാഹരണ കോൺഫിഗറേഷനുകൾ

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

#### Environment Types

1. **ഉപഭോഗം അടിസ്ഥാനമാക്കിയുള്ള (Consumption-based)**
   - ഉപയോഗപെരുമാറ്റപ്രകാരം പണം
   - ഡെവലപ്പ്മെന്റിനും വ്യത്യസ്തമായ വേല്കുള്ള workload-കൾക്കുമുപയോഗയോഗ്യം
   - പങ്കുവെച്ച ഇൻഫ്രാസ്ട്രക്ചർ

2. **ഡെഡിക്കേറ്റഡ് (Workload Profiles)**
   - ഡെഡിക്കേറ്റഡ് കമ്പ്യൂട്ട് റിസോഴ്‌സുകൾ
   - പ്രവചനക്ഷമ പ്രകടനം
   - പ്രൊഡക്ഷൻ വർക്ക്‌ലോഡ്-സഹജം

#### കോൺഫിഗറേഷൻ ഉദാഹരണങ്ങൾ

**ഡെവലപ്പ്മെന്റ് (ഉപഭോഗം അടിസ്ഥാനമാക്കിയുള്ള)**
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

**പ്രൊഡക്ഷൻ (ഡെഡിക്കേറ്റഡ്)**
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

#### ത്രൂപുട്ട് മോഡലുകൾ

1. **Manual Provisioned Throughput**
   - പ്രവചിക്കാവുന്ന പ്രകടനം
   - റിസർവഡ് കപ്പാസിറ്റി ഡിസ്‌കൗണ്ടുകൾ
   - സ്ഥിരമായ വർക്ക്‌ലോഡ്‌Voor മികച്ചത്

2. **Autoscale Provisioned Throughput**
   - ഉപയോഗത്തിന്റെ അടിസ്ഥാനത്തിൽ സ്വയം സ്കെയിൽ ചെയ്യുന്നു
   - ഉപയോഗിച്ചതിനെ മാത്രമേ പണം കൊടുക്കു (കുറഞ്ഞതായത് പ്രതീക്ഷ)
   - വ്യത്യസ്ഥമായ വർക്ക്‌ലോഡ്‌ക്കുള്ളത് നല്ലതു

3. **Serverless**
   - റിക്വസ്റ്റ്‌പ്രതി പണമടക്കൽ
   - പ്രൊവിഷനഡ് ത്രൂപുട്ട് ഇല്ല
   - ഡെവലപ്പ്മെന്റ് και ഇടക്കാല വർക്ക്‌ലോഡ്‌ക്കായി അനുയോജ്യം

#### SKU ഉദാഹരണങ്ങൾ

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

#### സ്റ്റോറേജ് അക്കൗണ്ട് തരം

1. **Standard_LRS** - ഡെവലപ്പ്മെന്റ്, നിർണ്ണായകമല്ലാത്ത ഡാറ്റ
2. **Standard_GRS** - പ്രൊഡക്ഷൻ, ജിയോ-റിഡണ്ടൻസി ആവശ്യമുള്ളതിനു
3. **Premium_LRS** - ഉയർന്ന പ്രകടനമുള്ള അപ്ലിക്കേഷനുകൾക്കു
4. **Premium_ZRS** - സോൺ റിഡണ്ടൻസിയോടെ ഉയർന്ന ലഭ്യത

#### പ്രകടന ടിയറുകൾ

- **Standard**: പൊതുവായ ഉപയോഗത്തിന്, ചെലവ്-പ്രയോജനകരം
- **Premium**: ഉയർന്ന പ്രകടനം, കുറഞ്ഞ ലേറ്റൻസി സാഹചര്യങ്ങൾ

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

## ചെലവ് ഓപ്‌ടൈമൈസേഷൻ തന്ത്രങ്ങൾ

### 1. Reserved Capacity

1-3 വർഷത്തേക്ക് റിസോഴ്‌സുകൾ റിസർവ് ചെയ്യുക σημαντικές ഇളവുകൾ നേടാൻ:

```bash
# റിസർവേഷൻ ഓപ്ഷനുകൾ പരിശോധിക്കുക
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. റൈറ്റ്-സൈസിംഗ്

ചെറുതായി തുടങ്ങി യഥാർത്ഥ ഉപയോഗത്തിന്റെ അടിസ്ഥാനത്തിൽ സ്കെയിൽ അപ് ചെയ്യുക:

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

### 3. ഓട്ടോ-സ്കെയ്ലിംഗ് കോൺഫിഗറേഷൻ

ചെലവുകൾ ഒപ്റ്റിമൈസ് ചെയ്യാൻ ബുദ്ധിമുട്ടില്ലാത്ത സ്കെയ്ലിംഗ് നടപ്പിൽ കൊണ്ടുവരുക:

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

### 4. ഷെഡ്യൂൾ ചെയ്ത സ്കെയ്ലിംഗ്

ഓഫ്-ഹവേഴ്സിനിടെ സ്കെയിൽ ഡൗൺ ചെയ്യുക:

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

## പ്രകടന പരിഗണനകൾ

### അടിസ്ഥാന പ്രകടന ആവശ്യകതകൾ

SKU തിരഞ്ഞെടുക്കുന്നതിനു മുൻപ് വ്യക്തമായ പ്രകടന ആവശ്യകതകൾ നിർവചിക്കുക:

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

### ലോഡ് ടെസ്റ്റിംഗ്

പ്രകടന സത്യാപനത്തിന് വ്യത്യസ്ത SKUകൾ പരിശോധിക്കുക:

```bash
# Azure ലോഡ് ടെസ്റ്റിംഗ് സേവനം
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### നിരീക്ഷണവും ഓപ്റ്റിമൈസേഷനും

സമഗ്രമായ നിരീക്ഷണം ക്രമീകരിക്കുക:

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

## ദ്രുത റഫറൻസ് പട്ടികകൾ

### App Service SKU ദ്രുത റഫറൻസ്

| SKU | ടിയർ | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | ഡെവലപ്പ്മെന്റ് |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | ചെറിയ ആപ്ലിക്കണുകൾ |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | പ്രൊഡക്ഷൻ |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | ഉയർന്ന പ്രകടനം |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | എന്റർപ്രൈസ് |

### SQL ഡാറ്റാബേസ് SKU ദ്രുത റഫറൻസ്

| SKU | ടിയർ | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | ഡെവലപ്പ്മെന്റ് |
| S2 | Standard | 50 DTU | 250GB | $$ | ചെറിയ പ്രൊഡക്ഷൻ |
| P2 | Premium | 250 DTU | 1TB | $$$ | ഉയർന്ന പ്രകടനം |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | ബാലൻസ്ഡ് ഉപയോഗം |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | ദൗത്യ-നിർണ്ണായക ഉപയോഗം |

### Container Apps SKU ദ്രുത റഫറൻസ്

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | ഡെവലപ്പ്മെന്റ്, വ്യത്യസ്ത ലോഡ് |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | പ്രൊഡക്ഷൻ |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | ഉയർന്ന പ്രകടനം |

---

## സാധുത പരിശോധനാ ഉപകരണങ്ങൾ

### SKU Availability Checker

```bash
#!/bin/bash
# ലക്ഷ്യ മേഖലയിൽ SKU ലഭ്യത പരിശോധിക്കുക

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

# օգտագործం
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# ചെലവ് അനുമാനം നടത്തുന്നതിനുള്ള PowerShell സ്ക്രിപ്റ്റ്
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
        
        # Azure Pricing API അല്ലെങ്കിൽ കാൽക്കുലേറ്റർ ഉപയോഗിക്കുക
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# ഉപയോഗം
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Performance Validation

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

## മികച്ച പ്രവർത്തനരീതികളുടെ സംഗ്രഹം

### ചെയ്യേണ്ടത്

1. **ചെറുതിയായി തുടങ്ങുക, ആവശ്യപ്പെട്ടപ്പോഴാണ് സ്കെയിൽ ചെയ്യുക** യഥാർത്ഥ ഉപയോഗത്തിന്റെ അടിസ്ഥാനത്തിൽ
2. **വിഭിന്ന പരിസ്ഥിതികൾക്കായി വ്യത്യസ്ത SKUകൾ ഉപയോഗിക്കുക**
3. **പ്രകടനവും ചെലവുകളും തുടർച്ചയായി നിരീക്ഷിക്കുക**
4. **പ്രൊഡക്ഷൻ വർക്ക്‌ലോഡുകൾക്കായി റിസർവഡ് കപ്പാസിറ്റി ഉപയോഗിക്കുക**
5. **ഉചിതമായ സ്ഥലങ്ങളിൽ ഓട്ടോ-സ്കെയ്ലിംഗ് നടപ്പാക്കുക**
6. **യഥാർത്ഥപരമായ വർക്ക്‌ലോഡുകളുമായി പ്രകടനം പരീക്ഷിക്കുക**
7. **വളർച്ചയ്ക്കായി പദ്ധതിയിടുക, പക്ഷേ അമിതമായ പ്രൊവിഷനിംഗ് ഒഴിവാക്കുക**
8. **ഡെവലപ്പ്മെന്റിന് ഫ്രീ ടിയറുകൾ ഉപയോഗിക്കുക എത്രയും സാധ്യമെങ്കിൽ**

### ചെയ്യരുതാത്തത്

1. **ഡെവലപ്പ്മെന്റിനായി പ്രൊഡക്ഷൻ SKUകൾ ഉപയോഗിക്കരുത്**
2. **പ്രാദേശിക SKU ലഭ്യത അവഗണിക്കരുത്**
3. **ഡാറ്റ ട്രാൻസ്ഫർ ചെലവുകൾ മറക്കരുത്**
4. **യുക്തിവില്ലാതെ അമിത പ്രൊവിഷനിംഗ് ചെയ്യരുത്**
5. **അനുഭutel പാദഭാഗങ്ങളുടെ സ്വാധീനം അവഗണിക്കരുത്**
6. **ഓട്ടോ-സ്കെയ്ലിംഗ് പരിധികൾ വളരെ ഉയരത്തിലാക്കരുത്**
7. **കമ്പ്ലയൻസ് ആവശ്യകതകൾ മറക്കരുത്**
8. **വിലയെ മാത്രം അടിസ്ഥാനമാക്കി തീരുമാനങ്ങൾ എടുക്കരുത്**

---

**പ്രോ ടിപ്പ്**: യഥാർത്ഥ ഉപയോഗ പാറ്റേണുകളിന്റെ അടിസ്ഥാനത്തിൽ നിങ്ങളുടെ SKU തിരഞ്ഞെടുപ്പുകൾ ഓപ്റ്റിമൈസ് ചെയ്യുന്നതിന് Azure Cost Management and Advisor ഉപയോഗിച്ച് വ്യക്തിഗത ശുപാർശകൾ നേടുക.

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [ശേഷി പദ്ധതിയിടൽ](capacity-planning.md)
- **അടുത്ത പാഠം**: [പ്രീ-ഫ്ലൈറ്റ് പരിശോധനകൾ](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്ക്ലെയിമർ:
ഈ ദസ്താവേജ് AI വിവർത്തന സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതക്കായി ശ്രമിക്കുന്നുണ്ടെങ്കിലും ഓട്ടോമാറ്റഡ് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ അപകൃതതകൾ ഉണ്ടാവാൻ സാധ്യതയുണ്ട് എന്ന് ദയവായി ശ്രദ്ധിക്കുക. മാതൃഭാഷയിലുള്ള മൂല ദസ്താവേവ് പ്രാമാണിക ഉറവിടമായി പരിഗണിക്കേണ്ടതാണ്. നിർണായകമായ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണകൾക്കും തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കുമുള്ള ഉത്തരവാദിത്വം ഞങ്ങൾ ഏറ്റെടുക്കാറില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->