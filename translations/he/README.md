<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T13:04:14+00:00",
  "source_file": "README.md",
  "language_code": "he"
}
-->
# AZD למתחילים: מסע למידה מובנה

![AZD-for-beginners](../../../../translated_images/he/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## התחלת הקורס הזה

עקוב אחרי השלבים כדי להתחיל את מסע הלמידה שלך עם AZD:

1. **פצל את המאגר**: לחץ על [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **שכפל את המאגר**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **הצטרף לקהילה**: [קהילות Azure Discord](https://discord.com/invite/ByRwuEEgH4) לתמיכה ממומחים
4. **בחר מסלול למידה**: בחר פרק שמתאים לרמת הניסיון שלך

### תמיכה בריבוי שפות

#### תרגומים אוטומטיים (תמיד מעודכנים)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](./README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **מעדיפים לשכפל באופן מקומי?**

> מאגר זה כולל יותר מ-50 תרגומים לשפות שונות, מה שמגדיל משמעותית את גודל ההורדה. כדי לשכפל ללא תרגומים, השתמש ב-sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> זה נותן לך את כל מה שצריך כדי להשלים את הקורס במהירות הורדה רבה יותר.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## מבוא לקורס

שלוט ב-Azure Developer CLI (azd) באמצעות פרקים מובנים המיועדים ללמידה מתקדמת. **מיקוד מיוחד בפריסת יישומי AI עם אינטגרציה ל-Microsoft Foundry.**

### למה הקורס הזה חיוני למפתחים מודרניים

בהתבסס על תובנות מקהילת Microsoft Foundry ב-Discord, **45% מהמפתחים רוצים להשתמש ב-AZD עבור עומסי עבודה של AI** אך נתקלים באתגרים עם:
- ארכיטקטורות AI מורכבות מרובות שירותים
- שיטות הטובות ביותר לפריסת AI בפרודקשן  
- אינטגרציה וקונפיגורציה של שירותי Azure AI
- אופטימיזציית עלויות לעומסי עבודה של AI
- פתרון בעיות ייחודיות לפריסות AI

### מטרות הלמידה

על ידי השלמת קורס מובנה זה, תלמד:
- **שליטה ביסודות AZD**: מושגים מרכזיים, התקנה וקונפיגורציה
- **פריסת יישומי AI**: שימוש ב-AZD עם שירותי Microsoft Foundry
- **יישום תשתית כקוד**: ניהול משאבי Azure עם תבניות Bicep
- **פתרונות בעיות בפריסה**: פתרון תקלות ו-debug
- **אופטימיזציה לפרודקשן**: אבטחה, סקיילינג, ניטור וניהול עלויות
- **בניית פתרונות רב-סוכניים**: פריסה של ארכיטקטורות AI מורכבות

## 📚 פרקי לימוד

*בחר את מסלול הלמידה שלך בהתאם לרמת הניסיון והמטרות*

### 🚀 פרק 1: יסודות והתחלה מהירה  
**דרישות מוקדמות**: מנוי Azure, ידע בסיסי בשורת פקודה  
**משך זמן**: 30-45 דקות  
**רמת מורכבות**: ⭐

#### מה תלמד
- הבנת יסודות Azure Developer CLI
- התקנת AZD בפלטפורמה שלך
- הפריסה הראשונה המוצלחת שלך

#### משאבי למידה  
- **🎯 התחל כאן**: [מה זה Azure Developer CLI?](../..)
- **📖 תיאוריה**: [יסודות AZD](docs/getting-started/azd-basics.md) - מושגים וטרמינולוגיה מרכזית  
- **⚙️ התקנה**: [התקנה והגדרה](docs/getting-started/installation.md) - מדריכים ספציפיים לפלטפורמה  
- **🛠️ תרגול מעשי**: [הפרויקט הראשון שלך](docs/getting-started/first-project.md) - הדרכה שלב-אחר-שלב  
- **📋 הפניה מהירה**: [גליון פקודות](resources/cheat-sheet.md)

#### תרגילים מעשיים  
```bash
# בדיקת התקנה מהירה
azd version

# פרסם את היישום הראשון שלך
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 תוצאה לפרק**: פריסת יישום ווב פשוט ל-Azure באמצעות AZD בהצלחה

**✅ אימות הצלחה:**  
```bash
# לאחר השלמת פרק 1, עליך להיות מסוגל:
azd version              # מציג את הגרסה המותקנת
azd init --template todo-nodejs-mongo  # מאתחל את הפרויקט
azd up                  # מפיץ ל-Azure
azd show                # מציג את כתובת ה-URL של האפליקציה הפועלת
# האפליקציה נפתחת בדפדפן ופועלת
azd down --force --purge  # מנקה משאבים
```
  
**📊 השקעת זמן:** 30-45 דקות  
**📈 רמת מיומנות לאחר:** מסוגל לפרוס יישומים בסיסיים באופן עצמאי

**✅ אימות הצלחה:**  
```bash
# לאחר שסיימת את פרק 1, תוכל ל:
azd version              # מציג גרסה מותקנת
azd init --template todo-nodejs-mongo  # מאתחל פרויקט
azd up                  # מפרסם לאזור
azd show                # מציג את כתובת האפליקציה הפועלת
# האפליקציה נפתחת בדפדפן ופועלת
azd down --force --purge  # מנקה משאבים
```
  
**📊 השקעת זמן:** 30-45 דקות  
**📈 רמת מיומנות לאחר:** מסוגל לפרוס יישומים בסיסיים באופן עצמאי

---

### 🤖 פרק 2: פיתוח AI-ראשון (מומלץ למפתחי AI)  
**דרישות מוקדמות**: פרק 1 הושלם  
**משך זמן**: שעה-שעתיים  
**רמת מורכבות**: ⭐⭐

#### מה תלמד
- אינטגרציה עם Microsoft Foundry באמצעות AZD
- פריסת יישומים מופעלי AI
- הבנת קונפיגורציות שירותי AI

#### משאבי למידה  
- **🎯 התחל כאן**: [אינטגרציית Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)  
- **📖 תבניות**: [פריסת מודל AI](docs/microsoft-foundry/ai-model-deployment.md) - פרוס ונהל מודלי AI  
- **🛠️ סדנה**: [מעבדת סדנת AI](docs/microsoft-foundry/ai-workshop-lab.md) - הפוך את פתרונות ה-AI שלך ל-AZD-מוכנים  
- **🎥 מדריך אינטראקטיבי**: [חומרי סדנה](workshop/README.md) - למידה בדפדפן עם MkDocs * סביבה DevContainer  
- **📋 תבניות**: [תבניות של Microsoft Foundry](../..)  
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
  
**💡 תוצאה לפרק**: פריסת ותצורה של יישום שיחה מופעל AI עם יכולות RAG

**✅ אימות הצלחה:**  
```bash
# לאחר פרק 2, תוכל ל:
azd init --template azure-search-openai-demo
azd up
# לבדוק את ממשק השיחה של ה-AI
# לשאול שאלות ולקבל תגובות מונעות על ידי AI עם מקורות
# לאמת שהאינטגרציה עם החיפוש פועלת
azd monitor  # לבדוק ש-Application Insights מציג נתוני טלמטריה
azd down --force --purge
```
  
**📊 השקעת זמן:** שעה-שעתיים  
**📈 רמת מיומנות לאחר:** מסוגל לפרוס ולתצור יישומי AI מוכנים לפרודקשן  
**💰 מודעות לעלות:** הבנת עלויות פיתוח חודשיות של $80-150, ועלויות פרודקשן של $300-3500

#### 💰 שיקולי עלות לפריסות AI

**סביבת פיתוח (הערכת עלות $80-150 לחודש):**  
- Azure OpenAI (תשלום לפי שימוש): $0-50 לחודש (בהתבסס על שימוש בטוקנים)  
- AI Search (רמה בסיסית): $75 לחודש  
- Container Apps (צריכה): $0-20 לחודש  
- אחסון (סטנדרטי): $1-5 לחודש

**סביבת פרודקשן (הערכת עלות $300-3,500+ לחודש):**  
- Azure OpenAI (PTU לביצועים עקביים): $3,000+ לחודש או תשלום לפי שימוש עם נפח גבוה  
- AI Search (רמה סטנדרטית): $250 לחודש  
- Container Apps (ייעודיות): $50-100 לחודש  
- Application Insights: $5-50 לחודש  
- אחסון (פרימיום): $10-50 לחודש

**💡 טיפים לאופטימיזציה של עלויות:**  
- השתמש ב-**רמה חינמית** של Azure OpenAI ללמידה (כולל 50,000 טוקנים לחודש)  
- הרץ `azd down` כדי לשחרר משאבים כשאינך בפיתוח פעיל  
- התחל בחשבון צריכה, שדרג ל-PTU רק לפרודקשן  
- השתמש ב-`azd provision --preview` להערכת עלויות לפני פריסה  
- אפשר סקיילינג אוטומטי: תשלם רק על השימוש האמיתי

**ניטור עלויות:**  
```bash
# בדוק עלויות חודשיות משוערות
azd provision --preview

# נטר עלויות בפועל בפורטל Azure
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ פרק 3: קונפיגורציה ואימות  
**דרישות מוקדמות**: פרק 1 הושלם  
**משך זמן**: 45-60 דקות  
**רמת מורכבות**: ⭐⭐

#### מה תלמד
- קונפיגורציה וניהול סביבות  
- אימות ואבטחה מיטביים  
- שמות וארגון משאבים

#### משאבי למידה  
- **📖 קונפיגורציה**: [מדריך קונפיגורציה](docs/getting-started/configuration.md) - הגדרת סביבה  
- **🔐 אבטחה**: [תבניות אימות וזהות מנוהלת](docs/getting-started/authsecurity.md) - תבניות אימות  
- **📝 דוגמאות**: [דוגמת אפליקציית מסד נתונים](examples/database-app/README.md) - דוגמאות AZD למסדי נתונים

#### תרגילים מעשיים  
- הגדר סביבות מרובות (פיתוח, סטייג', פרודקשן)  
- הקם אימות עם זהות מנוהלת  
- יישם קונפיגורציות ייחודיות לסביבה

**💡 תוצאה לפרק**: ניהול סביבות מרובות עם אימות ואבטחה נאותים

---

### 🏗️ פרק 4: תשתית כקוד ופריסה  
**דרישות מוקדמות**: פרקים 1-3 הושלמו  
**משך זמן**: שעה-שעה וחצי  
**רמת מורכבות**: ⭐⭐⭐

#### מה תלמד
- תבניות פריסה מתקדמות  
- תשתית כקוד עם Bicep  
- אסטרטגיות פריסת משאבים

#### משאבי למידה  
- **📖 פריסה**: [מדריך פריסה](docs/deployment/deployment-guide.md) - זרימות עבודה מלאות  
- **🏗️ הקצאת משאבים**: [הקצאת משאבים](docs/deployment/provisioning.md) - ניהול משאבי Azure  
- **📝 דוגמאות**: [דוגמת Container App](../../examples/container-app) - פריסות בקונטיינרים

#### תרגילים מעשיים  
- צור תבניות Bicep מותאמות  
- פרוס יישומים מרובי שירותים  
- יישם אסטרטגיות פריסת blue-green

**💡 תוצאה לפרק**: פריסת יישומים מורכבים מרובי שירותים באמצעות תבניות תשתית מותאמות

---

### 🎯 פרק 5: פתרונות AI רב-סוכניים (מתקדם)  
**דרישות מוקדמות**: פרקים 1-2 הושלמו  
**משך זמן**: 2-3 שעות  
**רמת מורכבות**: ⭐⭐⭐⭐

#### מה תלמד
- תבניות ארכיטקטורה רב-סוכנית

- תיאום ותיאום סוכנים  
- פריסות AI מוכנות לייצור  

#### משאבי למידה  
- **🤖 פרויקט מוצג**: [פתרון ריבוי-סוכנים קמעונאי](examples/retail-scenario.md) - יישום מלא  
- **🛠️ תבניות ARM**: [חבילת תבניות ARM](../../examples/retail-multiagent-arm-template) - פריסה בלחיצה אחת  
- **📖 ארכיטקטורה**: [דפוסי תיאום ריבוי-סוכנים](/docs/pre-deployment/coordination-patterns.md) - דפוסים  

#### תרגילים פרקטיים  
```bash
# לפרוס את פתרון סוכני הקמעונאות המרובי השלם
cd examples/retail-multiagent-arm-template
./deploy.sh

# לחקור תצורות סוכן
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 תוצאת הפרק**: פרוס ונהל פתרון AI ריבוי-סוכנים מוכן לייצור עם סוכני לקוחות ומלאי  

---

### 🔍 פרק 6: אימות ותכנון טרום-פריסה  
**דרישות קדם**: פרק 4 הושלם  
**משך**: שעה אחת  
**מורכבות**: ⭐⭐  

#### מה תלמד  
- תכנון קיבולת ואימות משאבים  
- אסטרטגיות בחירת SKU  
- בדיקות טרום-טיסה ואוטומציה  

#### משאבי למידה  
- **📊 תכנון**: [תכנון קיבולת](docs/pre-deployment/capacity-planning.md) - אימות משאבים  
- **💰 בחירה**: [בחירת SKU](docs/pre-deployment/sku-selection.md) - בחירות חסכוניות  
- **✅ אימות**: [בדיקות טרום-טיסה](docs/pre-deployment/preflight-checks.md) - תסריטים אוטומטיים  

#### תרגילים פרקטיים  
- הפעלת סקריפטים לאימות קיבולת  
- אופטימיזציה לבחירת SKU עבור עלות  
- יישום בדיקות אוטומטיות טרום-פריסה  

**💡 תוצאת הפרק**: אמת ואופטם פריסות לפני ביצוע  

---

### 🚨 פרק 7: פתרון תקלות ואיתור שגיאות  
**דרישות קדם**: כל פרק פריסה שהושלם  
**משך**: 1-1.5 שעות  
**מורכבות**: ⭐⭐  

#### מה תלמד  
- גישות שיטתיות לאיתור שגיאות  
- בעיות נפוצות ופתרונותיהן  
- פתרון תקלות ייעודי ל-AI  

#### משאבי למידה  
- **🔧 בעיות נפוצות**: [בעיות נפוצות](docs/troubleshooting/common-issues.md) - שאלות נפוצות ופתרונות  
- **🕵️ איתור שגיאות**: [מדריך איתור שגיאות](docs/troubleshooting/debugging.md) - אסטרטגיות שלב-אחר-שלב  
- **🤖 בעיות AI**: [פתרון תקלות ספציפי ל-AI](docs/troubleshooting/ai-troubleshooting.md) - בעיות שירות AI  

#### תרגילים פרקטיים  
- אבחנת כישלונות פריסה  
- פתרון בעיות אימות  
- איתור שגיאות בחיבור לשירות AI  

**💡 תוצאת הפרק**: אבחן ופתור בעיות פריסה נפוצות בעצמך  

---

### 🏢 פרק 8: דפוסי ייצור וארגוניים  
**דרישות קדם**: פרקים 1-4 הושלמו  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐  

#### מה תלמד  
- אסטרטגיות פריסת ייצור  
- דפוסי אבטחה ארגוניים  
- ניטור ואופטימיזציה של עלויות  

#### משאבי למידה  
- **🏭 ייצור**: [שיטות עבודה מומלצות AI לייצור](docs/microsoft-foundry/production-ai-practices.md) - דפוסי ארגון  
- **📝 דוגמאות**: [דוגמאות מיקרו-שירותים](../../examples/microservices) - ארכיטקטורות מורכבות  
- **📊 ניטור**: [אינטגרציית Application Insights](docs/pre-deployment/application-insights.md) - ניטור  

#### תרגילים פרקטיים  
- יישום דפוסי אבטחה ארגוניים  
- הקמת ניטור מקיף  
- פריסה לייצור עם ממשל תקין  

**💡 תוצאת הפרק**: פרוס יישומים מוכנים ארגונית עם יכולות ייצור מלאות  

---

## 🎓 סקירת סדנה: חווית למידה מעשית  

> **⚠️ מצב הסדנה: בפיתוח פעיל**  
> חומרי הסדנה בפיתוח ושיפור כרגע. מודולים מרכזיים פונקציונליים, אך חלק מקטעים מתקדמים לא שלמים. אנו עובדים להשלמת כל התוכן. [עקוב אחרי ההתקדמות →](workshop/README.md)  

### חומרי סדנה אינטראקטיביים  
**למידה מעשית מקיפה עם כלים בדפדפן ותרגילים מודרכים**  

חומרי הסדנה שלנו מספקים חווית למידה אינטראקטיבית ומובנית שמשלימה את תוכנית הלימודים לפי הפרקים לעיל. הסדנה מיועדת ללמידה בקצב עצמי ולמפגשים בהנחיה.  

#### 🛠️ תכונות הסדנה  
- **ממשק מבוסס דפדפן**: סדנת MkDocs מלאה עם חיפוש, העתקה ותכונות נושא  
- **אינטגרציה עם GitHub Codespaces**: הקמת סביבת פיתוח בלחיצה  
- **מסלול למידה מובנה**: 7 תרגילים מודרכים (3.5 שעות בסך הכל)  
- **גילוי → פריסה → התאמה אישית**: מתודולוגיה הדרגתית  
- **סביבת DevContainer אינטראקטיבית**: כלים ותלויות מוגדרים מראש  

#### 📚 מבנה הסדנה  
הסדנה פועלת לפי מתודולוגיית **גילוי → פריסה → התאמה אישית**:  

1. **שלב הגילוי** (45 דקות)  
   - חקר תבניות ושירותי Microsoft Foundry  
   - הבנת דפוסי ארכיטקטורת ריבוי-סוכנים  
   - סקירת דרישות ודרישות מוקדמות לפריסה  

2. **שלב הפריסה** (שעתיים)  
   - פריסה מעשית של יישומי AI עם AZD  
   - קונפיגורציה של שירותי Azure AI וקצוות  
   - יישום דפוסי אבטחה ואימות  

3. **שלב ההתאמה האישית** (45 דקות)  
   - שינוי יישומים למקרים ספציפיים  
   - אופטימיזציה לפריסת ייצור  
   - יישום ניטור וניהול עלויות  

#### 🚀 התחלת עבודה עם הסדנה  
```bash
# אפשרות 1: GitHub Codespaces (מומלץ)
# לחץ על "קוד" → "יצירת codespace על main" במאגר

# אפשרות 2: פיתוח מקומי
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# עקוב אחר הוראות ההתקנה בקובץ workshop/README.md
```
  
#### 🎯 תוצאות למידה בסדנה  
בהשלמת הסדנה, המשתתפים יוכלו:  
- **לפרוס יישומי AI בייצור**: שימוש ב-AZD עם שירותי Microsoft Foundry  
- **להתמחות בארכיטקטורות ריבוי-סוכנים**: יישום פתרונות AI מתואמים  
- **ליישם שיטות אבטחה מיטביות**: קונפיגורציה של אימות ושליטה בגישה  
- **לאופטם לפריסה בקנה מידה**: עיצוב פריסות חסכוניות וביצועיות  
- **לפתור תקלות פריסה**: פתרון בעיות יזום ועצמאי  

#### 📖 משאבי הסדנה  
- **🎥 מדריך אינטראקטיבי**: [חומרי סדנה](workshop/README.md) - סביבת למידה מבוססת דפדפן  
- **📋 הוראות שלב-אחר-שלב**: [תרגילים מודרכים](../../workshop/docs/instructions) - סיורים מפורטים  
- **🛠️ מעבדת AI בסדנה**: [מעבדת AI בסדנה](docs/microsoft-foundry/ai-workshop-lab.md) - תרגילים ממוקדי AI  
- **💡 התחלה מהירה**: [מדריך הגדרת סדנה](workshop/README.md#quick-start) - קונפיגורציית סביבה  

**מתאים ל**: הדרכות ארגוניות, קורסי אוניברסיטה, למידה עצמאית ומחנות מפתחים.  

---

## 📖 מה זה Azure Developer CLI?  

Azure Developer CLI (azd) הוא ממשק שורת פקודה למפתחים שמאיץ את תהליך הבנייה והפריסה של יישומים ב-Azure. הוא מספק:  

- **פריסות מבוססות תבניות** - שימוש בתבניות מוכנות לדפוסי יישום נפוצים  
- **תשתית כקוד** - ניהול משאבים ב-Azure בעזרת Bicep או Terraform  
- **זרימות עבודה משולבות** - פריסה, ניהול וניטור אפליקציות בצורה חלקה  
- **ידידותי למפתחים** - מותאם לפרודוקטיביות ולחוויית המפתח  

### **AZD + Microsoft Foundry: מושלם לפריסות AI**  

**למה AZD לפתרונות AI?** AZD מתמודד עם האתגרים המרכזיים של מפתחי AI:  

- **תבניות מוכנות ל-AI** - תבניות מוגדרות מראש ל-Azure OpenAI, שירותי Cognitive וגם עומסי עבודה ML  
- **פריסות AI מאובטחות** - דפוסי אבטחה מובנים לשירותי AI, מפתחות API וקצוות מודלים  
- **דפוסי AI לייצור** - שיטות עבודה מומלצות לפריסות AI חסכוניות ומדרגות  
- **זרימות עבודה מקצה לקצה ל-AI** - מפיתוח מודלים ועד פריסה בייצור עם ניטור תקין  
- **אופטימיזציה של עלויות** - הקצאת משאבים חכמה ואסטרטגיות מדרוג לעומסי AI  
- **אינטגרציה עם Microsoft Foundry** - חיבור חלק למאגרי דגמי Foundry וקצוות  

---

## 🎯 ספריית תבניות ודוגמאות  

### לקט: תבניות Microsoft Foundry  
**התחל כאן אם אתה מפרוס יישומי AI!**  

> **הערה:** תבניות אלו ממחישות דפוסי AI שונים. חלקן הן דוגמאות Azure חיצוניות, אחרות יישומים מקומיים.  

| תבנית | פרק | מורכבות | שירותים | סוג |  
|----------|---------|------------|----------|------|  
| [**התחל עם שיחת AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | חיצוני |  
| [**התחל עם סוכני AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | פרק 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| חיצוני |  
| [**דמו Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | חיצוני |  
| [**התחלת מהירה לאפליקציית שיחה OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | חיצוני |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | חיצוני |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | חיצוני |  
| [**פתרון ריבוי-סוכנים קמעונאי**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **מקומי** |  

### לקט: תרחישי למידה מלאים  
**תבניות יישום מוכנות לייצור המותאמות לפרקי למידה**  

| תבנית | פרק למידה | מורכבות | מפתח למידה |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | דפוסי פריסה בסיסיים של AI |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | יישום RAG עם Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | פרק 4 | ⭐⭐ | אינטגרציית מודיעין מסמכים |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | מסגרת סוכן ופונקציות קריאה |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐ | תיאום AI ארגוני |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | ארכיטקטורת ריבוי-סוכנים עם סוכני לקוח ומלאי |  

### למידה לפי סוג דוגמה  

> **📌 דוגמאות מקומיות לעומת חיצוניות:**  
> **דוגמאות מקומיות** (ריפו זה) = מוכנות לשימוש מיידי  
> **דוגמאות חיצוניות** (Azure Samples) = שיבוט מהריפוזיטוריות המקושרות  

#### דוגמאות מקומיות (מוכנות לשימוש)  
- [**פתרון ריבוי-סוכנים קמעונאי**](examples/retail-scenario.md) - יישום מלא מוכן לייצור עם תבניות ARM  
  - ארכיטקטורת ריבוי-סוכנים (לקוח + מלאי)  
  - ניטור והערכה מקיפים  
  - פריסה בלחיצה אחת דרך תבנית ARM  

#### דוגמאות מקומיות - יישומי מכולות (פרקים 2-5)  
**דוגמאות פריסה מלאות של מכולות במאגר זה:**  
- [**דוגמאות יישומים במכולות**](examples/container-app/README.md) - מדריך מלא לפריסות מכולות  
  - [API Flask פשוט](../../examples/container-app/simple-flask-api) - REST בסיסי עם מדרג לאפס  
  - [ארכיטקטורת מיקרו-שירותים](../../examples/container-app/microservices) - פריסת ריבוי-שירותים מוכנה לייצור  
  - דפוסי פריסה התחלה מהירה, ייצור ומתקדמים  
  - הנחיות לניטור, אבטחה ואופטימיזציה של עלויות  

#### דוגמאות חיצוניות - יישומים פשוטים (פרקים 1-2)  
**שבט מאגרים אלה כדי להתחיל:**  
- [אפליקציית ווב פשוטה - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - דפוסי פריסה בסיסיים  
- [אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - פריסת תוכן סטטי  
- [אפליקציית מכולות - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - פריסת REST API  

#### דוגמאות חיצוניות - אינטגרציית מסד נתונים (פרקים 3-4)  
- [אפליקציה למסד נתונים - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - דפוסי חיבור למסד נתונים  
- [פונקציות + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - זרימת עבודה ללא שרת  

#### דוגמאות חיצוניות - דפוסים מתקדמים (פרקים 4-8)  
- [מיקרו-שירותים ב-Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - ארכיטקטורות ריבוי-שירותים  
- [עבודות אפליקציות מכולות](https://github.com/Azure-Samples/container-apps-jobs) - עיבוד ברקע  
- [צנרת ML ארגונית](https://github.com/Azure-Samples/mlops-v2) - דפוסי ML מוכנים לייצור  

### אוספי תבניות חיצוניים  
- [**גלריית תבניות רשמית של AZD**](https://azure.github.io/awesome-azd/) - אוסף מתומצת של תבניות רשמיות וקהילתיות  
- [**תבניות Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - תיעוד תבניות של Microsoft Learn
- [**תיקיית דוגמאות**](examples/README.md) - דוגמאות למידה מקומיות עם הסברים מפורטים

---

## 📚 משאבי למידה והפניות

### הפניות מהירות
- [**דף פקודות עזר**](resources/cheat-sheet.md) - פקודות azd חיוניות מאורגנות לפי פרק  
- [**מונחים**](resources/glossary.md) - מונחים של Azure ו-azd  
- [**שאלות נפוצות**](resources/faq.md) - שאלות נפוצות מאורגנות לפי פרק לימוד  
- [**מדריך לימוד**](resources/study-guide.md) - תרגילים מקיפים

### סדנאות מעשיות
- [**מעבדת סדנת AI**](docs/microsoft-foundry/ai-workshop-lab.md) - הפוך את פתרונות ה-AI שלך לפרוסים עם AZD (שעתיים-שלוש)  
- [**מדריך סדנה אינטראקטיבית**](workshop/README.md) - סדנה בדפדפן עם MkDocs וסביבת DevContainer  
- [**מסלול למידה מובנה**](../../workshop/docs/instructions) - 7 צעדים של תרגילים מודרכים (גילוי → פריסה → התאמה אישית)  
- [**סדנת AZD למתחילים**](workshop/README.md) - חומרי סדנה מעשית עם אינטגרציה ל-GitHub Codespaces

### משאבי למידה חיצוניים
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [מרכז ארכיטקטורת Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [מחשבון מחירים של Azure](https://azure.microsoft.com/pricing/calculator/)  
- [סטטוס Azure](https://status.azure.com/)

---

## 🔧 מדריך פתרון בעיות מהיר

**בעיות נפוצות שמתחילים נתקלים בהן ופתרונות מיידיים:**

### ❌ "azd: הפקודה לא נמצאה"

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

### ❌ "לא נמצאה מנוי" או "המנוי לא מוגדר"

```bash
# רשום מנויים זמינים
az account list --output table

# הגדר מנוי ברירת מחדל
az account set --subscription "<subscription-id-or-name>"

# הגדר לסביבת AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# אמת
az account show
```

### ❌ "InsufficientQuota" או "חריגה ממונה"

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

### ❌ "azd up" נכשל באמצע התהליך

```bash
# אפשרות 1: לנקות ולנסות שוב
azd down --force --purge
azd up

# אפשרות 2: לתקן רק את התשתית
azd provision

# אפשרות 3: לבדוק יומנים מפורטים
azd show
azd logs
```

### ❌ "אימות נכשל" או "אסימון פג תוקף"

```bash
# לאמת מחדש
az logout
az login

azd auth logout
azd auth login

# לאמת את תהליך ההתחברות
az account show
```

### ❌ "המשאב כבר קיים" או סתירות בשמות

```bash
# AZD מייצר שמות ייחודיים, אך במקרה של קונפליקט:
azd down --force --purge

# לאחר מכן נסה שוב עם סביבה חדשה
azd env new dev-v2
azd up
```

### ❌ פריסת התבנית לוקחת יותר מדי זמן

**זמני המתנה רגילים:**
- אפליקציית ווב פשוטה: 5-10 דקות  
- אפליקציה עם בסיס נתונים: 10-15 דקות  
- יישומי AI: 15-25 דקות (הקצאת OpenAI היא איטית)

```bash
# בדוק התקדמות
azd show

# אם תקוע יותר מ-30 דקות, בדוק את פורטל Azure:
azd monitor
# חפש פריסות שנכשלו
```

### ❌ "ההרשאה נדחתה" או "אסור"

```bash
# בדוק את התפקיד שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# אתה צריך לפחות את התפקיד "משתף פעולה"
# בקש ממנהל ה-Azure שלך להעניק:
# - משתף פעולה (עבור משאבים)
# - מנהל גישת משתמשים (עבור שיוך תפקידים)
```

### ❌ לא מצליח לאתר את כתובת ה-URL של היישום הפרוס

```bash
# הצג את כל נקודות הקצה של השירות
azd show

# או פתח את פורטל Azure
azd monitor

# בדוק שירות ספציפי
azd env get-values
# חפש משתני *_URL
```

### 📚 משאבי פתרון בעיות מלאים

- **מדריך בעיות נפוצות:** [פתרונות מפורטים](docs/troubleshooting/common-issues.md)  
- **בעיות ספציפיות ל-AI:** [פתרון בעיות AI](docs/troubleshooting/ai-troubleshooting.md)  
- **מדריך ניפוי באגים:** [ניפוי באגים שלב אחר שלב](docs/troubleshooting/debugging.md)  
- **קבל עזרה:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 מדריך פתרון בעיות מהיר

**בעיות נפוצות שמתחילים נתקלים בהן ופתרונות מיידיים:**

<details>
<summary><strong>❌ "azd: הפקודה לא נמצאה"</strong></summary>

```bash
# התקן את AZD קודם
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
# רשום מנויים זמינים
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
<summary><strong>❌ "InsufficientQuota" או "חריגה ממונה"</strong></summary>

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

# אפשרות 3: לבדוק יומנים מפורטים
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "אימות נכשל" או "אסימון פג תוקף"</strong></summary>

```bash
# אימות מחדש
az logout
az login

azd auth logout
azd auth login

# אמת אימות
az account show
```
</details>

<details>
<summary><strong>❌ "המשאב כבר קיים" או סתירות בשמות</strong></summary>

```bash
# AZD מייצר שמות ייחודיים, אך אם יש התנגשות:
azd down --force --purge

# אז נסה שוב עם סביבה חדשה
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ פריסת התבנית לוקחת יותר מדי זמן</strong></summary>

**זמני המתנה רגילים:**
- אפליקציית ווב פשוטה: 5-10 דקות  
- אפליקציה עם בסיס נתונים: 10-15 דקות  
- יישומי AI: 15-25 דקות (הקצאת OpenAI היא איטית)

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

# אתה צריך לפחות תפקיד "תורם"
# בקש מהמנהל שלך ב-Azure להעניק:
# - תורם (למשאבים)
# - מנהל גישת משתמש (להקצאת תפקידים)
```
</details>

<details>
<summary><strong>❌ לא מצליח לאתר את כתובת ה-URL של היישום הפרוס</strong></summary>

```bash
# הצג את כל נקודות הקצה של השירות
azd show

# או פתח את פורטל אזור
azd monitor

# בדוק שירות ספציפי
azd env get-values
# חפש משתני *_URL
```
</details>

### 📚 משאבי פתרון בעיות מלאים

- **מדריך בעיות נפוצות:** [פתרונות מפורטים](docs/troubleshooting/common-issues.md)  
- **בעיות ספציפיות ל-AI:** [פתרון בעיות AI](docs/troubleshooting/ai-troubleshooting.md)  
- **מדריך ניפוי באגים:** [ניפוי באגים שלב אחר שלב](docs/troubleshooting/debugging.md)  
- **קבל עזרה:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 השלמת קורס והסמכה

### מעקב התקדמות
עקוב אחר התקדמות הלמידה שלך בכל פרק:

- [ ] **פרק 1**: יסודות והתחלה מהירה ✅  
- [ ] **פרק 2**: פיתוח מונחה AI ✅  
- [ ] **פרק 3**: קונפיגורציה ואימות ✅  
- [ ] **פרק 4**: תשתית כקוד ופריסה ✅  
- [ ] **פרק 5**: פתרונות AI מרובי סוכנים ✅  
- [ ] **פרק 6**: אימות ותכנון לפני פריסה ✅  
- [ ] **פרק 7**: פתרון תקלות וניפוי באגים ✅  
- [ ] **פרק 8**: תבניות ייצור וארגוניות ✅

### אימות למידה
לאחר סיום כל פרק, אמת את הידע שלך על ידי:
1. **תרגיל מעשי**: השלמת פריסת הפרק  
2. **בדיקת ידע**: עיון בסעיף ה-FAQ של הפרק  
3. **דיון בקהילה**: שתף את ניסיונך ב-Azure Discord  
4. **פרק הבא**: המשך לפרק הבא ברמת קושי גבוהה יותר

### יתרונות השלמת הקורס
בסיום כל הפרקים, תקבל:
- **ניסיון בייצור**: פרסת יישומי AI אמיתיים ל-Azure  
- **כישורים מקצועיים**: יכולות פריסה ברמה ארגונית  
- **הכרה קהילתית**: חבר פעילות בקהילת מפתחי Azure  
- **קידום קריירה**: מומחיות מבוקשת ב-AZD ופריסת AI

---

## 🤝 קהילה ותמיכה

### קבל עזרה ותמיכה
- **בעיות טכניות**: [דווח על באגים ובקש תכונות](https://github.com/microsoft/azd-for-beginners/issues)  
- **שאלות למידה**: [קהילת Discord של Microsoft Azure](https://discord.gg/microsoft-azure) ו-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **עזרה ספציפית ל-AI**: הצטרף ל-[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **תיעוד**: [תיעוד רשמי של Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### תובנות קהילה מ-Microsoft Foundry Discord

**תוצאות סקר אחרון בערוץ #Azure:**
- **45%** מהמפתחים רוצים להשתמש ב-AZD לעומסי AI  
- **האתגרים המובילים**: פריסות מרובות שירותים, ניהול הרשאות, מוכנות לייצור  
- **הבקשות הנפוצות**: תבניות ייעודיות ל-AI, מדריכי פתרון בעיות, שיטות עבודה מומלצות

**הצטרפו לקהילתנו כדי:**
- לשתף את חוויות ה-AZD + AI שלך ולקבל עזרה  
- לקבל גישה מוקדמת לתבניות AI חדשות  
- לתרום לשיטות עבודה מיטביות לפריסת AI  
- להשפיע על פיתוח תכונות עתידיות של AI + AZD

### תרומה לקורס
אנו שמחים לתרומות! קרא את [מדריך התרומה](CONTRIBUTING.md) לפרטים על:
- **שיפור תוכן**: שדרג פרקים ודוגמאות קיימות  
- **דוגמאות חדשות**: הוסף תרחישים אמיתיים ותבניות  
- **תרגום**: עזור בשימור תמיכה רב-שפתית  
- **דיווח באגים**: שפר דיוק ובהירות  
- **תקני קהילה**: עקוב אחרי קווי הנחיה כוללים

---

## 📄 מידע על הקורס

### רישיון
פרויקט זה מורשה ברישיון MIT - ראה את [LICENSE](../../LICENSE) לפרטים.

### משאבי למידה קשורים של מיקרוסופט

הצוות שלנו מפתח קורסי למידה מקיפים נוספים:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j למתחילים](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js למתחילים](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / סוכנים
[![AZD למתחילים](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI למתחילים](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP למתחילים](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![סוכני AI למתחילים](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת AI גנרטיבי  
[![AI גנרטיבי למתחילים](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![AI גנרטיבי (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
[![AI גנרטיבי (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
[![AI גנרטיבי (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### למידה בסיסית
[![ML למתחילים](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
[![מדעי הנתונים למתחילים](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI למתחילים](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![בטחון סייבר למתחילים](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![פיתוח ווב למתחילים](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT למתחילים](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![פיתוח XR למתחילים](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת קופילוט
[![קופילוט לתכנות זוגי עם AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![קופילוט ל-C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![הרפתקאות קופילוט](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ניווט הקורס

**🚀 מוכנים להתחיל ללמוד?**

**מתחילים**: התחילו ב[פרק 1: יסודות והתחלה מהירה](../..)  
**מפתחי AI**: דלגו אל [פרק 2: פיתוח ממוקד AI](../..)  
**מפתחים מנוסים**: התחילו ב[פרק 3: קונפיגורציה ואימות זהות](../..)

**השלבים הבאים**: [התחילו בפרק 1 - יסודות AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**הצהרת אחריות**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). על אף שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפת המקור כמקור הסמכות. עבור מידע קריטי מומלץ להשתמש בשירותי תרגום מקצועיים של בני אדם. איננו אחראים לכל אי-הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->