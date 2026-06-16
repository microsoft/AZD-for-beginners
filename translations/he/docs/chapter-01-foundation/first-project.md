# הפרויקט הראשון שלך - מדריך מעשי

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [התקנה והגדרה](installation.md)
- **➡️ הבא**: [קונפיגורציה](configuration.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח ממוקד ב-AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## מבוא

ברוכים הבאים לפרויקט הראשון שלכם עם Azure Developer CLI! מדריך מעשי מקיף זה מספק הדרכה מלאה ליצירה, פריסה וניהול אפליקציה מלאה בערכת Azure באמצעות azd. תעבדו עם אפליקציית todo אמיתית הכוללת ממשק React frontend, backend של Node.js API, ומסד נתונים MongoDB.

## מטרות הלמידה

בסיום מדריך זה:
- תתמקדו בזרימת העבודה לאתחול פרויקט azd באמצעות תבניות
- תבינו את מבנה פרויקט Azure Developer CLI וקבצי ההגדרה
- תבצעו פריסת אפליקציה מלאה ל-Azure כולל הקמת תשתיות
- תיישמו עדכוני אפליקציה ואסטרטגיות לפריסה מחדש
- תנהלו סביבות מרובות לפיתוח ולבדיקות
- תיישמו נהלי ניקוי משאבים וניהול עלויות

## תוצאות הלמידה

בסיום, תוכלו:
- לאתחל ולהגדיר פרויקטי azd מתבניות בעצמכם
- לנווט ולשנות מבני פרויקטים של azd ביעילות
- לפרוס אפליקציות full-stack ל-Azure באמצעות פקודה אחת
- לפתור בעיות שכיחות בפריסה ובעיות אימות
- לנהל סביבות Azure מרובות לשלבים שונים בפריסה
- ליישם זרימות עבודה לפריסה רציפה של עדכוני אפליקציה

## התחלת עבודה

### רשימת דרישות מוקדמות
- ✅ Azure Developer CLI מותקן ([מדריך התקנה](installation.md))
- ✅ אימות AZD הושלם באמצעות `azd auth login`
- ✅ Git מותקן במערכת שלך
- ✅ Node.js 16+ (למדריך זה)
- ✅ Visual Studio Code (מומלץ)

לפני ההמשך, הפעל את מאמת ההגדרות משורש מאגר הקוד:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### אמת את ההתקנה שלך
```bash
# בדוק התקנת azd
azd version

# בדוק אימות AZD
azd auth login --check-status
```

### אמת את אימות Azure CLI האופציונלי

```bash
az account show
```

### בדוק גרסת Node.js
```bash
node --version
```

## שלב 1: בחר ואתחל תבנית

נתחיל בתבנית אפליקציית todo פופולרית הכוללת frontend ב-React ו-backend של Node.js API.

```bash
# דפדף תבניות זמינות
azd template list

# אתחל את תבנית אפליקציית המטלות
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# פעל לפי ההנחיות:
# - הכנס שם סביבה: "dev"
# - בחר מנוי (אם יש לך כמה)
# - בחר אזור: "East US 2" (או האזור המועדף עליך)
```

### מה קרה בדיוק?
- הורדת את קוד התבנית לתיקייה המקומית שלך
- יצרת קובץ `azure.yaml` המכיל הגדרות שירותים
- הגדרת קוד תשתית בתיקיית `infra/`
- יצרת קונפיגורציית סביבה

## שלב 2: חקור את מבנה הפרויקט

בוא נבדוק מה azd יצר עבורנו:

```bash
# הצג את מבנה הפרויקט
tree /f   # חלונות
# או
find . -type f | head -20   # מק/לינוקס
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

**infra/main.bicep** - הגדרת התשתית:
```bash
# הצג את קוד התשתית
head -30 infra/main.bicep
```

## שלב 3: התאמת הפרויקט (אופציונלי)

לפני הפריסה תוכל להתאים את האפליקציה:

### שנה את ה-Frontend
```bash
# פתח את קומפוננטת האפליקציה של React
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

עכשיו לחלק המרגש - פרוס הכל ל-Azure!

```bash
# פריסת תשתית ויישום
azd up

# הפקודה הזו תעשה את הבא:
# 1. תספק משאבי Azure (שירות אפליקציה, Cosmos DB, וכו')
# 2. תוכניס את היישום שלך
# 3. תפרוס למשאבים המסופקים
# 4. תציג את כתובת ה-URL של היישום
```

### מה קורה בזמן הפריסה?

הפקודה `azd up` מבצעת את השלבים הבאים:
1. **הקמה** (`azd provision`) - יוצרת משאבי Azure
2. **אריזה** - בונה את קוד האפליקציה שלך
3. **פריסה** (`azd deploy`) - מפריסה את הקוד למשאבי Azure

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

### גישה לאפליקציה שלך
לחץ על כתובת ה-URL המופיעה בפלט הפריסה, או קבל אותה בכל עת:
```bash
# קבל נקודות קצה של היישום
azd show

# פתח את היישום בדפדפן שלך
azd show --output json | jq -r '.services.web.endpoint'
```

### בדוק את אפליקציית Todo
1. **הוסף פריט todo** - לחץ על "Add Todo" והכנס משימה
2. **סמן כהושלם** - סמן פריטים שהושלמו
3. **מחק פריטים** - הסר תזכורות שאינך צריך יותר

### נטר את האפליקציה שלך
```bash
# פתח את פורטל Azure עבור המשאבים שלך
azd monitor

# הצג יומני אפליקציה
azd monitor --logs

# הצג מדדים חיים
azd monitor --live
```

### ✅ אמת את הפריסה שלך

לפני שממשיכים, רוץ דרך רשימת בדיקות מהירה כדי לוודא שהכל עובד באמת—אל תסמוך על "פריסה הצליחה" כמשמעות "האפלקיציה עובדת":

```bash
# 1. אשר שהנקודה הסופית קיימת ונגישה
azd show

# 2. בצע בדיקת עישון לנקודה הסופית (מצפה ל-HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. בדוק את נקודת הבריאות אם האפליקציה שלך חושפת אחת
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**הפריסה אושרה כאשר:**
- ✅ `azd show` מציג כתובת URL נגישה
- ✅ ה-URL נפתח בדפדפן ללא שגיאות
- ✅ הפונקציות המרכזיות עובדים (הוספה/סיום/מחיקה של todo)
- ✅ `azd monitor --logs` מראה בקשות שמגיעות ללא שגיאות בלתי צפויות

אם משהו נכשל, עבור אל [פרק 7: פתרון בעיות](../chapter-07-troubleshooting/README.md).

## שלב 6: בצע שינויים ופרוס מחדש

נעשה שינוי ונראה כמה קל לעדכן:

### שנה את ה-API
```bash
# ערוך את קוד ה-API
code src/api/src/routes/lists.js
```

הוסף כותרת תגובה מותאמת אישית:
```javascript
// מצא מטפל בנתיב והוסף:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### פרוס רק את שינויים בקוד
```bash
# פרוס רק את קוד היישום (דלג על התשתית)
azd deploy

# זה הרבה יותר מהיר מ-'azd up' מכיוון שהתשתית כבר קיימת
```

## שלב 7: נהל סביבות מרובות

צור סביבה לבדיקות כדי לבדוק שינויים לפני הייצור:

```bash
# צור סביבה חדשה לבדיקות
azd env new staging

# פרוס לסביבת הבדיקות
azd up

# חזור לסביבת הפיתוח
azd env select dev

# רשום את כל הסביבות
azd env list
```

### השוואת סביבות
```bash
# הצג סביבה לפיתוח
azd env select dev
azd show

# הצג סביבה לניסויים
azd env select staging
azd show
```

## שלב 8: נקה משאבים

כשסיימת להתנסות, נקה כדי להימנע מחיובים שוטפים:

```bash
# מחק את כל המשאבים ב-Azure עבור הסביבה הנוכחית
azd down

# מחיקה בכוח ללא אישור וניקוי משאבים שנמחקו בריכוך
azd down --force --purge

# מחק סביבה ספציפית
azd env select staging
azd down --force --purge
```

## אפליקציה קלאסית מול אפליקציית AI: אותה זרימת עבודה

רק עכשיו פרסת אפליקציית ווב מסורתית. אבל מה אם רצית לפרוס אפליקציית צ׳אט המופעלת על AI - למשל, צ׳אט שמגובה במודלים של Microsoft Foundry?

החדשות הטובות: **זרימת העבודה זהה.**

| שלב | אפליקציית Todo קלאסית | אפליקציית צ'אט AI |
|------|-----------------|-------------|
| אתחול | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| אימות | `azd auth login` | `azd auth login` |
| פריסה | `azd up` | `azd up` |
| ניטור | `azd monitor` | `azd monitor` |
| ניקוי | `azd down --force --purge` | `azd down --force --purge` |

ההבדל היחיד הוא **התבנית** שמתחילים ממנה. תבנית AI כוללת תשתיות נוספות (כגון משאב Microsoft Foundry Models או אינדקס חיפוש AI), אך azd מטפל בכל זה בשבילך. אינך צריך ללמוד פקודות חדשות, להשתמש בכלי אחר, או לשנות את דרך החשיבה שלך על הפריסה.

זה העיקרון המרכזי של azd: **זרימת עבודה אחת, כל עומס עבודה.** הכישורים שהלמדת במדריך זה—אתחול, פריסה, ניטור, פריסה מחדש, וניקוי—חלים באותה מידה על אפליקציות וסוכני AI.

---

## מה שלמדת

מזל טוב! השלמת בהצלחה:
- ✅ אתחלת פרויקט azd מתבנית
- ✅ חקרת את מבנה הפרויקט והקבצים המרכזיים
- ✅ פרסת אפליקציה מלאה ל-Azure
- ✅ ביצעת שינויים בקוד ופרסת מחדש
- ✅ ניהלת סביבות מרובות
- ✅ ניקית משאבים

## 🎯 תרגילי אימות כישורים

### תרגיל 1: פרוס תבנית שונה (15 דקות)
**מטרה**: להראות שליטה בזרימת עבודה של `azd init` ושל פריסה

```bash
# נסה את סטאק פייתון + MongoDB
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
- [ ] האפליקציה פרוסה ללא שגיאות
- [ ] יש גישה ל-URL של האפליקציה בדפדפן
- [ ] האפליקציה פועלת כראוי (הוספה/הסרה של TODOs)
- [ ] כל המשאבים נוקו בהצלחה

### תרגיל 2: התאמת קונפיגורציה (20 דקות)
**מטרה**: תרגול קונפיגורציית משתני סביבה

```bash
cd my-first-azd-app

# צור סביבה מותאמת אישית
azd env new custom-config

# הגדר משתנים מותאמים אישית
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# בדוק משתנים
azd env get-values | grep APP_TITLE

# פרוס עם תצורת מותאם אישית
azd up
```

**קריטריוני הצלחה:**
- [ ] סביבה מותאמת אישית נוצרה בהצלחה
- [ ] משתני סביבה נקבעו וניתנים לשליפה
- [ ] האפליקציה פרוסה עם קונפיגורציה מותאמת
- [ ] ניתן לאמת הגדרות מותאמות באפליקציה המופרסת

### תרגיל 3: זרימת עבודה בסביבות מרובות (25 דקות)
**מטרה**: שליטה בניהול סביבות ואסטרטגיות פריסה

```bash
# צור סביבת פיתוח
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ציין את כתובת ה-URL של הפיתוח
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# צור סביבת הביניים
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# ציין את כתובת ה-URL של הביניים
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
- [ ] ניתן לעבור בין סביבות באמצעות `azd env select`
- [ ] משתני הסביבה שונים בין הסביבות
- [ ] שתי הסביבות נוקו בהצלחה

## 📊 ההתקדמות שלך

**זמן מושקע**: ~60-90 דקות  
**כישורים נרכשו**:
- ✅ אתחול פרוייקטים מתבניות
- ✅ הקמת משאבים ב-Azure
- ✅ זרימות עבודה לפריסת אפליקציות
- ✅ ניהול סביבות
- ✅ ניהול קונפיגורציה
- ✅ ניקוי משאבים וניהול עלויות

**הרמה הבאה**: אתה מוכן ל-[מדריך קונפיגורציה](configuration.md) ללמוד דפוסי קונפיגורציה מתקדמים!

## פתרון בעיות נפוצות

### שגיאות אימות
```bash
# אמת מחדש עם Azure
az login

# אמת גישה למנוי
az account show
```

### כשלי פריסה
```bash
# הפעל רישום תיקון באגים
export AZD_DEBUG=true
azd up --debug

# הצג יומני יישום ב-Azure
azd monitor --logs

# עבור אפליקציות מכולה, השתמש ב-Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### קונפליקטים בשם משאבים
```bash
# השתמש בשם סביבה ייחודי
azd env new dev-$(whoami)-$(date +%s)
```

### בעיות פורטים/רשת
```bash
# בדוק אם הפורטים זמינים
netstat -an | grep :3000
netstat -an | grep :3100
```

## השלבים הבאים

כעת שסיימת את הפרויקט הראשון שלך, חקור את הנושאים המתקדמים הבאים:

### 1. התאמת תשתית
- [תשתית כקוד](../chapter-04-infrastructure/provisioning.md)
- [הוספת מסדי נתונים, אחסון ושירותים נוספים](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. הקמת CI/CD
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - זרימות עבודה של CI/CD מלאות
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - קונפיגורציית צינורות פריסה

### 3. שיטות עבודה מומלצות בייצור
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - אבטחה, ביצועים וניטור

### 4. חקור תבניות נוספות
```bash
# דפדף בתבניות לפי קטגוריה
azd template list --filter web
azd template list --filter api
azd template list --filter database

# נסה ערכות טכנולוגיה שונות
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## משאבים נוספים

### חומרי למידה
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [מרכז ארכיטקטורת Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מסגרת עבודה Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### קהילה ותמיכה
- [GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)
- [קהילת Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### תבניות ודוגמאות
- [גלריית תבניות רשמית](https://azure.github.io/awesome-azd/)
- [תבניות קהילתיות](https://github.com/Azure-Samples/azd-templates)
- [דפוסי ארגונים](https://github.com/Azure/azure-dev/tree/main/templates)

---

**מזל טוב על השלמת פרויקט ה-azd הראשון שלך!** עכשיו אתה מוכן לבנות ולפרוס אפליקציות מדהימות ב-Azure בביטחון.

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [התקנה והגדרה](installation.md)
- **➡️ הבא**: [הבא את האפליקציה שלך](bring-your-own-app.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח ממוקד ב-AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->