# בעיות נפוצות ופתרונות

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון תקלות ואיתור באגים
- **⬅️ פרק קודם**: [פרק 6: בדיקות לפני הפעלה](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ הבא**: [מדריך איתור באגים](debugging.md)
- **🚀 פרק הבא**: [פרק 8: תבניות ייצור וארגוניות](../chapter-08-production/production-ai-practices.md)

## מבוא

מדריך מקיף לפתרון תקלות זה מכסה את הבעיות הנפוצות ביותר שנפגשות בעת שימוש ב-Azure Developer CLI. למדו לאבחן, לפתור ולתקן בעיות שכיחות באימות, פריסה, פריסת תשתיות והגדרת אפליקציות. כל בעיה כוללת תסמינים מפורטים, סיבות שורשיות ותהליכי פתרון שלב-אחר-שלב.

## מטרות הלמידה

בסיום מדריך זה, תוכלו:
- להתמקצע בטכניקות אבחון לבעיות Azure Developer CLI
- להבין בעיות נפוצות באימות והרשאות ופתרונן
- לפתור כשלים בפריסה, שגיאות בפריסת תשתיות ובעיות תצורה
- ליישם אסטרטגיות ניטור ואיתור באגים יזומות
- להשתמש במתודולוגיות פתרון בעיות שיטתיות לבעיות מורכבות
- להגדיר רישום וניטור נכונים למניעת בעיות עתידיות

## תוצאות הלמידה

בסיום הקורס תוכלו:
- לאבחן בעיות Azure Developer CLI באמצעות כלי אבחון מובנים
- לפתור בעיות אימות, מנויים והרשאות באופן עצמאי
- לפתור כשלים בפריסה ושגיאות בפריסת תשתיות בצורה אפקטיבית
- לאתר באגים בבעיות תצורת אפליקציה ובעיות סביבתיות ספציפיות
- ליישם ניטור והתראות לזיהוי יזום של בעיות פוטנציאליות
- להפעיל שיטות עבודה מומלצות לרישום, איתור באגים ופתרון תקלות

## אבחון מהיר

לפני שנכנסים לבעיות ספציפיות, הריצו את הפקודות הבאות לאיסוף מידע אבחוני:

```bash
# בדוק גרסת azd ובריאות
azd version
azd config show

# אמת את האימות של Azure
az account show
az account list

# בדוק את הסביבה הנוכחית
azd env list
azd env get-values

# הפעל רישום ניפוי שגיאות
export AZD_DEBUG=true
azd <command> --debug
```

## בעיות אימות

### בעיה: "כשל בקבלת אסימון גישה"
**תסמינים:**
- `azd up` נכשל עם שגיאות אימות
- הפקודות מחזירות "לא מורשה" או "גישה נדחתה"

**פתרונות:**
```bash
# 1. התחבר מחדש באמצעות Azure CLI
az login
az account show

# 2. נקה אישורי זיכרון מטמון
az account clear
az login

# 3. השתמש בזרימת קוד מכשיר (למערכות ללא ממשק)
az login --use-device-code

# 4. הגדר מנוי מפורש
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### בעיה: "הרשאות לא מספקות" במהלך פריסה
**תסמינים:**
- הפריסה נכשלת עם שגיאות הרשאה
- לא ניתן ליצור משאבים מסוימים ב-Azure

**פתרונות:**
```bash
# 1. בדוק את שיוכי התפקידים שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ודא שיש לך את התפקידים הנדרשים
# - משתתף (ליצירת משאבים)
# - מנהל גישה למשתמשים (לשיוכי תפקידים)

# 3. פנה למנהל ה-Azure שלך לקבלת הרשאות מתאימות
```

### בעיה: בעיות אימות רב-דיירים
**פתרונות:**
```bash
# 1. התחבר עם שוכר מסוים
az login --tenant "your-tenant-id"

# 2. הגדר את השוכר בקונפיגורציה
azd config set auth.tenantId "your-tenant-id"

# 3. נקה את המטמון של השוכר אם מחליפים שוכרים
az account clear
```

## 🏗️ שגיאות בפריסת תשתיות

### בעיה: התנגשויות בשמות משאבים
**תסמינים:**
- שגיאות "שם המשאב כבר קיים"
- הפריסה נכשלת במהלך יצירת משאב

**פתרונות:**
```bash
# 1. השתמש בשמות משאבים ייחודיים עם טוקנים
# בתבנית הביספ שלך:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. שנה את שם הסביבה
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. נקה משאבים קיימים
azd down --force --purge
```

### בעיה: מיקום/אזור לא זמין
**תסמינים:**
- "המיקום 'xyz' אינו זמין לסוג המשאב"
- SKU מסוימים אינם זמינים באזור הנבחר

**פתרונות:**
```bash
# 1. בדוק מיקומים זמינים עבור סוגי משאבים
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. השתמש באזורים הזמינים בדרך כלל
azd config set defaults.location eastus2
# או
azd env set AZURE_LOCATION eastus2

# 3. בדוק זמינות שירות לפי אזור
# בקר ב: https://azure.microsoft.com/global-infrastructure/services/
```

### בעיה: חריגות מכסה
**תסמינים:**
- "חריגת מכסה עבור סוג המשאב"
- "מספר המשאבים המקסימלי הושג"

**פתרונות:**
```bash
# 1. בדוק את השימוש הנוכחי במכסה
az vm list-usage --location eastus2 -o table

# 2. בקש הגדלת מכסה דרך פורטל Azure
# עבור אל: מנויים > שימוש + מכסות

# 3. השתמש ב-SKU קטנים יותר לפיתוח
# בקובץ main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. נקה משאבים שלא בשימוש
az resource list --query "[?contains(name, 'unused')]" -o table
```

### בעיה: שגיאות בתבנית Bicep
**תסמינים:**
- כשל באימות תבנית
- שגיאות תחביר בקבצי Bicep

**פתרונות:**
```bash
# 1. לאמת את תחביר Bicep
az bicep build --file infra/main.bicep

# 2. להשתמש בלינטר של Bicep
az bicep lint --file infra/main.bicep

# 3. לבדוק את תחביר קובץ הפרמטרים
cat infra/main.parameters.json | jq '.'

# 4. תצוגה מקדימה של שינויים בפריסה
azd provision --preview
```

## 🚀 כשלים בפריסה

### בעיה: כשלים בבנייה
**תסמינים:**
- האפליקציה נכשלת לבנות במהלך הפריסה
- שגיאות בהתקנת חבילות

**פתרונות:**
```bash
# 1. בדוק את פלט הבנייה עם דגל ניקוד
azd deploy --service web --debug

# 2. הצג סטטוס של השירות המפורסם
azd show

# 3. בדוק את הבנייה באופן מקומי
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

### בעיה: כשלים בפריסת מכולות
**תסמינים:**
- אפליקציות מכולה לא מתחילות
- שגיאות משיכת תמונות

**פתרונות:**
```bash
# 1. בדוק בניית Docker ברמה מקומית
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. בדוק את יומני המיכל באמצעות Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. נהל את היישום דרך azd
azd monitor --logs

# 3. אמת גישה למאגר המכולות
az acr login --name myregistry

# 4. בדוק את תצורת יישום המיכל
az containerapp show --name my-app --resource-group my-rg
```

### בעיה: כשלים בחיבור למסד נתונים
**תסמינים:**
- האפליקציה לא מצליחה להתחבר למסד הנתונים
- שגיאות טיימאוט בחיבור

**פתרונות:**
```bash
# 1. בדוק את חוקי חומת האש של מסד הנתונים
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. בדוק את החיבור מהאפליקציה
# הוסף לאפליקציה שלך זמנית:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. אמת את פורמט מחרוזת החיבור
azd env get-values | grep DATABASE

# 4. בדוק את מצב שרת מסד הנתונים
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 בעיות תצורה

### בעיה: משתני סביבה לא פועלים
**תסמינים:**
- האפליקציה לא יכולה לקרוא ערכי תצורה
- משתני סביבה נראים ריקים

**פתרונות:**
```bash
# 1. וודא שמשתני הסביבה מוגדרים
azd env get-values
azd env get DATABASE_URL

# 2. בדוק את שמות המשתנים ב-azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. הפעל מחדש את האפליקציה
azd deploy --service web

# 4. בדוק את תצורת שירות האפליקציה
az webapp config appsettings list --name myapp --resource-group myrg
```

### בעיה: בעיות בתעודות SSL/TLS
**תסמינים:**
- HTTPS לא עובד
- שגיאות באימות תעודה

**פתרונות:**
```bash
# 1. בדוק את מצב תעודת ה-SSL
az webapp config ssl list --resource-group myrg

# 2. הפעל HTTPS בלבד
az webapp update --name myapp --resource-group myrg --https-only true

# 3. הוסף דומיין מותאם אישית (אם נדרש)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### בעיה: בעיות תצורת CORS
**תסמינים:**
- הממשק הקדמי לא יכול לקרוא ל-API
- בקשת cross-origin חסומה

**פתרונות:**
```bash
# 1. הגדר CORS לשירות האפליקציה
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. עדכן את ה-API כדי לטפל ב-CORS
# ב-Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. בדוק אם רץ על כתובות URL נכונות
azd show
```

## 🌍 בעיות בניהול סביבה

### בעיה: בעיות בהחלפת סביבת עבודה
**תסמינים:**
- שימוש בסביבה שגויה
- תצורה לא מתחלפת כראוי

**פתרונות:**
```bash
# 1. רשום את כל הסביבות
azd env list

# 2. בחר סביבה במפורש
azd env select production

# 3. אמת את הסביבה הנוכחית
azd env list

# 4. צור סביבה חדשה אם היא פגומה
azd env new production-new
azd env select production-new
```

### בעיה: שחיתות סביבה
**תסמינים:**
- הסביבה מציגה מצב שגוי
- משאבים לא תואמים לתצורה

**פתרונות:**
```bash
# 1. רענן את מצב הסביבה
azd env refresh

# 2. אפס את תצורת הסביבה
azd env new production-reset
# העתק את משתני הסביבה הנדרשים
azd env set DATABASE_URL "your-value"

# 3. ייבא משאבים קיימים (אם אפשרי)
# עדכן ידנית את .azure/production/config.json עם מזהי המשאבים
```

## 🔍 בעיות ביצועים

### בעיה: זמני פריסה איטיים
**תסמינים:**
- פריסות אורך זמן רב מדי
- טיימאוטים במהלך פריסה

**פתרונות:**
```bash
# 1. לפרוס שירותים ספציפיים עבור איטרציה מהירה יותר
azd deploy --service web
azd deploy --service api

# 2. השתמש בפריסת קוד בלבד כשהתשתית לא השתנתה
azd deploy  # מהיר יותר מ- azd up

# 3. לאופטימיזציית תהליך הבנייה
# בקובץ package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. בדוק מיקומי משאבים (השתמש באותו אזור)
azd config set defaults.location eastus2
```

### בעיה: בעיות ביצועי אפליקציה
**תסמינים:**
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

# 3. בדוק יומני יישום ב-Azure
az webapp log tail --name myapp --resource-group myrg
# או עבור Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. יישם מטמון
# הוסף מטמון Redis לתשתית שלך
```

## 🛠️ כלים ופקודות לאיתור תקלות

### פקודות איתור באגים
```bash
# ניפוי שגיאות מקיף
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# בדוק את גרסת azd
azd version

# הצג את ההגדרות הנוכחיות
azd config show

# בדוק את הקישוריות
curl -v https://myapp.azurewebsites.net/health
```

### ניתוח לוגים
```bash
# יומני אפליקציה דרך Azure CLI
az webapp log tail --name myapp --resource-group myrg

# ניטור אפליקציה עם azd
azd monitor --logs
azd monitor --live

# יומני משאבי Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# יומני קונטיינר (לאפליקציות קונטיינר)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### חקירת משאבים
```bash
# רשום את כל המשאבים
az resource list --resource-group myrg -o table

# בדוק את מצב המשאבים
az webapp show --name myapp --resource-group myrg --query state

# אבחון רשת
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 קבלת עזרה נוספת

### מתי להעביר הלאה
- בעיות אימות נמשכות לאחר ניסיון כל הפתרונות
- בעיות בתשתית עם שירותי Azure
- בעיות בחיוב או במנוי
- חששות או אירועי אבטחה

### ערוצי תמיכה
```bash
# 1. בדוק את בריאות שירותי Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. צור פנייה לתמיכה של Azure
# עבור אל: https://portal.azure.com -> עזרה + תמיכה

# 3. משאבי קהילה
# - Stack Overflow: תג azure-developer-cli
# - בעיות ב-GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### מידע לאיסוף
לפני שפונים לתמיכה, אספו:
- פלט `azd version`
- פלט `azd config show`
- פלט `azd show` (מצב הפריסה הנוכחי)
- הודעות שגיאה (טקסט מלא)
- צעדים להכפלת הבעיה
- פרטי הסביבה (`azd env get-values`)
- ציר זמן של תחילת הבעיה

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 מניעת בעיות

### רשימת בדיקות לפני פריסה
```bash
# 1. לאמת אימות
az account show

# 2. לבדוק מכסות והגבלות
az vm list-usage --location eastus2

# 3. לאמת תבניות
az bicep build --file infra/main.bicep

# 4. לבדוק מקומית תחילה
npm run build
npm run test

# 5. להשתמש בפריסות יבשות ניסוי
azd provision --preview
```

### הגדרת ניטור
```bash
# הפעל את Application Insights
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

- [מדריך איתור באגים](debugging.md) - טכניקות מתקדמות לאיתור באגים
- [פריסת משאבים](../chapter-04-infrastructure/provisioning.md) - פתרון תקלות בתשתית
- [תכנון קיבולת](../chapter-06-pre-deployment/capacity-planning.md) - הנחיות לתכנון משאבים
- [בחירת SKU](../chapter-06-pre-deployment/sku-selection.md) - המלצות על שכבת שירות

---

**טיפ**: שמרו מדריך זה כמועדף והיעזרו בו בכל פעם שנתקלים בבעיות. רוב הבעיות כבר נראו בעבר ויש להן פתרונות מוסכמים!

---

**ניווט**
- **שיעור קודם**: [פריסת משאבים](../chapter-04-infrastructure/provisioning.md)
- **שיעור הבא**: [מדריך איתור באגים](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עשויים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור שלו צריך להיחשב כמקור הסמכות. למידע קריטי, מומלץ תרגום מקצועי אנושי. אנו לא אחראים לכל אי-הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->