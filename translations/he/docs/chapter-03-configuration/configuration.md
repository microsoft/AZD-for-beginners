# מדריך תצורה

**ניווט בפרקים:**
- **📚 עמוד הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 3 - תצורה ואימות
- **⬅️ קודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ הבא**: [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 פרק הבא**: [פרק 4: תשתית כקוד](../chapter-04-infrastructure/deployment-guide.md)

## מבוא

המדריך המקיף הזה מכסה את כל ההיבטים של תצורת Azure Developer CLI עבור זרימות עבודה מיטביות לפיתוח ופריסה. תלמד על היררכיית התצורה, ניהול סביבות, שיטות אימות ודפוסי תצורה מתקדמים שמאפשרים פריסות Azure יעילות ומאובטחות.

## מטרות הלימוד

בסוף השיעור הזה, תוכל:
- לשלוט בהיררכיית תצורת azd ולהבין כיצד מועדפות ההגדרות
- להגדיר הגדרות גלובליות וספציפיות לפרויקט בצורה אפקטיבית
- לנהל סביבות מרובות עם תצורות שונות
- ליישם דפוסי אימות והרשאה מאובטחים
- להבין דפוסי תצורה מתקדמים לתרחישים מורכבים

## תוצאות הלימוד

לאחר השלמת השיעור, תוכל:
- להגדיר את azd לזרימות עבודה מיטביות לפיתוח
- להגדיר ולנהל סביבות פריסה מרובות
- ליישם שיטות ניהול תצורה מאובטחות
- לטפל בבעיות הקשורות לתצורה
- להתאים את התנהגות azd לדרישות ארגוניות ספציפיות

המדריך המקיף הזה מכסה את כל ההיבטים של תצורת Azure Developer CLI עבור זרימות עבודה מיטביות לפיתוח ופריסה.

## הבנת סוכני AI בפרויקט azd

אם אתה חדש בסוכני AI, הנה דרך פשוטה לחשוב עליהם בתוך העולם של azd.

### מהו סוכן?

סוכן הוא חתיכת תוכנה שיכולה לקבל בקשה, לנתח אותה ולקחת פעולות - לעיתים קרובות על ידי קריאה למודל AI, חיפוש נתונים או הפעלת שירותים אחרים. בפרויקט azd, סוכן הוא פשוט **שירות** נוסף לצד ממשק המשתמש הקדמי או backend ה-API שלך.

### איך סוכנים משתלבים במבנה פרויקט azd

פרויקט azd מורכב משלוש שכבות: **תשתית**, **קוד** ו-**תצורה**. סוכנים מתחברים לשכבות הללו באותה דרך כפי שכל שירות אחר פועל:

| שכבה | מה היא עושה עבור אפליקציה מסורתית | מה היא עושה עבור סוכן |
|-------|---------------------------------|------------------------|
| **תשתית** (`infra/`) | מספקת אפליקציית ווב ומסד נתונים | מספקת נקודת קצה למודל AI, אינדקס חיפוש, או מארח סוכן |
| **קוד** (`src/`) | מכילה קוד מקור של ממשק קדמי ו-API | מכילה לוגיקת הסוכן והגדרות הפקודות |
| **תצורה** (`azure.yaml`) | מפרטת את השירותים ואת היעדים לאירוח | מפרטת את הסוכן כשירות, מופנית אל הקוד והמארח שלו |

### תפקידו של `azure.yaml`

אין צורך לשנן כרגע את התחביר. באופן רעיוני, `azure.yaml` הוא הקובץ שבו אתה אומר ל-azd: *"אלה השירותים שמרכיבים את האפליקציה שלי, וכאן נמצא הקוד שלהם."*

כאשר הפרויקט שלך כולל סוכן AI, `azure.yaml` פשוט מפרט את הסוכן כאחד מהשירותים. azd אז יודע לספק את התשתית המתאימה (כמו נקודת קצה של Microsoft Foundry Models או אפליקציית Container לאירוח הסוכן) ולפרוס את קוד הסוכן - בדיוק כמו היה עושה עבור אפליקציית ווב או API.

זה אומר שאין צורך בלמידה יסודית חדשה. אם אתה מבין כיצד azd מנהל שירות ווב, אתה כבר מבין כיצד הוא מנהל סוכן.

## היררכיית תצורה

azd משתמש במערכת תצורה היררכית:
1. **דגלי שורת הפקודה** (העדיפות הגבוהה ביותר)
2. **משתני סביבה**
3. **תצורת פרויקט מקומית** (`.azd/config.json`)
4. **תצורת משתמש גלובלית** (`~/.azd/config.json`)
5. **ערכי ברירת מחדל** (העדיפות הנמוכה ביותר)

## תצורה גלובלית

### הגדרת ברירות מחדל גלובליות
```bash
# הגדר מנוי ברירת מחדל
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# הגדר מיקום ברירת מחדל
azd config set defaults.location "eastus2"

# הגדר את שיטת ההצמדה לשם קבוצה משאבים ברירת מחדל
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# הצג את כל ההגדרות הגלובליות
azd config show

# הסר הגדרה
azd config unset defaults.location
```

### הגדרות גלובליות נפוצות
```bash
# העדפות פיתוח
azd config set alpha.enable true                    # הפעלת תכונות אלפא
azd config set telemetry.enabled false             # השבתת טלמטריה
azd config set output.format json                  # הגדר פורמט פלט

# הגדרות אבטחה
azd config set auth.useAzureCliCredential true     # השתמש ב-Azure CLI לאימות
azd config set tls.insecure false                  # אכיפת אימות TLS

# כיוונון ביצועים
azd config set provision.parallelism 5             # יצירת משאבים במקביל
azd config set deploy.timeout 30m                  # זמן מתנה לפריסה
```

## 🏗️ תצורת פרויקט

### מבנה azure.yaml
קובץ `azure.yaml` הוא הלב של פרויקט azd שלך:

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

### אפשרויות תצורת שירות

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

### תצורת סביבה
לכל סביבה יש תצורה משלה ב-`.azure/<env-name>/config.json`:

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
# הגדר משתני סביבה ספציפיים
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

# אמת הסרה
azd env get-values | grep DEBUG
# (לא אמור להחזיר כלום)
```

### תבניות סביבה
צור `.azure/env.template` להצבת סביבה עקבית:
```bash
# משתנים דרושים
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# הגדרות אפליקציה
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# הגדרות פיתוח אופציונליות
DEBUG=false
LOG_LEVEL=info
```

### שיתוף סביבות בצוות

כאשר יותר מאדם אחד עובד על פרויקט, צריך להסכים על **מה נעביר עם המאגר ומה נשאיר מקומי**. azd שומר כל סביבה תחת תיקיית `.azure/`, ולא כל התוכן אמור להיות מחויב.

**מה יש בתוך `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**מה ל- gitignore.** קובץ `.gitignore` כברירת מחדל של azd משמיט את `.azure/`. שמור על כך כפי שהוא - קבצי `.env` יכולים להכיל סודות, ומזהי משאבים ייחודיים למי שהקצה אותם. כל משתמש יוצר את הסביבה **שלו** באופן מקומי:

```bash
# כל מפתח מפעיל את זה פעם אחת כדי לקבל סביבה מבודדת משלו
azd env new dev-alice
azd up
```

**החלפה בין סביבות.** מפתח שמנהל מספר סביבות בוחר את הסביבה הפעילה לפני הפעלת פקודות:

```bash
azd env list                 # ראה את כל הסביבות המקומיות ואיזו מהן היא ברירת המחדל
azd env select staging       # הפוך את 'staging' לסביבה הפעילה
azd env get-values           # אשר שאתה מכוון לסביבה הנכונה
```

**מתן ברירות מחדל שאינן סודיות לצוות.** מחייבים תבנית (כמו `.azure/env.template` למעלה) כדי שכולם ידעו אילו משתנים להגדיר - אך לעולם לא מחייבים ערכים מלאים. חברי צוות חדשים מעתיקים את התבנית וממלאים אותה בעצמם.

**סביבות ב-CI/CD.** צינורות לא קוראים את תיקיית `.azure/` המקומית שלך. במקום זאת, ספק את ערכי הסביבה כמשתני צנרת/סודות, ו-azd קורא אותם מסביבת התהליך:

```bash
# ב-CI, azd קורא את אלה מהסביבה, לא מהתיקייה .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **כלל אצבע:** קוד תשתית (`infra/`, `azure.yaml`) משותף ב-Git; *מצב וסודות הסביבה* (`.azure/`) הם לכל מפתח ולכל צינור בנפרד. הפקודה `azd pipeline config` מגדירה עבורך אוטומטית את משתני הצינור.

## 🔐 תצורת אימות

### אינטגרציה עם Azure CLI
```bash
# השתמש באישורי Azure CLI (ברירת מחדל)
azd config set auth.useAzureCliCredential true

# התחבר עם שוכר ספציפי
az login --tenant <tenant-id>

# הגדר את המנוי כברירת מחדל
az account set --subscription <subscription-id>
```

### אימות באמצעות Service Principal
לצינורות CI/CD:
```bash
# הגדר משתני סביבה
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# או הגדר ישירות
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### זהות מנוהלת
לסביבות מתארחות ב-Azure:
```bash
# אפשר אימות זהות מנוהלת
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ תצורת תשתית

### פרמטרי Bicep
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

### תצורת Terraform
לפרויקטי Terraform, הגדר ב-`infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 תצורת פריסה

### תצורת בנייה
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

### תצורת Docker
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

## 🔧 תצורה מתקדמת

### שמות מותאמים אישית למשאבים
```bash
# קבע הנחיות לאיתור שמות
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### תצורת רשת
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### תצורת ניטור
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

## 🎯 תצורות ייחודיות לסביבה

### סביבת פיתוח
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### סביבת Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### סביבת הפקה
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 אישור תצורה

### אמת תצורה
```bash
# בדוק את תחביר התצורה
azd config validate

# בדוק משתני סביבה
azd env get-values

# אמת תשתית
azd provision --dry-run
```

### סקריפטים לתצורה
צור סקריפטי אימות ב-`scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# בדוק משתני סביבה נדרשים
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# אמת תחביר של azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 שיטות מומלצות

### 1. השתמש במשתני סביבה
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ארגן קבצי תצורה
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
.azure/*/config.json         # תצורות סביבה (מכילות מזהי משאבים)
.azure/*/.env               # משתני סביבה (עשויים להכיל סודות)
.env                        # קובץ סביבה מקומי
```

### 4. תיעוד תצורה
תעד את התצורה בקובץ `CONFIG.md`:
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

## 🎯 תרגילים מעשיים

### תרגיל 1: תצורה מרובת סביבות (15 דקות)

**מטרה**: ליצור ולהגדיר שלוש סביבות עם הגדרות שונות

```bash
# צור סביבת פיתוח
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# צור סביבת משלוח
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# צור סביבת ייצור
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
- [ ] שלוש סביבות נוצרו בהצלחה
- [ ] לכל סביבה תצורה ייחודית
- [ ] ניתן להחליף בין סביבות ללא שגיאות
- [ ] הפקודה `azd env list` מציגה את כל שלוש הסביבות

### תרגיל 2: ניהול סודות (10 דקות)

**מטרה**: לתרגל תצורה מאובטחת עם נתונים רגישים

```bash
# קבע סודות (לא מוצגים בפלט)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# קבע קונפיגורציה שאינה סודית
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# הצג סביבה (יש להסיר סודות)
azd env get-values

# אמת שהסודות נשמרו
azd env get DB_PASSWORD  # צריך להראות את הערך האמיתי
```

**קריטריוני הצלחה:**
- [ ] סודות נשמרים מבלי להופיע במסוף
- [ ] הפקודה `azd env get-values` מציגה סודות מוסתרים
- [ ] הפקודה האישית `azd env get <SECRET_NAME>` מחזירה את הערך האמיתי

## צעדים הבאים

- [הפרויקט הראשון שלך](first-project.md) - החל תצורה בפועל
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - השתמש בתצורה לפריסה
- [הקצאת משאבים](../chapter-04-infrastructure/provisioning.md) - תצורות מוכנות לייצור

## הפניות

- [התייחסות לתצורה של azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [סכמה של azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [משתני סביבה](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ניווט בפרקים:**
- **📚 עמוד הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 3 - תצורה ואימות
- **⬅️ קודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ פרק הבא**: [פרק 4: תשתית כקוד](../chapter-04-infrastructure/deployment-guide.md)
- **השיעור הבא**: [הפרויקט הראשון שלך](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->