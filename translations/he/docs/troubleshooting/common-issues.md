<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-21T17:26:50+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "he"
}
-->
# בעיות נפוצות ופתרונות

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון בעיות וניפוי שגיאות
- **⬅️ פרק קודם**: [פרק 6: בדיקות מקדימות](../pre-deployment/preflight-checks.md)
- **➡️ הבא**: [מדריך ניפוי שגיאות](debugging.md)
- **🚀 פרק הבא**: [פרק 8: דפוסי ייצור וארגונים](../microsoft-foundry/production-ai-practices.md)

## מבוא

מדריך פתרון הבעיות המקיף הזה מכסה את הבעיות הנפוצות ביותר בשימוש ב-Azure Developer CLI. תלמדו כיצד לאבחן, לפתור ולתקן בעיות נפוצות הקשורות לאימות, פריסה, הקצאת תשתית וקונפיגורציית יישומים. כל בעיה כוללת תסמינים מפורטים, סיבות שורש ונהלי פתרון שלב אחר שלב.

## מטרות למידה

בסיום המדריך, תלמדו:
- לשלוט בטכניקות אבחון לבעיות Azure Developer CLI
- להבין בעיות נפוצות באימות והרשאות ואת הפתרונות להן
- לפתור כשלי פריסה, שגיאות הקצאת תשתית ובעיות קונפיגורציה
- ליישם אסטרטגיות ניטור וניפוי שגיאות פרואקטיביות
- ליישם שיטות פתרון בעיות שיטתיות לבעיות מורכבות
- להגדיר רישום וניטור נכונים למניעת בעיות עתידיות

## תוצאות למידה

בסיום, תוכלו:
- לאבחן בעיות Azure Developer CLI באמצעות כלי אבחון מובנים
- לפתור בעיות הקשורות לאימות, מנויים והרשאות באופן עצמאי
- לנפות שגיאות פריסה ושגיאות הקצאת תשתית ביעילות
- לנפות בעיות קונפיגורציה של יישומים ובעיות ספציפיות לסביבה
- ליישם ניטור והתראות כדי לזהות בעיות פוטנציאליות באופן פרואקטיבי
- ליישם שיטות עבודה מומלצות לרישום, ניפוי שגיאות ופתרון בעיות

## אבחון מהיר

לפני שתצללו לבעיות ספציפיות, הריצו את הפקודות הבאות כדי לאסוף מידע אבחוני:

```bash
# בדוק את גרסת azd ואת תקינותה
azd version
azd config list

# אמת את האימות של Azure
az account show
az account list

# בדוק את הסביבה הנוכחית
azd env show
azd env get-values

# הפעל רישום באגים
export AZD_DEBUG=true
azd <command> --debug
```

## בעיות אימות

### בעיה: "נכשל בקבלת אסימון גישה"
**תסמינים:**
- `azd up` נכשל עם שגיאות אימות
- פקודות מחזירות "לא מורשה" או "גישה נדחתה"

**פתרונות:**
```bash
# 1. אימות מחדש עם Azure CLI
az login
az account show

# 2. נקה אישורים שמורים במטמון
az account clear
az login

# 3. השתמש בזרימת קוד מכשיר (למערכות ללא ראש)
az login --use-device-code

# 4. הגדר מנוי מפורש
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### בעיה: "הרשאות לא מספקות" במהלך פריסה
**תסמינים:**
- פריסה נכשלת עם שגיאות הרשאה
- לא ניתן ליצור משאבים מסוימים ב-Azure

**פתרונות:**
```bash
# 1. בדוק את הקצאות התפקידים שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ודא שיש לך את התפקידים הנדרשים
# - תורם (ליצירת משאבים)
# - מנהל גישת משתמשים (להקצאת תפקידים)

# 3. פנה למנהל ה-Azure שלך לקבלת הרשאות מתאימות
```

### בעיה: בעיות אימות רב-דיירות
**פתרונות:**
```bash
# 1. התחבר עם דייר ספציפי
az login --tenant "your-tenant-id"

# 2. הגדר דייר בתצורה
azd config set auth.tenantId "your-tenant-id"

# 3. נקה מטמון דייר אם מחליפים דיירים
az account clear
```

## 🏗️ שגיאות הקצאת תשתית

### בעיה: התנגשויות בשמות משאבים
**תסמינים:**
- שגיאות "שם המשאב כבר קיים"
- פריסה נכשלת במהלך יצירת משאבים

**פתרונות:**
```bash
# 1. השתמש בשמות משאבים ייחודיים עם אסימונים
# בתבנית Bicep שלך:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. שנה את שם הסביבה
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. נקה משאבים קיימים
azd down --force --purge
```

### בעיה: מיקום/אזור לא זמין
**תסמינים:**
- "המיקום 'xyz' אינו זמין עבור סוג המשאב"
- סוגי SKUs מסוימים אינם זמינים באזור שנבחר

**פתרונות:**
```bash
# 1. בדוק מיקומים זמינים עבור סוגי משאבים
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. השתמש באזורים זמינים נפוצים
azd config set defaults.location eastus2
# או
azd env set AZURE_LOCATION eastus2

