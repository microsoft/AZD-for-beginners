# הפרויקט הראשון שלך - הדרכה מעשית

**ניווט בפרקים:**  
- **📚 דף הקורס הראשי**: [AZD למתחילים](../../README.md)  
- **📖 פרק נוכחי**: פרק 1 - יסודות והתחלה מהירה  
- **⬅️ קודם**: [התקנה והגדרה](installation.md)  
- **➡️ הבא**: [תצורה](configuration.md)  
- **🚀 פרק הבא**: [פרק 2: פיתוח מונחה AI](../chapter-02-ai-development/microsoft-foundry-integration.md)  

## מבוא

ברוכים הבאים לפרויקט הראשון שלכם עם Azure Developer CLI! הדרכה מעשית ומקיפה זו מציעה מעבר מלא של יצירה, פריסה וניהול של אפליקציה מלאת-סטאק על Azure באמצעות azd. תעבדו עם אפליקציית משימות אמיתית הכוללת ממשק React, backend API ב-Node.js, ומסד נתונים MongoDB.

## מטרות הלמידה

בסיום ההדרכה תוכל:  
- לשלוט בתהליך אתחול פרויקט azd באמצעות תבניות  
- להבין את מבנה הפרויקט וקבצי התצורה של Azure Developer CLI  
- לבצע פריסה מלאה של האפליקציה ל-Azure עם אספקת תשתיות  
- ליישם עדכוני אפליקציה ואסטרטגיות פריסה מחודשת  
- לנהל סביבות מרובות לפיתוח ולטסטינג  
- להחיל נוהלי ניקוי משאבים וניהול עלויות  

## תוצאות למידה

בסיום, תהיה מסוגל:  
- לאתחל ולהגדיר פרויקטים של azd מתבניות באופן עצמאי  
- לנווט ולשנות מבני פרויקט azd ביעילות  
- לפרוס אפליקציות מלאות-סטאק ל-Azure באמצעות פקודות בודדות  
- לפתור בעיות נפוצות בפריסה ובאימות  
- לנהל סביבות Azure מרובות בשלבי פריסה שונים  
- להפעיל תהליכי פריסה רציפה לעדכוני אפליקציה  

## התחלת עבודה

### רשימת בדיקה לפני התחלה  
- ✅ התקנת Azure Developer CLI ([מדריך התקנה](installation.md))  
- ✅ השלמת אימות AZD עם `azd auth login`  
- ✅ התקנת Git במערכת שלך  
- ✅ Node.js 16+ (להדרכה זו)  
- ✅ Visual Studio Code (מומלץ)  

לפני ההמשך, הפעל את בודק ההתקנה מתיקיית השורש של המאגר:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### אימות ההתקנה שלך  
```bash
# בדוק התקנת azd
azd version

# בדוק אימות AZD
azd auth login --check-status
```
  
### אימות אופציונלי של Azure CLI  
```bash
az account show
```
  
### בדוק את גרסת Node.js  
```bash
node --version
```
  
## שלב 1: בחר ואתחל תבנית

נתחיל בתבנית פופולרית של אפליקציית todo הכוללת frontend React ו-backend Node.js API.

```bash
# דפדף בתבניות הזמינות
azd template list

# אתחל את תבנית אפליקציית המשימות
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# עקוב אחר ההנחיות:
# - הזן שם סביבה: "dev"
# - בחר מנוי (אם יש לך כמה)
# - בחר אזור: "East US 2" (או האזור המועדף עליך)
```
  
### מה זה עכשיו?  
- הורדת קוד התבנית לתיקייה המקומית שלך  
- יצירת קובץ `azure.yaml` עם הגדרות השירותים  
- הגדרת קוד התשתית בתיקיית `infra/`  
- יצירת תצורת סביבה  

## שלב 2: סקור את מבנה הפרויקט

נבחן מה azd יצר עבורנו:

```bash
# הצג את מבנה הפרויקט
tree /f   # חלונות
# או
find . -type f | head -20   # מק או לינוקס
```
  
עליך לראות:  
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
# צפה בקוד התשתית
head -30 infra/main.bicep
```
  
## שלב 3: התאמת הפרויקט (אופציונלי)

לפני הפריסה, ניתן להתאים את האפליקציה:

### שינוי ה-Frontend  
```bash
# פתח את רכיב האפליקציה של React
code src/web/src/App.tsx
```
  
בצע שינוי פשוט:  
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
  
## שלב 4: פרוס ל-Azure

עכשיו לחלק המרגש - פרוש הכל ל-Azure!

```bash
# לפרוס תשתית ויישום
azd up

