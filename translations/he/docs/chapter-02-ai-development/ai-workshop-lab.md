# מעבדת סדנת AI: הפיכת פתרונות ה-AI שלך לפריסת AZד-Deployable

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח AI-ראשון
- **⬅️ הקודם**: [פריסת מודל AI](ai-model-deployment.md)
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בייצור](production-ai-practices.md)
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

## סקירת הסדנה

מעבדה מעשית זו מנחה מפתחים בתהליך קבלת תבנית AI קיימת ופריסתה באמצעות Azure Developer CLI (AZD). תלמדו דפוסים חיוניים לפריסות AI בייצור באמצעות שירותי Microsoft Foundry.

> **הערת אימות (2026-03-25):** סדנה זו נבדקה מול `azd` בגרסה `1.23.12`. אם ההתקנה המקומית שלך ישנה יותר, עדכן את AZD לפני ההתחלה כדי שהתהליך של האותנטיקציה, התבנית והפריסה יתאימו לצעדים המפורטים למטה.

**משך:** 2-3 שעות  
**רמה:** בינונית  
**דרישות מוקדמות:** ידע בסיסי ב-Azure, היכרות עם מושגי AI/ML

## 🎓 יעדי למידה

בסיום סדנה זו תהיה מסוגל/ית:
- ✅ להמיר אפליקציית AI קיימת לשימוש בתבניות AZD  
- ✅ להגדיר שירותי Microsoft Foundry עם AZD  
- ✅ ליישם ניהול מאובטח של אישורים לשירותי AI  
- ✅ לפרוס אפליקציות AI מוכנות לייצור עם ניטור  
- ✅ לפתור בעיות נפוצות בפריסת AI  

## דרישות מוקדמות

