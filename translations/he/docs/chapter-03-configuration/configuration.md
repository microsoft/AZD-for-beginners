# מדריך הגדרות

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 3 - הגדרות ואימות
- **⬅️ הקודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ הבא**: [מדריך לפריסה](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 הפרק הבא**: [פרק 4: תשתית כקוד](../chapter-04-infrastructure/deployment-guide.md)

## מבוא

מדריך מקיף זה מכסה את כל ההיבטים של הגדרת Azure Developer CLI ללוחות עבודה מיטביים לפיתוח ולפריסה. תלמד על היררכיה של הגדרות, ניהול סביבות, שיטות אימות ודגמי הגדרה מתקדמים המאפשרים פריסות Azure יעילות ובטוחות.

## מטרות הלמידה

בתום השיעור תוכל:
- לשלוט בהיררכיית ההגדרות של azd ולהבין כיצד הגדרות מקבלות עדיפות
- להגדיר הגדרות גלובליות ופרויקט ספציפיות באופן יעיל
- לנהל מספר סביבות עם הגדרות שונות
- ליישם דגמי אימות והרשאה בטוחים
- להבין דגמי הגדרה מתקדמים לתרחישים מורכבים

## תוצאות הלמידה

לאחר השלמת השיעור תוכל:
- להגדיר את azd ללוחות עבודה מיטביים לפיתוח
- להקים ולנהל מספר סביבות פריסה
- ליישם שיטות ניהול הגדרות בטוחות
- לפתור תקלות הקשורות בהגדרות
- להתאים את התנהגות azd לדרישות ארגוניות ספציפיות

מדריך מקיף זה מכסה את כל ההיבטים של הגדרת Azure Developer CLI ללוחות עבודה מיטביים לפיתוח ולפריסה.

## הבנת סוכני AI בפרויקט azd

אם אתה חדש לסוכני AI, הנה דרך פשוטה להבין את מקומם בעולם azd.

### מהו סוכן?

סוכן הוא תוכנת תוכנה שיכולה לקבל בקשה, לחשוב עליה ולנקוט פעולות—לעיתים קרובות על ידי קריאה למודל AI, חיפוש מידע או הפעלת שירותים אחרים. בפרויקט azd, סוכן הוא פשוט **שירות** נוסף לצד ה-frontend או ה-API backend שלך.

### איך סוכנים משתלבים במבנה פרויקט azd

פרויקט azd מורכב משלוש שכבות: **תשתית**, **קוד** ו-**הגדרות**. סוכנים מתחברים לאותן שכבות כמו כל שירות אחר:

| שכבה | מה היא עושה עבור אפליקציה מסורתית | מה היא עושה עבור סוכן |
|-------|-------------------------------------|-------------------------|
| **תשתית** (`infra/`) | מספקת אפליקציית ווב ומסד נתונים | מספקת נקודת קצה למודל AI, אינדקס חיפוש או מארח סוכן |
| **קוד** (`src/`) | מכילה את קוד המקור ל-frontend ו-API | מכילה את לוגיקת הסוכן והגדרות ההנחיה |
| **הגדרות** (`azure.yaml`) | מציגה את השירותים שלך ואת היעדים לארחם | מציגה את הסוכן כשרות, ומתייחסת לקוד ולמארח שלו |

### תפקידו של `azure.yaml`

אין צורך לזכור את התחביר כרגע. באופן מושגי, `azure.yaml` הוא הקובץ שבו אתה אומר ל-azd: *"הנה השירותים שמרכיבים את האפליקציה שלי, והנה היכן למצוא את הקוד שלהם."*

כאשר הפרויקט שלך כולל סוכן AI, `azure.yaml` פשוט מפרט את הסוכן כאחד השירותים. azd יודע אז לספק את התשתית הנכונה (כמו נקודת קצה למודלי Microsoft Foundry או Container App לאירוח הסוכן) ולפרוס את קוד הסוכן שלך—כמו שזה היה עבור אפליקציית ווב או API.

משמעות הדבר שאין משהו חדש מהותי ללמידה. אם אתה מבין כיצד azd מנהל שירות ווב, אתה כבר מבין כיצד הוא מנהל סוכן.

## היררכיית ההגדרות

azd משתמש במערכת הגדרות היררכית:
1. **דגלי שורת הפקודה** (עדיפות עליונה)
2. **משתני סביבה**
3. **הגדרה מקומית של הפרויקט** (`.azd/config.json`)
4. **הגדרה גלובלית של המשתמש** (`~/.azd/config.json`)
5. **ערכי ברירת מחדל** (עדיפות נמוכה ביותר)

## הגדרות גלובליות

### הגדרת ברירות מחדל גלובליות
```bash
# הגדר מנוי ברירת מחדל
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# הגדר מיקום ברירת מחדל
azd config set defaults.location "eastus2"

# הגדר קונבנציית שם קבוצה משאבים ברירת מחדל
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# הצג את כל ההגדרות הגלובליות
azd config list

# הסר הגדרה
azd config unset defaults.location
```

### הגדרות גלובליות נפוצות
```bash
# העדפות פיתוח
azd config set alpha.enable true                    # הפעל תכונות אלפא
azd config set telemetry.enabled false             # השבת טלמטריה
azd config set output.format json                  # הגדר פורמט פלט

# הגדרות אבטחה
azd config set auth.useAzureCliCredential true     # השתמש ב-Azure CLI לאימות
azd config set tls.insecure false                  # אכוף אימות TLS

# כוונון ביצועים
azd config set provision.parallelism 5             # יצירת משאבים במקביל
azd config set deploy.timeout 30m                  # זמן המתנה לפריסה
```

## 🏗️ הגדרות פרויקט

### מבנה azure.yaml
קובץ `azure.yaml` הוא הלב של פרויקט ה-azd שלך:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### אפשרויות הגדרת שירות

#### סוגי מארחים
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### הגדרות ספציפיות לשפה
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 ניהול סביבות

### יצירת סביבות
```bash
# צור סביבה חדשה
azd env new development

# צור במיקום ספציפי
azd env new staging --location "westus2"

# צור מתבנית
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### הגדרות סביבה
לכל סביבה יש הגדרות משלה ב-`.azure/<env-name>/config.json`:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### משתני סביבה
```bash
# הגדר משתנים ספציפיים לסביבה
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# הצג משתני סביבה
azd env get-values

# פלט צפוי:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# הסר משתנה סביבה
azd env unset DEBUG

# אמת את ההסרה
azd env get-values | grep DEBUG
# (לא אמור להחזיר כלום)
```

### תבניות סביבה
צור `.azure/env.template` להתקנת סביבות אחידה:
```bash
# משתנים נדרשים
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# הגדרות יישום
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# הגדרות פיתוח אופציונליות
DEBUG=false
LOG_LEVEL=info
```

## 🔐 הגדרות אימות

### אינטגרציה עם Azure CLI
```bash
# השתמש באישורי Azure CLI (ברירת מחדל)
azd config set auth.useAzureCliCredential true

# התחבר עם שוכר ספציפי
az login --tenant <tenant-id>

# הגדר מנוי ברירת מחדל
az account set --subscription <subscription-id>
```

### אימות עם Service Principal
לצינורות CI/CD:
```bash
# הגדר משתני סביבה
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# או קבע ישירות
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### זהות מנוהלת
לסביבות מאוחסנות ב-Azure:
```bash
# לאפשר אימות זהות מנוהלת
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ הגדרת תשתית

### פרמטרים של Bicep
הגדר פרמטרים לתשתית ב-`infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### הגדרת Terraform
לפרויקטי Terraform, הגדר ב-`infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 הגדרות פריסה

### הגדרות בנייה
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### הגדרות Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
דוגמת `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 הגדרות מתקדמות

### שמות מותאמים למשאבים
```bash
# קביעת קונבנציות לשמות
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### הגדרות רשת
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### הגדרות ניטור
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 הגדרות ספציפיות לסביבה

### סביבת פיתוח
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### סביבת בדיקות
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### סביבת ייצור
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 אימות הגדרות

### אמת הגדרות
```bash
# בדוק תחביר הגדרות
azd config validate

# בדוק משתני סביבה
azd env get-values

# אמת תשתית
azd provision --dry-run
```

### סקריפטים לאימות
צור סקריפטים לאימות בתיקיית `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# בדוק משתני סביבה נדרשים
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# אמת את תחביר azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 שיטות עבודה מומלצות

### 1. השתמש במשתני סביבה
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ארגן קבצי הגדרות
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. שיקולי בקרת גרסאות
```bash
# .gitignore
.azure/*/config.json         # קונפיגורציות סביבה (מכילות מזהי משאבים)
.azure/*/.env               # משתני סביבה (עלולים להכיל סודות)
.env                        # קובץ סביבה מקומי
```

### 4. תיעוד הגדרות
תעד את ההגדרות שלך בקובץ `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 תרגילי תרגול מעשיים

### תרגיל 1: הגדרת סביבות מרובות (15 דקות)

**מטרה**: צור והגדר שלוש סביבות עם הגדרות שונות

```bash
# צור סביבת פיתוח
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# צור סביבת בדיקה
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# צור סביבת הפקה
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# אמת כל סביבה
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**קריטריוני הצלחה:**
- [ ] נוצרו בהצלחה שלוש סביבות
- [ ] לכל סביבה הגדרה ייחודית
- [ ] ניתן לעבור בין סביבות ללא שגיאות
- [ ] הפקודה `azd env list` מציגה את כל שלוש הסביבות

### תרגיל 2: ניהול סודות (10 דקות)

**מטרה**: התאמנות בהגדרות מאובטחות עם נתונים רגישים

```bash
# הגדר סודות (לא מוצגים בפלט)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# הגדר תצורה לא סודית
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# הצג סביבה (הסודות צריכים להיות טוהרו)
azd env get-values

# אימות שהסודות מאוחסנים
azd env get DB_PASSWORD  # אמור להראות ערך אמיתי
```

**קריטריוני הצלחה:**
- [ ] סודות מאוחסנים מבלי להופיע במסוף
- [ ] `azd env get-values` מציג סודות מוסתרים
- [ ] פקודה בודדת `azd env get <SECRET_NAME>` מחזירה ערך אמיתי

## השלבים הבאים

- [הפרויקט הראשון שלך](first-project.md) - הפעלת הגדרות בפרקטיקה
- [מדריך לפריסה](../chapter-04-infrastructure/deployment-guide.md) - שימוש בהגדרות לפריסה
- [ספק משאבים](../chapter-04-infrastructure/provisioning.md) - הגדרות מוכנות לייצור

## הפניות

- [מדריך להגדרות azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [סכימת azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [משתני סביבה](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 3 - הגדרות ואימות
- **⬅️ הקודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ הפרק הבא**: [פרק 4: תשתית כקוד](../chapter-04-infrastructure/deployment-guide.md)
- **שיעור הבא**: [הפרויקט הראשון שלך](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם בעזרת שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית ייחשב למקור הסמכותי. למידע קריטי, מומלץ לבצע תרגום מקצועי על ידי אדם. אנו לא אחראים לכל אי הבנה או פרשנות מוטעית הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->