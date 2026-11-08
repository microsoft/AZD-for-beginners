# יצירת תבנית azd משלך

**ניווט פרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 4 - תשתית כקוד ופריסה
- **⬅️ קודם**: [מדריך פריסה](deployment-guide.md)
- **🚀 הפרק הבא**: [פרק 5: פתרונות עם סוכנים מרובים](../chapter-05-multi-agent/README.md)

> נבדק מול `azd 1.37.2` (נובמבר 2026). זהו **מדריך יצירה עם קבצים חלקיים**, לא תבנית מלאה: עליך לספק קוד יישום ו-`modules/web.bicep` עם הסביבה שלו, הרישום, Container App והפלטים לפני הפריסה. הפריסה לא בוצעה בסקירה זו.

## מבוא

עד כה *צרכת* תבניות עם `azd init --template <name>`. אבל ברגע שיש לך סידור פרויקט שהצוות שלך אוהב — למשל, Container App עם Cosmos DB וניטור מתאים — תרצה להפוך אותו לתבנית שניתן לשימוש חוזר משלך. תבנית היא בעצם מאגר Git עם מבנה צפוי ש-azd יודע לקרוא. שיעור זה מראה לך כיצד לבנות אחת מאפס, לבדוק אותה, (אופציונלי) לפרסם אותה לגלריית הקהילה.

## מטרות הלמידה

בסיום השיעור, תוכל:
- להבין מה עושה תיקיה ל"תבנית azd"
- להכיר את הקבצים והמבנה הדרושים
- להוסיף `azure.yaml` ו-`infra/` שאחרים יוכלו להשתמש בהם מחדש
- לבדוק את התבנית שלך מקומית לפני השיתוף
- לפרסם (ואופציונלי) לשלוח ל-Awesome AZD

## תוצאות למידה

לאחר השלמת השיעור, תוכל:
- לשרטט מאגר תבנית חדש
- לפרמטר את התשתית כך שתפעל בכל מנוי
- לאמת תבנית עם `azd init` ו-`azd up`
- להוסיף את המטא-נתונים שגלריית הקהילה דורשת

---

## מהי תבנית, בעצם?

תבנית azd היא **מאגר Git** שמכיל, לפחות:

| קובץ / תיקיה | מטרה | דרוש? |
|---------------|---------|-----------|
| `azure.yaml` | מתאר שירותים, מארחים וספק תשתית | ✅ כן |
| `infra/` | הגדרות פריסה ב-Bicep או Terraform | דרוש בדוגמה זו של IaC מפורש; ניתן לוותר בפרויקטים עם תשתית במקור |
| `src/` (או הקוד שלך) | קוד היישום ש-azd מפריסה | דרוש לשירותים המובססים על מקור; לא כל התבניות מכילות קוד יישום |
| `README.md` | איך להשתמש בתבנית | ✅ מומלץ מאוד |
| `.azdo/` או `.github/` | הגדרות צנרת CI/CD | אופציונלי |
| `.devcontainer/` | סביבת פיתוח שניתן לשחזר | אופציונלי |
| `azure.yaml` `metadata` | מידע על הזהות/טלמטריה של התבנית | מומלץ; פרסום מאגר Git אינו דורש זאת |

אין כאן קסם: כשאתה מפעיל `azd init --template you/your-repo`, azd משכפל את המאגר וקורא את `azure.yaml`.

---

## שלב 1: סקלד את המאגר

צור את מבנה התיקיות ביד או התחל מתבנית מינימלית וערוך אותה:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

סידור טיפוסי וסופי נראה כך:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## שלב 2: כתוב `azure.yaml`

זה הלב של התבנית. הוא אומר ל-azd מה לפרוס ואיך:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> השדה `metadata.template` הוא מה שטלמטריית הגלריה משתמשת בו לספירת שימוש. השתמש בקונבנציית `name@version`.

---

## שלב 3: פרמטר את התשתית

הכלל הכי חשוב לתבנית *שניתנת לשימוש חוזר*: **לעולם אל תקודד שמות, אזורים או ערכים ספציפיים למנוי.** השתמש בפרמטרים ובתבנית אסימון המשאבים כדי שהתבנית תעבוד במנוי של כל אחד.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

שני דברים הופכים את זה לידידותי לתבנית:

1. **תג `azd-env-name`** — azd משתמש בו למעקב וניקוי משאבים לפי סביבה.
2. **אסימון משאבים `uniqueString(...)`** — מייצר סיומת hash יציבה להפחתת התנגשויות; אינו מבטיח ייחודיות גלובלית.

