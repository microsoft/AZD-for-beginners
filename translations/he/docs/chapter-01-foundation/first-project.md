# הפרויקט הראשון שלך - מדריך מעשי

**ניווט בפרק:**
- **📚 עמוד הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [התקנה והגדרות](installation.md)
- **➡️ הבא**: [הבא את האפליקציה שלך](bring-your-own-app.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח AI-קודם](../chapter-02-ai-development/microsoft-foundry-integration.md)

## הקדמה

ברוכים הבאים לפרויקט הראשון שלך עם Azure Developer CLI! תפרוס אפליקציית todo עם ממשק React, API ב-Node.js ו-Azure Cosmos DB. התבנית שומרת על השם ההיסטורי `todo-nodejs-mongo`; התשתית הנוכחית שלה משתמשת ב-Cosmos DB עבור NoSQL, לכן בדוק את קובץ ה-README שהורדת ואת `infra/` במקום להסיק את ממשק ה-API של מסד הנתונים מהשם.

> נבדק מול `azd 1.37.2` והתבנית הציבורית בנובמבר 2026. דוגמאות מטה משתמשות ב-Bash; חילוץ JSON דורש גם `jq`. פריסות ב-Azure גורמות לחיובים ולא בוצעו במהלך סקירה זו.

## מטרות למידה

בסיום מדריך זה, תלמד:
- לשלוט בתהליך אתחול פרויקט azd באמצעות תבניות
- להבין את מבנה פרויקט Azure Developer CLI וקבצי הקונפיגורציה
- לבצע פריסת אפליקציה מלאה ל-Azure עם פריסת תשתית
- ליישם עדכוני אפליקציה ואסטרטגיות לפריסה מחדש
- לנהל סביבות מרובות עבור פיתוח ובדיקות
- ליישם ניקוי משאבים והקפדה על ניהול עלויות

## תוצאות למידה

לאחר ההשלמה תוכל:
- לאתחל ולהגדיר פרויקטים של azd מתבניות באופן עצמאי
- לנווט ולשנות מבני פרויקטים של azd ביעילות
- לפרוס אפליקציות מלאות ל-Azure באמצעות פקודות יחידות
- לפתור בעיות פריסה נפוצות ובעיות אימות
- לנהל סביבות Azure מרובות לשלבי פריסה שונים
- ליישם תהליכי פריסה רציפה לעדכוני אפליקציה

## התחלה

### רשימת תנאים מוקדמים
- ✅ Azure Developer CLI מותקן ([מדריך התקנה](installation.md))
- ✅ התחברות AZD הושלמה עם `azd auth login`
- ✅ Git מותקן במערכת שלך
- ✅ Node.js 22 LTS (או גרסה נתמכת לפי התבנית שהורדת)
- ✅ Visual Studio Code (מומלץ)

לפני שתמשיך, הרץ את מאמת ההתקנה משורש המאגר:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### אמת את ההתקנה שלך
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### אמת התחברות אופציונלית ב-Azure CLI

```bash
az account show
```

### בדוק גרסת Node.js
```bash
node --version
```

## שלב 1: בחר ואתחל תבנית

נתחיל עם תבנית פופולרית של אפליקציית todo הכוללת ממשק React ו-API ב-Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### מה בדיוק קרה?
- קוד התבנית הורד לתיקייה המקומית שלך
- נוצר קובץ `azure.yaml` עם הגדרות שירות
- הוגדר קוד התשתית בתיקיית `infra/`
- נוצר קונפיגורציית סביבה

## שלב 2: חקור את מבנה הפרויקט

בוא נבחן מה יצא מ-azd:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

תראה:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### קבצים מרכזיים להבנה

**azure.yaml** - לב פרויקט ה-azd שלך:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - הגדרת תשתית:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## שלב 3: התאם אישית את הפרויקט שלך (אופציונלי)

לפני הפריסה, תוכל להתאים אישית את האפליקציה:

### שנה את הממשק קדמי
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

בצע שינוי פשוט:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### הגדר משתני סביבה
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

