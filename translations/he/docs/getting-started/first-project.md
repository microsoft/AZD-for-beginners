<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-18T07:09:22+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "he"
}
-->
# הפרויקט הראשון שלך - מדריך מעשי

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ קודם**: [התקנה והגדרות](installation.md)
- **➡️ הבא**: [תצורה](configuration.md)
- **🚀 פרק הבא**: [פרק 2: פיתוח מבוסס AI](../ai-foundry/azure-ai-foundry-integration.md)

## מבוא

ברוכים הבאים לפרויקט הראשון שלכם עם Azure Developer CLI! מדריך מעשי זה מספק הסבר מלא על יצירה, פריסה וניהול של אפליקציה מלאה ב-Azure באמצעות azd. תעבדו עם אפליקציית משימות אמיתית הכוללת ממשק קדמי React, ממשק אחורי Node.js, ומסד נתונים MongoDB.

## מטרות למידה

בסיום המדריך, תלמדו:
- לשלוט בתהליך אתחול פרויקט azd באמצעות תבניות
- להבין את מבנה הפרויקט וקבצי התצורה של Azure Developer CLI
- לבצע פריסה מלאה של אפליקציה ל-Azure כולל הקצאת תשתיות
- ליישם עדכונים לאפליקציה ואסטרטגיות לפריסה מחדש
- לנהל סביבות מרובות לפיתוח ולבדיקות
- ליישם שיטות לניקוי משאבים וניהול עלויות

## תוצאות למידה

בסיום המדריך, תוכלו:
- לאתחל ולהגדיר פרויקטים של azd מתבניות באופן עצמאי
- לנווט ולשנות מבני פרויקטים של azd בצורה יעילה
- לפרוס אפליקציות מלאות ל-Azure באמצעות פקודות בודדות
- לפתור בעיות נפוצות בפריסה ובעיות אימות
- לנהל סביבות Azure מרובות לשלבי פריסה שונים
- ליישם תהליכי פריסה מתמשכת לעדכוני אפליקציה

## תחילת העבודה

### רשימת דרישות מוקדמות
- ✅ Azure Developer CLI מותקן ([מדריך התקנה](installation.md))
- ✅ Azure CLI מותקן ומאומת
- ✅ Git מותקן במערכת שלכם
- ✅ Node.js גרסה 16 ומעלה (למדריך זה)
- ✅ Visual Studio Code (מומלץ)

### אימות ההגדרות שלכם
```bash
# Check azd installation
azd version
```
### אימות אימות Azure

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
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### מה קרה עכשיו?
- קוד התבנית הורד לספרייה המקומית שלכם
- נוצר קובץ `azure.yaml` עם הגדרות שירות
- הוגדר קוד תשתית בספריית `infra/`
- נוצרה תצורת סביבה

## שלב 2: חקר מבנה הפרויקט

בואו נבחן מה azd יצר עבורנו:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
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
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - הגדרת תשתית:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## שלב 3: התאמת הפרויקט שלכם (אופציונלי)

לפני הפריסה, תוכלו להתאים את האפליקציה:

### שינוי הממשק הקדמי
```bash
# Open the React app component
code src/web/src/App.tsx
```

בצעו שינוי פשוט:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### הגדרת משתני סביבה
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## שלב 4: פריסה ל-Azure

עכשיו החלק המרגש - פריסת הכל ל-Azure!

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

פקודת `azd up` מבצעת את השלבים הבאים:
1. **הקצאה** (`azd provision`) - יוצרת משאבי Azure
2. **אריזה** - בונה את קוד האפליקציה שלכם
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

## שלב 5: בדיקת האפליקציה שלכם

### גישה לאפליקציה שלכם
לחצו על ה-URL שסופק בפלט הפריסה, או קבלו אותו בכל זמן:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### בדיקת אפליקציית המשימות
1. **הוספת משימה** - לחצו על "Add Todo" והכניסו משימה
2. **סימון כהושלם** - סמנו משימות שהושלמו
3. **מחיקת משימות** - הסירו משימות שאינן נחוצות יותר

### ניטור האפליקציה שלכם
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## שלב 6: ביצוע שינויים ופריסה מחדש

בואו נעשה שינוי ונראה כמה קל לעדכן:

### שינוי הממשק האחורי
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

הוסיפו כותרת תגובה מותאמת אישית:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### פריסת שינויים בקוד בלבד
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## שלב 7: ניהול סביבות מרובות

צרו סביבה לבדיקות לפני פריסה לייצור:

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

## שלב 8: ניקוי משאבים

כשסיימתם להתנסות, נקו את המשאבים כדי להימנע מחיובים מתמשכים:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## מה למדתם

ברכות! הצלחתם:
- לאתחל פרויקט azd מתבנית
- לחקור את מבנה הפרויקט והקבצים המרכזיים
- לפרוס אפליקציה מלאה ל-Azure
- לבצע שינויים בקוד ולפרוס מחדש
- לנהל סביבות מרובות
- לנקות משאבים

## פתרון בעיות נפוצות

### שגיאות אימות
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### כשלי פריסה
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### קונפליקטים בשמות משאבים
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### בעיות יציאה/רשת
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## צעדים הבאים

עכשיו כשסיימתם את הפרויקט הראשון שלכם, חקרו את הנושאים המתקדמים הבאים:

### 1. התאמת תשתית
- [תשתית כקוד](../deployment/provisioning.md)
- [הוספת מסדי נתונים, אחסון ושירותים נוספים](../deployment/provisioning.md#adding-services)

### 2. הגדרת CI/CD
- [אינטגרציה עם GitHub Actions](../deployment/cicd-integration.md)
- [צינורות Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. שיטות עבודה מומלצות לייצור
- [הגדרות אבטחה](../deployment/best-practices.md#security)
- [אופטימיזציית ביצועים](../deployment/best-practices.md#performance)
- [ניטור ורישום](../deployment/best-practices.md#monitoring)

### 4. חקר תבניות נוספות
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
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
- [קהילת המפתחים של Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### תבניות ודוגמאות
- [גלריית התבניות הרשמית](https://azure.github.io/awesome-azd/)
- [תבניות קהילתיות](https://github.com/Azure-Samples/azd-templates)
- [תבניות ארגוניות](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ברכות על השלמת הפרויקט הראשון שלכם עם azd!** עכשיו אתם מוכנים לבנות ולפרוס אפליקציות מדהימות ב-Azure בביטחון.

---

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ קודם**: [התקנה והגדרות](installation.md)
- **➡️ הבא**: [תצורה](configuration.md)
- **🚀 פרק הבא**: [פרק 2: פיתוח מבוסס AI](../ai-foundry/azure-ai-foundry-integration.md)
- **שיעור הבא**: [מדריך פריסה](../deployment/deployment-guide.md)

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור הסמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.