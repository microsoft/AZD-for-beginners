# AZD למתחילים: מסע למידה מאורגן

![AZD-for-beginners](../../translated_images/he/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### תרגומים אוטומטיים (תמיד מעודכנים)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](./README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **מעדיפים לשכפל מקומית?**
>
> מאגר זה כולל יותר מ-50 תרגומים לשפות שמגדילים משמעותית את גודל ההורדה. כדי לשכפל ללא תרגומים, השתמשו ב-sparse checkout:
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
> זה נותן לך את כל מה שצריך כדי להשלים את הקורס עם הורדה מהירה הרבה יותר.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 מה חדש ב-azd היום

> 📌 קורס זה מאומת מול **`azd 1.27.1`** (יולי 2026). הרץ `azd version` כדי לבדוק את הבנייה שלך, ו-`azd upgrade` כדי לקבל את העדכני ביותר.

Azure Developer CLI התרחב מעבר לאפליקציות ווב וממשקי API מסורתיים. היום, azd הוא הכלי היחיד לפריסת **כל** אפליקציה באז'ור—כולל אפליקציות מבוססות AI וסוכנים אינטיליגנטיים.

הנה המשמעות עבורך:

- **סוכני AI הם עכשיו עומסי עבודה מעמד ראשון ב-azd.** אתה יכול לאתחל, לפרוס ולנהל פרויקטי סוכני AI באמצעות אותו תהליך `azd init` → `azd up` שאתה כבר מכיר.
- **מחזור חיים מלא לסוכן מה-CLI.** התוספת `azure.ai.agents` מכסה כעת את כל המסע—`azd ai agent init` להכנת השלד, `azd ai agent invoke` לבדיקות (עם פלט זמן תגובה), `azd ai agent eval generate` ו-`azd ai agent optimize` למדידה ושיפור איכות, ו-`azd ai agent delete` לניקוי.
- **בלוקים חדשים לבניית AI.** תוספות תצוגה מוקדמת חדשות — `azure.ai.skills` ו-`azure.ai.connections` — מאפשרות לך לנהל מיומנויות סוכן לשימוש חוזר וחיבורי Foundry ישירות עם azd.
- **שילוב Microsoft Foundry** מביא פריסת מודלים, אירוח סוכנים, וקונפיגורציה של שירותי AI ישירות לאקוסיסטם התבניות של azd.
- **שיפורי יסוד ביום-יום.** שחרורים אחרונים הפכו את `azd init` לאידמפורטי (בטוח להרצה חוזרת), ניקו אוטומטית אסימונים מיושנים עם `azd auth login`, והוסיפו הנחיית הפעלה ידידותית ב`azd tool`.
- **תהליך הליבה לא השתנה.** בין אם אתה מפרסם אפליקציית todo, מיקרו-שירות, או פתרון AI רב-סוכנים, הפקודות זהות.

> **הערה למשתמשי Aspire:** מייקרוסופט מכונה כעת המוצר פשוט **Aspire** (לשעבר ".NET Aspire"). התמיכה של azd ב-Aspire לא השתנתה—רק השם עודכן.

אם השתמשת ב-azd בעבר, התמיכה ב-AI היא הרחבה טבעית—ולא כלי נפרד או מסלול מתקדם. אם אתה מתחיל עכשיו, תלמד תהליך עבודה אחד שעובד לכל דבר.

---

## 🚀 מהו Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** הוא כלי שורת פקודה ידידותי למפתח הפשט את פריסת היישומים באז'ור. במקום ליצור ולחבר עשרות משאבים באז'ור ידנית, תוכל לפרוס אפליקציות שלמות בפקודה אחת.

### הקסם של `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**זהו זה!** בלי לחיצות בפורטל אז'ור, בלי תבניות ARM מסובכות ללמוד קודם, בלי קונפיגורציה ידנית—רק אפליקציות עובדות באז'ור.

---

## ❓ Azure Developer CLI לעומת Azure CLI: מה ההבדל?

זו השאלה הנפוצה ביותר של מתחילים. הנה התשובה הפשוטה:

| תכונה | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **מטרה** | ניהול משאבי אז'ור בודדים | פריסת אפליקציות שלמות |
| **גישה מחשבתית** | ממוקד תשתית | ממוקד אפליקציה |
| **דוגמה** | `az webapp create --name myapp...` | `azd up` |
| **עקומת למידה** | חייב להכיר שירותי אז'ור | רק להכיר את האפליקציה שלך |
| **מתאים ל** | DevOps, תשתית | מפתחים, פרוטוטייפינג |

### אנלוגיה פשוטה

- **Azure CLI** הוא כמו שיש לך את כל הכלים לבניית בית - פטישים, מסורים, מסמרים. אתה יכול לבנות כל דבר, אבל צריך לדעת בנייה.
- **Azure Developer CLI** הוא כמו שכירת קבלן - אתה מתאר מה אתה רוצה, והם מטפלים בבנייה.

### מתי להשתמש בכל אחד

| תרחיש | השתמש בזה |
|----------|----------|
| "אני רוצה לפרוס את אתר האינטרנט שלי במהירות" | `azd up` |
| "אני צריך ליצור רק חשבון אחסון" | `az storage account create` |
| "אני בונה אפליקציית AI שלמה" | `azd init --template azure-search-openai-demo` |
| "אני צריך לנפות באג במשאב אז'ור ספציפי" | `az resource show` |
| "אני רוצה פריסה מוכנה לפעילות תוך דקות" | `azd up --environment production` |

### הם עובדים יחד!

AZD משתמש ב-Azure CLI מתחת לפני השטח. אתה יכול להשתמש בשניהם:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
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
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 התחלה ב-3 שלבים

לפני שמתחילים, ודא שהמחשב שלך מוכן לתבנית שברצונך לפרוס:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

אם כל בדיקה נדרשת נכשלת, תקן קודם ואז המשך עם ההתחלה המהירה.

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

### שלב 2: אמת את עצמך ל-AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

אם אינך בטוח מה אתה צריך, פעל לפי ההזרמה המלאה בהתקנה והגדרה [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### שלב 3: פרוס את האפליקציה הראשונה שלך

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 זהו זה!** האפליקציה שלך כעת בשידור חי באז'ור.

### ניקוי (אל תשכח!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 איך להשתמש בקורס זה

קורס זה מעוצב ללמידה הדרגתית - התחל במקום הנוח לך וקדם הלאה:

| הניסיון שלך | התחל כאן |
|-----------------|------------|
| **חדש לגמרי לאז'ור** | [פרק 1: יסוד](#-chapter-1-foundation--quick-start) |
| **מכיר את אז'ור, חדש ל-AZD** | [פרק 1: יסוד](#-chapter-1-foundation--quick-start) |
| **רוצה לפרוס אפליקציות AI** | [פרק 2: פיתוח AI-ראשון](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **רוצה תרגול מעשי** | [🎓 סדנה אינטראקטיבית](workshop/README.md) - מעבדה מודרכת 3-4 שעות |
| **צריך דפוסי ייצור** | [פרק 8: ייצור וארגוני](#-chapter-8-production--enterprise-patterns) |

### התקנה מהירה

1. **פצל את המאגר הזה**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **שכפל אותו**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **קבל עזרה**: [קהילת Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **מעדיפים לשכפל מקומית?**

> מאגר זה כולל יותר מ-50 תרגומים לשפות שמגדילים משמעותית את גודל ההורדה. כדי לשכפל ללא תרגומים, השתמשו ב-sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> זה נותן לך את כל מה שצריך כדי להשלים את הקורס עם הורדה מהירה הרבה יותר.


## סקירת הקורס

שלוט ב-Azure Developer CLI (azd) דרך פרקים מובנים להדרגתית למידה. **דגש מיוחד על פריסת אפליקציות AI עם שילוב Microsoft Foundry.**

### מדוע קורס זה חיוני למפתחים מודרניים

על פי תובנות מקהילת Microsoft Foundry Discord, **45% מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI** אך נתקלים באתגרים עם:
- ארכיטקטורות AI מורכבות מרובות שירותים
- שיטות עבודה מומלצות לפריסת AI בייצור  
- שילוב ושיתוף שירותי Azure AI
- אופטימיזציות עלות לעומסי עבודה של AI
- פתרון תקלות בפריסות ייעודיות ל-AI

### יעדי הלמידה

בסיום קורס זה, תלמד:
- **שליטה ביסודות AZD**: מושגים בסיסיים, התקנה וקונפיגורציה
- **פריסת אפליקציות AI**: שימוש ב-AZD עם שירותי Microsoft Foundry
- **ליישם תשתית כקוד**: לנהל משאבי Azure באמצעות תבניות Bicep
- **פתרון תקלות בפריסות**: לפתור בעיות נפוצות ולבצע איתור שגיאות
- **אופטימיזציה לייצור**: אבטחה, סקיילינג, ניטור וניהול עלויות
- **לבנות פתרונות מרובי סוכנים**: לפרוס ארכיטקטורות AI מורכבות

## לפני שמתחילים: חשבונות, גישה והנחות

לפני שתתחילו בפרק 1, ודאו שיש לכם את הפריטים הבאים במקום. שלבי ההתקנה במדריך זה מניחים שהיסודות הללו כבר מטופלים.

- **מנוי Azure**: תוכלו להשתמש במנוי קיים מהעבודה או מהחשבון האישי שלכם, או ליצור [ניסיון חינם](https://aka.ms/azurefreetrial) כדי להתחיל.
- **הרשאה ליצור משאבי Azure**: לרוב התרגילים כדאי שתהיה לכם לפחות גישה של **Contributor** במנוי היעד או בקבוצת המשאבים. בפרקים מסוימים גם מניחים שתוכלו ליצור קבוצות משאבים, זהויות מנוהלות ו-RBAC.
- [**חשבון GitHub**](https://github.com): שימושי עבור פורקינג של המאגר, מעקב אחרי השינויים שלכם, ושימוש ב-GitHub Codespaces לסדנא.
- **דרישות מערכת להפעלת התבניות**: חלק מהתבניות דורשות כלים מקומיים כגון Node.js, Python, Java או Docker. הריצו את בודק ההתקנה לפני ההתחלה כדי לתפוס חוסרים מוקדם.
- **היכרות בסיסית עם טרמינל**: לא חייבים להיות מומחים, אבל כדאי להרגיש נוח בהרצת פקודות כמו `git clone`, `azd auth login`, ו-`azd up`.

> **עובדים במנוי ארגוני?**
> אם סביבת Azure שלכם מנוהלת על ידי מנהל, ודאו מראש שאתם יכולים לפרוס משאבים במנוי או בקבוצת המשאבים שתשתמשו בהם. אם לא, בקשו מנוי חולי או גישת Contributor לפני שתתחילו.

> **חדש ב-Azure?**
> התחילו עם ניסוי Azure משלכם או מנוי בתשלום לפי שימוש ב-https://aka.ms/azurefreetrial כדי שתוכלו להשלים את התרגילים מקצה לקצה בלי להמתין לאישורים ברמת ה-tennant.

## 🗺️ מפת הקורס: ניווט מהיר לפי פרק

לכל פרק יש README ייעודי עם מטרות למידה, התחלות מהירות ותרגילים:

| פרק | נושא | שיעורים | משך | מורכבות |
|---------|-------|---------|----------|------------|
| **[פרק 1: יסודות](docs/chapter-01-foundation/README.md)** | התחלות | [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [התקנה](docs/chapter-01-foundation/installation.md) &#124; [הפרויקט הראשון](docs/chapter-01-foundation/first-project.md) | 30-45 דק' | ⭐ |
| **[פרק 2: פיתוח AI](docs/chapter-02-ai-development/README.md)** | אפליקציות AI ראשונות | [אינטגרציה עם Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [סוכני AI](docs/chapter-02-ai-development/agents.md) &#124; [פריסת מודלים](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [סדנא](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 שעות | ⭐⭐ |
| **[פרק 3: קונפיגורציה](docs/chapter-03-configuration/README.md)** | אימות ואבטחה | [קונפיגורציה](docs/chapter-03-configuration/configuration.md) &#124; [אימות ואבטחה](docs/chapter-03-configuration/authsecurity.md) | 45-60 דק' | ⭐⭐ |
| **[פרק 4: תשתית](docs/chapter-04-infrastructure/README.md)** | IaC ופריסה | [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [פרוביז׳נינג](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 שעות | ⭐⭐⭐ |
| **[פרק 5: סוכנים מרובים](docs/chapter-05-multi-agent/README.md)** | פתרונות סוכני AI | [תסריט קמעונאות](examples/retail-scenario.md) &#124; [דפוסי תיאום](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[פרק 6: תכנון ואימות לפני פריסה](docs/chapter-06-pre-deployment/README.md)** | תכנון ואימות | [בדיקות מוקדמות](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | שעה | ⭐⭐ |
| **[פרק 7: איתור תקלות](docs/chapter-07-troubleshooting/README.md)** | איתור ותיקון | [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) &#124; [איתור שגיאות](docs/chapter-07-troubleshooting/debugging.md) &#124; [בעיות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 שעות | ⭐⭐ |
| **[פרק 8: ייצור](docs/chapter-08-production/README.md)** | דפוסי ארגוני | [נהלי ייצור](docs/chapter-08-production/production-ai-practices.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[🎓 סדנא](workshop/README.md)** | מעבדה מעשית | [מבוא](workshop/docs/instructions/0-Introduction.md) &#124; [בחירה](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [אימות](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [קונפיגורציה](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [פירוק](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [סיכום](workshop/docs/instructions/7-Wrap-up.md) | 3-4 שעות | ⭐⭐ |

**משך כולל של הקורס:** ~10-14 שעות | **התקדמות מיומנות:** מתחיל → מוכן לייצור

---

## 📚 פרקי למידה

*בחרו את מסלול הלמידה שלכם על פי רמת ניסיון ומטרות*

### 🚀 פרק 1: יסודות והתחלה מהירה
**דרישות מקדימות**: מנוי Azure, ידע בסיסי בטרמינל  
**משך**: 30-45 דקות  
**מורכבות**: ⭐

#### מה תלמדו
- הבנת יסודות Azure Developer CLI
- התקנת AZD בפלטפורמה שלכם
- הפריסה הראשונה המוצלחת שלכם

#### משאבי למידה
- **🎯 התחילו כאן**: [מהו Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 תיאוריה**: [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) - מושגים מרכזיים ומונחים
- **⚙️ התקנה**: [התקנה והגדרה](docs/chapter-01-foundation/installation.md) - מדריכים לפי פלטפורמה
- **🛠️ מעשי**: [הפרויקט הראשון שלכם](docs/chapter-01-foundation/first-project.md) - מדריך צעד-אחר-צעד
- **📋 עזר מהיר**: [גליון פקודות](resources/cheat-sheet.md)

#### תרגילים מעשיים
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 תוצאה של פרק:** לפרוס בהצלחה אפליקציית ווב פשוטה ל-Azure באמצעות AZD

**✅ אימות הצלחה:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 זמן השקעה:** 30-45 דקות  
**📈 רמת מיומנות לאחר:** יכול לפרוס אפליקציות בסיסיות בעצמאות
**📈 רמת מיומנות לאחר:** יכול לפרוס אפליקציות בסיסיות בעצמאות

---

### 🤖 פרק 2: פיתוח AI ראשוני (מומלץ למפתחי AI)
**דרישות מקדימות**: פרק 1 הושלם  
**משך**: 1-2 שעות  
**מורכבות**: ⭐⭐

#### מה תלמדו
- אינטגרציה עם Microsoft Foundry ב-AZD
- פריסת אפליקציות מונעות AI
- הבנת קונפיגורציות שירות AI

#### משאבי למידה
- **🎯 התחילו כאן**: [אינטגרציה עם Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 סוכני AI**: [מדריך סוכני AI](docs/chapter-02-ai-development/agents.md) - פריסת סוכנים חכמים באמצעות AZD
- **📖 דפוסים**: [פריסת מודל AI](docs/chapter-02-ai-development/ai-model-deployment.md) - פריסה וניהול מודלים
- **🛠️ סדנא**: [מעבדת סדנא AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפיכת פתרונות AI לראויים ל-AZD
- **🎥 מדריך אינטראקטיבי**: [חומרים לסדנא](workshop/README.md) - למידה דפדפנית עם MkDocs * סביבה ב-DevContainer
- **📋 תבניות**: [תבניות Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 דוגמאות**: [דוגמאות פריסת AZD](examples/README.md)

#### תרגילים מעשיים
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 תוצאה של פרק:** לפרוס ולהגדיר אפליקציית צ'אט מונעת AI עם יכולות RAG

**✅ אימות הצלחה:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 זמן השקעה:** 1-2 שעות  
**📈 רמת מיומנות לאחר:** יכול לפרוס ולהגדיר אפליקציות AI מוכנות ייצור  
**💰 מודעות לעלויות:** להבין עלויות פיתוח של $80-150 לחודש, ועלויות ייצור של $300-3500 לחודש

#### 💰 שיקולי עלות לפריסות AI

**סביבת פיתוח (מיוערך ב-$80-150 לחודש):**
- מודלים של Microsoft Foundry (תשלום לפי שימוש): $0-50 לחודש (תלוי בשימוש בטוקנים)
- AI Search (רמת בסיס): $75 לחודש
- Container Apps (צריכה): $0-20 לחודש
- אחסון (סטנדרטי): $1-5 לחודש

**סביבת ייצור (מיוערך ב-$300-3,500+/חודש):**
- מודלים של Microsoft Foundry (PTU לביצועים עקביים): $3,000+/חודש או תשלום לפי שימוש עם נפח גבוה
- AI Search (רמה סטנדרטית): $250 לחודש
- Container Apps (ייעודי): $50-100 לחודש
- Application Insights: $5-50 לחודש
- אחסון (פרימיום): $10-50 לחודש

**💡 טיפים לאופטימיזציית עלויות:**
- השתמשו במודלים של Microsoft Foundry ב**רמת חינם** ללמידה (כולל Azure OpenAI עם 50,000 טוקנים לחודש)
- הריצו `azd down` כדי לבטל הקצאת משאבים כשלא מפתחים באופן פעיל
- התחילו בתמחור לפי צריכה, שדרגו ל-PTU רק עבור ייצור
- השתמשו ב-`azd provision --preview` כדי להעריך עלויות לפני פריסה
- אפשרו קנה מידה אוטומטי: תשלמו רק על השימוש בפועל

**מעקב עלויות:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ פרק 3: קונפיגורציה ואימות
**דרישות מקדימות**: פרק 1 הושלם  
**משך**: 45-60 דקות  
**מורכבות**: ⭐⭐

#### מה תלמדו
- קונפיגורציה וניהול סביבה
- שיטות אימות ואבטחה מיטביות
- שמות משאבים וארגון

#### משאבי למידה
- **📖 קונפיגורציה**: [מדריך קונפיגורציה](docs/chapter-03-configuration/configuration.md) - התקנת סביבה
- **🔐 אבטחה**: [דפוסי אימות וזהות מנוהלת](docs/chapter-03-configuration/authsecurity.md) - דפוסי אימות
- **📝 דוגמאות**: [דוגמת אפליקציית בסיסי נתונים](examples/database-app/README.md) - דוגמאות בסיס נתונים ב-AZD

#### תרגילים מעשיים
- קונפיגורציה של סביבות מרובות (dev, staging, prod)
- הגדרת אימות עם זהות מנוהלת
- יישום קונפיגורציות ייחודיות לסביבות

**💡 תוצאה של פרק:** לנהל סביבות מרובות עם אימות ואבטחה נכונים

---

### 🏗️ פרק 4: תשתית כקוד ופריסה
**דרישות מקדימות**: פרקים 1-3 הושלמו  
**משך**: 1-1.5 שעות  
**מורכבות**: ⭐⭐⭐

#### מה תלמדו
- דפוסי פריסה מתקדמים
- תשתית כקוד באמצעות Bicep
- אסטרטגיות פרוביז׳נינג למשאבים

#### משאבי למידה
- **📖 פריסה**: [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) - תזרימי עבודה שלמים
- **🏗️ פרוביז׳נינג**: [ניהול משאבי Azure](docs/chapter-04-infrastructure/provisioning.md) - ניהול משאבים
- **📝 דוגמאות**: [דוגמת אפליקציית Container](../../examples/container-app) - פריסות בקונטיינר

#### תרגילים מעשיים
- יצירת תבניות Bicep מותאמות אישית
- פריסת אפליקציות מרובות שירותים
- יישום אסטרטגיות פריסת blue-green

**💡 תוצאה של פרק:** לפרוס אפליקציות מרובות שירותים מורכבות באמצעות תבניות תשתית מותאמות אישית

---

### 🎯 פרק 5: פתרונות AI מרובי סוכנים (מתקדם)
**דרישות מקדימות**: פרקים 1-2 הושלמו  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמדו
- דפוסי ארכיטקטורה מרובי סוכנים
- תזמור ותיאום סוכנים
- פריסות AI מוכנות לייצור

#### משאבי למידה
- **🤖 פרויקט מומלץ**: [פתרון מסחרי מרובי סוכנים](examples/retail-scenario.md) - מימוש מלא
- **🛠️ תבניות ARM**: [חבילת תבניות ARM](../../examples/retail-multiagent-arm-template) - פריסה בלחיצה אחת
- **📖 ארכיטקטורה**: [דפוסי תיאום סוכנים מרובים](docs/chapter-06-pre-deployment/coordination-patterns.md) - דפוסים

#### תרגילים מעשיים
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 תוצאה של פרק:** לפרוס ולנהל פתרון AI מרובי סוכנים מוכן לייצור עם סוכני לקוחות ומלאי

---

### 🔍 פרק 6: אימות ותכנון לפני פריסה
**דרישות מקדימות**: פרק 4 הושלם  
**משך**: שעה  
**מורכבות**: ⭐⭐

#### מה תלמדו
- תכנון קיבולת ואימות משאבים
- אסטרטגיות בחירת SKU
- בדיקות מוקדמות ואוטומציה

#### משאבי לימוד
- **📊 תכנון**: [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) - אימות משאבים
- **💰 בחירה**: [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) - בחירות חסכוניות
- **✅ אימות**: [בדיקות טרום-הפעלה](docs/chapter-06-pre-deployment/preflight-checks.md) - סקריפטים אוטומטיים

#### תרגילים מעשיים
- הרצת סקריפטים לאימות קיבולת
- אופטימיזציה של בחירת SKU עבור עלות
- יישום בדיקות טרום-הפעלה אוטומטיות

**💡 תוצאת הפרק**: לאמת ולשפר פריסות לפני ביצוע

---

### 🚨 פרק 7: פתרון תקלות ודיבוג
**דרישות מוקדמות**: כל פרק פריסה שהושלם  
**משך זמן**: שעה עד שעה וחצי  
**מורכבות**: ⭐⭐

#### מה תלמדו
- גישות סיסטמטיות לדיבוג
- בעיות נפוצות ופתרונות
- פתרון תקלות ספציפי ל-AI

#### משאבי למידה
- **🔧 בעיות נפוצות**: [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) - שאלות נפוצות ופתרונות
- **🕵️ דיבוג**: [מדריך דיבוג](docs/chapter-07-troubleshooting/debugging.md) - אסטרטגיות שלב-אחר-שלב
- **🤖 בעיות AI**: [פתרון תקלות ספציפי ל-AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - בעיות שירותי AI

#### תרגילים מעשיים
- אבחון כשלי פריסה
- פתרון בעיות אימות
- דיבוג חיבור לשירותי AI

**💡 תוצאת הפרק**: לאבחן ולפתור באופן עצמאי בעיות פריסה נפוצות

---

### 🏢 פרק 8: דפוסי ייצור וארגוניים
**דרישות מוקדמות**: פרקים 1-4 שהושלמו  
**משך זמן**: שעתיים עד שלוש  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמדו
- אסטרטגיות פריסת ייצור
- דפוסי אבטחה ארגוניים
- ניטור ואופטימיזציה של עלויות

#### משאבי למידה
- **🏭 ייצור**: [שיטות עבודה מומלצות ל-AI בייצור](docs/chapter-08-production/production-ai-practices.md) - דפוסים ארגוניים
- **📝 דוגמאות**: [דוגמת מיקרו-שירותים](../../examples/microservices) - ארכיטקטורות מורכבות
- **📊 ניטור**: [אינטגרציית Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - ניטור

#### תרגילים מעשיים
- יישום דפוסי אבטחה ארגוניים
- הקמת ניטור מקיף
- פריסה בסביבת ייצור עם ממשל נאות

**💡 תוצאת הפרק**: ליישם אפליקציות מוכנות ארגונית עם יכולות ייצור מלאות

---

## 🎓 סקירת סדנה: חווית למידה מעשית

> **⚠️ מצב הסדנה: בפיתוח פעיל**  
> חומרי הסדנה נמצאים כרגע בפיתוח ושיפור. מודולים מרכזיים פועלים, אך חלק מחלקים מתקדמים אינם שלמים. אנו עובדים במרץ להשלים את כל התוכן. [עקבו אחר ההתקדמות →](workshop/README.md)

### חומרי סדנה אינטראקטיביים
**למידה מעשית כוללת עם כלים מבוססי דפדפן ותרגילים מודרכים**

חומרי הסדנה שלנו מספקים חווית למידה מבנית ואינטראקטיבית שמשלימה את תוכנית הלימודים מבוססת הפרקים למעלה. הסדנה מתוכננת ללמידה בקצב עצמי וגם למפגשים בהנחיית מדריך.

#### 🛠️ מאפייני הסדנה
- **ממשק מבוסס דפדפן**: סדנה מלאה מופעלת ע"י MkDocs עם חיפוש, העתקה ותכונות נושא
- **אינטגרציית GitHub Codespaces**: הקמת סביבת פיתוח בלחיצה אחת
- **נתיב למידה מובנה**: 8 מודולים עם תרגילים מודרכים (סך הכל 3-4 שעות)
- **מתודולוגיה התקדמותית**: מבוא → בחירה → אימות → פירוק → קונפיגורציה → התאמה אישית → פירוק → סיכום
- **סביבת DevContainer אינטראקטיבית**: כלים ותלויות מוגדרים מראש

#### 📚 מבנה מודולי הסדנה
הסדנה פועלת לפי **מתודולוגיה התקדמותית עם 8 מודולים** שמובילה אתכם מגילוי ועד לשליטה בפריסה:

| מודול | נושא | מה תעשו | משך |
|--------|-------|----------------|----------|
| **0. מבוא** | סקירת הסדנה | הבנת מטרות למידה, דרישות מוקדמות ומבנה הסדנה | 15 דק' |
| **1. בחירה** | גילוי תבניות | חקר תבניות AZD ובחירת תבנית AI מתאימה לתרחיש שלך | 20 דק' |
| **2. אימות** | פריסה ואימות | פריסת התבנית עם `azd up` ואימות פעילות התשתית | 30 דק' |
| **3. פירוק** | הבנת המבנה | שימוש ב-GitHub Copilot לחקירת ארכיטקטורת תבנית, קבצי Bicep וארגון הקוד | 30 דק' |
| **4. קונפיגורציה** | מעמיק azure.yaml | שליטה בקונפיגורציית `azure.yaml`, קריאות מחזור חיים ומשתני סביבה | 30 דק' |
| **5. התאמה אישית** | להפוך לשייך | הפעלת חיפוש AI, מעקב, הערכה והתאמה אישית לתרחיש שלך | 45 דק' |
| **6. פירוק סופי** | ניקוי | הסרת משאבים בצורה בטוחה עם `azd down --purge` | 15 דק' |
| **7. סיכום** | צעדים הבאים | סקירת הישגים, מושגים מרכזיים והמשך הלמידה | 15 דק' |

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
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 תוצאות למידה בסדנה
המשתתפים בסיום הסדנה:
- **יפרסמו אפליקציות AI לייצור**: שימוש ב-AZD עם שירותי Microsoft Foundry
- **ישלטו בארכיטקטורות רב-סוכניות**: יישום פתרונות סוכני AI מתואמים
- **יישמו שיטות אבטחה מיטביות**: קונפיגורציית אימות ובקרת גישה
- **יאופטמו לקנה מידה**: עיצוב פריסות חסכוניות וביצועים גבוהים
- **יפתרו תקלות בפריסות**: פתרון עצמאי של בעיות נפוצות

#### 📖 משאבי הסדנה
- **🎥 מדריך אינטראקטיבי**: [חומרי הסדנה](workshop/README.md) - סביבת למידה בדפדפן
- **📋 הוראות מודול אחר מודול**:
  - [0. מבוא](workshop/docs/instructions/0-Introduction.md) - סקירת הסדנה ומטרותיה
  - [1. בחירה](workshop/docs/instructions/1-Select-AI-Template.md) - מציאת ובחירת תבניות AI
  - [2. אימות](workshop/docs/instructions/2-Validate-AI-Template.md) - פריסה ואימות תבניות
  - [3. פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - חקירת ארכיטקטורת התבנית
  - [4. קונפיגורציה](workshop/docs/instructions/4-Configure-AI-Template.md) - שליטה ב-azure.yaml
  - [5. התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) - התאמה לתרחיש שלך
  - [6. פירוק סופי](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ניקוי משאבים
  - [7. סיכום](workshop/docs/instructions/7-Wrap-up.md) - סקירה וצעדים הבאים
- **🛠️ מעבדת סדנת AI**: [מעבדת סדנת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - תרגילים ממוקדי AI
- **💡 התחלה מהירה**: [מדריך התקנת הסדנה](workshop/README.md#quick-start) - קונפיגורציית סביבה

**מתאים במיוחד ל**: הכשרות ארגוניות, קורסי אוניברסיטה, למידה בקצב עצמי וסדנאות לפיתוח.

---

## 📖 התמקדות מעמיקה: יכולות AZD

מעבר ליסודות, AZD מספק יכולות חזקות לפריסות ייצור:

- **פריסות מבוססות תבניות** - שימוש בתבניות מוכנות לדפוסי אפליקציה נפוצים
- **תשתית כקוד** - ניהול משאבי Azure באמצעות Bicep או Terraform  
- **זרימות עבודה משולבות** - פריסה, הפעלה, וניטור של האפליקציות בצורה חלקה
- **מותאם למפתחים** - אופטימיזציה לפרודוקטיביות וחוויית המפתח

### **AZD + Microsoft Foundry: מותאם לפריסות AI**

**למה AZD לפתרונות AI?** AZD מתמודד עם האתגרים המרכזיים שמפתחי AI פוגשים:

- **תבניות מוכנות ל-AI** - תבניות מוגדרות מראש עבור דגמי Microsoft Foundry, שירותי Azure AI, ועומסי ML
- **פריסות AI מאובטחות** - דפוסי אבטחה משולבים לשירותי AI, מפתחות API, ונקודות קצה למודל  
- **דפוסי AI לייצור** - שיטות עבודה מומלצות לפריסות אפליקציות AI ניתנות להרחבה וחסכוניות
- **זרימות עבודה מקצה לקצה ל-AI** - מפיתוח מודל ועד פריסת ייצור עם ניטור נאות
- **אופטימיזציית עלויות** - הקצאת משאבים חכמה ואסטרטגיות קנה מידה לעומסי AI
- **אינטגרציית Microsoft Foundry** - חיבור חלק לקטלוג מודלים ונקודות קצה של Microsoft Foundry

---

## 🎯 ספריית תבניות ודוגמאות

### מובחר: תבניות Microsoft Foundry
**התחילו כאן אם אתם מפרסים אפליקציות AI!**

> **הערה:** תבניות אלה מדגימות דפוסי AI שונים. חלקן מדגמי Azure חיצוניים, אחרות יישומים מקומיים.

| תבנית | פרק | מורכבות | שירותים | סוג |
|----------|---------|------------|----------|------|
| [**התחלת שיחה עם AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | חיצוני |
| [**התחלת סוכני AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | פרק 2 | ⭐⭐ | סוכני Foundry + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| חיצוני |
| [**הדגמת Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | חיצוני |
| [**התחלת אפליקציית שיחה OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | חיצוני |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | חיצוני |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | חיצוני |
| [**פתרון סוכני קמעונאות רב-סוכני**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **מקומי** |

### מובחר: תרחישי למידה שלמים
**תבניות אפליקציה מוכנות ייצור המשויכות לפרקי למידה**

| תבנית | פרק למידה | מורכבות | למידה עיקרית |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | דפוסי פריסת AI בסיסיים |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | יישום RAG עם Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | פרק 4 | ⭐⭐ | אינטגרציית בינה לתמלילים |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | מסגרת סוכן וקריאת פונקציות |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐ | תזמור AI ארגוני |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | ארכיטקטורת רב-סוכנים עם סוכני לקוחות ומלאי |

### למידה לפי סוג דוגמה

> **📌 דוגמאות מקומיות לעומת חיצוניות:**  
> **דוגמאות מקומיות** (במאגר זה) = מוכנות לשימוש מיידי  
> **דוגמאות חיצוניות** (דגמי Azure) = לשכפל ממאגרי קוד מקושרים

#### דוגמאות מקומיות (מוכנות לשימוש)
- [**פתרון סוכנים רב-סוכני לקמעונאות**](examples/retail-scenario.md) - יישום מלא מוכן ייצור עם תבניות ARM
  - ארכיטקטורת רב-סוכנית (לקוחות + מלאי)
  - ניטור והערכה מקיפים
  - פריסה בלחיצת כפתור דרך תבנית ARM

#### דוגמאות מקומיות - אפליקציות מכולות (פרקים 2-5)
**דוגמאות פריסה מקיפות של מכולות במאגר זה:**
- [**דוגמאות אפליקציות מכולות**](examples/container-app/README.md) - מדריך שלם לפריסות מכולות
  - [API Flask פשוט](../../examples/container-app/simple-flask-api) - REST API בסיסי עם קנה מידה לאפס
  - [ארכיטקטורת מיקרו-שירותים](../../examples/container-app/microservices) - פריסה מוכנה ייצור של שירותים מרובים
  - דפוסים של התחלה מהירה, ייצור ופריסה מתקדמת
  - הנחיות ניטור, אבטחה, ואופטימיזציה של עלויות

#### דוגמאות חיצוניות - אפליקציות פשוטות (פרקים 1-2)
**שכפול מאגרים של דגמי Azure אלה להתחלות:**
- [אפליקציית ווב פשוטה - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - דפוסי פריסה בסיסיים
- [אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - פריסת תוכן סטטי
- [אפליקציית מכולה - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - פריסת REST API

#### דוגמאות חיצוניות - אינטגרציה למסדי נתונים (פרקים 3-4)  
- [אפליקציית מסד נתונים - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - דפוסי חיבור למסד נתונים
- [פונקציות + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - זרימת נתונים ללא שרת

#### דוגמאות חיצוניות - דפוסים מתקדמים (פרקים 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - ארכיטקטורות שירותים מרובים
- [עבודות אפליקציות מכולות](https://github.com/Azure-Samples/container-apps-jobs) - עיבוד ברקע  
- [צינור ML ארגוני](https://github.com/Azure-Samples/mlops-v2) - דפוסי ML מוכנים ייצור

### אוספי תבניות חיצוניים
- [**גלריית תבניות רשמית של AZD**](https://azure.github.io/awesome-azd/) - אוסף מסונן של תבניות רשמיות וקהילתיות
- [**תבניות Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - תיעוד תבניות מ-Microsoft Learn
- [**ספריית דוגמאות**](examples/README.md) - דוגמאות למידה מקומיות עם הסברים מפורטים

---

## 📚 משאבי למידה והפניות

### הפניות מהירות
- [**גליונות פקודות**](resources/cheat-sheet.md) - פקודות azd חיוניות מאורגנות לפי פרק
- [**מילון מונחים**](resources/glossary.md) - מונחים של Azure ו-azd  
- [**שאלות נפוצות**](resources/faq.md) - שאלות נפוצות מאורגנות לפי פרק לימודי
- [**מדריך לימוד**](resources/study-guide.md) - תרגולים מקיפים

### סדנאות מעשיות
- [**מעבדת סדנת AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפכו את פתרונות ה-AI שלכם לפרוסים ב-AZD (2-3 שעות)
- [**סדנא אינטראקטיבית**](workshop/README.md) - תרגילים מונחים ב-8 מודולים עם MkDocs ו-GitHub Codespaces
  - כולל: מבוא → בחירה → אימות → ניתוח → קונפיגורציה → התאמה אישית → פירוק → סיכום

### משאבי לימוד חיצוניים
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מחשבון מחירי Azure](https://azure.microsoft.com/pricing/calculator/)
- [סטטוס Azure](https://status.azure.com/)

### מיומנויות סוכן AI לעורך הקוד שלך
- [**מיומנויות Microsoft Azure בשירות skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 מיומנויות סוכן פתוחות ל-Azure AI, Foundry, פריסה, אבחון, אופטימיזציית עלויות ועוד. התקן אותם ב-GitHub Copilot, Cursor, Claude Code, או כל סוכן נתמך:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 מדריך פתרון בעיות מהיר

**בעיות נפוצות עבור מתחילים ופתרונות מיידיים:**

<details>
<summary><strong>❌ "azd: פקודה לא נמצאה"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "לא נמצאה הרשמה" או "הרשמה לא מוגדרת"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" או "החריגה מהקצבה"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" נכשל באמצע הדרך</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "האימות נכשל" או "הטוקן פג תוקף"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "המשאב כבר קיים" או קונפליקטים בשמות</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ פריסת תבנית אורכת זמן רב מדי</strong></summary>

**זמני המתנה רגילים:**
- אפליקציית ווב פשוטה: 5-10 דקות
- אפליקציה עם מסד נתונים: 10-15 דקות
- אפליקציות AI: 15-25 דקות (הספקת OpenAI איטית)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "הרשאה נדחתה" או "אסור"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ לא מצליח למצוא את כתובת ה-URL של האפליקציה שפורסה</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 משאבי פתרון בעיות מלאים

- **מדריך בעיות נפוצות:** [פתרונות מפורטים](docs/chapter-07-troubleshooting/common-issues.md)
- **בעיות ספציפיות ל-AI:** [פתרון בעיות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **מדריך ניפוי שגיאות:** [ניפוי שגיאות צעד-אחר-צעד](docs/chapter-07-troubleshooting/debugging.md)
- **קבל עזרה:** [Discord של Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 סיום קורס והסמכה

### מעקב התקדמות
עקוב אחר התקדמות הלמידה שלך בכל פרק:

- [ ] **פרק 1**: יסודות והתחלה מהירה ✅
- [ ] **פרק 2**: פיתוח AI-ראשון ✅  
- [ ] **פרק 3**: קונפיגורציה ואימות ✅
- [ ] **פרק 4**: תשתית כקוד ופריסה ✅
- [ ] **פרק 5**: פתרונות AI מרובי סוכנים ✅
- [ ] **פרק 6**: אימות ותכנון לפני פריסה ✅
- [ ] **פרק 7**: פתרון בעיות וניפוי שגיאות ✅
- [ ] **פרק 8**: דפוסי ייצור וארגוניים ✅

### אימות הלמידה
לאחר השלמת כל פרק, אמת את הידע שלך על ידי:
1. **תרגול מעשי**: השלם את פריסת הפרק המעשי
2. **בדיקת ידע**: עיין בקטע השאלות הנפוצות של הפרק שלך
3. **דיון בקהילה**: שתף את הניסיון שלך ב-Discord של Azure  
4. **פרק הבא**: עבור לרמת הקושי הבאה

### יתרונות סיום הקורס
עם סיום כל הפרקים, תהיה לך:
- **ניסיון ייצור**: פריסה של אפליקציות AI אמיתיות ל-Azure  
- **מיומנויות מקצועיות**: יכולות פריסה מוכנות לארגון  
- **הכרה בקהילה**: חבר פעיל בקהילת מפתחי Azure
- **קידום קריירה**: מומחיות פריסה מבוקשת ב-AZD ו-AI

---

## 🤝 קהילה ותמיכה

### קבל עזרה ותמיכה
- **בעיות טכניות**: [דווח על באגים ובקש תכונות](https://github.com/microsoft/azd-for-beginners/issues)
- **שאלות לימוד**: [קהילת Microsoft Azure Discord](https://discord.gg/microsoft-azure) ו-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **עזרה מיוחדת ל-AI**: הצטרף ל-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **תיעוד**: [תיעוד רשמי של Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### תובנות מהקהילה של Microsoft Foundry Discord

**תוצאות סקרים אחרונות מערוץ #Azure:**
- **45%** מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI
- **האתגרים המובילים**: פריסות מרובות שירותים, ניהול אישורים, מוכנות לייצור  
- **הנדרשים ביותר**: תבניות ייעודיות ל-AI, מדריכי פתרון בעיות, שיטות עבודה מומלצות

**הצטרפו לקהילה שלנו כדי:**
- לשתף את ניסיונות AZD + AI ולקבל עזרה  
- לקבל הצצות מוקדמות לתבניות AI חדשות  
- לתרום לשיטות פריסה מיטביות ל-AI  
- להשפיע על פיתוח תכונות עתידיות ל-AI + AZD

### תרומה לקורס
אנחנו מקבלים תרומות! אנא קראו את [מדריך התרומה](CONTRIBUTING.md) לפרטים על:
- **שיפור תוכן**: שפרו פרקים ודוגמאות קיימות
- **דוגמאות חדשות**: הוסיפו תרחישים ותבניות מהעולם האמיתי  
- **תירגום**: עזרו לתחזק תמיכה רב-לשונית
- **דיווחי באגים**: שפרו דיוק ובהירות
- **סטנדרטים קהילתיים**: פעלו לפי קווי ההנחיה השוויוניים שלנו

---

## 📄 מידע על הקורס

### רישיון
פרויקט זה מורשה תחת רישיון MIT - ראה את הקובץ [LICENSE](../../LICENSE) לפרטים.

### משאבי למידה קשורים של מייקרוסופט

הצוות שלנו מפיק קורסים מקיפים נוספים:

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
[![AI Agents למתחילים](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת Generative AI
[![Generative AI למתחילים](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### למידה בסיסית
[![ML למתחילים](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![מדע נתונים למתחילים](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI למתחילים](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![סייברסקיוריטי למתחילים](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![פיתוח ווב למתחילים](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT למתחילים](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![פיתוח XR למתחילים](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת Copilot
[![Copilot לתכנות משותף עם AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot ל-C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![הרפתקאות Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ניווט בקורס

**🚀 מוכנים להתחיל ללמוד?**

**מתחילים**: התחילו עם [פרק 1: יסודות והתחלה מהירה](#-chapter-1-foundation--quick-start)  
**מפתחי AI**: דלגו ל-[פרק 2: פיתוח AI-ראשון](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**מפתחים מנוסים**: התחילו עם [פרק 3: קונפיגורציה ואימות](#️-chapter-3-configuration--authentication)

**השלבים הבאים**: [התחל פרק 1 - יסודות AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->