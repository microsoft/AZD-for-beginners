# מדריך לבחירת SKU - בחירת רמות השירות המתאימות ב-Azure

**ניווט פרקים:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 6 - אימות מקדים ותכנון לפני פריסה
- **⬅️ הקודם**: [תכנון קיבולת](capacity-planning.md)
- **➡️ הבא**: [בדיקות מקדימות](preflight-checks.md)
- **🚀 הפרק הבא**: [פרק 7: פתרון בעיות](../chapter-07-troubleshooting/common-issues.md)

## הקדמה

מדריך מקיף זה עוזר לך לבחור את SKU-ים (Stock Keeping Units) האופטימליים לשירותי Azure עבור סביבות, עומסי עבודה ודרישות שונות. למד כיצד לנתח צרכי ביצועים, שיקולי עלות ודרישות סקלאביליות כדי לבחור את רמות השירות המתאימות ביותר לפריסות באמצעות Azure Developer CLI.

## מטרות למידה

By completing this guide, you will:
- להבין את מושגי ה‑SKU של Azure, מודלים של תמחור ושוני תכונות
- להתמחות באסטרטגיות בחירת SKU ייעודיות לסביבות פיתוח, בדיקה (staging) וייצור
- לנתח דרישות עומס עבודה ולהתאים אותן לרמות שירות מתאימות
- להטמיע אסטרטגיות אופטימיזציית עלויות באמצעות בחירת SKU חכמה
- להחיל טכניקות בדיקת ביצועים ואימות לבחירות SKU
- להגדיר המלצות SKU אוטומטיות ומערכות ניטור

## תוצאות למידה

Upon completion, you will be able to:
- לבחור SKU-ים מתאימים לשירותי Azure בהתבסס על דרישות ועומס העבודה וההגבלות
- לעצב ארכיטקטורות מרובות-סביבה בעלות מיטבית עם בחירת רמות מתאימות
- להטמיע מדידות ביצועים ואימות לבחירות SKU
- ליצור כלים אוטומטיים להמלצת SKU ואופטימיזציית עלויות
- לתכנן מהלכי הגירה של SKU ואסטרטגיות סקיילינג לשינויים בדרישות
- להחיל עקרונות מסגרת Azure Well-Architected על בחירת רמות שירות

## תוכן העניינים

- [הבנת SKU-ים](../../../../docs/chapter-06-pre-deployment)
- [בחירה מבוססת-סביבה](../../../../docs/chapter-06-pre-deployment)
- [הנחיות לפי שירות](../../../../docs/chapter-06-pre-deployment)
- [אסטרטגיות לאופטימיזציה של עלויות](../../../../docs/chapter-06-pre-deployment)
- [התחשבות בביצועים](../../../../docs/chapter-06-pre-deployment)
- [טבלאות עזר מהירות](../../../../docs/chapter-06-pre-deployment)
- [כלי אימות](../../../../docs/chapter-06-pre-deployment)

---

## הבנת SKUs

### מה הם SKU-ים?

SKU-ים (Stock Keeping Units) מייצגים רמות שירות וביצועים שונות עבור משאבי Azure. כל SKU מציע הבדלים ב:

- **מאפייני ביצועים** (CPU, זיכרון, throughput)
- **זמינות תכונות** (אפשרויות סקיילינג, רמות SLA)
- **מודלי תמחור** (מבוסס צריכה, קיבולת שמורה)
- **זמינות אזורית** (לא כל ה-SKU-ים זמינים בכל האזורים)

### גורמים מרכזיים בבחירת SKU

1. **דרישות עומס עבודה**
   - דפוסי תעבורה/עומס צפויים
   - דרישות ביצועים (CPU, זיכרון, I/O)
   - צרכי אחסון ודפוסי גישה

2. **סוג סביבה**
   - פיתוח/בדיקות מול ייצור
   - דרישות זמינות
   - צרכי אבטחה וציות

3. **מגבלות תקציב**
   - עלויות התחלתיות מול עלויות תפעוליות
   - הנחות על קיבולת שמורה
   - ההשלכות של סקיילינג אוטומטי על עלויות

4. **תחזיות צמיחה**
   - דרישות סקלאביליות
   - צרכי תכונות עתידיות
   - מורכבות ההגירה

---

## בחירה מבוססת-סביבה

### סביבת פיתוח

**עדיפויות**: אופטימיזציית עלות, פונקציונליות בסיסית, פריסה/הסרה קלה

