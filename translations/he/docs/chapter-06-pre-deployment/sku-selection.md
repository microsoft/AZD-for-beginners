# מדריך לבחירת SKU - כיצד לבחור את שכבות השירות המתאימות של Azure

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 6 - אימות ותכנון לפני פריסה
- **⬅️ קודם**: [תכנון קיבולת](capacity-planning.md)
- **➡️ הבא**: [בדיקות טרום-המראה](preflight-checks.md)
- **🚀 פרק הבא**: [פרק 7: פתרון תקלות](../chapter-07-troubleshooting/common-issues.md)

## מבוא

מדריך מקיף זה מסייע לכם לבחור את SKU-ים האופטימליים של שירותי Azure (יחידות מלאי) לסביבות, עומסי עבודה ודרישות שונות. למד לנתח צרכי ביצועים, שיקולי עלות ודרישות סקלאביליות כדי לבחור את שכבות השירות המתאימות ביותר לפריסות Azure Developer CLI שלך.

## יעדי הלמידה

עם השלמת מדריך זה, תוכל:
- להבין מושגים של SKU, מודלי תמחור, והבדלים בתכונות
- לשלוט באסטרטגיות בחירת SKU מותאמות לסביבה לפיתוח, אחסון וייצור
- לנתח דרישות עומס עבודה ולהתאים אותן לשכבות שירות מתאימות
- ליישם אסטרטגיות אופטימיזציית עלויות באמצעות בחירת SKU חכמה
- להחיל טכניקות בדיקות ביצועים ואימות לבחירות SKU
- לתצבר המלצות ומעקב אוטומטיים עבור SKU

## תוצאות הלמידה

עם סיום, תוכל:
- לבחור SKU-ים מתאימים של Azure על פי דרישות ומגבלות העומס
- לתכנן ארכיטקטורות רב-סביבתיות חסכוניות עם בחירת שכבות נאותה
- ליישם מדידת ביצועים ואימות עבור בחירות SKU
- ליצור כלים אוטומטיים להמלצה על SKU ואופטימיזציה של עלויות
- לתכנן אסטרטגיות מיגרציה והרחבה של SKU לשינויים בדרישות
- להחיל עקרונות מסגרת Azure Well-Architected לבחירת שכבת השירות

## תוכן העניינים

