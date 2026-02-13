# בעיות נפוצות ופתרונות

**ניווט פרק:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 7 - פתרון תקלות וניפוי באגים
- **⬅️ פרק קודם**: [פרק 6: בדיקות טרום-פריסה](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ הבא**: [מדריך ניפוי באגים](debugging.md)
- **🚀 הפרק הבא**: [פרק 8: דפוסים לייצור וארגוניים](../chapter-08-production/production-ai-practices.md)

## הקדמה

מדריך מקיף זה לפתרון תקלות מכסה את הבעיות הנפוצות ביותר בעת שימוש ב-Azure Developer CLI. למדו לאבחן, לתחקר ולפתור בעיות נפוצות בקשר לאימות, פריסה, פריסת תשתית ותצורת יישומים. כל בעיה כוללת סימפטומים מפורטים, סיבות שורש ותהליכי פתרון צעד-אחר-צעד.

## מטרות הלמידה

בסיום מדריך זה תוכלו:
- לשלוט בטכניקות אבחון לבעיות ב-Azure Developer CLI
- להבין בעיות אימות והרשאות נפוצות ואת הפתרונות להן
- לפתור כשלי פריסה, שגיאות בפריסת תשתית ובעיות תצורה
- ליישם אסטרטגיות ניטור וניפוי שגיאות פרואקטיביות
- להחיל שיטות שיטתיות לפתרון בעיות מורכבות
- להגדיר לוגים וניטור נכונים כדי למנוע בעיות עתידיות

## תוצרי למידה

בסיום, תוכלו:
- לאבחן בעיות ב-Azure Developer CLI באמצעות כלי אבחון מובנים
- לפתור בעיות אימות, מנויים והרשאות באופן עצמאי
- לתחקר כשלי פריסה ושגיאות בפריסת תשתית ביעילות
- לנפות בעיות תצורה של יישומים ובעיות התלויות בסביבה
- להטמיע ניטור והתראות לזיהוי פרואקטיבי של בעיות אפשריות
- להחיל שיטות עבודה מומלצות ללוגינג, דיבוג וזרימות עבודה לפתרון בעיות

## אבחון מהיר

לפני שנכנסים לבעיות ספציפיות, הריצו את הפקודות הללו כדי לאסוף מידע אבחוני:

```bash
# בדוק את גרסת azd ואת תקינותו
azd version
azd config list

# אמת את ההתחברות ל-Azure
az account show
az account list

# בדוק את הסביבה הנוכחית
azd env show
azd env get-values

# הפעל רישום לניפוי שגיאות
export AZD_DEBUG=true
azd <command> --debug
```

## בעיות אימות

### בעיה: "Failed to get access token"
**סימפטומים:**
- `azd up` נכשל עם שגיאות אימות
- פקודות מחזירות "unauthorized" או "access denied"

**פתרונות:**
```bash
# 1. בצע אימות מחדש באמצעות Azure CLI
az login
az account show

# 2. נקה אישורים שנשמרו במטמון
az account clear
az login

# 3. השתמש בזרימת קוד למכשיר (למערכות ללא ממשק גרפי)
az login --use-device-code

# 4. הגדר מנוי מפורש
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### בעיה: "Insufficient privileges" במהלך הפריסה
**סימפטומים:**
- הפריסה נכשלת עם שגיאות הרשאה
- אין אפשרות ליצור סוגים מסוימים של משאבי Azure

**פתרונות:**
```bash
# 1. בדוק/י את הקצאות התפקידים שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ודא/י שיש לך את התפקידים הנדרשים
# - Contributor (ליצירת משאבים)
# - User Access Administrator (להקצאת תפקידים)

# 3. פנה/י למנהל ה-Azure שלך לקבלת ההרשאות המתאימות
```

### בעיה: בעיות אימות רב-דיירי
**פתרונות:**
```bash
# 1. התחבר עם שוכר מסוים
az login --tenant "your-tenant-id"

# 2. קבע את השוכר בתצורה
azd config set auth.tenantId "your-tenant-id"

# 3. נקה את מטמון השוכר בעת החלפת שוכר
az account clear
```

## 🏗️ שגיאות בפריסת תשתית

### בעיה: התנגשויות בשמות משאבים
**סימפטומים:**
- שגיאות "The resource name already exists"
- הפריסה נכשלת במהלך יצירת המשאב

**פתרונות:**
```bash
# 1. השתמש בשמות משאבים ייחודיים עם טוקנים
# בתבנית Bicep שלך:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. שנה את שם הסביבה
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. נקה את המשאבים הקיימים
azd down --force --purge
```

### בעיה: המיקום/אזור אינו זמין
**סימפטומים:**
- "The location 'xyz' is not available for resource type"
- סוגי SKU מסוימים לא זמינים באזור שנבחר

**פתרונות:**
```bash
# 1. בדוק מיקומים זמינים עבור סוגי משאבים
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. השתמש באזורים הזמינים בדרך כלל
azd config set defaults.location eastus2
# או
azd env set AZURE_LOCATION eastus2

# 3. בדוק זמינות שירות לפי אזור
# בקר: https://azure.microsoft.com/global-infrastructure/services/
```

### בעיה: חריגות מכסה
**סימפטומים:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**פתרונות:**
```bash
# 1. בדוק את ניצול המכסה הנוכחית
az vm list-usage --location eastus2 -o table

# 2. בקש הגדלת מכסה דרך פורטל Azure
# עבור אל: Subscriptions > Usage + quotas

# 3. השתמש ב-SKU קטנים יותר בפיתוח
# בקובץ main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. נקה משאבים שאינם בשימוש
az resource list --query "[?contains(name, 'unused')]" -o table
```

### בעיה: שגיאות בתבנית Bicep
**סימפטומים:**
- כשלי אימות תבנית
- שגיאות תחביר בקבצי Bicep

**פתרונות:**
```bash
# 1. אמת את תחביר ה-Bicep
az bicep build --file infra/main.bicep

# 2. השתמש ב-linter של Bicep
az bicep lint --file infra/main.bicep

# 3. בדוק את תחביר קובץ הפרמטרים
cat infra/main.parameters.json | jq '.'

# 4. הצג תצוגה מקדימה של השינויים בפריסה
azd provision --preview
```

## 🚀 כשלי פריסה

### בעיה: כשלי בנייה
**סימפטומים:**
- היישום נכשל בבנייה במהלך הפריסה
- שגיאות בהתקנת חבילות

**פתרונות:**
```bash
# 1. בדוק את פלט הבנייה עם דגל דיבוג
azd deploy --service web --debug

# 2. הצג את מצב השירות הפרוס
azd show

# 3. בדוק את הבנייה באופן מקומי
cd src/web
npm install
npm run build

# 3. בדוק תאימות בין גרסאות Node.js ו-Python
node --version  # יש להתאים להגדרות בקובץ azure.yaml
python --version

# 4. נקה את מטמון הבנייה
rm -rf node_modules package-lock.json
npm install

# 5. בדוק את ה-Dockerfile אם משתמשים בקונטיינרים
docker build -t test-image .
docker run --rm test-image
```

### בעיה: כשלי פריסת קונטיינרים
**סימפטומים:**
- אפליקציות קונטיינר נכשלות בפתיחה
- שגיאות משיכת תמונה

**פתרונות:**
```bash
# 1. בדוק את בניית Docker באופן מקומי
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. בדוק את יומני הקונטיינר באמצעות Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. נטר את האפליקציה באמצעות azd
azd monitor --logs

# 3. אמת גישה לרגיסטרי של קונטיינרים
az acr login --name myregistry

# 4. בדוק את תצורת אפליקציית הקונטיינר
az containerapp show --name my-app --resource-group my-rg
```

### בעיה: כשלי חיבור למסד נתונים
**סימפטומים:**
- היישום אינו מצליח להתחבר למסד הנתונים
- שגיאות חיבור/חריגת זמן

**פתרונות:**
```bash
# 1. בדקו את חוקי חומת האש של מסד הנתונים
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. בדקו את החיבור מהיישום
# הוסיפו זאת לאפליקציה שלכם באופן זמני:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. וודאו את פורמט מחרוזת החיבור
azd env get-values | grep DATABASE

# 4. בדקו את מצב שרת מסד הנתונים
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 בעיות תצורה

### בעיה: משתני סביבה לא פועלים
**סימפטומים:**
- היישום לא מצליח לקרוא ערכי תצורה
- משתני סביבה נראים ריקים

**פתרונות:**
```bash
# 1. ודא שמשתני הסביבה מוגדרים
azd env get-values
azd env get DATABASE_URL

# 2. בדוק את שמות המשתנים בקובץ azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. הפעל מחדש את היישום
azd deploy --service web

# 4. בדוק את תצורת שירות האפליקציה
az webapp config appsettings list --name myapp --resource-group myrg
```

### בעיה: בעיות תעודת SSL/TLS
**סימפטומים:**
- HTTPS אינו פועל
- שגיאות אימות תעודה

**פתרונות:**
```bash
# 1. בדוק את מצב תעודת ה-SSL
az webapp config ssl list --resource-group myrg

# 2. הפעל רק HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. הוסף דומיין מותאם אישית (אם נדרש)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### בעיה: בעיות תצורת CORS
**סימפטומים:**
- ה־frontend לא יכול לקרוא ל־API
- בקשת cross-origin נחסמת

**פתרונות:**
```bash
# 1. הגדר את CORS עבור App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. עדכן את ה-API לטיפול ב-CORS
# ב-Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. בדוק אם רץ על כתובות ה-URL הנכונות
azd show
```

## 🌍 בעיות בניהול סביבות

### בעיה: בעיות בהחלפת סביבה
**סימפטומים:**
- נעשה שימוש בסביבה שגויה
- התצורה לא מתחלפת כראוי

**פתרונות:**
```bash
# 1. הצג את כל הסביבות
azd env list

# 2. בחר במפורש את הסביבה
azd env select production

# 3. אמת את הסביבה הנוכחית
azd env show

# 4. צור סביבה חדשה אם הסביבה פגומה
azd env new production-new
azd env select production-new
```

### בעיה: שיבוש בסביבה
**סימפטומים:**
- הסביבה מציגה מצב בלתי חוקי
- המשאבים אינם תואמים לתצורה

**פתרונות:**
```bash
# 1. רענן את מצב הסביבה
azd env refresh

# 2. אפס את תצורת הסביבה
azd env new production-reset
# העתק את משתני הסביבה הנדרשים
azd env set DATABASE_URL "your-value"

# 3. ייבא משאבים קיימים (אם אפשר)
# עדכן ידנית את .azure/production/config.json עם מזהי המשאבים
```

## 🔍 בעיות ביצועים

### בעיה: זמני פריסה איטיים
**סימפטומים:**
- פריסות אורכות זמן רב מדי
- חריגות זמן במהלך הפריסה

**פתרונות:**
```bash
# 1. פרוס שירותים ספציפיים לחזרות מהירות יותר
azd deploy --service web
azd deploy --service api

# 2. השתמש בפריסה של קוד בלבד כאשר התשתית לא השתנתה
azd deploy  # מהיר יותר מ-azd up

# 3. ייעל את תהליך הבנייה
# ב-package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. בדוק את מיקומי המשאבים (השתמש באותו אזור)
azd config set defaults.location eastus2
```

### בעיה: בעיות ביצועי יישום
**סימפטומים:**
- זמני תגובה איטיים
- שימוש גבוה במשאבים

**פתרונות:**
```bash
# 1. להגדיל את המשאבים
# עדכן את ה-SKU בקובץ main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. הפעל ניטור ב-Application Insights
azd monitor --overview

# 3. בדוק את יומני היישום ב-Azure
az webapp log tail --name myapp --resource-group myrg
# או עבור Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. הטמע מטמון
# הוסף מטמון Redis לתשתית שלך
```

## 🛠️ כלי ניפוי תקלות ופקודות

### פקודות דיבוג
```bash
# ניפוי שגיאות מקיף
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# בדוק את גרסת azd
azd version

# הצג את התצורה הנוכחית
azd config list

# בדוק חיבוריות
curl -v https://myapp.azurewebsites.net/health
```

### ניתוח לוגים
```bash
# יומני היישום באמצעות Azure CLI
az webapp log tail --name myapp --resource-group myrg

# ניטור היישום עם azd
azd monitor --logs
azd monitor --live

# יומני המשאבים של Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# יומני קונטיינר (עבור Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### חקירת משאבים
```bash
# הצג את כל המשאבים
az resource list --resource-group myrg -o table

# בדוק את מצב המשאב
az webapp show --name myapp --resource-group myrg --query state

# אבחון רשת
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 קבלת עזרה נוספת

### מתי להעביר הלאה
- בעיות אימות נמשכות לאחר שניסיתם את כל הפתרונות
- בעיות תשתית בשירותי Azure
- בעיות חיוב או מנוי
- חששות או אירועי אבטחה

### ערוצי תמיכה
```bash
# 1. בדוק את Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. צור בקשת תמיכה ל-Azure
# עבור אל: https://portal.azure.com -> עזרה ותמיכה

# 3. משאבי קהילה
# - Stack Overflow: תג azure-developer-cli
# - בעיות ב-GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft שאלות ותשובות: https://learn.microsoft.com/en-us/answers/
```

### מידע לאיסוף
לפני יצירת קשר עם התמיכה, אספו:
- פלט של `azd version`
- פלט של `azd config list`
- פלט של `azd show` (מצב הפריסה הנוכחי)
- הודעות שגיאה (טקסט מלא)
- שלבים לשחזור הבעיה
- פרטי סביבה (`azd env show`)
- ציר זמן של מתי החלה הבעיה

### סקריפט לאיסוף לוגים
```bash
#!/bin/bash
# איסוף-מידע-לניפוי-שגיאות.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 מניעת בעיות

### רשימת בדיקה טרום-פריסה
```bash
# 1. וודא את ההזדהות
az account show

# 2. בדוק את המכסות והמגבלות
az vm list-usage --location eastus2

# 3. אמת את התבניות
az bicep build --file infra/main.bicep

# 4. בדוק תחילה באופן מקומי
npm run build
npm run test

# 5. השתמש בפריסות בהרצה מדומה
azd provision --preview
```

### הגדרת ניטור
```bash
# הפעל את Application Insights
# הוסף לקובץ main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# הגדר התראות
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### תחזוקה שוטפת
```bash
# בדיקות בריאות שבועיות
./scripts/health-check.sh

# סקירת עלויות חודשית
az consumption usage list --billing-period-name 202401

# סקירת אבטחה רבעונית
az security assessment list --resource-group myrg
```

## משאבים קשורים

- [מדריך ניפוי באגים](debugging.md) - טכניקות דיבוג מתקדמות
- [פריסת משאבים](../chapter-04-infrastructure/provisioning.md) - פתרון תקלות תשתית
- [תכנון קיבולת](../chapter-06-pre-deployment/capacity-planning.md) - הנחיות לתכנון משאבים
- [בחירת SKU](../chapter-06-pre-deployment/sku-selection.md) - המלצות לרמת שירות

---

**טיפ**: שמרו מדריך זה בסימניות ותפנו אליו בכל פעם שתיתקלו בבעיות. רוב הבעיות כבר נראו בעבר ויש להן פתרונות מוכחים!

---

**ניווט**
- **שיעור קודם**: [פריסת משאבים](../chapter-04-infrastructure/provisioning.md)
- **השיעור הבא**: [מדריך ניפוי באגים](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אחריות:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית "Co-op Translator" (https://github.com/Azure/co-op-translator). אמנם אנו שואפים לדיוק, יש לשים לב כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפת המקור כמקור הסמכות. עבור מידע קריטי מומלץ תרגום מקצועי שבוצע על ידי מתרגם אנושי. איננו אחראים לכל אי-הבנה או פרשנות שגויה הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->