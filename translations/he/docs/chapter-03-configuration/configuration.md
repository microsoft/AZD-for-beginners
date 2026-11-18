# מדריך תצורה

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 3 - תצורה ואימות
- **⬅️ קודם**: [הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [מדריך לפריסה](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 הפרק הבא**: [פרק 4: תשתית כקוד](../chapter-04-infrastructure/deployment-guide.md)

## מבוא

> נבדק מול `azd 1.37.2` (נובמבר 2026). פקודות Bash מניחות פרויקט azd מאותחל. אלא אם כן מתואר במפורש כקובץ מלא, קטעי YAML/Bicep הם פיסות להתמזג בקבצי הפרויקט התואמים, לא פרויקטים עצמאיים להפעלה.

מדריך מקיף זה מכסה את כל ההיבטים של תצורת Azure Developer CLI עבור תהליכי פיתוח ופריסה מיטביים. תלמד על היררכיית התצורה, ניהול סביבות, שיטות אימות, ודפוסי תצורה מתקדמים שמאפשרים פריסות Azure יעילות ובטוחות.

## מטרות הלמידה

בסוף השיעור הזה תוכל:
- לשלוט בהיררכיית התצורה של azd ולהבין כיצד נעשית הקדימות להגדרות
- לבצע תצורה יעילה של הגדרות גלובליות ופרויקט ספציפי
- לנהל מספר סביבות עם תצורות שונות
- ליישם דפוסי אימות והרשאות מאובטחים
- להבין דפוסי תצורה מתקדמים לתרחישים מורכבים

## תוצאות למידה

לאחר סיום שיעור זה תוכל:
- לתצבר את azd עבור תהליכי פיתוח מיטביים
- להקים ולנהל מספר סביבות פריסה
- ליישם שיטות ניהול תצורה בטוחות
- לטפל בבעיות הקשורות לתצורה
- להתאים את התנהגות azd לדרישות ארגוניות ספציפיות

מדריך מקיף זה מכסה את כל ההיבטים של תצורת Azure Developer CLI עבור תהליכי פיתוח ופריסה מיטביים.

## הבנת סוכני AI בפרויקט azd

אם אתה חדש בתחום סוכני AI, הנה דרך פשוטה לחשוב עליהם בתוך עולם azd.

### מהו סוכן?

סוכן הוא תוכנה שיכולה לקבל בקשה, לנתח אותה, ולנקוט פעולות — לעיתים על ידי קריאה למודל AI, חיפוש נתונים, או הפעלת שירותים אחרים. בפרויקט azd, סוכן הוא פשוט **שירות** נוסף לצד ממשק המשתמש שלך או ה-API האחורי.

### כיצד סוכנים משתלבים במבנה פרויקט azd

פרויקט azd בנוי משלוש שכבות: **תשתית**, **קוד**, ו-**תצורה**. סוכנים מחוברים לשכבות אלו כמו כל שירות אחר:

| שכבה | מה היא עושה לאפליקציה מסורתית | מה היא עושה לסוכן |
|-------|-------------------------------------|---------------------------|
| **תשתית** (`infra/`) | מספקת אפליקציית ווב ומסד נתונים | מספקת נקודת קצה למודל AI, אינדקס חיפוש, או מארח סוכן |
| **קוד** (`src/`) | מכילה את קוד הממשק ו-API שלך | מכילה את הלוגיקה של הסוכן והגדרות הפקודות |
| **תצורה** (`azure.yaml`) | מפרטת את השירותים ויעדי האחסון שלהם | מפרטת את הסוכן כשירות, עם הפניה לקוד ולמארח שלו |

### התפקיד של `azure.yaml`

אין צורך לזכור את התחביר עכשיו. רעיונית, `azure.yaml` הוא הקובץ שבו אתה אומר ל-azd: *"הנה השירותים שמרכיבים את האפליקציה שלי, וכאן נמצא הקוד שלהם."*

כשהפרויקט שלך כולל סוכן AI, `azure.yaml` פשוט מפרט את הסוכן כאחד השירותים. אז azd יודע לספק את התשתית הנכונה (כמו נקודת קצה של Microsoft Foundry Models או אפליקציית מכולה לאירוח הסוכן) ולפרוס את קוד הסוכן—בדיוק כמו עבור אפליקציית ווב או API.

זה אומר שאין שום דבר חדש מהותית ללמוד. אם אתה מבין כיצד azd מנהל שירות ווב, אתה כבר מבין כיצד הוא מנהל סוכן.

## היררכיית תצורה

ל-azd יש משטחי תצורה מובחנים, לא שכבה אחידה אחת:
- **העדפות משתמש גלובליות**: `~/.azd/config.json`, מנוהלות על ידי `azd config`.
- **הגדרת פרויקט**: `azure.yaml` מגדיר שירותים, תשתית, ותוספים.
- **בחירת סביבה מקומית**: `.azure/config.json`.
- **ערכי סביבה מותאמים**: `.azure/<name>/.env`, מנוהלים על ידי `azd env`; הגדרות נוספות נמצאות בקובץ `config.json` של אותה סביבה.
- **דגלים ומשתני תהליך**: עוקפים רק את ההגדרות הנתמכות על ידי הפקודה/ספק מסוים.

ערך `azd env set` שרירותי אינו הופך אוטומטית לפרמטר תשתית או הגדרת אפליקציה בפריסה. הפנה אותו במפורש בקובץ הפרמטרים, בתצורת שירות נתמכת, או בתוסף.

## תצורה גלובלית

### קביעת ברירות מחדל גלובליות
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### הגדרות נפוצות גלובליות
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ תצורת פרויקט

### מבנה azure.yaml
קובץ `azure.yaml` הוא הלב של פרויקט azd שלך:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

זהו **דוגמה להגדרת פרויקט**, לא התחלה מסופקת. צור את ספריות המקור שהוזכרו, סקריפטים של תוספים, סקריפטים של חבילות, והתאמת `infra/main.bicep`/`main.parameters.json` לפני הריצה. מסדי נתונים שייכים לתשתית; `postgres` אינו מארח שירות מובנה. פרמטרי תשתית נכנסים בקובץ הפרמטרים של הספק, לא ב-`infra.parameters`.

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

#### תוספים לבנייה ספציפיים לשפה

קטעי שירות הבאים מראים תוספים; שלב אותם עם `project` ו-`host` האמיתיים של כל שירות. `buildCommand` ו-`startCommand` אינם תכונות שירות azd כלליות. בצע תצורה של אתחול באפליקציה, Dockerfile, או תשתית המארח.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 ניהול סביבה

### יצירת סביבות
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### תצורת סביבה
ערכי ליבה של הסביבה נמצאים ב-`.azure/<env-name>/.env`, כולל `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, ו-`AZURE_LOCATION`. השתמש ב-`azd env config get/set` להגדרות JSON נוספות של הסביבה. JSON הבא הוא **מצב אפליקציה קונספטואלי**, לא סכמת תצורת azd; אל תעתיק אותו לקבצי azd:

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

**הדגמה בטקסט פשוט בלבד.** ערכי `azd env set` רגילים נכתבים ב-`.azure/<name>/.env` וניתנים להדפסה על ידי פקודות קריאה. אל תשתמש במפתח API לדוגמה כאישורים אמיתיים. עבור סודות, השתמש ב-`azd env set-secret` וכבל ריצה מפורש.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### תבניות סביבה
צור קובץ **לא סודי, שמתוחזק ידנית** `.env.example` בשורש הפרויקט להגדרה עקבית. azd לא טוען אוטומטית קובץ בשם `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### שיתוף סביבות בין צוות

כאשר יותר מאדם אחד עובד על פרויקט, אתם צריכים להסכים על **מה נוסע עם המאגר ומה נשאר מקומי**. azd שומר כל סביבה תחת תיקייה `.azure/`, ולא כל התוכן שלה צריך להיות מחויב.

**מה יש ב-`.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**מה יש להוסיף ל-gitignore.** ברירת המחדל של azd ב-`.gitignore` כבר מפסיקה לעלות ל-git את `.azure/`. שמור על כך כך—קבצי `.env` יכולים להכיל סודות, וכתובות משאבים הן ספציפיות למי שסיפק אותם. כל חבר צוות יוצר את **הסביבה שלו** באופן מקומי:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**מעבר בין סביבות.** מפתח שמנהל מספר סביבות בוחר את הסביבה הפעילה לפני הרצת פקודות:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**מתן ברירות מחדל שאינן סודיות לצוות.** מחייבים `.env.example` מחוץ לתיקיית `.azure/` שמתעלמים ממנה. חברי צוות חדשים מעתיקים אותה לקובץ מקומי שמתעלמים ממנו, ממלאים ערכים, ומייבאים במפורש את זה באמצעות `azd env set --file <local-file>`. לעולם אל תייבאו מחזיקים ריקים על פני סביבה שעובדת.

**סביבות ב-CI/CD.** צינורות לא קוראים את תיקיית `.azure/` המקומית שלך. במקום זאת, ספק את ערכי הסביבה כמשתני/סודות צינור, ו-azd קורא אותם מסביבת התהליך:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **כלל אצבע:** קוד תשתית (`infra/`, `azure.yaml`) משותף ב-Git; *מצב וסודות הסביבה* (`.azure/`) הם לכל מפתח ולכל pipeline. `azd pipeline config` מגדיר עבורך אוטומטית את משתני ה-pipeline.

## 🔐 תצורת אימות

### אינטגרציה עם Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### אימות בעזרת Service Principal
עבור pipelines של CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Managed Identity
עבור סביבות מתארחות ב-Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ תצורת תשתית

### פרמטרים ב-Bicep
הגדר את פרמטרי התשתית ב-`infra/main.parameters.json`:
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
עבור פרויקטים ב-Terraform, azd מחליף תאי מקום ב-`infra/main.tfvars.json`. שמות אלה חייבים להתאים למשתני הקלט שהוכרזו ב-Terraform:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 תצורת פריסה

### תצורת בנייה
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### תצורת Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
הנתיבים יחסיים לפרויקט השירות. על Dockerfile להצהיר על כל ערכי `ARG` שהוא משתמש בהם. עבור בנייה מרובת שלבים, יש למקם את שלב הפריסה אחרון או להשתמש בזרימת עבודה מותאמת לאריזה; `docker.target` אינה תכונה נתמכת בסכמה שבדקנו.

## 🔧 תצורה מתקדמת

### שם מותאם למשאבים
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

הגדירו שמות ממשיים למשאבים ב-Bicep/Terraform ושמרו על יצירת קבוצת המשאבים בהתאם להגדרה זו. אין מפתחות תצורה כלליים `naming.storageAccount` או `naming.keyVault`.

### תצורת רשת
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

מיזגו את **ערכי הפרמטר המדגימים** האלה לתוך `infra/main.parameters.json` תחת `parameters`, והצהירו וצרכו את הפרמטרים התואמים ב-Bicep. הם לא עושים דבר בעצמם.

### תצורת ניטור
אמצו Application Insights ו-Log Analytics ב-Bicep/Terraform ונתקו טלמטריה של היישום ב-SDK שלכם. אין בלוק הגיוני עליון כללי `monitoring` ב-`azure.yaml` שיוצר את המשאבים האלה. ראו [תשתית ניטור](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 תצורות ספציפיות לסביבה

### סביבת פיתוח
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### סביבת ניסוי
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

## 🔍 אימות תצורה

### אימות תצורה
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### סקריפטים של תצורה
צרו סקריפטים לאימות ב-`scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
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

```

הימנעו מקידוד קשיח של ערכים רגישים (הפרידו תצורה מדגמית, לא מפתח שני `database` באותו קובץ):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ארגנו קבצי תצורה
```
.azure/
├── config.json              # Global project config
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

### 3. שיקולים בניהול גרסאות
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
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

## 🎯 תרגילי פרקטיקה מעשית

### תרגיל 1: תצורה מרובת סביבות (15 דקות)

**מטרה**: צרו והגדירו שלוש סביבות מקומיות עם ערכים שונים. התחילו בפרויקט מאותחל; השתמשו בשמות שלא בשימוש אם הם כבר קיימים. ערכי היישום הספציפיים האלה לא ישנו את ההגדרות של הטלמטריה/הריצה עד שהתבנית שלכם תצרוך אותם.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**קריטריוני הצלחה:**
- [ ] נוצרו בהצלחה שלוש סביבות
- [ ] כל סביבה בעלת תצורה ייחודית
- [ ] ניתן לעבור בין סביבות ללא שגיאות
- [ ] `azd env list` מציג את שלוש הסביבות

### תרגיל 2: הפניות לסודות ב-Key Vault (10-20 דקות)

**מטרה**: שמרו הפניה ל-Key Vault במקום טקסט רגיל. **נקודת התחלה:** סביבה מאותחלת, כניסה לאזור Azure, וגישה אל Key Vault עם הרשאות ליצירה/קריאה של סוד דמיוני. פעולות ב-Vault עלולות לגרור חיובים.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**קריטריוני הצלחה:**
- [ ] פקודת אינטראקטיבית מדווחת אילו Vault ופרטי הסוד נבחרו
- [ ] קובץ `.env` מקומי מכיל הפניה ולא את הסוד הדמיוני
- [ ] יכול להסביר שצריך עדיין להגדיר זהות ריצה/RBAC וצריכה

**בעיות נפוצות:** שגיאת 403 דורשת את תפקיד מטה-נתונים הנכון ב-Vault וזמן הפצה; `azd env set ... --secret` אינה פקודה חוקית. פלט רגיל של `get-values`/`get-value` לא בהכרח מאובטח. הסירו את הפניה לאימון עם `azd env unset TRAINING_API_KEY`; פעולה זו לא מוחקת את סוד ה-Vault, אשר יש לנקות בנפרד אם יצרתם אותו.

## שלבים הבאים

- [הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md) - יישום תצורה בפועל
- [מדריך לפריסה](../chapter-04-infrastructure/deployment-guide.md) - שימוש בתצורה לפריסה
- [הקצאת משאבים](../chapter-04-infrastructure/provisioning.md) - תצורות מוכנות לייצור

## הפניות

- [הפניה לקונפיגורציית azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [סכמת azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [משתני סביבה](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**ניווט בפרק:**
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 3 - הגדרות ואימות
- **⬅️ קודם**: [הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ פרק הבא**: [פרק 4: תשתית כקוד](../chapter-04-infrastructure/deployment-guide.md)
- **שיעור הבא**: [אימות ואבטחה](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->