- [הבנת SKUs](#understanding-skus)
- [בחירה מבוססת סביבה](#environment-based-selection)
- [הנחיות מותאמות שירות](#service-specific-guidelines)
- [אסטרטגיות אופטימיזציה של עלויות](#cost-optimization-strategies)
- [שיקולי ביצועים](#performance-considerations)
- [טבלאות עזר מהירות](#quick-reference-tables)
- [כלי אימות](#validation-tools)

---

## הבנת SKUs

> **דוגמת תחום:** מפות SKU ב-YAML וקונפיגורציות ביצועים למטה הן הערות עיצוב, לא סכמת `azure.yaml` או הגדרת כלי טעינה. בלוקים ב-Bicep הם חלופות/שברים: הכריזו פרמטרים ומשאבים הורים, השתמשו בשמות סימבוליים ייחודיים בשילובם, וקשרו מודולים לפרויקט עובד. יש לבדוק מחירים, מגבלות וזמינות אזורית/SKU עבורך לפני פריסה.

### מה הם SKUs?

SKUs (יחידות מלאי) מייצגות שכבות שירות שונות ורמות ביצועים למשאבי Azure. כל SKU מציע:

- **מאפייני ביצועים** (CPU, זיכרון, רוחב פס)
- **זמינות תכונות** (אפשרויות סקלאביליות, רמות SLA)
- **מודלי תמחור** (מבוסס צריכה, קיבולת שמורה)
- **זמינות אזורית** (לא כל SKUs זמינים בכל האזורים)

### גורמים מרכזיים בבחירת SKU

1. **דרישות עומס עבודה**
   - תבניות תנועה/עומס צפויות
   - דרישות ביצועים (CPU, זיכרון, קלט/פלט)
   - צרכי אחסון ודפוסי גישה

2. **סוג סביבה**
   - פיתוח/בדיקה מול ייצור
   - דרישות זמינות
   - צרכי אבטחה וציות

3. **מגבלות תקציב**
   - עלויות התחלתיות מול תפעוליות
   - הנחות לקיבולת שמורה
   - השלכות עלות של אוטו-סקיילינג

4. **תחזיות צמיחה**
   - דרישות סקלאביליות
   - צרכי תכונות עתידיות
   - מורכבות מיגרציה

---

## בחירה מבוססת סביבה

### סביבת פיתוח

**עדיפויות**: אופטימיזציית עלות, פונקציונליות בסיסית, הקצאה/שחרור פשוטים

#### SKU מומלצים
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

#### מאפיינים
- **App Service**: F1 (בחינם) או B1 (בסיסי) לבדיקות פשוטות
- **מסדי נתונים**: שכבת בסיס עם מינימום משאבים
- **אחסון**: סטנדרטי עם רדנדנציה מקומית בלבד
- **חישוב**: משאבים משותפים מספיקים
- **רשת**: תצורות בסיסיות

### סביבת אחסון/בדיקה

**עדיפויות**: תצורת דומה לייצור, איזון עלויות, יכולת בדיקת ביצועים

#### SKU מומלצים
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
- **ביצועים**: 70-80% מהקיבולת של הייצור
- **תכונות**: רוב תכונות הייצור מופעלות
- **רדנדנציה**: קצת רדנדנציה גיאוגרפית
- **סקיילינג**: סקיילינג אוטומטי מוגבל לבדיקות
- **מעקב**: מחסנית מעקב מלאה

### סביבת ייצור

**עדיפויות**: ביצועים, זמינות, אבטחה, ציות, סקלאביליות

#### SKU מומלצים
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

#### מאפיינים
- **זמינות גבוהה**: דרישות SLA 99.9% ומעלה
- **ביצועים**: משאבים ייעודיים, קצב גבוה
- **אבטחה**: תכונות אבטחה פרימיום
- **סקיילינג**: יכולות סקיילינג אוטומטי מלאות
- **מעקב**: נראות מקיפה

---

## הנחיות מותאמות לשירות

### שירות האפליקציות של Azure

#### מטריצת בחירת SKU

| מקרה שימוש | SKU מומלץ | נימוק |
|----------|----------------|-----------|
| פיתוח/בדיקה | F1 (בחינם) או B1 (בסיסי) | חסכוני, מספיק לבדיקה |
| אפליקציות ייצור קטנות | S1 (סטנדרט) | דומיינים מותאמים, SSL, סקיילינג אוטומטי |
| אפליקציות ייצור בינוניות | P1V3 (פרימיום V3) | ביצועים טובים יותר, יותר תכונות |
| אפליקציות תעבורה גבוהה | P2V3 או P3V3 | משאבים ייעודיים, ביצועים גבוהים |
| אפליקציות קריטיות למשימה | I1V2 (בודד V2) | בידוד רשת, חומרה ייעודית |

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

### מסד הנתונים של Azure SQL

#### מסגרת בחירת SKU

1. **מבוסס DTU (יחידות עסקת מסד נתונים)**
   - **בסיסי**: 5 DTU - פיתוח/בדיקה
   - **סטנדרטי**: S0-S12 (10-3000 DTU) - כללי
   - **פרימיום**: P1-P15 (125-4000 DTU) - קריטי לביצועים

2. **מבוסס vCore** (מומלץ לייצור)
   - **כללי**: איזון בין חישוב ואחסון
   - **קריטי לעסקים**: השהייה נמוכה, IOPS גבוהים
   - **היפרסקייל**: אחסון מדרגי; יש לוודא מגבלות גודל ותמיכה אזורית עדכניות

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

### אפליקציות מכולות של Azure

#### סוגי סביבה

1. **מבוסס צריכה**
   - תשלום לפי שימוש
   - מתאים לפיתוח ולעומסי עבודה משתנים
   - תשתית משותפת

2. **ייעודי (פרופילי עומס)**
   - משאבי חישוב ייעודיים
   - ביצועים צפויים
   - מתאים יותר לעומסי ייצור

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

**ייצור (ייעודי)**
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

רדנדנציה איזורית דורשת גם תשתית באזור נתמך וקונפיגורציית VNet/Subnet מתאימה, מוזכר כאן בקצרה. דוגמה זו מתרגמת שלושה צמתים ייעודיים; תגדיר לפחות שני שכפולים לאפליקציה להפרדת איזורים ותקבע את המידות של השכפולים והצמתים עבור כשל איזורי. ראה [הנחיות אמינות לאפליקציות מכולות](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). כדי למקם אפליקציה בפרופיל זה, הגדר את `workloadProfileName: 'production-profile'` שלה; יצירת הפרופיל לבדו לא מעבירה אפליקציות אליו.

### Azure Cosmos DB

#### מודלי רוחב פס

1. **רוחב פס מוקצב ידנית**
   - ביצועים צפויים
   - הנחות לקיבולת שמורה
   - מתאים לעומסי עבודה יציבים

2. **רוחב פס עם סקייל אוטומטי**
   - סקייל אוטומטי מבוסס שימוש
   - תשלום לפי שימוש (עם מינימום)
   - טוב לעומסי עבודה משתנים

3. **ללא שרת (Serverless)**
   - תשלום לפי בקשה
   - ללא רוחב פס מוקצב
   - אידיאלי לפיתוח ולעומסי עבודה תקופתיים

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

#### סוגי חשבון אחסון

1. **Standard_LRS** - פיתוח, נתונים לא קריטיים
2. **Standard_GRS** - ייצור, דרושה רדנדנציה גאוגרפית
3. **Premium_LRS** - יישומים בעלי ביצועים גבוהים
4. **Premium_ZRS** - זמינות גבוהה עם רדנדנציה אזורית

#### שכבות ביצועים

- **סטנדרטי**: כללי, חסכוני
- **פרימיום**: תרחישי ביצועים גבוהים והשהייה נמוכה

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

## אסטרטגיות אופטימיזציה של עלויות

### 1. קיבולת שמורה

שמור משאבים ל-1-3 שנים ותקבל הנחות משמעותיות:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

הצעות השמירה וסוגי המשאבים הזכאים משתנים; בדוק את הקטלוג ותנאי הרכישה במקום להניח שכל שירות/SKU תומך בשמירה.

### 2. גודל נכון

התחל עם SKU-ים קטנים יותר והרחב על פי השימוש בפועל:

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

יישם סקיילינג חכם לאופטימיזציה של עלויות:

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

### 4. סקיילינג מתוזמן

הורד קנה מידה בשעות לא פעילות:

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

### דרישות ביצוע בסיסיות

הגדר דרישות ביצועים ברורות לפני בחירת SKU:

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

בדוק SKU-ים שונים לאימות ביצועים:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### מעקב ואופטימיזציה

הגדר מעקב מקיף:

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

## טבלאות עזר מהירות

### טבלת עזר מהירה ל-App Service SKU

| SKU | שכבה | vCPU | RAM | אחסון | טווח מחירים | מקרה שימוש |
|-----|------|------|-----|---------|-------------|----------|
| F1 | חינמי | משותף | 1GB | 1GB | חינמי | פיתוח |
| B1 | בסיסי | 1 | 1.75GB | 10GB | $ | אפליקציות קטנות |
| S1 | סטנדרטי | 1 | 1.75GB | 50GB | $$ | ייצור |
| P1V3 | פרימיום V3 | 2 | 8GB | 250GB | $$$ | ביצועים גבוהים |
| I1V2 | מבודד V2 | 2 | 8GB | 1TB | $$$$ | ארגוני |

### טבלת עזר מהירה ל-SQL Database SKU

| SKU | שכבה | DTU/vCore | אחסון | טווח מחירים | מקרה שימוש |
|-----|------|-----------|---------|-------------|----------|
| בסיסי | בסיסי | 5 DTU | 2GB | $ | פיתוח |
| S2 | סטנדרטי | 50 DTU | 250GB | $$ | ייצור קטן |
| P2 | פרימיום | 250 DTU | 1TB | $$$ | ביצועים גבוהים |
| GP_Gen5_4 | כללי | 4 vCore | 4TB | $$$ | מאוזן |
| BC_Gen5_8 | קריטי לעסקים | 8 vCore | 4TB | $$$$ | קריטי למשימה |

### טבלת עזר מהירה ל-Container Apps SKU

| מודל | תמחור | CPU/זיכרון | מקרה שימוש |
|-------|---------|------------|----------|
| צריכה | תשלום לפי שימוש | שילובי CPU/זיכרון נתמכים בהתאם לסביבה/פרופיל | פיתוח או ייצור, עומס משתנה |
| ייעודי D4 | חשבונית צומת ייעודי | 4 vCPU, 16GiB לצומת | עומס מתמשך/דרישות בידוד |
| ייעודי D8 | חשבונית צומת ייעודי | 8 vCPU, 32GiB לצומת | עומס מתמשך גבוה יותר |

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

### סקריפט הערכת עלויות

**רק פסאודו-קוד:** `Get-ResourceCost` למטה הוא פונקציה ספציפית לפרויקט שצריך לממש תוך שימוש בתמחור אזורי/חוזים עדכני והנחות שימוש. זה לא PowerShell או cmdlet של Azure.

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

ה-YAML הבא הוא תרשים דרישות, **לא** סכמת קלט של Azure Load Testing, JMeter, Locust, או k6. תרגם אותו לקונפיגורציה אמיתית של הכלי שבחרת לפני השימוש בפקודת ההעמסה למעלה.

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

## סיכום נהלים מומלצים

### מה לעשות

1. **התחל קטן והרחב** לפי שימוש בפועל
2. **השתמש ב-SKU שונים לסביבות שונות**
3. **עקוב אחרי ביצועים ועלויות באופן רציף**
4. **נצל קיבולת שמורה לעומסי ייצור**
5. **החל סקיילינג אוטומטי במקומות המתאימים**
6. **בדוק ביצועים עם עומסים מציאותיים**
7. **תכנן לצמיחה אך הימנע מהקצאה מופרזת**
8. **השתמש בשכבות חינמיות לפיתוח כאשר ניתן**

### מה לא לעשות

1. **אל תשתמש ב-SKU ייצור לפיתוח**
2. **אל תתעלם מזמינות SKU אזורית**
3. **אל תשכח עלויות העברת נתונים**
4. **אל תקצה משאבים יתר ללא הצדקה**
5. **אל תתעלם מהשפעת תלותיות**
6. **אל תגדיר גבולות סקיילינג אוטומטי גבוהים מדי**
7. **אל תשכח דרישות ציות**
8. **אל תקבל החלטות על בסיס מחיר בלבד**

---

**טיפ מקצועי**: השתמש ב-Azure Cost Management ו-Advisor לקבלת המלצות אישיות לאופטימיזציה של בחירות ה-SKU שלך בהתבסס על דפוסי שימוש בפועל.

---

**ניווט**
- **שיעור קודם**: [תכנון קיבולת](capacity-planning.md)
- **שיעור הבא**: [בדיקות טרום-המראה](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->