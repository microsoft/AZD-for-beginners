# מדריך הגדרות

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 3 - הגדרות ואימות
- **⬅️ קודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ הבא**: [מדריך פריסה](../deployment/deployment-guide.md)
- **🚀 פרק הבא**: [פרק 4: תשתית כקוד](../deployment/deployment-guide.md)

## מבוא

מדריך מקיף זה מכסה את כל ההיבטים של הגדרת Azure Developer CLI לעבודה מיטבית עם תהליכי פיתוח ופריסה. תלמדו על היררכיית ההגדרות, ניהול סביבות, שיטות אימות, ודפוסי הגדרה מתקדמים המאפשרים פריסות יעילות ובטוחות ב-Azure.

## מטרות למידה

בסיום השיעור הזה, תוכלו:
- לשלוט בהיררכיית ההגדרות של azd ולהבין כיצד ההגדרות מקבלות עדיפות
- להגדיר הגדרות גלובליות והגדרות ספציפיות לפרויקט בצורה יעילה
- לנהל סביבות מרובות עם הגדרות שונות
- ליישם דפוסי אימות והרשאה מאובטחים
- להבין דפוסי הגדרה מתקדמים לתרחישים מורכבים

## תוצאות למידה

לאחר השלמת השיעור הזה, תוכלו:
- להגדיר את azd לעבודה מיטבית עם תהליכי פיתוח
- להקים ולנהל סביבות פריסה מרובות
- ליישם שיטות ניהול הגדרות מאובטחות
- לפתור בעיות הקשורות להגדרות
- להתאים את התנהגות azd לדרישות ארגוניות ספציפיות

מדריך מקיף זה מכסה את כל ההיבטים של הגדרת Azure Developer CLI לעבודה מיטבית עם תהליכי פיתוח ופריסה.

## היררכיית הגדרות

azd משתמש במערכת הגדרות היררכית:
1. **דגלי שורת פקודה** (עדיפות גבוהה ביותר)
2. **משתני סביבה**
3. **הגדרות פרויקט מקומיות** (`.azd/config.json`)
4. **הגדרות משתמש גלובליות** (`~/.azd/config.json`)
5. **ערכי ברירת מחדל** (עדיפות נמוכה ביותר)

## הגדרות גלובליות

### הגדרת ברירות מחדל גלובליות
```bash
# הגדר מנוי ברירת מחדל
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# הגדר מיקום ברירת מחדל
azd config set defaults.location "eastus2"

# הגדר מוסכמת שמות קבוצת משאבים ברירת מחדל
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# הצג את כל ההגדרות הגלובליות
azd config list

# הסר הגדרה
azd config unset defaults.location
```

### הגדרות גלובליות נפוצות
```bash
# העדפות פיתוח
azd config set alpha.enable true                    # הפעלת תכונות אלפא
azd config set telemetry.enabled false             # השבתת טלמטריה
azd config set output.format json                  # הגדרת פורמט פלט

# הגדרות אבטחה
azd config set auth.useAzureCliCredential true     # שימוש ב-Azure CLI לאימות
azd config set tls.insecure false                  # אכיפת אימות TLS

# כוונון ביצועים
azd config set provision.parallelism 5             # יצירת משאבים במקביל
azd config set deploy.timeout 30m                  # זמן קצוב לפריסה
```

## 🏗️ הגדרות פרויקט

### מבנה azure.yaml
קובץ `azure.yaml` הוא הלב של פרויקט azd שלכם:

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

# צור עם מיקום ספציפי
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

# אמת הסרה
azd env get-values | grep DEBUG
# (אמור להחזיר כלום)
```

### תבניות סביבה
צרו `.azure/env.template` להגדרת סביבה עקבית:
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

# התחבר עם דייר ספציפי
az login --tenant <tenant-id>

# הגדר מנוי ברירת מחדל
az account set --subscription <subscription-id>
```

### אימות עם Service Principal
לשימוש בצינורות CI/CD:
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
לסביבות המתארחות ב-Azure:
```bash
# אפשר אימות זהות מנוהלת
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ הגדרות תשתית

### פרמטרים של Bicep
הגדירו פרמטרי תשתית ב-`infra/main.parameters.json`:
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

### הגדרות Terraform
לפרויקטים של Terraform, הגדירו ב-`infra/terraform.tfvars`:
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
דוגמה ל-`Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 הגדרות מתקדמות

### מתן שמות מותאמים אישית למשאבים
```bash
# הגדר מוסכמות שמות
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

### סביבה לפיתוח
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### סביבה לבדיקות
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### סביבה לייצור
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 אימות הגדרות

### אימות הגדרות
```bash
# בדוק את תחביר התצורה
azd config validate

# בדוק משתני סביבה
azd env get-values

# אמת את התשתית
azd provision --dry-run
```

### סקריפטים להגדרות
צרו סקריפטים לאימות ב-`scripts/`:

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

### 1. השתמשו במשתני סביבה
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ארגנו קבצי הגדרות
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

### 3. שיקולים לניהול גרסאות
```bash
# .gitignore
.azure/*/config.json         # תצורות סביבה (מכילות מזהי משאבים)
.azure/*/.env               # משתני סביבה (עשויים להכיל סודות)
.env                        # קובץ סביבה מקומי
```

### 4. תיעוד הגדרות
תעדו את ההגדרות שלכם ב-`CONFIG.md`:
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

## 🎯 תרגול מעשי

### תרגיל 1: הגדרת סביבות מרובות (15 דקות)

**מטרה**: יצירת והגדרת שלוש סביבות עם הגדרות שונות

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

**קריטריונים להצלחה:**
- [ ] שלוש סביבות נוצרו בהצלחה
- [ ] לכל סביבה יש הגדרות ייחודיות
- [ ] ניתן לעבור בין סביבות ללא שגיאות
- [ ] `azd env list` מציג את כל שלוש הסביבות

### תרגיל 2: ניהול סודות (10 דקות)

**מטרה**: תרגול הגדרה מאובטחת עם נתונים רגישים

```bash
# הגדר סודות (לא מוצגים בפלט)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# הגדר תצורה שאינה סודית
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# הצג סביבה (סודות צריכים להיות מוסתרים)
azd env get-values

# אמת שסודות נשמרים
azd env get DB_PASSWORD  # צריך להציג ערך אמיתי
```

**קריטריונים להצלחה:**
- [ ] סודות נשמרו מבלי להציגם במסוף
- [ ] `azd env get-values` מציג סודות מוסתרים
- [ ] הפקודה `azd env get <SECRET_NAME>` מחזירה את הערך האמיתי

## צעדים הבאים

- [הפרויקט הראשון שלך](first-project.md) - יישום הגדרות בפועל
- [מדריך פריסה](../deployment/deployment-guide.md) - שימוש בהגדרות לפריסה
- [הקצאת משאבים](../deployment/provisioning.md) - הגדרות מוכנות לייצור

## מקורות

- [מדריך הגדרות azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [סכמת azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [משתני סביבה](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 3 - הגדרות ואימות
- **⬅️ קודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ פרק הבא**: [פרק 4: תשתית כקוד](../deployment/deployment-guide.md)
- **שיעור הבא**: [הפרויקט הראשון שלך](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**הצהרת אחריות**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. אנו לא נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->