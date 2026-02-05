# מדריך לבחירת SKU - בחירת רמות השירות המתאימות ב-Azure

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 6 - אימות ותכנון לפני פריסה
- **⬅️ קודם**: [תכנון קיבולת](capacity-planning.md)
- **➡️ הבא**: [בדיקות מקדימות](preflight-checks.md)
- **🚀 פרק הבא**: [פרק 7: פתרון תקלות](../troubleshooting/common-issues.md)

## הקדמה

מדריך מקיף זה יעזור לכם לבחור את ה-SKU (Stock Keeping Units) האופטימליים לשירותי Azure עבור סביבות, עומסי עבודה ודרישות שונות. תלמדו לנתח צרכי ביצועים, שיקולי עלות ודרישות יכולת הרחבה כדי לבחור את רמות השירות המתאימות ביותר לפריסות Azure Developer CLI שלכם.

## מטרות למידה

לאחר השלמת המדריך, תוכלו:
- להבין את מושגי ה-SKU של Azure, מודלי תמחור והבדלים בתכונות
- לשלוט באסטרטגיות בחירת SKU מותאמות לסביבה עבור פיתוח, בדיקות וייצור
- לנתח דרישות עומסי עבודה ולהתאים אותן לרמות השירות המתאימות
- ליישם אסטרטגיות אופטימיזציה עלויות באמצעות בחירת SKU חכמה
- לבצע בדיקות ביצועים וטכניקות אימות לבחירת SKU
- להגדיר המלצות SKU אוטומטיות וכלי ניטור

## תוצאות למידה

בסיום, תוכלו:
- לבחור SKU של שירותי Azure המתאימים לדרישות עומסי עבודה ומגבלות
- לעצב ארכיטקטורות רב-סביבתיות חסכוניות עם בחירת רמות שירות נכונה
- ליישם בדיקות ביצועים ואימות לבחירת SKU
- ליצור כלים אוטומטיים להמלצות SKU ואופטימיזציה עלויות
- לתכנן אסטרטגיות מעבר והרחבה של SKU בהתאם לדרישות משתנות
- ליישם עקרונות מסגרת Azure Well-Architected לבחירת רמות שירות

## תוכן עניינים

- [הבנת SKUs](../../../../docs/pre-deployment)
- [בחירה מבוססת סביבה](../../../../docs/pre-deployment)
- [הנחיות ספציפיות לשירותים](../../../../docs/pre-deployment)
- [אסטרטגיות אופטימיזציה עלויות](../../../../docs/pre-deployment)
- [שיקולי ביצועים](../../../../docs/pre-deployment)
- [טבלאות עזר מהירות](../../../../docs/pre-deployment)
- [כלי אימות](../../../../docs/pre-deployment)

---

## הבנת SKUs

### מה הם SKUs?

SKUs (Stock Keeping Units) מייצגים רמות שירות ורמות ביצועים שונות עבור משאבי Azure. כל SKU מציע:

- **מאפייני ביצועים** (מעבד, זיכרון, קצב העברה)
- **זמינות תכונות** (אפשרויות הרחבה, רמות SLA)
- **מודלי תמחור** (מבוסס צריכה, קיבולת שמורה)
- **זמינות אזורית** (לא כל ה-SKU זמינים בכל האזורים)

### גורמים מרכזיים בבחירת SKU

1. **דרישות עומסי עבודה**
   - דפוסי תנועה/עומס צפויים
   - דרישות ביצועים (מעבד, זיכרון, I/O)
   - צרכי אחסון ודפוסי גישה

2. **סוג סביבה**
   - פיתוח/בדיקות לעומת ייצור
   - דרישות זמינות
   - צרכי אבטחה וציות

3. **מגבלות תקציב**
   - עלויות ראשוניות לעומת עלויות תפעוליות
   - הנחות קיבולת שמורה
   - השלכות עלויות של הרחבה אוטומטית

4. **תחזיות צמיחה**
   - דרישות יכולת הרחבה
   - צרכי תכונות עתידיים
   - מורכבות מעבר

---

## בחירה מבוססת סביבה

### סביבת פיתוח

**עדיפויות**: אופטימיזציה עלויות, פונקציונליות בסיסית, הקצאה/ביטול הקצאה קלים

#### SKUs מומלצים
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

