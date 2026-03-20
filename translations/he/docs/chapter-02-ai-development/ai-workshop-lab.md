# מעבדת סדנת AI: הפיכת הפתרונות שלך של AI לניתנים לפריסה עם AZד

**ניווט בפרקים:**  
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)  
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח מבוסס AI ראשוני  
- **⬅️ קודם**: [פריסת מודל AI](ai-model-deployment.md)  
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בפרודקשן](production-ai-practices.md)  
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)  

## סקירת הסדנה

מעבדה מעשית זו מדריכה מפתחים בתהליך של לקיחת תבנית AI קיימת ופריסתה באמצעות Azure Developer CLI (AZD). תלמדו דפוסים חיוניים לפריסות AI בפרודקשן באמצעות שירותי Microsoft Foundry.

**משך:** שעתיים-שלוש  
**רמה:** בינונית  
**דרישות מוקדמות:** ידע בסיסי ב-Azure, הכרות עם מושגי AI/ML  

## 🎓 מטרות הלמידה

בסיום הסדנה תוכלו:  
- ✅ להמיר אפליקציית AI קיימת לשימוש בתבניות AZD  
- ✅ להגדיר שירותי Microsoft Foundry באמצעות AZD  
- ✅ ליישם ניהול מאובטח של אישורים לשירותי AI  
- ✅ לפרוס אפליקציות AI מוכנות לפרודקשן עם ניטור  
- ✅ לפתור תקלות נפוצות בפריסת AI  

## דרישות מוקדמות

