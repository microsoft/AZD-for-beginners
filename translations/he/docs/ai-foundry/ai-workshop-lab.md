<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T21:39:28+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "he"
}
-->
# סדנת AI: הפיכת פתרונות AI שלך למוכנים לפריסה עם AZD

**קודם:** [פריסת מודל AI](ai-model-deployment.md) | **הבא:** [שיטות AI בייצור](production-ai-practices.md)

## סקירת הסדנה

סדנה מעשית זו מדריכה מפתחים בתהליך של לקיחת יישום AI קיים והפיכתו למוכן לפריסה באמצעות Azure Developer CLI (AZD). תלמדו דפוסים חיוניים לפריסות AI בייצור באמצעות שירותי Azure AI Foundry.

**משך:** 2-3 שעות  
**רמה:** בינוני  
**דרישות מקדימות:** ידע בסיסי ב-Azure, היכרות עם מושגי AI/ML

## 🎓 מטרות למידה

בסיום הסדנה, תוכלו:
- ✅ להמיר יישום AI קיים לשימוש בתבניות AZD
- ✅ להגדיר שירותי Azure AI Foundry עם AZD
- ✅ ליישם ניהול אישורים מאובטח לשירותי AI
- ✅ לפרוס יישומי AI מוכנים לייצור עם ניטור
- ✅ לפתור בעיות נפוצות בפריסת AI

## דרישות מקדימות