#### מאפיינים
- **App Service**: F1 (חינם) או B1 (בסיסי) לבדיקות פשוטות
- **Databases**: רמה בסיסית עם משאבים מינימליים
- **Storage**: סטנדרטי עם יתירות מקומית בלבד
- **Compute**: משאבים משותפים מתקבלים
- **Networking**: תצורות בסיסיות

### סביבת בדיקות/סטייג'ינג

**עדיפויות**: תצורה דומה לייצור, איזון עלויות, יכולת בדיקת ביצועים

#### SKUs מומלצים
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

#### מאפיינים
- **ביצועים**: 70-80% מקיבולת ייצור
- **תכונות**: רוב תכונות הייצור מופעלות
- **יתירות**: מעט יתירות גיאוגרפית
- **הרחבה**: הרחבה אוטומטית מוגבלת לבדיקות
- **ניטור**: מערך ניטור מלא

### סביבת ייצור

**עדיפויות**: ביצועים, זמינות, אבטחה, ציות, יכולת הרחבה

#### SKUs מומלצים
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

#### מאפיינים
- **זמינות גבוהה**: דרישות SLA של 99.9%+
- **ביצועים**: משאבים ייעודיים, קצב העברה גבוה
- **אבטחה**: תכונות אבטחה פרימיום
- **הרחבה**: יכולות הרחבה אוטומטית מלאות
- **ניטור**: תצפית מקיפה

---

## הנחיות ספציפיות לשירותים

### Azure App Service

#### מטריצת החלטות SKU

| שימוש | SKU מומלץ | סיבה |
|-------|-----------|------|
| פיתוח/בדיקות | F1 (חינם) או B1 (בסיסי) | חסכוני, מספיק לבדיקות |
| אפליקציות ייצור קטנות | S1 (סטנדרטי) | דומיינים מותאמים אישית, SSL, הרחבה אוטומטית |
| אפליקציות ייצור בינוניות | P1V3 (פרימיום V3) | ביצועים טובים יותר, יותר תכונות |
| אפליקציות עם תנועה גבוהה | P2V3 או P3V3 | משאבים ייעודיים, ביצועים גבוהים |
| אפליקציות קריטיות | I1V2 (מבודד V2) | בידוד רשת, חומרה ייעודית |

#### דוגמאות תצורה

**פיתוח**
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

**ייצור**
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

#### מסגרת בחירת SKU

1. **מבוסס DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - פיתוח/בדיקות
   - **Standard**: S0-S12 (10-3000 DTU) - שימוש כללי
   - **Premium**: P1-P15 (125-4000 DTU) - קריטי לביצועים

2. **מבוסס vCore** (מומלץ לייצור)
   - **General Purpose**: איזון בין מחשוב ואחסון
   - **Business Critical**: זמן תגובה נמוך, IOPS גבוה
   - **Hyperscale**: אחסון ניתן להרחבה (עד 100TB)

#### דוגמאות תצורה

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

#### סוגי סביבות

1. **מבוסס צריכה**
   - תמחור לפי שימוש
   - מתאים לפיתוח ועומסים משתנים
   - תשתית משותפת

2. **ייעודי (פרופילי עומס עבודה)**
   - משאבי מחשוב ייעודיים
   - ביצועים צפויים
   - טוב לעומסי עבודה בייצור

#### דוגמאות תצורה

**פיתוח (צריכה)**
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

**ייצור (ייעודי)**
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

#### מודלי קצב העברה

1. **קצב העברה מוקצה ידנית**
   - ביצועים צפויים
   - הנחות קיבולת שמורה
   - מתאים לעומסים יציבים

2. **קצב העברה אוטומטי**
   - הרחבה אוטומטית לפי שימוש
   - תשלום לפי שימוש (עם מינימום)
   - טוב לעומסים משתנים

3. **ללא שרת**
   - תשלום לפי בקשה
   - ללא קצב העברה מוקצה
   - אידיאלי לפיתוח ועומסים לסירוגין

#### דוגמאות SKU

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

#### סוגי חשבונות אחסון

1. **Standard_LRS** - פיתוח, נתונים לא קריטיים
2. **Standard_GRS** - ייצור, צורך ביתירות גיאוגרפית
3. **Premium_LRS** - אפליקציות ביצועים גבוהים
4. **Premium_ZRS** - זמינות גבוהה עם יתירות אזורית

#### רמות ביצועים

- **Standard**: שימוש כללי, חסכוני
- **Premium**: ביצועים גבוהים, תרחישים עם זמן תגובה נמוך

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

