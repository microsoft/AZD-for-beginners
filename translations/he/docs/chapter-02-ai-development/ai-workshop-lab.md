# מעבדת סדנת בינה מלאכותית: הפיכת פתרונות ה-AI שלך לניתנים לפריסה עם AZD

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח ממוקד בינה מלאכותית
- **⬅️ קודם**: [פריסת מודל בינה מלאכותית](ai-model-deployment.md)
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בייצור](production-ai-practices.md)
- **🚀 הפרק הבא**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)

## סקירת הסדנה

מעבדה זו מלמדת מפתחים כיצד לקחת תבנית AI קיימת ולפרוס אותה באמצעות Azure Developer CLI (AZD). תלמדו דפוסים חיוניים לפריסות AI בייצור תוך שימוש בשירותי Microsoft Foundry.

> **הערת אימות (2026-07-13):** סדנה זו נבדקה עם `azd` בגרסה `1.27.1`. אם ההתקנה המקומית שלך ישנה יותר, עדכן את AZD לפני תחילת העבודה כדי שזרימת העבודה של האותנטיקציה, התבנית והפריסה תתאים לשלבים שלמטה.

**משך:** 2-3 שעות  
**רמה:** בינונית  
**דרישות מוקדמות:** ידע בסיסי ב-Azure, היכרות עם מושגי AI/ML

## 🎓 מטרות הלמידה

בסיום הסדנה תוכל:
- ✅ להמיר אפליקציית AI קיימת לשימוש בתבניות AZD
- ✅ להגדיר שירותי Microsoft Foundry עם AZD
- ✅ ליישם ניהול בטוח של אישורי גישה לשירותי AI
- ✅ לפרוס אפליקציות AI מוכנות לייצור עם ניטור
- ✅ לפתור תקלות נפוצות בפריסת AI

## דרישות מוקדמות

