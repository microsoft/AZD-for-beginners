# AZD למתחילים: מסע למידה מובנה

![AZD-למ начинаנים](../../translated_images/he/azdbeginners.5527441dd9f74068.webp) 

[![עוקבים ב-GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![מזלגות ב-GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![כוכבים ב-GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord של Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord של Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### תרגומים אוטומטיים (תמיד מעודכנים)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[ערבית](../ar/README.md) | [בנגלית](../bn/README.md) | [בולגרית](../bg/README.md) | [בורמזית (מיאנמר)](../my/README.md) | [סינית (מפושטת)](../zh-CN/README.md) | [סינית (מסורתית, הונג קונג)](../zh-HK/README.md) | [סינית (מסורתית, מקאו)](../zh-MO/README.md) | [סינית (מסורתית, טייוואן)](../zh-TW/README.md) | [קרואטית](../hr/README.md) | [צ'כית](../cs/README.md) | [דנית](../da/README.md) | [הולנדית](../nl/README.md) | [אסטונית](../et/README.md) | [פינית](../fi/README.md) | [צרפתית](../fr/README.md) | [גרמנית](../de/README.md) | [יוונית](../el/README.md) | [עברית](./README.md) | [הינית](../hi/README.md) | [הונגראית](../hu/README.md) | [אינדונזית](../id/README.md) | [איטלקית](../it/README.md) | [יפנית](../ja/README.md) | [קאנדה](../kn/README.md) | [קמרית](../km/README.md) | [קוריאנית](../ko/README.md) | [ליטאית](../lt/README.md) | [מלאית](../ms/README.md) | [מאלאלאם](../ml/README.md) | [מרטהי](../mr/README.md) | [נפאלית](../ne/README.md) | [פידג'ין ניגרי](../pcm/README.md) | [נורבגית](../no/README.md) | [פרסית (פרסי)](../fa/README.md) | [פולנית](../pl/README.md) | [פורטוגזית (ברזיל)](../pt-BR/README.md) | [פורטוגזית (פורטוגל)](../pt-PT/README.md) | [פונג'אבית (גורמוכי)](../pa/README.md) | [רומנית](../ro/README.md) | [רוסית](../ru/README.md) | [סרבית (קירילית)](../sr/README.md) | [סלובקית](../sk/README.md) | [סלובנית](../sl/README.md) | [ספרדית](../es/README.md) | [סווהילית](../sw/README.md) | [שוודית](../sv/README.md) | [טגילוג (פיליפינית)](../tl/README.md) | [טמילית](../ta/README.md) | [טלוגו](../te/README.md) | [תאית](../th/README.md) | [טורקית](../tr/README.md) | [אוקראינית](../uk/README.md) | [אורדו](../ur/README.md) | [ווייטנאמית](../vi/README.md)

> **מעדיפים לשכפל מקומית?**
>
> מאגר זה כולל 50+ תרגומים בשפות שונות שמגדילים משמעותית את גודל ההורדה. כדי לשכפל ללא תרגומים, השתמש ב-sparse checkout:
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
> זה נותן לך את כל מה שאתה צריך כדי להשלים את הקורס במהירות הורדה גבוהה יותר.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 מה חדש ב-azd היום

Azure Developer CLI צמח מעבר לאפליקציות רשת ו-APIs מסורתיים. היום, azd הוא הכלי האחיד לפריסת **כל** יישום ב-Azure — כולל יישומים מבוססי AI וסוכנים אינטליגנטיים.

הנה מה שזה אומר עבורך:

- **סוכני AI הם עכשיו עומסי עבודה מובילים ב-azd.** ניתן לאתחל, לפרוס ולנהל פרויקטים של סוכני AI באמצעות אותו זרימת עבודה של `azd init` → `azd up` שאתם כבר מכירים.
- **אינטגרציה עם Microsoft Foundry** מביאה פריסה של מודלים, אירוח סוכנים וקונפיגורציית שירותי AI ישירות לאקוסיסטם של תבניות ה-azd.
- **זרימת העבודה הראשית לא השתנתה.** בין אם אתה מפעיל אפליקציית מנהלים, מיקרוסרביס או פתרון AI רב-סוכנים, הפקודות זהות.

אם השתמשת ב-azd בעבר, התמיכה ב-AI היא הרחבה טבעית — לא כלי נפרד או מסלול מתקדם. אם אתה מתחיל מהתחלה, תלמד זרימת עבודה אחת שעובדת לכל דבר.

---

## 🚀 מה זה Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** הוא כלי שורת פקודה ידידותי למפתחים שמקל על פריסה של יישומים ב-Azure. במקום ליצור ולחבר עשרות משאבי Azure באופן ידני, אפשר לפרוס אפליקציות שלמות באמצעות פקודה אחת.

### הקסם של `azd up`

```bash
# הפקודה היחידה הזו עושה הכל:
# ✅ יוצר את כל המשאבים ב-Azure
# ✅ מגדיר את הרשת והאבטחה
# ✅ בונה את קוד היישום שלך
# ✅ מפרסם ל-Azure
# ✅ נותן לך כתובת URL פועלת
azd up
```

**זהו זה!** שום לחיצות ב-Azure Portal, אין צורך ללמוד תבניות ARM מסובכות מראש, ואין צורך בהגדרות ידניות - רק אפליקציות עובדות ב-Azure.

---

## ❓ Azure Developer CLI לעומת Azure CLI: מה ההבדל?

זו השאלה השכיחה ביותר של מתחילים. הנה התשובה הפשוטה:

| תכונה | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **מטרה** | לנהל משאבי Azure בודדים | לפרוס יישומים שלמים |
| **גישה** | ממוקד תשתית | ממוקד אפליקציה |
| **דוגמה** | `az webapp create --name myapp...` | `azd up` |
| **עקומת למידה** | חייב להכיר שירותי Azure | רק ידע על האפליקציה שלך |
| **מתאים ל-** | DevOps, תשתיות | מפתחים, אב טיפוס |

### אנלוגיה פשוטה

- **Azure CLI** היא כמו שיש לך את כל הכלים לבנות בית - פטישים, מסורים, מסמרים. אתה יכול לבנות הכל, אבל אתה צריך להכיר בנייה.
- **Azure Developer CLI** היא כמו שכירת קבלן - אתה מתאר מה אתה רוצה, והוא דואג לבנייה.

### מתי משתמשים בכלים

| תרחיש | השתמש ב- |
|----------|----------|
| "אני רוצה לפרוס את אפליקציית הרשת שלי מהר" | `azd up` |
| "אני צריך ליצור רק חשבון אחסון" | `az storage account create` |
| "אני בונה אפליקציית AI מלאה" | `azd init --template azure-search-openai-demo` |
| "אני צריך לנפות בעיות במשאב Azure ספציפי" | `az resource show` |
| "אני רוצה פריסה מוכנה לייצור בדקות" | `azd up --environment production` |

### הם עובדים ביחד!

AZD משתמש ב-Azure CLI מתחת למכסה המנוע. אפשר להשתמש בשניהם:
```bash
# פרוס את האפליקציה שלך באמצעות AZD
azd up

# לאחר מכן כוונן משאבים ספציפיים באמצעות Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 מצא תבניות ב-Awesome AZD

אל תתחיל מאפס! **Awesome AZD** הוא אוסף קהילתי של תבניות מוכנות לפריסה:

| משאב | תיאור |
|----------|-------------|
| 🔗 [**גלריית Awesome AZD**](https://azure.github.io/awesome-azd/) | עיין ביותר מ-200 תבניות עם פריסה בלחיצה אחת |
| 🔗 [**הגש תבנית**](https://github.com/Azure/awesome-azd/issues) | תרום את התבנית שלך לקהילה |
| 🔗 [**מאגר GitHub**](https://github.com/Azure/awesome-azd) | דרג וחקור את המקור |

### תבניות AI פופולריות מ-Awesome AZD

```bash
# צ'אט RAG עם דגמי Microsoft Foundry + חיפוש בינה מלאכותית
azd init --template azure-search-openai-demo

# יישום צ'אט מהיר עם בינה מלאכותית
azd init --template openai-chat-app-quickstart

# סוכני בינה מלאכותית עם סוכני Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 התחלת עבודה ב-3 שלבים

לפני ההתחלה, ודא שהמחשב מוכן לתבנית שברצונך לפרוס:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

אם בדיקה כלשהי נכשלה, תקן זאת תחילה ואז המשך להתקנה המהירה.

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

### שלב 2: אשר את AZD

```bash
# אופציונלי אם בכוונתך להשתמש בפקודות Azure CLI ישירות בקורס זה
az login

# נדרש עבור זרימות עבודה של AZD
azd auth login
```

אם אתה לא בטוח מה אתה צריך, עקוב אחרי כל תהליך ההתקנה ב-[התקנה והגדרה](docs/chapter-01-foundation/installation.md#authentication-setup).

### שלב 3: פרוס את האפליקציה הראשונה שלך

```bash
# אתחול מתוך תבנית
azd init --template todo-nodejs-mongo

# פריסה ל-Azure (יוצר הכל!)
azd up
```

**🎉 זהו זה!** האפליקציה שלך עכשיו פעילה ב-Azure.

### ניקוי (אל תשכח!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 איך להשתמש בקורס הזה

קורס זה מיועד ל**למידה הדרגתית** - התחל במקום שבו אתה מרגיש בנוח והתקדם הלאה:

| הניסיון שלך | התחל כאן |
|-----------------|------------|
| **חדש באז'יור** | [פרק 1: יסודות](#-chapter-1-foundation--quick-start) |
| **מכיר את Azure, חדש ב-AZD** | [פרק 1: יסודות](#-chapter-1-foundation--quick-start) |
| **רוצה לפרוס אפליקציות AI** | [פרק 2: פיתוח מונחה AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **רוצה תרגול מעשי** | [🎓 סדנה אינטראקטיבית](workshop/README.md) - מעבדה מודרכת של 3-4 שעות |
| **צריך תבניות לייצור** | [פרק 8: ייצור וארגוני](#-chapter-8-production--enterprise-patterns) |

### התקנה מהירה

1. **הכן מאגר זה**: [![מזלגות ב-GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **שכפל אותו**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **קבל עזרה**: [קהילת Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **מעדיפים לשכפל מקומית?**

> מאגר זה כולל 50+ תרגומים בשפות שונות שמגדילים משמעותית את גודל ההורדה. כדי לשכפל ללא תרגומים, השתמש ב-sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> זה נותן לך את כל מה שאתה צריך כדי להשלים את הקורס במהירות הורדה גבוהה יותר.


## סקירת הקורס

למד לשלוט ב-Azure Developer CLI (azd) דרך פרקים מובנים שעוצבו ללמידה הדרגתית. **דגש מיוחד על פריסת אפליקציות AI עם אינטגרציה של Microsoft Foundry.**

### למה הקורס הזה חיוני למפתחים מודרניים

בהתבסס על תובנות מקהילת Microsoft Foundry Discord, **45% מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI** אך נתקלים באתגרים כמו:
- ארכיטקטורות AI מורכבות מרובות שירותים
- שיטות פריסה מיטביות לייצור AI  
- אינטגרציה וקונפיגורציית שירותי AI ב-Azure
- אופטימיזציה של עלויות לעומסי AI
- פתרון בעיות ספציפיות לפריסות AI

### יעדי הלמידה

בסיום קורס זה המובנה, תלמד:
- **שליטה ביסודות AZD**: מושגים מרכזיים, התקנה וקונפיגורציה
- **פריסת יישומי AI**: שימוש ב-AZD עם שירותי Microsoft Foundry
- **יישום Infrastructure as Code**: ניהול משאבי Azure עם תבניות Bicep
- **פתרון בעיות בפריסות**: תיקון בעיות נפוצות וניפוי שגיאות
- **אופטימיזציה לייצור**: אבטחה, סקיילינג, ניטור וניהול עלויות
- **בניית פתרונות רב-סוכניים**: פריסת ארכיטקטורות AI מורכבות

## לפני שאתה מתחיל: חשבונות, גישה והנחות מוקדמות

לפני שתתחיל בפרק 1, ודא שהדברים הבאים מוכנים. שלבי ההתקנה לאחר מכן מניחים שהבסיסים האלו כבר טופלו.
- **מנוי Azure**: ניתן להשתמש במנוי קיים מעבודתך או מהחשבון האישי שלך, או ליצור [ניסיון חינמי](https://aka.ms/azurefreetrial) כדי להתחיל.
- **הרשאה ליצור משאבי Azure**: ברוב התרגילים, יש צורך לפחות בגישת **Contributor** על המנוי או קבוצת המשאבים היעדית. חלק מהפרקים עשויים להניח גם כי ניתן ליצור קבוצות משאבים, זהויות מנוהלות והקצאות RBAC.
- [**חשבון GitHub**](https://github.com): זה שימושי לפרוקינג הרפוזיטורי, מעקב אחרי השינויים האישיים שלך, ושימוש ב-GitHub Codespaces עבור הסדנה.
- **דרישות קדם להפעלת תבניות**: תבניות מסוימות דורשות כלים מקומיים כמו Node.js, Python, Java, או Docker. יש להריץ את מבקר ההתקנה לפני ההתחלה כדי לגלות חוסרים מוקדם.
- **היכרות בסיסית עם טרמינל**: לא נדרש להיות מומחה, אך רצוי להרגיש בנוח להריץ פקודות כמו `git clone`, `azd auth login`, ו-`azd up`.

> **עובדים במנוי ארגוני?**
> אם סביבת Azure שלך מנוהלת על ידי מנהל מערכת, יש לוודא מראש כי תוכל לפרוס משאבים במנוי או בקבוצת המשאבים שאתה מתכוון להשתמש בהן. אם לא, בקש מנוי סנדבוקס או גישת Contributor לפני שתתחיל.

> **חדש ב-Azure?**
> התחל עם ניסיון Azure משלך או מנוי תשלום לפי שימוש בכתובת https://aka.ms/azurefreetrial כדי שתוכל להשלים את התרגילים מתחילה ועד סופם ללא המתנה לאישורים ברמת השוכר.

## 🗺️ מפת הקורס: ניווט מהיר לפי פרק

לכל פרק README ייעודי עם מטרות לימוד, התחלויות מהירות ותרגילים:

| פרק | נושא | שיעורים | משך | רמת קושי |
|---------|-------|---------|----------|------------|
| **[פרק 1: יסודות](docs/chapter-01-foundation/README.md)** | התחלה | [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [התקנה](docs/chapter-01-foundation/installation.md) &#124; [הפרויקט הראשון](docs/chapter-01-foundation/first-project.md) | 30-45 דקות | ⭐ |
| **[פרק 2: פיתוח מבוסס AI](docs/chapter-02-ai-development/README.md)** | אפליקציות AI | [אינטגרציית Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [סוכני AI](docs/chapter-02-ai-development/agents.md) &#124; [פריסת מודל AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [סדנה](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 שעות | ⭐⭐ |
| **[פרק 3: הגדרה ואבטחה](docs/chapter-03-configuration/README.md)** | הרשאות ואבטחה | [הגדרות](docs/chapter-03-configuration/configuration.md) &#124; [אימות ואבטחה](docs/chapter-03-configuration/authsecurity.md) | 45-60 דקות | ⭐⭐ |
| **[פרק 4: תשתית](docs/chapter-04-infrastructure/README.md)** | IaC ופריסה | [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [הקצאה](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 שעות | ⭐⭐⭐ |
| **[פרק 5: סוכנים מרובים](docs/chapter-05-multi-agent/README.md)** | פתרונות סוכני AI | [תרחיש קמעונאי](examples/retail-scenario.md) &#124; [תבניות תיאום](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[פרק 6: בדיקות ותכנון מקדימות](docs/chapter-06-pre-deployment/README.md)** | תכנון ואימות | [בדיקות מקדימות](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 שעה | ⭐⭐ |
| **[פרק 7: פתרון תקלות](docs/chapter-07-troubleshooting/README.md)** | איתור תיקון | [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) &#124; [איתור שגיאות](docs/chapter-07-troubleshooting/debugging.md) &#124; [בעיות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 שעות | ⭐⭐ |
| **[פרק 8: ייצור](docs/chapter-08-production/README.md)** | תבניות ארגוניות | [שיטות ייצור](docs/chapter-08-production/production-ai-practices.md) | 2-3 שעות | ⭐⭐⭐⭐ |
| **[🎓 סדנה](workshop/README.md)** | מעבדה מעשית | [הקדמה](workshop/docs/instructions/0-Introduction.md) &#124; [בחירה](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [אימות](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [הגדרה](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [פירוק תשתית](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [סיכום](workshop/docs/instructions/7-Wrap-up.md) | 3-4 שעות | ⭐⭐ |

**משך כולל:** ~10-14 שעות | **התקדמות מיומנות:** מתחיל → מוכן לייצור

---

## 📚 פרקי לימוד

*בחר את מסלול הלמידה שלך לפי רמת ניסיון ומטרות*

### 🚀 פרק 1: יסודות והתחלה מהירה  
**דרישות קדם**: מנוי Azure, היכרות בסיסית עם שורת הפקודה  
**משך**: 30-45 דקות  
**רמת קושי**: ⭐

#### מה תלמד  
- הבנת יסודות Azure Developer CLI  
- התקנת AZD בפלטפורמה שלך  
- הפרוס הראשון המצליח שלך  

#### משאבי לימוד  
- **🎯 התחלת כאן**: [מה הוא Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 תיאוריה**: [יסודות AZD](docs/chapter-01-foundation/azd-basics.md) - מושגים מרכזיים ומונחים  
- **⚙️ התקנה**: [התקנה והגדרות](docs/chapter-01-foundation/installation.md) - מדריכים ספציפיים לפלטפורמה  
- **🛠️ מעשי**: [הפרויקט הראשון שלך](docs/chapter-01-foundation/first-project.md) - מדריך צעד-אחר-צעד  
- **📋 הפניה מהירה**: [גליון פקודות](resources/cheat-sheet.md)  

#### תרגילים מעשיים  
```bash
# בדיקת התקנה מהירה
azd version

# פרוס את היישום הראשון שלך
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 תוצאת הפרק**: לפרוס בהצלחה אפליקציית ווב פשוטה ל-Azure באמצעות AZD  

**✅ אימות הצלחה:**  
```bash
# לאחר השלמת פרק 1, עליך להיות מסוגל:
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

### 🤖 פרק 2: פיתוח מבוסס AI (מומלץ למפתחים בתחום AI)  
**דרישות קדם**: פרק 1 הושלם  
**משך**: 1-2 שעות  
**רמת קושי**: ⭐⭐

#### מה תלמד  
- אינטגרציית Microsoft Foundry עם AZD  
- פריסת אפליקציות מונעות AI  
- הבנת הגדרות שירותי AI  

#### משאבי לימוד  
- **🎯 התחלת כאן**: [אינטגרציית Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 סוכני AI**: [מדריך סוכני AI](docs/chapter-02-ai-development/agents.md) - פרוס סוכנים חכמים עם AZD  
- **📖 תבניות**: [פריסת מודל AI](docs/chapter-02-ai-development/ai-model-deployment.md) - פרוס ונהל מודלים של AI  
- **🛠️ סדנה**: [סדנת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפוך את פתרונות ה-AI שלך למוכנים ל-AZD  
- **🎥 מדריך אינטראקטיבי**: [חומרי סדנה](workshop/README.md) - למידה בדפדפן עם MkDocs * סביבת DevContainer  
- **📋 תבניות**: [תבניות Microsoft Foundry מובילות](#משאבי-הסדנה)  
- **📝 דוגמאות**: [דוגמאות לפריסה עם AZD](examples/README.md)  

#### תרגילים מעשיים  
```bash
# פרוס את אפליקציית הבינה המלאכותית הראשונה שלך
azd init --template azure-search-openai-demo
azd up

# נסה תבניות בינה מלאכותית נוספות
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 תוצאת הפרק**: פרוס והגדר אפליקציית צ׳אט מונעת AI עם יכולות RAG  

**✅ אימות הצלחה:**  
```bash
# לאחר פרק 2, תוכל:
azd init --template azure-search-openai-demo
azd up
# לבדוק את ממשק הצ'אט של הבינה המלאכותית
# לשאול שאלות ולקבל תגובות מונעות בינה מלאכותית עם מקורות
# לאמת ששלוב החיפוש פועל
azd monitor  # לבדוק ש-Application Insights מציגה טלמטריה
azd down --force --purge
```
  
**📊 השקעת זמן:** 1-2 שעות  
**📈 רמת מיומנות לאחר:** יכול לפרוס ולהגדיר אפליקציות AI מוכנות לייצור  
**💰 מודעות לעלויות:** הבנת עלויות פיתוח של $80-150 לחודש, ועלויות ייצור של $300-3500 לחודש  

#### 💰 שיקולי עלות לפריסות AI  

**סביבת פיתוח (מוערך $80-150/לחודש):**  
- דגמי Microsoft Foundry (תשלום לפי שימוש): $0-50/לחודש (תלוי בכמות הטוקנים)  
- חיפוש AI (רמת בסיס): $75/לחודש  
- Container Apps (צורכן): $0-20/לחודש  
- אחסון (סטנדרטי): $1-5/לחודש  

**סביבת ייצור (מוערך $300-3500+/לחודש):**  
- דגמי Microsoft Foundry (PTU לביצועים עקביים): $3000+/לחודש או תשלום לפי שימוש בכמויות גבוהות  
- חיפוש AI (רמת סטנדרט): $250/לחודש  
- Container Apps (ייעודי): $50-100/לחודש  
- Application Insights: $5-50/לחודש  
- אחסון (פרימיום): $10-50/לחודש  

**💡 טיפים לאופטימיזציה של עלויות:**  
- השתמש בדגמי Microsoft Foundry ברמת **Free Tier** ללמידה (כולל Azure OpenAI 50,000 טוקנים לחודש)  
- הרץ `azd down` לפירוק משאבים כאשר לא נמצאים בפיתוח פעיל  
- התחל בחיוב מבוסס צריכה, ועדכן ל-PTU רק בייצור  
- השתמש ב-`azd provision --preview` להערכת עלויות לפני פריסה  
- אפשר Auto-scaling: שלם רק עבור השימוש בפועל  

**מעקב עלויות:**  
```bash
# בדוק עלויות חודשיות מוערכות
azd provision --preview

# עקוב אחר עלויות בפועל בפורטל אזיור
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ פרק 3: הגדרה ואימות  
**דרישות קדם**: פרק 1 הושלם  
**משך**: 45-60 דקות  
**רמת קושי**: ⭐⭐

#### מה תלמד  
- הגדרת וניהול סביבות  
- דפוסי אימות ואבטחה מומלצים  
- שמות וארגון משאבים  

#### משאבי לימוד  
- **📖 הגדרות**: [מדריך הגדרות](docs/chapter-03-configuration/configuration.md) - הגדרת הסביבה  
- **🔐 אבטחה**: [דפוסי אימות וזהות מנוהלת](docs/chapter-03-configuration/authsecurity.md) - דפוסי אימות  
- **📝 דוגמאות**: [אפליקציית בסיס נתונים - דוגמה](examples/database-app/README.md) - דוגמאות AZD למסדי נתונים  

#### תרגילים מעשיים  
- הגדרת סביבות מרובות (פיתוח, סטייג׳ינג, ייצור)  
- הגדרת אימות זהות מנוהלת  
- יישום הגדרות ייחודיות לסביבה  

**💡 תוצאת הפרק**: ניהול סביבות מרובות עם אימות ואבטחה נכונים  

---

### 🏗️ פרק 4: תשתית כקוד ופריסה  
**דרישות קדם**: פרקים 1-3 הושלמו  
**משך**: 1-1.5 שעות  
**רמת קושי**: ⭐⭐⭐

#### מה תלמד  
- דפוסי פריסה מתקדמים  
- תשתית כקוד עם Bicep  
- אסטרטגיות הקצאת משאבים  

#### משאבי לימוד  
- **📖 פריסה**: [מדריך פריסה](docs/chapter-04-infrastructure/deployment-guide.md) - תהליכים מלאים  
- **🏗️ הקצאה**: [ניהול משאבי Azure](docs/chapter-04-infrastructure/provisioning.md) - הקצאת משאבים  
- **📝 דוגמאות**: [דוגמת Container App](../../examples/container-app) - פריסות מכולות  

#### תרגילים מעשיים  
- יצירת תבניות Bicep מותאמות  
- פריסת אפליקציות רב-שירותיות  
- יישום אסטרטגיות פריסה כחולה-ירוקה  

**💡 תוצאת הפרק**: לפרוס אפליקציות רבת-שירות מורכבות עם תבניות תשתית מותאמות  

---

### 🎯 פרק 5: פתרונות AI עם סוכנים מרובים (מתקדם)  
**דרישות קדם**: פרקים 1-2 הושלמו  
**משך**: 2-3 שעות  
**רמת קושי**: ⭐⭐⭐⭐

#### מה תלמד  
- דפוסי ארכיטקטורת סוכנים מרובים  
- תיאום ואורקסטרציה של סוכנים  
- פריסות AI מוכנות לייצור  

#### משאבי לימוד  
- **🤖 פרויקט מוביל**: [פתרון סוכנים מרובים קמעונאי](examples/retail-scenario.md) - מימוש מלא  
- **🛠️ תבניות ARM**: [חבילת תבניות ARM לסוכנים מרובים](../../examples/retail-multiagent-arm-template) - פריסה בלחיצה אחת  
- **📖 ארכיטקטורה**: [דפוסי תיאום סוכנים מרובים](docs/chapter-06-pre-deployment/coordination-patterns.md) - דפוסים  

#### תרגילים מעשיים  
```bash
# פרוס את הפתרון הרב-סוכני המלא לקמעונאות
cd examples/retail-multiagent-arm-template
./deploy.sh

# חקור תצורות סוכן
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 תוצאת הפרק**: לפרוס ולנהל פתרון AI מבוסס סוכנים מרובים מוכן לייצור עם סוכני לקוח ומלאי  

---

### 🔍 פרק 6: אימות ותכנון מקדימים  
**דרישות קדם**: פרק 4 הושלם  
**משך**: 1 שעה  
**רמת קושי**: ⭐⭐
#### מה תלמדו
- תכנון קיבולת ואימות משאבים
- אסטרטגיות בחירת SKU
- בדיקות טרום-טיסה ואוטומציה

#### מקורות למידה
- **📊 תכנון**: [תכנון קיבולת](docs/chapter-06-pre-deployment/capacity-planning.md) - אימות משאבים
- **💰 בחירה**: [בחירת SKU](docs/chapter-06-pre-deployment/sku-selection.md) - בחירות חסכוניות
- **✅ אימות**: [בדיקות טרום-טיסה](docs/chapter-06-pre-deployment/preflight-checks.md) - סקריפטים אוטומטיים

#### תרגילים מעשיים
- הרצת סקריפטים לאימות קיבולת
- אופטימיזציה של בחירות SKU עבור עלות
- יישום בדיקות אוטומטיות לפני פריסה

**💡 תוצאת הפרק**: לאמת ולשפר פריסות לפני ביצוע

---

### 🚨 פרק 7: פתרון בעיות ודיבוג
**דרישות קדם**: השלמת כל פרק פריסה כלשהו  
**משך זמן**: שעה עד שעה וחצי  
**מורכבות**: ⭐⭐

#### מה תלמדו
- גישות שיטתיות לדיבוג
- בעיות נפוצות ופתרונות
- פתרון בעיות ספציפי ל-AI

#### מקורות למידה
- **🔧 בעיות נפוצות**: [בעיות נפוצות](docs/chapter-07-troubleshooting/common-issues.md) - שאלות נפוצות ופתרונות
- **🕵️ דיבוג**: [מדריך לדיבוג](docs/chapter-07-troubleshooting/debugging.md) - אסטרטגיות שלב אחר שלב
- **🤖 בעיות AI**: [פתרון בעיות ל-AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - בעיות בשירותי AI

#### תרגילים מעשיים
- אבחון כשלונות בפריסה
- פתרון בעיות אימות
- דיבוג חיבור לשירותי AI

**💡 תוצאת הפרק**: לאבחן באופן עצמאי ולפתור בעיות פריסה נפוצות

---

### 🏢 פרק 8: תבניות ייצור וארגוניות
**דרישות קדם**: השלמת פרקים 1-4  
**משך זמן**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמדו
- אסטרטגיות פריסת ייצור
- תבניות אבטחה ארגוניות
- ניטור ואופטימיזציה של עלויות

#### מקורות למידה
- **🏭 ייצור**: [שיטות עבודה מומלצות ל-AI בייצור](docs/chapter-08-production/production-ai-practices.md) - תבניות ארגוניות
- **📝 דוגמאות**: [דוגמת מיקרוסרוויסים](../../examples/microservices) - ארכיטקטורות מורכבות
- **📊 ניטור**: [אינטגרציה עם Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - ניטור

#### תרגילים מעשיים
- יישום תבניות אבטחה ארגוניות
- הקמת ניטור מקיף
- פריסה לייצור עם ממשל תקין

**💡 תוצאת הפרק**: לפרוס יישומים מוכנים לפרודקשן עם יכולות מלאות

---

## 🎓 סקירת סדנה: חווית למידה מעשית

> **⚠️ מצב הסדנה: בפיתוח פעיל**  
> חומרים לסדנה מפותחים ומעודכנים כעת. מודולים בסיסיים עבודה, אך חלק מהחלקים המתוחכמים לא גמורים. עובדים לסיים את כל התוכן. [עקבו אחר ההתקדמות →](workshop/README.md)

### חומרי הסדנה האינטראקטיביים
**למידה מעשית מקיפה עם כלים בדפדפן ותרגילים מונחים**

חומרי הסדנה מספקים חווית למידה מאורגנת ואינטראקטיבית המשלים למידה מבוססת פרקים הנ"ל. הסדנה מיועדת ללמידה בקצב עצמי ולמפגשים מודרכים.

#### 🛠️ תכונות הסדנה
- **ממשק בדפדפן**: סדנת MkDocs מלאה עם חיפוש, העתקה ועיצובים
- **אינטגרציית GitHub Codespaces**: הקמת סביבת פיתוח בלחיצה אחת
- **מסלול למידה מובנה**: 8 מודולים (3-4 שעות סה"כ)
- **שיטתיות פרוגרסיבית**: הקדמה → בחירה → אימות → פירוק → קונפיגורציה → התאמה אישית → פירוק → סיום
- **סביבת DevContainer אינטראקטיבית**: כלים ותלויות מוכנות מראש

#### 📚 מבנה מודולי הסדנה
הסדנה פועלת על פי **שיטת התקדמות ב-8 מודולים** שמובילה אותך מגילוי למיומנות בפריסה:

| מודול  | נושא  | מה תעשה  | משך זמן  |
|--------|-------|-----------|----------|
| **0. הקדמה** | סקירת הסדנה | להבין יעדי למידה, דרישות קדם ומבנה הסדנה | 15 דקות |
| **1. בחירה** | גילוי תבניות | חקור תבניות AZD ובחר תבנית AI מתאימה לתרחיש שלך | 20 דקות |
| **2. אימות** | פרוס ואמת | הפעל תבנית עם `azd up` ואמת תפקוד התשתית | 30 דקות |
| **3. פירוק** | הבן את המבנה | השתמש ב-GitHub Copilot לחקור ארכיטקטורת תבניות, קבצי Bicep, וארגון קוד | 30 דקות |
| **4. קונפיגורציה** | העמקה ב-azure.yaml | שלוט בקונפיגורציה, hooks ושינויים בסביבה | 30 דקות |
| **5. התאמה אישית** | הפוך אותו לשלך | הפעל חיפוש AI, מעקב, הערכה והתאם לתרחיש שלך | 45 דקות |
| **6. פירוק** | נקה וסיים | הסר משאבים בבטחה עם `azd down --purge` | 15 דקות |
| **7. סיכום** | צעדים הבאים | סקור הישגים, מושגים מרכזיים, והמשך הלמידה | 15 דקות |

**זרם הסדנה:**
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
# עקוב אחר הוראות ההתקנה ב-workshop/README.md
```

#### 🎯 תוצאי למידה בסדנה
בסיום הסדנה, המשתתפים יוכלו:
- **לפרוס יישומי AI לפרודקשן**: שימוש ב-AZD עם שירותי Microsoft Foundry
- **להבין ארכיטקטורות רב-סוכנים**: ליישם פתרונות אסטרטגיים עם סוכני AI
- **ליישם שיטות אבטחה מיטביות**: קונפיגורציית אימות ובקרת גישה
- **לאופטמץ לפריסה רחבה**: תכנון פריסות חסכוניות וביצועיות
- **לפתור תקלות בפריסה**: לפתור בעיות נפוצות באופן עצמאי

#### 📖 משאבי הסדנה
- **🎥 מדריך אינטראקטיבי**: [חומרי הסדנה](workshop/README.md) - סביבת למידה בדפדפן
- **📋 הוראות לפי מודול**:
  - [0. הקדמה](workshop/docs/instructions/0-Introduction.md) - סקירה ומטרות הסדנה
  - [1. בחירה](workshop/docs/instructions/1-Select-AI-Template.md) - מצא ובחר תבניות AI
  - [2. אימות](workshop/docs/instructions/2-Validate-AI-Template.md) - פרוס ואמת תבניות
  - [3. פירוק](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - חקור ארכיטקטורת תבניות
  - [4. קונפיגורציה](workshop/docs/instructions/4-Configure-AI-Template.md) - שלוט על azure.yaml
  - [5. התאמה אישית](workshop/docs/instructions/5-Customize-AI-Template.md) - התאם לתרחיש שלך
  - [6. פירוק](workshop/docs/instructions/6-Teardown-Infrastructure.md) - נקה משאבים
  - [7. סיכום](workshop/docs/instructions/7-Wrap-up.md) - סקירה וצעדים הבאים
- **🛠️ מעבדת AI בסדנה**: [מעבדת AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - תרגילים ממוקדי AI
- **💡 התחלה מהירה**: [מדריך התקנת הסדנה](workshop/README.md#quick-start) - הגדרות סביבה

**מומלץ ל**: הכשרות ארגוניות, קורסים אקדמיים, למידה עצמית ומתודולוגיות האצה למפתחים.

---

## 📖 העמקה: יכולות AZD

מעבר ליסודות, AZD מספקת תכונות חזקות לפריסות ייצור:

- **פריסות מבוססות תבניות** - שימוש בתבניות מוכנות לדפוסי יישום נפוצים
- **תשתית כקוד** - ניהול משאבי Azure באמצעות Bicep או Terraform  
- **זרימות עבודה משולבות** - אספקה, פריסה וניטור חלקים של היישום
- **מותאם למפתחים** - אופטימיזציה לפרודוקטיביות וחוויית הפיתוח

### **AZD + Microsoft Foundry: פתרון מושלם לפריסות AI**

**למה AZD לפתרונות AI?** AZD מתמודד עם האתגרים המרכזיים של מפתחי AI:

- **תבניות מוכנות ל-AI** - תבניות מוכנות מראש ל-Microsoft Foundry Models, Cognitive Services ו-ML
- **פריסות AI מאובטחות** - תבניות אבטחה מובנות לשירותי AI, מפתחות API וכניסות מודלים  
- **תבניות AI לפרודקשן** - שיטות עבודה מומלצות לפריסות AI חסכוניות וניתנות להרחבה
- **זרימות עבודה מקצה לקצה** - מהפיתוח ועד לפריסה עם ניטור תקין
- **אופטימיזציה בעלות** - הקצאת משאבים ומדיניות סקיילינג חכמות לעומסי AI
- **אינטגרציה עם Microsoft Foundry** - חיבור חלק לקטלוג מודלים וכניסות Foundry

---

## 🎯 ספריית תבניות ודוגמאות

### מוצגים: תבניות Microsoft Foundry
**התחל כאן אם אתה מפריס יישומי AI!**

> **הערה:** תבניות אלו ממחישות דפוסי AI שונים. חלקן דוגמאות חיצוניות של Azure, אחרות יישומים מקומיים.

| תבנית | פרק | מורכבות | שירותים | סוג |
|----------|---------|------------|----------|------|
| [**התחל עם שיחת AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | חיצוני |
| [**התחל עם סוכני AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | פרק 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| חיצוני |
| [**דמו Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | חיצוני |
| [**התחלת מהירה לאפליקציית שיחה של OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | חיצוני |
| [**סוכן OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | חיצוני |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | חיצוני |
| [**פתרון ריטייל רב-סוכני**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **מקומי** |

### מוצגים: תרחישי למידה שלמים
**תבניות יישומים מוכנות לפרודקשן המשוייכות לפרקי למידה**

| תבנית | פרק למידה | מורכבות | נקודת למידה מרכזית |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | דפוסי פריסת AI בסיסיים |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | יישום RAG עם Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | פרק 4 | ⭐⭐ | אינטגרציית אינטליגנציה למסמכים |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | מסגרת סוכנים וקריאות פונקציות |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐ | תזמור AI ארגוני |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | ארכיטקטורת רב-סוכנים עם סוכני לקוחות ומלאי |

### למידה על פי סוג דוגמה

> **📌 דוגמאות מקומיות מול חיצוניות:**  
> **דוגמאות מקומיות** (במאגר זה) = מוכנות לשימוש מיידי  
> **דוגמאות חיצוניות** (דגימות Azure) = שיכפול ממאגרים מקושרים

#### דוגמאות מקומיות (מוכנות לשימוש)
- [**פתרון ריטייל רב-סוכני**](examples/retail-scenario.md) - יישום מלא ופרודקשן עם תבניות ARM  
  - ארכיטקטורת רב-סוכנים (סוכן לקוח + סוכן מלאי)  
  - ניטור והערכה מקיפים  
  - פריסה בלחיצה אחת באמצעות תבנית ARM

#### דוגמאות מקומיות - אפליקציות מכולה (פרקים 2-5)
**דוגמאות פריסה מקיפות של מכולות במאגר זה:**  
- [**דוגמאות אפליקציה במכולה**](examples/container-app/README.md) - מדריך מלא לפריסות מבוססות מכולות  
  - [API פשוט ב-Flask](../../examples/container-app/simple-flask-api) - REST בסיסי עם סקייל לאפס  
  - [ארכיטקטורת מיקרוסרוויסים](../../examples/container-app/microservices) - פריסה מורכבת ומוכנה לפרודקשן  
  - דפוסי התחלה מהירה, ייצור ופריסה מתקדמת  
  - מדריך ניטור, אבטחה ואופטימיזציה לעלויות

#### דוגמאות חיצוניות - אפליקציות פשוטות (פרקים 1-2)
**שכפל מאגרים אלו לדוגמאות Azure להתחלה מהירה:**  
- [אפליקציית ווב פשוטה - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - דפוסי פריסה בסיסיים  
- [אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - פריסת תוכן סטטי  
- [אפליקציית מכולה - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - פריסת REST API

#### דוגמאות חיצוניות - אינטגרציית מאגרי נתונים (פרקים 3-4)  
- [אפליקציית מסד נתונים - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - תבניות חיבור למסדי נתונים  
- [פונקציות + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - זרימת עבודה של נתונים ללא שרת

#### דוגמאות חיצוניות - תבניות מתקדמות (פרקים 4-8)  
- [מיקרו-שירותים בג'אווה](https://github.com/Azure-Samples/java-microservices-aca-lab) - ארכיטקטורות מרובת שירותים  
- [משרות אפליקציות מכולות](https://github.com/Azure-Samples/container-apps-jobs) - עיבוד ברקע  
- [צינור למידת מכונה ארגוני](https://github.com/Azure-Samples/mlops-v2) - תבניות ML מוכנות לייצור

### אוספי תבניות חיצוניות  
- [**תערוכת תבניות רשמית של AZD**](https://azure.github.io/awesome-azd/) - אוסף מובחר של תבניות רשמיות וקהילתיות  
- [**תבניות Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - תיעוד תבניות ב-Microsoft Learn  
- [**ספריית דוגמאות**](examples/README.md) - דוגמאות לימוד מקומיות עם הסברים מפורטים

---

## 📚 משאבי למידה והפניות

### הפניות מהירות  
- [**גליון פקודות**](resources/cheat-sheet.md) - פקודות azd חיוניות מאורגנות לפי פרקים  
- [**מילון מונחים**](resources/glossary.md) - מונחי Azure ו-azd  
- [**שאלות נפוצות**](resources/faq.md) - שאלות נפוצות מאורגנות לפי פרקי לימוד  
- [**מדריך לימוד**](resources/study-guide.md) - תרגילים מקיפים לתרגול

### סדנאות מעשיות  
- [**סדנת AI מוזמנת**](docs/chapter-02-ai-development/ai-workshop-lab.md) - הפוך את פתרונות ה-AI שלך לידידותיים לפריסה ב-AZD (2-3 שעות)  
- [**סדנה אינטראקטיבית**](workshop/README.md) - 8 מודולים עם תרגילים מודרכים ב-MkDocs ו-GitHub Codespaces  
  - עוקבת אחרי: מבוא → בחירה → אימות → פירוק → קונפיגורציה → התאמה אישית → פירוק → סיכום

### משאבי למידה חיצוניים  
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [מחשבון תמחור של Azure](https://azure.microsoft.com/pricing/calculator/)  
- [סטטוס Azure](https://status.azure.com/)

### מיומנויות סוכן AI לעורך שלך  
- [**מיומנויות Microsoft Azure ב-skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 מיומנויות סוכן פתוחות ל-Azure AI, Foundry, פריסה, אבחון, אופטימיזציית עלויות ועוד. התקן אותן ב-GitHub Copilot, Cursor, Claude Code או כל סוכן נתמך:  
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```
  
---

## 🔧 מדריך פתרון בעיות מהיר

**בעיות נפוצות שמתחילים נתקלים בהן והפתרונות המיידיים:**

<details>
<summary><strong>❌ "azd: פקודה לא נמצאה"</strong></summary>

```bash
# התקן את AZD קודם
# ווינדוס (PowerShell):
winget install microsoft.azd

# מק:
brew tap azure/azd && brew install azd

# לינוקס:
curl -fsSL https://aka.ms/install-azd.sh | bash

# אמת את ההתקנה
azd version
```
</details>

<details>
<summary><strong>❌ "לא נמצא מנוי" או "מנוי לא הוגדר"</strong></summary>

```bash
# רשום מנויים זמינים
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
<summary><strong>❌ "InsufficientQuota" או "החרגת מכסת משאבים"</strong></summary>

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
# אפשרות 1: נקו ונסו שוב
azd down --force --purge
azd up

# אפשרות 2: תקנו רק את התשתית
azd provision

# אפשרות 3: בדקו סטטוס מפורט
azd show

# אפשרות 4: בדקו יומנים ב-Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "אימות נכשל" או "אסימון פג תוקף"</strong></summary>

```bash
# התחבר מחדש עבור AZD
azd auth logout
azd auth login

# אופציונלי: רענן גם את Azure CLI אם אתה מריץ פקודות az
az logout
az login

# אמת את ההתחברות
az account show
```
</details>

<details>
<summary><strong>❌ "המשאב כבר קיים" או בעיות שמות</strong></summary>

```bash
# AZD מייצר שמות ייחודיים, אבל אם יש התנגשות:
azd down --force --purge

# אז יש לנסות שוב עם סביבה חדשה
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ פריסת תבנית לוקחת זמן רב מדי</strong></summary>

**זמני המתנה רגילים:**  
- אפליקציית ווב פשוטה: 5-10 דקות  
- אפליקציה עם מסד נתונים: 10-15 דקות  
- יישומי AI: 15-25 דקות (פריסת OpenAI איטית)  

```bash
# בדוק את ההתקדמות
azd show

# אם תקוע >30 דקות, בדוק את פורטל Azure:
azd monitor --overview
# חפש פריסות שנכשלו
```
</details>

<details>
<summary><strong>❌ "הרשאה נדחתה" או "אסור"</strong></summary>

```bash
# בדוק את התפקיד שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# אתה צריך לפחות תפקיד "תורם"
# בקש ממנהל ה-Azure שלך להעניק:
# - תורם (למשאבים)
# - מנהל גישה למשתמשים (להקצאת תפקידים)
```
</details>

<details>
<summary><strong>❌ לא מצליחים למצוא את כתובת ה-URL של האפליקציה שפורסה</strong></summary>

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

### 📚 משאבי פתרון בעיות מלאים

- **מדריך בעיות נפוצות:** [פתרונות מפורטים](docs/chapter-07-troubleshooting/common-issues.md)  
- **בעיות ספציפיות ל-AI:** [פתרון תקלות AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)  
- **מדריך דיבוג:** [דיבוג שלב אחר שלב](docs/chapter-07-troubleshooting/debugging.md)  
- **קבל עזרה:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 סיום הקורס והסמכה

### מעקב התקדמות  
עקוב אחרי התקדמות הלמידה שלך בכל פרק:

- [ ] **פרק 1**: יסודות ותחילת עבודה ✅  
- [ ] **פרק 2**: פיתוח עם AI ראשוני ✅  
- [ ] **פרק 3**: קונפיגורציה ואימות ✅  
- [ ] **פרק 4**: תשתית כקוד ופריסה ✅  
- [ ] **פרק 5**: פתרונות AI מרובי סוכנים ✅  
- [ ] **פרק 6**: אימות ותכנון לפני פריסה ✅  
- [ ] **פרק 7**: פתרון תקלות ודיבוג ✅  
- [ ] **פרק 8**: תבניות ייצור וארגוניות ✅

### אימות ידע  
לאחר סיום כל פרק, אמת את הידע שלך על ידי:  
1. **תרגיל מעשי**: השלמת פריסת הפרק  
2. **בדיקת ידע**: עיון בחלק השאלות הנפוצות של אותו פרק  
3. **דיון קהילתי**: שתף את חוויותיך ב-Azure Discord  
4. **המשך לפרק הבא**: עבור לשלב המורכבות הבא

### יתרונות סיום הקורס  
בסיום כל הפרקים תקבל:  
- **ניסיון בייצור**: פרסת יישומי AI אמיתיים ב-Azure  
- **מיומנויות מקצועיות**: יכולות פריסה מוכנות לארגון  
- **הכרה קהילתית**: חבר פעיל בקהילת מפתחי Azure  
- **קידום מקצועי**: מומחיות נדרשת בפריסת AZD ו-AI

---

## 🤝 קהילה ותמיכה

### קבל עזרה ותמיכה  
- **בעיות טכניות**: [דווח על באגים ובקש תכונות](https://github.com/microsoft/azd-for-beginners/issues)  
- **שאלות ללמידה**: [קהילת Microsoft Azure Discord](https://discord.gg/microsoft-azure) ו-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **עזרה ספציפית ל-AI**: הצטרף ל-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **תיעוד**: [תיעוד רשמי של Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### תובנות קהילתיות מ-Microsoft Foundry Discord

**תוצאות סקרים אחרונים מערוץ #Azure:**  
- **45%** מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI  
- **אתגרים מרכזיים**: פריסות מרובות שירותים, ניהול הרשאות, מוכנות לייצור  
- **המבוקשים ביותר**: תבניות ספציפיות ל-AI, מדריכי פתרון תקלות, שיטות עבודה מומלצות

**הצטרף לקהילה שלנו כדי:**  
- לשתף את חוויות ה-AZD + AI שלך ולקבל עזרה  
- לקבל גישה מוקדמת לתבניות AI חדשות  
- לתרום לשיטות עבודה מומלצות בפריסת AI  
- להשפיע על פיתוח פיצ'רים עתידיים של AI + AZD

### תרומה לקורס  
נשמח לתרומות! אנא קרא את [מדריך התרומה שלנו](CONTRIBUTING.md) לפרטים על:  
- **שיפורי תוכן**: שדרוג פרקים ודוגמאות קיימות  
- **דוגמאות חדשות**: הוספת תסריטים ותבניות מהעולם האמיתי  
- **תרגום**: סיוע בשמירת תמיכה ברב-לשוניות  
- **דיווח על באגים**: שיפור הדיוק והבהירות  
- **סטנדרטים קהילתיים**: עמידה בקווי הנחיה לקהילה מכילה

---

## 📄 מידע על הקורס

### רישיון  
הפרויקט מכוסה ברישיון MIT - ראה את קובץ [LICENSE](../../LICENSE) לפרטים.

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
[![AI גנרטיבי (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)  

---

### למידה ליבתית  
[![ML למתחילים](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![מדעי הנתונים למתחילים](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![בינה מלאכותית למתחילים](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![סייברסקיוריטי למתחילים](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![פיתוח ווב למתחילים](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT למתחילים](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![פיתוח XR למתחילים](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת קופיילוט
[![קופיילוט לתכנות זוגי עם AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![קופיילוט ל-C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![הרפתקת קופיילוט](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ניווט בקורס

**🚀 מוכנים להתחיל ללמוד?**

**מתחילים**: התחילו ב[פרק 1: יסודות והתחלה מהירה](#-chapter-1-foundation--quick-start)  
**מפתחי בינה מלאכותית**: קפצו ל[פרק 2: פיתוח עם בינה מלאכותית - מומלץ למפתחים בתחום](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**מפתחים מנוסים**: התחילו ב[פרק 3: תצורה ואימות](#️-chapter-3-configuration--authentication)

**השלבים הבאים**: [התחל פרק 1 - יסודות AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. יש לראות במסמך המקורי בשפת המקור את המקור הסמכותי. למידע קריטי מומלץ להיעזר בתרגום מקצועי של אדם. אנו לא נישא באחריות לכל אי הבנה או פרשנות שגויה הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->