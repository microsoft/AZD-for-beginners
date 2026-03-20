# AZD למתחילים: מסע למידה מובנה

![AZD-for-beginners](../../translated_images/he/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### תרגומים אוטומטיים (תמיד מעודכנים)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](./README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **מעדיפים לשכפל מקומית?**
>
> מאגר זה כולל מעל ל-50 תרגומים של שפות, מה שמגדיל משמעותית את גודל ההורדה. כדי לשכפל ללא התרגומים, השתמשו בבדיקת בחירה דלילה:
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

## 🆕 מה חדש היום ב-azd

Azure Developer CLI התפתח מעבר לאפליקציות רשת ו-API המסורתיים. היום, azd הוא הכלי היחיד לפריסה של **כל** אפליקציה ל-Azure — כולל אפליקציות מבוססות בינה מלאכותית וסוכנים אינטיליגנטים.

זוהי המשמעות עבורך:

- **סוכני AI הם עכשיו עומסי עבודה מהשורה הראשונה של azd.** ניתן לאתחל, לפרוס ולנהל פרויקטים של סוכני AI באמצעות אותו זרימת עבודה של `azd init` → `azd up` שאתם כבר מכירים.
- **אינטגרציה עם Microsoft Foundry** מציעה פריסת מודלים, אירוח סוכנים והגדרות שירותי AI ישירות במערכת התבניות של azd.
- **זרימת העבודה המרכזית לא השתנתה.** בין אם אתם מפתחים אפליקציית todo, מיקרו-שירות או פתרון AI רב-סוכנים, הפקודות נשארות אותו הדבר.

אם השתמשתם ב-azd בעבר, התמיכה ב-AI היא הרחבה טבעית — לא כלי נפרד או מסלול מתקדם. אם אתם מתחילים, תלמדו זרימת עבודה אחת שמתאימה לכולם.

---

## 🚀 מה זה Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** הוא כלי שורת פקודה ידידותי למפתחים, שמפשט פריסת אפליקציות ל-Azure. במקום ליצור ולחבר בעבודת יד עשרות משאבי Azure, ניתן לפרוס אפליקציות שלמות בפקודה אחת.

### הקסם של `azd up`

```bash
# הפקודה היחידה הזו עושה הכל:
# ✅ יוצר את כל המשאבים של Azure
# ✅ מגדיר את הרשת והאבטחה
# ✅ בונה את קוד האפליקציה שלך
# ✅ מפריס ל-Azure
# ✅ נותן לך כתובת URL פעילה
azd up
```

**וזהו!** אין צורך להקליק בפורטל Azure, אין צורך ללמוד תבניות ARM מורכבות, לא צריך קונפיגורציות ידניות — רק אפליקציות שעובדות על Azure.

---

## ❓ Azure Developer CLI מול Azure CLI: מה ההבדל?

זו השאלה הנפוצה ביותר שמתחילים שואלים. הנה התשובה הפשוטה:

| תכונה | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **מטרה** | ניהול משאבי Azure בודדים | פריסת אפליקציות שלמות |
| **מנטליות** | ממוקד תשתית | ממוקד אפליקציה |
| **דוגמה** | `az webapp create --name myapp...` | `azd up` |
| **עקומת למידה** | צריך לדעת שירותי Azure | רק להכיר את האפליקציה שלך |
| **מתאים ל** | DevOps, תשתיות | מפתחים, אבטיפוס |

### אנלוגיה פשוטה

- **Azure CLI** הוא כמו שיש לכם את כל הכלים לבניית בית — פטישים, מסורים, מסמרים. אפשר לבנות הכל, אבל צריך לדעת בנייה.
- **Azure Developer CLI** הוא כמו לשכור קבלן — אתם מתארים מה רוצים, והוא מטפל בבנייה.

### מתי משתמשים בכל אחד?

| תרחיש | השתמש ב- |
|----------|----------|
| "אני רוצה לפרוס את אפליקציית הרשת שלי מהר" | `azd up` |
| "אני צריך ליצור רק חשבון אחסון" | `az storage account create` |
| "אני בונה אפליקציית AI מלאה" | `azd init --template azure-search-openai-demo` |
| "אני צריך לנפות באגים במשאב Azure ספציפי" | `az resource show` |
| "אני רוצה פריסה מוכנה לייצור תוך דקות" | `azd up --environment production` |

### הם עובדים ביחד!

AZD משתמש ב-Azure CLI מתחת לפני השטח. אפשר להשתמש בשניהם:
```bash
# פרוס את האפליקציה שלך באמצעות AZD
azd up

# לאחר מכן כוונן משאבים ספציפיים באמצעות Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 מצאו תבניות ב-Awesome AZD

אל תתחילו מאפס! **Awesome AZD** הוא אוסף קהילתי של תבניות מוכנות לפריסה:

| משאב | תיאור |
|----------|-------------|
| 🔗 [**גלריית Awesome AZD**](https://azure.github.io/awesome-azd/) | עיינו ב-200+ תבניות עם פריסה בקליק |
| 🔗 [**שלחו תבנית**](https://github.com/Azure/awesome-azd/issues) | תרמו תבנית משלכם לקהילה |
| 🔗 [**מאגר GitHub**](https://github.com/Azure/awesome-azd) | מלאו כוכב וחקרו את המקור |

### תבניות AI פופולריות מ-Awesome AZD

```bash
# צ'אט RAG עם דגמי Microsoft Foundry + חיפוש בינה מלאכותית
azd init --template azure-search-openai-demo

# יישום צ'אט בינה מלאכותית מהיר
azd init --template openai-chat-app-quickstart

# סוכני בינה מלאכותית עם סוכני Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 איך להתחיל ב-3 שלבים

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

### שלב 2: התחבר ל-Azure

```bash
azd auth login
```

### שלב 3: פרוס את האפליקציה הראשונה שלך

```bash
# אתחול מתבנית
azd init --template todo-nodejs-mongo

# פרוס ל-Azure (יוצר הכל!)
azd up
```

**🎉 וזהו!** האפליקציה שלך עכשיו פעילה ב-Azure.

### ניקוי (אל תשכחו!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 איך להשתמש בקורס הזה

הקורס מעוצב ללמידה **הדרגתית** — התחילו מהמקום שבו אתם מרגישים נוח, ועבדו במעלה:

| הניסיון שלך | התחל כאן |
|-----------------|------------|
| **חדש לגמרי ב-Azure** | [פרק 1: הבסיס](#-chapter-1-foundation--quick-start) |
| **מכיר את Azure, חדש ב-AZD** | [פרק 1: הבסיס](#-chapter-1-foundation--quick-start) |
| **רוצה לפרוס אפליקציות AI** | [פרק 2: פיתוח AI-ראשון](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **רוצה תרגול מעשי** | [🎓 סדנה אינטראקטיבית](workshop/README.md) - מעבדת הדרכה של 3-4 שעות |
| **צריך דפוסי ייצור** | [פרק 8: ייצור וארגוני](#-chapter-8-production--enterprise-patterns) |

### התקנה מהירה

1. **צרו Fork למאגר הזה**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **שכפלו אותו**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **קבלו עזרה**: [קהילת Discord של Azure](https://discord.com/invite/ByRwuEEgH4)

> **מעדיפים לשכפל מקומית?**

> מאגר זה כולל מעל ל-50 תרגומים של שפות, מה שמגדיל משמעותית את גודל ההורדה. כדי לשכפל ללא התרגומים, השתמשו בבדיקת בחירה דלילה:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> זה נותן לכם את כל מה שצריך להשלמת הקורס עם הורדה הרבה יותר מהירה.


## סקירת הקורס

שלוט ב-Azure Developer CLI (azd) דרך פרקים מובנים שמיועדים ללמידה הדרגתית. **דגש מיוחד על פריסת אפליקציות AI עם אינטגרציה ל-Microsoft Foundry.**

### למה הקורס הזה חיוני למפתחים מודרניים

בהתבסס על תובנות מתוך קהילת Microsoft Foundry ב-Discord, **45% מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI** אך מתמודדים עם אתגרים של:
- ארכיטקטורות AI מורכבות עם שירותים מרובים  
- שיטות עבודה מומלצות לפריסת AI בייצור  
- אינטגרציה והגדרה של שירותי AI ב-Azure  
- אופטימיזציה של עלויות לעומסי עבודה של AI  
- פתרון תקלות בפריסות AI ספציפיות  

### מטרות הלמידה

בסיום הקורס המובנה הזה, תלמדו:
- **אחיזת יסודות AZD**: מושגים מרכזיים, התקנה וקונפיגורציה  
- **פריסת אפליקציות AI**: שימוש ב-AZD עם שירותי Microsoft Foundry  
- **יישום תשתית כקוד**: ניהול משאבי Azure עם תבניות Bicep  
- **פתרון תקלות בפריסות**: טיפול בבעיות נפוצות וניפוי באגים  
- **אופטימיזציה לייצור**: אבטחה, סקיילינג, ניטור וניהול עלויות  
- **בניית פתרונות רב-סוכניים**: פריסת ארכיטקטורות AI מורכבות  

## 🗺️ מפת הקורס: ניווט מהיר לפי פרק

לכל פרק יש README ייעודי עם מטרות למידה, התחלה מהירה, ותרגילים:

| פרק | נושא | שיעורים | משך | רמת קושי |
|---------|-------|---------|----------|------------|
| **[פרק 1: הבסיס](docs/chapter-01-foundation/README.md)** | התחלה | [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [התקנה](docs/chapter-01-foundation/installation.md) &#124; [הפרויקט הראשון](docs/chapter-01-foundation/first-project.md) | 30-45 דקות | ⭐ |
| **[פרק 2: פיתוח בינה מלאכותית](docs/chapter-02-ai-development/README.md)** | אפליקציות ממוקדות בינה מלאכותית | [אינטגרציה עם Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [סוכני בינה מלאכותית](docs/chapter-02-ai-development/agents.md) &#124; [פריסת מודלים](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [סדנה](docs/chapter-02-ai-development/ai-workshop-lab.md) | שעתיים | ⭐⭐ |
| **[פרק 3: תצורה](docs/chapter-03-configuration/README.md)** | אימות ואבטחה | [תצורה](docs/chapter-03-configuration/configuration.md) &#124; [אימות ואבטחה](docs/chapter-03-configuration/authsecurity.md) | 45-60 דקות | ⭐⭐ |
| **[פרק 4: תשתית](docs/chapter-04-infrastructure/README.md)** | IaC ופריסה | [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [פרוביזיה](docs/chapter-04-infrastructure/provisioning.md) | שעה-שעה וחצי | ⭐⭐⭐ |
| **[פרק 5: סוכנים מרובים](docs/chapter-05-multi-agent/README.md)** | פתרונות סוכני בינה מלאכותית | [תרחיש קמעונאי](examples/retail-scenario.md) &#124; [דפוסי תיאום](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[פרק 6: לפני פריסה](docs/chapter-06-pre-deployment/README.md)** | תכנון ואימות | [בדיקות טרום טיסה](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [תובנות אפליקציה](docs/chapter-06-pre-deployment/application-insights.md) | שעה | ⭐⭐ |
| **[פרק 7: פתרון תקלות](docs/chapter-07-troubleshooting/README.md)** | ניפוי באגים ותיקון | [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ניפוי באגים](docs/chapter-07-troubleshooting/debugging.md) &#124; [בעיות בינה מלאכותית](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | שעה-שעה וחצי | ⭐⭐ |
| **[פרק 8: ייצור](docs/chapter-08-production/README.md)** | דפוסי ארגוניים | [פרקטיקות ייצור](docs/chapter-08-production/production-ai-practices.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[🎓 סדנה](workshop/README.md)** | מעבדה מעשית | [מבוא](workshop/docs/instructions/0-Introduction.md) &#124; [בחירה](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [אימות](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [תצורה](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [איתחול](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [סיכום](workshop/docs/instructions/7-Wrap-up.md) | 3-4 שעות | ⭐⭐ |

**משך הקורס הכולל:** ~10-14 שעות | **התקדמות מיומנות:** מתחיל → מוכן לייצור

---

## 📚 פרקי לימוד

*בחר את מסלול הלמידה שלך בהתאם לרמת הניסיון והמטרות*

### 🚀 פרק 1: יסודות והתחלה מהירה  
**דרישות מוקדמות**: מנוי Azure, ידע בסיסי בשורת פקודה  
**משך**: 30-45 דקות  
**מורכבות**: ⭐

#### מה תלמדו  
- הבנת יסודות Azure Developer CLI  
- התקנת AZD בפלטפורמה שלך  
- הפריסה הראשונה המוצלחת שלך  

#### משאבי למידה  
- **🎯 התחל כאן**: [מה זה Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 תאוריה**: [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) - מושגי יסוד ומונחים  
- **⚙️ התקנה**: [התקנה והגדרה](docs/chapter-01-foundation/installation.md) - מדריכים לפלטפורמות  
- **🛠️ מעשי**: [הפרויקט הראשון שלך](docs/chapter-01-foundation/first-project.md) - מדריך צעד-אחר-צעד  
- **📋 עזר מהיר**: [גליון רמאויות לפקודות](resources/cheat-sheet.md)  

#### תרגילים מעשיים  
```bash
# בדיקת התקנה מהירה
azd version

# פרוס את היישום הראשון שלך
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 תוצר הפרק**: לפרוס בהצלחה אפליקציית רשת פשוטה ל-Azure בעזרת AZD  

**✅ אימות הצלחה:**  
```bash
# לאחר השלמת פרק 1, אתה אמור להיות מסוגל:
azd version              # מציג את הגרסה המותקנת
azd init --template todo-nodejs-mongo  # מאתחל את הפרויקט
azd up                  # מפרסם ל-Azure
azd show                # מציג את כתובת ה-URL של האפליקציה הפועלת
# האפליקציה נפתחת בדפדפן ופועלת
azd down --force --purge  # מנקה משאבים
```
  
**📊 משך זמן:** 30-45 דקות  
**📈 רמת מיומנות אחר כך:** מסוגל לפרוס אפליקציות בסיסיות באופן עצמאי

---

### 🤖 פרק 2: פיתוח ממוקד בינה מלאכותית (מומלץ למפתחי AI)  
**דרישות מוקדמות**: פרק 1 הושלם  
**משך**: 1-2 שעות  
**מורכבות**: ⭐⭐

#### מה תלמדו  
- אינטגרציה של Microsoft Foundry עם AZD  
- פריסת אפליקציות מבוססות בינה מלאכותית  
- הבנת תצורות שירותי AI  

#### משאבי למידה  
- **🎯 התחל כאן**: [אינטגרציה עם Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 סוכני AI**: [מדריך סוכני AI](docs/chapter-02-ai-development/agents.md) - פריסת סוכנים אינטיליגנטיים עם AZD  
- **📖 דפוסים**: [פריסת מודל AI](docs/chapter-02-ai-development/ai-model-deployment.md) - פריסה וניהול מודלי AI  
- **🛠️ סדנה**: [מעבדת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפוך את פתרונות ה-AI שלך למוכנים עם AZD  
- **🎥 מדריך אינטראקטיבי**: [חומרי סדנה](workshop/README.md) - למידה מבוססת דפדפן עם MkDocs * סביבה DevContainer  
- **📋 תבניות**: [תבניות Microsoft Foundry מובילות](#משאבי-הסדנה)  
- **📝 דוגמאות**: [דוגמאות פריסת AZD](examples/README.md)  

#### תרגילים מעשיים  
```bash
# פרוס את אפליקציית ה-AI הראשונה שלך
azd init --template azure-search-openai-demo
azd up

# נסה תבניות AI נוספות
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 תוצר הפרק**: לפרוס ולהגדיר אפליקציית צ'אט מבוססת AI עם יכולות RAG  

**✅ אימות הצלחה:**  
```bash
# לאחר פרק 2, עליך להיות מסוגל:
azd init --template azure-search-openai-demo
azd up
# לבדוק את ממשק הצ'אט של הבינה המלאכותית
# לשאול שאלות ולקבל תשובות מבוססות בינה מלאכותית עם מקורות
# לוודא ששילוב החיפוש פועל
azd monitor  # לבדוק ש-Application Insights מציג טלמטריה
azd down --force --purge
```
  
**📊 משך זמן:** 1-2 שעות  
**📈 רמת מיומנות אחר כך:** מסוגל לפרוס ולהגדיר אפליקציות AI מוכנות לייצור  
**💰 מודעות עלויות:** להבין עלויות פיתוח של $80-150 לחודש, ועלויות ייצור של $300-3500 לחודש  

#### 💰 שיקולי עלות עבור פריסות AI

**סביבת פיתוח (כ- $80-150 לחודש):**  
- מודלים מ-Microsoft Foundry (תשלום לפי שימוש): $0-50 לחודש (בהתאם לשימוש בטוקנים)  
- חיפוש AI (רמה בסיסית): $75 לחודש  
- אפליקציות מכולה (צריכה): $0-20 לחודש  
- אחסון (סטנדרטי): $1-5 לחודש  

**סביבת ייצור (כ- $300-3500+/לחודש):**  
- מודלים מ-Microsoft Foundry (PTU לביצועים עקביים): $3000+/לחודש או תשלום לפי שימוש עם נפח גבוה  
- חיפוש AI (רמה סטנדרטית): $250 לחודש  
- אפליקציות מכולה (ייעודיות): $50-100 לחודש  
- תובנות אפליקציה: $5-50 לחודש  
- אחסון (פרימיום): $10-50 לחודש  

**💡 טיפים לאופטימיזציה של עלויות:**  
- השתמש בתבניות **שכבת חינם** של Microsoft Foundry ללמידה (כולל Azure OpenAI עם 50,000 טוקנים בחודש)  
- הרץ `azd down` לשחרור משאבים כשהפיתוח לא פעיל  
- התחל בחיוב על פי צריכה, שדרג ל-PTU רק בייצור  
- השתמש בפקודה `azd provision --preview` כדי להעריך עלויות לפני פריסה  
- אפשר קנה מידה אוטומטי: שלם רק על השימוש בפועל  

**מעקב אחר עלויות:**  
```bash
# בדוק את עלויות החודשיות המשוערות
azd provision --preview

# נטר את העלויות בפועל בפורטל Azure
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ פרק 3: תצורה ואימות  
**דרישות מוקדמות**: פרק 1 הושלם  
**משך**: 45-60 דקות  
**מורכבות**: ⭐⭐

#### מה תלמדו  
- תצורת וניהול סביבות  
- אימות ואבטחה מיטביים  
- קביעת שמות ומשאבים  

#### משאבי למידה  
- **📖 תצורה**: [מדריך תצורה](docs/chapter-03-configuration/configuration.md) - הגדרת סביבה  
- **🔐 אבטחה**: [דפוסי אימות וזהות מנוהלת](docs/chapter-03-configuration/authsecurity.md) - דפוסי אימות  
- **📝 דוגמאות**: [דוגמת אפליקציית מסד נתונים](examples/database-app/README.md) - דוגמאות למסד נתונים ב-AZD  

#### תרגילים מעשיים  
- הגדרת סביבות מרובות (dev, staging, prod)  
- הקמה של אימות הזהות המנוהלת  
- יישום תצורות ספציפיות לסביבה  

**💡 תוצר הפרק**: ניהול סביבות מרובות עם אימות ואבטחה נכונים

---

### 🏗️ פרק 4: תשתית כקוד ופריסה  
**דרישות מוקדמות**: פרקים 1-3 הושלמו  
**משך**: שעה-שעה וחצי  
**מורכבות**: ⭐⭐⭐

#### מה תלמדו  
- דפוסי פריסה מתקדמים  
- תשתית כקוד עם Bicep  
- אסטרטגיות פרוביזיה של משאבים  

#### משאבי למידה  
- **📖 פריסה**: [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) - תהליכים מלאים  
- **🏗️ פרוביזיה**: [ניהול משאבים](docs/chapter-04-infrastructure/provisioning.md) - ניהול משאבי Azure  
- **📝 דוגמאות**: [דוגמת אפליקציית מכולה](../../examples/container-app) - פריסות מוכלות  

#### תרגילים מעשיים  
- יצירת תבניות Bicep מותאמות  
- פריסת אפליקציות מרובות שירותים  
- יישום אסטרטגיות פריסה כחולה-ירוקה  

**💡 תוצר הפרק**: לפרוס אפליקציות מרובות שירותים מורכבות באמצעות תבניות תשתית מותאמות

---

### 🎯 פרק 5: פתרונות AI עם סוכנים מרובים (מתקדמים)  
**דרישות מוקדמות**: פרקים 1-2 הושלמו  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמדו  
- דפוסי ארכיטקטורת סוכנים מרובים  
- תיאום ואישור סוכנים  
- פריסות AI מוכנות לייצור  

#### משאבי למידה  
- **🤖 פרויקט מוביל**: [פתרון סוכנים מרובים קמעונאי](examples/retail-scenario.md) - מימוש מלא  
- **🛠️ תבניות ARM**: [חבילה תבניות ARM לסוכנים מרובים](../../examples/retail-multiagent-arm-template) - פריסה בלחיצה אחת  
- **📖 ארכיטקטורה**: [דפוסי תיאום סוכנים מרובים](docs/chapter-06-pre-deployment/coordination-patterns.md) - דפוסים  

#### תרגילים מעשיים  
```bash
# פרוס את פתרון הסוכנים המרובים הקמעונאי המלא
cd examples/retail-multiagent-arm-template
./deploy.sh

# חקור את תצורות הסוכן
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 תוצר הפרק**: לפרוס ולנהל פתרון AI של סוכנים מרובים מוכן לייצור עם סוכני לקוח ומלאי

---

### 🔍 פרק 6: אימות ותכנון לפני פריסה  
**דרישות מוקדמות**: פרק 4 הושלם  
**משך**: שעה  
**מורכבות**: ⭐⭐

#### מה תלמדו  
- תכנון קיבולת ואימות משאבים  
- אסטרטגיות בחירת SKU  
- בדיקות טרום פריסה ואוטומציה  

#### משאבי למידה  
- **📊 תכנון**: [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) - אימות משאבים  
- **💰 בחירה**: [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) - בחירות חסכוניות  
- **✅ אימות**: [בדיקות טרום פריסה](docs/chapter-06-pre-deployment/preflight-checks.md) - סקריפטים אוטומטיים  

#### תרגילים מעשיים  
- הרצת סקריפטים לאימות קיבולת  
- אופטימיזציה של בחירות SKU לחיסכון  
- יישום בדיקות טרום פריסה אוטומטיות  

**💡 תוצר הפרק**: לאמת ולאופטם פריסות לפני ביצוע  

---

### 🚨 פרק 7: פתרון תקלות וניפוי באגים  
**דרישות מוקדמות**: כל פרק פריסה הושלם  
**משך**: שעה-שעה וחצי  
**מורכבות**: ⭐⭐

#### מה תלמדו  
- גישות שיטתיות לניפוי באגים  
- בעיות נפוצות ופתרונות  
- פתרון תקלות ייחודיות לבינה מלאכותית  

#### משאבי למידה  
- **🔧 בעיות נפוצות**: [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) - שאלות נפוצות ופתרונות  
- **🕵️ ניפוי באגים**: [מדריך ניפוי באגים](docs/chapter-07-troubleshooting/debugging.md) - אסטרטגיות צעד-אחר-צעד  
- **🤖 בעיות AI**: [פתרון בעיות בינה מלאכותית](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - בעיות בשירותי AI  

#### תרגילים מעשיים  
- אבחון כישלונות פריסה  
- פתרון בעיות אימות  
- ניפוי באגים לחיבור שירותי AI  

**💡 תוצר הפרק**: לאבחן ולפתור בעיות פריסה נפוצות באופן עצמאי

---

### 🏢 פרק 8: ייצור ודפוסי ארגונים  
**דרישות מוקדמות**: פרקים 1-4 הושלמו  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמדו  
- אסטרטגיות פריסת ייצור  
- דפוסי אבטחה ארגוניים  
- ניטור ואופטימיזציית עלויות  

#### משאבי למידה
- **🏭 ייצור**: [הנחיות טובות ל-AI בייצור](docs/chapter-08-production/production-ai-practices.md) - תבניות ארגוניות  
- **📝 דוגמאות**: [דוגמת מיקרוסרוויסים](../../examples/microservices) - ארכיטקטורות מורכבות  
- **📊 ניטור**: [אינטגרציה של Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - ניטור

#### תרגילים מעשיים
- יישום תבניות אבטחה ארגוניות  
- הקמה של ניטור מקיף  
- פריסה לסביבת הייצור עם ממשל נכון

**💡 תוצר הפרק**: פריסה של יישומים מוכנים לארגון עם יכולות ייצור מלאות

---

## 🎓 סקירת הסדנה: חווית למידה מעשית

> **⚠️ מצב הסדנה: בפיתוח פעיל**  
> חומרי הסדנה נמצאים כעת בפיתוח ושיפור. מודולים מרכזיים פעילים, אולם חלק מהחלקים המתקדמים אינם שלמים. אנו פועלים להשלים את כל התוכן. [מעקב התקדמות →](workshop/README.md)

### חומרי סדנה אינטראקטיביים  
**למידה מקיפה מעשית באמצעות כלים בדפדפן ותמרוני הדרכה**

חומרי הסדנה מספקים חוויית למידה אינטראקטיבית ומובנית המשלימה את תוכנית הפרקים הנ"ל. הסדנה מתוכננת ללמידה בקצב עצמי ולמפגשים בהנחיית מדריך.

#### 🛠️ מאפייני הסדנה
- **ממשק מבוסס דפדפן**: סדנה מלאה המופעלת באמצעות MkDocs עם חיפוש, העתקה ותמיכה בערכות נושא  
- **אינטגרציה עם GitHub Codespaces**: הקמת סביבת פיתוח בלחיצה אחת  
- **נתיב למידה מסודר**: 8 מודולים עם תרגילים מודרכים (3-4 שעות סה"כ)  
- **מתודולוגיה מדורגת**: מבוא → בחירה → אימות → ניתוח → תצורה → התאמה אישית → ניקוי → סיכום  
- **סביבת DevContainer אינטראקטיבית**: כלים ותלויות שהוגדרו מראש

#### 📚 מבנה מודולי הסדנה  
הסדנה עוקבת אחרי **מתודולוגיה מתקדמת בת 8 מודולים** שמובילה אותך מגילוי לשליטה בפריסה:

| מודול | נושא | מה תעשה | משך זמן |
|--------|-------|-------------|----------|
| **0. מבוא** | סקירת הסדנה | הבנת מטרות הלמידה, דרישות מוקדמות ומבנה הסדנה | 15 דק' |
| **1. בחירה** | גילוי תבניות | חקר תבניות AZD ובחירת תבנית AI מתאימה לתרחיש שלך | 20 דק' |
| **2. אימות** | פריסה ואימות | פריסת התבנית עם `azd up` ואימות תפקוד התשתית | 30 דק' |
| **3. ניתוח** | הבנת מבנה | שימוש ב-GitHub Copilot לחקירת ארכיטקטורת התבנית, קבצי Bicep וארגון קוד | 30 דק' |
| **4. תצורה** | למידה מעמיקה ב-azure.yaml | שליטה ב-`azure.yaml`, התקני lifecycle ומשתני סביבה | 30 דק' |
| **5. התאמה אישית** | עשייתו שלך | הפעלת AI Search, מעקב, הערכה והתאמה לתרחיש שלך | 45 דק' |
| **6. ניקוי** | ניקוי משאבים | הסרת משאבים בבטחה באמצעות `azd down --purge` | 15 דק' |
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
# אפשרות 1: GitHub Codespaces (מומלץ)
# לחץ על "Code" → "Create codespace on main" במחסן

# אפשרות 2: פיתוח מקומי
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# עקוב אחרי הוראות ההתקנה ב-workshop/README.md
```
  
#### 🎯 תוצאות למידה בסדנה  
בסיום הסדנה, המשתתפים יוכלו:  
- **לפרוס יישומי AI ייצור**: שימוש ב-AZD עם שירותי Microsoft Foundry  
- **לשלוט בארכיטקטורת סוכנים מרובי-סוכנים**: יישום פתרונות סוכני AI מתואמים  
- **ליישם הנחיות אבטחה מיטביות**: תצורת אימות ובקרת גישה  
- **לאופטם לפרמטר וסקייל**: עיצוב פריסות חסכוניות וביצועיות  
- **לאבחן תקלות בפריסה**: פתרון בעיות נפוצות באופן עצמאי

#### 📖 משאבי הסדנה  
- **🎥 מדריך אינטראקטיבי**: [חומרי הסדנה](workshop/README.md) - סביבת למידה מבוססת דפדפן  
- **📋 הוראות פרטניות לפי מודול**:  
  - [0. מבוא](workshop/docs/instructions/0-Introduction.md) - סקירת הסדנה ומטרות  
  - [1. בחירה](workshop/docs/instructions/1-Select-AI-Template.md) - מצא ובחר תבניות AI  
  - [2. אימות](workshop/docs/instructions/2-Validate-AI-Template.md) - פריסה ואימות תבניות  
  - [3. ניתוח](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - חקר ארכיטקטורת התבנית  
  - [4. תצורה](workshop/docs/instructions/4-Configure-AI-Template.md) - שליטה ב-azure.yaml  
  - [5. התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) - התאמה לתרחיש שלך  
  - [6. ניקוי](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ניקוי משאבים  
  - [7. סיכום](workshop/docs/instructions/7-Wrap-up.md) - סיכום וצעדים הבאים  
- **🛠️ מעבדת סדנת AI**: [מעבדת סדנת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - תרגילים ממוקדי AI  
- **💡 התחלה מהירה**: [מדריך הקמה מהירה לסדנה](workshop/README.md#quick-start) - תצורת הסביבה

**מיועד ל**: הדרכות ארגוניות, קורסים אקדמיים, למידה עצמאית, וקורסי מפתחים.

---

## 📖 העמקה: יכולות AZD

מעבר ליסודות, AZD מספקת תכונות עוצמתיות לפריסות ייצור:

- **פריסות מבוססות תבניות** - שימוש בתבניות מוכנות לדפוסי יישומים נפוצים  
- **תשתית כקוד** - ניהול משאבי Azure באמצעות Bicep או Terraform   
- **זרימות עבודה משולבות** - פריסה, אספקה וניטור אוטומטיים ואינטגרטיביים  
- **מותאם למפתחים** - אופטימיזציה לפיתוח ולקוח משתמש

### **AZD + Microsoft Foundry: מצוין לפריסות AI**

**מדוע AZD לפתרונות AI?** AZD מטפל באתגרים המובילים של מפתחי AI:

- **תבניות מוכנות ל-AI** - תבניות מקונפגות מראש לדגמי Microsoft Foundry, שירותי קוגניציה, וטעינות ML  
- **פריסות AI מאובטחות** - תבניות אבטחה מובנות לשירותי AI, מפתחות API, ונקודות קצה של דגמים  
- **תבניות AI לייצור** - הנחיות מיטביות לפריסות AI ניתנות להרחבה וחסכוניות  
- **זרימות עבודה מקצה לקצה ל-AI** - מפיתוח מודל ועד פריסה עם ניטור נכון  
- **אופטימיזציה לעלויות** - ניהול משאבים חכם ואסטרטגיות סקיילינג לעומסי AI  
- **אינטגרציה עם Microsoft Foundry** - חיבור חלק ללוח דגמי Foundry ונקודות הקצה שלהם

---

## 🎯 ספרייה לתבניות ודוגמאות

### מובחר: תבניות Microsoft Foundry  
**התחל כאן אם אתה מפרסם יישומי AI!**

> **הערה:** תבניות אלו מדגימות דפוסי AI שונים. חלקן דוגמאות Azure חיצוניות, אחרות יישומים מקומיים.

| תבנית | פרק | מורכבות | שירותים | סוג |
|----------|---------|------------|----------|------|
| [**התחלה עם צ'אט AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | חיצוני |
| [**התחלה עם סוכני AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | פרק 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| חיצוני |
| [**הדגמת Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | חיצוני |
| [**מהיר התחלה לאפליקציית צ'אט OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | חיצוני |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | חיצוני |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | חיצוני |
| [**פתרון Multi-Agent קמעונאי**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **מקומי** |

### מובחר: תרחישי למידה שלמים  
**תבניות יישומים מוכנות לייצור, ממפות לפרקי למידה**

| תבנית | פרק למידה | מורכבות | נקודת למידה מרכזית |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | דוגמאות פריסה בסיסיות ל-AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | יישום RAG עם Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | פרק 4 | ⭐⭐ | אינטגרציית אינטיליגנציה למסמכים |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | מסגרת סוכנים וקריאת פונקציות |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐ | אורקסטרציית AI ארגונית |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | ארכיטקטורה מרובת סוכנים עם סוכני לקוח ומלאי |

### למידה לפי סוג דוגמה

> **📌 דוגמאות מקומיות מול חיצוניות:**  
> **דוגמאות מקומיות** (במאגר זה) = מוכנות לשימוש מיידי  
> **דוגמאות חיצוניות** (דוגמאות Azure) = משוכפלות ממאגרים מחוברים

#### דוגמאות מקומיות (מוכנות לשימוש)
- [**פתרון Multi-Agent קמעונאי**](examples/retail-scenario.md) - מימוש שלם מוכן לייצור עם תבניות ARM  
  - ארכיטקטורת Multi-agent (לקוח + מחסנים)  
  - ניטור והערכה מקיפים  
  - פריסה בלחיצה אחת באמצעות תבנית ARM

#### דוגמאות מקומיות - אפליקציות מכולה (פרקים 2-5)
**דוגמאות פריסת מכולות מקיפות במאגר זה:**  
- [**דוגמאות לאפליקציות מכולה**](examples/container-app/README.md) - מדריך שלם לפריסות ממכולות  
  - [API Flask בסיסי](../../examples/container-app/simple-flask-api) - REST API בסיסי עם סקייל לאפס  
  - [ארכיטקטורת מיקרוסרוויסים](../../examples/container-app/microservices) - פריסה של שירותים מרובי שירותים מוכנה לייצור  
  - דפוסי התחלה מהירה, ייצור, ופריסה מתקדמת  
  - הנחיות לניטור, אבטחה ואופטימיזציה של עלויות

#### דוגמאות חיצוניות - אפליקציות פשוטות (פרקים 1-2)
**שכפל אגירי דוגמאות Azure אלו כדי להתחיל:**  
- [אפליקציית ווב פשוטה - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - דפוסי פריסה בסיסיים  
- [אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - פריסת תוכן סטטי  
- [אפליקציית מכולה - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - פריסת REST API

#### דוגמאות חיצוניות - אינטגרציית מסד נתונים (פרקים 3-4)  
- [אפליקציית מסד נתונים - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - דפוסי חיבור למסד נתונים  
- [פונקציות + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - זרימות עבודה מבוססות Serverless

#### דוגמאות חיצוניות - דפוסים מתקדמים (פרקים 4-8)
- [מיקרוסרוויסים ב-Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - ארכיטקטורות רב-שירותיות  
- [עבודות אפליקציות מכולה](https://github.com/Azure-Samples/container-apps-jobs) - עיבוד ברקע  
- [צינור ML ארגוני](https://github.com/Azure-Samples/mlops-v2) - דפוסי ML מוכנים לייצור

### אוספי תבניות חיצוניים
- [**גלריית תבניות רשמית ל-AZD**](https://azure.github.io/awesome-azd/) - אוסף מסודר של תבניות רשמיות וקהילתיות  
- [**תיעוד תבניות Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - תיעוד תבניות ב-Microsoft Learn  
- [**ספריית דוגמאות**](examples/README.md) - דוגמאות למידה מקומיות עם הסברים מפורטים

---

## 📚 משאבי למידה ומקורות

### הפניות מהירות
- [**גליון פקודות**](resources/cheat-sheet.md) - פקודות azd מרכזיות מסודרות לפי פרק  
- [**מילון מונחים**](resources/glossary.md) - מונחי Azure ו-azd  
- [**שאלות נפוצות**](resources/faq.md) - שאלות נפוצות מסודרות לפי פרק למידה  
- [**מדריך לתרגול**](resources/study-guide.md) - תרגילים מקיפים

### סדנאות מעשיות
- [**מעבדת סדנת AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפוך את פתרונות ה-AI שלך לפריסות AZD (שעתיים-שלוש)  
- [**סדנה אינטראקטיבית**](workshop/README.md) - תרגילים מודרכים ב-8 מודולים עם MkDocs ו-GitHub Codespaces  
  - הרצף: מבוא → בחירה → אימות → ניתוח → תצורה → התאמה → ניקוי → סיכום

### משאבי למידה חיצוניים
- [תיעוד ממשק השורת פקודה למפתחי Azure](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מחשבון התמחור של Azure](https://azure.microsoft.com/pricing/calculator/)
- [סטטוס Azure](https://status.azure.com/)

### מיומנויות סוכני AI לעורך שלך
- [**מיומנויות Microsoft Azure ב-skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 מיומנויות סוכן פתוחות ל-Azure AI, Foundry, פריסה, דיאגנוסטיקה, אופטימיזציית עלויות ועוד. התקן אותן ב-GitHub Copilot, Cursor, Claude Code או כל סוכן נתמך אחר:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 מדריך פתרון בעיות מהיר

**בעיות נפוצות שמתחילים נתקלים בהן ופתרונות מיידיים:**

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
<summary><strong>❌ "לא נמצאה מנוי" או "המנוי לא מוגדר"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" או "חריגת מיכסה"</strong></summary>

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
<summary><strong>❌ "אימות נכשל" או "טוקן שפג תוקפו"</strong></summary>

```bash
# לאמת מחדש
az logout
az login

azd auth logout
azd auth login

# לאשר את האימות
az account show
```
</details>

<details>
<summary><strong>❌ "המשאב כבר קיים" או התנגשויות שם</strong></summary>

```bash
# AZD מייצר שמות ייחודיים, אבל אם יש התנגשות:
azd down --force --purge

# אז נסה שוב עם סביבה חדשה
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ פריסת תבנית לוקחת יותר מדי זמן</strong></summary>

**זמני המתנה רגילים:**
- אפליקציית ווב פשוטה: 5-10 דקות
- אפליקציה עם מסד נתונים: 10-15 דקות
- יישומי AI: 15-25 דקות (פריסת OpenAI איטית)

```bash
# בדוק התקדמות
azd show

# אם תקוע יותר מ-30 דקות, בדוק את פורטל Azure:
azd monitor
# חפש פריסות שנכשלו
```
</details>

<details>
<summary><strong>❌ "הרשאה נדחתה" או "אסור"</strong></summary>

```bash
# בדוק את התפקיד שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# אתה צריך לפחות תפקיד "שותף"
# בקש מהמנהל שלך ב-Azure להעניק:
# - שותף (למשאבים)
# - מנהל גישת משתמש (להקצאות תפקיד)
```
</details>

<details>
<summary><strong>❌ לא מצליחים למצוא את כתובת ה-URL של היישום שהורץ</strong></summary>

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
- **קבל עזרה:** [שרת דיסקורד Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 השלמת קורס ותעודה

### מעקב התקדמות
עקוב אחרי התקדמות הלמידה שלך בכל פרק:

- [ ] **פרק 1**: יסודות והתחלה מהירה ✅
- [ ] **פרק 2**: פיתוח מונחה AI ✅  
- [ ] **פרק 3**: הגדרות ואימות ✅
- [ ] **פרק 4**: תשתית כקוד ופריסה ✅
- [ ] **פרק 5**: פתרונות AI מבוססי סוכנים מרובים ✅
- [ ] **פרק 6**: תכנון ואימות לפני פריסה ✅
- [ ] **פרק 7**: פתרון תקלות וניפוי שגיאות ✅
- [ ] **פרק 8**: דפוסי ייצור וארגוניים ✅

### אימות הלמידה
לאחר השלמת כל פרק, אימת את הידע שלך באמצעות:
1. **תרגול מעשי**: השלמת פריסת הפרק
2. **מבחן בדיקת ידע**: עיין בחלק השאלות הנפוצות של הפרק
3. **דיון קהילתי**: שתף את ניסיונך בדיסקורד Azure
4. **המשך לפרק הבא**: עבור לרמת המורכבות הבאה

### יתרונות השלמת הקורס
בסיום כל הפרקים, יהיו לך:
- **ניסיון ייצור**: פריסת יישומי AI אמיתיים ל-Azure
- **מיומנויות מקצועיות**: יכולות פריסה ברמה ארגונית  
- **הכרה קהילתית**: חבר פעיל בקהילת מפתחי Azure
- **קידום קריירה**: מומחיות מבוקשת ב-AZD ופריסת AI

---

## 🤝 קהילה ותמיכה

### קבלת עזרה ותמיכה
- **בעיות טכניות**: [דווח על באגים ובקש תכונות](https://github.com/microsoft/azd-for-beginners/issues)
- **שאלות למידה**: [קהילת דיסקורד Microsoft Azure](https://discord.gg/microsoft-azure) ו-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **עזרה ספציפית ל-AI**: הצטרף ל-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **תיעוד**: [תיעוד רשמי של ממשק שורת הפקודה למפתחי Azure](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### תובנות מהקהילה ב-Microsoft Foundry Discord

**תוצאות סקר אחרון מערוץ #Azure:**
- **45%** מהמפתחים רוצים להשתמש ב-AZD לעומסי AI
- **אתגרים עיקריים**: פריסות מרובות שירותים, ניהול הרשאות, מוכנות לייצור  
- **הנפוצים ביותר**: תבניות ספציפיות ל-AI, מדריכי פתרון בעיות, שיטות עבודה מומלצות

**הצטרפו לקהילה שלנו כדי:**
- לשתף את חוויות AZD + AI ולקבל עזרה
- לקבל גישה מוקדמת לתבניות AI חדשות
- לתרום לשיטות העבודה הטובות ביותר לפריסת AI
- להשפיע על פיתוח עתידי של תכונות AI + AZD

### תרומה לקורס
אנחנו מקבלים בברכה תרומות! קרא את [מדריך התרומה](CONTRIBUTING.md) לפרטים על:
- **שיפור תוכן**: שדרוג פרקים ודוגמאות קיימות
- **דוגמאות חדשות**: הוסף תרחישים אמיתיים ותבניות  
- **תרגום**: עזור לתחזק תמיכה בריבוי שפות
- **דיווחי באגים**: שפר דיוק ובהירות
- **סטנדרטים קהילתיים**: פעל לפי קווי ההנחיה הכלליים שלנו

---

## 📄 מידע על הקורס

### רישיון
פרויקט זה מורשה תחת רישיון MIT - ראה את הקובץ [LICENSE](../../LICENSE) לפרטים.

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
 
### סדרת AI מחולל
[![AI מחולל למתחילים](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI מחולל (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI מחולל (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI מחולל (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### למידה בסיסית
[![ML למתחילים](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![מדעי הנתונים למתחילים](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI למתחילים](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![סייברסקיוריטי למתחילים](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
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

**🚀 מוכן להתחיל ללמוד?**

**מתחילים**: התחל עם [פרק 1: יסודות והתחלה מהירה](#-chapter-1-foundation--quick-start)  
**מפתחי בינה מלאכותית**: קפוץ אל [פרק 2: פיתוח מונחה AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**מפתחים מנוסים**: התחל עם [פרק 3: תצורה ואימות](#️-chapter-3-configuration--authentication)

**שלבים הבאים**: [התחל פרק 1 - יסודות AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**הצהרת שחרור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתירגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפתו הטבעית צריך להיחשב כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי אנושי. אנו לא אחראים לכל אי-הבנות או פרשנויות שגויות הנובעות מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->