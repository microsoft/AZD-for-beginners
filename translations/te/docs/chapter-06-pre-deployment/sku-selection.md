# SKU Selection Guide - Choosing the Right Azure Service Tiers

**Chapter Navigation:**
- **📚 Course Home**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 6 - ప్రి-డిప్లాయ్‌మెంట్ ధ్రువీకరణ మరియు ప్రణాళిక
- **⬅️ Previous**: [Capacity Planning](capacity-planning.md)
- **➡️ Next**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Next Chapter**: [అధ్యాయం 7: సమస్య పరిష్కరణ](../chapter-07-troubleshooting/common-issues.md)

## పరిచయం

ఈ సమగ్ర మార్గదర్శకము వివిధ పర్యావరణాలు, వర్క్‌లోడ్లు మరియు అవసరాల కోసం అనుకూల Azure సేవ SKUలు (Stock Keeping Units) ను ఎంచుకునే విధానంలో మీకు సహాయపడుతుంది. మీ Azure Developer CLI డిప్లాయ్‌మెంట్‌ల కోసం అభిమానమైన సేవా స్థాయిలను ఎంచుకోవడానికి పనితీరు అవసరాలు, ఖర్చు పరామర్శలు మరియు స్కేలబిలిటీ అవసరాలను విశ్లేషించడం నేర్చుకోండి.

## నేర్చుకునే లక్ష్యాలు

ఈ మార్గదర్శకాన్ని పూర్తి చేసిన తర్వాత, మీరు:
- Azure SKU కాన్సెప్ట్స్, ధర నమూనాలు, మరియు ఫీచర్ తేడాలను అర్థం చేసుకుంటారు
- development, staging, మరియు production కోసం పర్యావరణ-నిర్దిష్ట SKU ఎంపిక వ్యూహాలలో నైపుణ్యాన్ని సంపాదిస్తారు
- వర్క్‌లోడ్ అవసరాలను విశ్లేషించి వాటిని సరైన సేవా స్థాయిలకు సరిపోల్చడం నేర్చుకుంటారు
- తెలివైన SKU ఎంపిక ద్వారా ఖర్చు ఆప్టిమైజేషన్ వ్యూహాలను అమలు చేస్తారు
- SKU ఎంపికల కోసం పనితీరు పరీక్ష మరియు ధృవీకరణ సాంకేతికతలను వర్తింపజేస్తారు
- ఆటోమేటెడ్ SKU సిఫార్సులు మరియు మానిటరింగ్‌ను కాంఫిగర్ చేస్తారు

## నేర్చుకున్న ఫలితాలు

పూర్తి చేసిన తర్వాత, మీరు సాధించగలుగుతారు:
- వర్క్‌లోడ్ అవసరాలు మరియు పరిమితులను ఆధారంగా సరైన Azure సేవ SKUలను ఎంచుకోవచ్చు
- సరైన స్థాయి ఎంపికతో ఖర్చు-సమర్థమైన బహు-పర్యావరణ నిర్మాణాలను డిజైన్ చేయండి
- SKU ఎంపికల కోసం పనితీరు బెంచ్మార్కింగ్ మరియు ధృవీకరణను అమలు చేయండి
- SKU సిఫారసుల మరియు ఖర్చు ఆప్టిమైజేషన్ కోసం ఆటోమేటెడ్ టూల్స్ సృష్టించండి
- మారుతున్న అవసరాల కోసం SKU మైగ్రేషన్లు మరియు స్కేలింగ్ వ్యూహాలను ప్లాన్ చేయండి
- సేవా స్థాయి ఎంపికలో Azure Well-Architected Framework సూత్రాలను వర్తింపజేయండి

## సూచిక పట్టిక

