# הפרויקט הראשון שלך - מדריך מעשי

**ניווט פרקים:**
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ קודם**: [התקנה והגדרות](installation.md)
- **➡️ הבא**: [תצורה](configuration.md)
- **🚀 פרק הבא**: [פרק 2: פיתוח מבוסס AI](../microsoft-foundry/microsoft-foundry-integration.md)

## מבוא

ברוכים הבאים לפרויקט הראשון שלכם עם Azure Developer CLI! מדריך מעשי זה מספק הסבר מלא על יצירה, פריסה וניהול של אפליקציה מלאה ב-Azure באמצעות azd. תעבדו עם אפליקציית משימות אמיתית הכוללת ממשק קדמי React, ממשק אחורי Node.js, ובסיס נתונים MongoDB.

## מטרות למידה

בסיום המדריך, תלמדו:
- לשלוט בתהליך אתחול פרויקט azd באמצעות תבניות
- להבין את מבנה הפרויקט וקבצי התצורה של Azure Developer CLI
- לבצע פריסה מלאה של אפליקציה ל-Azure כולל הקמת תשתיות
- ליישם עדכונים לאפליקציה ואסטרטגיות לפריסה מחדש
- לנהל סביבות מרובות לפיתוח ולבדיקות
- ליישם שיטות לניקוי משאבים וניהול עלויות

## תוצאות למידה

בסיום, תוכלו:
- לאתחל ולהגדיר פרויקטים של azd מתבניות באופן עצמאי
- לנווט ולשנות מבני פרויקטים של azd בצורה יעילה
- לפרוס אפליקציות מלאות ל-Azure באמצעות פקודות בודדות
- לפתור בעיות פריסה נפוצות ובעיות אימות
- לנהל סביבות Azure מרובות לשלבי פריסה שונים
- ליישם תהליכי פריסה מתמשכת לעדכוני אפליקציה

## התחלת העבודה

### רשימת דרישות מוקדמות
- ✅ Azure Developer CLI מותקן ([מדריך התקנה](installation.md))
- ✅ Azure CLI מותקן ומאומת
- ✅ Git מותקן במערכת שלכם
- ✅ Node.js 16+ (למדריך זה)
- ✅ Visual Studio Code (מומלץ)

### בדיקת ההגדרות שלכם
```bash
# בדוק התקנת azd
azd version
```
### בדיקת אימות Azure

```bash
az account show
```

### בדיקת גרסת Node.js
```bash
node --version
```

## שלב 1: בחירת תבנית ואתחול

נתחיל עם תבנית פופולרית של אפליקציית משימות הכוללת ממשק קדמי React וממשק אחורי Node.js.

```bash
# עיין בתבניות זמינות
azd template list

# אתחל את תבנית אפליקציית המשימות
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# עקוב אחר ההנחיות:
# - הזן שם סביבה: "dev"
# - בחר מנוי (אם יש לך מספר מנויים)
# - בחר אזור: "East US 2" (או האזור המועדף עליך)
```

### מה קרה עכשיו?
- הורדתם את קוד התבנית לספרייה המקומית שלכם
- נוצר קובץ `azure.yaml` עם הגדרות שירות
- הוקם קוד תשתית בספריית `infra/`
- נוצרה תצורת סביבה

## שלב 2: חקר מבנה הפרויקט

בואו נבחן מה azd יצר עבורנו:

```bash
# הצג את מבנה הפרויקט
tree /f   # חלונות
# או
find . -type f | head -20   # macOS/לינוקס
```

אתם אמורים לראות:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### קבצים מרכזיים להבנה

**azure.yaml** - הלב של פרויקט azd שלכם:
```bash
# הצג את תצורת הפרויקט
cat azure.yaml
```

**infra/main.bicep** - הגדרת תשתית:
```bash
# צפה בקוד התשתית
head -30 infra/main.bicep
```

## שלב 3: התאמת הפרויקט (אופציונלי)

לפני הפריסה, תוכלו להתאים את האפליקציה:

### שינוי הממשק הקדמי
```bash
# פתח את רכיב האפליקציה של React
code src/web/src/App.tsx
```

בצעו שינוי פשוט:
```typescript
// מצא את הכותרת ושנה אותה
<h1>My Awesome Todo App</h1>
```

### הגדרת משתני סביבה
```bash
# הגדר משתני סביבה מותאמים אישית
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# הצג את כל משתני הסביבה
azd env get-values
```

## שלב 4: פריסה ל-Azure

