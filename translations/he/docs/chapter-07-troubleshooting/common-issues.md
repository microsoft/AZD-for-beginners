# בעיות נפוצות ופתרונות

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 7 - פתרון בעיות ואבחון קוד
- **⬅️ פרק קודם**: [פרק 6: בדיקות לפני ההמראה](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ הבא**: [מדריך לאבחון קוד](debugging.md)
- **🚀 פרק הבא**: [פרק 8: דפוסי ייצור ואירגוניים](../chapter-08-production/production-ai-practices.md)

## הקדמה

מדריך מקיף זה לפתרון בעיות מכסה את הבעיות הנפוצות ביותר המופיעות בשימוש ב-Azure Developer CLI. למדו כיצד לאבחן, לפתור ולתקן בעיות נפוצות באימות, פריסת תשתיות, קונפיגורציית יישומים וסביבת העבודה. כל בעיה כוללת סימפטומים מפורטים, סיבות שורש וצעדים לפתרון.

## מטרות הלמידה

בסיום המדריך, תוכלו:
- לשלוט בטכניקות אבחון לבעיות Azure Developer CLI
- להבין בעיות נפוצות באימות והרשאות ופתרונן
- לפתור כשלונות בפריסה, שגיאות בהקצאת תשתיות ובעיות קונפיגורציה
- ליישם אסטרטגיות ניטור ופתרון בעיות יזומות
- ליישם שיטות שיטתיות לפתרון בעיות מורכבות
- להגדיר לוגינג וניטור מתאים למניעת בעיות עתידיות

## תוצאות הלמידה

בסיום, תוכלו:
- לאבחן בעיות ב-Azure Developer CLI תוך שימוש בכלי אבחון מובנים
- לפתור בעיות אימות, מנוי והרשאות באופן עצמאי
- לטפל בבעיות פריסה ושגיאות בקביעת התשתית ביעילות
- לאבחן בעיות בקונפיגורציה של יישומים ובעיות סביבתיות ספציפיות
- ליישם ניטור והתראות כדי לזהות בעיות פוטנציאליות מראש
- ליישם שיטות עבודה מומלצות ללוגינג, איתור באגים ופתרון בעיות

## אבחון מהיר

> החליפו שמות/מזהים לדוגמא בערכי הסביבה שלכם. קטעי Bash, Bicep, JavaScript ופרמטרים מסומנים בנפרד למטה; אלו אינם סקריפטים להפעלה ישירה. עברו על פעולות הרס והסירו סודות לפני שיתוף אבחונים. `azd monitor --logs` פותח דפדפן; אינו משדר לוגים של הטרמינל.

לפני שנכנסים לבעיות ספציפיות, הריצו את הפקודות האלה לאיסוף מידע אבחוני:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## בעיות באימות

### בעיה: "נכשל בקבלת טוקן גישה"
**סימפטומים:**
- `azd up` נכשל עם שגיאות אימות
- פקודות מחזירות "לא מורשה" או "גישה נדחתה"

**פתרונות:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### בעיה: "הרשאות לא מספיקות" במהלך הפריסה
**סימפטומים:**
- הפריסה נכשלת עם שגיאות הרשאה
- לא ניתן ליצור משאבים מסוימים ב-Azure

**פתרונות:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### בעיה: בעיות אימות מולטי-טננט
**פתרונות:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ שגיאות בפרישת תשתית

### בעיה: התנגשויות שמות משאבים
**סימפטומים:**
- שגיאות "שם המשאב כבר קיים"
- הפריסה נכשלת במהלך יצירת המשאב

**פתרונות:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### בעיה: מיקום/אזור לא זמין
**סימפטומים:**
- "המיקום 'xyz' אינו זמין לסוג המשאב"
- סוגי SKU מסוימים לא זמינים באזור שנבחר

**פתרונות:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

שינוי משתנה המיקום אינו מMigration את המשאבים הקיימים. קבוצת משאבים קיימת או משאב עשויים לדחות שינוי מיקום; השתמשו בסביבה נפרדת לפריסת מחודשת אזורית.

### בעיה: שגיאות חריגות מכסה (Quota)
**סימפטומים:**
- "חריגת מכסה לסוג המשאב"
- "הושג מספר המשאבים המקסימלי"

**פתרונות:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

לפיתוח, בחרו SKU קטן נתמך ב-`infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### בעיה: שגיאות תבנית Bicep
**סימפטומים:**
- כשלונות באימות התבנית
- שגיאות תחביר בקבצי Bicep

**פתרונות:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 כשלים בפריסה

### בעיה: כשלונות בבנייה
**סימפטומים:**
- היישום נכשל בבנייה במהלך הפריסה
- שגיאות התקנת חבילה

**פתרונות:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### בעיה: כשלים בפריסת מכולות
**סימפטומים:**
- יישומי מכולות לא מצליחים להפעיל
- שגיאות משיכת תמונה

**פתרונות:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### בעיה: כשלים בחיבור לבסיס נתונים
**סימפטומים:**
- היישום לא מצליח להתחבר לבסיס הנתונים
- שגיאות חוסר תגובה בחיבור

**פתרונות:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 בעיות קונפיגורציה

### בעיה: משתני סביבה אינם עובדים
**סימפטומים:**
- האפליקציה אינה מצליחה לקרוא ערכי קונפיגורציה
- משתני הסביבה נראים ריקים

**פתרונות:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### בעיה: בעיות בתעודות SSL/TLS
**סימפטומים:**
- HTTPS לא עובד
- שגיאות באימות התעודה

**פתרונות:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### בעיה: בעיות בקונפיגורציית CORS
**סימפטומים:**
- Frontend לא מצליח לקרוא ל-API
- בקשת Cross-origin נחסמה

**פתרונות:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. עדכן את אפליקציית Express הקיימת שלך (עם `cors` מיובא):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 בעיות בניהול סביבה

### בעיה: בעיות במעבר בין סביבות
**סימפטומים:**
- שימוש בסביבה שגויה
- הקונפיגורציה אינה מתחלפת כראוי

**פתרונות:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### בעיה: פגימת סביבה
**סימפטומים:**
- הסביבה מציגה מצב לא חוקי
- המשאבים אינם תואמים לקונפיגורציה

**פתרונות:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 בעיות ביצועים

### בעיה: זמני פריסה איטיים
**סימפטומים:**
- פריסות לוקחות זמן רב מדי
- פקיעת זמן במהלך הפריסה

**פתרונות:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### בעיה: בעיות ביצועי יישום
**סימפטומים:**
- זמני תגובה איטיים
- שימוש גבוה במשאבים

**פתרונות:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ כלי אבחון ופקודות

### פקודות איתור באגים
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### ניתוח לוגים
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### חקירת משאבים
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 קבלת עזרה נוספת

### מתי להעביר הלאה
- בעיות אימות נמשכות לאחר ניסוי כל הפתרונות
- בעיות תשתית בשירותי Azure
- בעיות חיוב או מנוי
- חששות או תקריות אבטחה

### ערוצי תמיכה
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### מידע לאיסוף
לפני פניה לתמיכה, אספו:
- פלט `azd version`
- פלט `azd config show`
- פלט `azd show` (מצב הפריסה הנוכחי)
- הודעות שגיאה (טקסט מלא)
- צעדים לשחזור הבעיה
- פרטי סביבה מסוננים (אל תשתפו לעולם `azd env get-values` גולמניים, שעשויים להכיל סודות)
- ציר זמן של מועד ההתחלה של הבעיה

### סקריפט איסוף לוגים
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 מניעת בעיות

### רשימת בדיקה טרם פריסה
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### הגדרת ניטור
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### תחזוקה שוטפת
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## משאבים קשורים

- [מדריך איתור באגים](debugging.md) - טכניקות איתור באגים מתקדמות
- [פרישת משאבים](../chapter-04-infrastructure/provisioning.md) - פתרון בעיות בתשתית
- [תכנון קיבולת](../chapter-06-pre-deployment/capacity-planning.md) - הנחיות לתכנון משאבים
- [בחירת SKU](../chapter-06-pre-deployment/sku-selection.md) - המלצות על שכבת שירות

---

**טיפ**: שמרו את המדריך כסימניה והפנו אליו בכל פעם שתיתקלו בבעיות. רוב הבעיות כבר נראו בעבר ויש להן פתרונות מוכרים!

---

**ניווט**
- **שיעור קודם**: [פרישת משאבים](../chapter-04-infrastructure/provisioning.md)
- **שיעור הבא**: [מדריך איתור באגים](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->