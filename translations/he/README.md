<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T15:20:39+00:00",
  "source_file": "README.md",
  "language_code": "he"
}
-->
# AZD למתחילים

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.he.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

עקבו אחר השלבים הבאים כדי להתחיל להשתמש במשאבים אלו:
1. **צרו Fork למאגר**: לחצו [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **שכפלו את המאגר**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**הצטרפו לקהילות Azure Discord ופגשו מומחים ומפתחים נוספים**](https://discord.com/invite/ByRwuEEgH4)

### תמיכה בריבוי שפות

#### נתמך באמצעות GitHub Action (אוטומטי ומעודכן תמיד)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](./README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**אם ברצונכם להוסיף שפות נוספות, ניתן למצוא את הרשימה [כאן](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## מבוא

ברוכים הבאים למדריך המקיף עבור Azure Developer CLI (azd). מאגר זה נועד לעזור למפתחים בכל הרמות, החל מסטודנטים ועד למפתחים מקצועיים, ללמוד ולהתמקצע ב-Azure Developer CLI לפריסות ענן יעילות, **עם דגש מיוחד על פריסת יישומי AI באמצעות Azure AI Foundry**. משאב למידה מובנה זה מספק חוויית למידה מעשית עם פריסות ענן של Azure, פתרון בעיות נפוצות ויישום שיטות עבודה מומלצות לפריסת תבניות AZD.

### **מדוע מדריך זה חשוב למפתחי AI**
בהתבסס על סקר שנערך בקהילת Azure AI Foundry ב-Discord, **45% מהמפתחים מעוניינים להשתמש ב-AZD עבור עומסי עבודה של AI** אך נתקלים באתגרים כמו:
- ארכיטקטורות AI מורכבות מרובות שירותים
- שיטות עבודה מומלצות לפריסת AI בסביבת ייצור
- אינטגרציה וקונפיגורציה של שירותי Azure AI
- אופטימיזציה של עלויות עבור עומסי עבודה של AI
- פתרון בעיות ייחודיות לפריסות AI

## מטרות למידה

על ידי עבודה עם מאגר זה, תלמדו:
- לשלוט ביסודות ובמושגים המרכזיים של Azure Developer CLI
- לפרוס ולהקים משאבי Azure באמצעות Infrastructure as Code
- לפתח מיומנויות פתרון בעיות עבור בעיות פריסה נפוצות ב-AZD
- להבין בדיקות לפני פריסה ותכנון קיבולת
- ליישם שיטות עבודה מומלצות לאבטחה ואופטימיזציה של עלויות
- לבנות ביטחון בפריסת יישומים מוכנים לייצור ב-Azure

## תוצאות למידה

לאחר השלמת הקורס, תוכלו:
- להתקין, להגדיר ולהשתמש ב-Azure Developer CLI בהצלחה
- ליצור ולפרוס יישומים באמצעות תבניות AZD
- לפתור בעיות אימות, תשתית ופריסה
- לבצע בדיקות לפני פריסה כולל תכנון קיבולת ובחירת SKU
- ליישם שיטות עבודה מומלצות לניטור, אבטחה וניהול עלויות
- לשלב תהליכי עבודה של AZD בצינורות CI/CD

## תוכן עניינים

- [מהו Azure Developer CLI?](../..)
- [התחלה מהירה](../..)
- [מסלול למידה](../..)
  - [למפתחי AI (מומלץ להתחיל כאן!)](../..)
  - [לסטודנטים ומתחילים](../..)
  - [למפתחים](../..)
  - [למהנדסי DevOps](../..)
- [תיעוד](../..)
  - [התחלה](../..)
  - [פריסה והקמה](../..)
  - [בדיקות לפני פריסה](../..)
  - [AI ו-Azure AI Foundry](../..)
  - [פתרון בעיות](../..)
- [דוגמאות ותבניות](../..)
  - [מומלץ: תבניות Azure AI Foundry](../..)
  - [מומלץ: תרחישי Azure AI Foundry מקצה לקצה](../..)
  - [תבניות AZD נוספות](../..)
  - [מעבדות וסדנאות מעשיות](../..)
- [משאבים](../..)
- [תרומה](../..)
- [תמיכה](../..)
- [קהילה](../..)

## מהו Azure Developer CLI?

Azure Developer CLI (azd) הוא ממשק שורת פקודה ממוקד מפתחים שמאיץ את תהליך בניית ופריסת יישומים ל-Azure. הוא מספק:

- **פריסות מבוססות תבניות** - שימוש בתבניות מוכנות מראש עבור דפוסי יישומים נפוצים
- **Infrastructure as Code** - ניהול משאבי Azure באמצעות Bicep או Terraform
- **תהליכי עבודה משולבים** - הקמה, פריסה וניטור יישומים בצורה חלקה
- **ידידותי למפתחים** - מותאם לפרודוקטיביות וחוויית המפתח

### **AZD + Azure AI Foundry: מושלם לפריסות AI**

**מדוע AZD עבור פתרונות AI?** AZD מתמודד עם האתגרים המרכזיים שמפתחי AI נתקלים בהם:

- **תבניות מוכנות ל-AI** - תבניות מוגדרות מראש עבור Azure OpenAI, Cognitive Services ועומסי עבודה של ML
- **פריסות AI מאובטחות** - דפוסי אבטחה מובנים לשירותי AI, מפתחות API ונקודות קצה של מודלים
- **דפוסי AI לייצור** - שיטות עבודה מומלצות לפריסות יישומי AI בקנה מידה גדול ובעלות נמוכה
- **תהליכי עבודה מקצה לקצה ל-AI** - מפיתוח מודלים ועד לפריסה בייצור עם ניטור מתאים
- **אופטימיזציה של עלויות** - אסטרטגיות חכמות להקצאת משאבים וסקיילינג עבור עומסי עבודה של AI
- **אינטגרציה עם Azure AI Foundry** - חיבור חלק לקטלוג המודלים ונקודות הקצה של AI Foundry

## התחלה מהירה

### דרישות מוקדמות
- מנוי Azure
- Azure CLI מותקן
- Git (לשכפול תבניות)

### התקנה
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### הפריסה הראשונה שלכם
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### פריסת AI ראשונה
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## מסלול למידה

### למפתחי AI (מומלץ להתחיל כאן!)
1. **התחלה מהירה**: נסו את [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) תבנית
2. **לימוד יסודות**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **תרגול מעשי**: השלימו את [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)
4. **מוכנות לייצור**: עיינו ב-[Production AI Best Practices](docs/ai-foundry/production-ai-practices.md)
5. **מתקדם**: פרסו את [contoso-chat](https://github.com/Azure-Samples/contoso-chat) תבנית ארגונית

### לסטודנטים ומתחילים
1. התחילו עם [AZD Basics](docs/getting-started/azd-basics.md)
2. עקבו אחר [מדריך ההתקנה](docs/getting-started/installation.md)
3. השלימו את [הפרויקט הראשון שלכם](docs/getting-started/first-project.md)
4. תרגלו עם [דוגמת יישום אינטרנט פשוט](../../examples/simple-web-app)

### למפתחים
1. עיינו ב-[מדריך הקונפיגורציה](docs/getting-started/configuration.md)
2. למדו את [מדריך הפריסה](docs/deployment/deployment-guide.md)
3. עבדו על [דוגמת יישום בסיס נתונים](../../examples/database-app)
4. חקרו את [דוגמת יישום קונטיינר](../../examples/container-app)

### למהנדסי DevOps
1. שלטו ב-[הקמת משאבים](docs/deployment/provisioning.md)
2. יישמו [בדיקות לפני פריסה](docs/pre-deployment/preflight-checks.md)
3. תרגלו [תכנון קיבולת](docs/pre-deployment/capacity-planning.md)
4. מתקדם [דוגמת מיקרו-שירותים](../../examples/microservices)

## תיעוד

### התחלה
- [**AZD Basics**](docs/getting-started/azd-basics.md) - מושגים ומונחים מרכזיים
- [**התקנה והגדרה**](docs/getting-started/installation.md) - מדריכי התקנה לפי פלטפורמה
- [**קונפיגורציה**](docs/getting-started/configuration.md) - הגדרת סביבה ואימות
- [**הפרויקט הראשון שלכם**](docs/getting-started/first-project.md) - מדריך שלב אחר שלב

### פריסה והקמה
- [**מדריך פריסה**](docs/deployment/deployment-guide.md) - תהליכי פריסה מלאים
- [**הקמת משאבים**](docs/deployment/provisioning.md) - ניהול משאבי Azure

### בדיקות לפני פריסה
- [**תכנון קיבולת**](docs/pre-deployment/capacity-planning.md) - אימות קיבולת משאבי Azure
- [**בחירת SKU**](docs/pre-deployment/sku-selection.md) - בחירת ה-SKU המתאים ב-Azure
- [**בדיקות לפני פריסה**](docs/pre-deployment/preflight-checks.md) - סקריפטים לאימות אוטומטי

### AI ו-Azure AI Foundry
- [**אינטגרציה עם Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - חיבור AZD לשירותי Azure AI Foundry
- [**דפוסי פריסת מודלי AI**](docs/ai-foundry/ai-model-deployment.md) - פריסה וניהול מודלי AI עם AZD
- [**מעבדת AI**](docs/ai-foundry/ai-workshop-lab.md) - מעבדה מעשית: הכנת פתרונות AI ל-AZD
- [**שיטות עבודה מומלצות ל-AI בייצור**](docs/ai-foundry/production-ai-practices.md) - אבטחה, סקיילינג וניטור לעומסי עבודה של AI

### פתרון בעיות
- [**בעיות נפוצות**](docs/troubleshooting/common-issues.md) - בעיות נפוצות ופתרונות
- [**מדריך ניפוי שגיאות**](docs/troubleshooting/debugging.md) - אסטרטגיות ניפוי שגיאות שלב אחר שלב  
- [**ניפוי שגיאות ספציפי ל-AI**](docs/troubleshooting/ai-troubleshooting.md) - בעיות בשירותי AI ובפריסת מודלים  

## דוגמאות ותבניות

### [מומלץ: תבניות Azure AI Foundry](https://ai.azure.com/resource/build/templates)  
**התחילו כאן אם אתם מפרסים יישומי AI!**

| תבנית | תיאור | מורכבות | שירותים |
|-------|--------|---------|---------|
| [**התחילו עם צ'אט AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | יצירה ופריסה של יישום צ'אט בסיסי המשולב עם נתונים ותובנות טלמטריה באמצעות Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**התחילו עם סוכני AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | יצירה ופריסה של יישום סוכן בסיסי עם פעולות ותובנות טלמטריה באמצעות Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**אוטומציה של זרימת עבודה מרובת סוכנים**](https://github.com/Azure-Samples/get-started-with-ai-chat) | שיפור תכנון משימות ואוטומציה על ידי תזמור וניהול קבוצת סוכני AI.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**יצירת מסמכים מהנתונים שלכם**](https://github.com/Azure-Samples/get-started-with-ai-chat) | האצת יצירת מסמכים כמו חוזים, חשבוניות והצעות השקעה על ידי איתור וסיכום מידע רלוונטי מהנתונים שלכם. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**שיפור פגישות עם לקוחות באמצעות סוכנים**](https://github.com/Azure-Samples/get-started-with-ai-chat) | מעבר מקוד ישן לשפות מודרניות באמצעות צוות סוכנים. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**מודרניזציה של הקוד שלכם עם סוכנים**](https://github.com/Azure-Samples/get-started-with-ai-chat) | יצירה ופריסה של יישום צ'אט בסיסי המשולב עם נתונים ותובנות טלמטריה באמצעות Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**בניית סוכן שיחה משלכם**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ניצול הבנה שיחתית מתקדמת ליצירה ושיפור של צ'אטבוטים וסוכנים עם זרימות עבודה דטרמיניסטיות ונשלטות על ידי בני אדם. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**פתיחת תובנות מנתוני שיחה**](https://github.com/Azure-Samples/get-started-with-ai-chat) | שיפור יעילות מרכזי קשר על ידי גילוי תובנות ממערכי נתונים גדולים מבוססי אודיו וטקסט באמצעות יכולות הבנת תוכן מתקדמות. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**עיבוד תוכן רב-מודאלי**](https://github.com/Azure-Samples/get-started-with-ai-chat) | עיבוד תביעות, חשבוניות, חוזים ומסמכים אחרים במהירות ובדיוק על ידי חילוץ מידע מתוכן לא מובנה ומיפויו לפורמט מובנה. תבנית זו תומכת בטקסט, תמונות, טבלאות וגרפים. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### מומלץ: תרחישי Azure AI Foundry מקצה לקצה  
**התחילו כאן אם אתם מפרסים יישומי AI!**

| תבנית | תיאור | מורכבות | שירותים |
|-------|--------|---------|---------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ממשק צ'אט פשוט עם Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | יישום צ'אט עם RAG באמצעות Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | ניתוח מסמכים עם שירותי AI | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | מסגרת סוכן AI עם קריאות פונקציה | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | צ'אט ארגוני עם תזמור AI | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### תבניות AZD נוספות  
- [**ספריית דוגמאות**](examples/README.md) - דוגמאות מעשיות, תבניות ותרחישים אמיתיים  
- [**תבניות AZD של Azure-Samples**](https://github.com/Azure-Samples/azd-templates) - תבניות דוגמה רשמיות של Microsoft  
- [**גלריית AZD מדהימה**](https://azure.github.io/awesome-azd/) - תבניות שתרמו הקהילה  

### מעבדות וסדנאות מעשיות  
- [**מעבדת סדנת AI**](docs/ai-foundry/ai-workshop-lab.md) - **חדש**: הפכו את פתרונות ה-AI שלכם לפריסת AZD  
- [**סדנת AZD למתחילים**](workshop/README.md) - התמקדות בפריסת תבניות סוכני AI עם AZD  

## משאבים

### הפניות מהירות  
- [**דף פקודות**](resources/cheat-sheet.md) - פקודות azd חיוניות  
- [**מילון מונחים**](resources/glossary.md) - מונחי Azure ו-azd  
- [**שאלות נפוצות**](resources/faq.md) - שאלות נפוצות  
- [**מדריך לימוד**](resources/study-guide.md) - מטרות לימוד מקיפות ותרגילי תרגול  

### משאבים חיצוניים  
- [תיעוד CLI של Azure Developer](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [מחשבון תמחור של Azure](https://azure.microsoft.com/pricing/calculator/)  
- [סטטוס Azure](https://status.azure.com/)  

## תרומה

נשמח לקבל תרומות! אנא קראו את [מדריך התרומה](CONTRIBUTING.md) לפרטים על:  
- כיצד להגיש בעיות ובקשות לתכונות  
- הנחיות לתרומת קוד  
- שיפורי תיעוד  
- סטנדרטים קהילתיים  

## תמיכה

- **בעיות**: [דווחו על באגים ובקשו תכונות](https://github.com/microsoft/azd-for-beginners/issues)  
- **דיונים**: [שאלות ותשובות ודיונים בקהילת Microsoft Azure Discord](https://discord.gg/microsoft-azure)  
- **תמיכה ספציפית ל-AI**: הצטרפו לערוץ [#Azure](https://discord.gg/microsoft-azure) לדיונים על AZD + AI Foundry  
- **אימייל**: לפניות פרטיות  
- **Microsoft Learn**: [תיעוד רשמי של Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### תובנות קהילתיות מ-Discord של Azure AI Foundry  

**תוצאות סקר מערוץ #Azure:**  
- **45%** מהמפתחים רוצים להשתמש ב-AZD לעומסי עבודה של AI  
- **אתגרים מובילים**: פריסות מרובות שירותים, ניהול אישורים, מוכנות לייצור  
- **הכי מבוקש**: תבניות ספציפיות ל-AI, מדריכי ניפוי שגיאות, שיטות עבודה מומלצות  

**הצטרפו לקהילה שלנו כדי:**  
- לשתף את חוויות AZD + AI שלכם ולקבל עזרה  
- לגשת לתצוגות מוקדמות של תבניות AI חדשות  
- לתרום לשיטות עבודה מומלצות לפריסת AI  
- להשפיע על פיתוח תכונות עתידיות של AI + AZD  

## רישיון

הפרויקט הזה מורשה תחת רישיון MIT - ראו את קובץ [LICENSE](../../LICENSE) לפרטים.  

## קורסים נוספים

הצוות שלנו מייצר קורסים נוספים! בדקו:  

- [**חדש** פרוטוקול הקשר מודל (MCP) למתחילים](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [סוכני AI למתחילים](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI למתחילים באמצעות .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI למתחילים](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI למתחילים באמצעות Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML למתחילים](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [מדע נתונים למתחילים](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI למתחילים](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [סייבר למתחילים](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [פיתוח אתרים למתחילים](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT למתחילים](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [פיתוח XR למתחילים](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [שליטה ב-GitHub Copilot לתכנות זוגי עם AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [שליטה ב-GitHub Copilot למפתחים ב-C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [בחרו את הרפתקת Copilot שלכם](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**ניווט**  
- **השיעור הבא**: [יסודות AZD](docs/getting-started/azd-basics.md)  

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.