### כלים דרושים
- התקנת [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- התקנת [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- התקנת [Git](https://git-scm.com/)
- עורך קוד (מומלץ VS Code)

### משאבי Azure
- מנוי Azure עם גישת תורם
- גישה לשירותי Microsoft Foundry Models (או יכולת לבקש גישה)
- הרשאות יצירת Resource Group

### דרישות ידע
- הבנה בסיסית של שירותי Azure
- היכרות עם ממשקי שורת פקודה
- מושגי AI/ML בסיסיים (APIs, מודלים, פרומפטים)

## התקנת הסדנה

### שלב 1: הכנת הסביבה

1. **וודא שהכלים מותקנים:**
```bash
# בדוק התקנת AZD
azd version

# בדוק את Azure CLI
az --version

# התחבר ל-Azure עבור זרימות העבודה של AZD
azd auth login

# התחבר ל-Azure CLI רק אם אתה מתכנן להריץ פקודות az במהלך האבחון
az login
```

אם אתה עובד עם כמה tenants או שהמנוי שלך לא מזוהה אוטומטית, נסה שוב עם `azd auth login --tenant-id <tenant-id>`.

2. **שכפל את מאגר הסדנה:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## מודול 1: הבנת מבנה AZD לאפליקציות AI

### אנטומיה של תבנית AZD ל-AI

בחן את הקבצים המרכזיים בתבנית AZD מוכנה ל-AI:

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

### **תרגיל מעבדה 1.1: בחינת הקונפיגורציה**

1. **בחן את הקובץ azure.yaml:**
```bash
cat azure.yaml
```

**מה לבדוק:**
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
- ניהול מפתחות מאובטח
- הגדרות אבטחת רשת

### **נושא לדיון:** למה דפוסים אלו חשובים ל-AI

- **תלויות שירות**: אפליקציות AI דורשות שירותים מתואמים מרובים
- **אבטחה**: מפתחות API ונקודות קצה צריכים ניהול בטוח
- **קשיחות בקנה מידה**: עומסי AI מחייבים דרישות גדילה ייחודיות
- **ניהול עלויות**: שירותי AI עלולים להיות יקרים אם לא מוגדרים נכון

## מודול 2: פרוס את אפליקציית ה-AI הראשונה שלך

### שלב 2.1: אתחול הסביבה

1. **צור סביבה חדשה עם AZD:**
```bash
azd env new myai-workshop
```

2. **הגדר פרמטרים נדרשים:**
```bash
# הגדר את אזור Azure המועדף עליך
azd env set AZURE_LOCATION eastus

# אופציונלי: הגדר מודל OpenAI ספציפי
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
- ✅ הקמת App Service לאפליקציית ווב
- ✅ קונפיגורציות רשת ואבטחה
- ✅ פריסת קוד האפליקציה
- ✅ הקמה של ניטור ורישום

2. **עקוב אחרי התקדמות הפריסה** ורשום את המשאבים שנוצרים.

### שלב 2.3: אימות הפריסה שלך

1. **בדוק את המשאבים שפורסמו:**
```bash
azd show
```

2. **פתח את האפליקציה שפורסה:**
```bash
azd show
```

פתח את נקודת הקצה שתוצג בפקודת `azd show`.

3. **בדוק את תפקוד הבינה המלאכותית:**
   - ניווט אל אפליקציית הווב
   - נסה שאילתות לדוגמה
   - אמת שהתשובות של ה-AI עובדות

### **תרגיל מעבדה 2.1: תרגול פתרון תקלות**

**תרחיש**: הפריסה הצליחה אך ה-AI אינו מגיב.

**בעיות נפוצות לבדיקה:**
1. **מפתחות API של OpenAI**: וודא שנקבעו כראוי
2. **זמינות המודל**: בדוק אם האזור שלך תומך במודל
3. **קישוריות רשת**: ודא שהשירותים יכולים לתקשר
4. **הרשאות RBAC**: וודא שהאפליקציה יכולה לגשת ל-OpenAI

**פקודות לאבחון:**
```bash
# בדוק משתני סביבה
azd env get-values

# הצג יומני פריסה
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# בדוק את מצב הפריסה של OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## מודול 3: התאמת אפליקציות AI לצרכים שלך

### שלב 3.1: שינוי קונפיגורציית ה-AI

1. **עדכן את דגם ה-OpenAI:**
```bash
# שנה לדגם שונה (אם זמין באזור שלך)
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

**שיטה מומלצת**: הגדרות שונות לפיתוח מול ייצור.

1. **צור סביבה בייצור:**
```bash
azd env new myai-production
```

2. **הגדר פרמטרים מותאמים לייצור:**
```bash
# בייצור משתמשים בדרך כלל בקודי מוצר (SKU) גבוהים יותר
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# הפעל תכונות אבטחה נוספות
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **תרגיל מעבדה 3.1: אופטימיזציית עלויות**

**אתגר**: קונפיגורציה לתבנית בהתאמה לכלכלה בפיתוח.

**משימות:**
1. זהה אילו SKUs ניתן להגדיר כרמות חינמיות/בסיסיות
2. הגדר משתני סביבה להוצאות מינימליות
3. פרוס והשווה עלויות עם קונפיגורציית הייצור

**רמזים לפתרון:**
- השתמש ברמת F0 (חינמית) עבור שירותי Azure AI כשאפשרי
- השתמש ברמת Base לשירות Search בפיתוח
- שקול שימוש בתכנית צריכה לפונקציות

## מודול 4: אבטחה ושיטות עבודה מומלצות בייצור

### שלב 4.1: ניהול אישורים מאובטח

**אתגר נוכחי**: רבות מאפליקציות ה-AI כוללות מפתחות API מוצפנים ישירות או משתמשות באחסון לא בטוח.

**פתרון AZD**: זהות מנוהלת + אינטגרציית Key Vault.

1. **בדוק את קונפיגורציית האבטחה בתבנית שלך:**
```bash
# חפש תצורת Key Vault וזוית מנוהלת
grep -r "keyVault\|managedIdentity" infra/
```

2. **ודא שזהות מנוהלת פעילה:**
```bash
# בדוק אם לאפליקציית האינטרנט יש את תצורת הזיהוי הנכונה
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### שלב 4.2: אבטחת רשת

1. **אפשר נקודות קצה פרטיות** (אם עדיין לא מוגדר):

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

### שלב 4.3: ניטור ונראות

1. **הגדר Application Insights:**
```bash
# יש לתצגר את Application Insights אוטומטית
# בדוק את התצוגה:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **הגדר ניטור ייחודי ל-AI:**

הוסף מדדים מותאמים לניטור פעולות AI:
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

**משימה**: בדוק את הפריסה שלך לפי שיטות עבודה מומלצות לאבטחה.

**רשימת בדיקה:**
- [ ] אין סודות מוצפנים ישירות בקוד או בקונפיגורציה
- [ ] זהות מנוהלת בשימוש לאימות בין שירותים
- [ ] Key Vault לאחסון קונפיגורציה רגישה
- [ ] גישת רשת מוגבלת כראוי
- [ ] ניטור ורישום מופעלים

## מודול 5: המרת אפליקציית ה-AI שלך

### שלב 5.1: טופס הערכה

**לפני המרת האפליקציה שלך**, ענה על השאלות הבאות:

1. **ארכיטקטורת האפליקציה:**
   - אילו שירותי AI האפליקציה שלך משתמשת?
   - אילו משאבי מחשוב היא דורשת?
   - האם היא דורשת בסיס נתונים?
   - מה התלויות בין השירותים?

2. **דרישות אבטחה:**
   - אילו נתונים רגישים מטפלת האפליקציה?
   - אילו דרישות תאימות יש לך?
   - האם דרושה רשת פרטית?

3. **דרישות קנה מידה:**
   - מה העומס הצפוי שלך?
   - האם נדרש קנה מידה אוטומטי?
   - האם יש דרישות אזוריות?

### שלב 5.2: צור את תבנית ה-AZD שלך

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

**אתגר**: צור תבנית AZD עבור אפליקציית AI לעיבוד מסמכים.

**דרישות:**
- Microsoft Foundry Models לניתוח תוכן
- Document Intelligence ל-OCR
- חשבון אחסון להעלאת מסמכים
- פונקציית Azure לעיבוד לוגיקה
- אפליקציית ווב לממשק משתמש

**נקודות בונוס:**
- הוסף טיפול בשגיאות כראוי
- כלול הערכת עלויות
- הקם לוחות ניטור

## מודול 6: פתרון תקלות נפוצות

### תקלות נפוצות בפריסה

#### תקלה 1: חריגה ממכסת שירות OpenAI
**תסמינים:** הפריסה נכשלת עם שגיאת מכסה
**פתרונות:**
```bash
# בדוק מכסות נוכחיות
az cognitiveservices usage list --location eastus

# בקש הגדלת מכסה או נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up
```

#### תקלה 2: המודל אינו זמין באזור
**תסמינים:** תגובות AI נכשלות או שגיאות בפריסת מודל
**פתרונות:**
```bash
# בדוק זמינות דגם לפי אזור
az cognitiveservices model list --location eastus

# עדכן לדגם זמין
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### תקלה 3: בעיות הרשאה
**תסמינים:** שגיאות 403 Forbidden בקריאה לשירותי AI
**פתרונות:**
```bash
# בדוק את ההקצאות לתפקידים
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# הוסף תפקידים חסרים
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### תקלות ביצועים

#### תקלה 4: תגובות AI איטיות
**שלבי חקירה:**
1. בדוק מדדי ביצועים ב-Application Insights
2. סקור מדדי שירות OpenAI בפורטל Azure
3. אמת קישוריות רשת והשהיה

**פתרונות:**
- יישם מטמון לשאילתות נפוצות
- השתמש בדגם OpenAI המתאים למקרה השימוש שלך
- שקול שכפולי קריאה לעומסים גבוהים

### **תרגיל מעבדה 6.1: אתגר איתור באגים**

**תרחיש**: הפריסה הצליחה אך האפליקציה מחזירה שגיאות 500.

**משימות איתור באגים:**
1. בדוק לוגים של האפליקציה
2. אמת קישוריות שירותים
3. בדוק אימות
4. סקור את הקונפיגורציה

**כלים לשימוש:**
- `azd show` להצגת מידע על הפריסה
- פורטל Azure ללוגים מפורטים של שירותים
- Application Insights לטלמטריית האפליקציה

## מודול 7: ניטור ואופטימיזציה

### שלב 7.1: הקם ניטור מקיף

1. **צור לוחות מחוונים מותאמים אישית:**

ניווט לפורטל Azure וצור לוח מחוונים עם:
- ספירת בקשות OpenAI והשהיה
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

### שלב 7.2: אופטימיזציית עלויות

1. **נתח הוצאות נוכחיות:**
```bash
# השתמש ב-Azure CLI לקבלת נתוני עלות
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **הטמע בקרות עלויות:**
- הגדר התראות תקציב
- השתמש במדיניות קנה מידה אוטומטי
- יישם מטמון לבקשות
- ניטור שימוש ב-OpenAI tokens

### **תרגיל מעבדה 7.1: אופטימיזציית ביצועים**

**משימה**: אופטימז את אפליקציית ה-AI שלך לביצועים ולעלות.

**מדדים לשיפור:**
- הפחת את זמן התגובה הממוצע ב-20%
- הפחת את העלויות החודשיות ב-15%
- שמור על זמינות של 99.9%

**אסטרטגיות ליישום:**
- יישם מטמון תגובות
- אופטימיזציה של פרומפטים ליעילות טוקנים
- השתמש ב-SKU מתאימים למחשוב
- הקם קנה מידה אוטומטי נכון

## אתגר סופי: יישום מקצה לקצה

### תרחיש אתגר

אתה מתבקש ליצור צ'אטבוט תמיכת לקוחות מונע AI מוכן לייצור עם הדרישות הבאות:

**דרישות פונקציונליות:**
- ממשק ווב לאינטראקציות עם לקוחות
- אינטגרציה עם Microsoft Foundry Models לתשובות
- יכולת חיפוש מסמכים באמצעות Azure AI Search
- אינטגרציה עם בסיס נתונים לקוחות קיים
- תמיכה בשפות רבות

**דרישות לא פונקציונליות:**
- טיפול ב-1000 משתמשים בו-זמנית
- SLA של זמינות 99.9%
- עמידה בתקנות SOC 2
- עלות מתחת ל-500$ לחודש
- פריסה בכמה סביבות (פיתוח, בדיקה, ייצור)

### שלבי היישום

1. **עיצוב הארכיטקטורה**
2. **יצירת תבנית AZD**
3. **יישום אמצעי אבטחה**
4. **הקמת ניטור והתראות**
5. **יצירת צינורות פריסה**
6. **תיעוד הפתרון**

### קריטריוני הערכה

- ✅ **פונקציונליות**: האם עומד בכל הדרישות?
- ✅ **אבטחה**: האם מיושמות שיטות עבודה מומלצות?
- ✅ **קשיחות בקנה מידה**: האם יכול לטפל בעומס?
- ✅ **יכולת תחזוקה**: האם הקוד והתשתית מאורגנים היטב?
- ✅ **עלות**: האם שומר על התקציב?

## משאבים נוספים

### תיעוד של מיקרוסופט
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [תיעוד שירות Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [תיעוד Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### תבניות לדוגמה
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### משאבים קהילתיים
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 תעודת סיום

מזל טוב! סיימת את סדנת המעבדה ל-AI. כעת אמור להיות באפשרותך:

- ✅ להמיר יישומי AI קיימים לתבניות AZD
- ✅ לפרוס יישומי AI מוכנים לייצור
- ✅ ליישם שיטות עבודה מומלצות לאבטחה בעומסי עבודה של AI
- ✅ לנטר ולשפר ביצועי יישומי AI
- ✅ לפתור בעיות פריסה נפוצות

### צעדים הבאים
1. להחיל דפוסים אלה בפרויקטי ה-AI שלך
2. לתרום תבניות לקהילה
3. להצטרף ל-Microsoft Foundry Discord לתמיכה מתמשכת
4. לחקור נושאים מתקדמים כמו פריסות בריבוי אזורים

---

**משוב על הסדנה**: עזור לנו לשפר סדנה זו על ידי שיתוף החוויה שלך בערוץ [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח מבוסס AI
- **⬅️ קודם**: [פריסת מודל AI](ai-model-deployment.md)
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בייצור](production-ai-practices.md)
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

**צריך עזרה?** הצטרף לקהילה שלנו לתמיכה ולדיונים על פריסות AZD ו-AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->