# יצירת תבנית azd משלך

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 4 - תשתית כקוד והפצה
- **⬅️ הקודם**: [מדריך הפצה](deployment-guide.md)
- **🚀 הפרק הבא**: [פרק 5: פתרונות Multi-Agent](../chapter-05-multi-agent/README.md)

> אומת עם `azd 1.27.1` ביולי 2026.

## מבוא

עד כה *צרכתם* תבניות עם `azd init --template <name>`. אבל ברגע שיש לכם סידור פרויקט שהצוות שלכם אוהב — למשל, אפליקציית Container עם Cosmos DB ומוניטורינג נכון — תרצו להפוך אותו לתבנית לשימוש חוזר משלכם. תבנית היא פשוט מאגר Git במבנה צפוי ש-azd יודע לקרוא. השיעור הזה מראה כיצד לבנות אחת מאפס, לבדוק אותה, ו(אופציונלי) לפרסם אותה לגלריית הקהילה.

## מטרות הלמידה

בסיום שיעור זה, תוכלו:
- להבין מה עושה תיקייה לתבנית "azd"
- להכיר את הקבצים ומבנה התיקיות הנדרשים
- להוסיף `azure.yaml` ו-`infra/` שאחרים יוכלו לשתף
- לבדוק את התבנית מקומית לפני שיתוף
- לפרסם אותה ו(אופציונלי) להגיש ל-Awesome AZD

## תוצאות למידה

לאחר שתסיימו שיעור זה, תוכלו:
- לספק מאגר תבניות חדש
- לפרמטר את התשתית כך שתעבוד בכל מינוי
- לאמת תבנית עם `azd init` ו-`azd up`
- להוסיף את המטא-דאטה שגלריית הקהילה דורשת

---

## מהי תבנית, בעצם?

תבנית azd היא **מאגר Git** המכיל, לפחות:

| קובץ / תיקייה | מטרה | נדרש? |
|---------------|---------|-----------|
| `azure.yaml` | מתאר שירותים, מארחים וספק תשתיות | ✅ כן |
| `infra/` | Bicep, Terraform או Pulumi שמספקים משאבים | ✅ כן |
| `src/` (או הקוד שלך) | קוד האפליקציה ש-azd מפעיל | ✅ כן |
| `README.md` | איך להשתמש בתבנית | ✅ מומלץ מאוד |
| `.azdo/` או `.github/` | הגדרות צנרת CI/CD | אופציונלי |
| `.devcontainer/` | סביבת פיתוח מתועדת | אופציונלי |
| `azure.yaml` `metadata` | מידע לגלריה + טלמטריה | אופציונלי (נדרש לפרסום) |

אין כאן קסם: כשאתה מפעיל `azd init --template you/your-repo`, azd משכפל את המאגר וקורא את `azure.yaml`.

---

## שלב 1: יצירת המבנה במאגר

צרו את מבנה התיקייה ידנית או התחילו מתבנית מינימלית וערכו אותה:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# צור את התפריט הסטנדרטי
mkdir -p src infra
```

סידור טיפוסי נראה כך:

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

## שלב 2: כתיבת `azure.yaml`

זהו הלב של התבנית. הוא אומר ל-azd מה לפרוס ואיך:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> השדה `metadata.template` הוא מה שגלריית הטלמטריה משתמשת בו לספירת שימושים. השתמשו בקונבנציה `name@version`.

---

## שלב 3: פרמטריזציה של התשתית

הכלל החשוב ביותר לתבנית *שניתנת לשימוש חוזר*: **לעולם אל תקבע שמות, אזורים, או ערכים ספציפיים למינוי קבועים בקוד.** השתמש בפרמטרים ובתבנית אסימון המשאב כך שהתבנית תעבוד במינוי של כל משתמש.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

שני דברים הופכים את התבנית לידידותית:

1. **תג `azd-env-name`** — azd משתמש בו לעקוב ולנקות משאבים לפי סביבה.
2. **אסימון משאב `uniqueString(...)`** — מייצר סיומת יציבה וייחודית עולמית כך ששמות לא יתנגשו.

ספקו קובץ פרמטרים תואם שקורא ערכים ש-azd מזריק מהסביבה:

```json
// infra/main.parameters.json
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