עכשיו החלק המרגש - פרסו הכל ל-Azure!

```bash
# פריסת תשתית ויישום
azd up

# פקודה זו תבצע:
# 1. הקצאת משאבי Azure (App Service, Cosmos DB, וכו')
# 2. בניית היישום שלך
# 3. פריסה למשאבים שהוקצו
# 4. הצגת כתובת ה-URL של היישום
```

### מה קורה במהלך הפריסה?

פקודת `azd up` מבצעת את השלבים הבאים:
1. **הקמה** (`azd provision`) - יוצרת משאבי Azure
2. **אריזה** - בונה את קוד האפליקציה שלכם
3. **פריסה** (`azd deploy`) - מפרסת את הקוד למשאבי Azure

### פלט צפוי
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## שלב 5: בדיקת האפליקציה שלכם

### גישה לאפליקציה שלכם
לחצו על כתובת ה-URL שסופקה בפלט הפריסה, או קבלו אותה בכל זמן:
```bash
# קבל נקודות קצה של היישום
azd show

# פתח את היישום בדפדפן שלך
azd show --output json | jq -r '.services.web.endpoint'
```

### בדיקת אפליקציית המשימות
1. **הוספת משימה** - לחצו על "Add Todo" והכניסו משימה
2. **סימון כהושלם** - סמנו משימות שהושלמו
3. **מחיקת משימות** - הסירו משימות שאינן נחוצות יותר

### ניטור האפליקציה שלכם
```bash
# פתח את פורטל Azure עבור המשאבים שלך
azd monitor

# הצג יומני יישום
azd logs
```

## שלב 6: ביצוע שינויים ופריסה מחדש

בואו נעשה שינוי ונראה כמה קל לעדכן:

### שינוי הממשק האחורי
```bash
# ערוך את קוד ה-API
code src/api/src/routes/lists.js
```

הוסיפו כותרת תגובה מותאמת אישית:
```javascript
// מצא מטפל נתיב והוסף:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### פריסה רק של שינויים בקוד
```bash
# פרס רק את קוד היישום (דלג על תשתית)
azd deploy

# זה הרבה יותר מהיר מ-'azd up' מכיוון שהתשתית כבר קיימת
```

## שלב 7: ניהול סביבות מרובות

צרו סביבה לבדיקות לפני פריסה לייצור:

```bash
# צור סביבת בדיקה חדשה
azd env new staging

# פרוס לסביבת בדיקה
azd up

# חזור לסביבת פיתוח
azd env select dev

# רשום את כל הסביבות
azd env list
```

### השוואת סביבות
```bash
# הצג סביבת פיתוח
azd env select dev
azd show

# הצג סביבת בדיקה
azd env select staging
azd show
```

## שלב 8: ניקוי משאבים

כשסיימתם להתנסות, נקו את המשאבים כדי להימנע מחיובים מתמשכים:

```bash
# מחק את כל משאבי Azure עבור הסביבה הנוכחית
azd down

# מחיקה בכפייה ללא אישור וטיהור משאבים שנמחקו באופן רך
azd down --force --purge

# מחק סביבה ספציפית
azd env select staging
azd down --force --purge
```

## מה למדתם

ברכות! הצלחתם:
- ✅ לאתחל פרויקט azd מתבנית
- ✅ לחקור את מבנה הפרויקט והקבצים המרכזיים
- ✅ לפרוס אפליקציה מלאה ל-Azure
- ✅ לבצע שינויים בקוד ולפרוס מחדש
- ✅ לנהל סביבות מרובות
- ✅ לנקות משאבים

## 🎯 תרגילי אימות מיומנויות

### תרגיל 1: פריסת תבנית אחרת (15 דקות)
**מטרה**: להדגים שליטה בתהליך אתחול ופריסה של azd

```bash
# נסה את מחסנית Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# אמת את הפריסה
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# נקה
azd down --force --purge
```

**קריטריונים להצלחה:**
- [ ] האפליקציה נפרסת ללא שגיאות
- [ ] ניתן לגשת לכתובת ה-URL של האפליקציה בדפדפן
- [ ] האפליקציה פועלת כראוי (הוספה/הסרה של משימות)
- [ ] ניקוי כל המשאבים בוצע בהצלחה

### תרגיל 2: התאמת תצורה (20 דקות)
**מטרה**: תרגול הגדרת משתני סביבה

```bash
cd my-first-azd-app

# צור סביבה מותאמת אישית
azd env new custom-config

