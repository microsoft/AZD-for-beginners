# מדריך תצורה

**ניווט בין פרקים:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 3 - תצורה ואימות
- **⬅️ הקודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ הבא**: [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 הפרק הבא**: [פרק 4: תשתית כקוד](../chapter-04-infrastructure/deployment-guide.md)

## הקדמה

מדריך מקיף זה מכסה את כל ההיבטים של קביעת תצורה עבור Azure Developer CLI עבור תזרימי עבודה אופטימליים של פיתוח ופריסה. תלמדו על היררכיית התצורה, ניהול סביבות, שיטות אימות, ודפוסי תצורה מתקדמים שמאפשרים פריסות Azure יעילות ומאובטחות.

## יעדי הלמידה

בסוף השיעור הזה, תוכלו:
- לשלוט בהיררכיית התצורה של azd ולהבין כיצד ניתנות עדיפויות להגדרות
- להגדיר באופן יעיל הגדרות גלובליות ופרויקט-ספציפיות
- לנהל סביבות מרובות עם תצורות שונות
- ליישם דפוסי אימות והרשאה מאובטחים
- להבין דפוסי תצורה מתקדמים לתרחישים מורכבים

## תוצאות למידה

לאחר השלמת שיעור זה, תוכל/ו:
- להגדיר את azd לתזרימי עבודה מיטביים של פיתוח
- להקים ולנהל מספר סביבות פריסה
- ליישם שיטות ניהול תצורה מאובטחות
- לאבחן ולטפל בבעיות הקשורות לתצורה
- להתאים את התנהגות azd לדרישות ארגוניות ספציפיות

מדריך מקיף זה מכסה את כל ההיבטים של קביעת תצורה עבור Azure Developer CLI עבור תזרימי עבודה אופטימליים של פיתוח ופריסה.

## היררכיית התצורה

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

# הגדר קונבנציית שמות לקבוצת משאבים כברירת מחדל
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# הצג את כל ההגדרות הגלובליות
azd config list

# הסר תצורה
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
azd config set deploy.timeout 30m                  # מגבלת זמן לפריסה
```

## 🏗️ תצורת פרויקט

### מבנה azure.yaml
הקובץ `azure.yaml` הוא הלב של פרויקט azd שלך:

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

#### סוגי אירוח
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

# צור עם מיקום מסוים
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
# הגדר משתנים סביבתיים ספציפיים
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# הצג משתנים סביבתיים
azd env get-values

# פלט צפוי:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# הסר משתנה סביבתי
azd env unset DEBUG

# אמת את ההסרה
azd env get-values | grep DEBUG
# (לא אמור להחזיר דבר)
```

### תבניות סביבה
צרו את `.azure/env.template` להגדרה עקבית של סביבות:
```bash
# משתנים נדרשים
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# הגדרות היישום
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

# התחבר עם ארגון מסוים
az login --tenant <tenant-id>

# הגדר את המנוי כברירת מחדל
az account set --subscription <subscription-id>
```

### אימות באמצעות Service Principal
עבור צינורות CI/CD:
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
עבור סביבות המתארחות ב-Azure:
```bash
# אפשר אימות באמצעות זהות מנוהלת
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ תצורת תשתית

### פרמטרים ל-Bicep
הגדר פרמטרי תשתית ב-`infra/main.parameters.json`:
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

### קונפיגורציית Terraform
לעבור פרויקטים של Terraform, קבעו את ההגדרות ב-`infra/terraform.tfvars`:
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
דוגמה `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 תצורה מתקדמת

### מתן שמות מותאמים למשאבים
```bash
# הגדר קונבנציות שמות
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

## 🎯 תצורות ספציפיות לסביבה

### סביבת פיתוח
```bash
# .azure/פיתוח/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### סביבת בדיקה
```bash
# .azure/סטייג'ינג/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### סביבת ייצור
```bash
# .azure/ייצור/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 אימות תצורה

### אימות התצורה
```bash
# בדוק תחביר התצורה
azd config validate

# בדוק משתני סביבה
azd env get-values

# אמת את התשתית
azd provision --dry-run
```

### סקריפטים לתצורה
צרו סקריפטים לאימות ב-`scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# בדוק את משתני הסביבה הדרושים
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# אמת את התחביר של azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 שיטות עבודה מומלצות

### 1. השתמשו במשתני סביבה
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ארגנו את קבצי התצורה
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
תעדו את התצורה בקובץ `CONFIG.md`:
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

## 🎯 תרגולים מעשיים

### תרגיל 1: קונפיגורציה מרובת סביבות (15 דקות)

**מטרה**: צור והגדר שלוש סביבות עם הגדרות שונות

```bash
# צור סביבת פיתוח
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# צור סביבת בדיקות
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
- [ ] לכל סביבה יש תצורה ייחודית
- [ ] ניתן לעבור בין הסביבות ללא שגיאות
- [ ] `azd env list` מציג את כל שלוש הסביבות

### תרגיל 2: ניהול סודות (10 דקות)

**מטרה**: תרגול קביעת תצורה מאובטחת עם נתונים רגישים

```bash
# הגדר סודות (לא יוצגו בפלט)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# הגדר תצורה שאינה סודית
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# הצג את הסביבה (הסודות אמורים להיות מצונזרים)
azd env get-values

# וודא שהסודות מאוחסנים
azd env get DB_PASSWORD  # צריך להציג את הערך בפועל
```

**קריטריוני הצלחה:**
- [ ] הסודות מאוחסנים מבלי להופיע במסוף
- [ ] `azd env get-values` מציג סודות מטושטשים
- [ ] קריאה פרטנית `azd env get <SECRET_NAME>` מחזירה את הערך האמיתי

## הצעדים הבאים

- [הפרויקט הראשון שלך](first-project.md) - יישם את התצורה בפועל
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - השתמש בתצורה לפריסה
- [הקצאת משאבים](../chapter-04-infrastructure/provisioning.md) - תצורות מוכנות לסביבת הייצור

## מקורות

- [מדריך התצורה של azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [סכמת azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [משתני סביבה](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ניווט בין פרקים:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 3 - תצורה ואימות
- **⬅️ הקודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ הפרק הבא**: [פרק 4: תשתית כקוד](../chapter-04-infrastructure/deployment-guide.md)
- **השיעור הבא**: [הפרויקט הראשון שלך](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אי-אחריות:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדייק, יש לשים לב שתרגומים ממוחשבים עלולים להכיל שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפתו כמקור הסמכות. למידע קריטי מומלץ להיעזר בתרגום מקצועי על ידי מתרגם אנושי. איננו אחראים לכל אי-הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->