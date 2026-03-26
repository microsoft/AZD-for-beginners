# הפרויקט הראשון שלך - מדריך מעשי

**ניווט פרקים:**  
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)  
- **📖 פרק נוכחי**: פרק 1 - יסודות והתחלה מהירה  
- **⬅️ קודם**: [התקנה והגדרה](installation.md)  
- **➡️ הבא**: [קונפיגורציה](configuration.md)  
- **🚀 פרק הבא**: [פרק 2: פיתוח ממוקד ב-AI](../chapter-02-ai-development/microsoft-foundry-integration.md)  

## מבוא

ברוכים הבאים לפרויקט הראשון שלכם עם Azure Developer CLI! מדריך מעשי מקיף זה מספק הסבר מלא של יצירה, פריסה וניהול של אפליקציית Full-Stack על Azure באמצעות azd. תעבדו עם אפליקציית todo אמיתית הכוללת ממשק React, API backend ב-Node.js, ומסד נתונים MongoDB.

## יעדי הלמידה

בסיום המדריך, תוכלו:  
- לשלוט בתהליך אתחול הפרויקט של azd באמצעות תבניות  
- להבין את מבנה פרויקט Azure Developer CLI וקבצי הקונפיגורציה  
- לבצע פריסת אפליקציה שלמה ל-Azure עם יצירת תשתית  
- ליישם עדכוני אפליקציה ואסטרטגיות פריסה מחודשת  
- לנהל סביבות מרובות לפיתוח ובדיקות  
- ליישם ניקוי משאבים וניהול עלויות  

## תוצאות הלמידה

בסיום, תוכלו:  
- לאתחל ולהגדיר פרויקטים של azd מתבניות באופן עצמאי  
- לנווט ולערוך מבני פרויקטים של azd ביעילות  
- לפרוס אפליקציות Full-Stack ל-Azure באמצעות פקודה אחת  
- לפתור בעיות נפוצות בפריסה ובאימות זהות  
- לנהל סביבות Azure מרובות בשלבי פריסה שונים  
- ליישם תהליכי פריסה רציפה לעדכוני אפליקציה  

## התחלת עבודה

### רשימת דרישות מוקדמות  
- ✅ Azure Developer CLI מותקן ([מדריך התקנה](installation.md))  
- ✅ Azure CLI מותקן ומאומת  
- ✅ Git מותקן במערכת שלך  
- ✅ Node.js גרסה 16 ומעלה (למדריך זה)  
- ✅ Visual Studio Code (מומלץ)  

### אימות ההגדרות שלך  
```bash
# בדוק את התקנת azd
azd version
```
### אימות האימות ב-Azure

```bash
az account show
```
  
### בדיקת גרסת Node.js  
```bash
node --version
```
  
## שלב 1: בחר והפעל תבנית

נתחיל עם תבנית אפליקציית todo פופולרית הכוללת ממשק React ו-API backend ב-Node.js.

```bash
# עיינו בתבניות הזמינות
azd template list

# אתחול תבנית אפליקציית המטלות
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# עקבו אחר ההנחיות:
# - הזינו שם סביבה: "dev"
# - בחרו במנוי (אם יש לכם כמה)
# - בחרו באזור: "East US 2" (או האזור המועדף עליכם)
```
  
### מה קרה כרגע?  
- הורדת את קוד התבנית לספרייה המקומית  
- יצרת קובץ `azure.yaml` עם הגדרות השירות  
- הגדרת קוד תשתית בתיקיית `infra/`  
- יצרת קונפיגורציית סביבה  

## שלב 2: בדוק את מבנה הפרויקט

נבדוק מה azd יצר עבורנו:

```bash
# צפה במבנה הפרויקט
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

**azure.yaml** - הלב של פרויקט azd שלך:  
```bash
# הצג את תצורת הפרויקט
cat azure.yaml
```
  
**infra/main.bicep** - הגדרת התשתית:  
```bash
# הצג את קוד התשתית
head -30 infra/main.bicep
```
  
## שלב 3: התאם את הפרויקט שלך (אופציונלי)

לפני הפריסה, אפשר להגוון את האפליקציה:

### ערוך את הממשק הקדמי  
```bash
# פתח את רכיב האפליקציה של React
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
# פרוס תשתית ויישום
azd up

# הפקודה הזו תבצע את הפעולות הבאות:
# 1. תספק משאבי Azure (שירות אפליקציה, Cosmos DB וכו')
# 2. תבנה את היישום שלך
# 3. תפרוס למשאבים שסופקו
# 4. תציג את כתובת ה-URL של היישום
```
  
### מה קורה בזמן הפריסה?

הפקודה `azd up` מבצעת את השלבים הבאים:  
1. **הקצאה** (`azd provision`) - יוצרת משאבי Azure  
2. **חבילה** - בונה את קוד האפליקציה שלך  
3. **פריסה** (`azd deploy`) - מפריסה את הקוד למשאבי Azure  

### הפלט המצופה  
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
לחץ על הקישור בפלט הפריסה, או קבל אותו בכל עת:  
```bash
# לקבל נקודות קצה של היישום
azd show

