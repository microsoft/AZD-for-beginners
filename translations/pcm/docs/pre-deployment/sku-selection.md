<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-11-18T19:16:47+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "pcm"
}
-->
# SKU Selection Guide - How to Choose Di Correct Azure Service Tiers

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 6 - Pre-Deployment Validation & Planning
- **⬅️ Previous**: [Capacity Planning](capacity-planning.md)
- **➡️ Next**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Next Chapter**: [Chapter 7: Troubleshooting](../troubleshooting/common-issues.md)

## Introduction

Dis guide go help you sabi how to choose di best Azure service SKUs (Stock Keeping Units) wey fit different environments, workloads, and requirements. You go learn how to check performance needs, cost wahala, and scalability requirements so you fit pick di correct service tiers for your Azure Developer CLI deployments.

## Learning Goals

When you finish dis guide, you go:
- Understand wetin Azure SKU mean, dia pricing models, and di difference for features
- Sabi how to choose SKUs wey fit development, staging, and production environments
- Analyze workload needs and match dem to di correct service tiers
- Use smart SKU selection to reduce cost
- Test and validate performance for di SKUs wey you choose
- Set up automated SKU recommendations and monitoring

## Learning Outcomes

When you don complete dis guide, you go fit:
- Pick di correct Azure service SKUs based on workload needs and limits
- Design cost-effective architectures for different environments with di correct tiers
- Do performance benchmarking and validation for di SKUs wey you choose
- Create tools wey go recommend SKUs and help reduce cost
- Plan how to migrate SKUs and scale dem for future needs
- Use Azure Well-Architected Framework principles to choose service tiers

## Table of Contents

- [Understanding SKUs](../../../../docs/pre-deployment)
- [Environment-Based Selection](../../../../docs/pre-deployment)
- [Service-Specific Guidelines](../../../../docs/pre-deployment)
- [Cost Optimization Strategies](../../../../docs/pre-deployment)
- [Performance Considerations](../../../../docs/pre-deployment)
- [Quick Reference Tables](../../../../docs/pre-deployment)
- [Validation Tools](../../../../docs/pre-deployment)

---

## Understanding SKUs

### Wetin be SKUs?

SKUs (Stock Keeping Units) na di different service tiers and performance levels wey Azure resources get. Each SKU get im own:

- **Performance characteristics** (CPU, memory, throughput)
- **Feature availability** (scaling options, SLA levels)
- **Pricing models** (consumption-based, reserved capacity)
- **Regional availability** (no be all SKUs dey available for all regions)

### Key Things to Consider for SKU Selection

1. **Workload Requirements**
   - Di kain traffic/load wey you dey expect
   - Performance needs (CPU, memory, I/O)
   - Storage needs and how you go dey access am

2. **Environment Type**
   - Development/testing vs. production
   - Availability needs
   - Security and compliance requirements

3. **Budget Constraints**
   - Initial cost vs. operational cost
   - Reserved capacity discounts
   - Cost wey auto-scaling go bring

4. **Growth Projections**
   - Scalability needs
   - Future features wey you go need
   - How hard e go be to migrate

---

## Environment-Based Selection

### Development Environment

**Priorities**: Reduce cost, basic functionality, easy to set up and remove

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
- **App Service**: F1 (Free) or B1 (Basic) for simple testing
- **Databases**: Basic tier with small resources
- **Storage**: Standard with local redundancy only
- **Compute**: Shared resources dey okay
- **Networking**: Basic setup

### Staging/Testing Environment

**Priorities**: Make e dey like production, balance cost, test performance

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
- **Performance**: 70-80% of production capacity
- **Features**: Most production features go dey enabled
- **Redundancy**: Small geographic redundancy
- **Scaling**: Small auto-scaling for testing
- **Monitoring**: Full monitoring stack

### Production Environment

**Priorities**: Performance, availability, security, compliance, scalability

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
- **High availability**: 99.9%+ SLA requirements
- **Performance**: Dedicated resources, high throughput
- **Security**: Premium security features
- **Scaling**: Full auto-scaling capabilities
- **Monitoring**: Full observability

---

## Service-Specific Guidelines

### Azure App Service

#### SKU Decision Matrix

| Use Case | Recommended SKU | Why? |
|----------|----------------|------|
| Development/Testing | F1 (Free) or B1 (Basic) | E cheap, good for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

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
   - **Standard**: S0-S12 (10-3000 DTU) - General purpose
   - **Premium**: P1-P15 (125-4000 DTU) - Performance-critical

2. **vCore-based** (Recommended for production)
   - **General Purpose**: Balanced compute and storage
   - **Business Critical**: Low latency, high IOPS
   - **Hyperscale**: Highly scalable storage (up to 100TB)

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
   - Pay-per-use pricing
   - Good for development and workloads wey dey change
   - Shared infrastructure

2. **Dedicated (Workload Profiles)**
   - Dedicated compute resources
   - Predictable performance
   - Better for production workloads

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
   - Predictable performance
   - Reserved capacity discounts
   - Best for steady workloads

2. **Autoscale Provisioned Throughput**
   - Automatic scaling based on usage
   - Pay for wetin you use (with minimum)
   - Good for workloads wey dey change

3. **Serverless**
   - Pay-per-request
   - No provisioned throughput
   - Best for development and workloads wey no dey steady

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
2. **Standard_GRS** - Production, geo-redundancy needed
3. **Premium_LRS** - High-performance applications
4. **Premium_ZRS** - High availability with zone redundancy

#### Performance Tiers

- **Standard**: General purpose, cost-effective
- **Premium**: High-performance, low-latency scenarios

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

Reserve resources for 1-3 years to get big discounts:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

Start with small SKUs and increase based on wetin you dey use:

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

Set up smart scaling to reduce cost:

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

Reduce scale during off-hours:

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

Make sure you know di performance wey you need before you choose SKU:

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

Test different SKUs to confirm performance:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring and Optimization

Set up full monitoring:

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

### Cost Estimation Script

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

### Wetin You Go Do

1. **Start small and scale up** based on wetin you dey use
2. **Use different SKUs for different environments**
3. **Monitor performance and costs steady**
4. **Use reserved capacity for production workloads**
5. **Set up auto-scaling where e make sense**
6. **Test performance with real workloads**
7. **Plan for growth but no over-provision**
8. **Use free tiers for development if e dey possible**

### Wetin You No Go Do

1. **No use production SKUs for development**
2. **No forget say some SKUs no dey available for all regions**
3. **No forget data transfer costs**
4. **No over-provision without reason**
5. **No ignore di impact of dependencies**
6. **No set auto-scaling limits too high**
7. **No forget compliance requirements**
8. **No make decisions based on price alone**

---

**Pro Tip**: Use Azure Cost Management and Advisor to get personal recommendations wey go help you optimize your SKU selections based on wetin you dey use.

---

**Navigation**
- **Previous Lesson**: [Capacity Planning](capacity-planning.md)
- **Next Lesson**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg make you sabi say automated translations fit get mistake or no dey correct well. Di original dokyument for im native language na di main source wey you go trust. For important information, e better make professional human translation dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->