### כלים נדרשים
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) מותקן
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) מותקן
- [Git](https://git-scm.com/) מותקן
- עורך קוד (מומלץ VS Code)

### משאבי Azure
- מנוי Azure עם גישת תורם
- גישה לשירותי Azure OpenAI (או יכולת לבקש גישה)
- הרשאות ליצירת קבוצות משאבים

### ידע נדרש
- הבנה בסיסית של שירותי Azure
- היכרות עם ממשקי שורת פקודה
- מושגי AI/ML בסיסיים (APIs, מודלים, הנחיות)

## הגדרת הסדנה

### שלב 1: הכנת הסביבה

1. **אמת התקנות של כלים:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **שכפל את מאגר הסדנה:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## מודול 1: הבנת מבנה AZD ליישומי AI

### אנטומיה של תבנית AZD מוכנה ל-AI

חקור את הקבצים המרכזיים בתבנית AZD מוכנה ל-AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **תרגיל מעבדה 1.1: חקור את ההגדרות**

1. **בדוק את קובץ azure.yaml:**
```bash
cat azure.yaml
```

**מה לחפש:**
- הגדרות שירותים עבור רכיבי AI
- מיפוי משתני סביבה
- הגדרות מארח

2. **סקור את תשתית main.bicep:**
```bash
cat infra/main.bicep
```

**דפוסי AI מרכזיים לזיהוי:**
- הקצאת שירות Azure OpenAI
- שילוב חיפוש קוגניטיבי
- ניהול מפתחות מאובטח
- הגדרות אבטחת רשת

### **נקודת דיון:** מדוע דפוסים אלו חשובים ל-AI

- **תלות שירותים**: יישומי AI דורשים לעיתים קרובות שירותים מתואמים רבים
- **אבטחה**: מפתחות API ונקודות קצה דורשים ניהול מאובטח
- **יכולת הרחבה**: עומסי עבודה של AI דורשים דרישות ייחודיות להרחבה
- **ניהול עלויות**: שירותי AI יכולים להיות יקרים אם לא מוגדרים כראוי

## מודול 2: פרוס את יישום ה-AI הראשון שלך

### שלב 2.1: אתחל את הסביבה

1. **צור סביבה חדשה ב-AZD:**
```bash
azd env new myai-workshop
```

2. **הגדר פרמטרים נדרשים:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### שלב 2.2: פרוס את התשתית והיישום

1. **פרוס עם AZD:**
```bash
azd up
```

**מה קורה במהלך `azd up`:**
- ✅ מקצה שירות Azure OpenAI
- ✅ יוצר שירות חיפוש קוגניטיבי
- ✅ מגדיר שירות אפליקציות עבור יישום האינטרנט
- ✅ מגדיר רשתות ואבטחה
- ✅ מפרוס קוד יישום
- ✅ מגדיר ניטור ורישום

2. **עקוב אחר התקדמות הפריסה** ושים לב למשאבים שנוצרים.

### שלב 2.3: אמת את הפריסה שלך

1. **בדוק את המשאבים שהוקצו:**
```bash
azd show
```

2. **פתח את היישום שהוקצה:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **בדוק את פונקציונליות ה-AI:**
   - נווט ליישום האינטרנט
   - נסה שאילתות לדוגמה
   - אמת שהתגובות של ה-AI פועלות

### **תרגיל מעבדה 2.1: תרגול פתרון בעיות**

**תסריט**: הפריסה הצליחה אך ה-AI אינו מגיב.

**בעיות נפוצות לבדיקה:**
1. **מפתחות API של OpenAI**: אמת שהם מוגדרים כראוי
2. **זמינות מודל**: בדוק אם האזור שלך תומך במודל
3. **קישוריות רשת**: ודא שהשירותים יכולים לתקשר
4. **הרשאות RBAC**: אמת שהאפליקציה יכולה לגשת ל-OpenAI

**פקודות דיבוג:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## מודול 3: התאמת יישומי AI לצרכים שלך

### שלב 3.1: עדכן את הגדרות ה-AI

1. **עדכן את מודל OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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

### שלב 3.2: הגדרות ייחודיות לסביבה

**שיטה מומלצת**: הגדרות שונות לפיתוח מול ייצור.

1. **צור סביבה לייצור:**
```bash
azd env new myai-production
```

2. **הגדר פרמטרים ייחודיים לייצור:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **תרגיל מעבדה 3.1: אופטימיזציה של עלויות**

**אתגר**: הגדר את התבנית לפיתוח חסכוני.

**משימות:**
1. זהה אילו SKUs ניתן להגדיר לרמות חינמיות/בסיסיות
2. הגדר משתני סביבה לעלויות מינימליות
3. פרוס והשווה עלויות עם הגדרת הייצור

**רמזים לפתרון:**
- השתמש ברמת F0 (חינמית) עבור שירותים קוגניטיביים כשאפשר
- השתמש ברמת Basic עבור שירות החיפוש בפיתוח
- שקול להשתמש בתוכנית צריכה עבור פונקציות

## מודול 4: אבטחה ושיטות ייצור מומלצות

### שלב 4.1: ניהול אישורים מאובטח

**אתגר נוכחי**: יישומי AI רבים מקודדים מפתחות API או משתמשים באחסון לא מאובטח.

**פתרון AZD**: זהות מנוהלת + אינטגרציה עם Key Vault.

1. **סקור את הגדרות האבטחה בתבנית שלך:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **אמת שזהות מנוהלת פועלת:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### שלב 4.2: אבטחת רשת

1. **הפעל נקודות קצה פרטיות** (אם לא הוגדרו כבר):

הוסף לתבנית bicep שלך:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **הגדר ניטור מותאם ל-AI:**

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

**משימה**: סקור את הפריסה שלך לשיטות אבטחה מומלצות.

**רשימת בדיקה:**
- [ ] אין סודות מקודדים בקוד או בהגדרות
- [ ] זהות מנוהלת משמשת לאימות בין שירותים
- [ ] Key Vault מאחסן הגדרות רגישות
- [ ] גישת רשת מוגבלת כראוי
- [ ] ניטור ורישום מופעלים

## מודול 5: המרת יישום ה-AI שלך

### שלב 5.1: גיליון הערכה

**לפני המרת האפליקציה שלך**, ענה על השאלות הבאות:

1. **ארכיטקטורת יישום:**
   - אילו שירותי AI האפליקציה שלך משתמשת?
   - אילו משאבי מחשוב היא צריכה?
   - האם היא דורשת מסד נתונים?
   - מהן התלויות בין השירותים?

2. **דרישות אבטחה:**
   - אילו נתונים רגישים האפליקציה שלך מטפלת?
   - אילו דרישות תאימות יש לך?
   - האם אתה צריך רשת פרטית?

3. **דרישות הרחבה:**
   - מהו העומס הצפוי שלך?
   - האם אתה צריך הרחבה אוטומטית?
   - האם יש דרישות אזוריות?

### שלב 5.2: צור את תבנית AZD שלך

**עקוב אחר דפוס זה להמרת האפליקציה שלך:**

1. **צור את המבנה הבסיסי:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

**אתגר**: צור תבנית AZD עבור אפליקציית AI לעיבוד מסמכים.

**דרישות:**
- Azure OpenAI לניתוח תוכן
- Document Intelligence ל-OCR
- חשבון אחסון להעלאת מסמכים
- אפליקציית פונקציות ללוגיקת עיבוד
- אפליקציית אינטרנט לממשק משתמש

**נקודות בונוס:**
- הוסף טיפול שגיאות מתאים
- כלול הערכת עלויות
- הגדר לוחות מחוונים לניטור

## מודול 6: פתרון בעיות נפוצות

### בעיות פריסה נפוצות

#### בעיה 1: מכסת שירות OpenAI חרגה
**תסמינים:** הפריסה נכשלת עם שגיאת מכסה  
**פתרונות:**  
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### בעיה 2: מודל לא זמין באזור
**תסמינים:** תגובות AI נכשלות או שגיאות בפריסת מודל  
**פתרונות:**  
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### בעיה 3: בעיות הרשאה
**תסמינים:** שגיאות 403 Forbidden בעת קריאה לשירותי AI  
**פתרונות:**  
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### בעיות ביצועים

#### בעיה 4: תגובות AI איטיות
**שלבי חקירה:**
1. בדוק את Application Insights למדדי ביצועים
2. סקור מדדי שירות OpenAI בפורטל Azure
3. אמת קישוריות רשת ועיכוב

**פתרונות:**
- יישם מטמון לשאילתות נפוצות
- השתמש במודל OpenAI המתאים למקרה השימוש שלך
- שקול שכפול קריאה לתרחישים עם עומס גבוה

### **תרגיל מעבדה 6.1: אתגר דיבוג**

**תסריט**: הפריסה הצליחה, אך האפליקציה מחזירה שגיאות 500.

**משימות דיבוג:**
1. בדוק יומני אפליקציה
2. אמת קישוריות שירות
3. בדוק אימות
4. סקור הגדרות

**כלים לשימוש:**
- `azd show` לסקירת פריסה
- פורטל Azure ליומני שירות מפורטים
- Application Insights לטלמטריה של אפליקציה

## מודול 7: ניטור ואופטימיזציה

### שלב 7.1: הגדר ניטור מקיף

1. **צור לוחות מחוונים מותאמים אישית:**

נווט לפורטל Azure וצור לוח מחוונים עם:
- ספירת בקשות OpenAI ועיכוב
- שיעורי שגיאות אפליקציה
- ניצול משאבים
- מעקב עלויות

2. **הגדר התראות:**
```bash
# Alert for high error rate
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
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **יישם בקרות עלויות:**
- הגדר התראות תקציב
- השתמש במדיניות הרחבה אוטומטית
- יישם מטמון בקשות
- עקוב אחר שימוש בטוקנים עבור OpenAI

### **תרגיל מעבדה 7.1: אופטימיזציית ביצועים**

**משימה**: אופטימיזציה של יישום ה-AI שלך לביצועים ועלויות.

**מדדים לשיפור:**
- הפחת זמן תגובה ממוצע ב-20%
- הפחת עלויות חודשיות ב-15%
- שמור על זמן פעולה של 99.9%

**אסטרטגיות לנסות:**
- יישם מטמון תגובות
- אופטימיזציה של הנחיות ליעילות טוקנים
- השתמש ב-SKU מחשוב מתאים
- הגדר הרחבה אוטומטית נכונה

## אתגר סופי: יישום מקצה לקצה

### תרחיש אתגר

נתבקשת ליצור צ'אטבוט שירות לקוחות מבוסס AI מוכן לייצור עם הדרישות הבאות:

**דרישות פונקציונליות:**
- ממשק אינטרנט לאינטראקציות עם לקוחות
- שילוב עם Azure OpenAI לתגובות
- יכולת חיפוש מסמכים באמצעות חיפוש קוגניטיבי
- שילוב עם מסד נתונים לקוחות קיים
- תמיכה רב-לשונית

**דרישות לא פונקציונליות:**
- טיפול ב-1000 משתמשים בו-זמנית
- SLA זמן פעולה של 99.9%
- תאימות SOC 2
- עלות מתחת ל-$500 לחודש
- פריסה לסביבות מרובות (פיתוח, בדיקות, ייצור)

### שלבי יישום

1. **עצב את הארכיטקטורה**
2. **צור את תבנית AZD**
3. **יישם אמצעי אבטחה**
4. **הגדר ניטור והתראות**
5. **צור צינורות פריסה**
6. **תעד את הפתרון**

### קריטריוני הערכה

- ✅ **פונקציונליות**: האם זה עומד בכל הדרישות?
- ✅ **אבטחה**: האם שיטות מומלצות מיושמות?
- ✅ **יכולת הרחבה**: האם זה יכול להתמודד עם העומס?
- ✅ **יכולת תחזוקה**: האם הקוד והתשתית מאורגנים היטב?
- ✅ **עלות**: האם זה נשאר במסגרת התקציב?

## משאבים נוספים

### תיעוד של Microsoft
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [תיעוד שירות Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [תיעוד Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### תבניות לדוגמה
- [אפליקציית צ'אט Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [מדריך מהיר לאפליקציית צ'אט OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [צ'אט Contoso](https://github.com/Azure-Samples/contoso-chat)

### משאבי קהילה
- [Discord של Azure AI Foundry](https://discord.gg/microsoft-azure)
- [GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)
- [תבניות AZD מעולות](https://azure.github.io/awesome-azd/)

## 🎓 תעודת סיום

מזל טוב! השלמת את סדנת AI. כעת אתה אמור להיות מסוגל:

- ✅ להמיר יישומי AI קיימים לתבניות AZD
- ✅ לפרוס יישומי AI מוכנים לייצור
- ✅ יישום שיטות עבודה מומלצות לאבטחת עומסי עבודה של AI  
- ✅ ניטור ואופטימיזציה של ביצועי יישומי AI  
- ✅ פתרון בעיות נפוצות בפריסה  

### צעדים הבאים  
1. יישמו את הדפוסים הללו בפרויקטי AI שלכם  
2. תרמו תבניות חזרה לקהילה  
3. הצטרפו ל-Discord של Azure AI Foundry לקבלת תמיכה מתמשכת  
4. חקרו נושאים מתקדמים כמו פריסות מרובות אזורים  

---

**משוב על הסדנה**: עזרו לנו לשפר את הסדנה הזו על ידי שיתוף החוויה שלכם ב-[ערוץ Azure ב-Discord של Azure AI Foundry](https://discord.gg/microsoft-azure).  

---

**קודם:** [פריסת מודל AI](ai-model-deployment.md) | **הבא:** [שיטות עבודה ב-AI בייצור](production-ai-practices.md)  

**זקוקים לעזרה?** הצטרפו לקהילה שלנו לקבלת תמיכה ודיונים על AZD ופריסות AI.  

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.