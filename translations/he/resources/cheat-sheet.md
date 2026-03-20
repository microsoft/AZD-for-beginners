# גליונות פקודות - פקודות AZD חיוניות

**עיון מהיר עבור כל הפרקים**
- **📚 עמוד קורס**: [AZD למתחילים](../README.md)
- **📖 התחלה מהירה**: [פרק 1: יסוד והתחלה מהירה](../README.md#-chapter-1-foundation--quick-start)
- **🤖 פקודות בינה מלאכותית**: [פרק 2: פיתוח עם AI בראש ובראשונה](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 מתקדם**: [פרק 4: תשתית כקוד](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## מבוא

גיליון פקודות מקיף זה מספק עיון מהיר לפקודות החשובות והנפוצות ביותר של Azure Developer CLI, מסודר לפי קטגוריות עם דוגמאות מעשיות. אידיאלי לחיפוש מהיר במהלך פיתוח, פתרון בעיות ופעילות יומיומית עם פרויקטים של azd.

## מטרות למידה

בשימוש בגיליון פקודות זה, תוכלו:
- לקבל גישה מיידית לפקודות וסינטקס חיוניים של Azure Developer CLI
- להבין את ארגון הפקודות לפי קטגוריות פונקציונליות ומקרי שימוש
- לעיין בדוגמאות מעשיות לתרחישי פיתוח ופריסה שכיחים
- לגשת לפקודות לפתרון תקלות לפתרון בעיות מהיר
- למצוא אפשרויות מתקדמות להתאמה וקינפוג ביעילות
- לאתר פקודות לניהול סביבות ותהליכי עבודה בסביבות מרובות

## תוצאות למידה

בהתבסס על עיון סדיר בגיליון זה, תוכלו:
- לבצע פקודות azd בביטחון ללא צורך בהתייחסות לתיעוד מלא
- לפתור בעיות נפוצות במהירות באמצעות פקודות אבחון מתאימות
- לנהל ביעילות סביבות מרובות ותרחישי פריסה
- ליישם תכונות מתקדמות ואפשרויות קינפוג של azd לפי צורך
- לטפל בבעיות פריסה באמצעות רצפי פקודות שיטתיים
- לייעל תהליכי עבודה באמצעות שימוש יעיל בקיצורי דרך ואפשרויות azd

## פקודות התחלה

### אימות
```bash
# התחבר ל-Azure דרך AZD
azd auth login

# התחבר ל-Azure CLI (AZD משתמש בזה מאחורי הקלעים)
az login

# בדוק חשבון נוכחי
az account show

# הגדר מנוי ברירת מחדל
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# התנתק מ-AZD
azd auth logout

# התנתק מ-Azure CLI
az logout
```

### איתחול פרויקט
```bash
# דפדף בתבניות הזמינות
azd template list

# אתחל מתוך תבנית
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# אתחל בתיקיה הנוכחית
azd init .

# אתחל עם שם מותאם אישית
azd init --template todo-nodejs-mongo my-awesome-app
```

## פקודות פריסה עיקריות

### תהליך פריסה שלם
```bash
# לפרוס הכל (הקצאה + פריסה)
azd up

# לפרוס עם השבתת בקשות אישור
azd up --confirm-with-no-prompt

# לפרוס לסביבת יעד ספציפית
azd up --environment production

# לפרוס עם פרמטרים מותאמים אישית
azd up --parameter location=westus2
```

### רק תשתית
```bash
# פרוס משאבי Azure
azd provision

# 🧪 תצוגה מקדימה של שינויים בתשתית
azd provision --preview
# מציג תצוגת הרצה יבש של אילו משאבים ייווצרו/ישונו/ימחקו
# דומה ל-'terraform plan' או 'bicep what-if' - בטוח להרצה, ללא שינויים מיושמים
```

### רק יישום
```bash
# לפרוס קוד יישום
azd deploy

# לפרוס שירות ספציפי
azd deploy --service web
azd deploy --service api

# לפרוס את כל השירותים
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

# הצג את הסביבה הנוכחית
azd env show

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

# רשום את כל משתני הסביבה
azd env get-values

# הסר משתנה סביבה
azd env unset DEBUG
```

## ⚙️ פקודות קינפוג

### קינפוג גלובלי
```bash
# הצג את כל ההגדרות
azd config list

# הגדר ברירות מחדל גלובליות
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# הסר הגדרות
azd config unset defaults.location

# אפס את כל ההגדרות
azd config reset
```

### קינפוג פרויקט
```bash
# לאמת את azure.yaml
azd config validate

# הצג מידע על הפרויקט
azd show

# קבל נקודות קצה של שירותים
azd show --output json
```

## 📊 ניטור ואבחון

### לוח בקרה לניטור
```bash
# פתח לוח בקרה למעקב בפורטל Azure
azd monitor

# פתח מדדים חיים ב-Application Insights
azd monitor --live

# פתח לוח יומנים ב-Application Insights
azd monitor --logs

# פתח סקירה כללית של Application Insights
azd monitor --overview
```

### צפייה ביומני מכולות
```bash
# הצג יומנים דרך Azure CLI (ליישומים במכולה)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# עקוב אחרי יומנים בזמן אמת
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# הצג יומנים בפורטל Azure
azd monitor --logs
```

### שאילתות לניתוח יומני רישום
```bash
# ניתוח יומני גישה דרך פורטל Azure
azd monitor --logs

# שאילתת יומנים באמצעות Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ פקודות תחזוקה

### ניקוי
```bash
# הסר את כל משאבי Azure
azd down

# מחיקה בכפייה ללא אישור
azd down --force

# טיהור משאבים שנמחקו בצורה רכה
azd down --purge

# ניקוי מלא
azd down --force --purge
```

### עדכונים
```bash
# בדוק עבור עדכונים של azd
azd version

# קבל את הגרסה הנוכחית
azd version

# הצג תצורה נוכחית
azd config list
```

## 🔧 פקודות מתקדמות

### צינורות עבודה ו-CI/CD
```bash
# הגדר את פעולות GitHub
azd pipeline config

# הגדר את Azure DevOps
azd pipeline config --provider azdo

# הצג את תצורת הצינור
azd pipeline show
```

### ניהול תשתית
```bash
# צור תבניות תשתית
azd infra generate

# 🧪 תצוגה מוקדמת ותכנון תשתית
azd provision --preview
# מדמה פריסת תשתית מבלי לפרוס בפועל
# מנתח תבניות Bicep/Terraform ומציג:
# - משאבים שיתווספו (ירוק +)
# - משאבים שישונו (צהוב ~)
# - משאבים שיחוקו (אדום -)
# בטוח להרצה - לא נעשו שינויים בפועל בסביבת Azure

# מסנתז תשתית מקובץ azure.yaml
azd infra synth
```

### מידע על פרויקט
```bash
# הצג סטטוס ונתיבי קצה של הפרויקט
azd show

# הצג מידע מפורט של הפרויקט כ-JSON
azd show --output json

# קבל נתיבי קצה של השירות
azd show --output json | jq '.services'
```

## 🤖 פקודות AI והרחבות

### הרחבות AZD
```bash
# רכז את כל ההרחבות הזמינות (כולל AI)
azd extension list

# התקן את הרחבת סוכני Foundry
azd extension install azure.ai.agents

# התקן את הרחבת הכוונון המדויק
azd extension install azure.ai.finetune

# התקן את הרחבת הדגמים המותאמים אישית
azd extension install azure.ai.models

# שדרג את כל ההרחבות המותקנות
azd extension upgrade --all
```

### פקודות סוכני AI
```bash
# לאתחל פרויקט סוכן מתוך מנית
azd ai agent init -m <manifest-path-or-uri>

# לכוון לפרויקט Foundry ספציפי
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# לציין את ספריית מקור הסוכן
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# לבחור יעד אירוח
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### שרת MCP (אלפא)
```bash
# הפעל את שרת ה-MCP עבור הפרויקט שלך
azd mcp start

# נהל הסכמת כלי לפעולות MCP
azd mcp consent
```

### יצירת תשתית
```bash
# ליצור קבצי IaC מהגדרת הפרויקט שלך
azd infra generate

# לסנתז תשתית מ-azure.yaml
azd infra synth
```

---

## 🎯 תהליכי עבודה מהירים

### תהליך פיתוח
```bash
# התחלת פרויקט חדש
azd init --template todo-nodejs-mongo
cd my-project

# פריסה לסביבת פיתוח
azd env new dev
azd up

# בצע שינויים ופרוס מחדש
azd deploy

# פתח לוח בקרה למעקב
azd monitor --live
```

### תהליך עבודה רב-סביבתי
```bash
# הגדר סביבות
azd env new dev
azd env new staging  
azd env new production

# פרוס לסביבת פיתוח
azd env select dev
azd up

# בדוק וקדם לסביבת הביניים
azd env select staging
azd up

# פרוס לסביבת הייצור
azd env select production
azd up
```

### תהליך פתרון תקלות
```bash
# הפעל מצב דיבוג
export AZD_DEBUG=true

# בדוק את מצב הפריסה
azd show

# אמת את התצורה
azd config list

# פתח לוח בקרה למוניטורינג עבור יומנים
azd monitor --logs

# בדוק את מצב המשאבים
azd show --output json
```

## 🔍 פקודות ניפוי שגיאות

### מידע לניפוי שגיאות
```bash
# הפעל פלט דיבוג
export AZD_DEBUG=true
azd <command> --debug

# השבת טלמטריה לפלט נקי יותר
export AZD_DISABLE_TELEMETRY=true

# בדוק תצורה נוכחית
azd config list

# בדוק סטטוס אימות
az account show
```

### ניפוי שגיאות בתבניות
```bash
# רשום תבניות זמינות עם פרטים
azd template list --output json

# הצג מידע על התבנית
azd template show <template-name>

# אשר את התבנית לפני אתחול
azd template validate <template-name>
```

## 📁 פקודות קבצים ותיקיות

### מבנה פרויקט
```bash
# הצג את מבנה התיקיה הנוכחי
tree /f  # ווינדוס
find . -type f  # לינוקס/macOS

# נווט לשורש פרויקט azd
cd $(azd root)

# הצג את תיקיית קונפיגורציית azd
echo $AZD_CONFIG_DIR  # בדרך כלל ~/.azd
```

## 🎨 פורמט פלט

### פלט JSON
```bash
# קבל פלט JSON לסקריפטינג
azd show --output json
azd env list --output json
azd config list --output json

# נתח עם jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### פלט טבלה
```bash
# פורמט כטבלה
azd env list --output table

# הצג שירותים שמופעלים
azd show --output json | jq '.services | keys'
```

## 🔧 שילובי פקודות נפוצים

### סקריפט בדיקת בריאות
```bash
#!/bin/bash
# בדיקת מצב מהירה
azd show
azd env show
azd monitor --logs
```

### אימות פריסה
```bash
#!/bin/bash
# אימות לפני הפריסה
azd show
azd provision --preview  # תצוגת שינויים לפני הפריסה
az account show
```

### השוואת סביבות
```bash
#!/bin/bash
# השווה סביבות
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### סקריפט ניקוי משאבים
```bash
#!/bin/bash
# לנקות סביבות ישנות
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 משתני סביבה

### משתני סביבה נפוצים
```bash
# תצורת Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# תצורת AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# תצורת היישום
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 פקודות חירום

### תיקונים מהירים
```bash
# איפוס אימות
az account clear
az login

# כפה ריענון סביבה
azd env refresh

# פריסה מחדש של כל השירותים
azd deploy

# בדוק את מצב הפריסה
azd show --output json
```

### פקודות שיקום
```bash
# לשחזר מהתקנה שנכשלה - לנקות ולהתקין מחדש
azd down --force --purge
azd up

# לספק מחדש את התשתית בלבד
azd provision

# להפעיל מחדש את האפליקציה בלבד
azd deploy
```

## 💡 טיפים מקצועיים

### כינויי פקודות להאצת עבודה
```bash
# הוסף ל-.bashrc או ל-.zshrc שלך
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### קיצורי פונקציות
```bash
# החלפה מהירה בין סביבות
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
    azd env show
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

# עזרה ספציפית לפקודות
azd up --help
azd env --help
azd config --help

# הצג מידע על גרסה ובנייה
azd version
azd version --output json
```

### קישורים לתיעוד
```bash
# פתח את התיעוד בדפדפן
azd docs

# הצג את תיעוד התבנית
azd template show <template-name> --docs
```

---

**טיפ**: סמנו דף זה ואמצו את לחצן `Ctrl+F` כדי למצוא במהירות את הפקודות הדרושות לכם!

---

**ניווט**
- **שיעור קודם**: [בדיקות מראש](../docs/pre-deployment/preflight-checks.md)
- **השיעור הבא**: [מילון מונחים](glossary.md)

---

> **💡 רוצים עזרה בפקודות Azure בתוך עורך הטקסט שלכם?** התקינו את [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) עם `npx skills add microsoft/github-copilot-for-azure` — 37 מיומנויות ל-AI, Foundry, פריסה, אבחון ועוד.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לזכור כי תרגומים אוטומטיים עלולים לכלול טעויות או אי-דיוקים. יש להתייחס למסמך המקורי בשפת המקור כמקור הסמכותי. למידע קריטי מומלץ תרגום מקצועי על ידי אדם. אנחנו לא אחראים להיכשלויות בהבנה או בפרשנויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->