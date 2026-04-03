# מדריך תצורה

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 3 - תצורה ואימות
- **⬅️ הקודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ הבא**: [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 הפרק הבא**: [פרק 4: תשתית כקוד](../chapter-04-infrastructure/deployment-guide.md)

## מבוא

מדריך מקיף זה מכסה את כל ההיבטים של תצורת Azure Developer CLI לזרימות עבודה מיטביות בפיתוח ופריסה. תלמדו על היררכיית התצורה, ניהול סביבות, שיטות אימות, ותבניות תצורה מתקדמות שמאפשרות פריסות Azure יעילות ובטוחות.

## מטרות הלמידה

בסוף השיעור הזה, תוכלו:
- לשלוט בהיררכיית התצורה של azd ולהבין כיצד העדיפויות מוגדרות
- להגדיר הגדרות כלליות ופרויקט ספציפיות בצורה יעילה
- לנהל סביבות מרובות עם תצורות שונות
- ליישם תבניות אימות והרשאה מאובטחות
- להבין תבניות תצורה מתקדמות לתרחישים מורכבים

## תוצאות הלמידה

לאחר שתסיימו שיעור זה, תוכלו:
- להגדיר את azd לזרימות עבודה מיטביות בפיתוח
- להקים ולנהל סביבות פריסה מרובות
- ליישם פרקטיקות ניהול תצורה מאובטחות
- לפתור בעיות הקשורות לתצורה
- להתאים אישית את התנהגות azd לדרישות ארגוניות ספציפיות

מדריך מקיף זה מכסה את כל ההיבטים של תצורת Azure Developer CLI לזרימות עבודה מיטביות בפיתוח ופריסה.

## הבנת סוכני AI בפרויקט azd

אם אתם חדשים לעולם סוכני ה-AI, הנה דרך פשוטה לחשוב עליהם בתוך עולם azd.

### מהו סוכן?

סוכן הוא תוכנה שיכולה לקבל בקשה, לנתח אותה, ולנקוט פעולות - לעיתים על ידי קריאה למודל AI, חיפוש נתונים, או הפעלת שירותים אחרים. בפרויקט azd, סוכן הוא פשוט עוד **שירות** לצד ממשק הווב או ה-API שלכם.

### איך סוכנים משתלבים במבנה פרויקט azd

פרויקט azd מורכב משלוש שכבות: **תשתית**, **קוד**, ו-**תצורה**. סוכנים משתלבים באותן שכבות באותה צורה שכל שירות אחר משתלב:

| שכבה | מה היא עושה לאפליקציה מסורתית | מה היא עושה לסוכן |
|-------|-------------------------------------|---------------------------|
| **תשתית** (`infra/`) | מספקת אפליקציית ווב ומסד נתונים | מספקת נקודת קצה של מודל AI, אינדקס חיפוש, או מארח לסוכן |
| **קוד** (`src/`) | מכילה את הקוד של ממשק הווב ו-API | מכילה את הלוגיקה של הסוכן והגדרת הפקודות |
| **תצורה** (`azure.yaml`) | מפרטת את השירותים והיעדים לאירוח שלהם | מפרטת את הסוכן כשירות, ומצביעה על הקוד והמארח שלו |

### תפקידו של `azure.yaml`

אין צורך לשנן את התחביר עכשיו. באופן קונספטואלי, `azure.yaml` הוא הקובץ שבו אתם אומרים ל-azd: *"אלה השירותים שמרכיבים את האפליקציה שלי, ופה נמצא הקוד שלהם."*

כאשר הפרויקט שלכם כולל סוכן AI, `azure.yaml` פשוט מפרט את הסוכן כאחד השירותים. לאחר מכן azd יודע לספק את התשתית המתאימה (כמו נקודת קצה של Microsoft Foundry Models או אפליקציית Container לאירוח הסוכן) ולפרוס את קוד הסוכן - בדיוק כפי שהוא עושה עבור אפליקציית ווב או API.

משמעות הדבר שאין צורך ללמוד שום דבר חדש באופן יסודי. אם אתם מבינים כיצד azd מנהל שירות ווב, אתם כבר מבינים כיצד הוא מנהל סוכן.

## היררכיית תצורה

azd משתמש במערכת תצורה היררכית:
1. **דגלי שורת הפקודה** (עדיפות עליונה)
2. **משתני סביבה**
3. **תצורת פרוייקט מקומית** (`.azd/config.json`)
4. **תצורת משתמש גלובלית** (`~/.azd/config.json`)
5. **ערכי ברירת מחדל** (עדיפות נמוכה ביותר)

## תצורה כללית

### הגדרת ברירות מחדל גלובליות
```bash
# הגדר מנוי ברירת מחדל
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# הגדר מיקום ברירת מחדל
azd config set defaults.location "eastus2"

# הגדר קונבנציית שמות לקבוצת משאבים ברירת מחדל
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
azd config set telemetry.enabled false             # השבתת איסוף מידע
azd config set output.format json                  # קבע פורמט פלט

# הגדרות אבטחה
azd config set auth.useAzureCliCredential true     # השתמש ב-Azure CLI לאימות
azd config set tls.insecure false                  # אכוף אימות TLS

# כיוון ביצועים
azd config set provision.parallelism 5             # יצירת משאבים במקביל
azd config set deploy.timeout 30m                  # זמן חכות לפריסה
```

## 🏗️ תצורת פרויקט

### מבנה azure.yaml
קובץ `azure.yaml` הוא לב פרויקט azd שלכם:

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

#### הגדרות מותאמות לשפות
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
לכל סביבה תצורה משלה ב-`.azure/<env-name>/config.json`:

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

# אמת הסרה
azd env get-values | grep DEBUG
# (צריך להחזיר כלום)
```

### תבניות סביבה
צרו `.azure/env.template` להגדרה עקבית של סביבות:
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

## 🔐 תצורת אימות

### אינטגרציה עם Azure CLI
```bash
# השתמש באישורי Azure CLI (ברירת מחדל)
azd config set auth.useAzureCliCredential true

# התחבר עם שוכר מסוים
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

### זהות מנוהלת (Managed Identity)
לסביבות שמאוחסנות ב-Azure:
```bash
# אפשר אימות זהות מנוהל
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ תצורת תשתית

### פרמטרים של Bicep
הגדירו פרמטרים בתיקיית `infra/main.parameters.json`:
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
לפרויקטים המשתמשים ב-Terraform, הגדירו בתיקיית `infra/terraform.tfvars`:
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

### שמות משאבים מותאמים אישית
```bash
# קבע את קונבנציות השמות
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

## 🎯 תצורות ייעודיות לסביבה

### סביבת פיתוח
```bash
# .azure/פיתוח/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### סביבת השקה (Staging)
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### סביבת ייצור (Production)
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 אימות תצורה

### אימות תצורה
```bash
# בדוק תחביר תצורה
azd config validate

# בדוק משתני סביבה
azd env get-values

# אמת תשתית
azd provision --dry-run
```

### סקריפטים לאימות תצורה
צרו סקריפטים בתיקיית `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# בדוק את משתני הסביבה הנדרשים
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

## 🎓 הנחיות מומלצות

### 1. השתמשו במשתני סביבה
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ארגון קבצי תצורה
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

### 4. תיעוד התצורה
תעדו את התצורה שלכם ב-`CONFIG.md`:
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

## 🎯 תרגולי מעשיים

### תרגיל 1: תצורת סביבות מרובות (15 דקות)

**מטרה**: ליצור ולהגדיר שלוש סביבות בהגדרות שונות

```bash
# צור סביבת פיתוח
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# צור סביבת בידוק
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
- [ ] נוצרו בהצלחה שלוש סביבות
- [ ] לכל סביבה תצורה ייחודית
- [ ] ניתן לעבור בין הסביבות ללא שגיאות
- [ ] הפקודה `azd env list` מציגה את כל שלוש הסביבות

### תרגיל 2: ניהול סודות (10 דקות)

**מטרה**: לתרגל תצורה מאובטחת עם נתונים רגישים

```bash
# הגדר סודות (לא מוצגים בתוצאה)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# הגדר קונפיגורציה לא סודית
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# הצג סביבה (יש להסיר סודות)
azd env get-values

# אמת שסודות נשמרים
azd env get DB_PASSWORD  # אמור להציג ערך אמיתי
```

**קריטריוני הצלחה:**
- [ ] סודות נשמרו מבלי להציג אותם בטרמינל
- [ ] הפקודה `azd env get-values` מציגה סודות מוגנים
- [ ] הפקודה `azd env get <SECRET_NAME>` מחזירה את הערך האמיתי

## צעדים הבאים

- [הפרויקט הראשון שלך](first-project.md) - יישום תצורה בפועל
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - שימוש בתצורה לפריסה
- [הקצאת משאבים](../chapter-04-infrastructure/provisioning.md) - תצורות מוכנות לייצור

## מקורות

- [אזכור תצורת azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [סכמת azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [משתני סביבה](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 3 - תצורה ואימות
- **⬅️ הקודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ הפרק הבא**: [פרק 4: תשתית כקוד](../chapter-04-infrastructure/deployment-guide.md)
- **השיעור הבא**: [הפרויקט הראשון שלך](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות התרגום האוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, קיימת אפשרות שהתרגום האוטומטי יכיל שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור צריך להיחשב למקור הסמכותי. למידע קריטי מומלץ להשתמש בתרגום מקצועי של אדם. אנו לא אחראים לכל אי-הבנות או פרשנויות לא נכונות הנובעות מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->