#### SKU-ים מומלצים
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
- **App Service**: F1 (Free) או B1 (Basic) לבדיקות פשוטות
- **Databases**: שכבת Basic עם משאבים מינימליים
- **Storage**: Standard עם שכפול מקומי בלבד
- **Compute**: משאבים משותפים מקובלים
- **Networking**: תצורות בסיסיות

### סביבת Staging/בדיקה

**עדיפויות**: תצורה הדומה לייצור, איזון עלות וביצועים, יכולת לביצוע בדיקות ביצועים

#### SKU-ים מומלצים
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
- **Performance**: 70-80% מתפקוד הייצור
- **Features**: רוב התכונות של הייצור מופעלות
- **Redundancy**: שכפול גיאוגרפי חלקי
- **Scaling**: קנה מידה אוטומטי מוגבל לצורך בדיקות
- **Monitoring**: אמצעי ניטור מלאים

### סביבת ייצור

**עדיפויות**: ביצועים, זמינות, אבטחה, ציות (compliance), סקלאביליות

#### SKU-ים מומלצים
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
- **High availability**: דרישות SLA של 99.9%+
- **Performance**: משאבים ייעודיים, תפוקה גבוהה
- **Security**: תכונות אבטחה פרימיום
- **Scaling**: יכולות סקיילינג אוטומטיות מלאות
- **Monitoring**: יכולות תצפית מקיפות

---

## הנחיות לפי שירות

### Azure App Service

#### מטריצת החלטת SKU

| שימוש | SKU מומלץ | נימוק |
|----------|----------------|-----------|
| פיתוח/בדיקות | F1 (Free) או B1 (Basic) | חסכוני, מספק לבדיקות |
| אפליקציות ייצור קטנות | S1 (Standard) | דומיינים מותאמים, SSL, סקיילינג אוטומטי |
| אפליקציות ייצור בינוניות | P1V3 (Premium V3) | ביצועים טובים יותר, יותר תכונות |
| אפליקציות בעלות תעבורת גבוה | P2V3 או P3V3 | משאבים ייעודיים, ביצועים גבוהים |
| אפליקציות קריטיות למשימה | I1V2 (Isolated V2) | בידוד רשת, חומרה ייעודית |

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

#### מסגרת לבחירת SKU

1. **מבוסס DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - פיתוח/בדיקות
   - **Standard**: S0-S12 (10-3000 DTU) - מטרות כלליות
   - **Premium**: P1-P15 (125-4000 DTU) - קריטי מבחינת ביצועים

2. **מבוסס vCore** (מומלץ לייצור)
   - **General Purpose**: איזון בין מחשוב ואחסון
   - **Business Critical**: השהייה נמוכה, IOPS גבוהות
   - **Hyperscale**: אחסון בעל יכולת סקלאביליות גבוהה (עד 100TB)

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

#### סוגי סביבה

1. **מבוסס צריכה**
   - תמחור תשלום לפי שימוש
   - מתאים לפיתוח ולעומסי עבודה משתנים
   - תשתית משותפת

2. **מיועד (Workload Profiles)**
   - משאבי מחשוב ייעודיים
   - ביצועים צפויים
   - מתאים יותר לעומסי ייצור

#### דוגמאות תצורה

**פיתוח (מבוסס צריכה)**
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

**ייצור (מיועד)**
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

#### מודלי תפוקה

1. **תפוקה מסופקת ידנית**
   - ביצועים צפויים
   - הנחות על קיבולת שמורה
   - מתאים לעומסים יציבים

2. **תפוקה מסופקת עם סקייל אוטומטי**
   - סקיילינג אוטומטי מבוסס שימוש
   - תשלום לפי שימוש (עם מינימום)
   - טוב לעומסי עבודה משתנים

3. **Serverless**
   - תשלום לפי בקשה
   - אין תפוקת פרוביזיונינג
   - אידיאלי לפיתוח ולעומסים מזדמנים

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

### חשבון אחסון Azure

#### סוגי חשבונות אחסון

1. **Standard_LRS** - פיתוח, נתונים שאינם קריטיים
2. **Standard_GRS** - ייצור, נדרשת שכפול גיאוגרפי
3. **Premium_LRS** - אפליקציות ביצועיות גבוהות
4. **Premium_ZRS** - זמינות גבוהה עם שכפול אזורי

#### שכבות ביצועים

