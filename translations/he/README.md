# AZD למתחילים: מסע למידה מובנה

![AZD למתחילים](../../translated_images/he/azdbeginners.5527441dd9f74068.webp)

[![צופים ב-GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![מזלגות ב-GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![כוכבים ב-GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![דיסקורד של Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![דיסקורד של Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### תרגומים אוטומטיים (תמיד מעודכנים)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[ערבית](../ar/README.md) | [בנגלית](../bn/README.md) | [בולגרית](../bg/README.md) | [בורמית (מיאנמר)](../my/README.md) | [סינית (מפושטת)](../zh-CN/README.md) | [סינית (מסורתית, הונג קונג)](../zh-HK/README.md) | [סינית (מסורתית, מקאו)](../zh-MO/README.md) | [סינית (מסורתית, טאיוואן)](../zh-TW/README.md) | [קרואטית](../hr/README.md) | [צ'כית](../cs/README.md) | [דנית](../da/README.md) | [הולנדית](../nl/README.md) | [אסטונית](../et/README.md) | [פינית](../fi/README.md) | [צרפתית](../fr/README.md) | [גרמנית](../de/README.md) | [יוונית](../el/README.md) | [עברית](./README.md) | [הינדי](../hi/README.md) | [הונגרית](../hu/README.md) | [אינדונזית](../id/README.md) | [איטלקית](../it/README.md) | [יפנית](../ja/README.md) | [קאנדה](../kn/README.md) | [חמר](../km/README.md) | [קוריאנית](../ko/README.md) | [ליטאית](../lt/README.md) | [מלאית](../ms/README.md) | [מלאיאלאם](../ml/README.md) | [מרטהי](../mr/README.md) | [נפאלית](../ne/README.md) | [פידג'ין ניגרי](../pcm/README.md) | [נורווגית](../no/README.md) | [פרסית (פרסי)](../fa/README.md) | [פולנית](../pl/README.md) | [פורטוגזית (ברזיל)](../pt-BR/README.md) | [פורטוגזית (פורטוגל)](../pt-PT/README.md) | [פונג'אבית (ג'ורמוכי)](../pa/README.md) | [רומנית](../ro/README.md) | [רוסית](../ru/README.md) | [סרבית (קירילית)](../sr/README.md) | [סלובקית](../sk/README.md) | [סלובנית](../sl/README.md) | [ספרדית](../es/README.md) | [סוואהילי](../sw/README.md) | [שוודית](../sv/README.md) | [טגלוג (פיליפינית)](../tl/README.md) | [טמילית](../ta/README.md) | [טלוגו](../te/README.md) | [תאית](../th/README.md) | [טורקית](../tr/README.md) | [אוקראינית](../uk/README.md) | [אורדו](../ur/README.md) | [וייטנאמית](../vi/README.md)

> **מעדיפים לשכפל מקומית?**
>
> מאגר זה כולל 50+ תרגומים בשפות שונות שמגדילים משמעותית את גודל ההורדה. לשכפול ללא תרגומים, השתמשו ב-sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> זה נותן לך את כל מה שצריך כדי להשלים את הקורס במהירות הורדה הרבה יותר גבוהה.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 מה חדש ב-azd היום

> 📌 קורס זה אומת בהתאמה ל-**`azd 1.25.6`** (יוני 2026). הרץ `azd version` כדי לבדוק את הגרסה שלך, ו-`azd upgrade` כדי לקבל את העדכון האחרון.

כלי שורת הפקודה Azure Developer CLI התפתח מעבר לאפליקציות ווב ו-API מסורתיים. כיום, azd הוא הכלי היחיד לפריסת **כל** אפליקציה ב-Azure — כולל אפליקציות מונעות בינה מלאכותית וסוכנים אינטיליגנטיים.

הנה מה שזה אומר בשבילך:

- **סוכני AI הם כעת עומסי עבודה מהדרגה הראשונה ב-azd.** ניתן לאתחל, לפרוס ולנהל פרויקטים של סוכני AI באמצעות אותו זרימת עבודה `azd init` → `azd up` שאתה כבר מכיר.
- **מחזור חיים מלא של סוכן מ-CLI.** התוסף `azure.ai.agents` כולל כעת את כל השלבים — `azd ai agent init` ליצירת תבנית, `azd ai agent invoke` לבדיקות (עם פלט זמני תגובה), `azd ai agent eval generate` ו-`azd ai agent optimize` למדידה ושיפור האיכות, ו-`azd ai agent delete` לניקוי.
- **מתחמי AI נוספים.** תוספים חדשים במצב תצוגה מקדימה — `azure.ai.skills` ו-`azure.ai.connections` — מאפשרים ניהול ישיר של מיומנויות סוכן חזרניות וקישורי Foundry דרך azd.
- **שילוב עם Microsoft Foundry** מביא פריסת מודלים, אירוח סוכנים וקונפיגורציה של שירותי AI ישירות לאקוסיסטם תבניות azd.
- **יסודות יומיום חלקים יותר.** עדכונים אחרונים הפכו את `azd init` לחזרתית (בטוחה להרצה חוזרת), גרמו ל-`azd auth login` לנקות אוטומטית אסימונים ישנים, והוסיפו תזכורת ידידותית ב-`azd tool` להרצה ראשונה.
- **זרימת העבודה העיקרית לא השתנתה.** בין אם אתה מפרוס אפליקציית מטלות, מיקרוסרביס או פתרון AI רב-סוכנים, הפקודות נשארות אותו דבר.

> **הערה למשתמשי Aspire:** מיקרוסופט מתייחסת כעת למוצר פשוט כ-**Aspire** (בעבר ".NET Aspire"). התמיכה ב-azd ל-Aspire לא השתנתה — רק השם עודכן.

אם השתמשת ב-azd בעבר, התמיכה ב-AI היא הרחבה טבעית — לא כלי נפרד או מסלול מתקדם. אם אתה מתחיל עכשיו, תלמד זרימת עבודה אחת שעובדת על הכול.

---

## 🚀 מה זה Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** הוא כלי שורת פקודה ידידותי למפתח, שמפשט פריסת אפליקציות ב-Azure. במקום ליצור ולחבר בעבודת יד עשרות משאבים ב-Azure, תוכל לפרוס אפליקציות שלמות באמצעות פקודה אחת.

### הקסם של `azd up`

```bash
# הפקודה היחידה הזו עושה הכל:
# ✅ יוצר את כל משאבי Azure
# ✅ מגדיר את הרשת והאבטחה
# ✅ בונה את קוד היישום שלך
# ✅ מפריס ל-Azure
# ✅ מספק לך כתובת URL פעילה
azd up
```

**זהו זה!** אין צורך ללחוץ בפורטל Azure, אין צורך ללמוד תחילה תבניות ARM מורכבות, ואין תצורה ידנית — רק אפליקציות עובדות ב-Azure.

---

## ❓ Azure Developer CLI מול Azure CLI: מה ההבדל?

זו השאלה הנפוצה ביותר של מתחילים. הנה התשובה הפשוטה:

| תכונה | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **מטרה** | ניהול משאבים ספציפיים ב-Azure | פריסת אפליקציות שלמות |
| **גישה** | ממוקד תשתיות | ממוקד אפליקציה |
| **דוגמה** | `az webapp create --name myapp...` | `azd up` |
| **עקומת למידה** | חייב לדעת שירותי Azure | רק להכיר את האפליקציה שלך |
| **מתאים ל** | DevOps, תשתיות | מפתחים, אב טיפוס |

### אנלוגיה פשוטה

- **Azure CLI** הוא כמו שיש לך את כל הכלים לבניית בית — פטישים, מסורים, מסמרים. אתה יכול לבנות כל דבר, אבל צריך לדעת בנייה.
- **Azure Developer CLI** הוא כמו לשכור קבלן — אתה מתאר מה אתה רוצה, והם מטפלים בבנייה.

### מתי להשתמש בכל אחד

| תרחיש | השתמש בזה |
|----------|----------|
| "אני רוצה לפרוס את אפליקציית הווב שלי במהירות" | `azd up` |
| "אני צריך ליצור רק חשבון אחסון" | `az storage account create` |
| "אני בונה אפליקציית AI מלאה" | `azd init --template azure-search-openai-demo` |
| "אני צריך לנפות שגיאות במשאב Azure ספציפי" | `az resource show` |
| "אני רוצה פריסה מוכנה לייצור תוך דקות" | `azd up --environment production` |

### הם עובדים יחד!

AZD משתמש ב-Azure CLI ברקע. אפשר להשתמש בשניהם:
```bash
# פרוס את האפליקציה שלך באמצעות AZD
azd up

# לאחר מכן כוונן משאבים ספציפיים באמצעות Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 מצא תבניות ב-Awesome AZD

אל תתחיל מאפס! **Awesome AZD** הוא אוסף הקהילה של תבניות מוכנות לפריסה:

| משאב | תיאור |
|----------|-------------|
| 🔗 [**גלריית Awesome AZD**](https://azure.github.io/awesome-azd/) | דפדף ב-200+ תבניות עם פריסה בלחיצה אחת |
| 🔗 [**שלח תבנית**](https://github.com/Azure/awesome-azd/issues) | תרום תבנית משלך לקהילה |
| 🔗 [**מאגר GitHub**](https://github.com/Azure/awesome-azd) | כוכב וחקור את המקור |

### תבניות AI פופולריות מ-Awesome AZD

```bash
# שיחת RAG עם דגמי Microsoft Foundry + חיפוש בינה מלאכותית
azd init --template azure-search-openai-demo

# יישום צ'אט של בינה מלאכותית מהיר
azd init --template openai-chat-app-quickstart

# סוכני בינה מלאכותית עם סוכני Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 איך להתחיל ב-3 שלבים

לפני שמתחילים, ודא שהמחשב שלך מוכן לתבנית שברצונך לפרוס:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

אם בדיקה כלשהי נכשלה, תקן זאת קודם ואז המשך להתחלה מהירה.

### שלב 1: התקן את AZD (2 דקות)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### שלב 2: התחבר ל-AZD

```bash
# אופציונלי אם אתם מתכננים להשתמש בפקודות Azure CLI ישירות בקורס זה
az login

# נדרש עבור זרימות עבודה של AZD
azd auth login
```

אם אינך בטוח מה דרוש לך, עקוב אחרי זרימת ההתקנה המלאה ב-[התקנה והגדרה](docs/chapter-01-foundation/installation.md#authentication-setup).

### שלב 3: פרוס את האפליקציה הראשונה שלך

```bash
# אתחול מתוך תבנית
azd init --template todo-nodejs-mongo

# פריסה ל-Azure (יוצר הכול!)
azd up
```

**🎉 זהו זה!** האפליקציה שלך עכשיו חיה ב-Azure.

### ניקוי (אל תשכח!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 איך להשתמש בקורס הזה

קורס זה מעוצב ללמידה הדרגתית — התחל במקום שנוח לך והתקדם עם הזמן:

| הניסיון שלך | התחל כאן |
|-----------------|------------|
| **חדש לגמרי ב-Azure** | [פרק 1: יסודות](#-chapter-1-foundation--quick-start) |
| **מכיר את Azure, חדש ב-AZD** | [פרק 1: יסודות](#-chapter-1-foundation--quick-start) |
| **רוצה לפרוס אפליקציות AI** | [פרק 2: פיתוח AI ראשון](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **רוצה תרגול מעשי** | [🎓 סדנא אינטראקטיבית](workshop/README.md) - מעבדה מודרכת 3-4 שעות |
| **צריך תבניות לפרודקשן** | [פרק 8: פרודקשן ועבודה ארגונית](#-chapter-8-production--enterprise-patterns) |

### התקנה מהירה

1. **שכפל מאגר זה**: [![מזלגות ב-GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **שכפל אותו**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **קבל עזרה**: [קהילת דיסקורד של Azure](https://discord.com/invite/ByRwuEEgH4)

> **מעדיפים לשכפל מקומית?**

> מאגר זה כולל 50+ תרגומים בשפות שונות שמגדילים משמעותית את גודל ההורדה. לשכפול ללא תרגומים, השתמשו ב-sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> זה נותן לך את כל מה שצריך כדי להשלים את הקורס במהירות הורדה הרבה יותר גבוהה.


## סקירת הקורס

שלוט ב-Azure Developer CLI (azd) דרך פרקים מובנים המיועדים ללמידה הדרגתית. **הדגש מיוחד על פריסת אפליקציות AI עם שילוב Microsoft Foundry.**
### מדוע הקורס הזה חיוני למפתחים מודרניים

מבוסס על תובנות מקהילת Microsoft Foundry Discord, **45% מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של בינה מלאכותית** אך נתקלים באתגרים עם:
- ארכיטקטורות בינה מלאכותית מורכבות רב-שירותיות
- שיטות עבודה מיטביות לפריסה בייצור של בינה מלאכותית  
- אינטגרציה והגדרת שירותי Azure AI
- אופטימיזציה של עלויות לעומסי עבודה של בינה מלאכותית
- פתרון תקלות בפריסות ספציפיות לבינה מלאכותית

### מטרות הלמידה

בסיום קורס מובנה זה, תוכל:
- **להתמקצע ביסודות AZD**: מושגי יסוד, התקנה, והגדרות
- **לפרוס אפליקציות בינה מלאכותית**: שימוש ב-AZD עם שירותי Microsoft Foundry
- **ליישם תשתית כקוד**: ניהול משאבי Azure עם תבניות Bicep
- **לפתור תקלות בפריסות**: זיהוי ופתרון בעיות נפוצות ודיבוג
- **לאופטם לקראת ייצור**: אבטחה, סקיילינג, ניטור וניהול עלויות
- **לבנות פתרונות מרובי סוכנים**: לפרוס ארכיטקטורות בינה מלאכותית מורכבות

## לפני שנותנים את הפקודה: חשבונות, הרשאות והנחות

לפני שתתחיל בפרק 1, וודא שיש לך את הדברים הבאים במקום. שלבי ההתקנה בהמשך מדריך זה מניחים שהבסיסים הללו כבר מטופלים.

- **מנוי Azure**: תוכל להשתמש במנוי קיים מהעבודה או מחשבון אישי, או ליצור [ניסיון חינמי](https://aka.ms/azurefreetrial) כדי להתחיל.
- **הרשאה ליצירת משאבי Azure**: ברוב התרגילים יש צורך לפחות בהרשאת **Contributor** במנוי או בקבוצת המשאבים הייעודית. במספר פרקים ייתכן שיהיה צורך גם בהרשאות ליצירת קבוצות משאבים, זהויות מנוהלות והגדרות RBAC.
- [**חשבון GitHub**](https://github.com): שימושי לשכפול המאגר, מעקב אחרי שינויים ושימוש ב-GitHub Codespaces בסדנה.
- **דרישות מוקדמות להפעלת תבניות**: חלק מהתבניות דורשות כלים מקומיים כגון Node.js, Python, Java או Docker. הרץ את בודק ההתקנה לפני תחילת העבודה כדי לוודא שכל הכלים קיימים.
- **היכרות בסיסית עם הטרמינל**: אין צורך להיות מומחה, אבל כדאי להרגיש בנוח להריץ פקודות כמו `git clone`, `azd auth login` ו-`azd up`.

> **עובד במנוי ארגוני?**  
> אם סביבת ה-Azure שלך מנוהלת על ידי מנהל, ודא מראש שאתה יכול לפרוס משאבים במנוי או בקבוצת המשאבים שבה אתה מתכנן להשתמש. אם לא, בקש מנוי סנדבוקס או הרשאת Contributor לפני שתתחיל.

> **חדש ב-Azure?**  
> התחל בניסוי Azure משלך או במנוי pay-as-you-go בכתובת https://aka.ms/azurefreetrial כדי שתוכל להשלים את התרגילים מקצה לקצה בלי להמתין לאישורים ברמת הטננט.

## 🗺️ מפת הקורס: ניווט מהיר לפי פרק

לכל פרק יש קובץ README ייעודי עם מטרות למידה, התחלות מהירות ותרגילים:

| פרק | נושא | שיעורים | משך | מורכבות |
|---------|-------|---------|----------|------------|
| **[פרק 1: יסודות](docs/chapter-01-foundation/README.md)** | התחל כאן | [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [התקנה](docs/chapter-01-foundation/installation.md) &#124; [הפרויקט הראשון](docs/chapter-01-foundation/first-project.md) | 30-45 דק’ | ⭐ |
| **[פרק 2: פיתוח בינה מלאכותית](docs/chapter-02-ai-development/README.md)** | אפליקציות מבוססות AI | [אינטגרציה עם Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [סוכני AI](docs/chapter-02-ai-development/agents.md) &#124; [פריסת מודלים](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [סדנה](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 שעות | ⭐⭐ |
| **[פרק 3: הגדרות](docs/chapter-03-configuration/README.md)** | אימות ואבטחה | [הגדרות](docs/chapter-03-configuration/configuration.md) &#124; [אימות ואבטחה](docs/chapter-03-configuration/authsecurity.md) | 45-60 דק’ | ⭐⭐ |
| **[פרק 4: תשתית](docs/chapter-04-infrastructure/README.md)** | תשתיות כקוד ופריסה | [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [הקצאה](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 שעות | ⭐⭐⭐ |
| **[פרק 5: מרובי סוכנים](docs/chapter-05-multi-agent/README.md)** | פתרונות סוכני AI | [תסריט קמעונאות](examples/retail-scenario.md) &#124; [תבניות תיאום](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[פרק 6: לפני פריסה](docs/chapter-06-pre-deployment/README.md)** | תכנון ואימות | [בדיקות מקדימות](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | שעה | ⭐⭐ |
| **[פרק 7: פתרון תקלות](docs/chapter-07-troubleshooting/README.md)** | דיבוג ותיקון | [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) &#124; [דיבוג](docs/chapter-07-troubleshooting/debugging.md) &#124; [בעיות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 שעות | ⭐⭐ |
| **[פרק 8: ייצור](docs/chapter-08-production/README.md)** | תבניות ארגוניות | [שיטות עבודה בייצור](docs/chapter-08-production/production-ai-practices.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[🎓 סדנה](workshop/README.md)** | מעשי | [הקדמה](workshop/docs/instructions/0-Introduction.md) &#124; [בחירה](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [איתור](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [הגדרות](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [פירוק תשתית](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [סיום](workshop/docs/instructions/7-Wrap-up.md) | 3-4 שעות | ⭐⭐ |

**סה"כ משך הקורס:** ~10-14 שעות | **התפתחות מיומנות:** מתחיל → מוכן לייצור

---

## 📚 פרקי למידה

*בחר את מסלול הלמידה שלך לפי רמת הניסיון והמטרות*

### 🚀 פרק 1: יסודות והתחלה מהירה  
**דרישות מוקדמות**: מנוי Azure, ידע בסיסי בטרמינל  
**משך**: 30-45 דקות  
**מורכבות**: ⭐

#### מה תלמד  
- הבנת יסודות Azure Developer CLI  
- התקנת AZD בפלטפורמה שלך  
- הפריסה המוצלחת הראשונה שלך

#### מקורות למידה  
- **🎯 התחלה כאן**: [מהו Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 תאוריה**: [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) - מושגים וטרמינולוגיה  
- **⚙️ התקנה**: [התקנה והגדרה](docs/chapter-01-foundation/installation.md) - מדריכים לפלטפורמות שונות  
- **🛠️ מעשי**: [הפרויקט הראשון שלך](docs/chapter-01-foundation/first-project.md) - מדריך שלב-אחר-שלב  
- **📋 עזר מהיר**: [גליון פקודות](resources/cheat-sheet.md)

#### תרגילים מעשיים  
```bash
# בדיקת התקנה מהירה
azd version

# פרוס את היישום הראשון שלך
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 תוצר הפרק**: פרוס בהצלחה אפליקציית ווב פשוטה ל-Azure באמצעות AZD

**✅ בדיקת הצלחה:**  
```bash
# לאחר השלמת פרק 1, עליך להיות מסוגל:
azd version              # מציג את הגרסה המותקנת
azd init --template todo-nodejs-mongo  # מאתחל את הפרויקט
azd up                  # מפרסם ל-Azure
azd show                # מציג את כתובת ה-URL של האפליקציה הפועלת
# האפליקציה נפתחת בדפדפן ועובדת
azd down --force --purge  # מנקה משאבים
```
  
**📊 משך זמן:** 30-45 דקות  
**📈 רמת מיומנות לאחר:** יכולת לפרוס אפליקציות בסיסיות באופן עצמאי

---

### 🤖 פרק 2: פיתוח AI ראשוני (מומלץ למפתחי AI)  
**דרישות מוקדמות**: פרק 1 הושלם  
**משך**: 1-2 שעות  
**מורכבות**: ⭐⭐

#### מה תלמד  
- אינטגרציה בין Microsoft Foundry ל-AZD  
- פריסת אפליקציות מונעת AI  
- הבנת הגדרות שירותי AI

#### מקורות למידה  
- **🎯 התחלה כאן**: [אינטגרציה עם Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 סוכני AI**: [מדריך סוכנים](docs/chapter-02-ai-development/agents.md) - פריסת סוכנים חכמים עם AZD  
- **📖 תבניות**: [פריסת מודלים](docs/chapter-02-ai-development/ai-model-deployment.md) - פריסה וניהול מודלים  
- **🛠️ סדנה**: [מעבדת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפיכת פתרונות ה-AI למוכנים עם AZD  
- **🎥 מדריך אינטראקטיבי**: [חומרי סדנה](workshop/README.md) - למידה בדפדפן עם MkDocs * סביבת DevContainer  
- **📋 תבניות**: [תבניות Microsoft Foundry מובילות](#משאבי-הסדנה)  
- **📝 דוגמאות**: [דוגמאות לפריסת AZD](examples/README.md)

#### תרגילים מעשיים  
```bash
# פרוס את יישום ה-AI הראשון שלך
azd init --template azure-search-openai-demo
azd up

# נסה תבניות AI נוספות
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 תוצר הפרק**: פרוס והגדר אפליקציית צ’אט מבוססת AI עם יכולות RAG

**✅ בדיקת הצלחה:**  
```bash
# לאחר פרק 2, אתה אמור להיות מסוגל:
azd init --template azure-search-openai-demo
azd up
# לבדוק את ממשק הצ'אט של ה-AI
# לשאול שאלות ולקבל תגובות מונעות על ידי AI עם מקורות
# לאמת שאינטגרציית החיפוש פועלת
azd monitor  # לבדוק ש-Application Insights מציג טלמטריה
azd down --force --purge
```
  
**📊 משך זמן:** 1-2 שעות  
**📈 רמת מיומנות לאחר:** יכול לפרוס ולהגדיר אפליקציות AI מוכנות לייצור  
**💰 מודעות עלות:** הבנת עלויות פיתוח של 80-150$/חודש וייצור 300-3500$/חודש

#### 💰 שיקולי עלויות לפריסות AI

**סביבת פיתוח (כ-80-150$/חודש משוער):**  
- מודלים Microsoft Foundry (Pay-as-you-go): 0-50$/חודש (בהתאם לשימוש בטוקנים)  
- חיפוש AI (רמה בסיסית): 75$/חודש  
- Container Apps (צריכה): 0-20$/חודש  
- אחסון (סטנדרטי): 1-5$/חודש

**סביבת ייצור (כ-300-3,500+$/חודש משוער):**  
- מודלים Microsoft Foundry (PTU לביצועים עקביים): 3,000+$/חודש או pay-as-you-go עם נפח גבוה  
- חיפוש AI (רמה סטנדרטית): 250$/חודש  
- Container Apps (מיתוג ייעודי): 50-100$/חודש  
- Application Insights: 5-50$/חודש  
- אחסון (פרימיום): 10-50$/חודש

**💡 טיפים לאופטימיזציית עלויות:**  
- השתמש במודלים חינמיים של Microsoft Foundry ללמידה (כולל Azure OpenAI עם 50,000 טוקנים בחודש)  
- הרץ `azd down` לפינוי משאבים כשאינך מפתח פעיל  
- התחל עם תשלום על פי צריכה, שדרג ל-PTU רק לייצור  
- השתמש ב-`azd provision --preview` להערכת עלויות לפני פריסה  
- אפשר אוטומטית סקיילינג: שילם רק על השימוש בפועל

**ניטור עלויות:**  
```bash
# בדוק עלויות חודשיות משוערות
azd provision --preview

# נטר עלויות בפועל בפורטל Azure
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ פרק 3: הגדרות ואימות  
**דרישות מוקדמות**: פרק 1 הושלם  
**משך**: 45-60 דקות  
**מורכבות**: ⭐⭐

#### מה תלמד  
- הגדרה וניהול סביבת עבודה  
- אמצעי אימות ואבטחה מיטביים  
- שמות וארגון משאבים

#### מקורות למידה  
- **📖 הגדרות**: [מדריך הגדרות](docs/chapter-03-configuration/configuration.md) - קביעת הסביבה  
- **🔐 אבטחה**: [תבניות אימות וזהות מנוהלת](docs/chapter-03-configuration/authsecurity.md) - תבניות אימות  
- **📝 דוגמאות**: [דוגמת אפליקציית מסד נתונים](examples/database-app/README.md) - דוגמאות מסדי נתונים ב-AZD

#### תרגילים מעשיים  
- הגדרת מספר סביבות עבודה (פיתוח, בדיקות, ייצור)  
- הקמת אימות עם זהות מנוהלת  
- יישום הגדרות ייחודיות לסביבה

**💡 תוצר הפרק**: ניהול סביבות מרובות עם אימות ואבטחה נאותים

---

### 🏗️ פרק 4: תשתית כקוד ופריסה  
**דרישות מוקדמות**: פרקים 1-3 הושלמו  
**משך**: 1-1.5 שעות  
**מורכבות**: ⭐⭐⭐

#### מה תלמד  
- תבניות פריסה מתקדמות  
- תשתית כקוד עם Bicep  
- אסטרטגיות הקצאת משאבים

#### מקורות למידה  
- **📖 פריסה**: [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) - זרימות עבודה מלאות  
- **🏗️ הקצאה**: [ניהול משאבי Azure](docs/chapter-04-infrastructure/provisioning.md) - הקצאת משאבים  
- **📝 דוגמאות**: [דוגמת Container App](../../examples/container-app) - פריסות מכולות

#### תרגילים מעשיים  
- יצירת תבניות Bicep מותאמות אישית  
- פריסת אפליקציות רב-שירותיות  
- יישום אסטרטגיות פריסה כחול-ירוק

**💡 תוצר הפרק**: פרוס אפליקציות רב-שירות מורכבות באמצעות תבניות תשתית מותאמות אישית

---
### 🎯 פרק 5: פתרונות בינה מלאכותית רב-סוכניים (מתקדמים)
**דרישות מוקדמות**: פרקים 1-2 הושלמו  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמדו
- דפוסי ארכיטקטורה רב-סוכנית
- תזמור ותיאום סוכנים
- פריסות בינה מלאכותית מוכנות לייצור

#### משאבי למידה
- **🤖 פרויקט מומלץ**: [פתרון רב-סוכני לקמעונאות](examples/retail-scenario.md) - מימוש שלם
- **🛠️ תבניות ARM**: [חבילת תבניות ARM](../../examples/retail-multiagent-arm-template) - פריסה בלחיצה אחת
- **📖 ארכיטקטורה**: [דפוסי תיאום רב-סוכניים](docs/chapter-06-pre-deployment/coordination-patterns.md) - דפוסים

#### תרגילים מעשיים
```bash
# פרוס את פתרון הסוכנים המרובה הקמעונאי המלא
cd examples/retail-multiagent-arm-template
./deploy.sh

# חקור תצורות סוכנים
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 תוצאת פרק**: לפרוס ולנהל פתרון בינה מלאכותית רב-סוכני מוכן לייצור עם סוכני לקוח ומלאי

---

### 🔍 פרק 6: אימות ותכנון טרום-פריסה
**דרישות מוקדמות**: פרק 4 הושלם  
**משך**: שעה אחת  
**מורכבות**: ⭐⭐

#### מה תלמדו
- תכנון קיבולת ואימות משאבים
- אסטרטגיות בחירת SKU
- בדיקות טרום-טיסה ואוטומציה

#### משאבי למידה
- **📊 תכנון**: [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) - אימות משאבים
- **💰 בחירה**: [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) - בחירות חסכוניות
- **✅ אימות**: [בדיקות טרום-טיסה](docs/chapter-06-pre-deployment/preflight-checks.md) - סקריפטים אוטומטיים

#### תרגילים מעשיים
- להריץ סקריפטי אימות קיבולת
- לייעל בחירות SKU לפי עלות
- ליישם בדיקות טרום-פריסה אוטומטיות

**💡 תוצאת פרק**: לאמת ולייעל פריסות לפני ביצוע

---

### 🚨 פרק 7: פתרון בעיות ודיבאגינג
**דרישות מוקדמות**: כל פרק פריסה הושלם  
**משך**: 1-1.5 שעות  
**מורכבות**: ⭐⭐

#### מה תלמדו
- גישות שיטתיות לדיבאגינג
- בעיות נפוצות ופתרונות
- פתרון בעיות ספציפי לבינה מלאכותית

#### משאבי למידה
- **🔧 בעיות נפוצות**: [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) - שאלות נפוצות ופתרונות
- **🕵️ דיבאגינג**: [מדריך דיבאגינג](docs/chapter-07-troubleshooting/debugging.md) - אסטרטגיות שלב-אחר-שלב
- **🤖 בעיות AI**: [פתרון בעיות ספציפי לבינה מלאכותית](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - בעיות שירותי AI

#### תרגילים מעשיים
- לאבחן כשלונות בפריסה
- לפתור בעיות אימות זהות
- לדבג בעיות חיבור לשירותי AI

**💡 תוצאת פרק**: לאבחן ולפתור עצמאית בעיות פריסה נפוצות

---

### 🏢 פרק 8: דפוסי ייצור וארגוניים
**דרישות מוקדמות**: פרקים 1-4 הושלמו  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמדו
- אסטרטגיות פריסת ייצור
- דפוסי אבטחה ארגונית
- ניטור ואופטימיזציה של עלויות

#### משאבי למידה
- **🏭 ייצור**: [שיטות עבודה מומלצות ל-AI בייצור](docs/chapter-08-production/production-ai-practices.md) - דפוסים ארגוניים
- **📝 דוגמאות**: [דוגמת מיקרוסרביסים](../../examples/microservices) - ארכיטקטורות מורכבות
- **📊 ניטור**: [אינטגרציית Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - ניטור

#### תרגילים מעשיים
- ליישם דפוסי אבטחה ארגוניים
- להגדיר ניטור מקיף
- לפרוס לייצור עם ממשל תקין

**💡 תוצאת פרק**: לפרוס יישומים מוכנים לארגון עם כל יכולות הייצור

---

## 🎓 סקירת סדנה: חווית למידה מעשית

> **⚠️ מצב הסדנה: בפיתוח פעיל**  
> חומרי הסדנה נמצאים בעיבוד ושיפור שוטף. המודולים המרכזיים פעילים, אך חלק מהחלקים המתקדמים אינם שלמים. אנו פועלים להשלים את כל התוכן. [עקבו אחרי ההתקדמות →](workshop/README.md)

### חומרי סדנה אינטראקטיביים
**למידה מעשית מקיפה עם כלי דפדפן ותרגילים מודרכים**

חומרי הסדנה שלנו מספקים חווית למידה אינטראקטיבית ומובנית המשלים את תוכנית הלימודים של הפרקים לעיל. הסדנה מתוכננת ללמידה בקצב עצמי וגם למפגשי הדרכה.

#### 🛠️ תכונות הסדנה
- **ממשק מבוסס דפדפן**: סדנת MkDocs מלאה עם חיפוש, העתקה ותכונות נושא
- **אינטגרציית GitHub Codespaces**: הקמת סביבת פיתוח בלחיצה אחת
- **מסלול למידה מובנה**: 8 מודולים עם תרגילים מודרכים (3-4 שעות בסך הכל)
- **מתודולוגיה הדרגתית**: הקדמה → בחירה → אימות → פירוק → קונפיגורציה → התאמה אישית → פירוק → סיכום
- **סביבת DevContainer אינטראקטיבית**: כלים ותלויות מוגדרים מראש

#### 📚 מבנה מודולי הסדנה
הסדנה פועלת על פי **מתודולוגיה הדרגתית של 8 מודולים** שמובילה אותך מגילוי ועד לשליטה בפריסה:

| מודול | נושא | מה תעשה | משך |
|--------|-------|----------------|----------|
| **0. הקדמה** | סקירת הסדנה | להבין מטרות למידה, דרישות מוקדמות ומבנה הסדנה | 15 דק' |
| **1. בחירה** | גילוי תבניות | לחקור תבניות AZD ולבחור את התבנית המתאימה לתרחיש שלך | 20 דק' |
| **2. אימות** | פרוס ואמת | לפרוס את התבנית עם `azd up` ולאמת שהתשתית פועלת | 30 דק' |
| **3. פירוק** | להבין מבנה | להשתמש ב-GitHub Copilot לחקור ארכיטקטורת התבנית, קבצי Bicep, וארגון הקוד | 30 דק' |
| **4. קונפיגורציה** | התעמקות ב-azure.yaml | לשלוט בקונפיגורציית `azure.yaml`, hooks למחזור חיים, ומשתני סביבה | 30 דק' |
| **5. התאמה אישית** | להפוך אותו לשלך | להפעיל חיפוש AI, ניטור, הערכה ולהתאים לסצנריו שלך | 45 דק' |
| **6. פירוק** | ניקוי | לפרק בבטחה משאבים עם `azd down --purge` | 15 דק' |
| **7. סיכום** | צעדים הבאים | לסקור הישגים, עקרונות מרכזיים ולהמשיך במסע הלמידה | 15 דק' |

**זרימת הסדנה:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 התחלה עם הסדנה
```bash
# אפשרות 1: GitHub Codespaces (מומלץ)
# לחץ על "Code" → "Create codespace on main" במאגר

# אפשרות 2: פיתוח מקומי
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# עקוב אחר הוראות ההתקנה בקובץ workshop/README.md
```

#### 🎯 תוצאות למידה בסדנה
בסיום הסדנה, המשתתפים יוכלו:
- **לפרוס יישומי AI לייצור**: להשתמש ב-AZD עם שירותי Microsoft Foundry
- **לשלוט בארכיטקטורות רב-סוכניות**: ליישם פתרונות סוכנים מתואמים של AI
- **ליישם שיטות אבטחה מומלצות**: לקנפג אימות ושליטה בגישה
- **לאופטימז פריסות להיקף**: לעצב פריסות חסכוניות וביצועיות
- **לפתור בעיות פריסה**: לפתור בעיות נפוצות בצורה עצמאית

#### 📖 משאבי הסדנה
- **🎥 מדריך אינטראקטיבי**: [חומרי הסדנה](workshop/README.md) - סביבת למידה מבוססת דפדפן
- **📋 הוראות לפי מודול**:
  - [0. הקדמה](workshop/docs/instructions/0-Introduction.md) - סקירה ומטרות הסדנה
  - [1. בחירה](workshop/docs/instructions/1-Select-AI-Template.md) - חיפוש ובחירת תבניות AI
  - [2. אימות](workshop/docs/instructions/2-Validate-AI-Template.md) - לפרוס ולאמת תבניות
  - [3. פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - לחקור ארכיטקטורה של תבנית
  - [4. קונפיגורציה](workshop/docs/instructions/4-Configure-AI-Template.md) - לשלוט ב-azure.yaml
  - [5. התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) - להתאים לסצנריו שלך
  - [6. פירוק](workshop/docs/instructions/6-Teardown-Infrastructure.md) - לנקות משאבים
  - [7. סיכום](workshop/docs/instructions/7-Wrap-up.md) - לסקור ולהמשיך
- **🛠️ מעבדת סדנת AI**: [מעבדת סדנת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - תרגילים ממוקדי AI
- **💡 התחלה מהירה**: [מדריך הגדרת סדנה](workshop/README.md#quick-start) - קונפיגורציית סביבה

**מומלץ עבור**: הכשרות ארגוניות, קורסים באוניברסיטה, למידה עצמאית ומחנות אימון למפתחים.

---

## 📖 העמקה: יכולות AZD

מעבר ליסודות, AZD מספק תכונות חזקות לפריסות ייצור:

- **פריסות מבוססות תבניות** - שימוש בתבניות מובנות לדפוסי יישומים נפוצים
- **תשתית כקוד** - ניהול משאבי Azure באמצעות Bicep או Terraform  
- **זרימות עבודה משולבות** - פריסה, ניהול, וניטור חלק של יישומים
- **מפתחים וחוויית עבודה** - אופטימיזציה לפרודוקטיביות ולניסיון המפתח

### **AZD + Microsoft Foundry: מושלם לפריסות AI**

**למה AZD לפתרונות AI?** AZD מתמודד עם האתגרים העיקריים שמפתחי AI נתקלים בהם:

- **תבניות מוכנות ל-AI** - תבניות קונפיגורציה מראש עבור דגמי Microsoft Foundry, שירותי Azure AI, ועומסי עבודה של ML
- **פריסות AI מאובטחות** - דפוסי אבטחה מובנים לשירותי AI, מפתחות API וקצוות מודלים  
- **דפוסי AI לייצור** - שיטות עבודה מומלצות לפריסות AI מדרגיות וחסכוניות
- **זרימות עבודה מקצה לקצה** - מפיתוח מודלים ועד לפריסה עם ניטור נכון
- **אופטימיזציה בעלות** - הקצאת משאבים חכמה ואסטרטגיות סקיילינג לעומסי AI
- **אינטגרציית Microsoft Foundry** - חיבור חלק לקטלוג המודלים וקצוות Microsoft Foundry

---

## 🎯 ספריית תבניות ודוגמאות

### מומלץ: תבניות Microsoft Foundry
**תתחילו כאן אם אתם מפריסים יישומי AI!**

> **הערה:** תבניות אלו מראות דפוסי AI שונים. חלקן דוגמאות חיצוניות מ-Azure Samples, אחרות מימושים מקומיים.

| תבנית | פרק | מורכבות | שירותים | סוג |
|----------|---------|------------|----------|------|
| [**התחל עם צ׳אט AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | חיצוני |
| [**התחל עם סוכני AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | פרק 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| חיצוני |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | חיצוני |
| [**התחל מהיר עם אפליקציית צ׳אט OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | חיצוני |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | חיצוני |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | חיצוני |
| [**פתרון רב-סוכני לקמעונאות**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **מקומי** |

### מומלץ: תרחישי למידה שלמים
**תבניות יישומים מוכנות לייצור הממופות לפרקי למידה**

| תבנית | פרק למידה | מורכבות | עיקרי הלמידה |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | דפוסי פריסת AI בסיסיים |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | מימוש RAG עם Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | פרק 4 | ⭐⭐ | אינטגרציית בינה תמלילית במסמכים |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | מסגרת סוכנים ופונקציות קול**
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐ | תזמור AI ארגוני |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | ארכיטקטורה רב-סוכנית עם סוכני לקוח ומלאי |

### למידה לפי סוג דוגמה

> **📌 דוגמאות מקומיות מול חיצוניות:**  
> **דוגמאות מקומיות** (בריפו זה) = מוכנות לשימוש מידי  
> **דוגמאות חיצוניות** (Azure Samples) = לשכפל ממאגרי קוד מקושרים

#### דוגמאות מקומיות (מוכנות לשימוש)
- [**פתרון רב-סוכני לקמעונאות**](examples/retail-scenario.md) - מימוש מלא מוכן לייצור עם תבניות ARM
  - ארכיטקטורה רב-סוכנית (סוכן לקוח + סוכן מלאי)
  - ניטור והערכה מקיפים
  - פריסה בלחיצה אחת דרך תבנית ARM

#### דוגמאות מקומיות - אפליקציות מכולות (פרקים 2-5)
**דוגמאות פריסה מקיפה של מכולות בריפו זה:**
- [**דוגמאות לאפליקציית מכולות**](examples/container-app/README.md) - מדריך מלא לפריסות מכולות  
  - [API בסיסי ב-Flask](../../examples/container-app/simple-flask-api) - API REST בסיסי עם סקייל-טו-זירו  
  - [ארכיטקטורת מיקרו-שירותים](../../examples/container-app/microservices) - פריסה מוכנה לייצור של שירותים מרובים  
  - דפוסי פריסה של התחלה מהירה, ייצור ומתקדמים  
  - הנחיות למוניטורינג, אבטחה ואופטימיזציה של עלויות  

#### דוגמאות חיצוניות - אפליקציות פשוטות (פרקים 1-2)  
**שכפל את המאגרי דגמי Azure Samples להתחלה:**  
- [אפליקציית ווב פשוטה - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - דפוסי פריסה בסיסיים  
- [אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - פריסת תוכן סטטי  
- [אפליקציית מכולות - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - פריסת REST API  

#### דוגמאות חיצוניות - אינטגרציה עם מסדי נתונים (פרקים 3-4)  
- [אפליקציית מסד נתונים - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - דפוסי חיבוריות למסד נתונים  
- [פונקציות + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - תזרים עבודה נתונים ללא שרת  

#### דוגמאות חיצוניות - דפוסים מתקדמים (פרקים 4-8)  
- [מיקרו-שירותים בג'אווה](https://github.com/Azure-Samples/java-microservices-aca-lab) - ארכיטקטורות רב-שירותיות  
- [משימות באפליקציות מכולות](https://github.com/Azure-Samples/container-apps-jobs) - עיבוד ברקע  
- [צינור ML ארגוני](https://github.com/Azure-Samples/mlops-v2) - דפוסי ML מוכנים לייצור  

### אוספי תבניות חיצוניים  
- [**גלריית תבניות רשמית של AZD**](https://azure.github.io/awesome-azd/) - אוסף ממוין של תבניות רשמיות וקהילתיות  
- [**תבניות Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - תיעוד תבניות מיקרוסופט Learn  
- [**ספריית דוגמאות**](examples/README.md) - דוגמאות לימוד מקומיות עם הסברים מפורטים  

---

## 📚 משאבי לימוד והפניות

### הפניות מהירות  
- [**גליון פקודות**](resources/cheat-sheet.md) - פקודות azd חיוניות מאורגנות לפי פרק  
- [**מונחים**](resources/glossary.md) - מונחי Azure ו-azd  
- [**שאלות נפוצות (FAQ)**](resources/faq.md) - שאלות נפוצות מאורגנות לפי פרק לימוד  
- [**מדריך לימוד**](resources/study-guide.md) - תרגילים מעשיים מקיפים  

### סדנאות מעשיות  
- [**מעבדת סדנת AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפוך את פתרונות ה-AI שלך לפריסות AZD (2-3 שעות)  
- [**סדנה אינטראקטיבית**](workshop/README.md) - 8 מודולים עם תרגילים מודרכים באמצעות MkDocs ו-GitHub Codespaces  
  - עוקב אחרי: מבוא → בחירה → אימות → ניתוח → קונפיגורציה → התאמה אישית → סגירה → סיום  

### משאבי לימוד חיצוניים  
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [מחשבון תמחור Azure](https://azure.microsoft.com/pricing/calculator/)  
- [מצב Azure](https://status.azure.com/)  

### מיומנויות סוכן AI לעורך שלך  
- [**מיומנויות Microsoft Azure ב-skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 מיומנויות סוכן פתוחות ל-Azure AI, Foundry, פריסה, אבחון, אופטימיזציה של עלויות ועוד. התקן אותן ב-GitHub Copilot, Cursor, Claude Code או כל סוכן נתמך:  
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```
  
---

## 🔧 מדריך פתרון תקלות מהיר

**בעיות נפוצות למתחילים ופתרונות מיידיים:**  

<details>
<summary><strong>❌ "azd: פקודה לא נמצאה"</strong></summary>

```bash
# התקן קודם את AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# אמת את ההתקנה
azd version
```
</details>  

<details>
<summary><strong>❌ "לא נמצאה מנוי" או "המנוי לא הוגדר"</strong></summary>

```bash
# רשום את המנויים הזמינים
az account list --output table

# הגדר מנוי ברירת מחדל
az account set --subscription "<subscription-id-or-name>"

# הגדר עבור סביבה של AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# אמת
az account show
```
</details>  

<details>
<summary><strong>❌ "InsufficientQuota" או "מידת הקצבה עברה"</strong></summary>

```bash
# נסה אזור Azure שונה
azd env set AZURE_LOCATION "westus2"
azd up

# או השתמש ב-SKU קטנים יותר בפיתוח
# ערוך את infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>  

<details>
<summary><strong>❌ "azd up" נכשל באמצע התהליך</strong></summary>

```bash
# אפשרות 1: לנקות ולנסות שוב
azd down --force --purge
azd up

# אפשרות 2: לתקן רק את התשתית
azd provision

# אפשרות 3: לבדוק מצב מפורט
azd show

# אפשרות 4: לבדוק יומנים ב-Azure Monitor
azd monitor --logs
```
</details>  

<details>
<summary><strong>❌ "אימות נכשל" או "האסימון פג תוקף"</strong></summary>

```bash
# אמת את זהותך מחדש עבור AZD
azd auth logout
azd auth login

# אופציונלי: רענן גם את Azure CLI אם אתה מריץ פקודות az
az logout
az login

# אמת את הזהות
az account show
```
</details>  

<details>
<summary><strong>❌ "משאב כבר קיים" או קונפליקטים בשם</strong></summary>

```bash
# AZD מייצר שמות ייחודיים, אך במקרה של התנגשות:
azd down --force --purge

# ואז לנסות שוב עם סביבה חדשה
azd env new dev-v2
azd up
```
</details>  

<details>
<summary><strong>❌ פריסת תבנית אורכת יותר מדי זמן</strong></summary>

**זמני המתנה רגילים:**  
- אפליקציית ווב פשוטה: 5-10 דקות  
- אפליקציה עם מסד נתונים: 10-15 דקות  
- אפליקציות AI: 15-25 דקות (פריסת OpenAI איטית)  

```bash
# בדוק התקדמות
azd show

# אם תקוע יותר מ-30 דקות, בדוק את פורטל Azure:
azd monitor --overview
# חפש פריסות שנכשלו
```
</details>  

<details>
<summary><strong>❌ "הרשאה נדחתה" או "אסור"</strong></summary>

```bash
# בדוק את התפקיד שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# אתה צריך לפחות תפקיד "משתף פעולה"
# בקש ממנהל ה-Azure שלך להעניק:
# - משתף פעולה (למשאבים)
# - מנהל גישת משתמשים (להקצאות תפקידים)
```
</details>  

<details>
<summary><strong>❌ לא מצליח למצוא את כתובת ה-URL של האפליקציה שפורסה</strong></summary>

```bash
# הצג את כל נקודות הקצה של השירות
azd show

# או פתח את הפורטל של Azure
azd monitor

# בדוק שירות ספציפי
azd env get-values
# חפש משתני *_URL
```
</details>  

### 📚 משאבים מלאים לפתרון תקלות

- **מדריך בעיות נפוצות:** [פתרונות מפורטים](docs/chapter-07-troubleshooting/common-issues.md)  
- **בעיות ייחודיות ל-AI:** [פתרון תקלות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)  
- **מדריך דיבוג:** [דיבוג צעד אחרי צעד](docs/chapter-07-troubleshooting/debugging.md)  
- **קבל עזרה:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli  

---

## 🎓 סיום קורס ותעודה

### מעקב התקדמות  
עקוב אחרי ההתקדמות שלך בכל פרק:  

- [ ] **פרק 1**: יסודות והתחלה מהירה ✅  
- [ ] **פרק 2**: פיתוח מבוסס AI ✅  
- [ ] **פרק 3**: קונפיגורציה ואימות ✅  
- [ ] **פרק 4**: תשתית כקוד ופריסה ✅  
- [ ] **פרק 5**: פתרונות AI מרובי-סוכנים ✅  
- [ ] **פרק 6**: אימות ותכנון לפני פריסה ✅  
- [ ] **פרק 7**: פתרון תקלות ודיבוג ✅  
- [ ] **פרק 8**: דפוסי ייצור וארגוניים ✅  

### אימות לימוד  
לאחר השלמת כל פרק, אמת את הידע על ידי:  
1. **תרגיל מעשי**: השלמת פריסת הפרק  
2. **מבחן ידע**: עיין בקטגוריית השאלות הנפוצות (FAQ) לפרק שלך  
3. **דיון קהילתי**: שתף את הניסיון שלך ב-Discord Azure  
4. **המשך לפרק הבא**: עבור לרמת מורכבות הבאה  

### יתרונות סיום הקורס  
בסיום כל הפרקים, תקבל:  
- **ניסיון ייצור**: פריסת אפליקציות AI אמיתיות ב-Azure  
- **כישורים מקצועיים**: יכולות פריסה מוכנות לארגון  
- **הכרה קהילתית**: חבר פעיל בקהילת מפתחי Azure  
- **קידום קריירה**: מומחיות מבוקשת ב-AZD ופריסת AI  

---

## 🤝 קהילה ותמיכה

### קבל עזרה ותמיכה  
- **בעיות טכניות**: [דווח על באגים ובקש תכונות](https://github.com/microsoft/azd-for-beginners/issues)  
- **שאלות לימודיות**: [קהילת Discord של Microsoft Azure](https://discord.gg/microsoft-azure) ו-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **עזרה ייחודית ל-AI**: הצטרף ל-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **תיעוד**: [תיעוד רשמי של Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### תובנות קהילתיות מ-Discord Microsoft Foundry

**תוצאות סקרים אחרונות מערוץ #Azure:**  
- **45%** מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI  
- **האתגרים המובילים**: פריסות רב-שירותיות, ניהול אישורי גישה, מוכנות ייצור  
- **הנפוצים ביותר מבוקשים**: תבניות ייחודיות ל-AI, מדריכי פתרון תקלות, שיטות עבודה מומלצות  

**הצטרף לקהילה שלנו כדי:**  
- לשתף חוויות עם AZD + AI ולקבל עזרה  
- לקבל גישות מוקדמות לתבניות AI חדשות  
- לתרום לשיטות עבודה מומלצות בפריסת AI  
- להשפיע על פיתוח תכונות AI + AZD בעתיד  

### תרומה לקורס  
נשמח לתרומות! אנא קרא את [מדריך התרומה](CONTRIBUTING.md) לפרטים על:  
- **שיפור תוכן**: שפר פרקים ודוגמאות קיימות  
- **דוגמאות חדשות**: הוסף תרחישים בעולם האמיתי ותבניות  
- **תרגום**: עזור בשמירה על תמיכה ברב-לשוניות  
- **דיווח באגים**: שפר דיוק ובהירות  
- **סטנדרטים קהילתיים**: עקוב אחרי הכללים שלנו לקהילה מכילה  

---

## 📄 מידע על הקורס

### רישיון  
הפרויקט הזה רישיון תחת רישיון MIT - למידע נוסף קרא את הקובץ [LICENSE](../../LICENSE).  

### משאבי לימוד נוספים של Microsoft  

הצוות שלנו מייצר קורסים מקיפים נוספים:  

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain  
[![LangChain4j למתחילים](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)  
[![LangChain.js למתחילים](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)  
[![LangChain למתחילים](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)  
---

### Azure / Edge / MCP / סוכנים  
[![AZD למתחילים](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Edge AI למתחילים](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![MCP למתחילים](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![סוכני AI למתחילים](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  

---  

### סדרת AI יצרני  
[![AI יצרני למתחילים](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![AI יצרני (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
[![AI יצרני (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![בינה מלאכותית יצירתית (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### ליבה ללמידה
[![למידת מכונה למתחילים](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![מדעי הנתונים למתחילים](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![בינה מלאכותית למתחילים](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![סייבר למתחילים](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![פיתוח ווב למתחילים](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT למתחילים](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![פיתוח XR למתחילים](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת Copilot
[![Copilot לתכנות זוגי עם בינה מלאכותית](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot ל-C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![הרפתקאות Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ניווט קורס

**🚀 מוכן להתחיל ללמוד?**

**מתחילים**: התחל עם [פרק 1: יסודות והתחלה מהירה](#-chapter-1-foundation--quick-start)  
**מפתחים בבינה מלאכותית**: עבור ל-[פרק 2: פיתוח בינה מלאכותית-ראשונה](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**מפתחים מנוסים**: התחל עם [פרק 3: קונפיגורציה ואימות](#️-chapter-3-configuration--authentication)

**שלבים הבאים**: [התחל פרק 1 - יסודות AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->