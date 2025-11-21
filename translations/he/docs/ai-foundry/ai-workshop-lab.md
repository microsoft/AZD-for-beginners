<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-21T17:33:56+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "he"
}
-->
# סדנת מעבדה ל-AI: הפיכת פתרונות AI שלך לפריסת AZD

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח מבוסס AI
- **⬅️ קודם**: [פריסת מודל AI](ai-model-deployment.md)
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בייצור](production-ai-practices.md)
- **🚀 פרק הבא**: [פרק 3: קונפיגורציה](../getting-started/configuration.md)

## סקירת סדנה

מעבדה מעשית זו מדריכה מפתחים בתהליך של לקיחת תבנית AI קיימת ופריסתה באמצעות Azure Developer CLI (AZD). תלמדו דפוסים חיוניים לפריסות AI בייצור באמצעות שירותי Microsoft Foundry.

**משך זמן:** 2-3 שעות  
**רמה:** בינוני  
**דרישות מוקדמות:** ידע בסיסי ב-Azure, היכרות עם מושגי AI/ML

## 🎓 מטרות למידה

בסיום הסדנה, תוכלו:
- ✅ להמיר אפליקציית AI קיימת לשימוש בתבניות AZD
- ✅ להגדיר שירותי Microsoft Foundry עם AZD
- ✅ ליישם ניהול אישורים מאובטח לשירותי AI
- ✅ לפרוס אפליקציות AI מוכנות לייצור עם ניטור
- ✅ לפתור בעיות נפוצות בפריסת AI

## דרישות מוקדמות