- **Standard**: לשימוש כללי, חסכוני
- **Premium**: ביצועים גבוהים, תרחישי השהיה נמוכה

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

## אסטרטגיות לאופטימיזציה של עלויות

### 1. קיבולת שמורה

שמרו משאבים ל-1–3 שנים כדי לקבל הנחות משמעותיות:

```bash
# בדוק אפשרויות הזמנה
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. התאמת גודל (Right-Sizing)

התחילו ב-SKU-ים קטנים יותר והגדילו על סמך שימוש אמיתי:

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

### 3. תצורת סקיילינג אוטומטי

ממשו סקיילינג חכם כדי למטב עלויות:

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

### 4. סקיילינג מתוזמן

הקטינו קיבולת בשעות שאינן שיא:

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

## התחשבות בביצועים

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

בדקו SKU-ים שונים כדי לאמת ביצועים:

```bash
# שירות בדיקות העומס של Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### ניטור ואופטימיזציה

הקימו ניטור מקיף:

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

| SKU | שכבה | vCPU | זיכרון RAM | אחסון | טווח מחירים | שימוש |
|-----|------|------|-----|---------|-------------|----------|
| F1 | חינם | משותף | 1GB | 1GB | חינם | פיתוח |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | אפליקציות קטנות |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | ייצור |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | ביצועים גבוהים |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | ארגוני |

### טבלת עזר מהירה ל-SKU של SQL Database

| SKU | שכבה | DTU/vCore | אחסון | טווח מחירים | שימוש |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | פיתוח |
| S2 | Standard | 50 DTU | 250GB | $$ | ייצור קטן |
| P2 | Premium | 250 DTU | 1TB | $$$ | ביצועים גבוהים |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | מאוזן |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | קריטי למשימה |

### טבלת עזר מהירה ל-SKU של Container Apps

| מודל | תמחור | CPU/זיכרון | שימוש |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | פיתוח, עומס משתנה |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | ייצור |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | ביצועים גבוהים |

---

## כלי אימות

### בודק זמינות SKU

```bash
#!/bin/bash
# בדוק זמינות SKU באזור היעד

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

# שימוש
check_sku_availability "eastus" "app-service" "P1V3"
```

### סקריפט להערכת עלויות

```powershell
# סקריפט PowerShell להערכת עלויות
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
        
        # השתמש ב-API לתמחור של Azure או במחשבון
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# הוראות שימוש
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

### מה כן לעשות

1. **התחילו קטן והגדילו** בהתאם לשימוש האמיתי
2. **השתמשו ב-SKU-ים שונים עבור סביבות שונות**
3. **נטרו ביצועים ועלויות באופן רצוף**
4. **היעזרו בקיבולת שמורה לעומסי ייצור**
5. **ממשו סקיילינג אוטומטי היכן שנדרש**
6. **בדקו ביצועים בעומסי עבודה ריאליים**
7. **תכננו לצמיחה אך הימנעו מהקצאה-יתר**
8. **השתמשו בשכבות חינמיות לפיתוח כאשר ניתן**

### מה לא לעשות

1. **אל תשתמשו ב-SKU-ים של ייצור לסביבת פיתוח**
2. **אל תתעלמו מזמינות SKU לפי אזור**
3. **אל תשכחו עלויות העברת נתונים**
4. **אל תבצעו הקצאה-יתר ללא הצדקה**
5. **אל תתעלמו מהשפעת התלויות**
6. **אל תקבעו מגבלות סקיילינג אוטומטי גבוהות מדי**
7. **אל תשכחו דרישות ציות**
8. **אל תקבלו החלטות על בסיס מחיר בלבד**

---

**טיפ מקצועי**: השתמשו ב-Azure Cost Management וב-Advisor לקבלת המלצות מותאמות אישית לאופטימיזציה של בחירות ה-SKU שלכם בהתבסס על דפוסי שימוש אמיתיים.

---

**ניווט**
- **שיעור קודם**: [תכנון קיבולת](capacity-planning.md)
- **שיעור הבא**: [בדיקות מקדימות](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
כתב ויתור:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית Co-op Translator (https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עלולים להכיל שגיאות או אי־דיוקים. יש להסתמך על המסמך המקורי בשפתו כמקור הסמכותי. עבור מידע קריטי מומלץ תרגום מקצועי על ידי מתרגם אנושי. איננו נושאים באחריות לכל אי־הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->