<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "068c87cc2641a81ca353ad7064ff326a",
  "translation_date": "2026-01-01T17:23:20+00:00",
  "source_file": "README.md",
  "language_code": "he"
}
-->
# AZD למתחילים: מסלול למידה מובנה

![AZD-למתחילים](../../translated_images/he/azdbeginners.5527441dd9f74068.png) 

[![עוקבים ב-GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks ב-GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![כוכבים ב-GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord של Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord של Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## איך להתחיל בקורס זה

עקוב אחרי השלבים הבאים כדי להתחיל את מסלול הלמידה שלך ב-AZD:

1. **צור Fork של המאגר**: לחץ על [![Forks ב-GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **שכפל את המאגר**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **הצטרף לקהילה**: [קהילות Discord של Azure](https://discord.com/invite/ByRwuEEgH4) לתמיכה ממומחים
4. **בחר את מסלול הלמידה שלך**: בחר פרק למטה שמתאים לרמת הניסיון שלך

### תמיכה ברב-שפות

#### תרגומים אוטומטיים (מעודכנים תמיד)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[ערבית](../ar/README.md) | [בנגלית](../bn/README.md) | [בולגרית](../bg/README.md) | [בורמזית (מיאנמר)](../my/README.md) | [סינית (מפושטת)](../zh/README.md) | [סינית (מסורתית, הונג קונג)](../hk/README.md) | [סינית (מסורתית, מקאו)](../mo/README.md) | [סינית (מסורתית, טאיוואן)](../tw/README.md) | [קרואטית](../hr/README.md) | [צ'כית](../cs/README.md) | [דנית](../da/README.md) | [הולנדית](../nl/README.md) | [אסטונית](../et/README.md) | [פינית](../fi/README.md) | [צרפתית](../fr/README.md) | [גרמנית](../de/README.md) | [יוונית](../el/README.md) | [עברית](./README.md) | [הינדי](../hi/README.md) | [הונגרית](../hu/README.md) | [אינדונזית](../id/README.md) | [איטלקית](../it/README.md) | [יפנית](../ja/README.md) | [Kannada](../kn/README.md) | [קוריאנית](../ko/README.md) | [ליטאית](../lt/README.md) | [מלאית](../ms/README.md) | [מלאיאלאם](../ml/README.md) | [Marathi](../mr/README.md) | [נפאלית](../ne/README.md) | [פידג'ין ניגרי](../pcm/README.md) | [נורווגית](../no/README.md) | [פרסית (פארסי)](../fa/README.md) | [פולנית](../pl/README.md) | [פורטוגזית (ברזיל)](../br/README.md) | [פורטוגזית (פורטוגל)](../pt/README.md) | [פנג'אבי (גורמוקי)](../pa/README.md) | [רומנית](../ro/README.md) | [רוסית](../ru/README.md) | [סרבית (קירילית)](../sr/README.md) | [סלובקית](../sk/README.md) | [סלובנית](../sl/README.md) | [ספרדית](../es/README.md) | [סווהילי](../sw/README.md) | [שוודית](../sv/README.md) | [טאגאלוג (פיליפינית)](../tl/README.md) | [טמילית](../ta/README.md) | [טלוגו](../te/README.md) | [תאית](../th/README.md) | [טורקית](../tr/README.md) | [אוקראינית](../uk/README.md) | [אורדו](../ur/README.md) | [וייטנאמית](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## סקירת הקורס

שלוט ב-Azure Developer CLI (azd) דרך פרקים מובנים המיועדים ללמידה הדרגתית. **דגש מיוחד על פריסת יישומי בינה מלאכותית עם אינטגרציה ל-Microsoft Foundry.**

### למה הקורס הזה חיוני למפתחים מודרניים

בהתבסס על תובנות מקהילת Microsoft Foundry ב-Discord, **45% מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI** אך נתקלים באתגרים ב:
- ארכיטקטורות AI מורכבות רב-שירותיות
- שיטות עבודה מומלצות לפריסת AI בסביבת ייצור  
- אינטגרציה וקונפיגורציה של שירותי Azure AI
- אופטימיזציה של עלויות עבור עומסי עבודה של AI
- פתרון תקלות בבעיות פריסה ייעודיות ל-AI

### מטרות הלמידה

על ידי השלמת קורס מובנה זה, תוכל:
- **שלוט ביסודות AZD**: מושגים בסיסיים, התקנה וקונפיגורציה
- **פרוס יישומי AI**: השתמש ב-AZD עם שירותי Microsoft Foundry
- **יישם תשתית כקוד**: נהל משאבי Azure עם תבניות Bicep
- **פתור תקלות בפריסות**: פתר בעיות נפוצות ונטרל באגים
- **אופטימיזציה לפרודקשן**: אבטחה, סקלינג, ניטור וניהול עלויות
- **בנה פתרונות רב-סוכניים**: פרוס ארכיטקטורות AI מורכבות

## 📚 פרקי הלימוד

*בחר מסלול למידה בהתאם לרמת הנ ניסיון והמטרות שלך*

### 🚀 פרק 1: יסודות והתחלה מהירה
**דרישות מקדימות**: מנוי Azure, ידע בסיסי בשורת הפקודה  
**משך**: 30-45 דקות  
**מורכבות**: ⭐

#### מה תלמד
- הבנת יסודות Azure Developer CLI
- התקנת AZD על הפלטפורמה שלך
- הפריסה הראשונה המוצלחת שלך

#### משאבי למידה
- **🎯 התחל כאן**: [מהו Azure Developer CLI?](../..)
- **📖 תאוריה**: [יסודות AZD](docs/getting-started/azd-basics.md) - מושגים מרכזיים ומונחים
- **⚙️ התקנה**: [התקנה והגדרות](docs/getting-started/installation.md) - מדריכים ספציפיים לפלטפורמה
- **🛠️ מעשי**: [הפרויקט הראשון שלך](docs/getting-started/first-project.md) - מדריך שלב-אחר-שלב
- **📋 רפרנס מהיר**: [דף עזר לפקודות](resources/cheat-sheet.md)

#### תרגילים מעשיים
```bash
# בדיקה מהירה של ההתקנה
azd version

# פרוס את היישום הראשון שלך
azd init --template todo-nodejs-mongo
azd up
```

**💡 תוצאת הפרק**: פריסת יישום ווב פשוט ל-Azure בהצלחה באמצעות AZD

**✅ אימות הצלחה:**
```bash
# לאחר השלמת פרק 1, עליך להיות מסוגל:
azd version              # מציג את הגרסה המותקנת
azd init --template todo-nodejs-mongo  # מאתחל את הפרויקט
azd up                  # מבצע פריסה ל-Azure
azd show                # מציג את כתובת ה-URL של היישום הפועל
# היישום נפתח בדפדפן ופועל
azd down --force --purge  # מנקה משאבים
```

**📊 השקעת זמן:** 30-45 דקות  
**📈 רמת מיומנות לאחר:** יכול לפרוס יישומים בסיסיים באופן עצמאי

**✅ אימות הצלחה:**
```bash
# לאחר השלמת פרק 1, תוכל לבצע את הפעולות הבאות:
azd version              # מציג את הגרסה המותקנת
azd init --template todo-nodejs-mongo  # מאתחל פרויקט
azd up                  # מבצע פריסה ל-Azure
azd show                # מציג את כתובת ה-URL של האפליקציה הרצה
# האפליקציה נפתחת בדפדפן ופועלת
azd down --force --purge  # מנקה משאבים
```

**📊 השקעת זמן:** 30-45 דקות  
**📈 רמת מיומנות לאחר:** יכול לפרוס יישומים בסיסיים באופן עצמאי

---

### 🤖 פרק 2: פיתוח ממוקד AI (מומלץ למפתחי AI)
**דרישות מקדימות**: סיום פרק 1  
**משך**: 1-2 שעות  
**מורכבות**: ⭐⭐

#### מה תלמד
- אינטגרציה של Microsoft Foundry עם AZD
- פריסת יישומים מונעי AI
- הבנת קונפיגורציות של שירותי AI

#### משאבי למידה
- **🎯 התחל כאן**: [אינטגרציה עם Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 דפוסים**: [פריסת מודלים של AI](docs/microsoft-foundry/ai-model-deployment.md) - פרוס ונהל מודלי AI
- **🛠️ סדנה**: [מעבדת הסדנה ל-AI](docs/microsoft-foundry/ai-workshop-lab.md) - הפוך את פתרונות ה-AI שלך למוכנים ל-AZD
- **🎥 מדריך אינטראקטיבי**: [חומרי הסדנה](workshop/README.md) - למידה מבוססת דפדפן עם MkDocs * DevContainer Environment
- **📋 תבניות**: [תבניות Microsoft Foundry](../..)
- **📝 דוגמאות**: [דוגמאות פריסת AZD](examples/README.md)

#### תרגילים מעשיים
```bash
# פרוס את אפליקציית הבינה המלאכותית הראשונה שלך
azd init --template azure-search-openai-demo
azd up

# נסה תבניות בינה מלאכותית נוספות
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 תוצאת הפרק**: פרוס והגדר יישום צ'אט מונע AI עם יכולות RAG

**✅ אימות הצלחה:**
```bash
# בסיום פרק 2, עליך להיות מסוגל:
azd init --template azure-search-openai-demo
azd up
# לבדוק את ממשק הצ'אט של ה-AI
# לשאול שאלות ולקבל תשובות מונעות בינה מלאכותית הכוללות מקורות
# לאמת שאינטגרציית החיפוש פועלת
azd monitor  # לבדוק ש-Application Insights מציג טלמטריה
azd down --force --purge
```

**📊 השקעת זמן:** 1-2 שעות  
**📈 רמת מיומנות לאחר:** יכול לפרוס ולהגדיר יישומי AI מוכנים לפרודקשן  
**💰 מודעות לעלויות:** הבן עלויות פיתוח משוערות של $80-150/חודש, ועלויות פרודקשן של $300-3,500/חודש

#### 💰 שיקולי עלות לפריסות AI

**סביבת פיתוח (מוערכת $80-150/חודש):**
- Azure OpenAI (Pay-as-you-go): $0-50/חודש (בהתבסס על שימוש ב-טוקנים)
- AI Search (רמת Basic): $75/חודש
- Container Apps (Consumption): $0-20/חודש
- Storage (Standard): $1-5/חודש

**סביבת פרודקשן (מוערכת $300-3,500+/חודש):**
- Azure OpenAI (PTU לביצועים עקביים): $3,000+/חודש או Pay-as-you-go עם נפח גבוה
- AI Search (רמת Standard): $250/חודש
- Container Apps (Dedicated): $50-100/חודש
- Application Insights: $5-50/חודש
- Storage (Premium): $10-50/חודש

**💡 טיפים לאופטימיזציית עלויות:**
- השתמש ב-**Free Tier** של Azure OpenAI ללמידה (כולל 50,000 טוקנים/חודש)
- הרץ `azd down` כדי לשחרר משאבים כשאינך מפתח באופן פעיל
- התחל עם תמחור מבוסס צריכה, שדרג ל-PTU רק לפרודקשן
- השתמש ב-`azd provision --preview` כדי לאמוד עלויות לפני פריסה
- הפעל auto-scaling: שלם רק עבור השימוש בפועל

**ניטור עלויות:**
```bash
# בדוק עלויות חודשיות משוערות
azd provision --preview

# עקוב אחר העלויות בפועל בפורטל Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ פרק 3: קונפיגורציה ואימות
**דרישות מקדימות**: סיום פרק 1  
**משך**: 45-60 דקות  
**מורכבות**: ⭐⭐

#### מה תלמד
- קונפיגורציה וניהול סביבת עבודה
- אימות ושיטות עבודה מומלצות לאבטחה
- קביעת שמות משאבים וארגון

#### משאבי למידה
- **📖 קונפיגורציה**: [מדריך קונפיגורציה](docs/getting-started/configuration.md) - הגדרת סביבה
- **🔐 אבטחה**: [דפוסי אימות וזהות מנוהלת](docs/getting-started/authsecurity.md) - דפוסי אימות
- **📝 דוגמאות**: [דוגמת אפליקציית מסד נתונים](examples/database-app/README.md) - דוגמאות מסד נתונים ל-AZD

#### תרגילים מעשיים
- קבע קונפיגורציות למספר סביבות (dev, staging, prod)
- הקם אימות עם זהות מנוהלת
- יישם קונפיגורציות ספציפיות לסביבה

**💡 תוצאת הפרק**: נהל מספר סביבות עם אימות ואבטחה נאותים

---

### 🏗️ פרק 4: תשתית כקוד ופריסה
**דרישות מקדימות**: סיום פרקים 1-3  
**משך**: 1-1.5 שעות  
**מורכבות**: ⭐⭐⭐

#### מה תלמד
- דפוסי פריסה מתקדמים
- תשתית כקוד עם Bicep
- אסטרטגיות פריסת משאבים

#### משאבי למידה
- **📖 פריסה**: [מדריך פריסה](docs/deployment/deployment-guide.md) - זרימות עבודה מלאות
- **🏗️ הקצאת משאבים**: [הקצאת משאבים](docs/deployment/provisioning.md) - ניהול משאבי Azure
- **📝 דוגמאות**: [דוגמת אפליקציית מכולה](../../examples/container-app) - פריסות ממכולות

#### תרגילים מעשיים
- צור תבניות Bicep מותאמות
- פרוס יישומים רב-שירותיים
- יישם אסטרטגיות פריסה של blue-green

**💡 תוצאת הפרק**: פרוס יישומים מורכבים רב-שירותיים באמצעות תבניות תשתית מותאמות

---

### 🎯 פרק 5: פתרונות AI רב-סוכניים (מתקדם)
**דרישות מקדימות**: סיום פרקים 1-2  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמד
- דפוסי ארכיטקטורת רב-סוכנים
- אורקסטרציה ותיאום סוכנים
- פריסות AI מוכנות לפרודקשן

#### משאבי למידה
- **🤖 פרויקט נבחר**: [פתרון רב-סוכני קמעונאות](examples/retail-scenario.md) - יישום מלא
- **🛠️ תבניות ARM**: [חבילת תבניות ARM](../../examples/retail-multiagent-arm-template) - פריסה בלחיצה אחת
- **📖 ארכיטקטורה**: [דפוסי תיאום רב-סוכנים](/docs/pre-deployment/coordination-patterns.md) - דפוסים

#### תרגילים מעשיים
```bash
# פרוס את פתרון הקמעונאות הרב־סוכני השלם
cd examples/retail-multiagent-arm-template
./deploy.sh

# חקור תצורות סוכנים
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 תוצאת הפרק**: לפרוס ולנהל פתרון בינה מלאכותית רב-סוכני מוכן לייצור עם סוכני לקוח ומלאי

---

### 🔍 פרק 6: אימות ותכנון לפני פריסה
**דרישות מוקדמות**: פרק 4 הושלם  
**משך**: שעה אחת  
**מורכבות**: ⭐⭐

#### מה תלמדו
- תכנון קיבולת ואימות משאבים
- אסטרטגיות בחירת SKU
- בדיקות קדם-טיסה ואוטומציה

#### משאבי למידה
- **📊 תכנון**: [תכנון קיבולת](docs/pre-deployment/capacity-planning.md) - אימות משאבים
- **💰 בחירה**: [בחירת SKU](docs/pre-deployment/sku-selection.md) - בחירות חסכוניות בעלות
- **✅ אימות**: [בדיקות קדם-טיסה](docs/pre-deployment/preflight-checks.md) - סקריפטים אוטומטיים

#### תרגילים מעשיים
- הריצו סקריפטים לאימות קיבולת
- אופטימיזו את בחירות ה-SKU לפי עלות
- ממשו בדיקות קדם-פריסה אוטומטיות

**💡 תוצאת הפרק**: אמתו ואופטמו פריסות לפני הביצוע

---

### 🚨 פרק 7: פתרון תקלות וניפוי שגיאות
**דרישות מוקדמות**: כל פרק פריסה הושלם  
**משך**: שעה עד שעה וחצי  
**מורכבות**: ⭐⭐

#### מה תלמדו
- גישות שיטתיות לניפוי שגיאות
- בעיות נפוצות ופתרונות
- ניפוי שגיאות ספציפי לבינה מלאכותית

#### משאבי למידה
- **🔧 בעיות נפוצות**: [בעיות נפוצות](docs/troubleshooting/common-issues.md) - שאלות נפוצות ופתרונות
- **🕵️ ניפוי שגיאות**: [מדריך לניפוי שגיאות](docs/troubleshooting/debugging.md) - אסטרטגיות שלב אחר שלב
- **🤖 בעיות ב-AI**: [ניפוי שגיאות ספציפי ל-AI](docs/troubleshooting/ai-troubleshooting.md) - בעיות שירותי AI

#### תרגילים מעשיים
- אבחנו כישלונות פריסה
- פתרו בעיות אימות
- ניפוי שגיאות בחיבור לשירותי AI

**💡 תוצאת הפרק**: אבחנו ופתרו באופן עצמאי בעיות פריסה נפוצות

---

### 🏢 פרק 8: דפוסי פרודקשן וארגוניים
**דרישות מוקדמות**: פרקים 1–4 הושלמו  
**משך**: 2-3 שעות  
**מורכבות**: ⭐⭐⭐⭐

#### מה תלמדו
- אסטרטגיות פריסה בסביבת ייצור
- דפוסי אבטחה ארגוניים
- ניטור ואופטימיזציית עלויות

#### משאבי למידה
- **🏭 ייצור**: [שיטות מומלצות ל-AI בסביבת ייצור](docs/microsoft-foundry/production-ai-practices.md) - דפוסים ארגוניים
- **📝 דוגמאות**: [דוגמת מיקרו-שירותים](../../examples/microservices) - ארכיטקטורות מורכבות
- **📊 ניטור**: [אינטגרציה עם Application Insights](docs/pre-deployment/application-insights.md) - ניטור

#### תרגילים מעשיים
- יישמו דפוסי אבטחה ארגוניים
- הקימו ניטור מקיף
- פרסו לסביבת ייצור עם ממשל נכון

**💡 תוצאת הפרק**: פרסו יישומים מוכנים לארגון עם יכולות פרודקשן מלאות

---

## 🎓 סקירת הסדנה: חוויית למידה מעשית

> **⚠️ מצב הסדנה: בפיתוח פעיל**  
> חומרי הסדנה נמצאים כעת בפיתוח ובשיפור. המודולים הליבתיים פונקציונליים, אך חלק מהסעיפים המתקדמים אינם שלמים. אנחנו עובדים באופן פעיל להשלים את כל התוכן. [עקבו אחרי ההתקדמות →](workshop/README.md)

### חומרי סדנה אינטראקטיביים
**למידה מעשית מקיפה עם כלים בדפדפן ותרגילים מודרכים**

חומרי הסדנה שלנו מספקים חוויית למידה אינטראקטיבית ומובנית שמשלימה את תכנית הלימודים המבוססת על פרקים שלמעלה. הסדנה מעוצבת הן ללמידה בקצב עצמי והן למפגשים בהנחיית מדריך.

#### 🛠️ תכונות הסדנה
- ממשק מבוסס דפדפן: סדנה מלאה מופעלת על MkDocs עם חיפוש, העתקה ותכונות ערכת נושא
- אינטגרציה עם GitHub Codespaces: הגדרת סביבת פיתוח בלחיצה אחת
- מסלול למידה מובנה: 7 שלבים של תרגילים מודרכים (3.5 שעות בסה"כ)
- גילוי → פריסה → התאמה אישית: מתודולוגיה הדרגתית
- סביבה אינטראקטיבית של DevContainer: כלים ותלויות מוגדרים מראש

#### 📚 מבנה הסדנה
הסדנה פועלת על פי מתודולוגיית **גילוי → פריסה → התאמה אישית**:

1. **שלב הגילוי (45 דקות)**
   - חקרו תבניות ושירותים של Microsoft Foundry
   - הבינו דפוסי ארכיטקטורה רב-סוכנית
   - סקירה של דרישות הפריסה והדרישות המוקדמות

2. **שלב הפריסה (2 שעות)**
   - פריסה מעשית של יישומי AI באמצעות AZD
   - הגדרת שירותי Azure AI ונקודות קצה
   - מימוש דפוסי אבטחה ואימות

3. **שלב ההתאמה האישית (45 דקות)**
   - שנו יישומים למקרי שימוש ספציפיים
   - אופטימיזציה לפריסה בסביבת ייצור
   - מימוש ניטור וניהול עלויות

#### 🚀 כיצד להתחיל עם הסדנה
```bash
# אפשרות 1: GitHub Codespaces (מומלץ)
# לחץ על "Code" → "Create codespace on main" במאגר

# אפשרות 2: פיתוח מקומי
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# עקוב אחר הוראות ההתקנה ב-workshop/README.md
```

#### 🎯 תוצאות הלמידה של הסדנה
בסיום הסדנה, המשתתפים:
- **פריסת יישומי AI בסביבת ייצור**: השתמשו ב-AZD עם שירותי Microsoft Foundry
- **שלוטו בארכיטקטורות רב-סוכניות**: יישמו פתרונות סוכני AI מתואמים
- **ממשו שיטות אבטחה מיטביות**: הגדירו אימות ובקרת גישה
- **התאימו להרחבה**: עצבו פריסות חסכוניות ובעלות ביצועים טובים
- **לפתור תקלות בפריסות**: לפתור בעיות נפוצות באופן עצמאי

#### 📖 משאבי הסדנה
- **🎥 מדריך אינטראקטיבי**: [חומרי הסדנה](workshop/README.md) - סביבה ללמידה מבוססת דפדפן
- **📋 הוראות שלב-אחר-שלב**: [תרגילים מודרכים](../../workshop/docs/instructions) - מדריכים מפורטים
- **🛠️ מעבדת סדנת AI**: [מעבדת סדנת AI](docs/microsoft-foundry/ai-workshop-lab.md) - תרגילים ממוקדי AI
- **💡 התחלה מהירה**: [מדריך הגדרת הסדנה](workshop/README.md#quick-start) - הגדרת סביבה

Perfect for: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 מהו Azure Developer CLI?

Azure Developer CLI (azd) הוא ממשק שורת פקודה ממוקד מפתחים שמאיץ את תהליך בניית ופריסת יישומים ל-Azure. הוא מספק:

- **פריסות מבוססות תבניות** - השתמשו בתבניות מוכנות מראש עבור דפוסי יישומים נפוצים
- **תשתית כקוד** - ניהול משאבי Azure באמצעות Bicep או Terraform  
- **זרימות עבודה משולבות** - לספק, לפרוס ולנטר יישומים בצורה חלקה
- **ידידותי למפתחים** - מותאם לפרודוקטיביות וחוויית המפתח

### **AZD + Microsoft Foundry: מושלם לפריסות AI**

**מדוע AZD לפתרונות AI?** AZD מתמודד עם האתגרים המרכזיים שמפתחים בתחום ה-AI נתקלים בהם:

- **תבניות מוכנות ל-AI** - תבניות מוגדרות מראש עבור Azure OpenAI, Cognitive Services ועומסי עבודה של ML
- **פריסות AI מאובטחות** - דפוסי אבטחה מובנים לשירותי AI, מפתחות API ונקודות קצה של מודלים  
- **דפוסי AI לפרודקשן** - שיטות עבודה מומלצות לפריסות יישומי AI מדרגיות וחסכוניות
- **זרימות עבודה מקצה לקצה ל-AI** - מפיתוח מודל ועד פריסה לייצור עם ניטור נכון
- **אופטימיזציית עלויות** - הקצאה חכמה של משאבים ואסטרטגיות סקיילינג לעומסי עבודה של AI
- **אינטגרציה עם Microsoft Foundry** - חיבור חלק לקטלוג המודלים ולנקודות הקצה של Microsoft Foundry

---

## 🎯 ספריית תבניות ודוגמאות

### מומלצות: תבניות Microsoft Foundry
**התחילו כאן אם אתם מפרסים יישומי AI!**

> **הערה:** תבניות אלו מדגימות דפוסי AI שונים. חלקן הן דוגמאות חיצוניות של Azure, ואחרות הן מימושים מקומיים.

| תבנית | פרק | מורכבות | שירותים | סוג |
|----------|---------|------------|----------|------|
| [**התחילו עם צ'אט AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | חיצוני |
| [**התחילו עם סוכני AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | פרק 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| חיצוני |
| [**הדגמת Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | חיצוני |
| [**התחלה מהירה לאפליקציית צ'אט OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | חיצוני |
| [**סוכן OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | חיצוני |
| [**צ'אט Contoso RAG**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | חיצוני |
| [**פתרון רב-סוכני לקמעונאות**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **מקומי** |

### מובלטים: תרחישי למידה מלאים
**תבניות יישומים מוכנות לפרודקשן הממופות לפרקי הלמידה**

| תבנית | פרק למידה | מורכבות | עיקרי הלמידה |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | פרק 2 | ⭐ | דפוסי פריסת AI בסיסיים |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | פרק 2 | ⭐⭐ | יישום RAG עם Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | פרק 4 | ⭐⭐ | אינטגרציה של Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | פרק 5 | ⭐⭐⭐ | מסגרת סוכנים וקריאות לפונקציות |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | פרק 8 | ⭐⭐⭐ | אורקסטרציה ארגונית של AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | פרק 5 | ⭐⭐⭐⭐ | ארכיטקטורה רב-סוכנית עם סוכני לקוח ומלאי |

### למידה לפי סוג דוגמה

> **📌 דוגמאות מקומיות לעומת חיצוניות:**  
> **דוגמאות מקומיות** (במאגר זה) = מוכנות לשימוש מיידי  
> **דוגמאות חיצוניות** (Azure Samples) = קלונו מהמאגר המקושר

#### דוגמאות מקומיות (מוכנות לשימוש)
- [**פתרון רב-סוכני לקמעונאות**](examples/retail-scenario.md) - מימוש מלא מוכן לייצור עם תבניות ARM
  - ארכיטקטורה רב-סוכנית (סוכני לקוח + סוכני מלאי)
  - ניטור והערכה מקיפים
  - פריסה בלחיצה אחת דרך תבנית ARM

#### דוגמאות מקומיות - יישומי Container (פרקים 2-5)
**דוגמאות פריסה מקיפות של קונטיינרים במאגר זה:**
- [**דוגמאות ל-Container App**](examples/container-app/README.md) - מדריך מלא לפריסות מבוססות קונטיינרים
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - ממשק REST בסיסי עם scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - פריסה מוכנה לפרודקשן של שירותים מרובים
  - Quick Start, Production, and Advanced deployment patterns
  - הנחיות לניטור, אבטחה ואופטימיזציית עלויות

#### דוגמאות חיצוניות - אפליקציות פשוטות (פרקים 1-2)
**קלוו את מאגרי Azure Samples הבאים כדי להתחיל:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - דפוסי פריסה בסיסיים
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - פריסת תוכן סטטי
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - פריסת REST API

#### דוגמאות חיצוניות - אינטגרציית מסדי נתונים (פרקים 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - דפוסי חיבור למסדי נתונים
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - זרימת עבודה ללא שרת לאחסון נתונים

#### דוגמאות חיצוניות - דפוסים מתקדמים (פרקים 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - ארכיטקטורות מרובת שירותים
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - עיבוד ברקע  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - דפוסי ML מוכנים לפרודקשן

### אוספי תבניות חיצוניים
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - אוסף מתCURATED של תבניות רשמיות וקהילתיות
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - תיעוד תבניות Microsoft Learn
- [**Examples Directory**](examples/README.md) - דוגמאות למידה מקומיות עם הסברים מפורטים

---

## 📚 משאבי למידה והפניות

### הפניות מהירות
- [**דף רמזים לפקודות**](resources/cheat-sheet.md) - פקודות azd חיוניות מאורגנות לפי פרק
- [**מילון**](resources/glossary.md) - מונחים של Azure ו-azd  
- [**שאלות נפוצות**](resources/faq.md) - שאלות נפוצות מסודרות לפי פרק לימוד
- [**מדריך ללימוד**](resources/study-guide.md) - תרגילים מעשיים מקיפים

### סדנאות מעשיות
- [**מעבדת סדנת AI**](docs/microsoft-foundry/ai-workshop-lab.md) - הפכו את פתרונות ה-AI שלכם לניתנים לפריסה באמצעות AZD (2-3 hours)
- [**מדריך סדנה אינטראקטיבי**](workshop/README.md) - סדנה מבוססת דפדפן עם MkDocs וסביבת DevContainer
- [**Structured Learning Path**](../../workshop/docs/instructions) -7-step תרגילים מודרכים (גילוי → פריסה → התאמה אישית)
- [**סדנת AZD למתחילים**](workshop/README.md) - חומרי סדנה מעשית מלאים עם אינטגרציה של GitHub Codespaces

### משאבי למידה חיצוניים
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מחשבון התמחור של Azure](https://azure.microsoft.com/pricing/calculator/)
- [סטטוס Azure](https://status.azure.com/)

---

## 🔧 מדריך פתרון בעיות מהיר

**בעיות נפוצות שמתחילים נתקלים בהן ופתרונות מידיים:**

### ❌ "azd: command not found"

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

### ❌ "No subscription found" or "Subscription not set"

```bash
# רשימת המנויים הזמינים
az account list --output table

# הגדר מנוי ברירת מחדל
az account set --subscription "<subscription-id-or-name>"

# הגדר עבור סביבת AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# אמת
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# נסה אזור Azure אחר
azd env set AZURE_LOCATION "westus2"
azd up

# או השתמש ב-SKU-ים קטנים יותר בסביבת פיתוח
# ערוך את infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# אפשרות 1: נקה ונסה שוב
azd down --force --purge
azd up

# אפשרות 2: תקן רק את התשתית
azd provision

# אפשרות 3: בדוק יומנים מפורטים
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# אימות מחדש
az logout
az login

azd auth logout
azd auth login

# אמת את ההזדהות
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD מייצר שמות ייחודיים, אך אם יש התנגשות:
azd down --force --purge

# אז נסה שוב בסביבה חדשה
azd env new dev-v2
azd up
```

### ❌ תהליך פריסת התבנית לוקח יותר מדי זמן

**זמני המתנה רגילים:**
- אפליקציית ווב פשוטה: 5-10 דקות
- אפליקציה עם מסד נתונים: 10-15 דקות
- יישומי AI: 15-25 דקות (הקצאת OpenAI היא איטית)

```bash
# בדוק התקדמות
azd show

# אם התהליך תקוע יותר מ-30 דקות, בדוק את פורטל Azure:
azd monitor
# חפש פריסות שנכשלו
```

### ❌ "Permission denied" or "Forbidden"

```bash
# בדוק את התפקיד שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# נדרש לפחות התפקיד "Contributor"
# בקש מהמנהל שלך ב-Azure להעניק:
# - Contributor (לעבודה עם משאבים)
# - User Access Administrator (להקצאת תפקידים)
```

### ❌ Can't find deployed application URL

```bash
# הצג את כל נקודות הקצה של השירות
azd show

# או פתח את פורטל Azure
azd monitor

# בדוק שירות מסוים
azd env get-values
# חפש משתני *_URL
```

### 📚 משאבים מלאים לפתרון בעיות

- **מדריך בעיות נפוצות:** [פתרונות מפורטים](docs/troubleshooting/common-issues.md)
- **בעיות ספציפיות ל-AI:** [פתרון בעיות ב-AI](docs/troubleshooting/ai-troubleshooting.md)
- **מדריך ניפוי שגיאות:** [ניפוי שגיאות צעד-אחר-צעד](docs/troubleshooting/debugging.md)
- **קבלו עזרה:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 מדריך פתרון בעיות מהיר

**בעיות נפוצות שמתחילים נתקלים בהן ופתרונות מידיים:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# התקן את AZD תחילה
# ווינדוס (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# לינוקס:
curl -fsSL https://aka.ms/install-azd.sh | bash

# אמת את ההתקנה
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# רשימת המנויים הזמינים
az account list --output table

# הגדר מנוי ברירת מחדל
az account set --subscription "<subscription-id-or-name>"

# הגדר עבור סביבת AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# אמת
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# נסה אזור Azure אחר
azd env set AZURE_LOCATION "westus2"
azd up

# או השתמש ב-SKUs קטנים יותר בסביבת הפיתוח
# ערוך את infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# אפשרות 1: נקה ונסה שוב
azd down --force --purge
azd up

# אפשרות 2: פשוט תקן את התשתית
azd provision

# אפשרות 3: בדוק לוגים מפורטים
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# אמת מחדש
az logout
az login

azd auth logout
azd auth login

# וודא את האימות
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD מייצר שמות ייחודיים, אך אם יש התנגשות:
azd down --force --purge

# יש לנסות שוב עם סביבה חדשה
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**זמני המתנה רגילים:**
- אפליקציית ווב פשוטה: 5-10 דקות
- אפליקציה עם מסד נתונים: 10-15 דקות
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
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# בדוק את התפקיד שלך ב-Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# נדרש לך לפחות את התפקיד "Contributor"
# בקש ממנהל ה-Azure שלך להעניק:
# - Contributor (למשאבים)
# - User Access Administrator (להקצאת תפקידים)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# הצג את כל נקודות הקצה של השירותים
azd show

# או פתח את פורטל Azure
azd monitor

# בדוק שירות ספציפי
azd env get-values
# חפש משתני *_URL
```
</details>

### 📚 משאבים מלאים לפתרון בעיות

- **מדריך בעיות נפוצות:** [פתרונות מפורטים](docs/troubleshooting/common-issues.md)
- **בעיות ספציפיות ל-AI:** [פתרון בעיות ב-AI](docs/troubleshooting/ai-troubleshooting.md)
- **מדריך ניפוי שגיאות:** [ניפוי שגיאות צעד-אחר-צעד](docs/troubleshooting/debugging.md)
- **קבלו עזרה:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 סיום הקורס והסמכה

### מעקב התקדמות
עקבו אחר התקדמות הלימוד שלכם בכל פרק:

- [ ] **פרק 1**: יסודות והתחלה מהירה ✅
- [ ] **פרק 2**: פיתוח מונחה AI ✅  
- [ ] **פרק 3**: הגדרה ואימות ✅
- [ ] **פרק 4**: תשתית כקוד ופריסה ✅
- [ ] **פרק 5**: פתרונות AI מרובי-סוכנים ✅
- [ ] **פרק 6**: אימות ותכנון לפני פריסה ✅
- [ ] **פרק 7**: פתרון בעיות וניפוי שגיאות ✅
- [ ] **פרק 8**: דפוסי ייצור וארגוניים ✅

### אימות הלמידה
לאחר השלמת כל פרק, אימתו את הידע שלכם על ידי:
1. **תרגיל מעשי**: השלימו את הפריסה המעשית של הפרק
2. **בדיקת ידע**: עברו על מדור השאלות הנפוצות של הפרק
3. **דיון בקהילה**: שתפו את החוויה שלכם ב-Azure Discord
4. **הפרק הבא**: עברו לרמת המורכבות הבאה

### יתרונות סיום הקורס
בסיום כל הפרקים, תקבלו:
- **ניסיון ייצור**: פרסתם אפליקציות AI אמיתיות ב-Azure
- **כישורים מקצועיים**: יכולות פריסה מוכנות לארגון  
- **הכרה בקהילה**: חבר פעיל בקהילת מפתחי Azure
- **קידום קריירה**: מומחיות מבוקשת בפריסת AZD ו-AI

---

## 🤝 קהילה ותמיכה

### קבלת סיוע ותמיכה
- **בעיות טכניות**: [דווח על באגים ובקש תכונות](https://github.com/microsoft/azd-for-beginners/issues)
- **שאלות לימוד**: [קהילת Microsoft Azure ב-Discord](https://discord.gg/microsoft-azure) ו-[![דיסקורד Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **עזרה ספציפית ל-AI**: הצטרפו ל-[![דיסקורד Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **תיעוד**: [התיעוד הרשמי של Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### תובנות מהקהילה מ-Microsoft Foundry Discord

**תוצאות סקר אחרונות מערוץ #Azure:**
- **45%** מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI
- **האתגרים העיקריים**: פריסות רב-שירותיות, ניהול אישורים, מוכנות לייצור  
- **הנדרשים ביותר**: תבניות ספציפיות ל-AI, מדריכי פתרון בעיות, שיטות עבודה מומלצות

**הצטרפו לקהילה שלנו כדי:**
- לשתף את ניסיונות ה-AZD + AI שלכם ולקבל עזרה
- לגשת לגרסאות מוקדמות של תבניות AI חדשות
- לתרום לשיטות עבודה מומלצות לפריסת AI
- להשפיע על פיתוח תכונות עתידיות של AI + AZD

### תרומה לקורס
אנו מקדמים תרומות! אנא קראו את [מדריך התרומה](CONTRIBUTING.md) לפרטים על:
- **שיפורים בתוכן**: שפרו פרקים ודוגמאות קיימות
- **דוגמאות חדשות**: הוסיפו תרחישים ותבניות מהעולם האמיתי  
- **תרגום**: עזרו לשמור על תמיכה רב-לשונית
- **דיווחי באגים**: שפרו דיוק ובהירות
- **תקני קהילה**: עקבו אחרי הנחיות הקהילה הכלליות שלנו

---

## 📄 מידע על הקורס

### רישיון
פרויקט זה מורשה תחת רישיון MIT - עיינו בקובץ [LICENSE](../../LICENSE) לפרטים.

### משאבי למידה קשורים של מיקרוסופט

הצוות שלנו מייצר קורסי למידה מקיפים נוספים:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j למתחילים](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js למתחילים](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agents
[![AZD למתחילים](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI למתחילים](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP למתחילים](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents למתחילים](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI למתחילים](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET) למתחילים](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java) למתחילים](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript) למתחילים](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### למידה בסיסית
[![ML למתחילים](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science למתחילים](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![בינה מלאכותית למתחילים](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![אבטחת סייבר למתחילים](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![פיתוח אתרים למתחילים](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT למתחילים](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![פיתוח XR למתחילים](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### סדרת Copilot
[![Copilot לתכנות מזווג בבינה מלאכותית](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot ל-C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![הרפתקת Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ניווט הקורס

**🚀 מוכנים להתחיל ללמוד?**

**מתחילים**: התחילו עם [פרק 1: יסודות והתחלה מהירה](../..)  
**מפתחי בינה מלאכותית**: דלגו אל [פרק 2: פיתוח ממוקד בינה מלאכותית](../..)  
**מפתחים מנוסים**: התחילו עם [פרק 3: תצורה ואימות](../..)

**השלבים הבאים**: [התחילו בפרק 1 - יסודות AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אחריות:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להסתמך על המסמך המקורי בשפת המקור כמקור הסמכות. עבור מידע קריטי מומלץ לבצע תרגום אנושי מקצועי. איננו אחראים לכל אי-הבנה או פרשנות שגויה הנובעים משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->