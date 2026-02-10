# דף רמז לפקודות - פקודות AZD חיוניות

**עיון מהיר לכל הפרקים**
- **📚 דף קורס**: [AZD למתחילים](../README.md)
- **📖 התחלה מהירה**: [פרק 1: בסיס והתחלה מהירה](../README.md#-chapter-1-foundation--quick-start)
- **🤖 פקודות AI**: [פרק 2: פיתוח עם AI במרכז](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 מתקדם**: [פרק 4: תשתית כקוד](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## מבוא

דף הרמז המקיף הזה מספק עיון מהיר לפקודות הנפוצות ביותר של Azure Developer CLI, מאורגנות לפי קטגוריות עם דוגמאות מעשיות. מושלם לחיפושים מהירים במהלך פיתוח, פתרון בעיות ופעילות יומיומית עם פרויקטים של azd.

## מטרות הלמידה

בשימוש בדף רמז זה, תוכל:
- לקבל גישה מיידית לפקודות וסינטקס חיוניים של Azure Developer CLI
- להבין את ארגון הפקודות לפי קטגוריות פונקציונליות ומקרי שימוש
- להפנות דוגמאות מעשיות לתרחישים נפוצים של פיתוח ופריסה
- לגשת לפקודות פתרון בעיות לפתרון מהיר של תקלות
- למצוא אפשרויות מתקדמות להתאמה וקונפיגורציה ביעילות
- לאתר פקודות ניהול סביבה ותהליכי עבודה מרובי סביבות

## תוצאות הלמידה

עם הפנייה קבועה לדף רמז זה, תוכל:
- להריץ פקודות azd בביטחון ללא צורך בהתייחסות לתיעוד מלא
- לפתור במהירות בעיות נפוצות באמצעות פקודות אבחון מתאימות
- לנהל ביעילות סביבות ותרחישי פריסה מרובים
- ליישם תכונות קצה ואפשרויות קונפיגורציה מתקדמות לפי הצורך
- לטפל בבעיות פריסה באמצעות רצפים שיטתיים של פקודות
- לאפיין תהליכי עבודה באמצעות קיצורי דרך ואפשרויות azd יעילים

## פקודות התחלה

### אימות
```bash
# התחבר ל-Azure דרך AZD
azd auth login

# התחבר ל-Azure CLI (AZD משתמש בזה ברמה הפנימית)
az login

# בדוק חשבון נוכחי
az account show

# הגדר את המנוי ברירת המחדל
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# התנתק מ-AZD
azd auth logout

# התנתק מ-Azure CLI
az logout
```

### התחלת פרויקט
```bash
# עיין בתבניות הזמינות
azd template list

# אתחל מתבנית
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# אתחל בספרייה הנוכחית
azd init .

# אתחל עם שם מותאם אישית
azd init --template todo-nodejs-mongo my-awesome-app
```

## פקודות פריסה מרכזיות

### תהליך פריסה מלא
```bash
# פרוס הכל (הקמה + פריסה)
azd up

# פרוס ללא בקשות אישור
azd up --confirm-with-no-prompt

# פרוס לסביבה מסוימת
azd up --environment production

# פרוס עם פרמטרים מותאמים אישית
azd up --parameter location=westus2
```

### תשתית בלבד
```bash
# סיפוק משאבי Azure
azd provision

# 🧪 תצוגה מוקדמת של שינויים בתשתית
azd provision --preview
# מציג תצוגת הרצה יבשה של אילו משאבים ייווצרו/יעודכנו/יימחקו
# דומה ל-'terraform plan' או ל-'bicep what-if' - בטוח להרצה, ללא יישום שינויים
```

### אפליקציה בלבד
```bash
# לפרוס קוד יישום
azd deploy

# לפרוס שירות מסוים
azd deploy --service web
azd deploy --service api

# לפרוס את כל השירותים
azd deploy --all
```

### בנייה ואריזה
```bash
# לבנות יישומים
azd package

# לבנות שירות מסוים
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

# הצג את כל משתני הסביבה
azd env get-values

# הסר משתנה סביבה
azd env unset DEBUG
```

## ⚙️ פקודות קונפיגורציה

### קונפיגורציה גלובלית
```bash
# רשום את כל ההגדרות
azd config list

# הגדר ברירות מחדל כלליות
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# הסר הגדרה
azd config unset defaults.location

# איפוס כל ההגדרות
azd config reset
```

### קונפיגורציה לפרויקט
```bash
# לאמת את azure.yaml
azd config validate

# להציג מידע על הפרויקט
azd show

# לקבל נקודות קצה של שירותים
azd show --output json
```

## 📊 ניטור ואבחון

### לוח ניטור
```bash
# פתח לוח בקרה למעקב בפורטל Azure
azd monitor

# פתח מדדים חיים של Application Insights
azd monitor --live

# פתח לוח יומנים ב-Application Insights
azd monitor --logs

# פתח סקירה כללית של Application Insights
azd monitor --overview
```

### צפייה ביומני מכולות
```bash
# הצג יומני רישום דרך Azure CLI (לתמיכות מכולה)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# עקוב אחרי יומני רישום בזמן אמת
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# הצג יומני רישום מפורטל Azure
azd monitor --logs
```

### שאילתות לוג אנליטיקס
```bash
# גש לאנליטיקת יומני גישה דרך פורטל Azure
azd monitor --logs

# שאילת יומנים באמצעות Azure CLI
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
# בדוק עדכונים ל-azd
azd version

# קבל את הגרסה הנוכחית
azd version

# הצג תצורה נוכחית
azd config list
```

## 🔧 פקודות מתקדמות

### צינור ועבודות CI/CD
```bash
# הגדר פעולות GitHub
azd pipeline config

# הגדר Azure DevOps
azd pipeline config --provider azdo

# הצג קונפיגורציית צינור העבודה
azd pipeline show
```

### ניהול תשתית
```bash
# צור תבניות תשתית
azd infra generate

# 🧪 תצוגה ותכנון תשתית
azd provision --preview
# מדמה פריסת תשתית ללא פריסה בפועל
# מנתח תבניות Bicep/Terraform ומציג:
# - משאבים להוספה (ירוק +)
# - משאבים לשינוי (צהוב ~)
# - משאבים למחיקה (אדום -)
# בטוח להרצה - לא נעשו שינויים בפועל בסביבת Azure

# מסנתז תשתית מ-azure.yaml
azd infra synth
```

### מידע על פרויקט
```bash
# הצג את מצב הפרויקט והנקודות קצה
azd show

# הצג פרטים מפורטים של הפרויקט בפורמט JSON
azd show --output json

# קבל נקודות קצה של השירות
azd show --output json | jq '.services'
```

## 🎯 תהליכי עבודה מהירים

### תהליך עבודה לפיתוח
```bash
# התחלת פרויקט חדש
azd init --template todo-nodejs-mongo
cd my-project

# פריסה לסביבת פיתוח
azd env new dev
azd up

# בצע שינויים ופרוס מחדש
azd deploy

# פתח לוח מחוונים למעקב
azd monitor --live
```

### תהליך עבודה מרובה סביבות
```bash
# הגדר סביבת עבודה
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

### תהליך פתרון בעיות
```bash
# אפשר מצב ניפוי שגיאות
export AZD_DEBUG=true

# בדוק את מצב הפריסה
azd show

# אמת את התצורה
azd config list

# פתח לוח בקרה למעקב אחרי היומנים
azd monitor --logs

# בדוק את מצב המשאבים
azd show --output json
```

## 🔍 פקודות דיבוג

### מידע דיבוג
```bash
# הפעלת פלט ניפוי שגיאות
export AZD_DEBUG=true
azd <command> --debug

# השבתת טלמטריה לפלט נקי יותר
export AZD_DISABLE_TELEMETRY=true

# בדיקת התצורה הנוכחית
azd config list

# בדיקת מצב האימות
az account show
```

### דיבוג תבניות
```bash
# הצג תבניות זמינות עם פרטים
azd template list --output json

# הצג מידע על התבנית
azd template show <template-name>

# אמת את התבנית לפני האתחול
azd template validate <template-name>
```

## 📁 פקודות קבצים ותיקיות

### מבנה פרויקט
```bash
# הצג מבנה תיקיית עבודה נוכחי
tree /f  # ווינדוס
find . -type f  # לינוקס/מק

# נווט לשורש פרויקט azd
cd $(azd root)

# הצג תיקיית תצורת azd
echo $AZD_CONFIG_DIR  # בדרך כלל ~/.azd
```

## 🎨 עיצוב פלט

### פלט JSON
```bash
# לקבל פלט JSON עבור סקריפטים
azd show --output json
azd env list --output json
azd config list --output json

# לנתח עם jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### פלט טבלה
```bash
# עיצוב כטבלה
azd env list --output table

# הצג שירותים שפורסמו
azd show --output json | jq '.services | keys'
```

## 🔧 שילובי פקודות נפוצים

### סקריפט בדיקת בריאות
```bash
#!/bin/bash
# בדיקת בריאות מהירה
azd show
azd env show
azd monitor --logs
```

### אימות פריסה
```bash
#!/bin/bash
# אימות טרום פריסה
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
# אפס אימות
az account clear
az login

# כפה רענון סביבה
azd env refresh

# פרוס מחדש את כל השירותים
azd deploy

# בדוק מצב פריסה
azd show --output json
```

### פקודות שחזור
```bash
# לשחזר מהתקנה שנכשלה - לנקות ולהתקין מחדש
azd down --force --purge
azd up

# לפרוס מחדש את התשתית בלבד
azd provision

# לפרוס מחדש את היישום בלבד
azd deploy
```

## 💡 טיפים מקצועיים

### כינויים לתהליך עבודה מהיר יותר
```bash
# הוסף ל-.bashrc או ל-.zshrc שלך
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

# עזרה ספציפית לפקודה
azd up --help
azd env --help
azd config --help

# הצג מידע על גרסה ובנייה
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

**טיפ**: סמנו דף רמז זה ושימוש ב-`Ctrl+F` כדי למצוא במהירות את הפקודות הדרושות!

---

**ניווט**
- **שיעור קודם**: [בדיקות מקדימות](../docs/pre-deployment/preflight-checks.md)
- **שיעור הבא**: [לקסיקון](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור שלו יש להתייחס אליו כמקור הסמכותי. למידע קריטי מומלץ להשתמש בתרגום מקצועי אנושי. אנו לא נישא באחריות לכל אי הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->