# פתח את היישום בדפדפן שלך
azd show --output json | jq -r '.services.web.endpoint'
```
  
### בדוק את אפליקציית Todo  
1. **הוסף משימה** - לחץ על "Add Todo" והזן משימה  
2. **סמן כהושלמה** - סמן פריטים שהשלמת  
3. **מחק פריטים** - הסר משימות שאינן נדרשות  

### פקח על האפליקציה שלך  
```bash
# פתח את פורטל Azure למשאבים שלך
azd monitor

# הצג יומני יישומים
azd monitor --logs

# הצג מדדים חיים
azd monitor --live
```
  
## שלב 6: בצע שינויים ופרוס מחדש

בוא נשנה משהו ונראה כמה קל לעדכן:

### ערוך את ה-API  
```bash
# ערוך את קוד ה-API
code src/api/src/routes/lists.js
```
  
הוסף כותרת תגובה מותאמת:  
```javascript
// מצא מנהל נתיב והוסף:
res.header('X-Powered-By', 'Azure Developer CLI');
```
  
### פרוס רק שינויים בקוד  
```bash
# פרוס רק את קוד היישום (דלג על התשתית)
azd deploy

# זה הרבה יותר מהיר מ-'azd up' מכיוון שהתשתית כבר קיימת
```
  
## שלב 7: נהל סביבות מרובות

צור סביבת בדיקות כדי לבדוק שינויים לפני ההפקה:

```bash
# צור סביבת בדיקה חדשה
azd env new staging

# פרוס לסביבת הבדיקה
azd up

# חזור לסביבת הפיתוח
azd env select dev

# רשום את כל הסביבות
azd env list
```
  
### השוואת סביבות  
```bash
# הצגת סביבת הפיתוח
azd env select dev
azd show

# הצגת סביבת הביניים
azd env select staging
azd show
```
  
## שלב 8: נקה משאבים

כאשר סיימת עם הניסויים, נקה כדי למנוע חיובים מתמשכים:

```bash
# מחק את כל המשאבים של Azure עבור הסביבה הנוכחית
azd down

# מחיקה בכוח ללא אישור וניגוב משאבים שנמחקו ברכות
azd down --force --purge

# מחק סביבה ספציפית
azd env select staging
azd down --force --purge
```
  
## אפליקציה קלאסית לעומת אפליקציית AI: אותו תהליך עבודה

רק שהפרסת אפליקציית אינטרנט ופשוטה. אבל מה אם תרצה לפרוס אפליקציית צ'אט מונעת AI - למשל, מבוססת Microsoft Foundry Models?

החדשות הטובות: **תהליך העבודה זהה.**

| שלב | אפליקציית Todo קלאסית | אפליקציית צ'אט AI |  
|------|-------------------------|-------------------|  
| אתחול | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |  
| אימות | `azd auth login` | `azd auth login` |  
| פריסה | `azd up` | `azd up` |  
| פיקוח | `azd monitor` | `azd monitor` |  
| ניקוי | `azd down --force --purge` | `azd down --force --purge` |  

הבדל היחיד הוא **התבנית** שמתחילים ממנה. תבנית AI כוללת תשתית נוספת (כמו משאב Microsoft Foundry Models או אינדקס חיפוש AI), אבל azd מטפל בכל זה עבורך. אינך צריך ללמוד פקודות חדשות, להשתמש בכלים שונים או לשנות את ההבנה שלך לגבי הפריסה.

זה העיקרון המרכזי של azd: **תהליך עבודה אחד, כל עבודה.** הכישורים שלמדת במדריך זה — אתחול, פריסה, פיקוח, פריסה מחודשת וניקוי — חלים באופן שווה על אפליקציות AI וסוכנים.

---

## מה למדת

ברכות! השלמת בהצלחה:  
- ✅ אתחלת פרויקט azd מתבנית  
- ✅ בדקת את מבנה הפרויקט וקבצים מרכזיים  
- ✅ פרסת אפליקציית Full-Stack ל-Azure  
- ✅ בצעת שינויים בקוד ופרסת מחדש  
- ✅ ניהלת סביבות מרובות  
- ✅ ניקית משאבים  

## 🎯 תרגילים לאימות מיומנות

### תרגיל 1: פרוס תבנית שונה (15 דקות)  
**מטרה**: להוכיח שליטה באתחול פרויקט וחווית פריסה ב-azd

```bash
# נסה את סטאק Python + MongoDB
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
- [ ] האפליקציה מפורסמת ללא שגיאות  
- [ ] ניתן לגשת לכתובת האפליקציה בדפדפן  
- [ ] האפליקציה פועלת כראוי (הוספה/הסרה של משימות)  
- [ ] בוצע ניקוי של כל המשאבים בהצלחה  

### תרגיל 2: התאמת קונפיגורציה (20 דקות)  
**מטרה**: לתרגל קונפיגורציית משתני סביבה

