# מעבדת סדנא בינה מלאכותית: הפיכת הפתרונות שלך לבינה מלאכותית לניתנים לפריסה עם AZD

**ניווט פרקים:**  
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)  
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח בראשית בינה מלאכותית  
- **⬅️ הקודם**: [פריסת מודל AI](ai-model-deployment.md)  
- **➡️ הבא**: [שיטות עבודה מומלצות לבינה מלאכותית בפרודקשן](production-ai-practices.md)  
- **🚀 הפרק הבא**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)  

## סקירת הסדנא

מעבדה מעשית זו מלווה מפתחים בתהליך של לקיחת תבנית AI קיימת ופריסתה באמצעות Azure Developer CLI (AZD). תלמדו דפוסים חיוניים לפריסות בינה מלאכותית בפרודקשן באמצעות שירותי Microsoft Foundry.

> **הערת אימות (25-03-2026):** סדנא זו נבדקה עם `azd` `1.23.12`. אם ההתקנה המקומית שלך ישנה, עדכן את AZD לפני ההתחלה כדי שזרימת העבודה לאימות, תבנית ופריסה תתאים לשלבים המפורטים להלן.

**משך:** 2-3 שעות  
**רמה:** בינונית  
**קדם דרישות:** ידע בסיסי ב-Azure, היכרות עם מושגים ב-AI/ML  

## 🎓 מטרות הלימוד

בסיום הסדנא תוכל:  
- ✅ להמיר אפליקציה קיימת של AI לשימוש בתבניות AZD  
- ✅ להגדיר שירותי Microsoft Foundry עם AZD  
- ✅ ליישם ניהול מאובטח של אישורי גישה לשירותי AI  
- ✅ לפרוס אפליקציות AI מוכנות לפרודקשן עם ניטור  
- ✅ לפתור בעיות נפוצות בפריסת AI  

## דרישות מוקדמות