### כלים דרושים  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) מותקן  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) מותקן  
- [Git](https://git-scm.com/) מותקן  
- עורך קוד (מומלץ VS Code)  

### משאבי Azure  
- מנוי Azure עם הרשאת תורם  
- גישה לשירותי Microsoft Foundry Models (או יכולת לבקש גישה)  
- הרשאות יצירת Resource Group  

### דרישות ידע  
- הבנה בסיסית של שירותי Azure  
- הכרות עם ממשקי שורת פקודה  
- מושגי AI/ML בסיסיים (APIs, מודלים, פרומפטים)  

## הגדרת המעבדה

### שלב 1: הכנת הסביבה

1. **אמת התקנת כלים:**  
```bash
# בדוק התקנת AZD
azd version

# בדוק את Azure CLI
az --version

# התחבר ל-Azure
az login
azd auth login
```
  
2. **שכפל את מאגר הסדנה:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## מודול 1: הבנת מבנה AZD לאפליקציות AI

### אנטומיית תבנית AI ב-AZD

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
  
### **תרגיל מעבדה 1.1: חקור את התצורה**

1. **בדוק את קובץ azure.yaml:**  
```bash
cat azure.yaml
```
  
**מה לחפש:**  
- הגדרות שירותים עבור רכיבי AI  
- מיפוי משתני סביבה  
- הגדרות מארחים  

2. **עיין בתשתית main.bicep:**  
```bash
cat infra/main.bicep
```
  
**דפוסי AI מרכזיים לזיהוי:**  
- אספקת שירות Microsoft Foundry Models  
- אינטגרציה של Cognitive Search  
- ניהול מפתחות מאובטח  
- הגדרות אבטחת רשת  

### **נקודת דיון:** למה דפוסים אלו חשובים ל-AI

- **תלות בשירותים:** אפליקציות AI דורשות פעמים רבות כמה שירותים מתואמים  
- **אבטחה:** מפתחות API ונקודות קצה צריכים ניהול מאובטח  
- **מידות:** עומסי AI מחייבים דרישות קנה מידה ייחודיות  
- **ניהול עלויות:** שירותי AI עלולים להיות יקרים אם לא מוגדרים נכון  

## מודול 2: פרוס את אפליקציית ה-AI הראשונה שלך

### שלב 2.1: אתחל את הסביבה

1. **צור סביבה חדשה עם AZD:**  
```bash
azd env new myai-workshop
```
  
2. **הגדר פרמטרים נדרשים:**  
```bash
# הגדר את אזור Azure המועדף עליך
azd env set AZURE_LOCATION eastus

# אופציונלי: הגדר דגם OpenAI ספציפי
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```
  
### שלב 2.2: פרוס את התשתית והאפליקציה

1. **פרוס עם AZD:**  
```bash
azd up
```
  
**מה קורה במהלך `azd up`:**  
- ✅ מספק שירות Microsoft Foundry Models  
- ✅ יוצר שירות Cognitive Search  
- ✅ מקים App Service לאפליקציית ווב  
- ✅ מגדיר רשת ואבטחה  
- ✅ מפעיל קוד האפליקציה  
- ✅ מגדיר ניטור ורישום  

2. **נטר את התקדמות הפריסה** וציין את המשאבים שנוצרים.  

### שלב 2.3: אמת את הפריסה שלך

1. **בדוק את המשאבים שהופעלו:**  
```bash
azd show
```
  
2. **פתח את האפליקציה שהופעלה:**  
```bash
azd show --output json | grep "webAppUrl"
```
  
3. **בדוק את פונקציונליות ה-AI:**  
   - עבור לאפליקציית הווב  
   - נסה שאילתות לדוגמה  
   - אמת שהתגובות של ה-AI פועלות  

### **תרגיל מעבדה 2.1: תרגול פתרון תקלות**

**תרחיש:** הפריסה הצליחה אך ה-AI לא מגיב.

**בעיות נפוצות לבדיקה:**  
1. **מפתחות API של OpenAI:** אמת שהם מוגדרים נכון  
2. **זמינות מודל:** בדוק אם האזור שלך תומך במודל  
3. **קישוריות רשת:** ודא שהשירותים יכולים לתקשר  
4. **הרשאות RBAC:** אמת שהאפליקציה יכולה לגשת ל-OpenAI  

**פקודות דיבוג:**  
```bash
# בדוק משתני סביבה
azd env get-values

# הצג יומני פריסה
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# בדוק את סטטוס הפריסה של OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## מודול 3: התאמת אפליקציות AI לצרכים שלך

### שלב 3.1: שנה את תצורת ה-AI

1. **עדכן את מודל OpenAI:**  
```bash
# שנה לדגם שונה (אם זמין באזור שלך)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# הפעל מחדש עם התצורה החדשה
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
  
### שלב 3.2: תצורות ספציפיות לסביבה

**שיטה מומלצת:** תצורות שונות לסביבת פיתוח מול פרודקשן.

1. **צור סביבה לפרודקשן:**  
```bash
azd env new myai-production
```
  
2. **הגדר פרמטרים ייחודיים לפרודקשן:**  
```bash
# ייצור בדרך כלל משתמש במוצרי SKU גבוהים יותר
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# אפשר תכונות אבטחה נוספות
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **תרגיל מעבדה 3.1: אופטימיזציה של עלויות**

**אתגר:** הגדר את התבנית לפיתוח חסכוני בעלויות.

**משימות:**  
1. זהה אילו SKUs ניתן להגדיר ברמות חינמיות/בסיסיות  
2. קבע משתני סביבה להוצאות מינימליות  
3. פרוס והשווה עלויות עם תצורת הפרודקשן  

**רמזים לפתרון:**  
- השתמש ברמת F0 (חינמית) לשירותי Cognitive מתי שאפשר  
- השתמש ברמת Basic לשירות Search בפיתוח  
- שקול שימוש בתוכנית צריכה עבור Functions  

## מודול 4: אבטחה ושיטות עבודה מומלצות לפרודקשן

### שלב 4.1: ניהול מאובטח של אישורים

**אתגר נוכחי:** אפליקציות AI רבות מקודדות מפתחות API או משתמשות באחסון לא מאובטח.

**פתרון AZD:** זהות מנוהלת + אינטגרציה עם Key Vault.

1. **סקור את תצורת האבטחה בתבנית שלך:**  
```bash
# חפש תצורת Key Vault ו-Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **אמת שהזהות המנוהלת פועלת:**  
```bash
# בדוק אם לאפליקציית האינטרנט יש את תצורת הזהות הנכונה
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### שלב 4.2: אבטחת רשת

1. **אפשר נקודות קצה פרטיות** (אם לא מוגדרים כבר):

הוסף לתבנית הביספ שלך:  
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
  
### שלב 4.3: ניטור ותצפית

1. **הגדר Application Insights:**  
```bash
# יש להגדיר אוטומטית את Application Insights
# בדוק את ההגדרה:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **הגדר ניטור ייעודי ל-AI:**

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
  
### **תרגיל מעבדה 4.1: ביקורת אבטחה**

**משימה:** סקור את הפריסה שלך לשיטות עבודה מומלצות באבטחה.

**רשימת בדיקה:**  
- [ ] אין סודות מקודדים בקוד או בתצורה  
- [ ] נעשה שימוש בזהות מנוהלת לאימות שירות-לשירות  
- [ ] Key Vault מאחסן תצורה רגישה  
- [ ] הגבלת גישה לרשת מוגדרת כראוי  
- [ ] ניטור ורישום מופעלים  

## מודול 5: המרת אפליקציית AI משלך

### שלב 5.1: גליון הערכה

**לפני המרת האפליקציה שלך**, השב על השאלות הבאות:

1. **ארכיטקטורת האפליקציה:**  
   - אילו שירותי AI האפליקציה שלך משתמשת?  
   - אילו משאבי מחשוב נדרשים?  
   - האם נדרש בסיס נתונים?  
   - מה התלויות בין השירותים?  

2. **דרישות אבטחה:**  
   - אילו נתונים רגישים מטופלים באפליקציה?  
   - אילו דרישות תאימות יש לך?  
   - האם נדרשת רשת פרטית?  

3. **דרישות מידות:**  
   - מה העומס הצפוי?  
   - האם דרוש קנה מידה אוטומטי?  
   - האם יש דרישות אזוריות?  

### שלב 5.2: צור את תבנית AZD שלך

**עקוב אחרי דפוס זה להמרת האפליקציה שלך:**

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

**infra/main.bicep** - תבנית ראשית:  
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
- Storage Account להעלאת מסמכים  
- Function App ללוגיקת עיבוד  
- אפליקציית ווב לממשק משתמש  

**נקודות בונוס:**  
- הוסף טיפול בשגיאות מתאים  
- כלול הערכת עלויות  
- הגדר לוחות ניטור  

## מודול 6: פתרון בעיות נפוצות

### בעיות פריסה נפוצות

#### בעיה 1: חריגה ממכסת שירות OpenAI  
**תסמינים:** הפריסה נכשלה עם שגיאת מכסה  
**פתרונות:**  
```bash
# בדוק מכסות נוכחיות
az cognitiveservices usage list --location eastus

# בקש הגדלת מכסה או נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up
```
  
#### בעיה 2: מודל לא זמין באזור  
**תסמינים:** תגובות AI נכשלות או שגיאות בפריסת מודל  
**פתרונות:**  
```bash
# בדוק את זמינות הדגם לפי אזור
az cognitiveservices model list --location eastus

# עדכן לדגם הזמין
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```
  
#### בעיה 3: בעיות הרשאות  
**תסמינים:** שגיאות 403 Forbidden בעת קריאה לשירותי AI  
**פתרונות:**  
```bash
# בדוק הקצאות תפקידים
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
1. בדוק Application Insights למדדי ביצועים  
2. עיין במדדי שירות OpenAI בפורטל Azure  
3. אמת קישוריות רשת והשהיה  

**פתרונות:**  
- יישם קאשינג לשאילתות נפוצות  
- השתמש במודל OpenAI המתאים למקרה השימוש שלך  
- שקול רפליקות קריאה לתרחישי עומס גבוה  

### **תרגיל מעבדה 6.1: אתגר דיבוג**

**תרחיש:** הפריסה הצליחה, אך האפליקציה מחזירה שגיאות 500.

**משימות דיבוג:**  
1. בדוק יומני האפליקציה  
2. אמת חיבור לשירות  
3. בדוק אימות  
4. סקור תצורה  

**כלים לשימוש:**  
- `azd show` לתצוגת מצב הפריסה  
- פורטל Azure ליומני שירות מפורטים  
- Application Insights לטלמטריה של האפליקציה  

## מודול 7: ניטור ואופטימיזציה

### שלב 7.1: הגדר ניטור רחב היקף

1. **צור לוחות בקרה מותאמים אישית:**

נווט לפורטל Azure וצרו לוח בקרה עם:  
- ספירת בקשות OpenAI ועיכובים  
- שיעורי שגיאות באפליקציה  
- ניצול משאבים  
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
  
### שלב 7.2: אופטימיזציה של עלויות

1. **נתח עלויות נוכחיות:**  
```bash
# השתמש ב-Azure CLI לקבלת נתוני עלויות
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **יישם בקרות עלויות:**  
- הגדר התראות תקציב  
- השתמש במדיניות קנה מידה אוטומטית  
- יישם קאשינג לבקשות  
- נטר שימוש בטוקנים של OpenAI  

### **תרגיל מעבדה 7.1: אופטימיזציה של ביצועים**

**משימה:** אופטימז את אפליקציית ה-AI שלך הן לביצועים והן לעלויות.

**מדדים לשיפור:**  
- הפחת זמן תגובה ממוצע ב-20%  
- הפחת עלויות חודשיות ב-15%  
- שמור על זמינות של 99.9%  

**אסטרטגיות לנסות:**  
- יישם קאשינג לתגובות  
- אופטימיזציה של פרומפטים ליעילות טוקנים  
- השתמש ב-SKU המחשוב המתאים  
- הגדר קנה מידה אוטומטי נכון  

## אתגר סופי: יישום מקצה לקצה

### תרחיש האתגר

אתה אמון על יצירת צ׳אטבוט שירות לקוחות מונפש AI מוכן לפרודקשן עם הדרישות האלה:

**דרישות פונקציונליות:**  
- ממשק ווב לאינטראקציות עם לקוחות  
- אינטגרציה עם Microsoft Foundry Models לתגובות  
- יכולת חיפוש במסמכים באמצעות Cognitive Search  
- אינטגרציה עם בסיס נתונים קיים של לקוחות  
- תמיכה בריבוי שפות  

**דרישות לא פונקציונליות:**  
- תמיכה ב-1000 משתמשים במקביל  
- SLA של זמינות 99.9%  
- תאימות SOC 2  
- עלות מתחת ל-500$ לחודש  
- פריסה לסביבות רבות (פיתוח, בדיקה, פרודקשן)  

### שלבי היישום

1. **תכנן את הארכיטקטורה**  
2. **צור את תבנית AZD**  
3. **יישם אמצעי אבטחה**  
4. **הגדר ניטור והתראות**  
5. **צור צנרת פריסה**  
6. **תעד את הפתרון**  

### קריטריוני הערכה

- ✅ **פונקציונליות:** האם עומד בכל הדרישות?  
- ✅ **אבטחה:** האם יושמו שיטות עבודה טובות?  
- ✅ **קנה מידה:** האם יכול להתמודד עם העומס?  
- ✅ **תחזוקה:** האם הקוד והתשתית מאורגנים היטב?  
- ✅ **עלות:** האם נשמר במסגרת התקציב?  

## משאבים נוספים

### תיעוד של מיקרוסופט  
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [תיעוד שירות Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [תיעוד Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### תבניות לדוגמה  
- [אפליקציית צ'אט Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [התחלה מהירה של אפליקציית צ'אט OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)  
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)  

### משאבים קהילתיים  
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)  
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)  

