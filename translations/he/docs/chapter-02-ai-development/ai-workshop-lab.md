# מעבדה מעשית ל-AI: הפיכת פתרונות ה-AI שלך לניתנים לפריסה באמצעות AZD

**ניווט פרקים:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח מונחה-AI
- **⬅️ הקודם**: [פריסת מודל AI](ai-model-deployment.md)
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בייצור](production-ai-practices.md)
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

## סקירת הסדנה

מעבדה מעשית זו מלווה מפתחים בתהליך של לקיחת תבנית AI קיימת ופריסתה באמצעות Azure Developer CLI (AZD). תלמדו דפוסים בסיסיים לפריסות AI בייצור באמצעות שירותי Microsoft Foundry.

**משך:** 2-3 שעות  
**רמה:** בינוני  
**דרישות קדם:** ידע בסיסי ב-Azure, היכרות עם מושגי AI/ML

## 🎓 יעדי למידה

בתום הסדנה תוכל/י:
- ✅ המרת יישום AI קיים לשימוש בתבניות AZD
- ✅ תצורת שירותי Microsoft Foundry באמצעות AZD
- ✅ יישום ניהול הרשאות מאובטח לשירותי AI
- ✅ פריסת יישומי AI מוכנים לייצור עם ניטור
- ✅ פתרון תקלות נפוצות בפריסות AI

## דרישות קדם

