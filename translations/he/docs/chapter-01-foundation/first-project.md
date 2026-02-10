# הפרויקט הראשון שלך - מדריך מעשי

**ניווט בפרק:**
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [התקנה והגדרה](installation.md)
- **➡️ הבא**: [תצורה](configuration.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח מונחה-בינה](../chapter-02-ai-development/microsoft-foundry-integration.md)

## מבוא

ברוכים הבאים לפרויקט הראשון שלכם עם Azure Developer CLI! מדריך מעשי מקיף זה מספק הדרכה מלאה על יצירה, פריסה וניהול של יישום Full-Stack ב-Azure באמצעות azd. תעבדו עם אפליקציית todo אמיתית הכוללת ממשק React קדמי, שרת API ב-Node.js ומסד נתונים MongoDB.

## יעדי למידה

בסיום המדריך הזה, תוכלו:
- לשלוט בזרימת עבודה של אתחול פרויקט azd בעזרת תבניות
- להבין את מבנה פרויקט ה-Azure Developer CLI וקבצי התצורה
- לבצע פריסה מלאה של היישום ל-Azure כולל פרוביזיונינג של תשתית
- ליישם עדכוני יישום ואסטרטגיות לפריסה מחדש
- לנהל מספר סביבות לפיתוח ו-staging
- ליישם ניקוי משאבים ונוהלי ניהול עלות

## תוצאות למידה

בסיומו של המדריך, תדעו:
- לאתחל ולהגדיר פרויקטי azd מתבניות באופן עצמאי
- לנווט ולשנות מבני פרויקט azd ביעילות
- לפרוס יישומי Full-Stack ל-Azure באמצעות פקודה אחת
- לפתור בעיות פריסה נפוצות ובעיות אימות
- לנהל מספר סביבות Azure בשלבי פריסה שונים
- ליישם זרימות עבודה לפריסה רציפה של עדכוני יישום

## התחלנו

### רשימת דרישות מוקדמות
- ✅ Azure Developer CLI מותקן ([מדריך התקנה](installation.md))
- ✅ Azure CLI מותקן ומאומת
- ✅ Git מותקן במערכת שלך
- ✅ Node.js 16+ (למדריך זה)
- ✅ Visual Studio Code (מומלץ)

### אמת את ההתקנה שלך
```bash
# בדוק את התקנת azd
azd version
```
### אמת את ההתחברות ל-Azure

```bash
az account show
```

### בדוק את גרסת Node.js
```bash
node --version
```

## שלב 1: בחר ואתחל תבנית

נתחיל בתבנית פופולרית של אפליקציית todo שכוללת ממשק React קדמי ושרת API ב-Node.js.

```bash
# עיין בתבניות הזמינות
azd template list

# אתחל את תבנית אפליקציית המטלות
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# עקוב אחר ההנחיות:
# - הזן שם סביבה: "dev"
# - בחר מנוי (אם יש לך יותר מאחד)
# - בחר אזור: "East US 2" (או האזור המועדף עליך)
```

### מה זה עשה עכשיו?
- הוריד את קוד התבנית לתיקיה המקומית שלך
- יצר קובץ `azure.yaml` עם הגדרות השירותים
- הגדר קוד תשתית בתיקיה `infra/`
- יצר קונפיגורציית סביבה

## שלב 2: חקור את מבנה הפרויקט

בוא נבחן מה azd יצר עבורנו:

```bash
# הצג את מבנה הפרויקט
tree /f   # Windows
# או
find . -type f | head -20   # macOS/Linux
```

אתה אמור לראות:
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

**azure.yaml** - הלב של פרויקט ה-azd שלך:
```bash
# הצג את תצורת הפרויקט
cat azure.yaml
```

**infra/main.bicep** - הגדרת תשתית:
```bash
# הצג את קוד התשתית
head -30 infra/main.bicep
```

## שלב 3: התאם אישית את הפרויקט שלך (אופציונלי)

לפני הפריסה, תוכל להתאים אישית את היישום:

### שנה את הממשק הקדמי
```bash
# פתח את רכיב אפליקציית React
code src/web/src/App.tsx
```

בצע שינוי פשוט:
```typescript
// מצא את הכותרת ושנה אותה
<h1>My Awesome Todo App</h1>
```

### הגדר משתני סביבה
```bash
# הגדר משתני סביבה מותאמים אישית
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# הצג את כל משתני הסביבה
azd env get-values
```

## שלב 4: פרוס ל-Azure

