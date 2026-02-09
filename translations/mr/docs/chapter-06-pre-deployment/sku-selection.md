# SKU निवड मार्गदर्शक - योग्य Azure सेवा स्तर निवडणे

**Chapter Navigation:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 6 - पूर्व-तैनाती सत्यापन आणि नियोजन
- **⬅️ Previous**: [क्षमता नियोजन](capacity-planning.md)
- **➡️ Next**: [पूर्व-तपासण्या](preflight-checks.md)
- **🚀 Next Chapter**: [अध्याय 7: त्रुटी निराकरण](../chapter-07-troubleshooting/common-issues.md)

## Introduction

हे सर्वसमावेशक मार्गदर्शक वेगवेगळ्या वातावरणांसाठी, वर्कलोडसाठी आणि गरजांसाठी अनुकूल Azure सेवा SKU (Stock Keeping Units) निवडण्यास मदत करते. आपल्या Azure Developer CLI तैनातींसाठी सर्वात योग्य सेवा स्तर निवडण्यासाठी कार्यक्षमता आवश्यकता, खर्च विचार आणि स्केलेबिलिटी आवश्यकता कशा विश्लेषित करायच्या ते शिका.

## Learning Goals

हा मार्गदर्शक पूर्ण केल्यावर आपण:
- Azure SKU संकल्पना, किंमत मॉडेल आणि वैशिष्ट्ये यातील फरक समजून घेणार
- विकास, स्टेजिंग आणि उत्पादनासाठी वातावरण-विशिष्ट SKU निवड धोरणे आचरणात आणणार
- वर्कलोड आवश्यकता विश्लेषित करून त्या अनुरूप सेवा स्तरांची जुळवाजुळव करणार
- बुद्धीमत्तेने SKU निवडून खर्च सुधारणा धोरणे अंमलात आणणार
- SKU निवडींसाठी परफॉर्मन्स चाचणी आणि पडताळणी तंत्र वापरून पाहणार
- स्वयंचलित SKU शिफारसी आणि मॉनिटरिंग कॉन्फिगर करणार

## Learning Outcomes

पूर्ण झाल्यावर, आपण सक्षम असाल:
- वर्कलोड आवश्यकता आणि मर्यादा लक्षात घेऊन योग्य Azure सेवा SKU निवडण्यास
- योग्य टियर निवडीसह किफायतशीर मल्टी-एन्व्हायर्नमेंट आर्किटेक्चर डिझाइन करण्यास
- SKU निवडींसाठी परफॉर्मन्स बेंचमार्किंग आणि पडताळणी अंमलात आणण्यासाठी
- SKU शिफारसी आणि खर्च ऑप्टिमायझेशनसाठी स्वयंचलित साधने तयार करण्यास
- बदलत्या आवश्यकतांसाठी SKU स्थलांतर आणि स्केलिंग धोरणे नियोजित करण्यास
- सेवा स्तर निवडीमध्ये Azure Well-Architected Framework तत्त्वे लागू करण्यास

## Table of Contents

