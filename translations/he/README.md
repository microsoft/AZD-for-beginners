<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T10:07:25+00:00",
  "source_file": "README.md",
  "language_code": "he"
}
-->
# AZD למתחילים

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.he.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

עקבו אחר השלבים הבאים כדי להתחיל להשתמש במשאבים אלו:  
1. **פיצול הריפו**: לחצו [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **שכפול הריפו**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**הצטרפו לקהילות Azure Discord ופגשו מומחים ומפתחים נוספים**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 תמיכה רב-שפתית

#### נתמך באמצעות GitHub Action (אוטומטי ותמיד מעודכן)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](./README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**אם תרצו להוסיף שפות נוספות, רשימת השפות הנתמכות נמצאת [כאן](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## מבוא

ברוכים הבאים למדריך המקיף עבור Azure Developer CLI (azd). ריפו זה נועד לעזור למפתחים בכל הרמות, החל מסטודנטים ועד מפתחים מקצועיים, ללמוד ולשלוט ב-Azure Developer CLI לצורך פריסות ענן יעילות. משאב הלמידה המובנה הזה מספק ניסיון מעשי עם פריסות ענן ב-Azure, פתרון בעיות נפוצות ויישום שיטות עבודה מומלצות לפריסות תבניות AZD מוצלחות.

## מטרות למידה

על ידי עבודה עם ריפו זה, תלמדו:
- לשלוט ביסודות ובמושגים המרכזיים של Azure Developer CLI  
- ללמוד כיצד לפרוס ולהקצות משאבי Azure באמצעות Infrastructure as Code  
- לפתח מיומנויות פתרון בעיות עבור בעיות פריסה נפוצות ב-AZD  
- להבין בדיקות לפני פריסה ותכנון קיבולת  
- ליישם שיטות עבודה מומלצות לאבטחה ואופטימיזציה של עלויות  
- לבנות ביטחון בפריסת אפליקציות מוכנות לייצור ב-Azure  

## תוצאות למידה

לאחר סיום הקורס, תוכלו:
- להתקין, להגדיר ולהשתמש ב-Azure Developer CLI בהצלחה  
- ליצור ולפרוס אפליקציות באמצעות תבניות AZD  
- לפתור בעיות אימות, תשתית ובעיות פריסה  
- לבצע בדיקות לפני פריסה כולל תכנון קיבולת ובחירת SKU  
- ליישם שיטות עבודה מומלצות לניטור, אבטחה וניהול עלויות  
- לשלב תהליכי עבודה של AZD בצינורות CI/CD  

## תוכן עניינים

- [מהו Azure Developer CLI?](../..)  
- [התחלה מהירה](../..)  
- [תיעוד](../..)  
- [דוגמאות ותבניות](../..)  
- [משאבים](../..)  
- [תרומה](../..)  

## מהו Azure Developer CLI?

Azure Developer CLI (azd) הוא ממשק שורת פקודה ממוקד מפתחים שמאיץ את תהליך בניית ופריסת אפליקציות ב-Azure. הוא מספק:

- **פריסות מבוססות תבניות** - שימוש בתבניות מוכנות לדפוסי אפליקציות נפוצים  
- **Infrastructure as Code** - ניהול משאבי Azure באמצעות Bicep או Terraform  
- **תהליכי עבודה משולבים** - הקצאה, פריסה וניטור אפליקציות בצורה חלקה  
- **ידידותי למפתחים** - מותאם לפרודוקטיביות וחוויית מפתחים  

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

## תיעוד

### התחלה
- [**יסודות AZD**](docs/getting-started/azd-basics.md) - מושגים ומונחים מרכזיים  
- [**התקנה והגדרה**](docs/getting-started/installation.md) - מדריכי התקנה לפי פלטפורמה  
- [**הגדרה**](docs/getting-started/configuration.md) - הגדרת סביבה ואימות  
- [**הפרויקט הראשון שלכם**](docs/getting-started/first-project.md) - מדריך שלב-אחר-שלב  

### פריסה והקצאה
- [**מדריך פריסה**](docs/deployment/deployment-guide.md) - תהליכי פריסה מלאים  
- [**הקצאת משאבים**](docs/deployment/provisioning.md) - ניהול משאבי Azure  

### בדיקות לפני פריסה
- [**תכנון קיבולת**](docs/pre-deployment/capacity-planning.md) - אימות קיבולת משאבי Azure  
- [**בחירת SKU**](docs/pre-deployment/sku-selection.md) - בחירת SKU מתאימים ב-Azure  
- [**בדיקות מקדימות**](docs/pre-deployment/preflight-checks.md) - סקריפטים לאימות אוטומטי  

### פתרון בעיות
- [**בעיות נפוצות**](docs/troubleshooting/common-issues.md) - בעיות נפוצות ופתרונות  
- [**מדריך דיבוג**](docs/troubleshooting/debugging.md) - אסטרטגיות דיבוג שלב-אחר-שלב  

## דוגמאות ותבניות
- [**דוגמאות**](examples/README.md) - דוגמאות מעשיות, תבניות ותסריטים אמיתיים שיעזרו לכם ללמוד את Azure Developer CLI דרך תרגול מעשי. כל דוגמה מספקת קוד עובד מלא, תבניות תשתית והוראות מפורטות עבור ארכיטקטורות אפליקציות ודפוסי פריסה שונים.  

### מעבדה מעשית/סדנה
- [**AZD למתחילים**](workshop/README.md) - סדנה זו תתמקד בתבנית Get Started with AI Agents AZD ותספק תרגול מעשי לשיטות עבודה מומלצות לפריסת שירותי Azure AI באמצעות AZD  

## משאבים

### הפניות מהירות
- [**דף פקודות**](resources/cheat-sheet.md) - פקודות azd חיוניות  
- [**מילון מונחים**](resources/glossary.md) - מונחים של Azure ו-azd  
- [**שאלות נפוצות**](resources/faq.md) - שאלות נפוצות  
- [**מדריך לימוד**](resources/study-guide.md) - מטרות למידה מקיפות ותרגילים מעשיים  

### משאבים חיצוניים
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [מחשבון תמחור Azure](https://azure.microsoft.com/pricing/calculator/)  
- [סטטוס Azure](https://status.azure.com/)  

## מסלול לימוד

### לסטודנטים ומתחילים
1. התחילו עם [יסודות AZD](docs/getting-started/azd-basics.md)  
2. עקבו אחר [מדריך ההתקנה](docs/getting-started/installation.md)  
3. השלימו את [הפרויקט הראשון שלכם](docs/getting-started/first-project.md)  
4. תרגלו עם [דוגמת אפליקציית אינטרנט פשוטה](../../examples/simple-web-app)  

### למפתחים
1. עיינו ב-[מדריך ההגדרה](docs/getting-started/configuration.md)  
2. למדו את [מדריך הפריסה](docs/deployment/deployment-guide.md)  
3. עבדו עם [דוגמת אפליקציית בסיס נתונים](../../examples/database-app)  
4. חקרו את [דוגמת אפליקציית קונטיינר](../../examples/container-app)  

### למהנדסי DevOps
1. שלטו ב-[הקצאת משאבים](docs/deployment/provisioning.md)  
2. יישמו [בדיקות מקדימות](docs/pre-deployment/preflight-checks.md)  
3. תרגלו [תכנון קיבולת](docs/pre-deployment/capacity-planning.md)  
4. דוגמת [מיקרו-שירותים מתקדמת](../../examples/microservices)  

## תרומה

נשמח לקבל תרומות! אנא קראו את [מדריך התרומה](CONTRIBUTING.md) לפרטים על:  
- כיצד להגיש בעיות ובקשות לתכונות  
- הנחיות לתרומת קוד  
- שיפורי תיעוד  
- סטנדרטים קהילתיים  

## תמיכה

- **בעיות**: [דווחו על באגים ובקשו תכונות](https://github.com/microsoft/azd-for-beginners/issues)  
- **דיונים**: [שאלות ותשובות ודיונים בקהילת Microsoft Azure Discord](https://discord.gg/microsoft-azure)  
- **אימייל**: לפניות פרטיות  
- **Microsoft Learn**: [תיעוד רשמי של Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## רישיון

הפרויקט הזה מורשה תחת רישיון MIT - ראו את [LICENSE](../../LICENSE) לפרטים.  

## 🎒 קורסים נוספים

הצוות שלנו מייצר קורסים נוספים! בדקו:  

- [**חדש** Model Context Protocol (MCP) למתחילים](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
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
- [שליטה ב-GitHub Copilot לתכנות זוגי מבוסס AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [שליטה ב-GitHub Copilot למפתחים ב-C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [בחרו את הרפתקת ה-Copilot שלכם](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**ניווט**  
- **השיעור הבא**: [יסודות AZD](docs/getting-started/azd-basics.md)  

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.