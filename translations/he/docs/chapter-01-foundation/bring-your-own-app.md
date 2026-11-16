# הביאו את האפליקציה שלכם - הוספת azd לפרויקט קיים

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [הפרויקט הראשון שלך](first-project.md)
- **➡️ הבא**: [מכולות פיתוח ו-Codespaces](dev-containers.md)

> יעד סקירת פקודות וקונפיגורציה: `azd 1.37.2` (נובמבר 2026). קבצים שנוצרו תלויים באפליקציה שזוהתה; לא בוצעה פריסה לאזור Azure בסקירה זו.

## הקדמה

ב-[הפרויקט הראשון שלך](first-project.md) פרסת אפליקציה על ידי התחלה מתבנית. אבל ברוב הפעמים יש לך כבר *אפליקציה*—API ב-Node.js, שירות Flask בפייתון, אפליקציית ווב ב-.NET—שישבת בתיקיה במחשב שלך. השיעור הזה מראה איך להוסיף azd לקוד הקיים כך שתוכל לפרוס אותו עם `azd up`, ללא צורך בתבנית.

## מטרות למידה

בסוף השיעור הזה, תוכל:
- להבין את שלוש הדרכים להתחיל פרויקט azd
- להריץ `azd init` בתוך בסיס קוד קיים
- להבין מה עושים `azure.yaml` ו-`infra/` בתיקיית האפליקציה שלך
- לדעת מתי לתת ל-azd לייצר תשתית ומתי לכתוב את שלך
- לפרוס את האפליקציה הקיימת שלך לאזור עם `azd up`

## תוצאות הלמידה

לאחר השלמת שיעור זה, תוכל:
- לאתחל את azd בפרויקט שכבר יש לך
- לקרוא ולערוך קובץ `azure.yaml` בסיסי
- ליצור תשתית בסיסית עם `azd infra generate`
- לבחור מארח Azure מתאים לאפליקציה שלך
- לפרוס ולנקות את היישום שלך

---

## שלוש דרכים להתחיל פרויקט azd

| נקודת התחלה | פקודה | מתי להשתמש |
|----------------|---------|-------------|
| **מתבנית** | `azd init --template <name> .` (תיקיה ריקה) | ללמידה, או התחלה של אפליקציה חדשה מתבנית מוכחת |
| **מהקוד הקיים שלך** | `azd init` (בתיקיית הפרויקט שלך) | כבר יש לך אפליקציה ואתה רוצה לפרוס אותה |
| **מריפוזיטורי Git** | `azd init --from-code` (בריפו משוכפל) | אימוץ azd עבור ריפו קיים |

כבר התאמנת באפשרות הראשונה. שיעור זה עוסק בשנייה—התסריט הנפוץ ביותר במציאות.

---

## שלב 1: הרץ `azd init` בפרויקט שלך

פתח טרמינל **בתוך תיקיית הפרויקט הקיימת שלך** והריץ:

```bash
cd my-existing-app
azd init
```

azd ישאל איך אתה רוצה לאתחל. בחר:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

בחר **"Use code in the current directory."** azd אז סורק את התיקיה שלך, מזהה את השפה והמסגרת, ומציע מארח.

### מה azd מזהה