# פקודה זו תעשה את הדברים הבאים:
# 1. להקצות משאבי Azure (App Service, Cosmos DB, וכו')
# 2. לבנות את היישום שלך
# 3. לפרוס אל המשאבים שהוקצו
# 4. להציג את כתובת ה-URL של היישום
```
  
### מה קורה במהלך הפריסה?

הפקודה `azd up` מבצעת את השלבים הבאים:  
1. **פרוביז'ן** (`azd provision`) - יצירת משאבים ב-Azure  
2. **חבילה** - בניית קוד האפליקציה שלך  
3. **פריסה** (`azd deploy`) - פריסת הקוד למשאבים  

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
לחץ על כתובת ה-URL שמופיעה בתוצאת הפריסה, או קבל אותה בכל עת:  
```bash
# לקבל נקודות קצה של האפליקציה
azd show

# לפתוח את האפליקציה בדפדפן שלך
azd show --output json | jq -r '.services.web.endpoint'
```
  
### בדוק את אפליקציית ה-Todo  
1. **הוסף משימה** - לחץ על "Add Todo" והזן משימה  
2. **סמן כהושלם** - סמן משימות שהושלמו  
3. **מחק משימות** - הסר משימות שכבר אינן דרושות  

### פקח על האפליקציה שלך  
```bash
# פתח את פורטל Azure עבור המשאבים שלך
azd monitor

# הצג יומני יישומים
azd monitor --logs

# הצג מדדים חיים
azd monitor --live
```
  
## שלב 6: בצע שינויים ופרוס מחדש

נבצע שינוי ונראה כמה קל לעדכן:

### שינוי ה-API  
```bash
# לערוך את קוד ה-API
code src/api/src/routes/lists.js
```
  
הוסף כותרת תגובה מותאמת:  
```javascript
// מצא מטפל נתיב והוסף:
res.header('X-Powered-By', 'Azure Developer CLI');
```
  
### פרוס רק את שינויי הקוד  
```bash
# לפרוס רק את קוד היישום (דלג על תשתית)
azd deploy

# זה הרבה יותר מהיר מ-'azd up' מכיוון שהתשתית כבר קיימת
```
  
## שלב 7: ניהול סביבות מרובות

צור סביבה לשלב הטסטינג כדי לבדוק שינויים לפני הפקה:

```bash
# צור סביבה חדשה לבדיקות
azd env new staging

# פרוס לסביבת הבדיקות
azd up

# חזור לסביבת הפיתוח
azd env select dev

# הצג את כל הסביבות
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
  
## שלב 8: ניקיון משאבים

כשתסיים להתנסות, נקה את המשאבים כדי למנוע חיובים מתמשכים:

```bash
# מחק את כל המשאבים של Azure עבור הסביבה הנוכחית
azd down

# מחיקה בכח ללא אישור וניקוי משאבים שנמחקו באופן רך
azd down --force --purge

# מחק סביבה ספציפית
azd env select staging
azd down --force --purge
```
  
## אפליקציה קלאסית מול אפליקציית AI: אותו תהליך עבודה

פרסת זה עתה אפליקציית רשת מסורתית. אבל מה אם תרצה לפרוס אפליקציית שיחה מונחית AI, למשל, בחסות Microsoft Foundry Models?

החדשות הטובות: **התהליך זהה.**

| שלב | אפליקציית Todo קלאסית | אפליקציית שיחה מבוססת AI |
|------|-----------------|--------------|
| אתחול | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| אימות | `azd auth login` | `azd auth login` |
| פריסה | `azd up` | `azd up` |
| ניטור | `azd monitor` | `azd monitor` |
| ניקוי | `azd down --force --purge` | `azd down --force --purge` |

ההבדל היחיד הוא התבנית שממנה אתה מתחיל. תבנית AI כוללת תשתית נוספת (כגון משאב Microsoft Foundry Models או אינדקס AI Search), אך azd מטפל בכל זה עבורך. אין צורך ללמוד פקודות חדשות, לאמץ כלי שונה, או לשנות איך אתה חושב על הפריסה.

זו העיקרון המרכזי של azd: **תהליך עבודה אחד, כל עומס עבודה.** הכישורים שלמדת בהדרכה זו — אתחול, פריסה, ניטור, פריסה חוזרת וניקוי — חלים באותה מידה על אפליקציות וסוכני AI.

---

## מה למדת

מזל טוב! השלמת בהצלחה:  
- ✅ אתחול פרויקט azd מתבנית  
- ✅ סקר מבנה הפרויקט וקבצים מרכזיים  
- ✅ פריסת אפליקציה מלאת-סטאק ל-Azure  
- ✅ ביצוע שינויים בקוד ופריסת עדכונים  
- ✅ ניהול סביבות מרובות  
- ✅ ניקוי משאבים  

## 🎯 תרגילי تحقق מיומנות

### תרגיל 1: פרוס תבנית שונה (15 דקות)  
**מטרה**: להראות שליטה בתהליך אתחול ופריסת azd  

```bash
# נסה את הסטק Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# אמת פריסה
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# נקוי
azd down --force --purge
```
  