### כלים נדרשים
- התקנת [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- התקנת [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)  
- התקנת [Git](https://git-scm.com/)  
- עורך קוד (מומלץ VS Code)  

### משאבי Azure
- מנוי Azure עם גישת תורם  
- גישה לשירותי Microsoft Foundry Models (או אפשרות לבקש גישה)  
- הרשאות יצירת Resource group  

### ידע מוקדם
- הבנה בסיסית של שירותי Azure  
- היכרות עם ממשקי שורת פקודה  
- מושגי AI/ML בסיסיים (APIs, מודלים, פרומפטים)  

## הגדרת המעבדה

### שלב 1: הכנת הסביבה

1. **אימות התקנת הכלים:**
```bash
# בדוק התקנת AZD
azd version

# בדוק את Azure CLI
az --version

# התחבר ל-Azure עבור תזרימי עבודה של AZD
azd auth login

# התחבר רק ל-Azure CLI אם אתה מתכנן להריץ פקודות az במהלך האבחון
az login
```

אם אתה עובד בכמה tenants או שהמנוי שלך לא מזוהה אוטומטית, נסה שוב עם `azd auth login --tenant-id <tenant-id>`.

2. **שיבוט מאגר הסדנה:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## מודול 1: הבנת מבנה AZD לאפליקציות AI

### אנטומיה של תבנית AZD מוכנה ל-AI

חקור את הקבצים המרכזיים בתבנית AZD מוכנה ל-AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **תרגיל מעבדה 1.1: חקר התצורה**

1. **בחן את הקובץ azure.yaml:**
```bash
cat azure.yaml
```

**מה לחפש:**
- הגדרות שירותים עבור רכיבי AI  
- מיפוי משתני סביבה  
- הגדרות מארחים  

2. **סקור את התשתית ב-main.bicep:**
```bash
cat infra/main.bicep
```

**דפוסי AI מרכזיים לזיהוי:**
- פריסת שירות Microsoft Foundry Models  
- אינטגרציה עם Azure AI Search  
- ניהול מאובטח של מפתחות  
- הגדרות אבטחת רשת  

### **נקודת דיון:** למה דפוסים אלה חשובים ל-AI

- **תלות בשירותים:** אפליקציות AI דורשות שירותים מרובים מתואמים  
- **אבטחה:** מפתחות API ונקודות קצה צריכים ניהול מאובטח  
- **קנה מידה:** לעומסי AI דרישות קנה מידה ייחודיות  
- **ניהול עלויות:** שירותי AI יכולים להיות יקרים אם לא מוגדרים כראוי  

## מודול 2: פרוס את אפליקציית ה-AI הראשונה שלך

### שלב 2.1: אתחול הסביבה

1. **צור סביבה חדשה ב-AZD:**
```bash
azd env new myai-workshop
```

2. **קבע פרמטרים דרושים:**
```bash
# הגדר את אזור Azure המועדף עליך
azd env set AZURE_LOCATION eastus

# אופציונלי: הגדר דגם OpenAI ספציפי
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### שלב 2.2: פריסת התשתית והאפליקציה

1. **פרוס באמצעות AZD:**
```bash
azd up
```

**מה קורה במהלך `azd up`:**
- ✅ פריסת שירות Microsoft Foundry Models  
- ✅ יצירת שירות Azure AI Search  
- ✅ הקמת App Service לאפליקציה האינטרנטית  
- ✅ הגדרות רשת ואבטחה  
- ✅ פריסת קוד האפליקציה  
- ✅ הקמת ניטור ולוגים  

2. **עקוב אחר התקדמות הפריסה** ורישום המשאבים שנוצרים.  

### שלב 2.3: אימות הפריסה שלך

1. **בדוק את המשאבים שפורסמו:**
```bash
azd show
```

2. **פתח את האפליקציה שפורסה:**
```bash
azd show
```

פתח את נקודת הקצה באינטרנט המוצגת ביציאת `azd show`.

3. **בדוק את פונקציונליות ה-AI:**
   - נכנס לאפליקציה באינטרנט  
   - נסה שאילתות לדוגמה  
   - ודא שהתגובות של ה-AI עובדות  

### **תרגיל מעבדה 2.1: תרגול פתרון תקלות**

**תרחיש**: הפריסה הצליחה אך ה-AI אינו מגיב.

**בעיות נפוצות לבדיקה:**
1. **מפתחות API של OpenAI**: ודא שהוגדרו נכון  
2. **זמינות מודל**: בדוק אם האזור שלך תומך במודל  
3. **חיבוריות רשת**: ודא שהשירותים יכולים לתקשר  
4. **הרשאות RBAC**: ודא שהאפליקציה יכולה לגשת ל-OpenAI  

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

### שלב 3.1: שינוי תצורת ה-AI

1. **עדכן את מודל OpenAI:**
```bash
# שנה לדגם אחר (אם זמין באזור שלך)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# פרוס מחדש עם התצורה החדשה
azd deploy
```

2. **הוסף שירותי AI נוספים:**

ערוך `infra/main.bicep` להוספת Document Intelligence:

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

**שיטת עבודה מומלצת**: תצורות שונות לפיתוח מול ייצור.

1. **צור סביבת ייצור:**
```bash
azd env new myai-production
```

2. **קבע פרמטרים ספציפיים לייצור:**
```bash
# בייצור בדרך כלל משתמשים ב-SKUs גבוהים יותר
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# אפשר תכונות אבטחה נוספות
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **תרגיל מעבדה 3.1: אופטימיזציה של עלויות**

**אתגר:** הגדר את התבנית לפיתוח חסכוני.

**משימות:**
1. זיהוי אילו SKUs אפשר להגדיר כחינמיים/בסיסיים  
2. קביעת משתני סביבה למינימום עלויות  
3. פריסה והשוואת עלויות מול תצורת הייצור  

**רמזים לפתרון:**
- השתמש ב-F0 (חינמי) לשירותי Azure AI כשאפשר  
- השתמש ב-Basic לשירות Search בפיתוח  
- שקול שימוש בתוכנית צריכה (Consumption) לפונקציות  

## מודול 4: אבטחה ושיטות עבודה מומלצות בייצור

### שלב 4.1: ניהול אישורים מאובטח

**אתגר נוכחי:** אפליקציות AI רבות מקודדות מפתחות API או משתמשות באחסון לא מאובטח.

**פתרון AZD:** זהות מנוהלת ואינטגרציה עם Key Vault.

1. **סקור את תצורת האבטחה בתבנית שלך:**
```bash
# חפש הגדרת Key Vault ו-Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **אמת שהזהות המנוהלת עובדת:**
```bash
# בדוק אם לאפליקציית האינטרנט יש את תצורת הזהות הנכונה
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### שלב 4.2: אבטחת רשת

1. **הפעל נקודות קצה פרטיות** (אם לא מוגדר כבר):

הוסף לתבנית ה-bicep שלך:
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
# יש לקנפג את Application Insights באופן אוטומטי
# בדוק את ההגדרות:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **הגדר ניטור ספציפי ל-AI:**

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

**משימה:** סקור את הפריסה שלך לשיטות אבטחה מיטביות.

**רשימת בדיקה:**
- [ ] אין סודות מקודדים בקוד או בתצורה  
- [ ] נעשה שימוש בזהות מנוהלת לאימות בין שירותים  
- [ ] Key Vault מאחסן תצורה רגישה  
- [ ] גישת רשת מוגבלת כראוי  
- [ ] ניטור ולוגים מופעלים  

## מודול 5: המרת אפליקציית AI משלך

### שלב 5.1: טופס הערכה

**לפני המרה של האפליקציה שלך**, ענה על השאלות האלה:

1. **ארכיטקטורת האפליקציה:**
   - אילו שירותי AI האפליקציה שלך משתמשת?  
   - אילו משאבי חישוב דרושים לה?  
   - האם דורשת בסיס נתונים?  
   - מהם התלויות בין השירותים?  

2. **דרישות אבטחה:**
   - אילו נתונים רגישים האפליקציה שלך מטפלת בהם?  
   - אילו דרישות עמידה יש לך?  
   - האם דרושה רשת פרטית?  

3. **דרישות קנה מידה:**
   - מה העומס הצפוי?  
   - האם דרוש סקיילינג אוטומטי?  
   - האם יש דרישות אזוריות?  

### שלב 5.2: צור את תבנית ה-AZD שלך

**התחל בדפוס זה להמרת האפליקציה:**

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

**אתגר:** צור תבנית AZD לאפליקציית עיבוד מסמכים מבוססת AI.

**דרישות:**
- Microsoft Foundry Models לניתוח תוכן  
- Document Intelligence ל-OCR  
- Storage Account להעלאת מסמכים  
- Function App ללוגיקת עיבוד  
- אפליקציה וובית לממשק משתמש  

**נקודות בונוס:**
- טיפול שגיאות מתאים  
- הערכת עלויות  
- הקמת לוחות בקרה לניטור  

## מודול 6: פתרון בעיות נפוצות

### בעיות נפוצות בפריסה

#### בעיה 1: חריגה במכסת שירות OpenAI  
**תסמינים:** הפריסה נכשלת עם שגיאת מכסה  
**פתרונות:**
```bash
# בדוק נתחי שימוש נוכחיים
az cognitiveservices usage list --location eastus

# בקש הגדלת נתח או נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up
```

#### בעיה 2: מודל לא זמין באזור  
**תסמינים:** תגובות AI נכשלות או שגיאות בפריסת מודל  
**פתרונות:**
```bash
# בדוק זמינות דגם לפי אזור
az cognitiveservices model list --location eastus

# עדכון לדגם זמין
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### בעיה 3: בעיות הרשאה  
**תסמינים:** שגיאות 403 Forbidden בשיחות לשירותי AI  
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
**צעדים לחקירה:**
1. בדוק את Application Insights למדדי ביצועים  
2. סקור מדדי שירות OpenAI בפורטל Azure  
3. אמת חיבור ורשת ולטנסי  

**פתרונות:**
- יישום caching לשאילתות נפוצות  
- שימוש במודל OpenAI מתאים למקרה השימוש  
- שקול שימוש בשכפולים לקריאה לעומסים גבוהים  

### **תרגיל מעבדה 6.1: אתגר ניפוי שגיאות**

**תרחיש:** הפריסה הצליחה, אך האפליקציה מחזירה שגיאות 500.

**משימות ניפוי שגיאות:**
1. בדוק יומני אפליקציה  
2. אמת חיבור לשירותים  
3. בדוק אימות  
4. סקור תצורה  

**כלים לשימוש:**
- `azd show` לתצוגת הפריסה  
- פורטל Azure ליומני שירות מפורטים  
- Application Insights לטלמטריה של האפליקציה  

## מודול 7: ניטור ואופטימיזציה

### שלב 7.1: הקם ניטור מקיף

1. **צור לוחות בקרה מותאמים:**

גש לפורטל Azure ויצר לוח בקרה עם:  
- ספירת בקשות ולטנסי ל-OpenAI  
- שיעורי שגיאות אפליקציה  
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
# השתמש ב-Azure CLI לקבלת נתוני עלות
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **יישם בקרות עלויות:**
- הגדר התראות תקציב  
- השתמש במדיניות סקיילינג אוטומטי  
- יישם caching של בקשות  
- נטר שימוש בטוקנים ל-OpenAI  

### **תרגיל מעבדה 7.1: אופטימיזציית ביצועים**

**משימה:** אופטימז את אפליקציית ה-AI שלך לביצועים ולחיסכון בעלויות.

**מדדים לשיפור:**
- הקטנת זמן תגובה ממוצע ב-20%  
- הקטנת עלויות חודשיות ב-15%  
- שמירה על זמינות של 99.9%  

**אסטרטגיות לנסות:**
- יישום caching לתגובות  
- אופטימיזציה של פרומפטים ליעילות טוקנים  
- שימוש ב-SKUs מתאימים לחישוב  
- הקמת סקיילינג אוטומטי נכון  

## אתגר סופי: יישום מקצה לקצה

### תרחיש האתגר

אתה מתבקש ליצור צ'אטבוט שירות לקוחות מונע AI לשימוש בייצור עם הדרישות הבאות:

**דרישות פונקציונליות:**
- ממשק ווב לאינטראקציות עם לקוחות  
- אינטגרציה עם Microsoft Foundry Models לתגובות  
- יכולת חיפוש מסמכים עם Azure AI Search  
- אינטגרציה עם מאגרי נתוני לקוחות קיימים  
- תמיכה בשפות מרובות  

**דרישות לא פונקציונליות:**
- טיפול ב-1000 משתמשים בו-זמנית  
- SLA של זמינות 99.9%  
- עמידה ב-SOC 2  
- תקציב מתחת ל-500$ לחודש  
- פריסה למספר סביבות (פיתוח, בקרה, ייצור)  

### צעדי יישום

1. **תכנן את הארכיטקטורה**  
2. **צור את תבנית AZD**  
3. **יישם אמצעי אבטחה**  
4. **הקם ניטור והתראות**  
5. **צור צינורות פריסה**  
6. **תעד את הפתרון**  

### קריטריוני הערכה

- ✅ **פונקציונליות**: האם עומד בכל הדרישות?  
- ✅ **אבטחה**: האם שיטות העבודה הטובות מיושמות?  
- ✅ **קנה מידה**: האם יכול להתמודד עם העומס?  
- ✅ **תחזוקה**: האם הקוד והתשתית מאורגנים היטב?  
- ✅ **עלות**: האם נשאר במסגרת התקציב?  

## משאבים נוספים

### תיעוד Microsoft
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [תיעוד שירות Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [תיעוד Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### תבניות לדוגמה
- [אפליקציית צ'אט Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [התחלת עבודה מהירה עם אפליקציית צ'אט OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)  
- [שיחת Contoso](https://github.com/Azure-Samples/contoso-chat)

### משאבי קהילה
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [תבניות AZD מעולות](https://azure.github.io/awesome-azd/)

## 🎓 תעודת סיום

מזל טוב! סיימת את המעבדה של סדנת ה-AI. כעת אתה אמור להיות מסוגל:

- ✅ להמיר יישומי AI קיימים לתבניות AZD
- ✅ לפרוס יישומי AI מוכנים לייצור
- ✅ ליישם שיטות אבטחה מיטביות לעיבודי AI
- ✅ לנטר ולמטב ביצועי יישומי AI
- ✅ לפתור בעיות פריסה נפוצות

### שלבים הבאים
1. יישם דפוסים אלה בפרויקטי ה-AI שלך
2. תתרום תבניות חזרה לקהילה
3. הצטרף ל-Microsoft Foundry Discord לתמיכה שוטפת
4. חקור נושאים מתקדמים כמו פריסות רב-אזוריות

---

**משוב על סדנה**: עזור לנו לשפר סדנה זו על ידי שיתוף החוויה שלך ב-[Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח ידידותי ל-AI
- **⬅️ קודם**: [פריסת מודל AI](ai-model-deployment.md)
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בייצור](production-ai-practices.md)
- **🚀 פרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

**צריך עזרה?** הצטרף לקהילה שלנו לתמיכה ודיונים על AZD ופריסות AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->