## שלב 4: בדקו את התבנית מקומית

לפני השיתוף, הוכיחו שהתבנית פועלת ממצב נקי.

**בדקו מתיקייה מקומית** (לא נדרש דחיפה ל-Git):

```bash
# מאינדקס ריק, אתחל באמצעות נתיב התבנית המקומי שלך
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# פרוויזיה + פריסה מקצה לקצה
azd auth login
azd up
```

**ואז בדקו את הפירוק** — תבנית טובה מנקה הכל לחלוטין:

```bash
azd down --force --purge
```

אם `azd down` משאיר משאבים, כנראה פספסתם את תג ה-`azd-env-name` על משאב מסוים.

> **טיפ:** הריצו קודם `azd provision --preview`. זה מבצע מה-אם ומוציא שגיאות תבנית לפני יצירת משאב.

---

## שלב 5: פרסום התבנית

דחפו את המאגר ל-GitHub (פומבי אם רוצים שאחרים ישתמשו בו):

```bash
gh repo create my-azd-template --public --source=. --push
```

כל אחד יכול עכשיו להשתמש בו:

```bash
azd init --template your-github-username/my-azd-template
```

---

## שלב 6 (אופציונלי): הגשה ל-Awesome AZD

[גלריית Awesome AZD](https://azure.github.io/awesome-azd/) מפרסמת תבניות קהילה. כדי להיכלל, על המאגר שלכם לכלול:

- ✅ קובץ `README.md` ברור עם דרישות, דיאגרמת ארכיטקטורה, והערות על עלויות
- ✅ `azure.yaml` תקין עם `metadata.template`
- ✅ תשתית שמספקת נקי במינוי חדש
- ✅ קובץ `LICENSE`
- ✅ (מומלץ) תיקיית `.devcontainer/` לסביבת Codespaces בלחיצה אחת

הגישו ע"י פתיחת Pull Request שמוסיף את התבנית שלכם לקובץ הנתונים של הגלריה, בהתאם למדריך התרומה ב-[מאגר Awesome AZD](https://github.com/Azure/awesome-azd).

---

## טעויות נפוצות

| טעות | תיקון |
|---------|-----|
| שמות משאבים נכתבו קבועות בקוד | השתמשו באסימון משאב `uniqueString()` |
| `azd down` משאיר משאבים | תייגו כל משאב (או את קבוצת המשאבים) עם `azd-env-name` |
| התבנית עובדת אצלכם, נכשלת אצל אחרים | הסירו מזהי מינוי, מזהי טננט, והנחות אזור |
| פלטים לא מחוברים לאפליקציה | ייצאו `SERVICE_<NAME>_ENDPOINT_URL` ופלטים אחרים של `AZURE_*` |
| הגשת גלריה נדחתה | הוסיפו `README.md`, `LICENSE`, ו-`metadata.template` |

---

## סיכום

- תבנית היא רק מאגר Git עם `azure.yaml`, `infra/`, והקוד שלך.
- פרמטרו הכל — שמות, אזורים, ומזהים — כדי שירוץ בכל מקום.
- תמיד תייגו משאבים עם `azd-env-name` כדי ש-`azd down` יעבוד.
- בדקו מקומית עם `azd init --template <local-path>` לפני הפרסום.
- הוסיפו מטא-דאטה וקובץ README לצורך הגשה ל-Awesome AZD.

---

## 🔗 ניווט

| כיוון | משאב |
|-----------|----------|
| **קודם** | [מדריך הפצה](deployment-guide.md) |
| **דף הבית של הפרק** | [פרק 4: תשתית כקוד](README.md) |
| **הפרק הבא** | [פרק 5: פתרונות Multi-Agent](../chapter-05-multi-agent/README.md) |

## 📖 משאבים קשורים

- [פריסת משאבים](provisioning.md)
- [גלריית Awesome AZD](https://azure.github.io/awesome-azd/)
- [תיעוד רשמי לתבניות azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->