# הגדר משתנים מותאמים אישית
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# אמת משתנים
azd env get-values | grep APP_TITLE

# פרוס עם תצורה מותאמת אישית
azd up
```

**קריטריונים להצלחה:**
- [ ] סביבה מותאמת אישית נוצרה בהצלחה
- [ ] משתני סביבה הוגדרו וניתנים לשליפה
- [ ] האפליקציה נפרסת עם תצורה מותאמת אישית
- [ ] ניתן לאמת הגדרות מותאמות באפליקציה שפורסה

### תרגיל 3: תהליך עבודה עם סביבות מרובות (25 דקות)
**מטרה**: שליטה בניהול סביבות ואסטרטגיות פריסה

```bash
# צור סביבת פיתוח
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# רשום כתובת URL של פיתוח
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# צור סביבת בדיקות
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# רשום כתובת URL של בדיקות
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# השווה בין הסביבות
azd env list

# בדוק את שתי הסביבות
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# נקה את שתיהן
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**קריטריונים להצלחה:**
- [ ] שתי סביבות נוצרו עם תצורות שונות
- [ ] שתי הסביבות נפרסו בהצלחה
- [ ] ניתן לעבור בין סביבות באמצעות `azd env select`
- [ ] משתני סביבה שונים בין הסביבות
- [ ] ניקוי שתי הסביבות בוצע בהצלחה

## 📊 ההתקדמות שלכם

**זמן השקעה**: ~60-90 דקות  
**מיומנויות נרכשות**:
- ✅ אתחול פרויקט מבוסס תבנית
- ✅ הקמת משאבי Azure
- ✅ תהליכי פריסת אפליקציה
- ✅ ניהול סביבות
- ✅ ניהול תצורה
- ✅ ניקוי משאבים וניהול עלויות

**הרמה הבאה**: אתם מוכנים ל-[מדריך תצורה](configuration.md) ללמוד דפוסי תצורה מתקדמים!

## פתרון בעיות נפוצות

### שגיאות אימות
```bash
# אימות מחדש עם Azure
az login

# אימות גישה למנוי
az account show
```

### כשלי פריסה
```bash
# הפעל רישום באגים
export AZD_DEBUG=true
azd up --debug

# הצג יומנים מפורטים
azd logs --service api
azd logs --service web
```

### קונפליקטים בשמות משאבים
```bash
# השתמש בשם סביבה ייחודי
azd env new dev-$(whoami)-$(date +%s)
```

### בעיות פורט/רשת
```bash
# בדוק אם פורטים זמינים
netstat -an | grep :3000
netstat -an | grep :3100
```

## צעדים הבאים

עכשיו כשסיימתם את הפרויקט הראשון שלכם, חקרו את הנושאים המתקדמים הבאים:

### 1. התאמת תשתית
- [תשתית כקוד](../deployment/provisioning.md)
- [הוספת בסיסי נתונים, אחסון ושירותים נוספים](../deployment/provisioning.md#adding-services)

### 2. הגדרת CI/CD
- [אינטגרציה עם GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. שיטות עבודה מומלצות לייצור
- [הגדרות אבטחה](../deployment/best-practices.md#security)
- [אופטימיזציה לביצועים](../deployment/best-practices.md#performance)
- [ניטור ורישום](../deployment/best-practices.md#monitoring)

### 4. חקר תבניות נוספות
```bash
# עיין בתבניות לפי קטגוריה
azd template list --filter web
azd template list --filter api
azd template list --filter database

# נסה ערימות טכנולוגיה שונות
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## משאבים נוספים

### חומרי לימוד
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מסגרת Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### קהילה ותמיכה
- [GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)
- [קהילת Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### תבניות ודוגמאות
- [גלריית התבניות הרשמית](https://azure.github.io/awesome-azd/)
- [תבניות קהילתיות](https://github.com/Azure-Samples/azd-templates)
- [דפוסים ארגוניים](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ברכות על סיום הפרויקט הראשון שלכם עם azd!** עכשיו אתם מוכנים לבנות ולפרוס אפליקציות מדהימות ב-Azure בביטחון.

---

**ניווט פרקים:**
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ קודם**: [התקנה והגדרות](installation.md)
- **➡️ הבא**: [תצורה](configuration.md)
- **🚀 פרק הבא**: [פרק 2: פיתוח מבוסס AI](../microsoft-foundry/microsoft-foundry-integration.md)
- **שיעור הבא**: [מדריך פריסה](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->