## 🎓 תעודת סיום

ברכות! סיימת את מעבדת סדנת ה-AI. כעת עליך להיות قادر ל:
- ✅ המרת יישומי AI קיימים לתבניות AZD  
- ✅ פריסת יישומי AI מוכנים לייצור  
- ✅ יישום שיטות אבטחה מיטביות לעומסי עבודה של AI  
- ✅ ניטור ואופטימיזציה של ביצועי יישומי AI  
- ✅ פתרון בעיות נפוצות בפריסות  

### שלבים הבאים  
1. החל דפוסים אלה על פרויקטי ה-AI שלך  
2. תרום תבניות חזרה לקהילה  
3. הצטרף לשרת ה-Discord של Microsoft Foundry לתמיכה שוטפת  
4. חקור נושאים מתקדמים כגון פריסות בריבוי אזורים  

---

**משוב על סדנה**: סייע לנו לשפר סדנה זו על ידי שיתוף החוויה שלך בערוץ [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).  

---

**ניווט בפרק:**  
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)  
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח מבוסס AI First  
- **⬅️ קודם**: [פריסת מודל AI](ai-model-deployment.md)  
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בייצור](production-ai-practices.md)  
- **🚀 הפרק הבא**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)  

**צריך עזרה?** הצטרף לקהילה שלנו לתמיכה ולדיונים על AZD ופריסות AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים לכלול שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור נחשב למקור המוסמך. למידע קריטי מומלץ להשתמש בתרגום מקצועי יומי. אנו לא אחראים לכל אי-הבנות או פרשנויות מוטעות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->