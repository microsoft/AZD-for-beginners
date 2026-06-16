# גיליון פקודות - פקודות AZD חיוניות

**התייחסות מהירה לכל הפרקים**
- **📚 דף ראשי לקורס**: [AZD למתחילים](../README.md)
- **📖 התחלה מהירה**: [פרק 1: יסוד והתחלה מהירה](../README.md#-chapter-1-foundation--quick-start)
- **🤖 פקודות AI**: [פרק 2: פיתוח מונחה AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 מתקדם**: [פרק 4: תשתית כקוד](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## מבוא

גיליון הפקודות המקיף הזה מספק התייחסות מהירה לפקודות Azure Developer CLI הנפוצות ביותר, מאורגנות לפי קטגוריות עם דוגמאות מעשיות. מושלם לחיפוש מהיר במהלך הפיתוח, פתרון תקלות, ופעולות יומיות עם פרויקטים של azd.

## יעדי הלמידה

בשימוש בגיליון הפקודות הזה, תוכלו:
- לקבל גישה מיידית לפקודות ותחביר חיוניים של Azure Developer CLI
- להבין את ארגון הפקודות לפי קטגוריות פונקציונליות ומקרי שימוש
- להתייחס לדוגמאות מעשיות לתרחישים נפוצים של פיתוח ופריסה
- לגשת לפקודות פתרון תקלות לפתרון מהיר של בעיות
- למצוא אפשרויות תצורה והתאמה אישית מתקדמות ביעילות
- לאתר פקודות לניהול סביבות וזרימות עבודה מרובות סביבות

## תוצאות הלמידה

בהתייחסות סדירה לגיליון הפקודות הזה, תוכלו:
- להפעיל פקודות azd בביטחון ללא צורך בהתייחסות לתיעוד מלא
- לפתור במהירות בעיות נפוצות באמצעות פקודות אבחון מתאימות
- לנהל ביעילות סביבות מרובות ותסריטי פריסה
- ליישם תכונות azd מתקדמות ואפשרויות תצורה לפי הצורך
- לאבחן בעיות פריסה באמצעות רצפי פקודות שיטתיים
- לייעל זרימות עבודה באמצעות שימוש אפקטיבי בקיצורי דרך ואפשרויות של azd

## פקודות התחלה

### אימות
```bash
# התחבר ל-Azure דרך AZD
azd auth login

# התחבר ל-Azure CLI (AZD משתמש בזה ברקע)
az login

# בדוק את החשבון הנוכחי
az account show

# קבע את המנוי כברירת מחדל
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# התנתק מ-AZD
azd auth logout

# התנתק מ-Azure CLI
az logout
```

### אתחול פרויקט
```bash
# דפדף בתבניות זמינות
azd template list

# אתחל מתוך תבנית
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# אתחל בתיקייה הנוכחית
azd init .

# אתחל עם שם מותאם אישית
azd init --template todo-nodejs-mongo my-awesome-app
```

## פקודות מרכזיות לפריסה

### זרימת עבודה מלאה של פריסה
```bash
# פרוס הכל (הקצאה + פריסה)
azd up

# פרוס עם בקשות אישור מושבתות
azd up --confirm-with-no-prompt

# פרוס לסביבה ספציפית
azd up --environment production

# פרוס עם פרמטרים מותאמים אישית
azd up --parameter location=westus2
```

### תשתית בלבד
```bash
# הקצאת משאבי Azure
azd provision

# 🧪 תצוגה מקדימה של שינויים בתשתית
azd provision --preview
# מציג תצוגת ניסיון יבשה של אילו משאבים ייווצרו/ישונו/יימחקו
# דומה ל-'terraform plan' או 'bicep what-if' - בטוח להרצה, ללא יישום שינויים
```

### אפליקציה בלבד
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
# שיחזור (הורדה) של תלותים של האפליקציה
azd restore

# שיחזור שירות ספציפי
azd restore --service api

# לבנות ארטיפקט שניתן לפרוס מבלי לפרוס
azd package

# לבנות שירות ספציפי
azd package --service api
```

> **`azd restore`** מוריד את התלויות של האפליקציה שלך (npm, pip, NuGet, Maven, וכו'). הפקודה רצה אוטומטית במהלך `azd package` ו- `azd deploy`, אז כמעט ולא קוראים לה ישירות—הרץ אותה באופן ידני כדי להוריד מראש תלויות (למשל, כדי לחמם מטמון CI או לעבוד אופליין לאחר מכן).

> **`azd package`** יוצר את הארכיון לפריסה (תמונה של מכולה או קובץ zip) **בלי** לדחוף אותו לאזור Azure. השתמש בה לבדוק שהבנייה מצליחה, לבחון את התוצאה, או לייצר ארכיון שתהליך נפרד יפרוס מאוחר יותר. `azd deploy` מבצע אריזה באופן אוטומטי, לכן אתה צריך את `azd package` רק כשאתה רוצה את הארכיון בלי לפרוס.

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
# קבע משתנה סביבה
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# קבל משתנה סביבה
azd env get API_KEY

# רשום את כל משתני הסביבה
azd env get-values

# הסר משתנה סביבה
azd env unset DEBUG
```

## ⚙️ פקודות תצורה

### תצורה כללית
```bash
# רשום את כל ההגדרות
azd config show

# הגדר ברירות מחדל גלובליות
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# הסר הגדרה
azd config unset defaults.location

# אפס את כל ההגדרות
azd config reset
```

### תצורת פרויקט
```bash
# לאמת azure.yaml
azd config validate

# להציג מידע על הפרויקט
azd show

# לקבל נקודות קצה של השירות
azd show --output json
```

## 📊 ניטור ואבחון

### לוח בקרה לניטור
```bash
# פתח את לוח המחוונים למעקב של פורטל Azure
azd monitor

# פתח מדדים חיים של Application Insights
azd monitor --live

# פתח את לוח הלוגים של Application Insights
azd monitor --logs

# פתח את סקירת Application Insights
azd monitor --overview
```

### צפייה ביומני מכולות
```bash
# הצג יומנים דרך Azure CLI (עבור אפליקציות קונטיינר)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# עקוב אחר יומנים בזמן אמת
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# הצג יומנים מפורטל Azure
azd monitor --logs
```

### שאילתות לניתוח יומנים
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

# מחיקה בכח ללא אישור
azd down --force

# נקה את המשאבים שנמחקו באופן רך
azd down --purge

# ניקוי מלא
azd down --force --purge
```

### עדכונים
```bash
# בדוק עדכונים ל-azd
azd version

# קבל את הגרסה הנוכחית
azd version

# הצג את התצורה הנוכחית
azd config show
```

## 🔧 פקודות מתקדמות

### צנרת ו- CI/CD
```bash
# הגדר פעולות GitHub
azd pipeline config

# הגדר Azure DevOps
azd pipeline config --provider azdo

# הצג הגדרת צינור עבודה
azd pipeline show
```

### ניהול תשתית
```bash
# יצירת תבניות תשתית
azd infra generate

# 🧪 תצוגה מקדימה ותכנון של תשתית
azd provision --preview
# מדמה פריסת תשתית ללא פריסה בפועל
# מנתח תבניות Bicep/Terraform ומציג:
# - משאבים שיוספו (ירוק +)
# - משאבים שישונו (צהוב ~)
# - משאבים שיוסרו (אדום -)
# בטוח להרצה - לא נעשו שינויים בפועל בסביבת Azure

# סינתזת תשתית מ-azure.yaml
azd infra synth
```

### מידע על הפרויקט
```bash
# הצג סטטוס פרויקט ונקודות קצה
azd show

# הצג מידע מפורט של הפרויקט כ-JSON
azd show --output json

# קבל נקודות קצה של השירות
azd show --output json | jq '.services'
```

## 🤖 פקודות AI ותוספים

### תוספי AZD
```bash
# רשום את כל התוספים הזמינים (כולל AI)
azd extension list

# התקן את תוסף הסוכנים של Foundry
azd extension install azure.ai.agents

# התקן את תוסף מיומנויות הסוכן (תצוגה מקדימה)
azd extension install azure.ai.skills

# התקן את תוסף החיבורים של Foundry (תצוגה מקדימה)
azd extension install azure.ai.connections

# התקן את תוסף ההתאמה המדויקת
azd extension install azure.ai.finetune

# התקן את תוסף הדגמים המותאמים אישית
azd extension install azure.ai.models

# שדרג את כל התוספים המותקנים
azd extension upgrade --all
```

### פקודות סוכן AI
```bash
# לאתחל פרויקט סוכן ממניפסט
azd ai agent init -m <manifest-path-or-uri>

# לטרגט פרויקט Foundry ספציפי
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# לציין את תיקיית מקור הסוכן
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# לבחור יעד אירוח
azd ai agent init -m agent-manifest.yaml --host containerapp

# לבדוק סוכן שהופעל (מדפיס השהייה + זמן לבייט הראשון)
azd ai agent invoke

# להציג את תצורת נקודת הקצה החיה
azd ai agent endpoint show

# ליצור מערך נתוני הערכה, ואז לאופטם את הסוכן
azd ai agent eval generate
azd ai agent optimize

# להוריד את מקור הסוכן המופעל מבוסס קוד
azd ai agent code download

# למחוק סוכן מאוחסן ואת כל הגרסאות שלו (--force מסיים מושבים פעילים)
azd ai agent delete --force
```

### שרת MCP (אלפא)
```bash
# הפעל את שרת MCP עבור הפרויקט שלך
azd mcp start

# נהל את הסכמת הכלים עבור פעולות MCP
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

# לפרוס לסביבת הפיתוח
azd env new dev
azd up

# לבצע שינויים ולפרוס מחדש
azd deploy

# לפתוח לוח בקרה של ניטור
azd monitor --live
```

### זרימת עבודה מרובת סביבות
```bash
# הגדרת סביבות
azd env new dev
azd env new staging  
azd env new production

# פריסה לסביבת פיתוח
azd env select dev
azd up

# בדיקה וקידום לסביבת ביניים
azd env select staging
azd up

# פריסה לסביבת ייצור
azd env select production
azd up
```

### זרימת עבודה לפתרון תקלות
```bash
# הפעל מצב דיבאג
export AZD_DEBUG=true

# בדוק מצב פריסה
azd show

# אמת תצורה
azd config show

# פתח לוח בקרה לניטור יומנים
azd monitor --logs

# בדוק מצב משאבים
azd show --output json
```

## 🔍 פקודות דיבוג

### מידע דיבוג
```bash
# הפעל פלט ניפוי שגיאות
export AZD_DEBUG=true
azd <command> --debug

# השבת טלמטריה לפלט נקי יותר
export AZD_DISABLE_TELEMETRY=true

# בדוק את ההגדרות הנוכחיות
azd config show

# בדוק את מצב האימות
az account show
```

### דיבוג תבניות
```bash
# רשום תבניות זמינות עם פרטים
azd template list --output json

# הצג מידע על התבנית
azd template show <template-name>

# אמת את התבנית לפני אתחול
azd template validate <template-name>
```

## 📁 פקודות קבצים וספריות

### מבנה הפרויקט
```bash
# הצג את מבנה התיקיה הנוכחי
tree /f  # חלונות
find . -type f  # לינוקס/מק

# נווט לשורש פרויקט azd
cd $(azd root)

# הצג תיקיית ההגדרות של azd
echo $AZD_CONFIG_DIR  # בדרך כלל ~/.azd
```

## 🎨 עיצוב פלט

### פלט JSON
```bash
# לקבל פלט JSON לסקריפטים
azd show --output json
azd env list --output json
azd config show --output json

# לנתח עם jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### פלט טבלה
```bash
# עיצוב כטבלה
azd env list --output table

# הצג שירותים שהופעלו
azd show --output json | jq '.services | keys'
```

## 🔧 שילובים נפוצים של פקודות

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
azd provision --preview  # הצג שינויים לפני הפריסה
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
# ניקוי סביבת עבודה ישנה
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

# תצורת אפליקציה
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 פקודות חרום

### תיקונים מהירים
```bash
# איפוס אימות
az account clear
az login

# כפיית רענון סביבה
azd env refresh

# פריסה מחדש של כל השירותים
azd deploy

# בדוק את סטטוס הפריסה
azd show --output json
```

### פקודות שחזור
```bash
# להתאושש מהפריסה שנכשלה - לנקות ולפרוס מחדש
azd down --force --purge
azd up

# לספק תשתית מחדש בלבד
azd provision

# לפרוס את היישום מחדש בלבד
azd deploy
```

## 💡 טיפים מקצועיים

### כינויים לזרימת עבודה מהירה יותר
```bash
# הוסף ל-.bashrc או .zshrc שלך
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### קיצורי פונקציות
```bash
# החלפת סביבה מהירה
azd-env() {
    azd env select $1 && azd show
}

# פריסה מהירה עם ניטור
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# סטטוס הסביבה
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

# הצג גרסה ומידע על הבנייה
azd version
azd version --output json
```

### קישורים לתיעוד
```bash
# פתח תיעוד בדפדפן
azd docs

# הצג תיעוד תבנית
azd template show <template-name> --docs
```

---

**טיפ**: שמור דף זה במועדפים והשתמש ב- `Ctrl+F` כדי למצוא במהירות את הפקודות שאתה צריך!

---

**ניווט**
- **שיעור קודם**: [בדיקות לפני פריסה](../docs/pre-deployment/preflight-checks.md)
- **שיעור הבא**: [מילון מונחים](glossary.md)

---

> **💡 רוצים עזרה בפקודות Azure בתוך העורך שלכם?** התקינו את [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) באמצעות `npx skills add microsoft/github-copilot-for-azure` — 37 מיומנויות ל-AI, Foundry, פריסה, אבחון ועוד.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->