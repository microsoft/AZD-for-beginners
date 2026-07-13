# AZD למתחילים: מסלול לימוד מובנה

![AZD-for-beginners](../../translated_images/he/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### תרגומים אוטומטיים (תמיד מעודכנים)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](./README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **מעדיפים לשכפל מקומית?**
>
> מאגר זה כולל למעלה מ-50 תרגומים בשפות שונות מה שמגדיל משמעותית את גודל ההורדה. כדי לשכפל בלי תרגומים, השתמשו ב-sparse checkout:
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
> זה נותן לכם כל מה שצריך כדי להשלים את הקורס עם הורדה מהירה יותר משמעותית.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 מה חדש ב-azd היום

> 📌 קורס זה מאומת כנגד **`azd 1.27.1`** (יולי 2026). הריצו `azd version` כדי לבדוק את גרסת הבנייה שלכם, ו-`azd upgrade` כדי לקבל את הגרסה העדכנית.

Azure Developer CLI התרחב מעבר ליישומי רשת ו-API מסורתיים. היום, azd הוא הכלי היחיד לפריסת **כל** אפליקציה ל-Azure—כולל יישומי בינה מלאכותית וסוכנים חכמים.

זה מה שזה אומר בשבילכם:

- **סוכני בינה מלאכותית הם עכשיו עומסי עבודה מהשורה הראשונה ב-azd.** תוכלו לאתחל, לפרוס ולנהל פרויקטים של סוכנים חכמים עם אותו תהליך `azd init` → `azd up` שאתם כבר מכירים.
- **מחזור חיים מלא של סוכן מ־CLI.** תוסף `azure.ai.agents` עכשיו כולל את כל המסע—`azd ai agent init` ליצירה, `azd ai agent invoke` לבדיקות (עם פלט תזמון תגובה), `azd ai agent eval generate` ו-`azd ai agent optimize` למדידה ושיפור איכות, ו-`azd ai agent delete` לניקוי.
- **יותר אבני בניין בינה מלאכותית.** תוספים חדשים בביקורת—`azure.ai.skills` ו-`azure.ai.connections`—מאפשרים ניהול יכולות סוכן חוזרות וקישורי Foundry ישירות עם azd.
- **אינטגרציה עם Microsoft Foundry** מביאה פריסת מודלים, אירוח סוכן, וקביעת תצורת שירותי AI ישירות לאקוסיסטם התבניות של azd.
- **הבסיס היומיומי יותר חלק.** גרסאות אחרונות הפכו את `azd init` לאידמפוטנטי (בטוח להרצה חוזרת), טיפלו בבהירות של `azd auth login` עם ניקוי אוטומטי של אסימוני תוקף שפג, והוסיפו הפעלה ראשונית ידידותית ל-`azd tool`.
- **תהליך העבודה המרכזי לא השתנה.** בין אם אתם מפעילים אפליקציית מטלות, מיקרו-שירות, או פתרון AI עם סוכנים מרובים, הפקודות נשארות אותו דבר.

> **הערה למשתמשי Aspire:** מיקרוסופט מכנה את המוצר פשוט **Aspire** (לשעבר ".NET Aspire"). התמיכה של azd ב-Aspire לא השתנתה—רק השם עודכן.

אם כבר השתמשתם ב-azd לפני כן, תמיכת ה-AI היא הרחבה טבעית—לא כלי נפרד או מסלול מתקדם. אם אתם מתחילים עכשיו, תלמדו תהליך עבודה אחד שעובד לכל דבר.

---

## 🚀 מה זה Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** הוא כלי שורת פקודה ידידותי למפתחים שמפשט משמעותית את פריסת האפליקציות ל-Azure. במקום ליצור ולחבר עשרות משאבי Azure ידנית, אפשר לפרוס אפליקציות שלמות בפקודה אחת.

### הקסם של `azd up`

```bash
# הפקודה היחידה הזו עושה הכל:
# ✅ יוצרת את כל המשאבים של Azure
# ✅ מגדירה רשת ואבטחה
# ✅ בונה את קוד היישום שלך
# ✅ מפרסמת ל-Azure
# ✅ נותנת לך כתובת URL פעילה
azd up
```

**זהו זה!** ללא צורך בלחיצות ב-Azure Portal, ללא תבניות ARM מורכבות ללמידה מוקדמת, וללא תצורה ידנית - רק אפליקציות עובדות על Azure.

---

## ❓ Azure Developer CLI מול Azure CLI: מה ההבדל?

זו השאלה הנפוצה ביותר שהמתחילים שואלים. הנה התשובה הפשוטה:

| תכונה | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **מטרה** | ניהול משאבי Azure בודדים | פריסת אפליקציות שלמות |
| **גישה** | ממוקד תשתית | ממוקד אפליקציה |
| **דוגמה** | `az webapp create --name myapp...` | `azd up` |
| **עקומת למידה** | צריך להכיר שירותי Azure | רק להכיר את האפליקציה שלך |
| **מתאים ל־** | DevOps, תשתיות | מפתחים, פיתוח ראשוני |

### אנלוגיה פשוטה

- **Azure CLI** זה כמו שיש לך את כל הכלים לבניית בית - פטישים, מסורים, מסמרים. אתה יכול לבנות כל דבר, אבל צריך לדעת בנייה.
- **Azure Developer CLI** זה כמו לשכור קבלן - אתה מתאר מה שאתה רוצה, והוא מטפל בבנייה.

### מתי להשתמש בכל אחד

| תרחיש | השתמש בזה |
|----------|----------|
| "אני רוצה לפרוס את אפליקציית הרשת שלי במהירות" | `azd up` |
| "אני צריך ליצור רק חשבון אחסון" | `az storage account create` |
| "אני בונה אפליקציית בינה מלאכותית מלאה" | `azd init --template azure-search-openai-demo` |
| "אני צריך לאבחן משאב Azure ספציפי" | `az resource show` |
| "אני רוצה פריסה מוכנה לייצור תוך דקות" | `azd up --environment production` |

### הם עובדים ביחד!

AZD משתמש ב-Azure CLI מתחת למכסה המנוע. תוכלו להשתמש בשניהם:
```bash
# פרוס את האפליקציה שלך באמצעות AZD
azd up

# לאחר מכן כוונן משאבים ספציפיים עם Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 מצאו תבניות ב-Awesome AZD

אל תתחילו מאפס! **Awesome AZD** היא אוסף הקהילה עם תבניות מוכנות לפריסה:

| משאב | תיאור |
|----------|-------------|
| 🔗 [**גלריית Awesome AZD**](https://azure.github.io/awesome-azd/) | דפדפו בין מעל 200 תבניות עם פריסה בלחיצה אחת |
| 🔗 [**שלח תבנית**](https://github.com/Azure/awesome-azd/issues) | תרמו תבנית משלכם לקהילה |
| 🔗 [**מאגר GitHub**](https://github.com/Azure/awesome-azd) | כוכבו וחקרו את הקוד המקור |

### תבניות AI פופולריות מ-Awesome AZD

```bash
# שיחה RAG עם דגמי Microsoft Foundry + חיפוש באמצעות בינה מלאכותית
azd init --template azure-search-openai-demo

# אפליקציית שיחה בינה מלאכותית מהירה
azd init --template openai-chat-app-quickstart

# סוכני בינה מלאכותית עם סוכני Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 התחילו ב-3 שלבים

לפני שאתם מתחילים, ודאו שהמחשב שלכם מוכן לתבנית שאתם רוצים לפרוס:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

אם בדיקה נדרשת נכשלת, תקנו את זה קודם ואז המשיכו עם ההתחלה המהירה.

### שלב 1: התקנת AZD (2 דקות)

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

### שלב 2: אימות ל-AZD

```bash
# אופציונלי אם אתה מתכנן להשתמש בפקודות Azure CLI ישירות בקורס זה
az login

# דרוש עבור זרימות עבודה של AZD
azd auth login
```

אם אינכם בטוחים איזה מהם אתם צריכים, עקבו אחרי זרימת ההתקנה המלאה ב-[התקנה והגדרה](docs/chapter-01-foundation/installation.md#authentication-setup).

### שלב 3: פרסו את האפליקציה הראשונה שלכם

```bash
# אתחול מתבנית
azd init --template todo-nodejs-mongo

# פריסה ל-Azure (יוצר הכל!)
azd up
```

**🎉 זהו זה!** האפליקציה שלכם עכשיו חיה על Azure.

### ניקוי (אל תשכחו!)

```bash
# הסר את כל המשאבים בסיום הניסוי
azd down --force --purge
```

---

## 📚 איך להשתמש בקורס הזה

הקורס בנוי ל**למידה הדרגתית** - התחילו מהמקום שהכי נוח לכם ועבדו מעלה:

| הניסיון שלכם | התחילו כאן |
|-----------------|------------|
| **חדש לגמרי ב-Azure** | [פרק 1: בסיס](#-chapter-1-foundation--quick-start) |
| **מכיר את Azure, חדש ל-AZD** | [פרק 1: בסיס](#-chapter-1-foundation--quick-start) |
| **רוצה לפרוס אפליקציות AI** | [פרק 2: פיתוח AI ראשון](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **רוצה תרגול מעשי** | [🎓 סדנה אינטראקטיבית](workshop/README.md) - מעבדה מונחית של 3-4 שעות |
| **צריך דפוסי ייצור** | [פרק 8: ייצור וארגון](#-chapter-8-production--enterprise-patterns) |

### הגדרה מהירה

1. **העתק מאגר זה**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **שכפל אותו**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **קבל עזרה**: [קהילת Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **מעדיפים לשכפל מקומית?**

> מאגר זה כולל למעלה מ-50 תרגומים בשפות שונות מה שמגדיל משמעותית את גודל ההורדה. כדי לשכפל בלי תרגומים, השתמשו ב-sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> זה נותן לכם את כל מה שצריך כדי להשלים את הקורס עם הורדה מהירה יותר משמעותית.


## סקירת הקורס

שלטו ב-Azure Developer CLI (azd) דרך פרקים מובנים שנועדו ללמידה הדרגתית. **מוקד מיוחד על פריסת יישומי AI עם אינטגרציה של Microsoft Foundry.**


### מדוע הקורס הזה חיוני למפתחים מודרניים

מבוסס על תובנות מקהילת Microsoft Foundry בדיסקורד, **45% מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של בינה מלאכותית** אך נתקלים באתגרים עם:
- ארכיטקטורות בינה מלאכותית מורכבות עם שירותים מרובים
- שיטות עבודה מומלצות לפריסה בסביבת ייצור של בינה מלאכותית  
- אינטגרציה וקונפיגורציה של שירותי Azure AI
- אופטימיזציית עלויות לעומסי עבודה של בינה מלאכותית
- פתרון בעיות ספציפיות לפריסת בינה מלאכותית

### מטרות הלמידה

באמצעות השלמת הקורס המבנה הזה, תלמד:
- **להתמחות ביסודות AZD**: מושגים מרכזיים, התקנה וקונפיגורציה
- **לפרוס יישומי בינה מלאכותית**: שימוש ב-AZD עם שירותי Microsoft Foundry
- **ליישם תשתית כקוד**: ניהול משאבי Azure בעזרת תבניות Bicep
- **לטפל בבעיות פריסה**: פתרון בעיות נפוצות ו-debug
- **לאופטימיזציה לפרודקשן**: אבטחה, סקיילינג, ניטור וניהול עלויות
- **לבנות פתרונות מרובי-סוכנים**: פריסת ארכיטקטורות בינה מלאכותית מורכבות

## לפני שמתחילים: חשבונות, גישה והנחות

לפני שתתחיל בפרק 1, וודא שיש לך את הדברים הבאים. שלבי ההתקנה במדריך זה מניחים שהיסודות האלה כבר מטופלים.

- **מנוי Azure**: תוכל להשתמש במנוי קיים מעבודה או מחשבון פרטי, או ליצור [ניסיון חינם](https://aka.ms/azurefreetrial) כדי להתחיל.
- **הרשאה ליצירת משאבי Azure**: ברוב התרגילים עליך לקבל לפחות גישת **Contributor** במנוי או בקבוצת המשאבים המטרה. בפרקים מסוימים מניחים גם שאתה יכול ליצור קבוצות משאבים, זהויות מנוהלות והקצאות RBAC.
- [**חשבון GitHub**](https://github.com): שימושי לפיצול הריפוזיטורי, למעקב אחר השינויים שלך ולהשתמש ב-GitHub Codespaces לסדנא.
- **דרישות הריצה לתבניות**: חלק מהתבניות דורשות כלים מקומיים כמו Node.js, Python, Java או Docker. הפעל את מאמת ההתקנה לפני ההתחלה כדי לזהות חוסרים.
- **היכרות בסיסית עם טרמינל**: אינך צריך להיות מומחה, אבל עליך להרגיש בנוח להריץ פקודות כמו `git clone`, `azd auth login`, ו-`azd up`.

> **עובדים במנוי ארגוני?**
> אם סביבת Azure שלך מנוהלת על ידי מנהל, ודא מראש שאתה יכול לפרוס משאבים במנוי או בקבוצת המשאבים שתכננת להשתמש בהם. אם לא, בקש מנוי Sandbox או גישת Contributor לפני שתתחיל.

> **חדש ב-Azure?**
> התחל עם מנוי ניסיון עצמי של Azure או מנוי pay-as-you-go בכתובת https://aka.ms/azurefreetrial כדי שתוכל להשלים את התרגילים מתחילתם ועד סופם בלי להמתין לאישורים ברמת הדייר.

## 🗺️ מפת הקורס: ניווט מהיר לפי פרק

לכל פרק יש README ייעודי עם מטרות למידה, התחלות מהירות ותרגילים:

| פרק | נושא | שיעורים | משך | מורכבות |
|---------|-------|---------|----------|------------|
| **[פרק 1: יסודות](docs/chapter-01-foundation/README.md)** | התחלה | [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [התקנה](docs/chapter-01-foundation/installation.md) &#124; [פרויקט ראשון](docs/chapter-01-foundation/first-project.md) | 30-45 דק' | ⭐ |
| **[פרק 2: פיתוח בינה מלאכותית](docs/chapter-02-ai-development/README.md)** | אפליקציות מבוססות AI | [אינטגרציה עם Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [סוכני AI](docs/chapter-02-ai-development/agents.md) &#124; [פריסת מודלים](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [סדנא](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 שעות | ⭐⭐ |
| **[פרק 3: קונפיגורציה](docs/chapter-03-configuration/README.md)** | אימות ואבטחה | [קונפיגורציה](docs/chapter-03-configuration/configuration.md) &#124; [אימות ואבטחה](docs/chapter-03-configuration/authsecurity.md) | 45-60 דק' | ⭐⭐ |
| **[פרק 4: תשתית](docs/chapter-04-infrastructure/README.md)** | Infrastructure as Code ופריסה | [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [פרוביז'נינג](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 שעות | ⭐⭐⭐ |
| **[פרק 5: מרובי סוכנים](docs/chapter-05-multi-agent/README.md)** | פתרונות סוכן AI | [תסריט קמעונאי](examples/retail-scenario.md) &#124; [תבניות תיאום](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[פרק 6: לפני פריסה](docs/chapter-06-pre-deployment/README.md)** | תכנון ואימות | [בדיקות מקדימות](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | שעה | ⭐⭐ |
| **[פרק 7: פתרון בעיות](docs/chapter-07-troubleshooting/README.md)** | דיבאג ותיקון | [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) &#124; [דיבאגינג](docs/chapter-07-troubleshooting/debugging.md) &#124; [בעיות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 שעות | ⭐⭐ |
| **[פרק 8: פרודקשן](docs/chapter-08-production/README.md)** | תבניות ארגוניות | [שיטות עבודה לפרודקשן](docs/chapter-08-production/production-ai-practices.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[🎓 סדנא](workshop/README.md)** | מעבדת תרגול | [מבוא](workshop/docs/instructions/0-Introduction.md) &#124; [בחירה](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [אימות](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [קונפיגורציה](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [פירוק תשתית](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [סיכום](workshop/docs/instructions/7-Wrap-up.md) | 3-4 שעות | ⭐⭐ |

**סה"כ משך הקורס:** ~10-14 שעות | **רמת מיומנות:** מתחיל → מוכן לפרודקשן

---

## 📚 פרקי למידה

*בחר את מסלול הלמידה שלך על פי רמת הניסיון והמטרות*

### 🚀 פרק 1: יסודות והתחלה מהירה
**דרישות מוקדמות**: מנוי Azure, ידע בסיסי בפקודות שורת הפקודה  
**משך**: 30-45 דקות  
**מורכבות**: ⭐

#### מה תלמד
- הבנת יסודות Azure Developer CLI
- התקנת AZD על הפלטפורמה שלך
- הפריסה הראשונית המצליחה שלך

#### משאבי למידה
- **🎯 התחלה כאן**: [מהו Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 תיאוריה**: [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) - מושגים ומונחים מרכזיים
- **⚙️ התקנה**: [התקנה והגדרה](docs/chapter-01-foundation/installation.md) - מדריכים לפי פלטפורמה
- **🛠️ תרגול מעשי**: [הפרויקט הראשון שלך](docs/chapter-01-foundation/first-project.md) - הדרכה צעד-אחר-צעד
- **📋 הפנייה מהירה**: [עלון פקודות](resources/cheat-sheet.md)

#### תרגילים מעשיים
```bash
# בדיקה מהירה של ההתקנה
azd version

# פרוס את היישום הראשון שלך
azd init --template todo-nodejs-mongo
azd up
```

**💡 תוצאת הפרק**: לפרוס בהצלחה יישום ווב פשוט ל-Azure באמצעות AZD

**✅ אימות הצלחה:**
```bash
# לאחר סיום הפרק הראשון, עליך להיות מסוגל:
azd version              # מציג גרסה מותקנת
azd init --template todo-nodejs-mongo  # מאתחל פרויקט
azd up                  # מפרסם ל-Azure
azd show                # מציג כתובת URL של האפליקציה הפועלת
# האפליקציה נפתחת בדפדפן ועובדת
azd down --force --purge  # מנקה משאבים
```

**📊 זמן נדרש:** 30-45 דקות  
**📈 רמת מיומנות לאחר:** מסוגל לפרוס יישומים בסיסיים באופן עצמאי
**📈 רמת מיומנות לאחר:** מסוגל לפרוס יישומים בסיסיים באופן עצמאי

---

### 🤖 פרק 2: פיתוח AI-First (מומלץ למפתחי AI)
**דרישות מוקדמות**: פרק 1 הושלם  
**משך**: 1-2 שעות  
**מורכבות**: ⭐⭐

#### מה תלמד
- אינטגרציה של Microsoft Foundry עם AZD
- פריסת אפליקציות מופעלות AI
- הבנת קונפיגורציות שירותי AI

#### משאבי למידה
- **🎯 התחלה כאן**: [אינטגרציה עם Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 סוכני AI**: [מדריך סוכני AI](docs/chapter-02-ai-development/agents.md) - פריסת סוכנים אינטליגנטיים עם AZD
- **📖 תבניות**: [פריסת מודלי AI](docs/chapter-02-ai-development/ai-model-deployment.md) - פריסה וניהול של מודלי AI
- **🛠️ סדנא**: [מעבדת סדנא ל-AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - עשו את הפתרונות שלכם מוכנים ל-AZD
- **🎥 מדריך אינטראקטיבי**: [חומרי סדנא](workshop/README.md) - למידה מבוססת דפדפן עם MkDocs * סביבה DevContainer
- **📋 תבניות**: [תבניות Microsoft Foundry](#מקורות-הסדנה)
- **📝 דוגמאות**: [דוגמאות לפריסת AZD](examples/README.md)

#### תרגילים מעשיים
```bash
# פרסם את יישום הבינה המלאכותית הראשון שלך
azd init --template azure-search-openai-demo
azd up

# נסה תבניות בינה מלאכותית נוספות
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 תוצאת הפרק**: לפרוס ולהגדיר אפליקציית שיחה מופעלת AI עם יכולות RAG

**✅ אימות הצלחה:**
```bash
# לאחר פרק 2, עליך להיות מסוגל:
azd init --template azure-search-openai-demo
azd up
# לבדוק את ממשק הצ'אט של ה-AI
# לשאול שאלות ולקבל תגובות מונחות AI עם מקורות
# לוודא שהאינטגרציה של החיפוש פועלת
azd monitor  # לבדוק ש-Application Insights מציג טלמטריה
azd down --force --purge
```

**📊 זמן נדרש:** 1-2 שעות  
**📈 רמת מיומנות לאחר:** יכול לפרוס ולהגדיר אפליקציות AI מוכנות לייצור  
**💰 מודעות לעלויות:** להבין עלויות פיתוח $80-150/חודש, עלויות פרודקשן $300-3500/חודש

#### 💰 התחשבות בעלויות לפריסות AI

**סביבת פיתוח (הוערך $80-150/חודש):**
- מודלים של Microsoft Foundry (תשלום לפי שימוש): $0-50/חודש (בהתאם לשימוש בטוקנים)
- חיפוש AI (רמה בסיסית): $75/חודש
- Container Apps (צריכה): $0-20/חודש
- אחסון (סטנדרטי): $1-5/חודש

**סביבת ייצור (הוערך $300-3,500+/חודש):**
- מודלים של Microsoft Foundry (PTU לביצועים עקביים): $3,000+/חודש או תשלום לפי שימוש עם נפח גבוה
- חיפוש AI (רמה סטנדרטית): $250/חודש
- Container Apps (ייעודי): $50-100/חודש
- Application Insights: $5-50/חודש
- אחסון (פרימיום): $10-50/חודש

**💡 טיפים לאופטימיזציה בעלויות:**
- השתמש ב**רמת חינם** למודלים של Microsoft Foundry ללמידה (כולל 50,000 טוקנים של Azure OpenAI לחודש)
- הרץ `azd down` כדי לשחרר משאבים כשאינך מפתח פעיל
- התחל עם חיוב מבוסס צריכה, שדרג ל-PTU רק לפרודקשן
- השתמש ב-`azd provision --preview` כדי לאמוד עלויות לפני פריסה
- אפשר סקיילינג אוטומטי: תשלם רק על שימוש אמיתי

**מעקב עלויות:**
```bash
# בדוק עלויות חודשיות משוערות
azd provision --preview

# נטר עלויות בפועל בפורטל Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ פרק 3: קונפיגורציה ואימות
**דרישות מוקדמות**: פרק 1 הושלם  
**משך**: 45-60 דקות  
**מורכבות**: ⭐⭐

#### מה תלמד
- קונפיגורציה וניהול סביבה
- אימות ושיטות עבודה מומלצות לאבטחה
- מיתוג וארגון משאבים

#### משאבי למידה
- **📖 קונפיגורציה**: [מדריך קונפיגורציה](docs/chapter-03-configuration/configuration.md) - התקנת סביבה
- **🔐 אבטחה**: [דפוסי אימות וזהות מנוהלת](docs/chapter-03-configuration/authsecurity.md) - דפוסי אימות
- **📝 דוגמאות**: [דוגמת אפליקציית מסד נתונים](examples/database-app/README.md) - דוגמאות מסדי נתונים ל-AZD

#### תרגילים מעשיים
- קונפיגורציה לסביבות מרובות (פיתוח, בדיקה, פרודקשן)
- הקמת אימות זהויות מנוהלות
- יישום קונפיגורציות ייחודיות לסביבה

**💡 תוצאת הפרק**: ניהול סביבות מרובות עם אימות ואבטחה תקינים

---

### 🏗️ פרק 4: תשתית כקוד ופריסה
**דרישות מוקדמות**: פרקים 1-3 הושלמו  
**משך**: 1-1.5 שעות  
**מורכבות**: ⭐⭐⭐

#### מה תלמד
- דפוסי פריסה מתקדמים
- תשתית כקוד עם Bicep
- אסטרטגיות פרוביז'נינג של משאבים

#### משאבי למידה
- **📖 פריסה**: [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) - זרימות עבודה מלאות
- **🏗️ פרוביז'נינג**: [ניהול משאבי Azure](docs/chapter-04-infrastructure/provisioning.md) - ניהול משאבי Azure
- **📝 דוגמאות**: [דוגמת Container App](../../examples/container-app) - פריסות בקונטיינרים

#### תרגילים מעשיים
- יצירת תבניות Bicep מותאמות אישית
- פריסת אפליקציות עם שירותים מרובים
- יישום אסטרטגיות פריסה כחול-ירוק

**💡 תוצאת הפרק**: לפרוס אפליקציות מרובות שירותים מורכבות באמצעות תבניות תשתית מותאמות אישית

---


### 🎯 פרק 5: פתרונות AI מרובי-סוכנים (מתקדמים)
**דרישות קדם**: הושלמו פרקים 1-2  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמדו
- תבניות ארכיטקטורה מרובי-סוכנים
- תזמור ותיאום סוכנים
- פריסות מוכנות לייצור של AI

#### מקורות למידה
- **🤖 פרויקט מוביל**: [פתרון ריטייל מרובי-סוכנים](examples/retail-scenario.md) - מימוש שלם
- **🛠️ תבניות ARM**: [חבילת תבניות ARM](../../examples/retail-multiagent-arm-template) - פריסה בלחיצה אחת
- **📖 ארכיטקטורה**: [תבניות תיאום מרובי-סוכנים](docs/chapter-06-pre-deployment/coordination-patterns.md) - תבניות

#### תרגילים מעשיים
```bash
# פרוס את הפתרון הרב-סוכני המלא לקמעונאות
cd examples/retail-multiagent-arm-template
./deploy.sh

# חקור תצורות סוכנים
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 תוצאה בפרק**: פרוסו ונוהלו פתרון AI מרובי-סוכנים מוכן לייצור עם סוכני לקוח ומלאי

---

### 🔍 פרק 6: אימות ותכנון לפני פריסה
**דרישות קדם**: הושלם פרק 4  
**משך**: שעה  
**מורכבות**: ⭐⭐

#### מה תלמדו
- תכנון קיבולת ואימות משאבים
- אסטרטגיות בחירת SKU
- בדיקות טרום-טיסה ואוטומציה

#### מקורות למידה
- **📊 תכנון**: [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) - אימות משאבים
- **💰 בחירה**: [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) - בחירות חסכוניות
- **✅ אימות**: [בדיקות טרום-טיסה](docs/chapter-06-pre-deployment/preflight-checks.md) - סקריפטים אוטומטיים

#### תרגילים מעשיים
- הרצת סקריפטים לבדוק קיבולת
- אופטימיזציית בחירות SKU לחיסכון
- מימוש בדיקות אוטומטיות לפני פריסה

**💡 תוצאה בפרק**: אימות ואופטימיזציה של פריסות לפני ביצוע

---

### 🚨 פרק 7: פתרון תקלות ודיבוג
**דרישות קדם**: כל פרק פריסה שהושלם  
**משך**: 1-1.5 שעות  
**מורכבות**: ⭐⭐

#### מה תלמדו
- גישות שיטתיות לדיבוג
- בעיות ופתרונות שכיחים
- פתרון תקלות ספציפי ל-AI

#### מקורות למידה
- **🔧 בעיות שכיחות**: [בעיות שכיחות](docs/chapter-07-troubleshooting/common-issues.md) - שאלות נפוצות ופתרונות
- **🕵️ דיבוג**: [מדריך דיבוג](docs/chapter-07-troubleshooting/debugging.md) - אסטרטגיות שלב-אחר-שלב
- **🤖 בעיות AI**: [פתרון תקלות AI ספציפי](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - בעיות בשירות AI

#### תרגילים מעשיים
- אבחון כשלונות בפריסה
- פתרון בעיות אימות
- דיבוג חיבור לשירות AI

**💡 תוצאה בפרק**: אבחון ופתרון עצמאי של בעיות פריסה נפוצות

---

### 🏢 פרק 8: תבניות ייצור וארגוניות
**דרישות קדם**: הושלמו פרקים 1-4  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמדו
- אסטרטגיות פריסת ייצור
- תבניות אבטחה ארגוניות
- ניטור ואופטימיזציית עלויות

#### מקורות למידה
- **🏭 ייצור**: [שיטות עבודה טובות ל-AI בייצור](docs/chapter-08-production/production-ai-practices.md) - תבניות ארגוניות
- **📝 דוגמאות**: [דוגמת מיקרו-שירותים](../../examples/microservices) - ארכיטקטורות מורכבות
- **📊 ניטור**: [אינטגרציית Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - ניטור

#### תרגילים מעשיים
- מימוש תבניות אבטחה ארגוניות
- הקמת ניטור כולל
- פריסה לסביבת ייצור עם ממשל מתאים

**💡 תוצאה בפרק**: פרוסו יישומים מוכנים לארגון עם יכולות ייצור מלאות

---

## 🎓 סקירת סדנה: חוויית למידה מעשית

> **⚠️ סטטוס הסדנה: בפיתוח פעיל**  
> חומרי הסדנה מתוכננים ומפוגמים ברציפות. המודולים המרכזיים פעילים, אבל חלק מהחלקים המתקדמים לא הושלמו. אנו עובדים במרץ להשלמת כל התוכן. [עקבו אחר ההתקדמות →](workshop/README.md)

### חומרי סדנה אינטראקטיביים
**למידה מעשית מקיפה עם כלי דפדפן ותרגילים מודרכים**

חומרי הסדנה שלנו מספקים חווית למידה מובנית ואינטראקטיבית שמלווה את תוכנית הלימוד לפי פרקים לעיל. הסדנה מתאימה ללמידה עצמאית ולמפגשים מודרכים.

#### 🛠️ תכונות הסדנה
- **ממשק מבוסס דפדפן**: סדנה שלמה שמופעלת באמצעות MkDocs עם חיפוש, העתקה ותכונות נושא
- **אינטגרציית GitHub Codespaces**: הקמת סביבת פיתוח בלחיצה אחת
- **מסלול למידה מובנה**: 8 מודולים של תרגילים מודרכים (3-4 שעות בסך הכל)
- **שיטה מתקדמת**: מבוא → בחירה → אימות → פירוק → קונפיגורציה → התאמה אישית → ניקוי → סיכום
- **סביבת DevContainer אינטראקטיבית**: כלים ותלויות מוגדרים מראש

#### 📚 מבנה מודולי הסדנה
הסדנה עוקבת אחרי **שיטה מתקדמת של 8 מודולים** שמובילה אותך מגילוי ועד שליטה בפריסה:

| מודול | נושא | מה תעשה | משך |
|--------|-------|----------------|----------|
| **0. מבוא** | סקירת הסדנה | הבנת מטרות, דרישות קדם ומבנה הסדנה | 15 דק' |
| **1. בחירה** | גילוי תבניות | בדיקת תבניות AZD ובחירת תבנית AI מתאימה לתרחיש שלך | 20 דק' |
| **2. אימות** | פריסה ואימות | פריסת תבנית עם `azd up` ואימות תפקוד התשתית | 30 דק' |
| **3. פירוק** | הבנת מבנה | שימוש ב-GitHub Copilot לחקר ארכיטקטורת תבנית, קבצי Bicep וארגון קוד | 30 דק' |
| **4. קונפיגורציה** | העמקה ב-azure.yaml | שליטה ב-`azure.yaml`, lifecycle hooks ומשתני סביבה | 30 דק' |
| **5. התאמה אישית** | הפוך את זה לשלך | הפעלת AI Search, מעקב, הערכה והתאמה לתרחיש שלך | 45 דק' |
| **6. ניקוי** | ניהול סיום | הסרה בטוחה של משאבים עם `azd down --purge` | 15 דק' |
| **7. סיכום** | צעדים הבאים | סקירת השגים, מושגים מרכזיים והמשך מסע הלמידה | 15 דק' |

**מהלך הסדנה:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 התחלה בסדנה
```bash
# אפשרות 1: GitHub Codespaces (מומלץ)
# לחץ על "Code" → "Create codespace on main" במאגר

# אפשרות 2: פיתוח מקומי
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# פעל לפי הוראות ההתקנה ב-workshop/README.md
```

#### 🎯 תוצאות הלמידה בסדנה
בהשלמת הסדנה, המשתתפים יוכלו:
- **לפרוס יישומי AI בפרודקשן**: שימוש ב-AZD עם שירותי Microsoft Foundry
- **לשלוט בארכיטקטורות מרובי סוכנים**: מימוש פתרונות סוכני AI מתואמים
- **ליישם שיטות אבטחה מיטביות**: קונפיגורציית אימות ושליטה בגישה
- **לאופטימיזציה למדרגיות**: עיצוב פריסות חסכוניות ובעלות ביצועים
- **לפתור תקלות בפריסות**: פתרון עצמאי של בעיות נפוצות

#### 📖 מקורות הסדנה
- **🎥 מדריך אינטראקטיבי**: [חומרי הסדנה](workshop/README.md) - סביבת למידה מבוססת דפדפן
- **📋 הוראות מודול-אחר-מודול**:
  - [0. מבוא](workshop/docs/instructions/0-Introduction.md) - סקירה ומטרות הסדנה
  - [1. בחירה](workshop/docs/instructions/1-Select-AI-Template.md) - מציאת תבניות AI ובחירתן
  - [2. אימות](workshop/docs/instructions/2-Validate-AI-Template.md) - פריסה ואימות תבניות
  - [3. פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - חקר ארכיטקטורת תבנית
  - [4. קונפיגורציה](workshop/docs/instructions/4-Configure-AI-Template.md) - שליטה ב-azure.yaml
  - [5. התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) - התאמה לתרחיש שלך
  - [6. ניקוי](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ניקוי משאבים
  - [7. סיכום](workshop/docs/instructions/7-Wrap-up.md) - סקירה וצעדים הבאים
- **🛠️ מעבדת סדנת AI**: [מעבדת סדנת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - תרגילי AI ממוקדים
- **💡 התחלה מהירה**: [מדריך הגדרת הסדנה](workshop/README.md#quick-start) - קונפיגורציית סביבה

**מתאים במיוחד ל**: הדרכות ארגוניות, קורסים אוניברסיטאיים, למידה בקצב עצמי וקורסי פיתוח מהירים.

---

## 📖 העמקה: יכולות AZD

מעבר ליסודות, AZD מספקת תכונות עוצמתיות לפריסות ייצור:

- **פריסות מבוססות תבנית** - שימוש בתבניות מוכנות לדפוסי יישומים נפוצים
- **תשתית כקוד** - ניהול משאבי Azure באמצעות Bicep או Terraform  
- **זרימות עבודה משולבות** - פריסה, ניהול וניטור אפליקציות חלקים
- **ידידותי למפתח** - מותאם לפרודוקטיביות ולחוויה של מפתחי אפליקציות

### **AZD + Microsoft Foundry: מושלם לפריסות AI**

**למה AZD לפתרונות AI?** AZD מתמודד עם האתגרים המרכזיים שמפתחים AI נתקלים בהם:

- **תבניות מוכנות ל-AI** - תבניות מוכנות מראש למודלים של Microsoft Foundry, שירותי Azure AI ועולמות ML
- **פריסות AI מאובטחות** - תבניות אבטחה מובנות לשירותי AI, מפתחות API ו-endpoints למודלים  
- **תבניות AI לייצור** - שיטות מיטביות לפריסות אפליקציות AI מדרגיות וחסכוניות
- **זרימות עבודה מקצה לקצה** - מפיתוח מודל ועד פריסה לייצור עם ניטור מתאים
- **אופטימיזציית עלויות** - ניהול חכם של משאבים ואסטרטגיות מדרגיות לעולמות AI
- **אינטגרציה עם Microsoft Foundry** - חיבור חלק לקטלוג מודלים ו-endpoints של Microsoft Foundry

---

## 🎯 ספריית תבניות ודוגמאות

### מובילים: תבניות Microsoft Foundry
**התחילו כאן אם אתם מפעילים יישומי AI!**

> **הערה:** תבניות אלו מדגימות דפוסי AI שונים. חלקם הוא דוגמאות חיצוניות של Azure, אחרים מימושים מקומיים.

| תבנית | פרק | מורכבות | שירותים | סוג |
|----------|---------|------------|----------|------|
| [**התחילו עם שיחת AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | חיצוני |
| [**התחילו עם סוכני AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | פרק 2 | ⭐⭐ | סוכני Foundry + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| חיצוני |
| [**הדגמת Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | חיצוני |
| [**התחלה מהירה לאפליקציית שיחת OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | חיצוני |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | חיצוני |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | חיצוני |
| [**פתרון ריטייל מרובי-סוכנים**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **מקומי** |

### מובילים: תרחישי למידה שלמים
**תבניות יישום מוכנות לייצור המשויכות לפרקי למידה**

| תבנית | פרק למידה | מורכבות | למידה עיקרית |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | דפוסי פריסת AI בסיסיים |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | מימוש RAG עם Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | פרק 4 | ⭐⭐ | אינטגרציית אינטיליגנציה למסמכים |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | מסגרת סוכנים וקריאות לפונקציות |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐ | תזמור AI ארגוני |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | ארכיטקטורת מרובי סוכנים עם סוכני לקוח ומלאי |

### למידה לפי סוג דוגמה

> **📌 דוגמאות מקומיות לעומת חיצוניות:**  
> **דוגמאות מקומיות** (בקוד זה) = מוכנות לשימוש מיידי  
> **דוגמאות חיצוניות** (דוגמאות Azure) = קלונינג מרפוואזיים מחוברים

#### דוגמאות מקומיות (מוכנות לשימוש)
- [**פתרון ריטייל מרובי-סוכנים**](examples/retail-scenario.md) - מימוש שלם מוכן לייצור עם תבניות ARM
  - ארכיטקטורת מרובי-סוכנים (סוכני לקוח + מלאי)
  - ניטור והערכה מקיפה
  - פריסה בלחיצה אחת באמצעות תבנית ARM

#### דוגמאות מקומיות - אפליקציות קונטיינר (פרקים 2-5)
**דוגמאות פריסה מקיפות של אפליקציות קונטיינר במאגר זה:**

- [**דוגמאות אפליקציית מכולות**](examples/container-app/README.md) - מדריך שלם לפריסות ממכולות
  - [API Flask פשוט](../../examples/container-app/simple-flask-api) - REST API בסיסי עם התאמה לאפס
  - [ארכיטקטורת מיקרו-שירותים](../../examples/container-app/microservices) - פריסה מוכנה לייצור של שירותים מרובים
  - דפוסי פריסה התחלתית, ייצור ומתקדמים
  - הדרכה למעקב, אבטחה ואופטימיזציית עלויות

#### דוגמאות חיצוניות - אפליקציות פשוטות (פרקים 1-2)
**שכפל את מאגרי דוגמאות Azure הללו כדי להתחיל:**
- [אפליקציית רשת פשוטה - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - דפוסי פריסה בסיסיים
- [אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - פריסת תוכן סטטי
- [אפליקציית מכולות - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - פריסת REST API

#### דוגמאות חיצוניות - אינטגרציה עם בסיסי נתונים (פרקים 3-4)  
- [אפליקציית בסיס נתונים - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - דפוסי חיבור לבסיסי נתונים
- [פונקציות + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - זרימת עבודה ללא שרת

#### דוגמאות חיצוניות - דפוסים מתקדמים (פרקים 4-8)
- [מיקרו-שירותים בג'אווה](https://github.com/Azure-Samples/java-microservices-aca-lab) - ארכיטקטורות רב-שירותיות
- [משרות אפליקציות מכולות](https://github.com/Azure-Samples/container-apps-jobs) - עיבוד ברקע  
- [צנרת ML ארגונית](https://github.com/Azure-Samples/mlops-v2) - דפוסי ML מוכנים לייצור

### אוספי תבניות חיצוניות
- [**גלריית תבניות AZD הרשמית**](https://azure.github.io/awesome-azd/) - אוסף מתוחם של תבניות רשמיות וקהילתיות
- [**תבניות Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - תיעוד תבניות Microsoft Learn
- [**ספריית דוגמאות**](examples/README.md) - דוגמאות למידה מקומיות עם הסברים מפורטים

---

## 📚 משאבי למידה והפניות

### הפניות מהירות
- [**גליון פקודות**](resources/cheat-sheet.md) - פקודות azd חיוניות מאורגנות לפי פרק
- [**מונחים**](resources/glossary.md) - מונחי Azure ו-azd  
- [**שאלות נפוצות**](resources/faq.md) - שאלות נפוצות מאורגנות לפי פרק למידה
- [**מדריך לימוד**](resources/study-guide.md) - תרגולים מקיפים

### סדנאות מעשיות
- [**סדנת AI מעשית**](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפוך פתרונות AI שלך לפריסת AZD (2-3 שעות)
- [**סדנה אינטראקטיבית**](workshop/README.md) - 8 מודולים של תרגילים מודרכים עם MkDocs ו-GitHub Codespaces
  - עוקב אחרי: מבוא → בחירה → אימות → פירוק → הגדרה → התאמה אישית → פירוק → סיכום

### משאבי למידה חיצוניים
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מחשב המחירים של Azure](https://azure.microsoft.com/pricing/calculator/)
- [סטטוס Azure](https://status.azure.com/)

### כישורי סוכן AI לעורך שלך
- [**כישורי Microsoft Azure ב-skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 כישורי סוכן פתוחים ל-Azure AI, Foundry, פריסה, אבחון, אופטימיזציית עלות ועוד. התקן אותם ב-GitHub Copilot, Cursor, Claude Code, או כל סוכן נתמך אחר:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 מדריך פתרון בעיות מהיר

**בעיות נפוצות שהמתחילים נתקלים בהן ופתרונות מיידיים:**

<details>
<summary><strong>❌ "azd: הפקודה לא נמצאה"</strong></summary>

```bash
# התקן תחילה את AZD
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
<summary><strong>❌ "לא נמצא מנוי" או "המנוי לא מוגדר"</strong></summary>

```bash
# רשום את המנויים הזמינים
az account list --output table

# הגדר מנוי ברירת מחדל
az account set --subscription "<subscription-id-or-name>"

# הגדר לסביבת AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# אמת
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" או "חריגה מהמכסה"</strong></summary>

```bash
# נסה אזור אחר ב-Azure
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
<summary><strong>❌ "azd up" נכשל באמצע הדרך</strong></summary>

```bash
# אפשרות 1: נקה ונסה שוב
azd down --force --purge
azd up

# אפשרות 2: תקן רק את התשתית
azd provision

# אפשרות 3: בדוק סטטוס מפורט
azd show

# אפשרות 4: בדוק יומנים ב-Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "אימות נכשל" או "טוקן פג תוקף"</strong></summary>

```bash
# לאמת מחדש עבור AZD
azd auth logout
azd auth login

# אופציונלי: רענן גם את Azure CLI אם אתה מריץ פקודות az
az logout
az login

# אמת אימות
az account show
```
</details>

<details>
<summary><strong>❌ "המשאב כבר קיים" או סתירות בשמות</strong></summary>

```bash
# AZD מייצר שמות ייחודיים, אבל אם יש התנגשות:
azd down --force --purge

# אז נסה שוב עם סביבה חדשה
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ פריסת תבנית אורכת זמן רב מדי</strong></summary>

**זמני המתנה נורמליים:**
- אפליקציית רשת פשוטה: 5-10 דקות
- אפליקציה עם בסיס נתונים: 10-15 דקות
- אפליקציות AI: 15-25 דקות (הקצאת OpenAI איטית)

```bash
# בדוק התקדמות
azd show

# אם תקוע מעל 30 דקות, בדוק ב-Azure Portal:
azd monitor --overview
# חפש פריסות שנכשלו
```
</details>

<details>
<summary><strong>❌ "הרשאה נדחתה" או "אסור"</strong></summary>

```bash
# בדוק את התפקיד שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# אתה צריך לפחות את התפקיד "תורם"
# בקש מהמנהל שלך ב-Azure לתת:
# - תורם (למשאבים)
# - מנהל גישת משתמשים (למשימות תפקידים)
```
</details>

<details>
<summary><strong>❌ לא ניתן למצוא את כתובת URL של האפליקציה שהופעלה</strong></summary>

```bash
# הצג את כל נקודות הקצה לשירות
azd show

# או פתח את פורטל Azure
azd monitor

# בדוק שירות ספציפי
azd env get-values
# חפש משתני *_URL
```
</details>

### 📚 משאבים מלאים לפתרון בעיות

- **מדריך בעיות נפוצות:** [פתרונות מפורטים](docs/chapter-07-troubleshooting/common-issues.md)
- **בעיות ספציפיות ל-AI:** [פתרון בעיות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **מדריך ניפוי שגיאות:** [ניפוי שגיאות שלב אחר שלב](docs/chapter-07-troubleshooting/debugging.md)
- **קבל עזרה:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 השלמת קורס ותעודה

### מעקב התקדמות
עקוב אחר ההתקדמות שלך בלמידה בכל פרק:

- [ ] **פרק 1**: יסודות והתחלה מהירה ✅
- [ ] **פרק 2**: פיתוח AI-קודם ✅  
- [ ] **פרק 3**: הגדרה ואימות ✅
- [ ] **פרק 4**: תשתית כקוד ופריסה ✅
- [ ] **פרק 5**: פתרונות AI מרובי סוכנים ✅
- [ ] **פרק 6**: אימות ותכנון לפני פריסה ✅
- [ ] **פרק 7**: פתרון בעיות וניפוי שגיאות ✅
- [ ] **פרק 8**: דפוסי ייצור וארגוניים ✅

### אימות למידה
לאחר השלמת כל פרק, אמת את הידע שלך על ידי:
1. **תרגול מעשי**: השלמת פריסת הפרק בצורה מעשית
2. **בדיקת ידע**: עיון במדור שאלות נפוצות עבור הפרק שלך
3. **דיון קהילתי**: שתף את החוויה שלך ב-Azure Discord
4. **הפרק הבא**: המשך לשלב הבא במורכבות

### יתרונות השלמת הקורס
עם סיום כל הפרקים, תוכל ליהנות מ:
- **ניסיון ייצור**: אפליקציות AI אמתיות שפורסמו ב-Azure
- **כישורים מקצועיים**: יכולות פריסה מוכנות לארגון  
- **הכרה קהילתית**: חבר פעיל בקהילת מפתחי Azure
- **קידום קריירה**: מומחיות נדרשת ב-AZD ופריסת AI

---

## 🤝 קהילה ותמיכה

### קבל עזרה ותמיכה
- **בעיות טכניות**: [דווח על באגים ובקש תכונות](https://github.com/microsoft/azd-for-beginners/issues)
- **שאלות למידה**: [קהילת Microsoft Azure Discord](https://discord.gg/microsoft-azure) ו-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **עזרה ספציפית ל-AI**: הצטרף ל-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **תיעוד**: [תיעוד רשמי ל-Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### תובנות מהקהילה ב-Microsoft Foundry Discord

**תוצאות סקר אחרון מערוץ #Azure:**
- **45%** מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI
- **האתגרים המובילים**: פריסות רב-שירותיות, ניהול אישורים, מוכנות ייצור  
- **הנבקש ביותר**: תבניות ספציפיות ל-AI, מדריכי פתרון בעיות, פרקטיקות מומלצות

**הצטרף לקהילה שלנו כדי:**
- לשתף חוויות AZD + AI ולקבל עזרה
- לגשת לגרסאות מוקדמות של תבניות AI חדשות
- לתרום לפרקטיקות מיטביות בפריסת AI
- להשפיע על פיתוח תכונות עתידיות ל-AI + AZD

### תרומה לקורס
נשמח לתרומות! אנא קרא את [מדריך התרומה](CONTRIBUTING.md) לפרטים על:
- **שיפורי תוכן**: שפר פרקים ודוגמאות קיימות
- **דוגמאות חדשות**: הוסף תרחישים ותבניות מהעולם האמיתי  
- **תרגום**: עזור בשמירת תמיכה בריבוי שפות
- **דיווח על באגים**: שפר דיוק ובהירות
- **סטנדרטים קהילתיים**: עקוב אחרי קווי ההנחיה המקיפים שלנו

---

## 📄 מידע על הקורס

### רישיון
פרויקט זה מורשה תחת רישיון MIT - ראה את קובץ [LICENSE](../../LICENSE) לפרטים.

### משאבי למידה קשורים של Microsoft

הצוות שלנו מייצר קורסי למידה מקיפים נוספים:

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
 
### סדרת AI גנרטיבית
[![AI גנרטיבי למתחילים](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI גנרטיבי (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI גנרטיבי (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![בינה מלאכותית יצירתית (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### למידה מרכזית
[![למידת מכונה למתחילים](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![מדע נתונים למתחילים](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![בינה מלאכותית למתחילים](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![אבטחת סייבר למתחילים](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![פיתוח ווב למתחילים](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT למתחילים](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![פיתוח XR למתחילים](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת קופיילוט
[![קופיילוט לתכנות משותף מבוסס AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![קופיילוט ל-C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![הרפתקת קופיילוט](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ניווט בקורס

**🚀 מוכנים להתחיל ללמוד?**

**מתחילים**: התחילו עם [פרק 1: יסודות והתחלה מהירה](#-chapter-1-foundation--quick-start)  
**מפתחי בינה מלאכותית**: דלגו ל-[פרק 2: פיתוח AI-ראשון](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**מפתחים מנוסים**: התחילו עם [פרק 3: קונפיגורציה ואימות](#️-chapter-3-configuration--authentication)

**השלבים הבאים**: [התחילו בפרק 1 - יסודות AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->