### כלים נדרשים  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) מותקן  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) מותקן  
- [Git](https://git-scm.com/) מותקן  
- עורך קוד (מומלץ VS Code)  

### משאבי Azure  
- מנוי Azure עם גישת משתתף  
- גישה לשירותי Microsoft Foundry Models (או יכולת לבקש גישה)  
- הרשאות יצירת Resource Group  

### ידע מוקדם  
- הבנה בסיסית של שירותי Azure  
- היכרות עם ממשקי שורת פקודה  
- מושגי AI/ML בסיסיים (APIs, דגמים, prompts)  

## הגדרת המעבדה

### שלב 1: הכנת סביבה

1. **אמת התקנות כלים:**  
```bash
# בדוק את התקנת AZD
azd version

# בדוק את Azure CLI
az --version

# התחבר ל-Azure עבור זרימות עבודה של AZD
azd auth login

# התחבר ל-Azure CLI רק אם אתה מתכנן להריץ פקודות az במהלך האבחון
az login
```
  
אם אתה עובד במספר טננטים או שהמנוי שלך לא מזוהה אוטומטית, נסה שוב עם `azd auth login --tenant-id <tenant-id>`.

2. **שכפל את מאגר הסדנא:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## מודול 1: הבנת מבנה AZD לאפליקציות AI

### אנטומיה של תבנית AZD מוכנה לבינה מלאכותית

חקור את הקבצים המרכזיים בתבנית AZD מוכנה ל-AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```
  
### **תרגיל מעבדה 1.1: בחן את הקונפיגורציה**

1. **בחן את הקובץ azure.yaml:**  
```bash
cat azure.yaml
```
  
**מה לחפש:**  
- הגדרות שירות עבור רכיבי AI  
- מיפוי משתני סביבה  
- הגדרות מארח  

2. **סקור את התשתית main.bicep:**  
```bash
cat infra/main.bicep
```
  
**דפוסי AI מרכזיים לזיהוי:**  
- פריסת שירות Microsoft Foundry Models  
- אינטגרציה עם Cognitive Search  
- ניהול מפתחות מאובטח  
- הגדרות אבטחת רשת  

### **נקודת דיון:** מדוע דפוסים אלו חשובים ל-AI

- **תלות בשירותים:** אפליקציות AI דורשות לעיתים שיתוף פעולה בין מספר שירותים  
- **אבטחה:** מפתחות API ונקודות קצה צריכים ניהול מאובטח  
- **סקלאביליות:** לעומסי AI דרישות קנה מידה ייחודיות  
- **ניהול עלויות:** שירותי AI עלולים להיות יקרים אם לא מוגדרים נכון  

## מודול 2: פרוס את אפליקציית ה-AI הראשונה שלך

### שלב 2.1: אתחל את הסביבה

1. **צור סביבה חדשה ב-AZD:**  
```bash
azd env new myai-workshop
```
  
2. **קבע פרמטרים נדרשים:**  
```bash
# הגדר את אזור Azure המועדף עליך
azd env set AZURE_LOCATION eastus

# אופציונלי: הגדר דגם OpenAI ספציפי
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### שלב 2.2: פרוס את התשתית והאפליקציה

1. **פרוס עם AZD:**  
```bash
azd up
```
  
**מה קורה בזמן `azd up`:**  
- ✅ פריסה של שירות Microsoft Foundry Models  
- ✅ יצירת שירות Cognitive Search  
- ✅ הקמת App Service לאפליקציית ווב  
- ✅ הגדרת רשת ואבטחה  
- ✅ פריסת קוד האפליקציה  
- ✅ הקמת ניטור ולוגים  

2. **נטר את התקדמות הפריסה** ושם לב למשאבים שנוצרים.  

### שלב 2.3: אמת את הפריסה שלך

1. **בדוק את המשאבים שפורסו:**  
```bash
azd show
```
  
2. **פתח את האפליקציה שפורסה:**  
```bash
azd show
```
  
פתח את נקודת הקצה של האפליקציה כפי שמוצגת בפלט `azd show`.  

3. **בדוק את פעולת ה-AI:**  
   - עבור לאפליקציית הווב  
   - נסה שאילתות לדוגמא  
   - אמת שהתשובות של ה-AI פועלות  

### **תרגיל מעבדה 2.1: תרגול פתרון בעיות**

**תרחיש:** הפריסה הצליחה אך ה-AI אינו מגיב.

**בעיות נפוצות לבדיקה:**  
1. **מפתחות API ל-OpenAI:** אמת שהם מוגדרים נכון  
2. **זמינות דגם:** בדוק אם האזור שלך תומך בדגם  
3. **קישוריות רשת:** וודא שהשירותים יכולים לתקשר  
4. **הרשאות RBAC:** אמת שהאפליקציה יכולה לגשת ל-OpenAI  

**פקודות ניפוי שגיאות:**  
```bash
# בדוק משתני סביבה
azd env get-values

# הצג יומני פריסה
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# בדוק את מצב הפריסה של OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## מודול 3: התאמה אישית של אפליקציות AI לצרכים שלך

### שלב 3.1: שנה את קונפיגורציית ה-AI

1. **עדכן את דגם ה-OpenAI:**  
```bash
# שנה לדגם שונה (אם זמין באזורך)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# פרוס מחדש עם התצורה החדשה
azd deploy
```
  
2. **הוסף שירותי AI נוספים:**

ערוך את `infra/main.bicep` להוספת Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```
  
### שלב 3.2: קונפיגורציות לפי סביבה

**שיטה מומלצת:** קביעת הגדרות נפרדות לפיתוח מול פרודקשן.

1. **צור סביבה לייצור:**  
```bash
azd env new myai-production
```
  
2. **הגדר פרמטרים ייחודיים לפרודקשן:**  
```bash
# בייצור בדרך כלל משתמשים בקודי מוצר גבוהים יותר
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# הפעל תכונות אבטחה נוספות
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **תרגיל מעבדה 3.1: אופטימיזציית עלויות**

**אתגר:** הגדר את התבנית לפיתוח עם עלויות יעילות.

**מטלות:**  
1. זהה אילו SKU ניתן להגדיר כשכבות חינם/בסיסיות  
2. קבע משתני סביבה למינימום עלויות  
3. פרוס והשווה עלויות מול קונפיגורציית הפרודקשן  

**רמזים לפתרון:**  
- השתמש בשכבת F0 (חינם) לשירותי Cognitive כשאפשר  
- השתמש בשכבת Basic לשירות החיפוש בפיתוח  
- שקול שימוש בתוכנית צריכה לפונקציות  

## מודול 4: אבטחה ושיטות עבודה מומלצות לפרודקשן

### שלב 4.1: ניהול מאובטח של אישורים

**אתגר נוכחי:** אפליקציות AI רבות מקודדות מפתחות API או מאחסנות אותם באופן לא בטוח.

**פתרון AZD:** זהות מנוהלת + אינטגרציה עם Key Vault.

1. **סקור את קונפיגורציית האבטחה בתבנית שלך:**  
```bash
# חפש קונפיגורציה של Key Vault ו-Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **אמת שהזהות המנוהלת פועלת:**  
```bash
# בדוק אם לאפליקציית האינטרנט יש את הגדרות הזהות הנכונות
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### שלב 4.2: אבטחת רשת

1. **אפשר נקודות קצה פרטיות** (אם לא מוגדר עדיין):

הוסף לתבנית הביפה שלך:  
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```
  
### שלב 4.3: ניטור וניתוח

1. **הגדר Application Insights:**  
```bash
# יש להגדיר אוטומטית את Application Insights
# בדוק את ההגדרות:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **הגדר ניטור ייחודי ל-AI:**

הוסף מדדים מותאמים לפעולות AI:  
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```
  
### **תרגיל מעבדה 4.1: בדיקת אבטחה**

**משימה:** סקור את הפריסה שלך ביחס לשיטות אבטחה מיטביות.

**רשימת בדיקה:**  
- [ ] אין סודות מקודדים בקוד או בקונפיגורציה  
- [ ] זהות מנוהלת משמשת לאימות בין שירותים  
- [ ] Key Vault מאחסן קונפיגורציות רגישות  
- [ ] גישת רשת מוגבלת כנדרש  
- [ ] ניטור ולוגים מופעלים  

## מודול 5: המרת אפליקציית ה-AI שלך

### שלב 5.1: טופס הערכה

**לפני המרה של האפליקציה שלך**, ענה על השאלות הבאות:

1. **ארכיטקטורת האפליקציה:**  
   - אילו שירותי AI האפליקציה שלך משתמשת?  
   - אילו משאבי מחשוב היא דורשת?  
   - האם היא זקוקה למסד נתונים?  
   - מהן התלויות בין השירותים?  

2. **דרישות אבטחה:**  
   - אילו נתונים רגישים האפליקציה מטפלת?  
   - אילו דרישות תאימות יש לך?  
   - האם צריך רשת פרטית?  

3. **דרישות קנה מידה:**  
   - מה העומס המצופה?  
   - האם דרוש סקייל אוטומטי?  
   - האם יש דרישות אזוריות?  

### שלב 5.2: צור את תבנית ה-AZD שלך

**עקוב אחרי הדפוס הזה להמרת האפליקציה:**

1. **צור את המבנה הבסיסי:**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# אתחול תבנית AZD
azd init --template minimal
```
  
2. **צור azure.yaml:**  
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```
  
3. **צור תבניות תשתית:**

**infra/main.bicep** - התבנית הראשית:  
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```
  
**infra/modules/openai.bicep** - מודול OpenAI:  
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```
  
### **תרגיל מעבדה 5.1: אתגר יצירת תבנית**

**אתגר:** צור תבנית AZD לאפליקציית AI לעיבוד מסמכים.

**דרישות:**  
- Microsoft Foundry Models לניתוח תוכן  
- Document Intelligence ל-OCR  
- Storage Account להעלאות מסמכים  
- Function App ללוגיקת עיבוד  
- אפליקציית ווב לממשק משתמש  

**נקודות בונוס:**  
- הוסף טיפול שגיאות מתאים  
- כלול הערכת עלות  
- הגדר לוחות ניטור  

## מודול 6: פתרון בעיות נפוצות

### בעיות נפוצות בפריסה

#### בעיה 1: חריגה מקצבת שירות OpenAI  
**תסמינים:** הפריסה נכשלת עם שגיאת קצבה  
**פתרונות:**  
```bash
# בדוק את מכסות הנוכחיות
az cognitiveservices usage list --location eastus

# בקש הגדלת מכסה או נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up
```
  
#### בעיה 2: דגם לא זמין באזור  
**תסמינים:** תגובות AI נכשלות או שגיאות בפריסת דגם  
**פתרונות:**  
```bash
# בדוק זמינות דגם לפי אזור
az cognitiveservices model list --location eastus

# עדכן לדגם זמין
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  
#### בעיה 3: בעיות הרשאה  
**תסמינים:** שגיאות 403 Forbidden בזמן קריאה לשירותי AI  
**פתרונות:**  
```bash
# בדוק השמות תפקידים
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# הוסף תפקידים חסרים
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### בעיות ביצועים

#### בעיה 4: תגובות AI איטיות  
**שלבי חקירה:**  
1. בדוק מדדי ביצועים ב-Application Insights  
2. סקור מדדי שירות OpenAI בפורטל Azure  
3. אמת קישוריות רשת והשהיה  

**פתרונות:**  
- יישם caching לשאילתות נפוצות  
- השתמש בדגם OpenAI מתאים למקרה השימוש שלך  
- שקול שימוש ברפליקות קריאה לעומסים גבוהים  

### **תרגיל מעבדה 6.1: אתגר ניפוי שגיאות**

**תרחיש:** הפריסה הצליחה, אך האפליקציה מחזירה שגיאות 500.

**מטלות תיקון:**  
1. בדוק יומני מערכת של האפליקציה  
2. אמת קישוריות לשירותים  
3. בדוק אימות  
4. סקור קונפיגורציה  

**כלים לשימוש:**  
- `azd show` לצפייה כוללנית בפריסה  
- פורטל Azure ליומני שירות מפורטים  
- Application Insights לטלמטריית אפליקציה  

## מודול 7: ניטור ואופטימיזציה

### שלב 7.1: הקמת ניטור מקיף

1. **צור לוחות בקרה מותאמים אישית:**

נווט לפורטל Azure ויצור לוח בקרה עם:  
- סך הבקשות ומשך התגובה של OpenAI  
- שיעורי שגיאות באפליקציה  
- שימוש במשאבים  
- מעקב עלויות  

2. **הגדר התראות:**  
```bash
# התראה על שיעור שגיאות גבוה
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```
  
### שלב 7.2: אופטימיזציית עלויות

1. **נתח עלויות נוכחיות:**  
```bash
# השתמש ב-Azure CLI כדי לקבל נתוני עלויות
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **יישם בקרות עלות:**  
- הגדרת התראות תקציב  
- שימוש במדיניות סקייל אוטומטי  
- יישום caching לבקשות  
- ניטור שימוש בטוקנים ב-OpenAI  

### **תרגיל מעבדה 7.1: אופטימיזציית ביצועים**

**משימה:** בצע אופטימיזציה לאפליקציית AI לביצועים ולטווח עלויות.

**מדדים לשיפור:**  
- הפחתת זמן תגובה ממוצע ב-20%  
- הפחתת עלויות חודשיות ב-15%  
- שמירת זמינות של 99.9%  

**אסטרטגיות לניסיון:**  
- יישום caching לתגובות  
- אופטימיזציה של prompts ליעילות טוקנים  
- שימוש ב-SKU מחשוב מתאימים  
- הקמת סקייל אוטומטי נכון  

## אתגר סופי: יישום מקצה לקצה

### תרחיש האתגר

אתה מתבקש ליצור צ'טבוט שירות לקוחות מופעל AI מוכוון פרודקשן עם דרישות אלה:

**דרישות פונקציונליות:**  
- ממשק ווב לאינטראקציה עם לקוחות  
- אינטגרציה עם Microsoft Foundry Models לתגובות  
- חיפוש מסמכים באמצעות Cognitive Search  
- אינטגרציה עם מסד נתונים קיים ללקוחות  
- תמיכה בריבוי שפות  

**דרישות לא פונקציונליות:**  
- תמיכה ב-1000 משתמשים בו זמנית  
- SLA של 99.9% זמן פעולה  
- תאימות SOC 2  
- תקציב עד 500$ לחודש  
- פריסה למספר סביבות (dev, staging, prod)  

### שלבי היישום

1. **עצב את הארכיטקטורה**  
2. **צור את תבנית ה-AZD**  
3. **יישם אמצעי אבטחה**  
4. **הקם ניטור והתראות**  
5. **צור צינורות פריסה**  
6. **תעד את הפתרון**  

### קריטריונים להערכה

- ✅ **פונקציונליות:** האם עונה על כל הדרישות?  
- ✅ **אבטחה:** האם יש יישום של שיטות עבודה מומלצות?  
- ✅ **סקלאביליות:** האם יכול להתמודד עם העומס?  
- ✅ **תחזוקה:** האם הקוד והתשתית מאורגנים היטב?  
- ✅ **עלות:** האם עונה לתקציב?  

## משאבים נוספים

### תיעוד מיקרוסופט
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [תיעוד שירות Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [תיעוד Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### דוגמאות תבניות
- [אפליקציית צ'אט של דגמי Microsoft Foundry](https://github.com/Azure-Samples/azure-search-openai-demo)
- [התחלה מהירה של אפליקציית צ'אט OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [צ'אט Contoso](https://github.com/Azure-Samples/contoso-chat)

### משאבים לקהילה
- [Discord של Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)
- [תבניות AZD מעולות](https://azure.github.io/awesome-azd/)

## 🎓 תעודת סיום

מזל טוב! השלמת את מעבדת סדנת ה-AI. כעת אתה אמור להיות מסוגל:

- ✅ להמיר אפליקציות AI קיימות לתבניות AZD
- ✅ לפרוס אפליקציות AI מוכנות לייצור
- ✅ ליישם שיטות אבטחה מיטביות לעומסי עבודה של AI
- ✅ לנטר ולשפר את ביצועי אפליקציות ה-AI
- ✅ לפתור בעיות נפוצות בפריסות

### הצעדים הבאים
1. החל את הדפוסים האלה על פרויקטי AI שלך
2. תרום תבניות בחזרה לקהילה
3. הצטרף ל-Discord של Microsoft Foundry לקבלת תמיכה מתמשכת
4. חקור נושאים מתקדמים כמו פריסות מרובות אזורים

---

**משוב על הסדנה**: עזור לנו לשפר סדנה זו על ידי שיתוף הניסיון שלך בערוץ [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח AI-ראשון
- **⬅️ קודם**: [פריסת מודל AI](ai-model-deployment.md)
- **➡️ הבא**: [שיטות מיטביות ל-AI בייצור](production-ai-practices.md)
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

**צריך עזרה?** הצטרף לקהילה שלנו לתמיכה ודיונים על AZD ופריסות AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב למקור הסמכותי. למידע קריטי, מומלץ לבצע תרגום מקצועי על ידי מתרגם אנושי. אנו לא אחראים על כל אי הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->