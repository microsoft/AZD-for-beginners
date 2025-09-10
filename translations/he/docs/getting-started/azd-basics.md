<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:26:46+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "he"
}
-->
# יסודות AZD - הבנת Azure Developer CLI

## הקדמה

שיעור זה מציג בפניכם את Azure Developer CLI (azd), כלי שורת פקודה עוצמתי שמאיץ את המעבר שלכם מפיתוח מקומי לפריסה ב-Azure. תלמדו את המושגים הבסיסיים, התכונות המרכזיות, ותבינו כיצד azd מפשט את תהליך הפריסה של יישומים מבוססי ענן.

## מטרות למידה

בסיום השיעור, תדעו:
- מהו Azure Developer CLI ומה מטרתו העיקרית
- ללמוד את המושגים המרכזיים של תבניות, סביבות ושירותים
- לחקור תכונות מרכזיות כמו פיתוח מבוסס תבניות ותשתית כקוד
- להבין את מבנה הפרויקט והזרימה של azd
- להיות מוכנים להתקנה ולהגדרה של azd בסביבת הפיתוח שלכם

## תוצאות למידה

לאחר השלמת השיעור, תוכלו:
- להסביר את תפקיד azd בזרימות עבודה מודרניות של פיתוח בענן
- לזהות את הרכיבים של מבנה פרויקט azd
- לתאר כיצד תבניות, סביבות ושירותים עובדים יחד
- להבין את היתרונות של תשתית כקוד עם azd
- לזהות פקודות שונות של azd ואת מטרותיהן

## מהו Azure Developer CLI (azd)?

Azure Developer CLI (azd) הוא כלי שורת פקודה שנועד להאיץ את המעבר שלכם מפיתוח מקומי לפריסה ב-Azure. הוא מפשט את תהליך הבנייה, הפריסה והניהול של יישומים מבוססי ענן ב-Azure.

## מושגים מרכזיים

### תבניות
תבניות הן הבסיס של azd. הן כוללות:
- **קוד יישום** - קוד המקור שלכם ותלויות
- **הגדרות תשתית** - משאבי Azure המוגדרים ב-Bicep או Terraform
- **קבצי הגדרות** - הגדרות ומשתני סביבה
- **סקריפטים לפריסה** - זרימות עבודה אוטומטיות לפריסה

### סביבות
סביבות מייצגות יעדי פריסה שונים:
- **פיתוח** - לבדיקות ופיתוח
- **שלב ביניים** - סביבה לפני הפקה
- **הפקה** - סביבה חיה בהפקה

כל סביבה שומרת על:
- קבוצת משאבים ב-Azure
- הגדרות קונפיגורציה
- מצב פריסה

### שירותים
שירותים הם אבני הבניין של היישום שלכם:
- **חזית** - יישומי אינטרנט, SPAs
- **עורף** - APIs, מיקרו-שירותים
- **מסד נתונים** - פתרונות אחסון נתונים
- **אחסון** - אחסון קבצים ובלובים

## תכונות מרכזיות

### 1. פיתוח מבוסס תבניות
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. תשתית כקוד
- **Bicep** - שפת תחום ייעודית של Azure
- **Terraform** - כלי תשתית רב-ענני
- **ARM Templates** - תבניות מנהל משאבים של Azure

### 3. זרימות עבודה משולבות
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. ניהול סביבות
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 מבנה פרויקט

מבנה פרויקט טיפוסי של azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 קבצי הגדרות

### azure.yaml
קובץ ההגדרות הראשי של הפרויקט:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
הגדרות ספציפיות לסביבה:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 זרימות עבודה נפוצות

### התחלת פרויקט חדש
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### מחזור פיתוח
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## הבנת `azd down --force --purge`
הפקודה `azd down --force --purge` היא דרך עוצמתית לפרק לחלוטין את סביבת azd ואת כל המשאבים הקשורים. הנה פירוט של מה שכל דגל עושה:
```
--force
```
- מדלג על בקשות אישור.
- שימושי לאוטומציה או סקריפטים שבהם קלט ידני אינו אפשרי.
- מבטיח שהפירוק יתקדם ללא הפרעה, גם אם CLI מזהה אי-התאמות.

```
--purge
```
מוחק **את כל המטא-נתונים הקשורים**, כולל:
מצב סביבה
תיקיית `.azure` המקומית
מידע פריסה במטמון
מונע מ-azd "לזכור" פריסות קודמות, מה שעלול לגרום לבעיות כמו קבוצות משאבים לא תואמות או הפניות רישום ישנות.

### למה להשתמש בשניהם?
כשנתקלים בקשיים עם `azd up` עקב מצב מתמשך או פריסות חלקיות, השילוב הזה מבטיח **דף נקי**.

זה מועיל במיוחד לאחר מחיקות ידניות של משאבים בפורטל Azure או בעת מעבר בין תבניות, סביבות או מוסכמות שמות של קבוצות משאבים.

### ניהול סביבות מרובות
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 פקודות ניווט

### גילוי
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### ניהול פרויקטים
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### ניטור
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## שיטות עבודה מומלצות

### 1. השתמשו בשמות משמעותיים
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. נצלו תבניות
- התחילו עם תבניות קיימות
- התאימו לצרכים שלכם
- צרו תבניות לשימוש חוזר עבור הארגון שלכם

### 3. בידוד סביבות
- השתמשו בסביבות נפרדות לפיתוח/שלב ביניים/הפקה
- לעולם אל תפרסו ישירות להפקה מהמחשב המקומי
- השתמשו בצינורות CI/CD לפריסות הפקה

### 4. ניהול קונפיגורציה
- השתמשו במשתני סביבה עבור נתונים רגישים
- שמרו את ההגדרות תחת בקרת גרסאות
- תעדו הגדרות ספציפיות לסביבה

## התקדמות בלמידה

### מתחילים (שבוע 1-2)
1. התקינו את azd ואמתו
2. פרסו תבנית פשוטה
3. הבינו את מבנה הפרויקט
4. למדו פקודות בסיסיות (up, down, deploy)

### בינוניים (שבוע 3-4)
1. התאימו תבניות
2. ניהול סביבות מרובות
3. הבנת קוד תשתית
4. הגדרת צינורות CI/CD

### מתקדמים (שבוע 5+)
1. יצירת תבניות מותאמות אישית
2. דפוסי תשתית מתקדמים
3. פריסות רב-אזוריות
4. הגדרות ברמה ארגונית

## צעדים הבאים

- [התקנה והגדרה](installation.md) - התקינו והגדירו את azd
- [הפרויקט הראשון שלכם](first-project.md) - מדריך מעשי
- [מדריך קונפיגורציה](configuration.md) - אפשרויות קונפיגורציה מתקדמות

## משאבים נוספים

- [סקירה כללית של Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [גלריית תבניות](https://azure.github.io/awesome-azd/)
- [דוגמאות קהילתיות](https://github.com/Azure-Samples)

---

**ניווט**
- **שיעור קודם**: [README](../../README.md)
- **שיעור הבא**: [התקנה והגדרה](installation.md)

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפתו המקורית נחשב למקור הסמכותי. למידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אנושי. איננו נושאים באחריות לכל אי-הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.