```bash
cd my-first-azd-app

# צור סביבה מותאמת אישית
azd env new custom-config

# קבע משתנים מותאמים אישית
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# אמת משתנים
azd env get-values | grep APP_TITLE

# פרוס עם תצורה מותאמת אישית
azd up
```
  
**קריטריוני הצלחה:**  
- [ ] נוצרה סביבת מותאם אישית בהצלחה  
- [ ] משתני הסביבה הוגדרו וניתן להשיגם  
- [ ] האפליקציה מפורסמת עם הגדרות מותאמות  
- [ ] ניתן לאמת את ההגדרות המותאמות באפליקציה הפרוסה  

### תרגיל 3: תהליך עבודה עם מספר סביבות (25 דקות)  
**מטרה**: לשלוט בניהול סביבות ואסטרטגיות פריסה

```bash
# צור סביבת פיתוח
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# רישום כתובת ה-URL של הפיתוח
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# צור סביבת בחינה
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# רישום כתובת ה-URL של הבחינה
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
  
**קריטריוני הצלחה:**  
- [ ] נוצרו שתי סביבות עם הגדרות שונות  
- [ ] שתיהן פרוסו בהצלחה  
- [ ] ניתן לעבור בין הסביבות באמצעות `azd env select`  
- [ ] משתני הסביבה שונים בין הסביבות  
- [ ] בוצע ניקוי מוצלח של שתי הסביבות  

## 📊 ההתקדמות שלך

**זמן מושקע:** ~60-90 דקות  
**מיומנויות נרכשו:**  
- ✅ אתחול פרויקט מתבנית  
- ✅ הקצאת משאבי Azure  
- ✅ תהליכי פריסת אפליקציות  
- ✅ ניהול סביבות  
- ✅ קונפיגורציה וניהול  
- ✅ ניקוי משאבים וניהול עלויות  

**שלב הבא:** אתה מוכן ללמוד [מדריך קונפיגורציה](configuration.md) עם דפוסי קונפיגורציה מתקדמים!  

## פתרון תקלות נפוצות

### שגיאות אימות זהות  
```bash
# אשר מחדש עם Azure
az login

# אמת גישה למנוי
az account show
```
  
### כישלונות בפריסה  
```bash
# הפעלת רישום ניפוי שגיאות
export AZD_DEBUG=true
azd up --debug

# צפה ביומני היישום ב-Azure
azd monitor --logs

# עבור אפליקציות מכולה, השתמש ב-Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```
  
### קונפליקטים בשמות משאבים  
```bash
# השתמש בשם סביבה ייחודי
azd env new dev-$(whoami)-$(date +%s)
```
  
### בעיות פורט/רשת  
```bash
# בדוק אם היציאות זמינות
netstat -an | grep :3000
netstat -an | grep :3100
```
  
## שלבים הבאים

עכשיו כשסיימת את הפרויקט הראשון, גש לנושאים מתקדמים אלו:

### 1. התאמת תשתית  
- [תשתית כקוד](../chapter-04-infrastructure/provisioning.md)  
- [הוספת מסדי נתונים, אחסון ושירותים נוספים](../chapter-04-infrastructure/provisioning.md#adding-services)  

### 2. הקמת CI/CD  
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - תהליכי CI/CD מלאים  
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - קונפיגורציית צינור  

### 3. שיטות עבודה מומלצות בהפקה  
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - אבטחה, ביצועים ופיקוח  

### 4. גש לעוד תבניות  
```bash
# עיין בתבניות לפי קטגוריה
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
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [מסגרת עבודה נכונה ל-Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  

### קהילה ותמיכה  
- [GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)  
- [קהילת מפתחי Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)  
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)  

### תבניות ודוגמאות  
- [גלריית התבניות הרשמית](https://azure.github.io/awesome-azd/)  
- [תבניות קהילתיות](https://github.com/Azure-Samples/azd-templates)  
- [דפוסי ארגונים](https://github.com/Azure/azure-dev/tree/main/templates)  

---

**ברכות על השלמת פרויקט azd הראשון שלך!** עכשיו אתה מוכן לבנות ולפרוס אפליקציות מדהימות ב-Azure בביטחון מלא.

---

**ניווט פרקים:**  
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)  
- **📖 פרק נוכחי**: פרק 1 - יסודות והתחלה מהירה  
- **⬅️ קודם**: [התקנה והגדרה](installation.md)  
- **➡️ הבא**: [קונפיגורציה](configuration.md)  
- **🚀 פרק הבא**: [פרק 2: פיתוח ממוקד ב-AI](../chapter-02-ai-development/microsoft-foundry-integration.md)  
- **השיעור הבא**: [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**אזהרה**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש לזכור כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור שלו הוא המקור המוסמך והמהימן. למידע קריטי, מומלץ תרגום מקצועי על ידי אדם. איננו אחראים לכל אי-הבנה או פרשנות מוטעית הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->