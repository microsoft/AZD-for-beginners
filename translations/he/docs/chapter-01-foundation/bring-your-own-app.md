# Bring Your Own App - Add azd to an Existing Project

**ניווט בפרקים:**
- **📚 דף הקורס**: [AZD For Beginners](../../README.md)
- **📖 הפרק הנוכחי**: Chapter 1 - Foundation & Quick Start
- **⬅️ הקודם**: [Your First Project](first-project.md)
- **➡️ הבא**: [Dev Containers & Codespaces](dev-containers.md)

> אומת נגד `azd 1.25.6` ביוני 2026.

## Introduction

ב-[Your First Project](first-project.md) פרסת אפליקציה באמצעות התחלה מתבנית. אבל ברוב המקרים כבר יש לך אפליקציה—API ב-Node.js, שירות Flask ב-Python, אפליקציית .NET—שנמצאת בתיקייה במחשב שלך. שיעור זה מראה כיצד להוסיף azd לקוד קיים כך שתוכל לפרוס אותו עם `azd up`, ללא צורך בתבנית.

## Learning Goals

בסוף שיעור זה תדע:
- להבין את שלוש הדרכים להפעיל פרויקט azd
- להריץ `azd init` בתוך בסיס קוד קיים
- להבין מה עושים `azure.yaml` ותיקיית `infra/` עבור האפליקציה שלך
- לדעת מתי לתת ל-azd לייצר תשתית ומתי לכתוב אחת בעצמך
- לפרוס את האפליקציה הקיימת שלך ל-Azure עם `azd up`

## Learning Outcomes

בסיום שיעור זה תוכל:
- לאתחל azd בפרויקט שכבר יש לך
- לקרוא ולערוך קובץ `azure.yaml` בסיסי
- לייצר תשתית התחלתית עם `azd infra generate`
- לבחור מארח Azure מתאים לאפליקציה שלך
- לפרוס ולנקות את האפליקציה שלך

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | למידה, או התחלת אפליקציה חדשה מתוך דוגמה מוכחת |
| **From your existing code** | `azd init` (in your project folder) | כבר יש לך אפליקציה ואתה רוצה לפרוס אותה |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | אימוץ azd למחסן קוד קיים |

כבר התאמנת על האפשרות הראשונה. שיעור זה מקיף את השנייה—התסריט הנפוץ ביותר במציאות.

---

## Step 1: Run `azd init` in Your Project

Open a terminal **inside your existing project folder** and run:

```bash
cd my-existing-app
azd init
```

azd will ask how you want to initialize. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pick **"Use code in the current directory."** azd then scans your folder, detects your language and framework, and proposes a host.

### What azd detects

azd מחפש רמזים כמו `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, או `Dockerfile`, ומציע מארח Azure תואם:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

אשר את השירות(ים) שזוהו, ו-azd ייצור את הקבצים שאתה צריך.

---

## Step 2: Understand What azd Created

After init, you'll have two new things in your project:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — the project definition

This is the heart of an azd project. A minimal one looks like this:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

בלוק ה-`services` הוא החלק המרכזי: כל רשומה ממפה תיקייה של הקוד שלך למארח ב-Azure. אם לאפליקציה שלך יש גם frontend וגם API, יהיו לך שני שירותים.

### `infra/` — your Azure resources as code

תיקיית `infra/` מכילה קבצי Bicep שמגדירים את משאבי ה-Azure שהאפליקציה שלך זקוקה להם (App Service, מסד נתונים וכו'). לא חייבים לכתוב אותם ידנית—azd יוצר נקודת התחלה עובדת. תוכל לערוך אותם מאוחר יותר כדי להוסיף משאבים או לחזק אבטחה (מוסבר ב-[Chapter 4](../chapter-04-infrastructure/README.md)).

> **טיפ:** רוצים לראות או להתאים אישית את התשתית שנוצרה לפני הפריסה? הריצו `azd infra generate` (זמין גם כ-`azd infra synth`) כדי לכתוב את ה-IaC לדיסק כך שתוכלו לעיין בו ולנהל אותו בגרסאות.

---

## Step 3: Set Required Configuration

If your app needs settings or secrets (a connection string, an API key), don't hardcode them. Use environment values:

```bash
# צור סביבה
azd env new dev

# הגדר ערך שאינו סודי
azd env set API_VERSION 1.0.0
```

עבור סודות אמיתיים, אחסן אותם ב-Key Vault והתייחס אליהם מתוך התשתית שלך—ראו [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Now use the same workflow you already know:

```bash
# בצע אימות (נדרש ל-azd)
azd auth login

# הצג תצוגה מקדימה של המשאבים שייווצרו
azd provision --preview

# הקם תשתית ופרוס את הקוד שלך
azd up
```

When it finishes, azd prints your app's URL. Verify it the same way as any azd app:

```bash
azd show           # הצג נקודות קצה
azd monitor --logs # בדוק יומנים אם צריך
```

---

## Common First-Time Issues

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

לעוד מידע, ראה [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Clean Up

```bash
azd down --force --purge
```

---

## Summary

- `azd init` → **"Use code in the current directory"** מוסיף azd לאפליקציה שכבר יש לך.
- `azure.yaml` ממפה את תיקיות הקוד שלך למארחי Azure; `infra/` מגדיר את המשאבים כ-Bicep.
- `azd infra generate` מאפשר לעיין או להתאים אישית את התשתית שנוצרה.
- לאחר האתחול, האפליקציה הקיימת שלך משתמשת באותו תהליך `azd up` / `azd down` בדיוק כמו אפליקציה שמבוססת תבנית.

---

## 🔗 ניווט

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Your First Project](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 משאבים קשורים

- [AZD Basics](azd-basics.md)
- [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->