## אסטרטגיות אופטימיזציה עלויות

### 1. קיבולת שמורה

הקצו משאבים ל-1-3 שנים להנחות משמעותיות:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. התאמת גודל

התחילו עם SKUs קטנים והרחיבו לפי שימוש בפועל:

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

### 3. תצורת הרחבה אוטומטית

יישמו הרחבה חכמה לאופטימיזציה עלויות:

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

### 4. הרחבה מתוזמנת

הקטינו משאבים בשעות שאינן פעילות:

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

## שיקולי ביצועים

### דרישות ביצועים בסיסיות

הגדירו דרישות ביצועים ברורות לפני בחירת SKU:

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

### בדיקות עומס

בדקו SKUs שונים לאימות ביצועים:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### ניטור ואופטימיזציה

הגדירו ניטור מקיף:

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

## טבלאות עזר מהירות

### טבלת עזר מהירה ל-SKU של App Service

| SKU | רמה | vCPU | RAM | אחסון | טווח מחירים | שימוש |
|-----|-----|------|-----|-------|-------------|-------|
| F1 | חינם | משותף | 1GB | 1GB | חינם | פיתוח |
| B1 | בסיסי | 1 | 1.75GB | 10GB | $ | אפליקציות קטנות |
| S1 | סטנדרטי | 1 | 1.75GB | 50GB | $$ | ייצור |
| P1V3 | פרימיום V3 | 2 | 8GB | 250GB | $$$ | ביצועים גבוהים |
| I1V2 | מבודד V2 | 2 | 8GB | 1TB | $$$$ | ארגוני |

### טבלת עזר מהירה ל-SKU של SQL Database

| SKU | רמה | DTU/vCore | אחסון | טווח מחירים | שימוש |
|-----|-----|-----------|-------|-------------|-------|
| Basic | בסיסי | 5 DTU | 2GB | $ | פיתוח |
| S2 | סטנדרטי | 50 DTU | 250GB | $$ | ייצור קטן |
| P2 | פרימיום | 250 DTU | 1TB | $$$ | ביצועים גבוהים |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | מאוזן |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | קריטי |

### טבלת עזר מהירה ל-SKU של Container Apps

| מודל | תמחור | CPU/Memory | שימוש |
|------|-------|------------|-------|
| צריכה | תשלום לפי שימוש | 0.25-2 vCPU | פיתוח, עומס משתנה |
| ייעודי D4 | שמור | 4 vCPU, 16GB | ייצור |
| ייעודי D8 | שמור | 8 vCPU, 32GB | ביצועים גבוהים |

---

## כלי אימות

### בודק זמינות SKU

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

### סקריפט הערכת עלויות

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

### אימות ביצועים

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

## סיכום שיטות עבודה מומלצות

### מה כדאי לעשות

1. **התחילו קטן והרחיבו** לפי שימוש בפועל
2. **השתמשו ב-SKU שונים לסביבות שונות**
3. **נטרו ביצועים ועלויות באופן רציף**
4. **נצלו קיבולת שמורה לעומסי עבודה בייצור**
5. **יישמו הרחבה אוטומטית במידת הצורך**
6. **בדקו ביצועים עם עומסי עבודה מציאותיים**
7. **תכננו צמיחה אך הימנעו מהקצאת יתר**
8. **השתמשו ברמות חינם לפיתוח כשאפשר**

### מה לא כדאי לעשות

1. **אל תשתמשו ב-SKU של ייצור לפיתוח**
2. **אל תתעלמו מזמינות אזורית של SKU**
3. **אל תשכחו עלויות העברת נתונים**
4. **אל תקצו יתר ללא הצדקה**
5. **אל תתעלמו מהשפעת תלותים**
6. **אל תקבעו גבולות הרחבה אוטומטית גבוהים מדי**
7. **אל תשכחו דרישות ציות**
8. **אל תקבלו החלטות רק על סמך מחיר**

---

**טיפ מקצועי**: השתמשו ב-Azure Cost Management ו-Advisor לקבלת המלצות מותאמות אישית לאופטימיזציה של בחירת ה-SKU שלכם בהתבסס על דפוסי שימוש בפועל.

---

**ניווט**
- **שיעור קודם**: [תכנון קיבולת](capacity-planning.md)
- **שיעור הבא**: [בדיקות מקדימות](preflight-checks.md)

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.