ועכשיו לחלק המרגש - פרוס את הכל ל-Azure!

```bash
# פרוס את התשתית ואת היישום
azd up

# פקודה זו תבצע:
# 1. תקצה משאבי Azure (App Service, Cosmos DB, וכו')
# 2. תבנה את היישום שלך
# 3. תפרוס את היישום למשאבים שהוקצו
# 4. תציג את כתובת ה-URL של היישום
```

### מה קורה במהלך הפריסה?

הפקודה `azd up` מבצעת את השלבים האלה:
1. **Provision** (`azd provision`) - יוצר משאבי Azure
2. **Package** - בונה את קוד היישום שלך
3. **Deploy** (`azd deploy`) - מפריס את הקוד למשאבי Azure

### פלט צפוי
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## שלב 5: בדוק את האפליקציה שלך

### גש לאפליקציה שלך
לחץ על ה-URL שסופק בפלט הפריסה, או השג אותו בכל עת:
```bash
# קבל נקודות קצה של היישום
azd show

# פתח את היישום בדפדפן שלך
azd show --output json | jq -r '.services.web.endpoint'
```

### בדוק את אפליקציית המשימות
1. **הוסף פריט למשימות** - לחץ על "הוסף משימה" והקלד משימה
2. **סמן כהושלם** - סמן פריטים שהושלמו
3. **מחק פריטים** - הסר משימות שאינך צריך יותר

### נטר את האפליקציה שלך
```bash
# פתח את פורטל Azure למשאבים שלך
azd monitor

# הצג יומני היישום
azd monitor --logs

# הצג מדדי זמן אמת
azd monitor --live
```

## שלב 6: בצע שינויים ופרוס מחדש

בוא נבצע שינוי ונראה כמה קל לעדכן:

### שנה את ה-API
```bash
# ערוך את קוד ה-API
code src/api/src/routes/lists.js
```

הוסף כותרת תגובה מותאמת:
```javascript
// מצא מטפל בנתיב והוסף:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### פרוס רק את השינויים בקוד
```bash
# פרוס רק את קוד היישום (דלג על התשתית)
azd deploy

# זה מהיר בהרבה מ-'azd up' מכיוון שהתשתית כבר קיימת
```

## שלב 7: נהל מספר סביבות

צור סביבת staging כדי לבדוק שינויים לפני הייצור:

```bash
# צור סביבת סטייג'ינג חדשה
azd env new staging

# פרוס לסביבת סטייג'ינג
azd up

# חזור לסביבת הפיתוח
azd env select dev

# הצג את כל הסביבות
azd env list
```

### השוואת סביבות
```bash
# הצג את סביבת הפיתוח
azd env select dev
azd show

# הצג את סביבת הבמה
azd env select staging
azd show
```

## שלב 8: נקה משאבים

כאשר סיימת להתנסות, נקה משאבים כדי להימנע מחיובים מתמשכים:

```bash
# מחק את כל משאבי Azure עבור הסביבה הנוכחית
azd down

# מחק בכוח ללא אישור ונקה לצמיתות משאבים שנמחקו באופן רך
azd down --force --purge

# מחק סביבה ספציפית
azd env select staging
azd down --force --purge
```

## מה שלמדת

מזל טוב! הצלחת:
- ✅ לאתחל פרויקט azd מתבנית
- ✅ לחקור את מבנה הפרויקט והקבצים המרכזיים
- ✅ לפרוס אפליקציית Full-Stack ל-Azure
- ✅ לבצע שינויים בקוד ולפרוס מחדש
- ✅ לנהל מספר סביבות
- ✅ לנקות משאבים

## 🎯 תרגילי אימות מיומנות

### תרגיל 1: פרוס תבנית שונה (15 דקות)
**מטרה**: להדגים שליטה ב-azd init ובזרימת העבודה של הפריסה

```bash
# נסה את הסטאק של Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# אמת את הפריסה
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# נקה
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] היישום פרוס ללא שגיאות
- [ ] ניתן לגשת ל-URL של היישום בדפדפן
- [ ] היישום מתפקד כראוי (הוספה/הסרה של משימות)
- [ ] ניקית בהצלחה את כל המשאבים

### תרגיל 2: התאם תצורה (20 דקות)
**מטרה**: התאמנות בהגדרת משתני סביבה

```bash
cd my-first-azd-app

# צור סביבה מותאמת אישית
azd env new custom-config

# הגדר משתנים מותאמים אישית
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# אמת את המשתנים
azd env get-values | grep APP_TITLE

# פרוס עם תצורה מותאמת אישית
azd up
```