ה-`modules/web.bicep` החסר חייב לקבל `name`, `location`, ו-`tags`, לפרוס את סביבת/רשימת Container Apps והאפליקציה, לתייג את האפליקציה עם `azd-service-name: web`, ולייצא `uri`. הוא חייב גם לחשוף ערכי רישום נדרשים על ידי זרימת הבנייה/הפריסה הנבחרת (לדוגמה `AZURE_CONTAINER_REGISTRY_ENDPOINT` מהמודול הראשי). פלט נקודת קצה בלבד לא מחבר גילוי שירות, הגדרות אפליקציה, או אימות רישום.

ספק קובץ פרמטרים תואם שקורא ערכים שאzd מזריק מהסביבה:

שמור את הבא כ-`infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd מחליף אוטומטית את `${AZURE_ENV_NAME}` ו-`${AZURE_LOCATION}` מהסביבה הנוכחית.

---

## שלב 4: בדוק את התבנית שלך מקומית

לפני השיתוף, הוכח שהתבנית עובדת ממצב נקי.

**בדוק מהתיקיה המקומית** (אין צורך בדחיפת Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**ואז בדוק את הפירוק**—תבנית טובה מנקה לגמרי:

```bash
azd down --force --purge
```

אם `azd down` משאיר משאבים מאחור, בדוק גילוי סביבת עבודה / קבוצת משאבים, משאבים חיצוניים/משותפים, הרשאות, נעילות והגנה מפני ניקוי. `--purge` אינו מוחק מצב מקומי של `.azure/`.

> **טיפ:** לאחר שסיפקת את כל הקבצים החסרים, הפעל `azd provision --preview` קודם. בדוק את ה-hooks לפני התצוגה המקדימה כי הם עלולים להריץ פקודות עם תופעות לוואי. תצוגה מקדימה אינה הערכת מחיר או הבטחה שהפריסה תצליח.

---

## שלב 5: פרסם את התבנית

דחוף את המאגר ל-GitHub (ציבורי אם תרצה שאחרים ישתמשו בו):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

עכשיו כל אחד יכול להשתמש בה:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## שלב 6 (אופציונלי): שלח ל-Awesome AZD

ה-[גלריית Awesome AZD](https://azure.github.io/awesome-azd/) רושמת תבניות קהילתיות. כדי להיכלל, המאגר שלך צריך לכלול:

- ✅ `README.md` ברור עם דרישות מוקדמות, דיאגרמת ארכיטקטורה, והערות על עלויות
- ✅ `azure.yaml` עובד עם `metadata.template`
- ✅ תשתית שמופרסה נקיה במנוי חדש
- ✅ קובץ `LICENSE`
- ✅ (מומלץ) `.devcontainer/` לקודספרייס בלחיצה אחת

שלח על ידי פתיחת בקשת משיכה שמוסיפה את התבנית שלך לקובץ הנתונים של הגלריה, לפי מדריך התרומה במאגר ה-[Awesome AZD](https://github.com/Azure/awesome-azd).

---

## טעויות נפוצות

| טעות | תיקון |
|---------|-----|
| שמות משאב מקודדים | השתמש באסימון המשאבים `uniqueString()` |
| `azd down` משאיר משאבים | סמן כל משאב (או את קבוצת המשאבים) עם `azd-env-name` |
| התבנית עובדת עבורך, נכשלה לאחרים | הסר מזהים של מנויים, מזהי שוכנים והנחות אזור |
| פלטים לא מחוברים לאפליקציה | תאם `azd-service-name`/`resourceName` לפריסה ומפה במפורש את הפלטים להגדרות האפליקציה |
| שליחת גלריה נדחתה | הוסף `README.md`, `LICENSE`, ו-`metadata.template` |

---

## סיכום

- תבנית היא פשוט מאגר Git עם `azure.yaml`, `infra/`, והקוד שלך.
- פרמטר הכל — שמות, אזורים ומזהים — כדי שירוץ בכל מקום.
- תמיד סמן משאבים עם `azd-env-name` כדי ש-`azd down` יעבוד.
- בדוק מקומית עם `azd init --template <local-path>` לפני הפרסום.
- הוסף מטא-נתונים ו-README לשליחה ל-Awesome AZD.

---

## 🔗 ניווט

| כיוון | משאב |
|-----------|----------|
| **קודם** | [מדריך פריסה](deployment-guide.md) |
| **בית פרק** | [פרק 4: תשתית כקוד](README.md) |
| **הפרק הבא** | [פרק 5: פתרונות עם סוכנים מרובים](../chapter-05-multi-agent/README.md) |

## 📖 משאבים קשורים

- [פריסת משאבים](provisioning.md)
- [גלריית Awesome AZD](https://azure.github.io/awesome-azd/)
- [תיעוד רשמי של תבניות azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->