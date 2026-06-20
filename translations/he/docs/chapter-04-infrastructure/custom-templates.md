# כתיבת תבנית azd משלך

**ניווט בין פרקים:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 4 - תשתיות כקוד ופריסה
- **⬅️ הקודם**: [מדריך פריסה](deployment-guide.md)
- **🚀 הפרק הבא**: [פרק 5: פתרונות רב-סוכניים](../chapter-05-multi-agent/README.md)

> מאומת מול `azd 1.25.6` ביוני 2026.

## מבוא

עד כה *צרכת* תבניות באמצעות `azd init --template <name>`. אבל ברגע שיש לך פריסת פרויקט שהצוות אוהב—נגיד, Container App עם Cosmos DB והניטור המתאים—תרצה להפוך אותה לתבנית שניתן להשתמש בה שוב ושוב. תבנית היא פשוט מאגר Git עם מבנה צפוי ש-azd יודע לקרוא. השיעור הזה מראה איך לבנות אחת מאפס, לבדוק אותה, ו(באופן אופציונלי) לפרסם אותה לגלריית הקהילה.

## מטרות הלימוד

By the end of this lesson, you will:
- להבין מה הופך תיקיה ל"תבנית azd"
- להכיר את הקבצים והמבנה הנדרשים
- להוסיף `azure.yaml` ו-`infra/` שאחרים יוכלו להשתמש בהם מחדש
- לבדוק את התבנית באופן מקומי לפני השיתוף
- לפרסם אותה ובאופן אופציונלי להגיש אותה ל-Awesome AZD

## תוצאות למידה

After completing this lesson, you will be able to:
- להקים מאגר תבנית חדש
- לפרמטר את התשתית כך שהיא תעבוד בכל מנוי
- לאמת תבנית עם `azd init` ו-`azd up`
- להוסיף את המטא־דאטה שגלריית הקהילה דורשת

---

## What Is a Template, Really?

An azd template is **a Git repository** that contains, at minimum:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | מתאר שירותים, מארחים וספק התשתית | ✅ כן |
| `infra/` | Bicep, Terraform או Pulumi שמפריסים משאבים | ✅ כן |
| `src/` (or your code) | קוד היישום ש-azd מפריס | ✅ כן |
| `README.md` | כיצד להשתמש בתבנית | ✅ מומלץ בחום |
| `.azdo/` or `.github/` | הגדרות צינור CI/CD | אופציונלי |
| `.devcontainer/` | סביבת פיתוח שניתן לשחזר | אופציונלי |
| `azure.yaml` `metadata` | מידע לגלריה וטלמטריה | אופציונלי (נדרש לפרסום) |

There is nothing magic here: when you run `azd init --template you/your-repo`, azd clones the repo and reads `azure.yaml`.

---

## Step 1: Scaffold the Repository

Create the folder structure by hand or start from a minimal template and edit it:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# צור את הפריסה הסטנדרטית
mkdir -p src infra
```

A typical finished layout looks like this:

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

## Step 2: Write `azure.yaml`

This is the heart of the template. It tells azd what to deploy and how:

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

> The `metadata.template` field is what gallery telemetry uses to count usage. Use the `name@version` convention.

---

## Step 3: Parameterize the Infrastructure

The single most important rule for a *reusable* template: **never hardcode names, regions, or subscription-specific values.** Use parameters and the resource token pattern so the same template works in anyone's subscription.

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

Two things make this template-friendly:

1. **`azd-env-name` tag** — azd uses it to track and clean up resources per environment.
2. **`uniqueString(...)` resource token** — produces a stable, globally-unique suffix so names don't collide.

Provide a matching parameters file that reads values azd injects from the environment:

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

azd substitutes `${AZURE_ENV_NAME}` and `${AZURE_LOCATION}` from the current environment automatically.

---

## Step 4: Test Your Template Locally

Before sharing, prove the template works from a clean state.

**Test from the local folder** (no Git push required):

```bash
# מתוך תיקייה ריקה, אתחל באמצעות נתיב התבנית המקומי שלך
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# הקמה + פריסה מקצה לקצה
azd auth login
azd up
```

**Then test the teardown**—a good template cleans up completely:

```bash
azd down --force --purge
```

If `azd down` leaves resources behind, you probably missed the `azd-env-name` tag on a resource.

> **טיפ:** הרץ `azd provision --preview` קודם. הוא מבצע what-if ומחשף שגיאות בתבנית לפני שנוצר משאב כלשהו.

---

## Step 5: Publish the Template

Push the repository to GitHub (public if you want others to use it):

```bash
gh repo create my-azd-template --public --source=. --push
```

Anyone can now use it:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

The [Awesome AZD gallery](https://azure.github.io/awesome-azd/) lists community templates. To be listed your repo should include:

- ✅ README.md ברור עם דרישות מקדמיות, דיאגרמת ארכיטקטורה והערות על עלויות
- ✅ `azure.yaml` עובד עם `metadata.template`
- ✅ תשתית שמפריסה באופן נקי במנוי חדש
- ✅ קובץ `LICENSE`
- ✅ (מומלץ) `.devcontainer/` ל-Codespaces בלחיצה אחת

Submit by opening a pull request that adds your template to the gallery's data file, following the contribution guide at the [מאגר Awesome AZD](https://github.com/Azure/awesome-azd).

---

## מכשולים נפוצים

| Pitfall | Fix |
|---------|-----|
| Hardcoded resource names | Use the `uniqueString()` resource token |
| `azd down` leaves resources | Tag every resource (or the resource group) with `azd-env-name` |
| Template works for you, fails for others | Remove subscription IDs, tenant IDs, and region assumptions |
| Outputs not wired into the app | Export `SERVICE_<NAME>_ENDPOINT_URL` and other `AZURE_*` outputs |
| Gallery submission rejected | Add `README.md`, `LICENSE`, and `metadata.template` |

---

## סיכום

- תבנית היא פשוט מאגר Git עם `azure.yaml`, `infra/`, והקוד שלך.
- פרמטר את הכל—שמות, אזורים ומזהים—כדי שתרוץ בכל מקום.
- תייג תמיד משאבים עם `azd-env-name` כך ש-`azd down` יעבוד.
- בדוק מקומית עם `azd init --template <local-path>` לפני פרסום.
- הוסף מטא־דאטה ו-README כדי להגיש ל-Awesome AZD.

---

## 🔗 ניווט

| כיוון | משאב |
|-----------|----------|
| **הקודם** | [מדריך פריסה](deployment-guide.md) |
| **בית הפרק** | [פרק 4: תשתיות כקוד](README.md) |
| **הפרק הבא** | [פרק 5: פתרונות רב-סוכניים](../chapter-05-multi-agent/README.md) |

## 📖 משאבים קשורים

- [פריסת משאבים](provisioning.md)
- [גלריית Awesome AZD](https://azure.github.io/awesome-azd/)
- [התיעוד הרשמי של תבניות azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->