**קריטריוני הצלחה:**
- [ ] יצירת סביבה מותאמת בהצלחה
- [ ] משתני סביבה הוגדרו ונשמרים
- [ ] היישום פרוס עם התצורה המותאמת
- [ ] ניתן לאמת הגדרות מותאמות באפליקציה המופעלת

### תרגיל 3: זרימת עבודה בסביבות מרובות (25 דקות)
**מטרה**: לשלוט בניהול סביבות ואסטרטגיות פריסה

```bash
# צור סביבת פיתוח
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# רשום את כתובת ה-URL של הפיתוח
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# צור סביבת בדיקה
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# רשום את כתובת ה-URL של סביבת הבדיקה
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# השווה בין הסביבות
azd env list

# בדוק את שתי הסביבות
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# נקה את שתי הסביבות
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] נוצרו שתי סביבות עם קונפיגורציות שונות
- [ ] שתי הסביבות פרוסו בהצלחה
- [ ] ניתן להחליף בין סביבות בעזרת `azd env select`
- [ ] משתני הסביבה שונים בין הסביבות
- [ ] ניקית בהצלחה את שתי הסביבות

## 📊 ההתקדמות שלך

**זמן מושקע**: ~60-90 דקות  
**מיומנויות נרכשות**:
- ✅ אתחול פרויקטים מבוססי תבניות
- ✅ פרוביזיונינג של משאבי Azure
- ✅ זרימות עבודה לפריסת יישומים
- ✅ ניהול סביבות
- ✅ ניהול קונפיגורציה
- ✅ ניקוי משאבים וניהול עלויות

**הרמה הבאה**: אתה מוכן ל[מדריך התצורה](configuration.md) כדי ללמוד דפוסי תצורה מתקדמים!

## פתרון בעיות נפוצות

### שגיאות אימות
```bash
# התחבר מחדש ל-Azure
az login

# וודא גישה למנוי
az account show
```

### כשלי פריסה
```bash
# הפעל רישום דיבוג
export AZD_DEBUG=true
azd up --debug

# הצג יומני היישום ב-Azure
azd monitor --logs

# עבור Container Apps, השתמש ב-Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### קונפליקטים בשמות משאבים
```bash
# השתמש בשם סביבה ייחודי
azd env new dev-$(whoami)-$(date +%s)
```

### בעיות יציאה/רשת
```bash
# בדוק אם היציאות זמינות
netstat -an | grep :3000
netstat -an | grep :3100
```

## השלבים הבאים

עכשיו כשסיימת את הפרויקט הראשון שלך, חקור נושאים מתקדמים אלה:

### 1. התאם את התשתית
- [תשתית כקוד](../chapter-04-infrastructure/provisioning.md)
- [הוספת מסדי נתונים, אחסון ושירותים נוספים](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. הגדר CI/CD
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - זרימות עבודה מלאות ל-CI/CD
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - הגדרת פייפליין

### 3. שיטות עבודה מיטביות לייצור
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - אבטחה, ביצועים וניטור

### 4. חקור תבניות נוספות
```bash
# דפדף בתבניות לפי קטגוריה
azd template list --filter web
azd template list --filter api
azd template list --filter database

# נסה ערכות טכנולוגיות שונות
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## משאבים נוספים

### חומרי לימוד
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [מרכז ארכיטקטורת Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מסגרת ה-Well-Architected של Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### קהילה ותמיכה
- [GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)
- [קהילת מפתחי Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### תבניות ודוגמאות
- [גלריית התבניות הרשמית](https://azure.github.io/awesome-azd/)
- [תבניות קהילתיות](https://github.com/Azure-Samples/azd-templates)
- [דפוסי ארגון](https://github.com/Azure/azure-dev/tree/main/templates)

---

מזל טוב על השלמת פרויקט ה-azd הראשון שלך! עכשיו אתה מוכן לבנות ולפרוס יישומים מדהימים ב-Azure בביטחון.

---

**ניווט בפרק:**
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [התקנה והגדרה](installation.md)
- **➡️ הבא**: [תצורה](configuration.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח מונחה-בינה](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **השיעור הבא**: [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אחריות:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית Co-op Translator (https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לשים לב כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפתו כאל המקור הסמכותי. למידע קריטי מומלץ תרגום מקצועי על ידי מתרגם אנושי. איננו אחראים לכל אי-הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->