azd מחפש אותות אפליקציה כמו `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, או `Dockerfile`. זרימת ה-from-code אינה אשף בחירת מארח כללי לכל יעד פריסה נתמך:

| האפליקציה שלך | מארח שזוהה סביר להניח |
|----------|----------------------|
| אפליקציית ווב ב-Node.js / Python / .NET נתמכת | בד"כ Azure Container Apps; עיין בהגדרה שנוצרה |
| אפליקציה מוכללת (`Dockerfile`) | Azure Container Apps |
| אפליקציית פונקציה או פרויקט Static Web Apps | השתמש בתבנית תואמת או כתוב `azure.yaml` ותשתית אם from-code לא תומך בפריסה שלך |

אשר את השירות/השירותים שזוהו, ו-azd יוצר את הקבצים הדרושים לך.

---

## שלב 2: הבן מה azd יצר

לאחר האתחול, בדוק את `azure.yaml`. זרימת התשתית שנוצרה יכולה לשמור את התשתית במובן מרומז עד שתריץ `azd infra generate`; אל תניח כי `infra/` כבר קיימת:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — הגדרת הפרויקט

זהו ליבה של פרויקט azd. ה-**App Service definition מאיור הבא** דורש תשתית App Service תואמת; זה לא סיבה לשנות את מארח Container Apps שנוצר בלי לשנות את התשתית:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

בלוק ה-`services` הוא החלק המרכזי: כל ערך ממפה תיקיית קוד למארח Azure. אם לאפליקציה שלך יש גם ממשק משתמש וגם API, יהיו לך שני שירותים.

### `infra/` — משאבי Azure שלך כקוד

תיקיית ה-`infra/` מחזיקה את קבצי ה-Bicep שמגדירים את משאבי Azure שהאפליקציה שלך צריכה (App Service, מסד נתונים וכו'). אינך חייב לכתוב אותם בעצמך—azd יוצר נקודת התחלה איכותית. אתה *יכול* לערוך אותם אחר כך להוסיף משאבים או לחזק אבטחה (מפורט ב-[פרק 4](../chapter-04-infrastructure/README.md)).

> **טיפ:** רוצה לראות או להתאים את התשתית שנוצרה לפני הפריסה? הרץ `azd infra generate` (זמין גם כ-`azd infra synth`) לכתוב את ה-IaC לדיסק כדי שתוכל לסקור ולנהל גרסאות.

---

## שלב 3: הגדר את התצורה הנדרשת

אם האפליקציה שלך צריכה הגדרות או סודות (מחרוזת חיבור, מפתח API), אל תכתוב אותם בקוד. השתמש בערכי סביבה:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

זה שומר ערך מקומי בלבד. כדי להשפיע על האפליקציה, צורך אותו במפורש בפרמטרים של תשתית, בהגדרת שירות נתמך, או ב-hook; הגדרת משתנה כלשהו איננה מגדירה את סביבת הריצה המתפרסת.

לסודות אמיתיים, אחסן אותם ב-Key Vault והפנה אליהם מהתשתית שלך—ראו [פרק 3: תצורה ואימות](../chapter-03-configuration/authsecurity.md).

---

## שלב 4: פרוס

עכשיו השתמש בזרימת העבודה שאתה כבר מכיר:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

כשהוא מסיים, azd מדפיס את כתובת ה-URL של האפליקציה שלך. אמת אותה באותו אופן כמו כל אפליקציית azd:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## בעיות נפוצות בפעם הראשונה

| סימפטום | סיבה סבירה | תיקון |
|---------|--------------|-----|
| azd לא זיהה את האפליקציה שלי | חסר מניפסט (למשל, `package.json`) | הוסף את המניפסט, או בחר מארח ידנית במהלך `azd init` |
| הבניה נכשלה במהלך `azd up` | האפליקציה דורשת שלב בניה | הגדר סקריפטים של חבילה או hook של שירות `prepackage`; השתמש ב-`dist` לפלט הפריסה, לא ב-`buildCommand`/`outputPath` |
| האפליקציה מתחילה אבל מחזירה שגיאות | חסרת תצורה/סוד | חבר ערכים להגדרות זמן ריצה או הפניה ל-Key Vault; `azd env set` לבדו אינו מספיק |
| נבחר מארח לא נכון | זיהוי אוטומטי לא מתאים לצרכים שלך | שנה גם את `host:` וגם את התשתית המתאימה, או בחר תבנית תואמת |

לפרטים נוספים ראה [פרק 7: פתרון בעיות](../chapter-07-troubleshooting/README.md).

---

## ניקוי

```bash
azd down --force --purge
```

---

## סיכום

- `azd init` → **"Use code in the current directory"** מוסיף את azd לאפליקציה שכבר יש לך.
- `azure.yaml` ממפה תיקיות קוד למארחי Azure; `infra/` מגדיר את המשאבים כ-Bicep.
- `azd infra generate` מאפשר לסקור או להתאים אישית את התשתית שנוצרה.
- לאחר אתחול, האפליקציה הקיימת שלך משתמשת בזרימת העבודה המדויקת של `azd up` / `azd down` כמו אפליקציה מבוססת תבנית.

---

## 🔗 ניווט

| כיוון | שיעור |
|-----------|--------|
| **קודם** | [הפרויקט הראשון שלך](first-project.md) |
| **הבא** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 משאבים קשורים

- [יסודות AZD](azd-basics.md)
- [פרק 4: תשתית כקוד](../chapter-04-infrastructure/README.md)
- [תצורה ואימות](../chapter-03-configuration/authsecurity.md)
- [גליון פקודות](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->