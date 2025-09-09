<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T21:36:13+00:00",
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
- להיות מוכנים להתקין ולהגדיר את azd בסביבת הפיתוח שלכם

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
- **קבצי תצורה** - הגדרות ומשתני סביבה
- **סקריפטים לפריסה** - זרימות עבודה אוטומטיות לפריסה

### סביבות
סביבות מייצגות יעדי פריסה שונים:
- **פיתוח** - לבדיקות ופיתוח
- **שלב ביניים** - סביבה לפני ייצור
- **ייצור** - סביבה פעילה

כל סביבה שומרת על:
- קבוצת משאבים ב-Azure
- הגדרות תצורה
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
- **ARM Templates** - תבניות מנהל משאבי Azure

### 3. זרימות עבודה משולבות
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
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

## 🔧 קבצי תצורה

### azure.yaml
קובץ התצורה הראשי של הפרויקט:
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
תצורה ספציפית לסביבה:
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
azd down --force --purge
```

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
- השתמשו בסביבות נפרדות לפיתוח/שלב ביניים/ייצור
- לעולם אל תפרסו ישירות לייצור מהמחשב המקומי
- השתמשו בצינורות CI/CD לפריסות ייצור

### 4. ניהול תצורה
- השתמשו במשתני סביבה עבור נתונים רגישים
- שמרו תצורה תחת בקרת גרסאות
- תעדו הגדרות ספציפיות לסביבה

## התקדמות בלמידה

### מתחילים (שבוע 1-2)
1. התקנת azd ואימות
2. פריסת תבנית פשוטה
3. הבנת מבנה הפרויקט
4. לימוד פקודות בסיסיות (up, down, deploy)

### בינוניים (שבוע 3-4)
1. התאמת תבניות
2. ניהול סביבות מרובות
3. הבנת קוד תשתית
4. הגדרת צינורות CI/CD

### מתקדמים (שבוע 5+)
1. יצירת תבניות מותאמות אישית
2. דפוסי תשתית מתקדמים
3. פריסות רב-אזוריות
4. תצורות ברמה ארגונית

## צעדים הבאים

- [התקנה והגדרה](installation.md) - התקנת azd והגדרתו
- [הפרויקט הראשון שלכם](first-project.md) - מדריך מעשי
- [מדריך תצורה](configuration.md) - אפשרויות תצורה מתקדמות

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
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.