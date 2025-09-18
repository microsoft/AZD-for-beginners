<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-18T07:11:43+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "he"
}
-->
# בעיות נפוצות ופתרונות

**ניווט בין פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון בעיות וניפוי שגיאות
- **⬅️ פרק קודם**: [פרק 6: בדיקות מקדימות](../pre-deployment/preflight-checks.md)
- **➡️ הבא**: [מדריך לניפוי שגיאות](debugging.md)
- **🚀 פרק הבא**: [פרק 8: דפוסים לייצור ולארגונים](../ai-foundry/production-ai-practices.md)

## הקדמה

מדריך מקיף זה לפתרון בעיות מכסה את הבעיות הנפוצות ביותר בשימוש ב-Azure Developer CLI. תלמדו כיצד לאבחן, לפתור ולתקן בעיות נפוצות הקשורות לאימות, פריסה, הקמת תשתיות וקונפיגורציית אפליקציות. כל בעיה כוללת תסמינים מפורטים, סיבות שורש ונהלי פתרון שלב אחר שלב.

## מטרות למידה

לאחר השלמת המדריך, תוכלו:
- לשלוט בטכניקות אבחון לבעיות ב-Azure Developer CLI
- להבין בעיות נפוצות באימות והרשאות ואת הפתרונות שלהן
- לפתור כשלים בפריסה, שגיאות בהקמת תשתיות ובעיות קונפיגורציה
- ליישם אסטרטגיות ניטור וניפוי שגיאות באופן פרואקטיבי
- להשתמש בשיטות פתרון בעיות שיטתיות לבעיות מורכבות
- להגדיר לוגים וניטור נכונים כדי למנוע בעיות עתידיות

## תוצאות למידה

בסיום, תוכלו:
- לאבחן בעיות ב-Azure Developer CLI באמצעות כלי אבחון מובנים
- לפתור בעיות אימות, מנוי והרשאות באופן עצמאי
- לנפות כשלים בפריסה ושגיאות בהקמת תשתיות בצורה יעילה
- לתקן בעיות קונפיגורציה של אפליקציות ובעיות ספציפיות לסביבה
- ליישם ניטור והתראות כדי לזהות בעיות פוטנציאליות באופן פרואקטיבי
- להשתמש בשיטות עבודה מומלצות ללוגים, ניפוי שגיאות וזרימות פתרון בעיות

## אבחון מהיר

לפני שתצללו לבעיות ספציפיות, הריצו את הפקודות הבאות כדי לאסוף מידע אבחוני:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## בעיות אימות

### בעיה: "Failed to get access token"
**תסמינים:**
- `azd up` נכשל עם שגיאות אימות
- פקודות מחזירות "unauthorized" או "access denied"

**פתרונות:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### בעיה: "Insufficient privileges" במהלך פריסה
**תסמינים:**
- פריסה נכשלת עם שגיאות הרשאה
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

### בעיה: בעיות אימות בסביבה מרובת דיירים
**פתרונות:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ שגיאות בהקמת תשתיות

### בעיה: התנגשות בשמות משאבים
**תסמינים:**
- שגיאות "The resource name already exists"
- פריסה נכשלת במהלך יצירת משאבים

**פתרונות:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### בעיה: מיקום/אזור לא זמין
**תסמינים:**
- "The location 'xyz' is not available for resource type"
- סוגי SKUs מסוימים לא זמינים באזור שנבחר

**פתרונות:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### בעיה: חריגה ממכסה
**תסמינים:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**פתרונות:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### בעיה: שגיאות בתבניות Bicep
**תסמינים:**
- כשלים באימות תבניות
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

### בעיה: כשלים בבנייה
**תסמינים:**
- אפליקציה נכשלת בבנייה במהלך פריסה
- שגיאות התקנת חבילות

**פתרונות:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### בעיה: כשלים בפריסת קונטיינרים
**תסמינים:**
- אפליקציות קונטיינר נכשלות בהפעלה
- שגיאות משיכת תמונה

**פתרונות:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### בעיה: כשלים בחיבור למסד נתונים
**תסמינים:**
- אפליקציה לא מצליחה להתחבר למסד נתונים
- שגיאות זמן קצוב בחיבור

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

### בעיה: משתני סביבה לא עובדים
**תסמינים:**
- אפליקציה לא מצליחה לקרוא ערכי קונפיגורציה
- משתני סביבה מופיעים ריקים

**פתרונות:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### בעיה: בעיות בתעודות SSL/TLS
**תסמינים:**
- HTTPS לא עובד
- שגיאות אימות תעודה

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
**תסמינים:**
- ממשק קדמי לא מצליח לקרוא ל-API
- בקשת Cross-origin נחסמת

**פתרונות:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 בעיות בניהול סביבות

### בעיה: בעיות במעבר בין סביבות
**תסמינים:**
- סביבה שגויה בשימוש
- קונפיגורציה לא מתחלפת כראוי

**פתרונות:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### בעיה: שחיתות בסביבה
**תסמינים:**
- סביבה מציגה מצב לא תקין
- משאבים לא תואמים לקונפיגורציה

**פתרונות:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 בעיות ביצועים

### בעיה: זמני פריסה איטיים
**תסמינים:**
- פריסות לוקחות זמן רב מדי
- שגיאות זמן קצוב במהלך פריסה

**פתרונות:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### בעיה: בעיות ביצועי אפליקציה
**תסמינים:**
- זמני תגובה איטיים
- שימוש גבוה במשאבים

**פתרונות:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ כלי ופקודות לפתרון בעיות

### פקודות ניפוי שגיאות
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### ניתוח לוגים
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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

### מתי להסלים את הבעיה
- בעיות אימות נמשכות לאחר ניסיון כל הפתרונות
- בעיות תשתית עם שירותי Azure
- בעיות הקשורות לחשבונות או מנויים
- חששות או אירועי אבטחה

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
לפני יצירת קשר עם תמיכה, אספו:
- פלט `azd version`
- פלט `azd info`
- הודעות שגיאה (טקסט מלא)
- שלבים לשחזור הבעיה
- פרטי סביבה (`azd env show`)
- ציר זמן של תחילת הבעיה

### סקריפט איסוף לוגים
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 מניעת בעיות

### רשימת בדיקות לפני פריסה
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
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### תחזוקה שוטפת
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## משאבים קשורים

- [מדריך לניפוי שגיאות](debugging.md) - טכניקות ניפוי שגיאות מתקדמות
- [הקמת משאבים](../deployment/provisioning.md) - פתרון בעיות תשתית
- [תכנון קיבולת](../pre-deployment/capacity-planning.md) - הנחיות לתכנון משאבים
- [בחירת SKU](../pre-deployment/sku-selection.md) - המלצות על רמות שירות

---

**טיפ**: שמרו את המדריך הזה במועדפים והיעזרו בו בכל פעם שאתם נתקלים בבעיות. רוב הבעיות כבר נצפו בעבר ויש להן פתרונות מוכרים!

---

**ניווט**
- **שיעור קודם**: [הקמת משאבים](../deployment/provisioning.md)
- **שיעור הבא**: [מדריך לניפוי שגיאות](debugging.md)

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור הסמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.