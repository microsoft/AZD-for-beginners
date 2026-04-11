# גיליון פקודות - פקודות AZD חיוניות

**התייחסות מהירה לכל הפרקים**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../README.md)
- **📖 התחלה מהירה**: [פרק 1: יסודות והתחלה מהירה](../README.md#-chapter-1-foundation--quick-start)
- **🤖 פקודות AI**: [פרק 2: פיתוח מונחה AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 מתקדם**: [פרק 4: תשתית כקוד](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## מבוא

גיליון פקודות מקיף זה מספק התייחסות מהירה לפקודות ה-Azure Developer CLI הנפוצות ביותר, מאורגנות לפי קטגוריות עם דוגמאות מעשיות. מושלם לעיון מהיר במהלך פיתוח, פתרון תקלות, ופעולות יומיומיות עם פרויקטים של azd.

## מטרות למידה

בשימוש בגיליון פקודות זה, תוכל:
- לקבל גישה מיידית לפקודות וסינטקס חיוניים של Azure Developer CLI
- להבין את ארגון הפקודות לפי קטגוריות פונקציונליות ומקרי שימוש
- להתייחס לדוגמאות מעשיות לתרחישי פיתוח ופריסה נפוצים
- לגשת לפקודות פתרון בעיות לפתרון מהיר של תקלות
- למצוא אפשרויות הגדרה והתאמה מתקדמות ביעילות
- לאתר פקודות לניהול סביבות וזרימות עבודה מרובות סביבות

## תוצאות למידה

בהתייחסות שוטפת לגיליון זה, תוכל:
- להפעיל פקודות azd בביטחון ללא צורך בהתייחסות לתיעוד מלא
- לפתור במהירות בעיות נפוצות באמצעות פקודות אבחון מתאימות
- לנהל ביעילות סביבות ותרחישי פריסה מרובים
- ליישם תכונות ואפשרויות הגדרה מתקדמות של azd לפי הצורך
- לפתור בעיות בפריסה באמצעות רצפי פקודות שיטתיים
- לייעל זרימות עבודה באמצעות שימוש יעיל בקיצורי דרך ואפשרויות של azd

## פקודות התחלה

### אימות
```bash
# התחבר ל-Azure באמצעות AZD
azd auth login

# התחבר ל-Azure CLI (AZD משתמש בזה ברקע)
az login

# בדוק את החשבון הנוכחי
az account show

# הגדר מינוי ברירת מחדל
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# התנתק מ-AZD
azd auth logout

# התנתק מ-Azure CLI
az logout
```

### אתחול פרויקט
```bash
# עיין בתבניות הזמינות
azd template list

# אתחל מתוך תבנית
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# אתחל בתיקיה הנוכחית
azd init .

# אתחל עם שם מותאם אישית
azd init --template todo-nodejs-mongo my-awesome-app
```

## פקודות פריסה מרכזיות

### זרימת עבודה לפריסה מלאה
```bash
# פרוס הכל (הקמה + פריסה)
azd up

# פרוס עם השבתת בקשות האישור
azd up --confirm-with-no-prompt

# פרוס לסביבה ספציפית
azd up --environment production

# פרוס עם פרמטרים מותאמים אישית
azd up --parameter location=westus2
```

### תשתית בלבד
```bash
# פרוס משאבי Azure
azd provision

# 🧪 תצוגה מקדימה של שינויים בתשתית
azd provision --preview
# מציג תצוגת הרצה יבשה של אילו משאבים ייווצרו/ישונו/ימחקו
# דומה ל-'terraform plan' או 'bicep what-if' - בטוח להרצה, ללא שינויים מיושמים
```

### יישום בלבד
```bash
# פרוס קוד יישום
azd deploy

# פרוס שירות ספציפי
azd deploy --service web
azd deploy --service api

# פרוס את כל השירותים
azd deploy --all
```

### בנייה ואריזה
```bash
# לבנות יישומים
azd package

# לבנות שירות ספציפי
azd package --service api
```

## 🌍 ניהול סביבה

### פעולות סביבה
```bash
# רשום את כל הסביבות
azd env list

# צור סביבה חדשה
azd env new development
azd env new staging --location westus2

# בחר סביבה
azd env select production

# הצג סביבות זמינות
azd env list

# רענן את מצב הסביבה
azd env refresh
```

### משתני סביבה
```bash
# הגדר משתנה סביבה
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# קבל משתנה סביבה
azd env get API_KEY

# ראה את כל משתני הסביבה
azd env get-values

# הסר משתנה סביבה
azd env unset DEBUG
```

## ⚙️ פקודות הגדרה

### הגדרה גלובלית
```bash
# הצג את כל התצורות
azd config show

# קבע ברירות מחדל עולמיות
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# הסר תצורה
azd config unset defaults.location

# אפס את כל התצורות
azd config reset
```

### הגדרת פרויקט
```bash
# אמת את azure.yaml
azd config validate

# הצג מידע על הפרויקט
azd show

# קבל נקודות קצה של השירות
azd show --output json
```

## 📊 ניטור ואבחון

### לוח ניטור
```bash
# פתח את לוח הבקרה למעקב בפורטל Azure
azd monitor

# פתח מדדים חיים ב-Application Insights
azd monitor --live

# פתח את לוח היומנים של Application Insights
azd monitor --logs

# פתח את סקירת Application Insights
azd monitor --overview
```

### צפייה ביומני מכולות
```bash
# הצג יומנים דרך Azure CLI (לאפליקציות מכולות)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# עקוב אחר יומנים בזמן אמת
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# הצג יומנים מפורטל Azure
azd monitor --logs
```

### שאילתות Log Analytics
```bash
# גש לניתוח יומני גישה דרך פורטל Azure
azd monitor --logs

# שאילתת יומנים באמצעות Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ פקודות תחזוקה

### ניקוי
```bash
# הסר את כל המשאבים של Azure
azd down

# מחק בכפייה ללא אישור
azd down --force

# נקה משאבים שנמחקו באופן רך
azd down --purge

# ניקוי מלא
azd down --force --purge
```

### עדכונים
```bash
# בדוק אם קיימים עדכונים ל-azd
azd version

# קבל את הגירסה הנוכחית
azd version

# הצג את התצורה הנוכחית
azd config show
```

## 🔧 פקודות מתקדמות

### צינור ו-CI/CD
```bash
# הגדר פעולות GitHub
azd pipeline config

# הגדר Azure DevOps
azd pipeline config --provider azdo

# הצג את תצורת הצינור
azd pipeline show
```

### ניהול תשתית
```bash
# צור תבניות תשתית
azd infra generate

# 🧪 תצוגה מקדימה ותכנון תשתית
azd provision --preview
# מדמה פריסת תשתית ללא פריסה בפועל
# מנתח תבניות Bicep/Terraform ומציג:
# - משאבים שיוספו (ירוק +)
# - משאבים שישונו (צהוב ~)
# - משאבים שימחקו (אדום -)
# בטוח להרצה - לא מבוצעים שינויים בפועל בסביבת Azure

# סינתוז תשתית מ-azure.yaml
azd infra synth
```

### מידע על פרויקט
```bash
# הצג סטטוס פרויקט ונקודות קצה
azd show

# הצג מידע מפורט על הפרויקט בפורמט JSON
azd show --output json

# קבל נקודות קצה של השירות
azd show --output json | jq '.services'
```

## 🤖 פקודות AI והרחבות

### הרחבות AZD
```bash
# ראה את כל ההרחבות הזמינות (כולל AI)
azd extension list

# התקן את תוסף הסוכנים של Foundry
azd extension install azure.ai.agents

# התקן את תוסף הכוונון המדויק
azd extension install azure.ai.finetune

# התקן את תוסף המודלים המותאמים אישית
azd extension install azure.ai.models

# עדכן את כל ההרחבות המותקנות
azd extension upgrade --all
```

### פקודות סוכן AI
```bash
# אתחול פרויקט סוכן מתוך מניפסט
azd ai agent init -m <manifest-path-or-uri>

# כיוון לפרויקט Foundry ספציפי
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ציון תיקיית מקור הסוכן
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# בחירת יעד אירוח
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### שרת MCP (אלפא)
```bash
# הפעל את שרת MCP עבור הפרויקט שלך
azd mcp start

# נהל אישור כלי לפעולות MCP
azd copilot consent list
```

### יצירת תשתית
```bash
# צור קבצי IaC מהגדרת הפרויקט שלך
azd infra generate

# סינתז תשתית מ-azure.yaml
azd infra synth
```

---

## 🎯 זרימות עבודה מהירות

### זרימת עבודה לפיתוח
```bash
# להתחיל פרויקט חדש
azd init --template todo-nodejs-mongo
cd my-project

# לפרוס לסביבת פיתוח
azd env new dev
azd up

# לבצע שינויים ולפרוס מחדש
azd deploy

# לפתוח לוח בקרה למעקב
azd monitor --live
```

### זרימת עבודה מרובת סביבות
```bash
# הגדר סביבות
azd env new dev
azd env new staging  
azd env new production

# פרוס לסביבת הפיתוח
azd env select dev
azd up

# בדוק וקדם לסביבת הביניים
azd env select staging
azd up

# פרוס לסביבת הייצור
azd env select production
azd up
```

### זרימת עבודה לפתרון תקלות
```bash
# אפשר מצב דיבוג
export AZD_DEBUG=true

# בדוק את מצב ההטמעה
azd show

# אמת את התצורה
azd config show

# פתח לוח בקרה לניטור עבור יומנים
azd monitor --logs

# בדוק את מצב המשאבים
azd show --output json
```

## 🔍 פקודות דיבוג

### מידע דיבוג
```bash
# אפשר פלט ניפוי שגיאות
export AZD_DEBUG=true
azd <command> --debug

# השבת טלמטריה לפלט נקי יותר
export AZD_DISABLE_TELEMETRY=true

# בדוק את ההגדרה הנוכחית
azd config show

# בדוק את מצב האימות
az account show
```

### דיבוג תבניות
```bash
# רשום תבניות זמינות עם פרטים
azd template list --output json

# הצג מידע על תבנית
azd template show <template-name>

# אמת את התבנית לפני אתחול
azd template validate <template-name>
```

## 📁 פקודות קבצים ותיקיות

### מבנה פרויקט
```bash
# הצג את מבנה התיקייה הנוכחי
tree /f  # חלונות
find . -type f  # לינוקס/מק או.אס

# נווט לשורש פרויקט azd
cd $(azd root)

# הצג את תיקיית ההגדרות של azd
echo $AZD_CONFIG_DIR  # בדרך כלל ~/.azd
```

## 🎨 עיצוב פלט

### פלט JSON
```bash
# קבל פלט JSON לסקריפטים
azd show --output json
azd env list --output json
azd config show --output json

# נתח עם jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### פלט טבלה
```bash
# עיצוב כטבלה
azd env list --output table

# הצג שירותים שמופעלים
azd show --output json | jq '.services | keys'
```

## 🔧 שילובי פקודות נפוצים

### סקריפט בדיקת בריאות
```bash
#!/bin/bash
# בדיקת בריאות מהירה
azd show
azd env get-values
azd monitor --logs
```

### אימות פריסה
```bash
#!/bin/bash
# אימות לפני פריסה
azd show
azd provision --preview  # תצוגה מקדימה של שינויים לפני הפריסה
az account show
```

### השוואת סביבות
```bash
#!/bin/bash
# השווה בין סביבות
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### סקריפט ניקוי משאבים
```bash
#!/bin/bash
# נקה סביבות ישנות
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 משתני סביבה

### משתני סביבה נפוצים
```bash
# קונפיגורציית Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# קונפיגורציית AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# קונפיגורציית יישום
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 פקודות חירום

### תיקונים מהירים
```bash
# אפס אימות
az account clear
az login

# רענן את הסביבה בכוח
azd env refresh

# פרוס מחדש את כל השירותים
azd deploy

# בדוק את מצב הפריסה
azd show --output json
```

### פקודות שחזור
```bash
# לשחזר מהתקנה שנכשלה - לנקות ולהתקין מחדש
azd down --force --purge
azd up

# לפרוס מחדש רק את התשתית
azd provision

# לפרוס מחדש רק את היישום
azd deploy
```

## 💡 טיפים מקצועיים

### קיצורי דרך לזרימת עבודה מהירה יותר
```bash
# הוסף ל-.bashrc או ל-.zshrc שלך
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### קיצורי דרך לפונקציות
```bash
# החלפת סביבה מהירה
azd-env() {
    azd env select $1 && azd show
}

# פריסה מהירה עם ניטור
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# מצב הסביבה
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 עזרה ותיעוד

### קבלת עזרה
```bash
# עזרה כללית
azd --help
azd help

# עזרה ספציפית לפקודה
azd up --help
azd env --help
azd config --help

# הצג מידע על גרסה ובנייה
azd version
azd version --output json
```

### קישורי תיעוד
```bash
# פתח תיעוד בדפדפן
azd docs

# הצג תיעוד תבנית
azd template show <template-name> --docs
```

---

**טיפ**: סמן דף זה וסמן `Ctrl+F` למציאת הפקודות שאתה צריך במהירות!

---

**ניווט**
- **שיעור קודם**: [בדיקות מקדימות](../docs/pre-deployment/preflight-checks.md)
- **שיעור הבא**: [מילון מונחים](glossary.md)

---

> **💡 רוצה עזרה עם פקודות Azure בעורך שלך?** התקן את [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) עם `npx skills add microsoft/github-copilot-for-azure` — 37 מיומנויות ל-AI, Foundry, פריסה, אבחון, ועוד.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, אנא שימו לב כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוק. יש להתייחס למסמך המקורי בשפת המקור כמקור הסמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי של תרגום אנושי. אנו לא אחראים לכל אי-הבנה או פרשנות שגויה הנגרמת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->