**קריטריוני הצלחה:**  
- [ ] האפליקציה פרוסה ללא שגיאות  
- [ ] ניתן לגשת לכתובת האפליקציה בדפדפן  
- [ ] האפליקציה פועלת כראוי (הוספה/הסרה של משימות)  
- [ ] כל המשאבים נמחקו בהצלחה  

### תרגיל 2: התאם תצורה (20 דקות)  
**מטרה**: לתרגל הקמת משתני סביבה  

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
- [ ] סביבה מותאמת נוצרה בהצלחה  
- [ ] משתני הסביבה מוגדרים וניתנים לשליפה  
- [ ] האפליקציה פרוסה עם תצורה מותאמת  
- [ ] ניתן לאמת הגדרות מותאמות באפליקציה הפרוסה  

### תרגיל 3: תהליך עבודה בסביבות מרובות (25 דקות)  
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

# רשום את כתובת ה-URL של הבדיקה
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
- [ ] נוצרו שתי סביבות עם תצורות שונות  
- [ ] שתיהן פרוסו בהצלחה  
- [ ] ניתן להתחלף בין סביבות באמצעות `azd env select`  
- [ ] משתני הסביבה שונים בין הסביבות  
- [ ] שתי הסביבות נקו בהצלחה  

## 📊 ההתקדמות שלך

**זמן מושקע**: כ-60-90 דקות  
**כישורים נרכשים**:  
- ✅ אתחול פרויקטים על בסיס תבניות  
- ✅ אספקת משאבים ל-Azure  
- ✅ תהליכי פריסת אפליקציות  
- ✅ ניהול סביבות  
- ✅ ניהול תצורה  
- ✅ ניקוי משאבים וניהול עלויות  

**השלב הבא**: אתה מוכן ל[מדריך תצורה](configuration.md) ללמוד דפוסי תצורה מתקדמים!

## פתרון בעיות נפוצות

### שגיאות אימות  
```bash
# אימות מחדש עם Azure
az login

# אימות גישה למנוי
az account show
```
  
### כישלונות פריסה  
```bash
# אפשר רישום איתור תקלות
export AZD_DEBUG=true
azd up --debug

# הצג יומני יישום ב-Azure
azd monitor --logs

# עבור אפליקציות מכולות, השתמש ב-Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```
  
### קונפליקטים בשמות משאבים  
```bash
# השתמש בשם סביבה ייחודי
azd env new dev-$(whoami)-$(date +%s)
```
  
### בעיות פורט/רשת  
```bash
# בדוק אם הפורטים זמינים
netstat -an | grep :3000
netstat -an | grep :3100
```
  
## צעדים הבאים

כעת כשסיימת את הפרויקט הראשון, עיין בנושאים מתקדמים אלה:

### 1. התאם את התשתית  
- [תשתית כקוד](../chapter-04-infrastructure/provisioning.md)  
- [הוסף מסדי נתונים, אחסון ושירותים נוספים](../chapter-04-infrastructure/provisioning.md#adding-services)  

### 2. הקם CI/CD  
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - תהליכי עבודה מלאים של CI/CD  
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - הגדרת צינור  

### 3. שיטות עבודה מומלצות לייצור  
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - אבטחה, ביצועים וניטור  

### 4. חקור עוד תבניות  
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
- [מסגרת עבודה להתאמת Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  

### קהילה ותמיכה  
- [GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)  
- [קהילת Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)  
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)  

### תבניות ודוגמאות  
- [גלריית תבניות רשמית](https://azure.github.io/awesome-azd/)  
- [תבניות קהילתיות](https://github.com/Azure-Samples/azd-templates)  
- [דפוסי ארגון](https://github.com/Azure/azure-dev/tree/main/templates)  

---

**מזל טוב על סיום הפרויקט הראשון עם azd!** אתה מוכן עכשיו לבנות ולפרוס אפליקציות מדהימות על Azure בביטחון מלא.

---

**ניווט בפרקים:**  
- **📚 דף הקורס הראשי**: [AZD למתחילים](../../README.md)  
- **📖 פרק נוכחי**: פרק 1 - יסודות והתחלה מהירה  
- **⬅️ קודם**: [התקנה והגדרה](installation.md)  
- **➡️ הבא**: [תצורה](configuration.md)  
- **🚀 פרק הבא**: [פרק 2: פיתוח מונחה AI](../chapter-02-ai-development/microsoft-foundry-integration.md)  
- **הלקח הבא**: [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש לשים לב כי תרגומים אוטומטיים עלולים לכלול שגיאות או אי-דיוקים. המסמך המקורי בשפה המקורית נחשב למקור המוסמך. למידע קריטי מומלץ להשתמש בתרגום מקצועי המבוצע על ידי אדם. איננו אחראים לכל הבנה מוטעית או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->