- [Understanding SKUs](../../../../docs/chapter-06-pre-deployment)
- [Environment-Based Selection](../../../../docs/chapter-06-pre-deployment)
- [Service-Specific Guidelines](../../../../docs/chapter-06-pre-deployment)
- [Cost Optimization Strategies](../../../../docs/chapter-06-pre-deployment)
- [Performance Considerations](../../../../docs/chapter-06-pre-deployment)
- [Quick Reference Tables](../../../../docs/chapter-06-pre-deployment)
- [Validation Tools](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### What are SKUs?

SKU (Stock Keeping Units) हे Azure संसाधनांसाठी भिन्न सेवा टियर आणि कार्यक्षमता पातळ्यांचे प्रतिनिधित्व करतात. प्रत्येक SKU वेगवेगळे प्रदान करते:

- **Performance characteristics** (CPU, मेमरी, थ्रूपुट)
- **Feature availability** (स्केलिंग पर्याय, SLA पातळ्या)
- **Pricing models** (वापर-आधारित, राखीव क्षमता)
- **Regional availability** (सर्व प्रदेशांत सर्व SKU उपलब्ध नसतात)

### Key Factors in SKU Selection

1. **Workload Requirements**
   - अपेक्षित ट्रॅफिक/लोड पॅटर्न
   - कार्यक्षमता आवश्यकता (CPU, मेमरी, I/O)
   - स्टोरेज गरजा आणि प्रवेश पॅटर्न

2. **Environment Type**
   - विकास/चाचणी विरुद्ध उत्पादन
   - उपलब्धता आवश्यकता
   - सुरक्षा आणि अनुपालन गरजा

3. **Budget Constraints**
   - प्रारंभिक खर्च विरुद्ध ऑपरेशनल खर्च
   - राखीव क्षमता सूट
   - ऑटो-स्केलिंगचे खर्च प्रभाव

4. **Growth Projections**
   - स्केलेबिलिटी आवश्यकता
   - भविष्यातील वैशिष्ट्ये गरजा
   - स्थलांतराची जटिलता

---

## Environment-Based Selection

### Development Environment

**Priorities**: खर्च कमी करणे, मूलभूत कार्यक्षमता, सोपी प्रोव्हिजनिंग/डिप्रोव्हिजनिंग

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

#### Characteristics
- **App Service**: F1 (मुफ्त) किंवा B1 (Basic) साध्या चाचणीसाठी
- **Databases**: किमान संसाधनांसह Basic टियर
- **Storage**: स्थानिक रेडंडन्सीसह Standard
- **Compute**: शेअर केलेले संसाधने स्वीकार्य
- **Networking**: मूलभूत कॉन्फिगरेशन

### Staging/Testing Environment

**Priorities**: उत्पादनासारखी कॉन्फिगरेशन, खर्च संतुलन, परफॉर्मन्स चाचणी क्षमता

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

#### Characteristics
- **Performance**: उत्पादन क्षमतेचा 70-80%
- **Features**: बहुतेक उत्पादन वैशिष्ट्ये सक्षम
- **Redundancy**: काही भौगोलिक पुनरावृत्ती
- **Scaling**: चाचणीसाठी मर्यादित ऑटो-स्केलिंग
- **Monitoring**: संपूर्ण मॉनिटरिंग स्टॅक

### Production Environment

**Priorities**: कार्यक्षमता, उपलब्धता, सुरक्षा, अनुपालन, स्केलेबिलिटी

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

#### Characteristics
- **High availability**: 99.9%+ SLA आवश्यकता
- **Performance**: समर्पित संसाधने, उच्च थ्रूपुट
- **Security**: प्रीमियम सुरक्षा वैशिष्ट्ये
- **Scaling**: संपूर्ण ऑटो-स्केलिंग क्षमता
- **Monitoring**: व्यापक ऑब्झर्व्हेबिलिटी

---

## Service-Specific Guidelines

### Azure App Service

#### SKU Decision Matrix

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (मुफ्त) किंवा B1 (Basic) | किफायतशीर, चाचणीसाठी पुरेसे |
| Small production apps | S1 (Standard) | कस्टम डोमेन, SSL, ऑटो-स्केलिंग |
| Medium production apps | P1V3 (Premium V3) | चांगल्या परफॉर्मन्ससाठी, अधिक वैशिष्ट्ये |
| High-traffic apps | P2V3 किंवा P3V3 | समर्पित संसाधने, उच्च कार्यक्षमता |
| Mission-critical apps | I1V2 (Isolated V2) | नेटवर्क विभाजन, समर्पित हार्डवेअर |

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
   - **Basic**: 5 DTU - विकास/चाचणी
   - **Standard**: S0-S12 (10-3000 DTU) - सर्वसाधारण उद्देश
   - **Premium**: P1-P15 (125-4000 DTU) - कार्यक्षमता-सम्वेदनशील

2. **vCore-based** (उत्पादनासाठी शिफारस)
   - **General Purpose**: संतुलित कंप्यूट आणि स्टोरेज
   - **Business Critical**: कमी विलंब, उच्च IOPS
   - **Hyperscale**: अत्यंत स्केलेबल स्टोरेज (100TB पर्यंत)

#### Example Configurations

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
   - प्रति-वापर किंमत मॉडेल
   - विकास आणि बदलत्या वर्कलोडसाठी योग्य
   - शेअर केलेली पायाभूत सुविधा

2. **Dedicated (Workload Profiles)**
   - समर्पित कंप्यूट संसाधने
   - भाकीत करता येण्याजोगी कार्यक्षमता
   - उत्पादन वर्कलोडसाठी उत्तम

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
   - भाकीत करता येण्याजोगी कार्यक्षमता
   - राखीव क्षमता सूट
   - स्थिर वर्कलोडसाठी उत्तम

2. **Autoscale Provisioned Throughput**
   - वापरावर आधारित स्वयंचलित स्केलिंग
   - कमी-तपासणीवर वापरासाठी परवाना (किमान अस्तित्वासह)
   - बदलत्या वर्कलोडसाठी योग्य

3. **Serverless**
   - प्रति-रिक्वेस्ट भरणे
   - प्रोव्हिजन केलेले थ्रूपुट नाही
   - विकास व विरळ वर्कलोडसाठी आदर्श

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

1. **Standard_LRS** - विकास, नॉन-क्रिटिकल डेटा
2. **Standard_GRS** - उत्पादन, भू-रेडंडन्सी आवश्यक
3. **Premium_LRS** - उच्च-कार्यक्षम अनुप्रयोगांसाठी
4. **Premium_ZRS** - झोन रेडंडन्सीसह उच्च उपलब्धता

#### Performance Tiers

- **Standard**: सामान्य उद्देश, किफायतशीर
- **Premium**: उच्च-कार्यक्षमता, कमी विलंब परिस्थिती

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

सिग्निफिकंट सूटसाठी 1-3 वर्षांसाठी संसाधने राखीव ठेवा:

```bash
# आरक्षण पर्याय तपासा
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

लहान SKU पासून सुरू करा आणि वास्तविक वापरावर आधारित स्केल अप करा:

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

### 4. Scheduled Scaling

ऑफ-आवर्स दरम्यान डाउन-स्केल करा:

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

SKU निवडण्यापूर्वी स्पष्ट परफॉर्मन्स आवश्यकता परिभाषित करा:

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

परफॉर्मन्सची पडताळणी करण्यासाठी विविध SKU तपासा:

```bash
# Azure लोड चाचणी सेवा
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring and Optimization

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

## Quick Reference Tables

### App Service SKU Quick Reference

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU Quick Reference

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Container Apps SKU Quick Reference

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## Validation Tools

### SKU Availability Checker

```bash
#!/bin/bash
# लक्ष्य प्रदेशात SKU उपलब्धता तपासा

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

# वापर
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# खर्च अंदाजासाठी PowerShell स्क्रिप्ट
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
        
        # Azure किंमतींचा API किंवा कॅल्क्युलेटर वापरा
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# वापर
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

## Best Practices Summary

### Do's

1. **Start small and scale up** based on actual usage
2. **Use different SKUs for different environments**
3. **Monitor performance and costs continuously**
4. **Leverage reserved capacity for production workloads**
5. **Implement auto-scaling where appropriate**
6. **Test performance with realistic workloads**
7. **Plan for growth but avoid over-provisioning**
8. **Use free tiers for development when possible**

### Don'ts

1. **Don't use production SKUs for development**
2. **Don't ignore regional SKU availability**
3. **Don't forget about data transfer costs**
4. **Don't over-provision without justification**
5. **Don't ignore the impact of dependencies**
6. **Don't set auto-scaling limits too high**
7. **Don't forget about compliance requirements**
8. **Don't make decisions based on price alone**

---

**Pro Tip**: Azure Cost Management आणि Advisor वापरा जेणेकरून वास्तविक वापर पॅटर्नच्या आधारावर आपल्याला SKU निवडी सुधारण्यासाठी वैयक्तिक शिफारसी मिळतील.

---

**Navigation**
- **Previous Lesson**: [क्षमता नियोजन](capacity-planning.md)
- **Next Lesson**: [पूर्व-तपासण्या](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज एआय अनुवाद सेवा Co‑op Translator (https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये त्रुटी किंवा अपूर्णता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाच्या माहितीच्या बाबतीत व्यावसायिक मानव अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थोपादनाबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->