### כלים נדרשים
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) מותקן
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) מותקן
- [Git](https://git-scm.com/) מותקן
- עורך קוד (מומלץ VS Code)

### משאבי Azure
- מנוי Azure עם גישת תורם
- גישה לשירותי Azure OpenAI (או יכולת לבקש גישה)
- הרשאות ליצירת קבוצות משאבים

### ידע מוקדם
- הבנה בסיסית של שירותי Azure
- היכרות עם ממשקי שורת פקודה
- מושגי AI/ML בסיסיים (APIs, מודלים, פרומפטים)

## הגדרת מעבדה

### שלב 1: הכנת סביבה

1. **וודאו התקנת כלים:**
```bash
# בדוק התקנת AZD
azd version

# בדוק את Azure CLI
az --version

# התחבר ל-Azure
az login
azd auth login
```

2. **שכפלו את מאגר הסדנה:**
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
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **תרגיל מעבדה 1.1: חקר הקונפיגורציה**

1. **בדקו את קובץ azure.yaml:**
```bash
cat azure.yaml
```

**מה לחפש:**
- הגדרות שירות לרכיבי AI
- מיפוי משתני סביבה
- תצורות מארח

2. **סקור את תשתית main.bicep:**
```bash
cat infra/main.bicep
```

**דפוסי AI מרכזיים לזיהוי:**
- פריסת שירות Azure OpenAI
- אינטגרציה עם Cognitive Search
- ניהול מפתחות מאובטח
- תצורות אבטחת רשת

### **נקודת דיון:** מדוע דפוסים אלו חשובים ל-AI

- **תלות בשירותים**: אפליקציות AI דורשות לעיתים קרובות תיאום בין מספר שירותים
- **אבטחה**: מפתחות API ונקודות קצה דורשים ניהול מאובטח
- **יכולת הרחבה**: עומסי עבודה של AI דורשים דרישות ייחודיות להרחבה
- **ניהול עלויות**: שירותי AI יכולים להיות יקרים אם לא מוגדרים כראוי

## מודול 2: פריסת אפליקציית AI ראשונה

### שלב 2.1: אתחול הסביבה

1. **צרו סביבה חדשה ב-AZD:**
```bash
azd env new myai-workshop
```

2. **הגדירו פרמטרים נדרשים:**
```bash
# הגדר את אזור Azure המועדף עליך
azd env set AZURE_LOCATION eastus

# אופציונלי: הגדר מודל OpenAI ספציפי
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### שלב 2.2: פריסת התשתית והאפליקציה

1. **פרסו עם AZD:**
```bash
azd up
```

**מה קורה במהלך `azd up`:**
- ✅ פריסת שירות Azure OpenAI
- ✅ יצירת שירות Cognitive Search
- ✅ הגדרת App Service לאפליקציית האינטרנט
- ✅ תצורת רשת ואבטחה
- ✅ פריסת קוד האפליקציה
- ✅ הגדרת ניטור ורישום

2. **עקבו אחר התקדמות הפריסה** ושימו לב למשאבים שנוצרים.

### שלב 2.3: אימות הפריסה

1. **בדקו את המשאבים שפורסו:**
```bash
azd show
```

2. **פתחו את האפליקציה שפורסה:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **בדקו את פונקציונליות ה-AI:**
   - נווטו לאפליקציית האינטרנט
   - נסו שאילתות לדוגמה
   - וודאו שהתגובות של ה-AI פועלות

### **תרגיל מעבדה 2.1: תרגול פתרון בעיות**

**תסריט**: הפריסה הצליחה אך ה-AI אינו מגיב.

**בעיות נפוצות לבדיקה:**
1. **מפתחות API של OpenAI**: וודאו שהם מוגדרים כראוי
2. **זמינות מודל**: בדקו אם האזור שלכם תומך במודל
3. **קישוריות רשת**: וודאו שהשירותים יכולים לתקשר
4. **הרשאות RBAC**: וודאו שהאפליקציה יכולה לגשת ל-OpenAI

**פקודות דיבוג:**
```bash
# בדוק משתני סביבה
azd env get-values

# הצג יומני פריסה
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# בדוק את מצב הפריסה של OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## מודול 3: התאמת אפליקציות AI לצרכים שלכם

### שלב 3.1: שינוי קונפיגורציית ה-AI

1. **עדכנו את מודל OpenAI:**
```bash
# שנה לדגם אחר (אם זמין באזור שלך)
azd env set AZURE_OPENAI_MODEL gpt-4

# פרוס מחדש עם התצורה החדשה
azd deploy
```

2. **הוסיפו שירותי AI נוספים:**

ערכו את `infra/main.bicep` להוספת Document Intelligence:

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

### שלב 3.2: קונפיגורציות ייחודיות לסביבה

**שיטה מומלצת**: קונפיגורציות שונות לפיתוח מול ייצור.

1. **צרו סביבה לייצור:**
```bash
azd env new myai-production
```

2. **הגדירו פרמטרים ייחודיים לייצור:**
```bash
# ייצור בדרך כלל משתמש ב-SKU גבוהים יותר
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# הפעל תכונות אבטחה נוספות
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **תרגיל מעבדה 3.1: אופטימיזציית עלויות**

**אתגר**: הגדירו את התבנית לפיתוח חסכוני.

**משימות:**
1. זיהוי אילו SKUs ניתן להגדיר לרמות חינמיות/בסיסיות
2. הגדרת משתני סביבה למינימום עלות
3. פריסה והשוואת עלויות עם קונפיגורציית הייצור

**רמזים לפתרון:**
- השתמשו ברמת F0 (חינמית) עבור Cognitive Services כשאפשר
- השתמשו ברמת Basic עבור Search Service בפיתוח
- שקלו להשתמש בתוכנית Consumption עבור Functions

## מודול 4: אבטחה ושיטות עבודה מומלצות לייצור

### שלב 4.1: ניהול אישורים מאובטח

**אתגר נוכחי**: אפליקציות AI רבות מקודדות מפתחות API או משתמשות באחסון לא מאובטח.

**פתרון AZD**: Managed Identity + אינטגרציה עם Key Vault.

1. **סקור את תצורת האבטחה בתבנית שלכם:**
```bash
# חפש את תצורת Key Vault ו-Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **וודאו ש-Managed Identity פועל:**
```bash
# בדוק אם לאפליקציית האינטרנט יש את תצורת הזהות הנכונה
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### שלב 4.2: אבטחת רשת

1. **אפשרו נקודות קצה פרטיות** (אם לא הוגדרו כבר):

הוסיפו לתבנית bicep שלכם:
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

1. **הגדירו Application Insights:**
```bash
# יש להגדיר את Application Insights באופן אוטומטי
# בדוק את התצורה:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **הגדירו ניטור ייחודי ל-AI:**

הוסיפו מדדים מותאמים לפעולות AI:
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

**משימה**: סקרו את הפריסה שלכם לשיטות עבודה מומלצות באבטחה.

**רשימת בדיקה:**
- [ ] אין סודות מקודדים בקוד או בקונפיגורציה
- [ ] Managed Identity משמש לאימות בין שירותים
- [ ] Key Vault מאחסן קונפיגורציה רגישה
- [ ] גישת רשת מוגבלת כראוי
- [ ] ניטור ורישום מופעלים

## מודול 5: המרת אפליקציית AI משלכם

### שלב 5.1: גיליון הערכה

**לפני המרת האפליקציה שלכם**, ענו על השאלות הבאות:

1. **ארכיטקטורת האפליקציה:**
   - אילו שירותי AI האפליקציה שלכם משתמשת?
   - אילו משאבי מחשוב היא צריכה?
   - האם היא דורשת מסד נתונים?
   - מהן התלויות בין השירותים?

2. **דרישות אבטחה:**
   - אילו נתונים רגישים האפליקציה שלכם מטפלת?
   - אילו דרישות תאימות יש לכם?
   - האם אתם צריכים רשת פרטית?

3. **דרישות הרחבה:**
   - מהו העומס הצפוי?
   - האם אתם צריכים הרחבה אוטומטית?
   - האם יש דרישות אזוריות?

### שלב 5.2: יצירת תבנית AZD שלכם

**עקבו אחר דפוס זה להמרת האפליקציה שלכם:**

1. **צרו את המבנה הבסיסי:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# אתחל תבנית AZD
azd init --template minimal
```

2. **צרו azure.yaml:**
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

3. **צרו תבניות תשתית:**

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

**אתגר**: צרו תבנית AZD לאפליקציית AI לעיבוד מסמכים.

**דרישות:**
- Azure OpenAI לניתוח תוכן
- Document Intelligence ל-OCR
- Storage Account להעלאת מסמכים
- Function App ללוגיקת עיבוד
- אפליקציית אינטרנט לממשק משתמש

**נקודות בונוס:**
- הוסיפו טיפול שגיאות מתאים
- כללו הערכת עלויות
- הגדירו לוחות מחוונים לניטור

## מודול 6: פתרון בעיות נפוצות

### בעיות פריסה נפוצות

#### בעיה 1: חריגה ממכסת שירות OpenAI
**תסמינים:** הפריסה נכשלת עם שגיאת מכסה
**פתרונות:**
```bash
# בדוק מכסות נוכחיות
az cognitiveservices usage list --location eastus

# בקש הגדלת מכסה או נסה אזור אחר
azd env set AZURE_LOCATION westus2
azd up
```

#### בעיה 2: מודל לא זמין באזור
**תסמינים:** תגובות AI נכשלות או שגיאות בפריסת מודל
**פתרונות:**
```bash
# בדוק זמינות מודל לפי אזור
az cognitiveservices model list --location eastus

# עדכן למודל זמין
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### בעיה 3: בעיות הרשאה
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
1. בדקו את Application Insights למדדי ביצועים
2. סקרו את מדדי שירות OpenAI בפורטל Azure
3. וודאו קישוריות רשת וזמן השהיה

**פתרונות:**
- יישמו מטמון לשאילתות נפוצות
- השתמשו במודל OpenAI המתאים למקרה השימוש שלכם
- שקלו שכפול קריאה לתרחישי עומס גבוה

### **תרגיל מעבדה 6.1: אתגר דיבוג**

**תסריט**: הפריסה הצליחה, אך האפליקציה מחזירה שגיאות 500.

**משימות דיבוג:**
1. בדקו יומני אפליקציה
2. וודאו קישוריות שירות
3. בדקו אימות
4. סקרו קונפיגורציה

**כלים לשימוש:**
- `azd show` לסקירת פריסה
- פורטל Azure ליומני שירות מפורטים
- Application Insights לטלמטריית אפליקציה

## מודול 7: ניטור ואופטימיזציה

### שלב 7.1: הגדרת ניטור מקיף

1. **צרו לוחות מחוונים מותאמים אישית:**

נווטו לפורטל Azure וצרו לוח מחוונים עם:
- ספירת בקשות OpenAI וזמן השהיה
- שיעורי שגיאות אפליקציה
- ניצול משאבים
- מעקב עלויות

2. **הגדירו התראות:**
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

1. **נתחו עלויות נוכחיות:**
```bash
# השתמש ב-Azure CLI כדי לקבל נתוני עלות
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **יישמו בקרות עלות:**
- הגדירו התראות תקציב
- השתמשו במדיניות הרחבה אוטומטית
- יישמו מטמון בקשות
- עקבו אחר שימוש בטוקנים עבור OpenAI

### **תרגיל מעבדה 7.1: אופטימיזציית ביצועים**

**משימה**: אופטימיזציה של אפליקציית ה-AI שלכם לביצועים ועלות.

**מדדים לשיפור:**
- הפחתת זמן תגובה ממוצע ב-20%
- הפחתת עלויות חודשיות ב-15%
- שמירה על זמן פעולה של 99.9%

**אסטרטגיות לנסות:**
- יישום מטמון תגובות
- אופטימיזציית פרומפטים ליעילות טוקנים
- שימוש ב-SKUs מתאימים
- הגדרת הרחבה אוטומטית נכונה

## אתגר סופי: יישום מקצה לקצה

### תרחיש אתגר

אתם מתבקשים ליצור צ'אטבוט שירות לקוחות מבוסס AI מוכן לייצור עם הדרישות הבאות:

**דרישות פונקציונליות:**
- ממשק אינטרנט לאינטראקציות עם לקוחות
- אינטגרציה עם Azure OpenAI לתגובות
- יכולת חיפוש מסמכים באמצעות Cognitive Search
- אינטגרציה עם מסד נתונים קיים של לקוחות
- תמיכה בריבוי שפות

**דרישות לא פונקציונליות:**
- טיפול ב-1000 משתמשים בו-זמנית
- SLA של 99.9% זמן פעולה
- תאימות SOC 2
- עלות מתחת ל-$500 לחודש
- פריסה למספר סביבות (פיתוח, בדיקות, ייצור)

### שלבי יישום

1. **תכננו את הארכיטקטורה**
2. **צרו את תבנית AZD**
3. **יישמו אמצעי אבטחה**
4. **הגדירו ניטור והתראות**
5. **צרו צינורות פריסה**
6. **תעדו את הפתרון**

### קריטריוני הערכה

- ✅ **פונקציונליות**: האם זה עונה על כל הדרישות?
- ✅ **אבטחה**: האם יושמו שיטות עבודה מומלצות?
- ✅ **יכולת הרחבה**: האם זה יכול להתמודד עם העומס?
- ✅ **תחזוקה**: האם הקוד והתשתית מאורגנים היטב?
- ✅ **עלות**: האם זה נשאר במסגרת התקציב?

## משאבים נוספים

### תיעוד של Microsoft
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [תיעוד שירות Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [תיעוד Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### תבניות לדוגמה
- [אפליקציית צ'אט Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [מדריך מהיר לאפליקציית צ'אט OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [צ'אט Contoso](https://github.com/Azure-Samples/contoso-chat)

### משאבי קהילה
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)
- [תבניות AZD מעולות](https://azure.github.io/awesome-azd/)

## 🎓 תעודת סיום
מזל טוב! סיימת את סדנת המעבדה של AI. עכשיו אתה אמור להיות מסוגל:

- ✅ להמיר יישומי AI קיימים לתבניות AZD
- ✅ לפרוס יישומי AI מוכנים לייצור
- ✅ ליישם את שיטות האבטחה הטובות ביותר עבור עומסי עבודה של AI
- ✅ לנטר ולייעל את ביצועי יישומי AI
- ✅ לפתור בעיות נפוצות בפריסה

### צעדים הבאים
1. יישם את הדפוסים הללו בפרויקטי AI שלך
2. תרום תבניות חזרה לקהילה
3. הצטרף ל-Discord של Microsoft Foundry לקבלת תמיכה מתמשכת
4. חקור נושאים מתקדמים כמו פריסות מרובות אזורים

---

**משוב על הסדנה**: עזור לנו לשפר את הסדנה הזו על ידי שיתוף החוויה שלך ב-[ערוץ #Azure של Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**ניווט בין פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח מבוסס AI
- **⬅️ קודם**: [פריסת מודל AI](ai-model-deployment.md)
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בייצור](production-ai-practices.md)
- **🚀 פרק הבא**: [פרק 3: תצורה](../getting-started/configuration.md)

**זקוק לעזרה?** הצטרף לקהילה שלנו לקבלת תמיכה ודיונים על AZD ופריסות AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו אחראים לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->