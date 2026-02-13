# AZD למתחילים: מסלול לימוד מובנה

![AZD-for-beginners](../../translated_images/he/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### תרגומים אוטומטיים (תמיד מעודכנים)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[ערבית](../ar/README.md) | [בנגלית](../bn/README.md) | [בולגרית](../bg/README.md) | [בורמזית (מיאנמר)](../my/README.md) | [סינית (מפושטת)](../zh-CN/README.md) | [סינית (מסורתית, הונג קונג)](../zh-HK/README.md) | [סינית (מסורתית, מקאו)](../zh-MO/README.md) | [סינית (מסורתית, טאיוואן)](../zh-TW/README.md) | [קרואטית](../hr/README.md) | [צ’כית](../cs/README.md) | [דנית](../da/README.md) | [הולנדית](../nl/README.md) | [אסטונית](../et/README.md) | [פינית](../fi/README.md) | [צרפתית](../fr/README.md) | [גרמנית](../de/README.md) | [יוונית](../el/README.md) | [עברית](./README.md) | [הודית](../hi/README.md) | [הונגרית](../hu/README.md) | [אינדונזית](../id/README.md) | [איטלקית](../it/README.md) | [יפנית](../ja/README.md) | [קנדה](../kn/README.md) | [קוריאנית](../ko/README.md) | [ליטאית](../lt/README.md) | [מלזית](../ms/README.md) | [מליאלאם](../ml/README.md) | [מרהטית](../mr/README.md) | [נפאלית](../ne/README.md) | [פידג’ין ניגרי](../pcm/README.md) | [נורווגית](../no/README.md) | [פרסית (פרסי)](../fa/README.md) | [פולנית](../pl/README.md) | [פורטוגזית (ברזיל)](../pt-BR/README.md) | [פורטוגזית (פורטוגל)](../pt-PT/README.md) | [פנג’אבי (גורמוקי)](../pa/README.md) | [רומנית](../ro/README.md) | [רוסית](../ru/README.md) | [סרבית (קירילית)](../sr/README.md) | [סלובקית](../sk/README.md) | [סלובנית](../sl/README.md) | [ספרדית](../es/README.md) | [סווהילית](../sw/README.md) | [שוודית](../sv/README.md) | [טגלוג (פיליפינית)](../tl/README.md) | [טמילית](../ta/README.md) | [טלוגו](../te/README.md) | [תאית](../th/README.md) | [טורקית](../tr/README.md) | [אוקראינית](../uk/README.md) | [אורדו](../ur/README.md) | [ויטנאמית](../vi/README.md)

> **מעדיפים לשכפל מקומית?**
>
> מאגר זה כולל מעל 50 תרגומים של שפות שמגדילים משמעותית את גודל ההורדה. כדי לשכפל ללא תרגומים, השתמשו בבדיקת sparse checkout:
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
> זה נותן לכם את כל מה שצריך כדי להשלים את הקורס במהירות הורדה גבוהה בהרבה.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 מה זה Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** הוא כלי שורת פקודה ידידותי למפתחים שמפשט פריסת אפליקציות ב-Azure. במקום ליצור ולחבר עשרות משאבים ב-Azure באופן ידני, ניתן לפרוס אפליקציות שלמות בפקודה אחת.

### הקסם של `azd up`

```bash
# הפקודה הבודדת הזו עושה הכל:
# ✅ יוצר את כל המשאבים ב-Azure
# ✅ מגדיר רשת ואבטחה
# ✅ בונה את קוד היישום שלך
# ✅ מבצע פריסה ב-Azure
# ✅ מספק לך כתובת URL עובדת
azd up
```

**וזהו!** ללא לחיצות ב-Azure Portal, ללא צורך בלימוד תבניות ARM מסובכות, ללא קונפיגורציה ידנית - רק אפליקציות עובדות ב-Azure.

---

## ❓ Azure Developer CLI מול Azure CLI: מה ההבדל?

זו השאלה הנפוצה ביותר שמתחילים שואלים. הנה התשובה הפשוטה:

| תכונה | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **מטרה** | ניהול משאבים בודדים ב-Azure | פריסת אפליקציות שלמות |
| **גישה** | התמקדות בתשתית | התמקדות באפליקציה |
| **דוגמה** | `az webapp create --name myapp...` | `azd up` |
| **עקומת למידה** | צריך להכיר שירותי Azure | רק להכיר את האפליקציה |
| **מומלץ עבור** | DevOps, תשתיות | מפתחים, אב טיפוס |

### הדמיה פשוטה

- **Azure CLI** כמו שיש לך את כל הכלים לבניית בית - פטישים, מסורים, מסמרים. אתה יכול לבנות כל דבר, אבל צריך לדעת בנייה.
- **Azure Developer CLI** כמו לשכור קבלן - אתה מתאר מה אתה רוצה, והוא מטפל בבנייה.

### מתי משתמשים בכל אחד

| מצב | השתמש ב- |
|----------|----------|
| "אני רוצה לפרוס את אפליקציית הרשת שלי מהר" | `azd up` |
| "אני צריך ליצור חשבון אחסון בלבד" | `az storage account create` |
| "אני בונה אפליקציית AI מלאה" | `azd init --template azure-search-openai-demo` |
| "אני צריך לדבג משאב Azure מסוים" | `az resource show` |
| "אני רוצה פריסה מוכנה לייצור תוך דקות" | `azd up --environment production` |

### הם עובדים יחד!

AZD משתמש ב-Azure CLI ביסודו. אפשר להשתמש בשניהם:
```bash
# פרוס את האפליקציה שלך עם AZD
azd up

# לאחר מכן כוונן משאבים ספציפיים באמצעות Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 מצאו תבניות ב-Awesome AZD

אל תתחילו מאפס! **Awesome AZD** הוא אוסף קהילתי של תבניות מוכנות לפריסה:

| משאב | תיאור |
|----------|-------------|
| 🔗 [**גלריית Awesome AZD**](https://azure.github.io/awesome-azd/) | דפדפו בין 200+ תבניות עם פריסה בלחיצה אחת |
| 🔗 [**שלחו תבנית**](https://github.com/Azure/awesome-azd/issues) | תרמו תבנית משלכם לקהילה |
| 🔗 [**מאגר GitHub**](https://github.com/Azure/awesome-azd) | סמנו בכוכב וחקור את המקור |

### תבניות AI פופולריות מ-Awesome AZD

```bash
# צ'אט RAG עם Azure OpenAI + חיפוש בינה מלאכותית
azd init --template azure-search-openai-demo

# יישום צ'אט בינה מלאכותית מהיר
azd init --template openai-chat-app-quickstart

# סוכני בינה מלאכותית עם Foundry Agents
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

### שלב 3: פרסמו את האפליקציה הראשונה שלכם

```bash
# אתחול מתוך תבנית
azd init --template todo-nodejs-mongo

# פריסה ל-Azure (יוצר הכל!)
azd up
```

**🎉 וזהו!** האפליקציה שלכם חיה עכשיו ב-Azure.

### ניקוי (אל תשכחו!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 איך להשתמש בקורס הזה

קורס זה מיועד ללמידה **הדרגתית** – התחילו מהנקודה הנוחה לכם ותתקדמו:

| הניסיון שלכם | התחילו כאן |
|-----------------|------------|
| **חדש לגמרי ב-Azure** | [פרק 1: היסודות](../..) |
| **מכיר Azure, חדש ב-AZD** | [פרק 1: היסודות](../..) |
| **רוצה לפרוס אפליקציות AI** | [פרק 2: פיתוח AI ראשוני](../..) |
| **רוצה התנסות מעשית** | [🎓 סדנה אינטראקטיבית](workshop/README.md) - מעבדה מודרכת של 3-4 שעות |
| **צריך דפוסי ייצור** | [פרק 8: ייצור ותבניות ארגוניות](../..) |

### הגדרה מהירה

1. **עשו Fork למאגר**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **שכפלו אותו**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **קבלו עזרה**: [קהילת Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **מעדיפים לשכפל מקומית?**

> מאגר זה כולל מעל 50 תרגומים של שפות שמגדילים משמעותית את גודל ההורדה. כדי לשכפל ללא תרגומים, השתמשו בבדיקת sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> זה נותן לכם את כל מה שצריך כדי להשלים את הקורס במהירות הורדה גבוהה בהרבה.


## סקירת הקורס

שלוטו ב-Azure Developer CLI (azd) דרך פרקים מובנים שנועדו ללמידה הדרגתית. **התמקדות מיוחדת בפריסת אפליקציות AI עם אינטגרציה ל-Microsoft Foundry.**

### למה הקורס הזה חיוני למפתחים מודרניים

בהסתמך על תובנות מקהילת Microsoft Foundry Discord, **45% מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI** אך נתקלים באתגרים ב:
- ארכיטקטורות AI מורכבות עם שירותים מרובים
- שיטות הטובות ביותר לפריסת AI בייצור  
- אינטגרציה וקונפיגורציה של שירותי Azure AI
- אופטימיזציה של עלויות לעומסי AI
- פתרון תקלות בפריסות AI ספציפיות

### יעדי למידה

בסיום הקורס המובנה הזה, תוכלו:
- **לשלוט ביסודות AZD**: מושגים מרכזיים, התקנה וקונפיגורציה
- **לפרוס אפליקציות AI**: שימוש ב-AZD עם שירותי Microsoft Foundry
- **להטמיע Infrastructure as Code**: ניהול משאבי Azure בתבניות Bicep
- **לטפל בבעיות פריסה**: פתרון תקלות נפוצות ודיבוג
- **לאופטם לייצור**: אבטחה, הרחבה, ניטור וניהול עלויות
- **לבנות פתרונות מולטי-אייג’נט**: פריסת ארכיטקטורות AI מורכבות

## 🗺️ מפת הקורס: ניווט מהיר לפי פרק

לכל פרק README ייעודי עם יעדי למידה, התחלות מהירות ותרגילים:

| פרק | נושא | שיעורים | משך | מורכבות |
|---------|-------|---------|----------|------------|
| **[פרק 1: יסודות](docs/chapter-01-foundation/README.md)** | התחלה | [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [התקנה](docs/chapter-01-foundation/installation.md) &#124; [פרויקט ראשון](docs/chapter-01-foundation/first-project.md) | 30-45 דקות | ⭐ |
| **[פרק 2: פיתוח AI](docs/chapter-02-ai-development/README.md)** | אפליקציות AI ראשוניות | [אינטגרציית Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [סוכני AI](docs/chapter-02-ai-development/agents.md) &#124; [פריסת מודל](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [סדנא](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 שעות | ⭐⭐ |
| **[פרק 3: קונפיגורציה](docs/chapter-03-configuration/README.md)** | אימות ואבטחה | [קונפיגורציה](docs/chapter-03-configuration/configuration.md) &#124; [אימות ואבטחה](docs/chapter-03-configuration/authsecurity.md) | 45-60 דקות | ⭐⭐ |
| **[פרק 4: תשתית](docs/chapter-04-infrastructure/README.md)** | IaC ופריסה | [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [הקצאה](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 שעות | ⭐⭐⭐ |
| **[פרק 5: סוכנים מרובים](docs/chapter-05-multi-agent/README.md)** | פתרונות סוכני AI | [תרחיש קמעונאי](examples/retail-scenario.md) &#124; [תבניות תיאום](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[פרק 6: לפני פריסה](docs/chapter-06-pre-deployment/README.md)** | תכנון ואימות | [בדיקות טרום טיסה](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [תובנות אפליקציה](docs/chapter-06-pre-deployment/application-insights.md) | שעה | ⭐⭐ |
| **[פרק 7: פתרון בעיות](docs/chapter-07-troubleshooting/README.md)** | איתור ותיקון | [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) &#124; [איתור באגים](docs/chapter-07-troubleshooting/debugging.md) &#124; [בעיות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 שעות | ⭐⭐ |
| **[פרק 8: ייצור](docs/chapter-08-production/README.md)** | תבניות ארגוניות | [פרקטיקות ייצור](docs/chapter-08-production/production-ai-practices.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[🎓 סדנה](workshop/README.md)** | מעבדה מעשית | [הקדמה](workshop/docs/instructions/0-Introduction.md) &#124; [בחירה](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [אימות](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [הגדרות](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [פירוק תשתית](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [סיכום](workshop/docs/instructions/7-Wrap-up.md) | 3-4 שעות | ⭐⭐ |

**משך כולל של הקורס:** ~10-14 שעות | **התקדמות מקצועית:** מתחיל → מוכן לייצור

---

## 📚 פרקים ללמידה

*בחר את מסלול הלמידה שלך בהתאם לרמת הניסיון והמטרות*

### 🚀 פרק 1: יסודות והתחלה מהירה
**דרישות מוקדמות**: מנוי Azure, ידע בסיסי בשורת הפקודה  
**משך**: 30-45 דקות  
**רמת קושי**: ⭐

#### מה תלמד
- הבנת יסודות Azure Developer CLI
- התקנת AZD על הפלטפורמה שלך
- הפריסה המוצלחת הראשונה שלך

#### מקורות ללמידה
- **🎯 התחל כאן**: [מה זה Azure Developer CLI?](../..)
- **📖 תיאוריה**: [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) - מושגים וטכניקות בסיסיות
- **⚙️ התקנה**: [התקנה והגדרות](docs/chapter-01-foundation/installation.md) - מדריכים לפי פלטפורמה
- **🛠️ מעשי**: [הפרויקט הראשון שלך](docs/chapter-01-foundation/first-project.md) - הדרכה שלב-אחר-שלב
- **📋 הפניה מהירה**: [דף פקודות](resources/cheat-sheet.md)

#### תרגילים מעשיים
```bash
# בדיקה מהירה של ההתקנה
azd version

# פרוס את היישום הראשון שלך
azd init --template todo-nodejs-mongo
azd up
```

**💡 תוצאת הפרק**: פריסה מוצלחת של אפליקציית ווב פשוטה לאזור Azure באמצעות AZD

**✅ אימות הצלחה:**  
```bash
# לאחר השלמת פרק 1, אתה אמור להיות מסוגל ל:
azd version              # מציג את הגרסה המותקנת
azd init --template todo-nodejs-mongo  # מאותחל את הפרויקט
azd up                  # מפרסם ל-Azure
azd show                # מציג את כתובת האפליקציה הפועלת
# האפליקציה נפתחת בדפדפן ופועלת
azd down --force --purge  # מנקה משאבים
```
  
**📊 השקעת זמן:** 30-45 דקות  
**📈 רמת מיומנות לאחר:** יכול לפרוס אפליקציות בסיסיות באופן עצמאי

**✅ אימות הצלחה:**  
```bash
# לאחר השלמת פרק 1, יהיה עליך להיות מסוגל:
azd version              # מציג את הגרסה המותקנת
azd init --template todo-nodejs-mongo  # מאתחל פרויקט
azd up                  # מפרסם ל-Azure
azd show                # מציג את כתובת ה-URL של האפליקציה הפועלת
# האפליקציה נפתחת בדפדפן ופועלת
azd down --force --purge  # מנקה משאבים
```
  
**📊 השקעת זמן:** 30-45 דקות  
**📈 רמת מיומנות לאחר:** יכול לפרוס אפליקציות בסיסיות באופן עצמאי

---

### 🤖 פרק 2: פיתוח AI-ראשוני (מומלץ למפתחי AI)  
**דרישות מוקדמות**: פרק 1 הושלם  
**משך**: 1-2 שעות  
**רמת קושי**: ⭐⭐

#### מה תלמד
- אינטגרציה עם Microsoft Foundry ו-AZD  
- פריסת אפליקציות מונחות AI  
- הבנת הגדרות שירותי AI

#### מקורות ללמידה
- **🎯 התחל כאן**: [אינטגרציה עם Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 סוכני AI**: [מדריך סוכני AI](docs/chapter-02-ai-development/agents.md) - פריסת סוכנים חכמים עם AZD  
- **📖 תבניות**: [פריסת מודל AI](docs/chapter-02-ai-development/ai-model-deployment.md) - ניהול מודלים  
- **🛠️ סדנה**: [מעבדת סדנת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפוך את הפתרונות ל-AZD מוכנים  
- **🎥 מדריך אינטראקטיבי**: [חומרי סדנה](workshop/README.md) - למידה בדפדפן עם MkDocs * סביבה DevContainer  
- **📋 תבניות**: [תבניות Microsoft Foundry](../..)  
- **📝 דוגמאות**: [דוגמאות פריסה AZD](examples/README.md)

#### תרגילים מעשיים
```bash
# פרוס את יישום הבינה המלאכותית הראשון שלך
azd init --template azure-search-openai-demo
azd up

# נסה תבניות בינה מלאכותית נוספות
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 תוצאת הפרק**: פריסה והגדרה של אפליקציית צ׳אט מונחית AI עם יכולות RAG

**✅ אימות הצלחה:**  
```bash
# לאחר פרק 2, תוכל ל:
azd init --template azure-search-openai-demo
azd up
# לבדוק את ממשק הצ'אט של ה-AI
# לשאול שאלות ולקבל תגובות מונחות AI עם מקורות
# לוודא שילוב החיפוש עובד
azd monitor  # לבדוק ש-Application Insights מציג טלמטריה
azd down --force --purge
```
  
**📊 השקעת זמן:** 1-2 שעות  
**📈 רמת מיומנות לאחר:** יכול לפרוס ולהגדיר אפליקציות AI מוכנות לייצור  
**💰 מודעות לעלויות:** הבנת עלויות פיתוח $80-150/חודש, עלויות ייצור $300-3500/חודש

#### 💰 שיקולי עלויות לפריסות AI

**סביבת פיתוח (אומדן $80-150/חודש):**  
- Azure OpenAI (תשלום לפי שימוש): $0-50/חודש (בהתאם לשימוש בטוקנים)  
- AI Search (רמת בסיס): $75/חודש  
- Container Apps (צריכה): $0-20/חודש  
- אחסון (סטנדרט): $1-5/חודש  

**סביבת ייצור (אומדן $300-3,500+/חודש):**  
- Azure OpenAI (PTU לביצועים עקביים): $3,000+/חודש או תשלום לפי שימוש בנפח גבוה  
- AI Search (רמת סטנדרט): $250/חודש  
- Container Apps (ייעודי): $50-100/חודש  
- Application Insights: $5-50/חודש  
- אחסון (פרימיום): $10-50/חודש  

**💡 טיפים לאופטימיזציה בעלויות:**  
- השתמש ב-**רמת חינם** ב-Azure OpenAI ללמידה (כולל 50,000 טוקנים לחודש)  
- הרץ `azd down` כדי לפנות משאבים כשלא מפתחים  
- התחל בחיוב לפי צריכה, שדרג ל-PTU רק לייצור  
- השתמש ב-`azd provision --preview` להערכת עלויות לפני פריסה  
- אפשר אוטומציה להתאמת קנה מידה: שלם רק על השימוש בפועל

**ניטור עלויות:**  
```bash
# בדוק עלויות חודשיות מוערכות
azd provision --preview

# פקח על עלויות בפועל בפורטל Azure
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ פרק 3: הגדרה ואימות זהות  
**דרישות מוקדמות**: פרק 1 הושלם  
**משך**: 45-60 דקות  
**רמת קושי**: ⭐⭐

#### מה תלמד
- ניהול והגדרת סביבות  
- אימות וביטחון מיטביים  
- שמות ומשאבים

#### מקורות ללמידה
- **📖 הגדרה**: [מדריך הגדרות](docs/chapter-03-configuration/configuration.md) - הגדרת סביבה  
- **🔐 אבטחה**: [דפוסי אימות וזהות מנוהלת](docs/chapter-03-configuration/authsecurity.md)  
- **📝 דוגמאות**: [דוגמת אפליקציית Database](examples/database-app/README.md)

#### תרגילים מעשיים
- הגדרת סביבות מרובות (פיתוח, בדיקה, ייצור)  
- הקמת אימות עם זהות מנוהלת  
- הגדרה ספציפית לפי סביבה

**💡 תוצאת הפרק**: ניהול סביבות מרובות עם אימות ואבטחה נכונים

---

### 🏗️ פרק 4: תשתית כקוד ופריסה  
**דרישות מוקדמות**: פרקים 1-3 הושלמו  
**משך**: 1-1.5 שעות  
**רמת קושי**: ⭐⭐⭐

#### מה תלמד
- דפוסי פריסה מתקדמים  
- תשתית כקוד באמצעות Bicep  
- אסטרטגיות הקצאת משאבים

#### מקורות ללמידה
- **📖 פריסה**: [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) - זרימות עבודה מלאות  
- **🏗️ הקצאה**: [הקצאת משאבים](docs/chapter-04-infrastructure/provisioning.md) - ניהול משאבים ב-Azure  
- **📝 דוגמאות**: [דוגמת Container App](../../examples/container-app)

#### תרגילים מעשיים
- יצירת תבניות Bicep מותאמות  
- פריסה של אפליקציות רב-שירותיות  
- יישום אסטרטגיות פריסה כחול-ירוק

**💡 תוצאת הפרק**: פריסת אפליקציות רב-שירותיות מורכבות עם תבניות תשתית מותאמות

---

### 🎯 פרק 5: פתרונות AI עם סוכנים מרובים (מתקדם)  
**דרישות מוקדמות**: פרקים 1-2 הושלמו  
**משך**: 2-3 שעות  
**רמת קושי**: ⭐⭐⭐⭐

#### מה תלמד
- דפוסי ארכיטקטורת סוכנים מרובים  
- תיאום ואורקסטרציה של סוכנים  
- פריסות AI מוכנות לייצור

#### מקורות ללמידה
- **🤖 פרויקט מומלץ**: [פתרון סוכנים מרובים קמעונאי](examples/retail-scenario.md) - יישום מלא  
- **🛠️ ARM Templates**: [חבילת תבניות ARM](../../examples/retail-multiagent-arm-template) - פריסה בלחיצה אחת  
- **📖 ארכיטקטורה**: [דפוסי תיאום סוכנים מרובים](docs/chapter-06-pre-deployment/coordination-patterns.md)

#### תרגילים מעשיים  
```bash
# השקת פתרון רב-סוכנים מלא בקמעונאות
cd examples/retail-multiagent-arm-template
./deploy.sh

# חקור תצורות סוכן
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 תוצאת הפרק**: פריסה וניהול פתרון AI סוכנים מרובים מוכן לייצור עם סוכני לקוחות ומלאי

---

### 🔍 פרק 6: אימות ותכנון לפני פריסה  
**דרישות מוקדמות**: פרק 4 הושלם  
**משך**: שעה  
**רמת קושי**: ⭐⭐

#### מה תלמד
- תכנון קיבולת ואימות משאבים  
- אסטרטגיות בחירת SKU  
- בדיקות טרום טיסה ואוטומציה

#### מקורות ללמידה
- **📊 תכנון**: [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) - אימות משאבים  
- **💰 בחירה**: [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) - בחירות חסכוניות  
- **✅ אימות**: [בדיקות טרום טיסה](docs/chapter-06-pre-deployment/preflight-checks.md) - סקריפטים אוטומטיים

#### תרגילים מעשיים
- הרצת סקריפטים לאימות קיבולת  
- אופטימיזציה של בחירות SKU לחיסכון  
- יישום בדיקות אוטומטיות טרום פריסה

**💡 תוצאת הפרק**: אימות ואופטימיזציה של הפריסות לפני ביצוע

---

### 🚨 פרק 7: פתרון בעיות ואיתור באגים  
**דרישות מוקדמות**: כל פרק פריסה שהושלם  
**משך**: 1-1.5 שעות  
**רמת קושי**: ⭐⭐

#### מה תלמד
- שיטות איתור באגים שיטתיות  
- בעיות נפוצות ופתרונות  
- פתרון בעיות ספציפיות ל-AI

#### מקורות ללמידה
- **🔧 בעיות נפוצות**: [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) - שאלות נפוצות ופתרונות  
- **🕵️ איתור באגים**: [מדריך איתור באגים](docs/chapter-07-troubleshooting/debugging.md) - אסטרטגיות שלב-אחר-שלב  
- **🤖 בעיות AI**: [איתור בעיות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - בעיות שירות AI

#### תרגילים מעשיים
- אבחון כשלים בפריסה  
- פתרון בעיות אימות  
- איתור באגים בחיבור לשירות AI

**💡 תוצאת הפרק**: יכולת לאבחן ולפתור בעיות פריסה נפוצות באופן עצמאי

---

### 🏢 פרק 8: ייצור ותבניות ארגוניות  
**דרישות מוקדמות**: פרקים 1-4 הושלמו  
**משך**: 2-3 שעות  
**רמת קושי**: ⭐⭐⭐⭐

#### מה תלמד
- אסטרטגיות פריסת ייצור  
- דפוסי אבטחה ארגוניים  
- ניטור ואופטימיזציה של עלויות

#### מקורות ללמידה
- **🏭 ייצור**: [פרקטיקות AI לייצור](docs/chapter-08-production/production-ai-practices.md) - דפוסים ארגוניים  
- **📝 דוגמאות**: [דוגמת מיקרוסרוויסים](../../examples/microservices) - ארכיטקטורות מורכבות  
- **📊 ניטור**: [אינטגרציית Application Insights](docs/chapter-06-pre-deployment/application-insights.md)

#### תרגילים מעשיים
- יישום דפוסי אבטחה ארגוניים  
- הקמת ניטור מקיף  
- פריסה לייצור עם ממשל הולם

**💡 תוצאת הפרק**: פריסת אפליקציות מוכנות ארגונית עם יכולות ייצור מלאות

---

## 🎓 סקירת הסדנה: חווית למידה מעשית

> **⚠️ מצב הסדנה: בפיתוח פעיל**  
> החומרים לסדנה נמצאים כעת בפיתוח ושיפור. מודולים מרכזיים פונקציונליים, אך חלק מהחלקים המתקדמים אינם שלמים. אנו עובדים באופן פעיל על השלמת כל התוכן. [למידע על ההתקדמות →](workshop/README.md)

### חומרים אינטראקטיביים לסדנה
**למידה מעשית מקיפה עם כלים מבוססי דפדפן ותרגילים מודרכים**

חומרי הסדנה שלנו מספקים חוויית למידה מובנית ואינטראקטיבית המשלים את תוכנית הלימודים המבוססת על פרקים לעיל. הסדנה מיועדת ללמידה בקצב עצמי ולמפגשים בהנחיית מדריך.

#### 🛠️ תכונות הסדנה
- **ממשק מבוסס דפדפן**: סדנת MkDocs מלאה עם חיפוש, העתקה ותכונות נושא
- **אינטגרציה עם GitHub Codespaces**: הקמת סביבת פיתוח בלחיצה אחת
- **נתיב למידה מובנה**: 8 מודולים עם תרגילים מודרכים (3-4 שעות בסך הכל)
- **שיטת עבודה הדרגתית**: הקדמה → בחירה → אימות → פירוק → הגדרה → התאמה אישית → פירוק → סיום
- **סביבת DevContainer אינטראקטיבית**: כלים ותלויות שהוגדרו מראש

#### 📚 מבנה מודולי הסדנה
הסדנה עוקבת אחרי **שיטה הדרגתית של 8 מודולים** שלוקחת אתכם מגילוי למיומנות פריסה:

| מודול | נושא | מה תעשו | משך |
|--------|-------|----------------|----------|
| **0. הקדמה** | סקירת הסדנה | הבנת מטרות הלמידה, דרישות מוקדמות ומבנה הסדנה | 15 דק' |
| **1. בחירה** | גילוי תבניות | חקר תבניות AZD ובחירת תבנית AI מתאימה לסצנה שלכם | 20 דק' |
| **2. אימות** | פריסה ואימות | פריסת התבנית עם `azd up` ואימות תפקוד התשתית | 30 דק' |
| **3. פירוק** | הבנת המבנה | שימוש ב-GitHub Copilot לחקר ארכיטקטורת התבנית, קבצי Bicep וארגון הקוד | 30 דק' |
| **4. הגדרה** | התבוננות ב-azure.yaml | שליטה בהגדרת `azure.yaml`, hooks למחזור חיים ומשתני סביבה | 30 דק' |
| **5. התאמה אישית** | הפוך את זה לשלך | הפעלת חיפוש AI, מעקב, הערכה והתאמה אישית לסצנה שלך | 45 דק' |
| **6. פירוק** | ניקוי | הסרה בטוחה של משאבים עם `azd down --purge` | 15 דק' |
| **7. סיכום** | שלבים הבאים | סקירת הישגים, מושגים מרכזיים והמשך מסע הלמידה שלך | 15 דק' |

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
# לחץ על "Code" → "צור codespace על main" במחסן

# אפשרות 2: פיתוח מקומי
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# עקוב אחר הוראות ההגדרה בקובץ workshop/README.md
```

#### 🎯 תוצאות למידה בסדנה
בסיום הסדנה, המשתתפים יוכלו:
- ** לפרוס יישומי AI לייצור**: להשתמש ב-AZD עם שירותי Microsoft Foundry
- **להתמחות בארכיטקטורות רב-סוכנות**: ליישם פתרונות סוכני AI מתואמים
- **ליישם שיטות האבטחה הטובות ביותר**: להגדיר אימות ושליטה בגישה
- **לאופטימיזציה למדיוק**: לתכנן פריסות חסכוניות וביצועיות
- **לטפל בתקלות בפריסות**: לפתור בעיות נפוצות באופן עצמאי

#### 📖 משאבי הסדנה
- **🎥 מדריך אינטראקטיבי**: [חומרי הסדנה](workshop/README.md) - סביבת למידה מבוססת דפדפן
- **📋 הוראות מודול אחר מודול**:
  - [0. הקדמה](workshop/docs/instructions/0-Introduction.md) - סקירת הסדנה ומטרות
  - [1. בחירה](workshop/docs/instructions/1-Select-AI-Template.md) - מצא ובחר תבניות AI
  - [2. אימות](workshop/docs/instructions/2-Validate-AI-Template.md) - פריסה ואימות תבניות
  - [3. פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - חקר ארכיטקטורת תבניות
  - [4. הגדרה](workshop/docs/instructions/4-Configure-AI-Template.md) - שליטה ב-azure.yaml
  - [5. התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) - התאמה אישית לסצנה שלך
  - [6. פירוק](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ניקוי משאבים
  - [7. סיכום](workshop/docs/instructions/7-Wrap-up.md) - סקירה ושלבים הבאים
- **🛠️ מעבדת סדנת AI**: [מעבדה לסדנת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - תרגילי AI ממוקדים
- **💡 התחלה מהירה**: [מדריך הגדרת הסדנה](workshop/README.md#quick-start) - קונפיגורציית סביבה

**מתאים במיוחד ל**: הכשרה ארגונית, קורסים אקדמיים, למידה עצמית וסדנאות פיתוח למתכנתים.

---

## 📖 התעמקות: יכולות AZD

מעבר ליסודות, AZD מספק יכולות עוצמתיות לפריסות ייצור:

- **פריסות מבוססות תבניות** - השתמש בתבניות מוכנות לדפוסי יישום נפוצים
- **תשתית כקוד** - ניהול משאבי Azure באמצעות Bicep או Terraform  
- **זרימות עבודה משולבות** - פריסה, ניטור ופריסה חלקה של יישומים
- **נוח למפתחים** - מותאם לפרודוקטיביות וניסיון מפתחים

### **AZD + Microsoft Foundry: מושלם לפריסות AI**

**למה AZD לפתרונות AI?** AZD פותר את האתגרים המרכזיים של מפתחי AI:

- **תבניות מוכנות ל-AI** - תבניות מוגדרות מראש ל-Azure OpenAI, Cognitive Services ועומסי עבודה ML
- **פריסות AI מאובטחות** - דפוסי אבטחה מובנים לשירותי AI, מפתחות API וקצות דגמים  
- **דפוסי AI לייצור** - שיטות עבודה מומלצות לפריסות AI בקנה מידה וחסכוניות
- **זרימות עבודה מקצה לקצה ל-AI** - מפיתוח מודלים ועד פריסה עם ניטור נאות
- **אופטימיזציית עלות** - ניהול משאבים חכם ואסטרטגיות סקיילינג לעומסי עבודה של AI
- **אינטגרציה עם Microsoft Foundry** - חיבור חלק למרכז המודלים של Microsoft Foundry ולנקודות קצה

---

## 🎯 ספריית תבניות ודוגמאות

### מודגש: תבניות Microsoft Foundry
**התחל כאן אם אתה מפתח יישומי AI!**

> **הערה:** תבניות אלו ממחישות דפוסי AI שונים. חלקן דוגמאות Azure חיצוניות, אחרות מימושים מקומיים.

| תבנית | פרק | מורכבות | שירותים | סוג |
|----------|---------|------------|----------|------|
| [**התחל עם צ'אט AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | חיצונית |
| [**התחל עם סוכני AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | פרק 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| חיצונית |
| [**הדגמת חיפוש Azure + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | חיצונית |
| [**התחלה מהירה לאפליקציית צ'אט OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | חיצונית |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | חיצונית |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | חיצונית |
| [**פתרון רב-סוכני קמעונאות**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **מקומית** |

### מודגש: תרחישי למידה שלמים
**תבניות יישומים מוכנות לייצור הממופות לפרקים בלמידה**

| תבנית | פרק למידה | מורכבות | מפתח למידה |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | דפוסי פריסה בסיסיים ל-AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | יישום RAG עם Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | פרק 4 | ⭐⭐ | אינטגרציה של בינה למסמכים |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | מסגרת סוכנים וקריאת פונקציות |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐ | תזמור AI ארגוני |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | ארכיטקטורת רב-סוכנים עם סוכני לקוחות ומלאי |

### למידה לפי סוג הדוגמה

> **📌 דוגמאות מקומיות לעומת חיצוניות:**  
> **דוגמאות מקומיות** (מאגר זה) = מוכנות לשימוש מיידי  
> **דוגמאות חיצוניות** (דוגמאות Azure) = שכפל ממאגרים מקושרים

#### דוגמאות מקומיות (מוכנות לשימוש)
- [**פתרון רב-סוכני קמעונאות**](examples/retail-scenario.md) - מימוש שלם מוכן לייצור עם תבניות ARM
  - ארכיטקטורת רב-סוכנים (סוכן לקוחות + מלאי)
  - ניטור והערכה מקיפים
  - פריסה בלחיצה אחת באמצעות תבנית ARM

#### דוגמאות מקומיות - אפליקציות מכולות (פרקים 2-5)
**דוגמאות פריסה מקיפות במכולות במאגר זה:**
- [**דוגמאות לאפליקציות מכולות**](examples/container-app/README.md) - מדריך מלא לפריסות מכולות
  - [API Flask פשוט](../../examples/container-app/simple-flask-api) - REST API בסיסי עם סקייל לאפס
  - [ארכיטקטורת מיקרו-שירותים](../../examples/container-app/microservices) - פריסת ריבוי שירותים לייצור
  - דפוסי התחלה מהירה, ייצור ומתקדמים לפריסה
  - מדריך לניטור, אבטחה ואופטימיזציה של עלות

#### דוגמאות חיצוניות - יישומים פשוטים (פרקים 1-2)
**שכפל מאגרים אלה של דוגמאות Azure כדי להתחיל:**
- [אפליקציית ווב פשוטה - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - דפוסי פריסה בסיסיים
- [אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - פריסת תוכן סטטי
- [אפליקציית מכולות - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - פריסת REST API

#### דוגמאות חיצוניות - אינטגרציית מסדי נתונים (פרקים 3-4)  
- [אפליקציית מסד נתונים - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - דפוסי קישוריות למסד נתונים
- [פונקציות + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - זרם עבודה ללא שרתים

#### דוגמאות חיצוניות - דפוסים מתקדמים (פרקים 4-8)
- [מיקרו-שירותים בג'אווה](https://github.com/Azure-Samples/java-microservices-aca-lab) - ארכיטקטורות רב-שירותיות
- [משרות Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - עיבוד ברקע  
- [צינור ML ארגוני](https://github.com/Azure-Samples/mlops-v2) - דפוסי ML מוכנים לייצור

### אוספי תבניות חיצוניים
- [**גלריית תבניות רשמית של AZD**](https://azure.github.io/awesome-azd/) - אוסף מסונן של תבניות רשמיות וקהילתיות
- [**תבניות Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - תיעוד תבניות מ-Microsoft Learn
- [**ספריית דוגמאות**](examples/README.md) - דוגמאות למידה מקומיות עם הסברים מפורטים

---

## 📚 משאבי למידה ומקורות מידע

### הפניות מהירות
- [**גליון פקודות**](resources/cheat-sheet.md) - פקודות azd מרכזות לפי פרקים
- [**מילון מונחים**](resources/glossary.md) - מונחי Azure ו-azd  
- [**שאלות נפוצות**](resources/faq.md) - שאלות נפוצות לפי פרקי למידה
- [**מדריך לימוד**](resources/study-guide.md) - תרגילי תרגול מקיפים

### סדנאות מעשיות
- [**מעבדת סדנת AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפוך את פתרונות AI לפריסות Azure באמצעות AZD (2-3 שעות)
- [**סדנה אינטראקטיבית**](workshop/README.md) - 8 מודולים עם תרגילים מודרכים באמצעות MkDocs ו-GitHub Codespaces
  - מתבסס על: הקדמה → בחירה → אימות → פירוק → הגדרה → התאמה אישית → פירוק → סיכום

### משאבי למידה חיצוניים
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [מרכז הארכיטקטורה Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מחשבון תמחור Azure](https://azure.microsoft.com/pricing/calculator/)
- [סטטוס Azure](https://status.azure.com/)

---

## 🔧 מדריך פתרון בעיות מהיר

**בעיות נפוצות המתחילים נתקלים בהן ופתרונות מידיים:**

<details>
<summary><strong>❌ "azd: לא נמצא הפקודה"</strong></summary>

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
<summary><strong>❌ "לא נמצאה הרשמה" או "הרשמה לא הוגדרה"</strong></summary>

```bash
# רשימת המנויים הזמינים
az account list --output table

# הגדר מנוי ברירת מחדל
az account set --subscription "<subscription-id-or-name>"

# הגדרה לסביבת AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# אמת
az account show
```
</details>
<details>
<summary><strong>❌ "הקצבה לא מספיקה" או "הקצבה חרגה"</strong></summary>

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
<summary><strong>❌ "azd up" נכשל באמצע</strong></summary>

```bash
# אפשרות 1: נקה ונסה שוב
azd down --force --purge
azd up

# אפשרות 2: תקן רק את התשתית
azd provision

# אפשרות 3: בדוק סטטוס מפורט
azd show

# אפשרות 4: בדוק יומני רישום ב-Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "אימות נכשל" או "אסימון פג תוקף"</strong></summary>

```bash
# לאמת מחדש
az logout
az login

azd auth logout
azd auth login

# לאמת את האימות
az account show
```
</details>

<details>
<summary><strong>❌ "המשאב כבר קיים" או התנגשויות שמות</strong></summary>

```bash
# AZD מייצרת שמות ייחודיים, אבל אם יש התנגשות:
azd down --force --purge

# ואז לנסות שוב בסביבה חדשה
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ פריסת תבנית לוקחת זמן רב מדי</strong></summary>

**זמני המתנה רגילים:**
- יישום רשת פשוט: 5-10 דקות
- יישום עם מסד נתונים: 10-15 דקות
- יישומי בינה מלאכותית: 15-25 דקות (הקצאת OpenAI איטית)

```bash
# בדוק התקדמות
azd show

# אם תקוע יותר מ-30 דקות, בדוק את פורטל Azure:
azd monitor
# חפש פריסות שנכשלו
```
</details>

<details>
<summary><strong>❌ "ההרשאה נדחתה" או "אסור"</strong></summary>

```bash
# בדוק את התפקיד שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# אתה צריך לפחות את התפקיד "Contributor"
# בקש ממנהל ה-Azure שלך להעניק:
# - Contributor (למשאבים)
# - מנהל גישת משתמש (להקצאות תפקיד)
```
</details>

<details>
<summary><strong>❌ לא ניתן למצוא את כתובת ה-URL של היישום שהופץ</strong></summary>

```bash
# הצג את כל נקודות הקצה של השירות
azd show

# או פתח את פורטל Azure
azd monitor

# בדוק שירות מסוים
azd env get-values
# חפש משתני *_URL
```
</details>

### 📚 משאבים מלאים לפתרון בעיות

- **מדריך בעיות נפוצות:** [פתרונות מפורטים](docs/chapter-07-troubleshooting/common-issues.md)
- **בעיות ייחודיות לבינה מלאכותית:** [פתרון בעיות בבינה מלאכותית](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **מדריך איתור באגים:** [איתור באגים שלב אחרי שלב](docs/chapter-07-troubleshooting/debugging.md)
- **קבלת עזרה:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 סיום הקורס והסמכה

### מעקב התקדמות
עקוב אחר התקדמות הלמידה שלך בכל פרק:

- [ ] **פרק 1**: יסודות ותחילת עבודה מהירה ✅
- [ ] **פרק 2**: פיתוח שמבוסס על בינה מלאכותית ✅  
- [ ] **פרק 3**: קונפיגורציה ואימות ✅
- [ ] **פרק 4**: תשתית כקוד ופריסה ✅
- [ ] **פרק 5**: פתרונות בינה מלאכותית עם סוכנים מרובים ✅
- [ ] **פרק 6**: אימות ותכנון לפני פריסה ✅
- [ ] **פרק 7**: פתרון תקלות ואיתור באגים ✅
- [ ] **פרק 8**: דפוסי ייצור וארגוניים ✅

### אימות למידה
לאחר סיום כל פרק, אמת את הידע שלך באמצעות:
1. **תרגול מעשי**: להשלים את הפריסה המעשי של הפרק
2. **בדיקת ידע**: סקירת שאלות נפוצות של הפרק שלך
3. **דיון קהילתי**: שיתוף החוויה שלך ב-Azure Discord
4. **הפרק הבא**: להמשיך לפרק הבא עם רמת קושי גבוהה יותר

### יתרונות סיום הקורס
עם סיום כל הפרקים, יש ברשותך:
- **ניסיון פרקטי בפרודקשן**: פריסת יישומי בינה מלאכותית אמיתיים ל-Azure
- **כישורים מקצועיים**: יכולות פריסה מוכנות לארגון  
- **הכרה קהילתית**: חבר פעיל בקהילת המפתחים של Azure
- **קידום קריירה**: מומחיות מבוקשת ב-AZD ופריסות בינה מלאכותית

---

## 🤝 קהילה ותמיכה

### קבלת עזרה ותמיכה
- **בעיות טכניות**: [דיווח על באגים ובקשות תכונות](https://github.com/microsoft/azd-for-beginners/issues)
- **שאלות למידה**: [קהילת Microsoft Azure Discord](https://discord.gg/microsoft-azure) ו-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **עזרה ייעודית לבינה מלאכותית**: הצטרף ל-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **תיעוד**: [תיעוד רשמי של Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### תובנות קהילתיות מ-Microsoft Foundry Discord

**תוצאות סקר אחרון בערוץ #Azure:**
- **45%** מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של בינה מלאכותית
- **אתגרים מובילים**: פריסות מרובות שירותים, ניהול אישורים, מוכנות לייצור  
- **הבקשות הנפוצות ביותר**: תבניות ייחודיות לבינה מלאכותית, מדריכי פתרון בעיות, שיטות עבודה מומלצות

**הצטרף לקהילתנו כדי:**
- לשתף חוויות AZD + AI ולקבל עזרה
- לקבל גישה לתצוגות מוקדמות של תבניות AI חדשות
- לתרום לשיטות עבודה מומלצות לפריסת AI
- להשפיע על פיתוח פיצ'רים עתידיים של AI ו-AZD

### תרומה לקורס
נשמח לתרומות! אנא קרא את [מדריך התרומה](CONTRIBUTING.md) לפרטים על:
- **שיפורי תוכן**: שיפור פרקים ודוגמאות קיימות
- **דוגמאות חדשות**: הוספת תרחישים ותבניות מעשיות  
- **תרגום**: סיוע בתחזוקת תמיכה בשפות מרובות
- **דיווח באגים**: שיפור הדיוק והבהירות
- **סטנדרטים קהילתיים**: עמידה בהנחיות קהילה מכילות

---

## 📄 מידע על הקורס

### רישיון
הפרויקט מורשה תחת רישיון MIT - ראה את הקובץ [LICENSE](../../LICENSE) לפרטים.

### משאבים קשורים ללמידה מ-Microsoft

הצוות שלנו מייצר קורסים מקיפים נוספים:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j למתחילים](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js למתחילים](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain למתחילים](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD למתחילים](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI למתחילים](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP למתחילים](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![סוכני AI למתחילים](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת בינה מלאכותית מחוללת
[![בינה מלאכותית מחוללת למתחילים](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![בינה מלאכותית מחוללת (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![בינה מלאכותית מחוללת (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![בינה מלאכותית מחוללת (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### למידה בסיסית
[![למידת מכונה למתחילים](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![מדע הנתונים למתחילים](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![בינה מלאכותית למתחילים](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![סייבר למתחילים](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![פיתוח ווב למתחילים](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT למתחילים](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![פיתוח XR למתחילים](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת קופילוט
[![קופילוט לתיכנות זוגי עם AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![קופילוט ל-C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![הרפתקת קופילוט](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ ניווט בקורס

**🚀 מוכנים להתחיל ללמוד?**

**מתחילים**: התחל עם [פרק 1: יסודות והתחלה מהירה](../..)  
**מפתחי AI**: קפוץ ל-[פרק 2: פיתוח AI-ראשון](../..)  
**מפתחים מנוסים**: התחל עם [פרק 3: תצורה ואימות](../..)

**שלבים הבאים**: [התחל פרק 1 - יסודות AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפת המקור כמקור המוסמך. עבור מידע קריטי, מומלץ לבצע תרגום מקצועי על ידי אדם. אנו לא אחראים עבור אי-הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->