שני ערכים מותאמים אלו מדגימים אחסון מקומי בלבד. תבנית המלאי אינה צורכת `WEBSITE_TITLE` או `API_VERSION`, ולכן הם אינם משנים את האפליקציה. העריכה המפורשת למקור שלמעלה משנה את הכותרת המוצגת.

## שלב 4: פרוס ל-Azure

עכשיו לחלק המרגש - פרוס הכל ל-Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### מה קורה במהלך הפריסה?

תהליך העבודה מספק תשתית ומארז/מפזר קוד. סדר מדויק ניתן להתאמה דרך `workflows.up` ב-`azure.yaml`; תבנית זו מציינת תחילה אספקה ואחריה פריסה. אל תיתן אמון בסדר שלב אוניברסלי לכל תבנית.

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
לחץ על כתובת ה-URL שסופקה בפלט הפריסה, או קבל אותה בכל עת:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### בדוק את אפליקציית Todo
1. **הוסף פריט todo** - לחץ "Add Todo" והזן משימה
2. **סמן כהושלם** - סמן פריטים שהושלמו
3. **מחק פריטים** - הסר todos שאינך צריך עוד

### פקח על האפליקציה שלך
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ אמת את הפריסה שלך

לפני שממשיכים, עבור רשימת בדיקה מהירה זו כדי לאשר שהכל באמת עובד - אל תניח ש"פריסה הצליחה" משמעותה "האפליקציה עובדת":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**הפריסה מאומתת כאשר:**
- ✅ `azd show` מציג כתובת URL לנקודת קצה נגישה
- ✅ כתובת ה-URL נפתחת בדפדפן שלך ללא שגיאות
- ✅ הפונקציות המרכזיות עובדות (הוסף/סמן כהושלם/מחק todo)
- ✅ `azd monitor --logs` מציג בקשות עם ללא שגיאות בלתי צפויות

אם בדיקה כלשהי נכשלה, עבור אל [פרק 7: פתרון בעיות](../chapter-07-troubleshooting/README.md).

## שלב 6: בצע שינויים ופרוס מחדש

בוא נעשה שינוי ונראה כמה קל לעדכן:

### שנה את ה-API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

הוסף כותרת תגובה מותאמת:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### פרוס רק את שינויים בקוד
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## שלב 7: נהל סביבות מרובות

צור סביבה לבדיקות לפני ייצור:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### השוואת סביבות
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## שלב 8: נקה משאבים

כשסיימת להתנסות, נקה כדי למנוע חיובים מתמשכים:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## אפליקציה קלאסית מול אפליקציית AI: אותו תהליך עבודה

הרגע פרסת אפליקציית רשת מסורתית. אבל מה אם תרצה לפרוס אפליקציית AI — למשל, אפליקציית צ\'אט שמגובה במודלים של Microsoft Foundry?

החדשות הטובות: **תהליך העבודה זהה.**

| שלב | אפליקציית Todo קלאסית | אפליקציית צ\'אט AI |
|------|-----------------|-------------|
| אתחול (תיקייה ריקה) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| אימות | `azd auth login` | `azd auth login` |
| פריסה | `azd up` | `azd up` |
| פיקוח | `azd monitor` | `azd monitor` |
| ניקוי | `azd down --force --purge` | `azd down --force --purge` |

פקודות מחזור החיים הן אותו דבר, אך התנאים המוקדמים שונים. תבנית AI יכולה לדרוש גישה למודל, מכסת אזור, אינג\'סטיה של נתונים, וקונפיגורציה נוספת. קרא את קובץ ה-README שלה לפני הפריסה; `azd up` אינו יכול לספק הרשאות או מכסה חסרות.

זוהי העיקרון המרכזי של azd: **תהליך עבודה אחד, כל עומס עבודה.** הכישורים שהתאמנת עליהם במדריך זה — איתחול, פריסה, פיקוח, פריסה מחדש וניקוי — חלים במידה שווה על יישומי AI וסוכנים.

---

## מה שלמדת