- [Understanding SKUs](../../../../docs/chapter-06-pre-deployment)
- [Environment-Based Selection](../../../../docs/chapter-06-pre-deployment)
- [Service-Specific Guidelines](../../../../docs/chapter-06-pre-deployment)
- [Cost Optimization Strategies](../../../../docs/chapter-06-pre-deployment)
- [Performance Considerations](../../../../docs/chapter-06-pre-deployment)
- [Quick Reference Tables](../../../../docs/chapter-06-pre-deployment)
- [Validation Tools](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### SKUs అంటే ఏమిటి?

SKUs (Stock Keeping Units) అనేవి Azure రిసోర్సుల కోసం వివిధ సేవా స్థాయిలు మరియు పనితీరు స్థాయిలను సూచిస్తాయి. ప్రతి SKU వివిధ విషయాలను అందిస్తుంది:

- **పనితీరు లక్షణాలు** (CPU, మెమరీ, థ్రూపుట్)
- **ఫీచర్ లభ్యత** (స్కేలింగ్ ఎంపికలు, SLA స్థాయిలు)
- **ధర నమూనాలు** (ఖర్చు-పరిమాణంపై ఆధారంగా, రిజర్వుడ్ కెపాసిటీ)
- **ప్రాంతీయ లభ్యత** (ప్రతి ప్రాంతంలో అన్ని SKUలు లభ్యం ఉండవు)

### SKU ఎంపికలో కీలక factorలు

1. **వర్క్‌లోడ్ అవసరాలు**
   - అంచనా ట్రాఫిక్/లొడ్ నమూనాలు
   - పనితీరు అవసరాలు (CPU, మెమరీ, I/O)
   - నిల్వ అవసరాలు మరియు యాక్సెస్ నమూనాలు

2. **పర్యావరణ రకం**
   - Development/testing వర్సెస్ production
   - లభ్యత అవసరాలు
   - సెక్యూరిటీ మరియు కంప్లయెన్స్ అవసరాలు

3. **బడ్జెట్ పరిమితులు**
   - ప్రారంభ ఖర్చులు వర్సెస్ ఆపరేషన్ ఖర్చులు
   - రిజర్వ్డ్ కెపాసిటీ డిస్కౌంట్లు
   - ఆటో-స్కేలింగ్ ఖర్చు ప్రభావాలు

4. **వృద్ధి అంచనాలు**
   - స్కేల‌బిలిటీ అవసరాలు
   - భవిష్యత్ ఫీచర్ అవసరాలు
   - మైగ్రేషన్ సంక్లిష్టత

---

## Environment-Based Selection

### Development Environment

**ప్రాధాన్యతలు**: ఖర్చు ఆప్టిమైజేషన్, మౌలిక కార్యాచరణ, సులభం provisioning/de-provisioning

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

#### లక్షణాలు
- **App Service**: సాదారణ పరీక్షల కోసం F1 (Free) లేదా B1 (Basic)
- **Databases**: కనిష్ట వనరులతో Basic tier
- **Storage**: స్థానిక రిడండన్సీతో Standard మాత్రమే
- **Compute**: షేర్డ్ రిసోర్సులు అనుకూలం
- **Networking**: ప్రాథమిక కట్టింగ్‌లు

### Staging/Testing Environment

**ప్రాధాన్యతలు**: ప్రొడక్షన్‌లాగా కాన్ఫిగరేషన్, ఖర్చు సమతుల్యం, పనితీరు పరీక్ష సామర్థ్యం

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

#### లక్షణాలు
- **Performance**: ప్రొడక్షన్ సామర్ధ్యానికి 70-80%
- **Features**: బహుళ ప్రొడక్షన్ ఫీచర్‌లు ఎనేబుల్ చేయబడినవి
- **Redundancy**: కొంత భౌగోళిక redundancy
- **Scaling**: పరీక్షలకి పరిమిత ఆటో-స్కేలింగ్
- **Monitoring**: పూర్తయ్యిన మానిటరింగ్ స్టాక్

### Production Environment

**ప్రాధాన్యతలు**: పనితీరు, లభ్యత, భద్రత, కంప్లయెన్స్, స్కేల‌బిలిటీ

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

#### లక్షణాలు
- **High availability**: 99.9%+ SLA అవసరాలు
- **Performance**: డెడికేటెడ్ వనరులు, అధిక థ్రూపుట్
- **Security**: ప్రీమియం సెక్యూరిటీ ఫీచర్లు
- **Scaling**: పూర్తి ఆటో-స్కేలింగ్ సామర్థ్యాలు
- **Monitoring**: సమగ్ర observability

---

## Service-Specific Guidelines

### Azure App Service

#### SKU Decision Matrix

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | ఖర్చుకు అనుకూలం, పరీక్షలకు తగినంత |
| Small production apps | S1 (Standard) | కస్టమ్ డొమైన్‌లు, SSL, ఆటో-స్కేలింగ్ |
| Medium production apps | P1V3 (Premium V3) | మెరుగైన పనితీరు, మరిన్ని ఫీచర్‌లు |
| High-traffic apps | P2V3 or P3V3 | డెడికేటెడ్ వనరులు, అధిక పనితీరు |
| Mission-critical apps | I1V2 (Isolated V2) | నెట్‌వర్క్ ఐసోలేషన్, డెడికేటెడ్ హార్డ్వేర్ |

#### Configuration Examples

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

#### SKU Selection Framework

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - Development/testing
   - **Standard**: S0-S12 (10-3000 DTU) - సాధారణ ఉద్దేశ్యాలు
   - **Premium**: P1-P15 (125-4000 DTU) - పనితీరు-నిర్ణయక

2. **vCore-based** (Productionకి సిఫార్సు చేయబడింది)
   - **General Purpose**: సమతుల్య compute మరియు storage
   - **Business Critical**: తక్కువ లేటెన్సీ, అధిక IOPS
   - **Hyperscale**: అత్యధికంగా స్కేలబుల్ నిల్వ (అంతరించు 100TB వరకు)

#### ఉదాహరణ కాన్ఫిగరేషన్లు

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

1. **Consumption-based**
   - Pay-per-use pricing
   - development మరియు మార్పిడి వర్క్‌లోడ్స్ కు సర్దుబాటు
   - షేర్డ్ ఇన్‌ఫ్రాస్ట్రక్చర్

2. **Dedicated (Workload Profiles)**
   - డెడికేటెడ్ compute వనరులు
   - ఊహించదగిన పనితీరు
   - ప్రొడక్షన్ వర్క్‌లోడ్స్ కోసం మెరుగ్గా

#### Configuration Examples

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

#### Throughput Models

1. **Manual Provisioned Throughput**
   - ఊహించదగిన పనితీరు
   - రిజర్వ్డ్ కెపాసిటీ డిస్కౌంట్లు
   - స్థిరమైన వర్క్‌లోడ్స్‌కు ఉత్తమం

2. **Autoscale Provisioned Throughput**
   - ఉపయోగంపై ఆధారపడి ఆటోమేటిక్ స్కేల్ అవుతుంది
   - మీరు ఉపయోగించే మేరకు చెల్లించండి (కనిష్టతో)
   - మార్పిడీత్వ వర్క్‌లోడ్స్‌కు మంచిది

3. **Serverless**
   - ప్ర‌తి-రెక్వెస్ట్‌కు చెల్లింపు
   - ప్రోవిజన్డ్ throughput అవసరం లేదు
   - development మరియు మధ్యంతర వర్క్‌లోడ్స్‌కు идеల్

#### SKU Examples

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

#### Storage Account Types

1. **Standard_LRS** - Development, non-critical data
2. **Standard_GRS** - Production, geo-redundancy అవసరమైనప్పుడు
3. **Premium_LRS** - అధిక పనితీరు అప్లికేషన్స్
4. **Premium_ZRS** - జోన్ రిడండన్సీతో అధిక లభ్యత

#### Performance Tiers

- **Standard**: సాధారణ ఉద్దేశ్యం, ఖర్చుకు అనుకూలం
- **Premium**: అధిక పనితీరు, తక్కువ లేటెన్సీ పరిస్థితులు

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

## Cost Optimization Strategies

### 1. Reserved Capacity

1-3 సంవత్సరాల కోసం వనరులను రిజర్వ్ చేయండి భారీ డిస్కౌంట్స్ కోసం:

```bash
# రిజర్వేషన్ ఎంపికలను తనిఖీ చేయండి
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

చిన్న SKUలతో ప్రారంభించి వాస్తవ వినియోగంపై ఆధారంగా పెంచండి:

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

### 3. Auto-Scaling Configuration

ఖర్చులను ఆప్టిమైజ్ చేయడానికి తెలివైన స్కేలింగ్ అమలు చేయండి:

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

### 4. Scheduled Scaling

ఆఫ్-ఓర్లు సమయంలో స్కేల్ డౌన్ చేయండి:

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

## Performance Considerations

### Baseline Performance Requirements

SKU ఎంపికకు ముందు స్పష్టమైన పనితీరు అవసరాలను నిర్వచించండి:

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

### Load Testing

పనితీరు ధృవీకరించడానికి వివిధ SKUలను పరీక్షించండి:

```bash
# Azure లోడ్ పరీక్ష సేవ
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring and Optimization

సమగ్ర మానిటరింగ్ సెటప్ చేయండి:

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

## Quick Reference Tables

### App Service SKU Quick Reference

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | చిన్న అప్లికేషన్లు |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | అధిక పనితీరు |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | ఎంటర్ప్రైజ్ |

### SQL Database SKU Quick Reference

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | చిన్న ప్రొడక్షన్ |
| P2 | Premium | 250 DTU | 1TB | $$$ | అధిక పనితీరు |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | సమతుల్య అవసరాలు |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | మిషన్-క్రిటికల్ |

### Container Apps SKU Quick Reference

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, మార్పిడీత్వ లోడ్ |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | అధిక పనితీరు |

---

## Validation Tools

### SKU Availability Checker

```bash
#!/bin/bash
# లక్ష్య ప్రాంతంలో SKU అందుబాటును తనిఖీ చేయండి

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

# ఉపయోగం
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# ఖర్చు అంచనా కోసం PowerShell స్క్రిప్ట్
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
        
        # Azure ధరల API లేదా క్యాల్క్యులేటర్ ఉపయోగించండి
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# ఉపయోగం
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

## ఉత్తమ ఆచరణలు (Best Practices) సంక్షిప్తం

### చేయాల్సినవి

1. **Start small and scale up** వాస్తవ వినియోగ ఆధారంగా పెంచండి
2. **Use different SKUs for different environments**
3. **Monitor performance and costs continuously**
4. **Leverage reserved capacity for production workloads**
5. **Implement auto-scaling where appropriate**
6. **Test performance with realistic workloads**
7. **Plan for growth but avoid over-provisioning**
8. **Use free tiers for development when possible**

### చేయకూడదని ఉన్నవి

1. **Don't use production SKUs for development**
2. **Don't ignore regional SKU availability**
3. **Don't forget about data transfer costs**
4. **Don't over-provision without justification**
5. **Don't ignore the impact of dependencies**
6. **Don't set auto-scaling limits too high**
7. **Don't forget about compliance requirements**
8. **Don't make decisions based on price alone**

---

**Pro Tip**: వాస్తవ వినియోగ నమూనాల ఆధారంగా మీ SKU ఎంపికలను ఆప్టిమైజ్ చేయడానికి Azure Cost Management మరియు Advisor ను ఉపయోగించండి.

---

**Navigation**
- **Previous Lesson**: [Capacity Planning](capacity-planning.md)
- **Next Lesson**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ అయిన [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా లోపాలు ఉండవచ్చునని దయచేసి గమనించండి. మూల భాషలో ఉన్న అసలు డాక్యుమెంట్నే అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదాన్ని సిఫార్సు చేస్తున్నాము. ఈ అనువాదాన్ని ఉపయోగించడం వలన ఏర్పడే ఏవైనా అవగాహనా లోపాలు లేదా తప్పుగా అర్థం చేసుకోవడాలపై మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->