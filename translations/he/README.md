# AZD למתחילים: מסע למידה מובנה

![AZD-for-beginners](../../translated_images/he/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### תרגומים אוטומטיים (תמיד מעודכנים)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[ערבית](../ar/README.md) | [בנגלית](../bn/README.md) | [בולגרית](../bg/README.md) | [בורמזית (מיאנמר)](../my/README.md) | [סינית (מפושטת)](../zh-CN/README.md) | [סינית (מסורתית, הונג קונג)](../zh-HK/README.md) | [סינית (מסורתית, מקאו)](../zh-MO/README.md) | [סינית (מסורתית, טאיוואן)](../zh-TW/README.md) | [קרואטית](../hr/README.md) | [צ’כית](../cs/README.md) | [דנית](../da/README.md) | [הולנדית](../nl/README.md) | [אסטונית](../et/README.md) | [פינית](../fi/README.md) | [צרפתית](../fr/README.md) | [גרמנית](../de/README.md) | [יוונית](../el/README.md) | [עברית](./README.md) | [הינדי](../hi/README.md) | [הונגרית](../hu/README.md) | [אינדונזית](../id/README.md) | [איטלקית](../it/README.md) | [יפנית](../ja/README.md) | [קאנאדה](../kn/README.md) | [קוריאנית](../ko/README.md) | [ליטאית](../lt/README.md) | [מלאית](../ms/README.md) | [מלאיאלאם](../ml/README.md) | [מרטהי](../mr/README.md) | [נפאלית](../ne/README.md) | [פיג’ין ניגרי](../pcm/README.md) | [נורווגית](../no/README.md) | [פרסית (פרסי)](../fa/README.md) | [פולנית](../pl/README.md) | [פורטוגזית (ברזיל)](../pt-BR/README.md) | [פורטוגזית (פורטוגל)](../pt-PT/README.md) | [פונג’אבי (גורמוכ’י)](../pa/README.md) | [רומנית](../ro/README.md) | [רוסית](../ru/README.md) | [סרבית (קירילית)](../sr/README.md) | [סלובקית](../sk/README.md) | [סלובנית](../sl/README.md) | [ספרדית](../es/README.md) | [סווהילית](../sw/README.md) | [שוודית](../sv/README.md) | [טאגאלוג (פיליפינית)](../tl/README.md) | [טמילית](../ta/README.md) | [טלוגו](../te/README.md) | [תאית](../th/README.md) | [טורקית](../tr/README.md) | [אוקראינית](../uk/README.md) | [אורדו](../ur/README.md) | [וייטנאמית](../vi/README.md)

> **מעדיפים לשכפל מקומית?**
>
> מאגר זה כולל למעלה מ-50 תרגומים שונים לשפות שמגדילים משמעותית את גודל ההורדה. לשכפול ללא תרגומים, השתמשו ב-sparse checkout:
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
> זה נותן לכם את כל מה שצריך להשלמת הקורס עם הורדה הרבה יותר מהירה.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 מה חדש ב-azd היום

Azure Developer CLI גדל מעבר לאפליקציות רשת ו-API מסורתיים. היום, azd הוא הכלי היחיד לפריסה של **כל** אפליקציה ב-Azure — כולל אפליקציות מבוססות AI וסוכנים אינטיליגנטיים.

הנה מה שזה אומר עבורכם:

- **סוכני AI הם כעת משימות azd מדרגה ראשונה.** תוכלו לאתחל, לפרוס, ולנהל פרויקטים של סוכני AI באמצעות אותו תהליך `azd init` → `azd up` שאתם כבר מכירים.
- **הטמעת Microsoft Foundry** מביאה פריסת מודלים, אירוח סוכנים, וקונפיגורציית שירותי AI ישירות לאקוסיסטם של תבניות azd.
- **תהליך העבודה המרכזי לא השתנה.** בין אם אתם מפעילים אפליקציית TODO, מיקרו-שירות או פתרון AI עם סוכנים מרובים, הפקודות זהות.

אם כבר השתמשתם ב-azd בעבר, התמיכה ב-AI היא הרחבה טבעית — לא כלי נפרד או מסלול מתקדם. אם אתם מתחילים, תלמדו תהליך אחד שעובד על הכל.

---

## 🚀 מה זה Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** הוא כלי שורת פקודה ידידותי למפתחים שמפשט את פריסת האפליקציות ב-Azure. במקום ליצור ולחבר ידנית עשרות משאבים ב-Azure, תוכלו לפרוס אפליקציות שלמות עם פקודה אחת.

### הקסם של `azd up`

```bash
# פקודה אחת זו עושה הכל:
# ✅ יוצרת את כל המשאבים של Azure
# ✅ מגדירה את הרשת ואת האבטחה
# ✅ בונה את קוד האפליקציה שלך
# ✅ מפריסה ל-Azure
# ✅ נותנת לך כתובת URL עובדת
azd up
```

**זה הכל!** בלי ללחוץ בפורטל Azure, בלי ללמוד תבניות ARM מסובכות, בלי הגדרות ידניות — רק אפליקציות עובדות ב-Azure.

---

## ❓ Azure Developer CLI מול Azure CLI: מה ההבדל?

השאלה הנפוצה ביותר שמתחילים שואלים. הנה התשובה הפשוטה:

| תכונה | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **מטרה** | ניהול משאבים בודדים ב-Azure | פריסת אפליקציות שלמות |
| **גישה מחשבתית** | ממוקד תשתית | ממוקד אפליקציה |
| **דוגמה** | `az webapp create --name myapp...` | `azd up` |
| **עקומת למידה** | חייב להכיר שירותי Azure | רק להכיר את האפליקציה שלך |
| **טוב ל** | DevOps, תשתיות | מפתחים, פרוטוטייפינג |

### אנלוגיה פשוטה

- **Azure CLI** הוא כמו שיש לך את כל הכלים לבניית בית – פטישים, מסורים, מסמרים. אפשר לבנות כל דבר, אבל חייבים להכיר בנייה.
- **Azure Developer CLI** הוא כמו שכירת קבלן – אתה מתאר מה אתה רוצה, והם מטפלים בבנייה.

### מתי להשתמש בכל אחד מהם

| תרחיש | השתמש בזה |
|----------|----------|
| "אני רוצה לפרוס במהירות אפליקציית רשת" | `azd up` |
| "אני רוצה ליצור רק חשבון אחסון" | `az storage account create` |
| "אני בונה אפליקציית AI מלאה" | `azd init --template azure-search-openai-demo` |
| "אני רוצה לתקן תקלה במשאב Azure מסוים" | `az resource show` |
| "אני רוצה פריסה מוכנה לייצור בדקות" | `azd up --environment production` |

### הם עובדים יחד!

AZD משתמש ב-Azure CLI מתחת למכסה המנוע. אפשר להשתמש בשניהם:
```bash
# פרוס את האפליקציה שלך באמצעות AZD
azd up

# ואז כוונן משאבים ספציפיים באמצעות Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 מצאו תבניות ב-Awesome AZD

אל תתחילו מאפס! **Awesome AZD** הוא אוסף קהילתי של תבניות מוכנות לפריסה:

| משאב | תיאור |
|----------|-------------|
| 🔗 [**גלריית Awesome AZD**](https://azure.github.io/awesome-azd/) | דפדפו ב-200+ תבניות עם פריסה בלחיצה אחת |
| 🔗 [**שלחו תבנית**](https://github.com/Azure/awesome-azd/issues) | תרמו את התבנית שלכם לקהילה |
| 🔗 [**מאגר GitHub**](https://github.com/Azure/awesome-azd) | סמנו בכוכב וחקרו את הקוד |

### תבניות AI פופולריות מ-Awesome AZD

```bash
# RAG צ'אט עם דגמי Microsoft Foundry + חיפוש בינה מלאכותית
azd init --template azure-search-openai-demo

# אפליקציית צ'אט בינה מלאכותית מהירה
azd init --template openai-chat-app-quickstart

# סוכני בינה מלאכותית עם סוכני Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 התחילו ב-3 שלבים

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

### שלב 2: התחברו ל-Azure

```bash
azd auth login
```

### שלב 3: פרסו את האפליקציה הראשונה שלכם

```bash
# אתחול מתבנית
azd init --template todo-nodejs-mongo

# פריסה ל-Azure (יוצר הכל!)
azd up
```

**🎉 זהו זה!** האפליקציה שלכם עכשיו חיה ב-Azure.

### נקו אחרי כן (אל תשכחו!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 איך להשתמש בקורס הזה

קורס זה מיועד ל**למידה הדרגתית** – התחילו במקום שנוח לכם ועלו שלב-שלב:

| הניסיון שלכם | התחילו כאן |
|-----------------|------------|
| **חדש לגמרי ב-Azure** | [פרק 1: יסודות](#-chapter-1-foundation--quick-start) |
| **מכירים את Azure, חדשים ל-AZD** | [פרק 1: יסודות](#-chapter-1-foundation--quick-start) |
| **רוצים לפרוס אפליקציות AI** | [פרק 2: פיתוח ראשוני עם AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **רוצים תרגול מעשי** | [🎓 סדנה אינטראקטיבית](workshop/README.md) - מעבדה מודרכת של 3-4 שעות |
| **זקוקים לתבניות ייצור** | [פרק 8: תבניות ייצור וארגוניות](#-chapter-8-production--enterprise-patterns) |

### התקנה מהירה

1. **צרו Fork למאגר הזה**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **שכפלו אותו**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **קבלו עזרה**: [קהילת Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **מעדיפים לשכפל מקומית?**

> מאגר זה כולל למעלה מ-50 תרגומים לשפות שמגדילים משמעותית את גודל ההורדה. לשכפול ללא תרגומים, השתמשו ב-sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> זה נותן לכם את כל מה שצריך להשלמת הקורס עם הורדה הרבה יותר מהירה.


## סקירת הקורס

למדו את Azure Developer CLI (azd) דרך פרקים מובנים שנועדו ללמידה הדרגתית. **מוקד מיוחד על פריסת אפליקציות AI עם אינטגרציה ל-Microsoft Foundry.**

### למה הקורס הזה חיוני למפתחים מודרניים

בהתבסס על תובנות מקהילת Microsoft Foundry ב-Discord, **45% מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI** אך נתקלים באתגרים עם:
- ארכיטקטורות AI מורכבות עם שירותים מרובים
- שיטות עבודה מומלצות לפריסת AI בייצור  
- אינטגרציה וקונפיגורציה של שירותי AI ב-Azure
- אופטימיזציה של עלויות לעומסי עבודה של AI
- פתרון תקלות בבעיות ייחודיות לפריסת AI

### מטרות הלמידה

בסיום הקורס המבוסס הזה, תלמדו:
- **לשלוט ביסודות AZD**: מושגים עיקריים, התקנה וקונפיגורציה
- **לפרוס אפליקציות AI**: שימוש ב-AZD עם שירותי Microsoft Foundry
- **להטמיע תשתית כקוד**: ניהול משאבי Azure עם תבניות Bicep
- **לטפל בתקלות בפריסה**: פתרון בעיות נפוצות ודיבוג
- **לאופטימיזציה לייצור**: אבטחה, סקיילינג, ניטור וניהול עלויות
- **לבנות פתרונות עם סוכנים מרובים**: פריסת ארכיטקטורות AI מורכבות

## 🗺️ מפת הקורס: ניווט מהיר לפי פרק

לכל פרק יש README ייעודי עם מטרות למידה, התחלות מהירות ותרגילים:

| פרק | נושא | שיעורים | משך זמן | רמת מורכבות |
|---------|-------|---------|----------|------------|
| **[פרק 1: יסודות](docs/chapter-01-foundation/README.md)** | התחלה | [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [התקנה](docs/chapter-01-foundation/installation.md) &#124; [הפרויקט הראשון](docs/chapter-01-foundation/first-project.md) | 30-45 דק' | ⭐ |
| **[פרק 2: פיתוח בינה מלאכותית](docs/chapter-02-ai-development/README.md)** | אפליקציות ממוקדות AI | [אינטגרציה עם Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [סוכני AI](docs/chapter-02-ai-development/agents.md) &#124; [פריסת מודל](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [סדנה](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 שעות | ⭐⭐ |
| **[פרק 3: תצורה](docs/chapter-03-configuration/README.md)** | אימות ואבטחה | [תצורה](docs/chapter-03-configuration/configuration.md) &#124; [אימות ואבטחה](docs/chapter-03-configuration/authsecurity.md) | 45-60 דקות | ⭐⭐ |
| **[פרק 4: תשתית](docs/chapter-04-infrastructure/README.md)** | IaC ופריסה | [מדריך לפריסה](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [הקצאה](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 שעות | ⭐⭐⭐ |
| **[פרק 5: סוכנים מרובי](docs/chapter-05-multi-agent/README.md)** | פתרונות סוכני AI | [תרחיש קמעונאי](examples/retail-scenario.md) &#124; [תבניות תיאום](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[פרק 6: לפני פריסה](docs/chapter-06-pre-deployment/README.md)** | תכנון ואימות | [בדיקות מוקדמות](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [תובנות אפליקציה](docs/chapter-06-pre-deployment/application-insights.md) | 1 שעה | ⭐⭐ |
| **[פרק 7: פתרון בעיות](docs/chapter-07-troubleshooting/README.md)** | איתור ותיקון שגיאות | [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) &#124; [איתור שגיאות](docs/chapter-07-troubleshooting/debugging.md) &#124; [בעיות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 שעות | ⭐⭐ |
| **[פרק 8: ייצור](docs/chapter-08-production/README.md)** | תבניות ארגוניות | [שיטות ייצור](docs/chapter-08-production/production-ai-practices.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[🎓 סדנה](workshop/README.md)** | מעבדה מעשית | [הקדמה](workshop/docs/instructions/0-Introduction.md) &#124; [בחירה](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [אימות](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [תצורה](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [פירוק](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [סיכום](workshop/docs/instructions/7-Wrap-up.md) | 3-4 שעות | ⭐⭐ |

**משך קורס כולל:** ~10-14 שעות | **התקדמות בכישורים:** מתחיל → מוכן לייצור

---

## 📚 פרקי למידה

*בחר את מסלול הלמידה שלך בהתחשב ברמת הניסיון והמטרות*

### 🚀 פרק 1: יסודות והתחלה מהירה
**דרישות מוקדמות**: מנוי Azure, ידע בסיסי בשורת פקודה  
**משך**: 30-45 דקות  
**מורכבות**: ⭐

#### מה תלמד
- הבנת יסודות Azure Developer CLI
- התקנת AZD בפלטפורמה שלך
- הפריסה המוצלחת הראשונה שלך

#### משאבי למידה
- **🎯 התחל כאן**: [מהו Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 תיאוריה**: [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) - מושגים מרכזיים וטרמינולוגיה
- **⚙️ התקנה**: [התקנה והגדרה](docs/chapter-01-foundation/installation.md) - מדריכים לפי פלטפורמה
- **🛠️ מעשי**: [הפרויקט הראשון שלך](docs/chapter-01-foundation/first-project.md) - הדרכה צעד-אחר-צעד
- **📋 הפניה מהירה**: [גליון רמאות לפקודות](resources/cheat-sheet.md)

#### תרגילים מעשיים
```bash
# בדיקת התקנה מהירה
azd version

# פרוס את היישום הראשון שלך
azd init --template todo-nodejs-mongo
azd up
```

**💡 תוצאת הפרק**: פריסה מוצלחת של אפליקציית רשת פשוטה ל-Azure באמצעות AZD

**✅ אימות הצלחה:**
```bash
# לאחר סיום פרק 1, עליך להיות מסוגל:
azd version              # מציג את הגרסה המותקנת
azd init --template todo-nodejs-mongo  # מאתחל את הפרויקט
azd up                  # מוציא לפועל ב-Azure
azd show                # מציג את כתובת ה-URL של האפליקציה הפועלת
# האפליקציה נפתחת בדפדפן ופועלת
azd down --force --purge  # מנקה משאבים
```

**📊 זמן השקעה:** 30-45 דקות  
**📈 רמת מיומנות לאחר:** יכול לפרוס אפליקציות בסיסיות באופן עצמאי
**📈 רמת מיומנות לאחר:** יכול לפרוס אפליקציות בסיסיות באופן עצמאי

---

### 🤖 פרק 2: פיתוח ממוקד AI (מומלץ למפתחי AI)
**דרישות מוקדמות**: פרק 1 הושלם  
**משך**: 1-2 שעות  
**מורכבות**: ⭐⭐

#### מה תלמד
- אינטגרציה עם Microsoft Foundry ב-AZD
- פריסה של אפליקציות עם כוח AI
- הבנת תצורות שירותי AI

#### משאבי למידה
- **🎯 התחל כאן**: [אינטגרציה עם Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 סוכני AI**: [מדריך סוכני AI](docs/chapter-02-ai-development/agents.md) - פריסת סוכנים אינטליגנטים עם AZD
- **📖 תבניות**: [פריסת מודל AI](docs/chapter-02-ai-development/ai-model-deployment.md) - פריסה וניהול של מודלים ל-AI
- **🛠️ סדנה**: [מעבדת סדנת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפוך את פתרונות ה-AI שלך למוכנים ל-AZD
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

**💡 תוצאת הפרק**: פריסה ותצורה של אפליקציית צ'אט מופעלת AI עם יכולות RAG

**✅ אימות הצלחה:**
```bash
# לאחר פרק 2, תוכל ל:
azd init --template azure-search-openai-demo
azd up
# לבדוק את ממשק הצ'אט של ה-AI
# לשאול שאלות ולקבל תגובות מונעות בינה מלאכותית עם מקורות
# לאמת ששילוב החיפוש פועל
azd monitor  # לבדוק ש-Application Insights מציג טלמטריה
azd down --force --purge
```

**📊 זמן השקעה:** 1-2 שעות  
**📈 רמת מיומנות לאחר:** יכול לפרוס ולתצור אפליקציות AI מוכנות לייצור  
**💰 מודעות לעלות:** להבין עלויות פיתוח של $80-150 לחודש, ועלויות ייצור של $300-3500 לחודש

#### 💰 שיקולי עלות עבור פריסות AI

**סביבת פיתוח (הערכת $80-150/חודש):**
- דגמי Microsoft Foundry (תשלום לפי שימוש): $0-50/חודש (מבוסס על שימוש בטוקנים)
- חיפוש AI (רמה בסיסית): $75/חודש
- Container Apps (צריכה): $0-20/חודש
- אחסון (סטנדרטי): $1-5/חודש

**סביבת ייצור (הערכת $300-3,500+/חודש):**
- דגמי Microsoft Foundry (PTU לביצועים עקביים): $3,000+/חודש או תשלום לפי נפח גבוה
- חיפוש AI (רמה סטנדרטית): $250/חודש
- Container Apps (מסור): $50-100/חודש
- Application Insights: $5-50/חודש
- אחסון (פרימיום): $10-50/חודש

**💡 טיפים לאופטימיזציית עלויות:**
- השתמש בדגמי Microsoft Foundry חינמיים ללמידה (כולל Azure OpenAI 50,000 טוקנים לחודש)
- הרץ `azd down` לשחרור משאבים כאשר לא מפתחים פעיל
- התחל בחיוב מבוסס צריכה, שדרג ל-PTU רק לייצור
- השתמש ב-`azd provision --preview` להערכת עלויות לפני פריסה
- אפשר סקייל אוטומטי: לשלם רק על השימוש האמיתי

**מעקב עלויות:**
```bash
# בדוק עלויות חודשיות מוערכות
azd provision --preview

# נטר עלויות בפועל בפורטל Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ פרק 3: תצורה ואימות
**דרישות מוקדמות**: פרק 1 הושלם  
**משך**: 45-60 דקות  
**מורכבות**: ⭐⭐

#### מה תלמד
- תצורת הסביבה וניהולה
- אימות ואבטחה טובים
- הגדרת שמות ומשאבים בארגון

#### משאבי למידה
- **📖 תצורה**: [מדריך תצורה](docs/chapter-03-configuration/configuration.md) - הגדרת סביבה
- **🔐 אבטחה**: [תבניות אימות וזהות מנוהלת](docs/chapter-03-configuration/authsecurity.md) - תבניות אימות
- **📝 דוגמאות**: [דוגמת אפליקציית מסד נתונים](examples/database-app/README.md) - דוגמאות למסדי נתונים ב-AZD

#### תרגילים מעשיים
- הגדרת סביבות מרובות (פיתוח, תקינה, ייצור)
- הקמת אימות זהות מנוהלת
- יישום תצורות ייחודיות לסביבה

**💡 תוצאת הפרק**: ניהול סביבות מרובות עם אימות ואבטחה תקינים

---

### 🏗️ פרק 4: תשתית כקוד ופריסה
**דרישות מוקדמות**: פרקים 1-3 הושלמו  
**משך**: 1-1.5 שעות  
**מורכבות**: ⭐⭐⭐

#### מה תלמד
- תבניות פריסה מתקדמות
- תשתית כקוד עם Bicep
- אסטרטגיות הקצאת משאבים

#### משאבי למידה
- **📖 פריסה**: [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) - זרימות עבודה שלמות
- **🏗️ הקצאה**: [הקצאת משאבים](docs/chapter-04-infrastructure/provisioning.md) - ניהול משאבי Azure
- **📝 דוגמאות**: [דוגמת Container App](../../examples/container-app) - פריסות מכולות

#### תרגילים מעשיים
- צור תבניות Bicep מותאמות אישית
- פרוס אפליקציות עם שירותים מרובים
- יישם אסטרטגיות פריסה כחול-ירוק

**💡 תוצאת הפרק**: פרוס אפליקציות מורכבות עם כמה שירותים באמצעות תבניות תשתית מותאמות

---

### 🎯 פרק 5: פתרונות AI עם סוכנים מרובים (מתקדם)
**דרישות מוקדמות**: פרקים 1-2 הושלמו  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמד
- דפוסי אדריכלות סוכנים מרובי
- תיאום ואורקסטרציה של סוכנים
- פריסות AI מוכנות לייצור

#### משאבי למידה
- **🤖 פרויקט מובחר**: [פתרון סוכן מרובה בקמעונאות](examples/retail-scenario.md) - יישום שלם
- **🛠️ תבניות ARM**: [חבילת תבניות ARM לסוכנים מרובים](../../examples/retail-multiagent-arm-template) - פריסה בלחיצה אחת
- **📖 אדריכלות**: [דפוסי תיאום סוכנים מרובים](docs/chapter-06-pre-deployment/coordination-patterns.md) - דפוסים

#### תרגילים מעשיים
```bash
# פרוס את פתרון הסוכנים המרובה הקמעונאי השלם
cd examples/retail-multiagent-arm-template
./deploy.sh

# חקור תצורות סוכנים
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 תוצאת הפרק**: פרוס ונהל פתרון AI עם סוכנים מרובי מוכן לייצור הכולל סוכני לקוח ומלאי

---

### 🔍 פרק 6: אימות ותכנון לפני פריסה
**דרישות מוקדמות**: פרק 4 הושלם  
**משך**: 1 שעה  
**מורכבות**: ⭐⭐

#### מה תלמד
- תכנון קיבולת ואימות משאבים
- אסטרטגיות בחירת SKU
- בדיקות מוקדמות ואוטומציה

#### משאבי למידה
- **📊 תכנון**: [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) - אימות משאבים
- **💰 בחירה**: [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) - בחירות חסכוניות
- **✅ אימות**: [בדיקות מוקדמות](docs/chapter-06-pre-deployment/preflight-checks.md) - סקריפטים אוטומטיים

#### תרגילים מעשיים
- הרץ סקריפטים לאימות קיבולת
- אופטימיזציה של בחירת SKU לחיסכון
- יישם בדיקות אוטומטיות לפני פריסה

**💡 תוצאת הפרק**: אמת ואופטם פריסות לפני ביצוע

---

### 🚨 פרק 7: פתרון בעיות ואיתור שגיאות
**דרישות מוקדמות**: כל פרק פריסה הושלם  
**משך**: 1-1.5 שעות  
**מורכבות**: ⭐⭐

#### מה תלמד
- גישות שיטתיות לאיתור שגיאות
- בעיות נפוצות ופתרונן
- פתרון בעיות ספציפי ל-AI

#### משאבי למידה
- **🔧 בעיות נפוצות**: [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) - שאלות ותשובות ופתרונות
- **🕵️ איתור שגיאות**: [מדריך איתור שגיאות](docs/chapter-07-troubleshooting/debugging.md) - אסטרטגיות צעד-אחר-צעד
- **🤖 בעיות AI**: [פתרון בעיות AI ספציפי](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - בעיות שירותי AI

#### תרגילים מעשיים
- אבחן כשלים בפריסה
- פתר בעיות אימות
- איתור תקלות בקישוריות שירותי AI

**💡 תוצאת הפרק**: אבחן ותקן באופן עצמאי בעיות נפוצות בפריסה

---

### 🏢 פרק 8: ייצור ותבניות ארגוניות
**דרישות מוקדמות**: פרקים 1-4 הושלמו  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמד
- אסטרטגיות פריסת ייצור
- דפוסי אבטחה ארגוניים
- ניטור ואופטימיזציית עלויות

#### משאבי למידה
- **🏭 ייצור**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - תבניות ארגוניות  
- **📝 דוגמאות**: [Microservices Example](../../examples/microservices) - ארכיטקטורות מורכבות  
- **📊 ניטור**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - ניטור  

#### תרגילים מעשיים  
- יישום תבניות אבטחה ארגוניות  
- הקמת ניטור מקיף  
- פריסה לייצור עם ממשל תקין  

**💡 תוצאת הפרק**: פריסת יישומים מוכנים לייצור עם כל יכולות הייצור המלאות  

---

## 🎓 סקירת הסדנה: חוויית למידה מעשית  

> **⚠️ מצב הסדנה: פיתוח פעיל**  
> חומרי הסדנה נמצאים כעת בפיתוח ושיפור. מודולים מרכזיים פעילים, אך חלק מהמדורים המתקדמים אינם שלמים. אנו פועלים להשלים את כל התוכן. [עקבו אחר ההתקדמות →](workshop/README.md)  

### חומרי סדנה אינטראקטיביים  
**למידה מעשית מקיפה עם כלים בדפדפן ותרגילים מודרכים**  

חומרי הסדנה שלנו מספקים חווית למידה מובנית ואינטראקטיבית שמוסיפה ללמידה מבוססת הפרקים שלמעלה. הסדנה מתוכננת ללמידה עצמאית והנחייה על ידי מדריך.  

#### 🛠️ תכונות הסדנה  
- **ממשק מבוסס דפדפן**: סדנת MkDocs מלאה עם חיפוש, העתקה ותכונות נושא  
- **אינטגרציה ל-GitHub Codespaces**: הקמת סביבת פיתוח בלחיצה אחת  
- **מסלול למידה מובנה**: 8 מודולים עם תרגילים מודרכים (3-4 שעות בסך הכל)  
- **מתודולוגיה הדרגתית**: מבוא → בחירה → אימות → פירוק → קונפיגורציה → התאמה אישית → סיום → סיכום  
- **סביבת DevContainer אינטראקטיבית**: כלים ותלויות מוגדרים מראש  

#### 📚 מבנה מודולי הסדנה  
הסדנה פועלת לפי **מתודולוגיה הדרגתית ב-8 מודולים** שמובילה אותך מגילוי לשליטה בפריסה:  

| מודול | נושא | מה תעשה | משך זמן |  
|--------|-------|----------------|----------|  
| **0. מבוא** | סקירת הסדנה | הבנת מטרות הלמידה, דרישות מוקדמות ומבנה הסדנה | 15 דקות |  
| **1. בחירה** | גילוי תבניות | חקר תבניות AZD ובחירת התבנית המתאימה לתרחיש שלך | 20 דקות |  
| **2. אימות** | פריסה ואימות | פריסה של התבנית עם `azd up` ואימות תפקוד התשתית | 30 דקות |  
| **3. פירוק** | הבנת המבנה | שימוש ב-GitHub Copilot לחקר ארכיטקטורת התבנית, קבצי Bicep וארגון קוד | 30 דקות |  
| **4. קונפיגורציה** | עיון מעמיק ב-azure.yaml | שליטה בקונפיגורציית `azure.yaml`, lifecycle hooks ומשתני סביבה | 30 דקות |  
| **5. התאמה אישית** | הפוך את זה לשלך | הפעלת AI Search, מעקב, הערכה והתאמה לתרחיש שלך | 45 דקות |  
| **6. סיום** | ניקוי | הסרת משאבים בבטחה עם `azd down --purge` | 15 דקות |  
| **7. סיכום** | צעדים הבאים | סקירת הישגים, מושגים מרכזיים והמשך מסלול הלמידה | 15 דקות |  

**מהלך הסדנה:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 התחלת הסדנה  
```bash
# אפשרות 1: GitHub Codespaces (מומלץ)
# לחץ על "קוד" → "צור מרחב קוד ב-main" במאגר

# אפשרות 2: פיתוח מקומי
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# עקוב אחר הוראות ההתקנה ב-workshop/README.md
```
  
#### 🎯 תוצאות למידה בסדנה  
בסיום הסדנה, המשתתפים:  
- **יפרסמו יישומי AI לייצור**: שימוש ב-AZD עם שירותי Microsoft Foundry  
- **ילמדו ארכיטקטורות מרובות סוכנים**: יישום פתרונות סוכני AI מתואמים  
- **יבצעו שיטות אבטחה מיטביות**: קונפיגורציה של אימות ובקרת גישה  
- **יאופטימיזו לגודל**: תכנון פריסות יעילות וחסכוניות  
- **יתקנו בעיות פריסה**: פתרון תקלות נפוצות באופן עצמאי  

#### 📖 משאבי הסדנה  
- **🎥 מדריך אינטראקטיבי**: [חומרי הסדנה](workshop/README.md) - סביבת למידה בדפדפן  
- **📋 הוראות מודולריות**:  
  - [0. מבוא](workshop/docs/instructions/0-Introduction.md) - סקירת הסדנה ומטרות  
  - [1. בחירה](workshop/docs/instructions/1-Select-AI-Template.md) - מצא ובחר תבניות AI  
  - [2. אימות](workshop/docs/instructions/2-Validate-AI-Template.md) - פריסה ואימות תבניות  
  - [3. פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - חקר ארכיטקטורת התבנית  
  - [4. קונפיגורציה](workshop/docs/instructions/4-Configure-AI-Template.md) - שליטה ב-azure.yaml  
  - [5. התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) - התאמה לתרחיש שלך  
  - [6. סיום](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ניקוי משאבים  
  - [7. סיכום](workshop/docs/instructions/7-Wrap-up.md) - סקירה וצעדים הבאים  
- **🛠️ מעבדת סדנת AI**: [מעבדת סדנת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - תרגילי AI עדכניים  
- **💡 התחלה מהירה**: [מדריך הגדרת הסדנה](workshop/README.md#quick-start) - קונפיגורציית הסביבה  

**מומלץ ל:** הכשרות ארגוניות, קורסים אקדמיים, למידה עצמאית ובוטקאמפים למפתחים.  

---

## 📖 העמקה: יכולות AZD  

מעבר ליסודות, AZD מספק יכולות עוצמתיות לפריסות ייצור:  

- **פריסות מבוססות תבניות** - שימוש בתבניות מוכנות לתבניות יישומים נפוצות  
- **תשתית כקוד** - ניהול משאבי Azure באמצעות Bicep או Terraform  
- **זרימות עבודה משולבות** - פריסה, הפעלה וניטור חלקים  
- **מותאם למפתחים** - אופטימיזציה לפרודוקטיביות וחווית מפתח  

### **AZD + Microsoft Foundry: אידיאלי לפריסות AI**  

**למה AZD לפתרונות AI?** AZD פותר אתגרים מרכזיים שפוגשים מפתחי AI:  

- **תבניות מוכנות ל-AI** - תבניות מוכנות של דגמי Microsoft Foundry, Cognitive Services ועומסי ML  
- **פריסות AI מאובטחות** - תבניות אבטחה מובנות לשירותי AI, מפתחות API ונקודות קצה  
- **דפוסי ייצור AI** - שיטות מיטביות לפריסות AI קנה מידה וחסכוניות  
- **זרימות AI מקצה לקצה** - מפיתוח מודל לפריסת ייצור עם ניטור תקין  
- **אופטימיזציית עלות** - שיטת הקצאת משאבים חכמה והרחבה לעומסים שונים  
- **אינטגרציה עם Microsoft Foundry** - חיבור חלק לקטלוג המודלים ונקודות הקצה של Foundry  

---

## 🎯 ספריית תבניות ודוגמאות  

### מומלצים: תבניות Microsoft Foundry  
**התחל כאן אם אתה פריס יישומי AI!**  

> **הערה:** תבניות אלו ממחישות דפוסי AI שונים. חלקן דוגמאות Azure חיצוניות, אחרות יישומים מקומיים.  

| תבנית | פרק | מורכבות | שירותים | סוג |  
|----------|---------|------------|----------|------|  
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | חיצוני |  
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | פרק 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| חיצוני |  
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | חיצוני |  
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | חיצוני |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | חיצוני |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | חיצוני |  
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **מקומי** |  

### מומלצים: תרחישי למידה שלמים  
**תבניות יישום מוכנות לייצור המשויכות לפרקי הלמידה**  

| תבנית | פרק למידה | מורכבות | למידה מפתח |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | דפוסי פריסת AI בסיסיים |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | מימוש RAG עם Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | פרק 4 | ⭐⭐ | אינטגרציית בינה מסמכים |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | מסגרת סוכנים וקריאות פונקציות |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐ | אורקסטרציה ארגונית של AI |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | ארכיטקטורת סוכנים מרובת לסוכני לקוחות ומלאי |  

### למידה לפי סוג דוגמה  

> **📌 דוגמאות מקומיות לעומת חיצוניות:**  
> **דוגמאות מקומיות** (במאגר זה) = מוכנות לשימוש מיידי  
> **דוגמאות חיצוניות** (דוגמאות Azure) = שיבוט ממאגרים מקושרים  

#### דוגמאות מקומיות (מוכנות לשימוש)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - מימוש מלא ומוכן לייצור עם תבניות ARM  
  - ארכיטקטורת סוכנים מרובה (לקוחות וסוכני מלאי)  
  - ניטור והערכה מקיפים  
  - פריסה בלחיצה אחת באמצעות תבנית ARM  

#### דוגמאות מקומיות - יישומי מכולות (פרקים 2-5)  
**דוגמאות פריסה מלאות של מכולות במאגר זה:**  
- [**Container App Examples**](examples/container-app/README.md) - מדריך שלם לפריסות מכולות  
  - [API בסיסי Flask](../../examples/container-app/simple-flask-api) - REST API בסיסי עם סקיילינג לאפס  
  - [ארכיטקטורת מיקרוסרוויסים](../../examples/container-app/microservices) - פריסת שירותים מרובת בשלבים לייצור  
  - דפוסי התחלה מהירה, ייצור, ופריסה מתקדמת  
  - הנחיות ניטור, אבטחה ואופטימיזציית עלות  

#### דוגמאות חיצוניות - יישומים פשוטים (פרקים 1-2)  
**שיבוט מאגרים לדוגמאות Azure לקבלת התחלה מהירה:**  
- [אפליקציית Web פשוטה - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - דפוסי פריסה בסיסיים  
- [אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - פריסת תוכן סטטי  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - פריסת REST API  

#### דוגמאות חיצוניות - אינטגרציית בסיסי נתונים (פרקים 3-4)  
- [אפליקציית בסיס נתונים - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - דפוסי חיבור לבסיסי נתונים  
- [פונקציות + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - זרימת נתונים ללא שרת  

#### דוגמאות חיצוניות - דפוסים מתקדמים (פרקים 4-8)  
- [מיקרוסרוויסים ב-Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - ארכיטקטורות שירותים מרובים  
- [Jobs ל-Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - עיבוד ברקע  
- [צינור ML ארגוני](https://github.com/Azure-Samples/mlops-v2) - דפוסי ML מוכנים לייצור  

### אוספי תבניות חיצוניים  
- [**גלריית תבניות רשמית של AZD**](https://azure.github.io/awesome-azd/) - אוסף מתומצת של תבניות רשמיות וקהילתיות  
- [**תיעוד תבניות Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - תיעוד Microsoft Learn לתבניות  
- [**ספריית דוגמאות**](examples/README.md) - דוגמאות למידה מקומיות עם הסברים מפורטים  

---

## 📚 משאבי למידה והפניות  

### הפניות מהירות  
- [**גליון פקודות**](resources/cheat-sheet.md) - פקודות azd חיוניות לפי פרק  
- [**מילון מונחים**](resources/glossary.md) - מונחי Azure ו-azd  
- [**שאלות נפוצות**](resources/faq.md) - שאלות נפוצות מסודרות לפי פרקי למידה  
- [**מדריך תרגול**](resources/study-guide.md) - תרגילים מלאים  

### סדנאות מעשיות  
- [**מעבדת סדנת AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפוך פתרונות AI לפריסת AZD (2-3 שעות)  
- [**סדנה אינטראקטיבית**](workshop/README.md) - 8 מודולים עם תרגילים מודרכים MkDocs ו-GitHub Codespaces  
  - מתווה: מבוא → בחירה → אימות → פירוק → קונפיגורציה → התאמה אישית → סיום → סיכום  

### משאבי למידה חיצוניים
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מחשבון התמחור של Azure](https://azure.microsoft.com/pricing/calculator/)
- [סטטוס Azure](https://status.azure.com/)

### מיומנויות סוכן AI לעורך שלך
- [**מיומנויות Microsoft Azure ב-skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 מיומנויות סוכן פתוחות ל-AI של Azure, Foundry, פריסה, אבחון, אופטימיזציית עלויות, ועוד. התקן אותן ב-GitHub Copilot, Cursor, Claude Code, או בכל סוכן נתמך:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 מדריך פתרון בעיות מהיר

**בעיות נפוצות שמתחילים נתקלים בהן ופתרונות מידיים:**

<details>
<summary><strong>❌ "azd: פקודה לא נמצאה"</strong></summary>

```bash
# התקן את AZD תחילה
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

# הגדר לסביבת AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# אמת
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" או "חריגת מכסה"</strong></summary>

```bash
# נסה אזור Azure שונה
azd env set AZURE_LOCATION "westus2"
azd up

# או השתמש ב-SKU קטנים יותר בסביבת הפיתוח
# ערוך את infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" נכשל באמצע</strong></summary>

```bash
# אפשרות 1: נקה ונסה שוב
azd down --force --purge
azd up

# אפשרות 2: תקן רק את התשתית
azd provision

# אפשרות 3: בדוק מצב מפורט
azd show

# אפשרות 4: בדוק יומנים ב-Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" או "הטוקן פג תוקף"</strong></summary>

```bash
# אימות מחדש
az logout
az login

azd auth logout
azd auth login

# אימות את זהות המשתמש
az account show
```
</details>

<details>
<summary><strong>❌ "המשאב כבר קיים" או סכסוכים בשם</strong></summary>

```bash
# AZD מייצר שמות ייחודיים, אך אם יש התנגדות:
azd down --force --purge

# ואז נסה שוב עם סביבה חדשה
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ פריסת תבנית לוקחת יותר מדי זמן</strong></summary>

**זמני המתנה רגילים:**
- אפליקציית ווב פשוטה: 5-10 דקות
- אפליקציה עם בסיס נתונים: 10-15 דקות
- אפליקציות AI: 15-25 דקות (התהליך לפתיחת OpenAI איטי)

```bash
# בדוק התקדמות
azd show

# אם תקוע יותר מ-30 דקות, בדוק את פורטל Azure:
azd monitor
# חפש פריסות שנכשלו
```
</details>

<details>
<summary><strong>❌ "Permission denied" או "Forbidden"</strong></summary>

```bash
# בדוק את התפקיד שלך באז’ור
az role assignment list --assignee $(az account show --query user.name -o tsv)

# דרוש לך לפחות תפקיד "תורם"
# בקש ממנהל האז’ור שלך להעניק:
# - תורם (למשאבים)
# - מנהל גישה למשתמש (להקצאות תפקיד)
```
</details>

<details>
<summary><strong>❌ לא מצליח למצוא את כתובת ה-URL של האפליקציה שפורסה</strong></summary>

```bash
# הצג את כל נקודות הקצה של השירות
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
- **מדריך ניפוי שגיאות:** [ניפוי שגיאות שלב-אחר-שלב](docs/chapter-07-troubleshooting/debugging.md)
- **קבל עזרה:** [Discord של Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 השלמת קורס ותעודה

### מעקב התקדמות
עקוב אחרי התקדמות הלמידה שלך בכל פרק:

- [ ] **פרק 1**: יסודות והתחלה מהירה ✅
- [ ] **פרק 2**: פיתוח ממוקד AI ✅  
- [ ] **פרק 3**: תצורה ואימות ✅
- [ ] **פרק 4**: תשתית כקוד ופריסה ✅
- [ ] **פרק 5**: פתרונות AI עם סוכנים מרובים ✅
- [ ] **פרק 6**: בדיקה ותכנון לפני פריסה ✅
- [ ] **פרק 7**: פתרון בעיות וניפוי שגיאות ✅
- [ ] **פרק 8**: דפוסי ייצור ותאגיד ✅

### אימות למידה
לאחר השלמת כל פרק, אמת את הידע שלך באמצעות:
1. **תרגול מעשי**: סיים את הפריסה המעשי של הפרק
2. **בדיקת ידע**: עיין בקטגוריית השאלות הנפוצות של הפרק
3. **דיון בקהילה**: שתף את החוויה שלך ב-Discord של Azure
4. **הפרק הבא**: עבור לרמת ההרכב הבאה

### יתרונות השלמת הקורס
לאחר השלמת כל הפרקים, יהיו לך:
- **ניסיון ייצור**: פרשת אפליקציות AI אמיתיות ב-Azure
- **מיומנויות מקצועיות**: יכולות פריסה מוכנות לארגון  
- **הכרה בקהילה**: חבר פעיל בקהילת מפתחי Azure
- **קידום קריירה**: מומחיות נדרשת ב-AZD ופריסות AI

---

## 🤝 קהילה ותמיכה

### קבל עזרה ותמיכה
- **בעיות טכניות**: [דווח על באגים ובקש תכונות](https://github.com/microsoft/azd-for-beginners/issues)
- **שאלות למידה**: [קהילת Microsoft Azure Discord](https://discord.gg/microsoft-azure) ו-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **עזרה ספציפית ל-AI**: הצטרף ל-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **תיעוד**: [תיעוד רשמי של Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### תובנות מהקהילה ב-Microsoft Foundry Discord

**תוצאות סקר אחרון בערוץ #Azure:**
- **45%** מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI
- **אתגרים מובילים**: פריסות עם שירותים מרובים, ניהול אישורים, מוכנות לייצור  
- **הבקשות הנפוצות ביותר**: תבניות ספציפיות ל-AI, מדריכי פתרון בעיות, שיטות עבודה מומלצות

**הצטרף לקהילה שלנו כדי:**
- לשתף חוויות AZD + AI ולקבל עזרה
- לקבל גישות מוקדמות לתבניות AI חדשות
- לתרום לשיטות עבודה מומלצות בפריסות AI
- להשפיע על פיתוח תכונות עתידיות של AI + AZD

### תרומה לקורס
אנו מקבלים בברכה תרומות! אנא קרא את [מדריך התרומה שלנו](CONTRIBUTING.md) לפרטים על:
- **שיפורי תוכן**: שדרג פרקים ודוגמאות קיימות
- **דוגמאות חדשות**: הוסף תרחישים ותבניות מהעולם האמיתי  
- **תרגום**: סייע בשמירת תמיכה בריבוי שפות
- **דיווח על באגים**: שפר דיוק ובהירות
- **סטנדרטים קהילתיים**: פעל לפי הנחיות הקהילה הכוללת שלנו

---

## 📄 פרטי הקורס

### רישיון
הפרויקט מורשה תחת רישיון MIT - ראה את קובץ [LICENSE](../../LICENSE) לפרטים.

### משאבי למידה קשורים של Microsoft

הצוות שלנו מייצר קורסי למידה משלימים נוספים:

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
[![AI יצרני (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### למידה בסיסית
[![ML למתחילים](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![מדעי הנתונים למתחילים](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI למתחילים](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![אבטחת סייבר למתחילים](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![פיתוח ווב למתחילים](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT למתחילים](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![פיתוח XR למתחילים](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ניווט בקורס

**🚀 מוכנים להתחיל ללמוד?**

**מתחילים**: התחילו עם [פרק 1: יסודות והתחלה מהירה](#-chapter-1-foundation--quick-start)  
**מפתחים בינה מלאכותית**: דלגו ל[פרק 2: פיתוח מוביל בינה מלאכותית](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**מפתחים מנוסים**: התחילו עם [פרק 3: קונפיגורציה ואימות](#️-chapter-3-configuration--authentication)

**שלבים הבאים**: [התחילו בפרק 1 - יסודות AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו משתדלים לדייק, יש לזכור שתרגומים אוטומטיים עלולים להכיל טעויות או אי-דיוקים. יש להתייחס למסמך המקורי בשפת המקור כמקור הסמכותי. עבור מידע קריטי מומלץ להיעזר בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לכל אי הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->