מזל טוב! הצלחת:
- ✅ לאתחל פרויקט azd מתבנית
- ✅ לחקור את מבנה הפרויקט והקבצים המרכזיים
- ✅ לפרוס אפליקציית full-stack ל-Azure
- ✅ לבצע שינויים בקוד ולפרוס מחדש
- ✅ לנהל סביבות מרובות
- ✅ לנקות משאבים

## 🎯 תרגילי אימות מיומנות

### תרגיל 1: פרוס תבנית שונה (15 דקות)
**מטרה**: להראות שליטה בתהליך init ופריסת azd

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] האפליקציה פרוסה ללא שגיאות
- [ ] יכול לגשת לכתובת האפליקציה בדפדפן
- [ ] האפליקציה מתפקדת כראוי (הוסף/הסר todos)
- [ ] ניקיון מלא של כל המשאבים בוצע בהצלחה

### תרגיל 2: התאם אישית קונפיגורציה (20 דקות)
**מטרה**: לתרגל אחסון ערך לסביבה מקומית מבלי לבלבל אותו עם קונפיגורציית זמן ריצה

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**קריטריוני הצלחה:**
- [ ] סביבה מותאמת נוצרה בהצלחה
- [ ] משתני סביבה הוגדרו וניתן לשליפה
- [ ] `azd env get-value APP_TITLE` מדפיס `My Custom Todo App`
- [ ] יכול להסביר מדוע ערכים אלה לא משנים את האפליקציה אלא אם כן הקוד/תשתית צורכים אותם

### תרגיל 3: תהליך עבודה עם סביבות מרובות (25 דקות)
**מטרה**: לשלוט בניהול סביבות ואסטרטגיות פריסה

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] שתי סביבות נוצרו עם קונפיגורציות שונות
- [ ] שתי הסביבות פרוסו בהצלחה
- [ ] ניתן לעבור בין סביבות באמצעות `azd env select`
- [ ] משתני סביבה שונים בין הסביבות
- [ ] ניקוי משאבים של שתי הסביבות בוצע בהצלחה

## 📊 ההתקדמות שלך

**זמן מושקע**: ~60-90 דקות  
**מיומנויות שנרכשו**:
- ✅ אתחול פרויקט מתבנית
- ✅ פריסת משאבים ב-Azure
- ✅ תהליכי פריסת אפליקציה
- ✅ ניהול סביבה
- ✅ ניהול קונפיגורציה
- ✅ ניקוי משאבים וניהול עלויות

**שלב הבא**: אתה מוכן ל[מדריך הקונפיגורציה](../chapter-03-configuration/configuration.md) ללמידת דפוסי קונפיגורציה מתקדמים!

## פתרון בעיות נפוצות

### שגיאות אימות
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### כשלונות בפריסה
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### קונפליקטים בשמות משאבים
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### בעיות פורטים/רשת
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## צעדים הבאים

עכשיו כשסיימת את הפרויקט הראשון שלך, חקור את הנושאים המתקדמים הבאים:

### 1. התאמה אישית של תשתית
- [תשתית כקוד](../chapter-04-infrastructure/provisioning.md)
- [הוסף תשתית למסד נתונים](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. הגדרת CI/CD
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - תהליכי CI/CD מלאים
- [מסמכי Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - קונפיגורציית פייפליין

### 3. שיטות עבודה מומלצות לייצור
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - אבטחה, ביצועים ופיקוח

### 4. חקור עוד תבניות
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## משאבים נוספים

### חומרי למידה
- [מסמכי Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [מרכז אדריכלות Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מסגרת עבודה של Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### קהילה ותמיכה
- [GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)
- [קהילת Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### תבניות ודוגמאות
- [גלריית תבניות רשמית](https://azure.github.io/awesome-azd/)
- [תרומות תבניות קהילה](https://github.com/Azure/awesome-azd)
- [מקור תבנית Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**מזל טוב על השלמת פרויקט azd הראשון שלך!** אתה עכשיו מוכן לבנות ולפרוס אפליקציות מדהימות על Azure בביטחון.

---

**ניווט בפרק:**
- **📚 עמוד הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [התקנה והגדרות](installation.md)
- **➡️ הבא**: [הבא את האפליקציה שלך](bring-your-own-app.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח AI-קודם](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->