# 3. בדוק זמינות שירות לפי אזור
# בקר בכתובת: https://azure.microsoft.com/global-infrastructure/services/
```

### בעיה: שגיאות חריגה ממכסה
**תסמינים:**
- "חריגה ממכסה עבור סוג המשאב"
- "המספר המרבי של משאבים הושג"

**פתרונות:**
```bash
# 1. בדוק את השימוש הנוכחי במכסה
az vm list-usage --location eastus2 -o table

# 2. בקש הגדלת מכסה דרך פורטל Azure
# עבור אל: מנויים > שימוש + מכסות

# 3. השתמש ב-SKUs קטנים יותר לפיתוח
# ב-main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. נקה משאבים שאינם בשימוש
az resource list --query "[?contains(name, 'unused')]" -o table
```

### בעיה: שגיאות תבנית Bicep
**תסמינים:**
- כשלי אימות תבנית
- שגיאות תחביר בקבצי Bicep

**פתרונות:**
```bash
# 1. אימות תחביר Bicep
az bicep build --file infra/main.bicep

# 2. שימוש ב-Bicep linter
az bicep lint --file infra/main.bicep

# 3. בדיקת תחביר קובץ פרמטרים
cat infra/main.parameters.json | jq '.'

# 4. תצוגה מקדימה של שינויים בפריסה
azd provision --preview
```

## 🚀 כשלי פריסה

### בעיה: כשלי בנייה
**תסמינים:**
- היישום נכשל בבנייה במהלך הפריסה
- שגיאות התקנת חבילות

**פתרונות:**
```bash
# 1. בדוק יומני בנייה
azd logs --service web
azd deploy --service web --debug

# 2. בדוק את הבנייה באופן מקומי
cd src/web
npm install
npm run build

# 3. בדוק תאימות גרסאות Node.js/Python
node --version  # צריך להתאים להגדרות azure.yaml
python --version

# 4. נקה את מטמון הבנייה
rm -rf node_modules package-lock.json
npm install

# 5. בדוק את Dockerfile אם משתמשים במכולות
docker build -t test-image .
docker run --rm test-image
```

### בעיה: כשלי פריסת מכולות
**תסמינים:**
- יישומי מכולות לא מתחילים לפעול
- שגיאות משיכת תמונה

**פתרונות:**
```bash
# 1. בדוק את בניית Docker באופן מקומי
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. בדוק את יומני המכולה
azd logs --service api --follow

# 3. אמת גישה לרישום המכולה
az acr login --name myregistry

# 4. בדוק את תצורת אפליקציית המכולה
az containerapp show --name my-app --resource-group my-rg
```

### בעיה: כשלי חיבור למסד נתונים
**תסמינים:**
- היישום לא מצליח להתחבר למסד הנתונים
- שגיאות פקיעת זמן חיבור

**פתרונות:**
```bash
# 1. בדוק את חוקי חומת האש של מסד הנתונים
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. בדוק את הקישוריות מהאפליקציה
# הוסף לאפליקציה שלך באופן זמני:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. אמת את פורמט מחרוזת החיבור
azd env get-values | grep DATABASE

# 4. בדוק את מצב שרת מסד הנתונים
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 בעיות קונפיגורציה

### בעיה: משתני סביבה לא עובדים
**תסמינים:**
- היישום לא מצליח לקרוא ערכי קונפיגורציה
- משתני סביבה נראים ריקים

**פתרונות:**
```bash
# 1. ודא שמשתני הסביבה מוגדרים
azd env get-values
azd env get DATABASE_URL

# 2. בדוק שמות משתנים ב-azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. הפעל מחדש את היישום
azd deploy --service web

# 4. בדוק את תצורת שירות היישום
az webapp config appsettings list --name myapp --resource-group myrg
```

### בעיה: בעיות תעודות SSL/TLS
**תסמינים:**
- HTTPS לא עובד
- שגיאות אימות תעודה

**פתרונות:**
```bash
# 1. בדוק את מצב תעודת ה-SSL
az webapp config ssl list --resource-group myrg

# 2. הפעל HTTPS בלבד
az webapp update --name myapp --resource-group myrg --https-only true

# 3. הוסף דומיין מותאם אישית (אם נדרש)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### בעיה: בעיות קונפיגורציית CORS
**תסמינים:**
- החזית לא מצליחה לקרוא ל-API
- בקשה חוצת מקורות נחסמת

**פתרונות:**
```bash
# 1. הגדר CORS עבור שירות האפליקציה
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. עדכן את ה-API לטיפול ב-CORS
# ב-Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. בדוק אם פועל בכתובות URL הנכונות
azd show
```

## 🌍 בעיות ניהול סביבה

### בעיה: בעיות במעבר בין סביבות
**תסמינים:**
- סביבה שגויה בשימוש
- הקונפיגורציה לא מתחלפת כראוי

**פתרונות:**
```bash
# 1. רשום את כל הסביבות
azd env list