### כלים נדרשים
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) מותקן
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) מותקן
- [Git](https://git-scm.com/) מותקן
- עורך קוד (מומלץ VS Code)

### משאבי Azure
- מנוי Azure עם הרשאות Contributor
- גישה לשירותי Azure OpenAI (או היכולת לבקש גישה)
- הרשאות ליצירת קבוצת משאבים

### ידע נדרש
- הבנה בסיסית של שירותי Azure
- היכרות עם ממשקי שורת פקודה
- מושגי AI/ML בסיסיים (APIs, מודלים, פרומפטים)

## הגדרת המעבדה

### שלב 1: הכנת הסביבה

1. **אמת את התקנת הכלים:**
```bash
# בדוק את התקנת AZD
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

## מודול 1: הבנת מבנה AZD עבור יישומי AI

### אנטומיה של תבנית AZD מוכנה ל-AI

חקור את הקבצים המרכזיים בתבנית AZD המוכנה ל-AI:

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

### **תרגיל מעבדה 1.1: חקור את התצורה**

1. **בחן את קובץ azure.yaml:**
```bash
cat azure.yaml
```

**מה לחפש:**
- הגדרות שירות עבור רכיבי AI
- מיפויי משתני סביבה
- תצורות מארח

2. **סקור את התשתית `main.bicep`:**
```bash
cat infra/main.bicep
```

**דפוסי AI מרכזיים לזיהוי:**
- אספקת שירות Azure OpenAI
- אינטגרציה עם Cognitive Search
- ניהול מפתחות מאובטח
- תצורות אבטחת רשת

### **נקודת דיון:** מדוע דפוסים אלה חשובים עבור AI

- **תלויות שירות**: יישומי AI לעיתים דורשים מספר שירותים מתואמים
- **אבטחה**: מפתחות API ונקודות קצה צריכים ניהול מאובטח
- **סקלאביליות**: עומסי AI יש דרישות קנה מידה ייחודיות
- **ניהול עלויות**: שירותי AI עלולים להיות יקרים אם אינם מוגדרים נכון

## מודול 2: פרוס את יישום ה-AI הראשון שלך

### שלב 2.1: אתחול הסביבה

1. **צור סביבת AZD חדשה:**
```bash
azd env new myai-workshop
```

2. **הגדר פרמטרים נדרשים:**
```bash
# הגדר את אזור Azure המועדף עליך
azd env set AZURE_LOCATION eastus

# אופציונלי: הגדר מודל OpenAI ספציפי
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### שלב 2.2: פריסת התשתית והיישום

1. **פרוס באמצעות AZD:**
```bash
azd up
```

**מה קורה במהלך `azd up`:**
- ✅ מספק שירות Azure OpenAI
- ✅ יוצר שירות Cognitive Search
- ✅ מגדיר App Service לאפליקציית הווב
- ✅ מגדיר רשת ואבטחה
- ✅ מפרוס קוד היישום
- ✅ מגדיר ניטור ולוגים

2. **נטר את התקדמות הפריסה** ושם לב למשאבים הנוצרים.

### שלב 2.3: אימות הפריסה שלך

1. **בדוק את המשאבים שיושמו:**
```bash
azd show
```

2. **פתח את היישום שיושם:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **בדוק את פונקציונליות ה-AI:**
   - נווט לאפליקציית הווב
   - נסה שאילתות לדוגמה
   - אשר כי תגובות ה-AI פועלות

### **תרגיל מעבדה 2.1: תרגול פתרון תקלות**

**תרחיש**: הפריסה הצליחה אך ה-AI אינו מגיב.

**בעיות נפוצות לבדיקה:**
1. **מפתחות API של OpenAI**: אמת שהם מוגדרים כראוי
2. **זמינות המודל**: בדוק האם האזור שלך תומך במודל
3. **קישוריות רשת**: ודא ששירותים יכולים לתקשר
4. **הרשאות RBAC**: אמת שהאפליקציה יכולה לגשת ל-OpenAI

**פקודות לדיבוג:**
```bash
# בדוק את משתני הסביבה
azd env get-values

# הצג יומני פריסה
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# בדוק את מצב הפריסה של OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## מודול 3: התאמת יישומי AI לצרכים שלך

### שלב 3.1: שנה את תצורת ה-AI

1. **עדכן את מודל OpenAI:**
```bash
# החלף לדגם אחר (אם זמין באזור שלך)
azd env set AZURE_OPENAI_MODEL gpt-4

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

**פרקטיקה מומלצת**: תצורות שונות עבור פיתוח מול ייצור.

1. **צור סביבת ייצור:**
```bash
azd env new myai-production
```

2. **הגדר פרמטרים ספציפיים לייצור:**
```bash
# בייצור בדרך כלל משתמשים ב-SKU גבוהים יותר
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# הפעל תכונות אבטחה נוספות
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **תרגיל מעבדה 3.1: אופטימיזציה של עלויות**

**אתגר**: תצב את התבנית כך שתתאים לפיתוח חסכוני.

**מטלות:**
1. זהה אילו SKU-ים ניתן להגדיר לשכבות חינם/בסיסיות
2. הגדר משתני סביבה לצורך עלות מינימלית
3. פרוס והשווה עלויות עם תצורת הייצור

**רמזים לפתרון:**
- השתמש בשכבת F0 (חינמית) לשירותי Cognitive כאשר אפשרי
- השתמש בשכבת Basic לשירות החיפוש במהלך פיתוח
- שקול להשתמש בתוכנית Consumption עבור Functions

## מודול 4: אבטחה ושיטות עבודה מומלצות לייצור

### שלב 4.1: ניהול נתוני גישה מאובטח

**אתגר נוכחי**: יישומי AI רבים מקודדים מפתחות API בקוד או משתמשים באחסון לא מאובטח.

**פתרון AZD**: Managed Identity + אינטגרציה עם Key Vault.

1. **סקור את תצורת האבטחה בתבנית שלך:**
```bash
# חפש תצורת מאגר מפתחות וזהות מנוהלת
grep -r "keyVault\|managedIdentity" infra/
```

2. **אמת ש-Managed Identity פועלת:**
```bash
# בדוק האם לאפליקציית האינטרנט יש תצורת זהות נכונה
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### שלב 4.2: אבטחת רשת

1. **אפשר private endpoints** (אם הם לא מוגדרים כבר):

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

### שלב 4.3: ניטור ונצפות

1. **הגדר Application Insights:**
```bash
# Application Insights אמור להיות מוגדר באופן אוטומטי
# בדוק את התצורה:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **הצב ניטור מותאם ל-AI:**

הוסף מדדים מותאמים עבור פעולות AI:
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

**משימה**: בחן את הפריסה שלך מול שיטות עבודה מומלצות לאבטחה.

**רשימת בדיקה:**
- [ ] אין סודות מקודדים בקוד או בתצורה
- [ ] נעשה שימוש ב-Managed Identity לאימות בין שירותים
- [ ] Key Vault מאחסן קונפיגורציה רגישה
- [ ] גישת הרשת מוגבלת כראוי
- [ ] ניטור ולוגים מופעלים

## מודול 5: המרת יישום ה-AI שלך

### שלב 5.1: גיליון הערכה

**לפני המרת היישום שלך**, ענה על השאלות הבאות:

1. **ארכיטקטורת היישום:**
   - אילו שירותי AI היישום שלך משתמש?
   - אילו משאבי חישוב הוא צריך?
   - האם הוא דורש מסד נתונים?
   - מהן התלויות בין השירותים?

2. **דרישות אבטחה:**
   - אילו נתונים רגישים היישום שלך מעבד?
   - אילו דרישות תאימות יש לך?
   - האם אתה צריך רשת פרטית?

3. **דרישות קנה מידה:**
   - מהו העומס הצפוי שלך?
   - האם אתה צריך קנה מידה אוטומטי?
   - האם יש דרישות אזוריות?

### שלב 5.2: צור את תבנית ה-AZD שלך

**עקוב אחרי התבנית הזו להמרת היישום שלך:**

1. **צור את המבנה הבסיסי:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# אתחל את תבנית AZD
azd init --template minimal
```

2. **צור את azure.yaml:**
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

**אתגר**: צור תבנית AZD לאפליקציית AI לעיבוד מסמכים.

**דרישות:**
- Azure OpenAI לניתוח תוכן
- Document Intelligence ל-OCR
- Storage Account להעלאת מסמכים
- Function App ללוגיקת עיבוד
- Web app לממשק משתמש

**נקודות בונוס:**
- הוסף טיפול שגיאות תקין
- כלול הערכת עלויות
- הקם לוחות בקרה לניטור

## מודול 6: פתרון בעיות נפוצות

### בעיות פריסה נפוצות

#### בעיה 1: חריגה ממכסת שירות OpenAI
**תסמינים:** הפריסה נכשלת עם שגיאת מכסה  
**פתרונות:**
```bash
# בדוק את המכסות הנוכחיות
az cognitiveservices usage list --location eastus

# בקש הגדלת המכסה או נסה אזור אחר
azd env set AZURE_LOCATION westus2
azd up
```

#### בעיה 2: המודל אינו זמין באזור
**תסמינים:** תגובות AI נכשלות או שגיאות בפריסת המודל  
**פתרונות:**
```bash
# בדוק זמינות המודל לפי אזור
az cognitiveservices model list --location eastus

# עדכן למודל הזמין
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
1. בדוק את Application Insights עבור מדדי ביצועים
2. סקור את מדדי שירות OpenAI בפורטל Azure
3. אמת קישוריות רשת והשהיה (latency)

**פתרונות:**
- יישם caching לשאילתות נפוצות
- השתמש במודל OpenAI מתאים למקרה השימוש שלך
- שקול שכפולי קריאה (read replicas) לתרחישים בעומס גבוה

### **תרגיל מעבדה 6.1: אתגר דיבוג**

**תרחיש**: הפריסה הצליחה, אך היישום מחזיר שגיאות 500.

**משימות דיבוג:**
1. בדוק לוגים של היישום
2. אמת קישוריות שירות
3. בדוק אימות
4. סקור את התצורה

**כלים לשימוש:**
- `azd show` להצגת תקציר פריסה
- פורטל Azure ללוגים מפורטים של שירותים
- Application Insights לטלמטריה של היישום

## מודול 7: ניטור ואופטימיזציה

### שלב 7.1: הקם ניטור מקיף

1. **צור לוחות בקרה מותאמים:**

נווט לפורטל Azure וצור לוח בקרה עם:
- ספירת בקשות ל-OpenAI והשהיה
- שיעורי שגיאות היישום
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

1. **נתח את העלויות הנוכחיות:**
```bash
# השתמש ב-Azure CLI כדי לקבל נתוני עלויות
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **יישם בקרות עלות:**
- הקם התראות תקציב
- השתמש במדיניות קנה מידה אוטומטית
- יישם caching לבקשות
- נטר שימוש בטוקנים עבור OpenAI

### **תרגיל מעבדה 7.1: אופטימיזציה של ביצועים**

**משימה**: אמת את יישום ה-AI שלך הן לביצועים והן לעלות.

**מדדים לשיפור:**
- צמצם את זמן התגובה הממוצע ב-20%
- צמצם עלויות חודשיות ב-15%
- שמור על זמינות של 99.9%

**אסטרטגיות לנסיון:**
- יישם caching לתגובות
- שפר פרומפטים ליעילות טוקנים
- השתמש ב-SKU-ים חישוביים מתאימים
- הגדר קנה מידה אוטומטי נכון

## אתגר סופי: יישום מקצה לקצה

### תרחיש האתגר

הוטלת עליך המשימה ליצור צ'אטבוט לשירות לקוחות מבוסס AI מוכן לייצור עם הדרישות הבאות:

דרישות פונקציונליות:
- ממשק ווב לאינטראקציות עם לקוחות
- אינטגרציה עם Azure OpenAI לתגובות
- יכולת חיפוש מסמכים באמצעות Cognitive Search
- אינטגרציה עם מסד הנתונים הקיים של הלקוחות
- תמיכה ברב שפות

דרישות לא פונקציונליות:
- יכולת לטפל ב-1000 משתמשים מקבילים
- SLA של 99.9% לזמינות
- תאימות SOC 2
- עלות מתחת ל-500$/חודש
- פרוס לסביבות מרובות (dev, staging, prod)

### שלבי יישום

1. **עצב את הארכיטקטורה**
2. **צור את תבנית ה-AZD**
3. **יישם אמצעי אבטחה**
4. **הגדר ניטור והתראות**
5. **צור צנרות פריסה (deployment pipelines)**
6. **תעד את הפתרון**

### קריטריונים להערכה

- ✅ **פונקציונליות**: האם הוא עומד בכל הדרישות?
- ✅ **אבטחה**: האם הוטמעו שיטות עבודה מומלצות?
- ✅ **ניתנות להרחבה**: האם הוא יכול להתמודד עם העומס?
- ✅ **ניתנות לתחזוקה**: האם הקוד והתשתית מאורגנים היטב?
- ✅ **עלות**: האם זה נשאר במסגרת התקציב?

## משאבים נוספים

### תיעוד של Microsoft
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [תיעוד שירות Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [תיעוד Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### תבניות לדוגמה
- [דוגמת אפליקציית צ'אט Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [התחלת מהירה לאפליקציית צ'אט OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [צ'אט Contoso](https://github.com/Azure-Samples/contoso-chat)

### משאבי קהילה
- [Discord של Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)
- [תבניות AZD מעולות](https://azure.github.io/awesome-azd/)

## 🎓 תעודת סיום
מזל טוב! סיימת את מעבדת הסדנה ל-AI. עכשיו אתה אמור להיות מסוגל:

- ✅ להמיר יישומי AI קיימים לתבניות AZD
- ✅ לפרוס יישומי AI מוכנים לפרודקשן
- ✅ ליישם שיטות עבודה מומלצות לאבטחה לעומסי עבודה של AI
- ✅ לנטר ולאופטימיזציה של ביצועי יישומי AI
- ✅ לפתור בעיות פריסה נפוצות

### צעדים הבאים
1. החל דפוסים אלה על פרויקטי ה-AI שלך
2. תרום תבניות חזרה לקהילה
3. הצטרף ל-Microsoft Foundry Discord לקבלת תמיכה שוטפת
4. חקור נושאים מתקדמים כמו פריסות מרובות-אזוריות

---

**משוב על הסדנה**: עזור לנו לשפר סדנה זו על ידי שיתוף החוויה שלך בערוץ [ערוץ #Azure של Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**ניווט בין פרקים:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח שממוקד ב-AI
- **⬅️ הקודם**: [פריסת מודל AI](ai-model-deployment.md)
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בפרודקשן](production-ai-practices.md)
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

**צריך עזרה?** הצטרפו לקהילה שלנו לקבלת תמיכה ולדיונים על פריסות AZD ו-AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**הצהרת אחריות**:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדייק, יש לשים לב שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו כמקור הסמכות. עבור מידע קריטי, מומלץ לקבל תרגום מקצועי מאת מתרגם אנושי. איננו נושאים באחריות לכל אי-הבנות או פרשנויות שגויות הנובעות מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->