# 2. בחר באופן מפורש סביבה
azd env select production

# 3. אמת את הסביבה הנוכחית
azd env show

# 4. צור סביבה חדשה אם היא פגומה
azd env new production-new
azd env select production-new
```

### בעיה: שחיתות סביבה
**תסמינים:**
- הסביבה מציגה מצב לא תקין
- המשאבים לא תואמים לקונפיגורציה

**פתרונות:**
```bash
# 1. רענן את מצב הסביבה
azd env refresh

# 2. אפס את תצורת הסביבה
azd env new production-reset
# העתק את משתני הסביבה הנדרשים
azd env set DATABASE_URL "your-value"

# 3. יבא משאבים קיימים (אם אפשרי)
# עדכן ידנית את .azure/production/config.json עם מזהי המשאבים
```

## 🔍 בעיות ביצועים

### בעיה: זמני פריסה איטיים
**תסמינים:**
- פריסות לוקחות זמן רב מדי
- פקיעת זמן במהלך פריסה

**פתרונות:**
```bash
# 1. הפעל פריסה מקבילה
azd config set deploy.parallelism 5

# 2. השתמש בפריסות הדרגתיות
azd deploy --incremental

# 3. מיטוב תהליך הבנייה
# ב-package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. בדוק מיקומי משאבים (השתמש באותו אזור)
azd config set defaults.location eastus2
```

### בעיה: בעיות ביצועי יישום
**תסמינים:**
- זמני תגובה איטיים
- שימוש גבוה במשאבים

**פתרונות:**
```bash
# 1. הגדל משאבים
# עדכן SKU ב-main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. הפעל ניטור Application Insights
azd monitor

# 3. בדוק יומני יישום עבור צווארי בקבוק
azd logs --service api --follow

# 4. יישם מטמון
# הוסף מטמון Redis לתשתית שלך
```

## 🛠️ כלים ופקודות לפתרון בעיות

### פקודות ניפוי שגיאות
```bash
# ניפוי באגים מקיף
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# בדוק מידע מערכת
azd info

# אמת תצורה
azd config validate

# בדוק קישוריות
curl -v https://myapp.azurewebsites.net/health
```

### ניתוח לוגים
```bash
# יומני יישום
azd logs --service web --follow
azd logs --service api --since 1h

# יומני משאבי Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# יומני מכולות (עבור אפליקציות מכולה)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### חקירת משאבים
```bash
# רשום את כל המשאבים
az resource list --resource-group myrg -o table

# בדוק את מצב המשאב
az webapp show --name myapp --resource-group myrg --query state

# אבחון רשת
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 קבלת עזרה נוספת

### מתי להסלים
- בעיות אימות נמשכות לאחר שניסיתם את כל הפתרונות
- בעיות תשתית עם שירותי Azure
- בעיות הקשורות לחיוב או למנוי
- חששות או אירועי אבטחה

### ערוצי תמיכה
```bash
# 1. בדוק את מצב השירות של Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. צור כרטיס תמיכה ב-Azure
# עבור אל: https://portal.azure.com -> עזרה + תמיכה

# 3. משאבי קהילה
# - Stack Overflow: תג azure-developer-cli
# - בעיות ב-GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### מידע לאיסוף
לפני יצירת קשר עם התמיכה, אספו:
- פלט `azd version`
- פלט `azd info`
- הודעות שגיאה (טקסט מלא)
- שלבים לשחזור הבעיה
- פרטי סביבה (`azd env show`)
- ציר זמן של מתי הבעיה התחילה

### סקריפט איסוף לוגים
```bash
#!/bin/bash
# אסוף-מידע-ניפוי-שגיאות.sh

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
# 1. אימות הזדהות
az account show

# 2. בדיקת מכסות ומגבלות
az vm list-usage --location eastus2

# 3. אימות תבניות
az bicep build --file infra/main.bicep

# 4. בדיקה מקומית תחילה
npm run build
npm run test

# 5. שימוש בפריסות בדיקה
azd provision --preview
```

### הגדרת ניטור
```bash
# הפעל תובנות יישום
# הוסף ל-main.bicep:
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

- [מדריך ניפוי שגיאות](debugging.md) - טכניקות ניפוי שגיאות מתקדמות
- [הקצאת משאבים](../deployment/provisioning.md) - פתרון בעיות תשתית
- [תכנון קיבולת](../pre-deployment/capacity-planning.md) - הנחיות לתכנון משאבים
- [בחירת SKU](../pre-deployment/sku-selection.md) - המלצות על רמות שירות

---

**טיפ**: שמרו את המדריך הזה במועדפים וחזרו אליו בכל פעם שאתם נתקלים בבעיות. רוב הבעיות כבר נצפו בעבר ויש להן פתרונות מוכחים!

---

**ניווט**
- **שיעור קודם**: [הקצאת משאבים](../deployment/provisioning.md)
- **שיעור הבא**: [מדריך ניפוי שגיאות](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->