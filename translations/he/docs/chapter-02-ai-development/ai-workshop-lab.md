# מעבדת סדנת בינה מלאכותית: להפוך את פתרונות ה-AI שלכם לאפליקציות שניתן לפרוס באמצעות AZD

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח בראש AI
- **⬅️ קודם**: [פריסת מודלי AI](ai-model-deployment.md)
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בפרודקשן](../chapter-08-production/production-ai-practices.md)
- **🚀 הפרק הבא**: [פרק 3: הגדרות](../chapter-03-configuration/configuration.md)

## סקירת הסדנה

מעבדה מעשית זו מנחה מפתחים בתהליך לקיחת תבנית AI קיימת ופריסתה באמצעות Azure Developer CLI (AZD). תלמדו דפוסים חיוניים לפריסות AI בפרודקשן באמצעות שירותי Microsoft Foundry.

> **סקירת מהדורה (2026-11-04):** התבוננות בפקודות AZD ושמות התצורה המדגמית נעשו בהתאמה למהדורת `azd` `1.37.2` ולתצורה הנוכחית של המדגם המקושר. זוהי סקירת תיעוד, לא אימות פריסה בשידור חי. מעבדת RAG אינה דורשת את תוסף הסוכן; עבור הערכות סוכן יש להשתמש בתוסף נפרד `azure.ai.evaluations` וב[זרימת ההערכה העדכנית](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), ולא בפקודות הערכה של סוכן ישנות.

**משך:** 2-3 שעות  
**רמה:** בינונית  
**דרישות מוקדמות:** ידע בסיסי ב-Azure, היכרות עם מושגי AI/ML

## 🎓 מטרות הלמידה

בסיום הסדנה, תוכלו:
- ✅ לחקור תבנית AI קיימת של AZD ולתכנן המרה של האפליקציה שלכם
- ✅ להגדיר שירותי Microsoft Foundry עם AZD
- ✅ ליישם ניהול קרדנציאלים מאובטח לשירותי AI
- ✅ לפרוס אפליקציית AI לדוגמה עם ניטור
- ✅ לפתור בעיות נפוצות בפריסת AI

## דרישות מוקדמות

### כלים נדרשים
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) מותקן
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) מותקן
- [Git](https://git-scm.com/) מותקן
- עורך קוד (מומלץ VS Code)

בלוקים אלה משתמשים בתחביר Bash (כולל המשכים של שורות ו-`grep`). ב-Windows, השתמש ב-Git Bash/WSL או תרגם אותם ל-PowerShell. בנוסף התקן את שפת התכנות, מנהל החבילות, וכלי המכולות המפורטים ב[הגדרת הסביבה המקומית של המדגם](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### משאבי Azure
- מנוי Azure עם הרשאות הקצאת משאבים והקצאת תפקידים (למשתמש Contributor בלבד אין הרשאות ליצירת הקצאת RBAC; השתמש במנהל תפקידים מורשה או שווה ערך מתועד של המדגם)
- גישה לשירותי Microsoft Foundry Models (או יכולת לבקש גישה)
- הרשאות יצירת Resource Group

### דרישות ידע
- הבנה בסיסית של שירותי Azure
- היכרות עם ממשקי שורת הפקודה
- מושגי AI/ML בסיסיים (API, מודלים, פקודות)

## הקמת המעבדה

### שלב 1: הכנת הסביבה

1. **אמת את התקנת הכלים:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

אם אתה עובד עם מספר שוכרים או שהמנוי לא מזוהה אוטומטית, נסה שוב עם `azd auth login --tenant-id <tenant-id>`.

2. **שכפל את מאגר הסדנה:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## מודול 1: הבנת מבנה AZD לאפליקציות AI

### אנטומיה של תבנית AZD ל-AI

חקור את הקבצים המרכזיים בתבנית AZD מוכנה ל-AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

המדגם המשוכפל יכול להשתנות; `.azure/` מופיע לאחר אתחול הסביבה, לא בהכרח בשכפול טרי. בדוק את השכפול בפועל במקום ליצור תיקיות חסרות שיתאימו לסכמה הזו.

### **תרגיל מעבדה 1.1: חקור את התצורה**

1. **בדוק את הקובץ azure.yaml:**
```bash
cat azure.yaml
```

**מה לחפש:**
- הגדרות שירות עבור רכיבי AI
- מיפוי משתני סביבה
- תצורות מארח

2. **סקור את התשתית ב-main.bicep:**
```bash
cat infra/main.bicep
```

**דפוסי AI מרכזיים לזיהוי:**
- פריסת שירות Microsoft Foundry Models
- אינטגרציה עם Azure AI Search
- ניהול מפתחות מאובטח
- תצורות אבטחת רשת

### **נקודת שיח:** מדוע דפוסים אלה חשובים ל-AI

- **תלות בשירותים**: אפליקציות AI דורשות לעיתים שירותים רבים מתואמים
- **אבטחה**: חשוב לנהל מפתחות API ונקודות קצה בצורה מאובטחת
- **סרגללות**: לעומסי AI דרישות סקלביליות ייחודיות
- **ניהול עלויות**: שירותי AI יכולים להיות יקרים אם לא מוגדרים נכון

## מודול 2: פרוס את אפליקציית ה-AI הראשונה שלך

### שלב 2.1: אתחול הסביבה

1. **צור סביבה חדשה עם AZD:**
```bash
azd env new myai-workshop
```

2. **הגדר פרמטרים נדרשים:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### שלב 2.2: פרוס את התשתית והאפליקציה

1. **פרוס עם AZD:**
```bash
azd up
```

**מה קורה בזמן `azd up`:**
- ✅ מקים שירות Microsoft Foundry Models
- ✅ יוצר שירות Azure AI Search
- ✅ מתקין Azure Container Apps ל-backend ול-frontend כלול (הברירת מחדל הנוכחי של המדגם)
- ✅ מגדיר רשת ואבטחה
- ✅ מפרוס קוד אפליקציה
- ✅ מקים ניטור ורישום

2. **נטר את ההתקדמות בפריסה** והער את המשאבים הנוצרים.

### שלב 2.3: אמת את הפריסה שלך

1. **בדוק את המשאבים שפורסמו:**
```bash
azd show
```

2. **פתח את האפליקציה שפורסמה:**
```bash
azd show
```

פתח את נקודת הקצה האינטרנטית שמופיעה בתוצאת `azd show`.

3. **בדוק את פעולת ה-AI:**
   - עבור לאפליקציה באינטרנט
   - נסה שאילתות לדוגמה
   - אמת שמספרי ה-AI פועלים

### **תרגיל מעבדה 2.1: תרגול פתרון בעיות**

**תרחיש**: הפריסה הצליחה אך ה-AI אינו משיב.

**בעיות נפוצות לבדיקה:**
1. **אימות:** אמת את הזהות המנוהלת והקצאת התפקידים; בדוק מפתחות API רק אם אפשרת באופן מיוחד אימות מבוסס מפתח
2. **זמינות דגם:** בדוק אם האזור שלך תומך בדגם
3. **חיבוריות רשת:** ודא שהשירותים יכולים לתקשר
4. **הרשאות RBAC:** אמת שהאפליקציה יכולה לגשת ל-OpenAI

**פקודות דיבוג:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## מודול 3: התאמת אפליקציות AI לצרכים שלך

### שלב 3.1: שינוי תצורת ה-AI

1. **עדכן את דגם OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **הוסף שירותי AI נוספים:**

ערוך את `infra/main.bicep` כדי להוסיף Document Intelligence:

הקטע הבא הוא המחשה, לא תבנית מלאה. ייתכן שהמדגם כבר מקים שירותי עיבוד מסמכים: בדוק את התשתית הנוכחית לפני הוספת משאבים כפולים. תוספות מותאמות דורשות חיבורים לפלטים, זהויות, ותצורת אפליקציה.

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

### שלב 3.2: תצורות ייחודיות לסביבה

**שיטת עבודה מומלצת:** תצורות שונות לפיתוח מול פרודקשן.

1. **צור סביבה לפרודקשן:**
```bash
azd env new myai-production
```

2. **הגדר פרמטרים ייעודיים לפרודקשן:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

שמות אלה מגיעים מ-[main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) של המדגם. `azd env set` מאחסן ערך אך אינו מייצר משתנה פעיל באופן שרירותי: התבנית חייבת להשתמש בו. סקור את [מדריך בידוד הרשת](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) של המדגם לפני השבתת גישה ציבורית, והשתמש ב-`azd up` ליישום שינויים בתשתית. SKU של OpenAI `S0` בלבד אינו קובע את קצב העיבוד; גם סוג וכושר הפריסה של הדגם משפיעים.

### **תרגיל מעבדה 3.1: אופטימיזציה של עלויות**

**אתגר:** הגדר את התבנית לפיתוח חסכוני.

**משימות:**
1. בחר את הסביבה הניתנת למחיקה של הסדנה: `azd env select myai-workshop`.
2. רשום את ה-SKU הנוכחי של Search וקיבולת הדגם מתוך `infra/main.parameters.json` והסביבה שבחרת.
3. השתמש בקלט הנתמך למטה, לאחר אימות מכסת הדגם/האזור:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. אמת את ה-SKU של Search וקיבולת הפריסה בפורטל ואמד את ההבדל עם מחשבון המחירים. אל תצפה לעדכון מיידי של נתוני החיוב.

**קריטריוני הצלחה:** Search משתמש ב-Basic, לפריסת הצ'אט יש קיבולת נתמכת כפי שבוקשה, והאפליקציה עדיין מגיבה לשאלה לדוגמה. קיבולת `10` היא מוקצית להגבלת שיעור, לא הנחה במחיר טוקן. שינויים ברמת Search עשויים להיות מוגבלים או לדרוש יצירת מחודש; אל תערוך ניסויים על משאבים בפרודקשן. F0 הוא ספציפי לשירות ואינו SKU של דגם Azure OpenAI.

## מודול 4: אבטחה ושיטות עבודה מומלצות בפרודקשן

### שלב 4.1: ניהול קרדנציאלים מאובטח

**אתגר נוכחי:** אפליקציות AI רבות מקודדות מפתחות API או משתמשות באחסון לא בטוח.

**פתרון AZD:** זהות מנוהלת + אינטגרציה עם Key Vault.

1. **סקור את הגדרות האבטחה בתבנית שלך:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **אמת את פעולת הזהות המנוהלת:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### שלב 4.2: אבטחת רשת

1. **אפשר נקודות קצה פרטיות** באמצעות תצורת הרשת הנתמכת של המדגם (אם לא מוגדר כבר).

עבור התבנית שלך, קטע המחשה זה מראה את חיבור נקודת הקצה של OpenAI. הוא גם זקוק ל-VNet, תצורת DNS פרטית, וקישוריות לאפליקציה; אל תעתיק אותו כפי שהוא לתוך המדגם, שכבר כולל מודולים לנקודות קצה פרטיות:
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
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **אפשר אינטגרציה של Application Insights של המדגם:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

הכלי לניטור של המדגם שולח טלמטריה; הגדרה שרירותית של `OPENAI_MONITOR_ENABLED` אינה מפעילה מדדי AI. בדוק מעקבים עבור שיחות לדגם, תנודתיות, כשלונות, ושימוש בטוקנים, והימנע מהרשמת פקודות או תגובות רגישות.

### **תרגיל מעבדה 4.1: ביקורת אבטחה**

**משימה:** סקור את הפריסה שלך לשיטות עבודה מומלצות באבטחה.

**רשימת בדיקה:**
- [ ] אין סודות מקודדים בקוד או בתצורה
- [ ] זהות מנוהלת לשם אימות שירות-לשירות
- [ ] Key Vault מאחסן תצורה רגישה
- [ ] גישה לרשת מוגבלת כראוי
- [ ] ניטור ורישום מופעלים

## מודול 5: המרת אפליקציית AI שלך

### שלב 5.1: גיליון הערכה

**לפני המרת האפליקציה שלך**, השב על השאלות הבאות:

1. **ארכיטקטורת האפליקציה:**
   - אילו שירותי AI האפליקציה שלך משתמשת?
   - אילו משאבי מחשוב דרושים לה?
   - האם היא דורשת בסיס נתונים?
   - מהן התלויות בין השירותים?

2. **דרישות אבטחה:**
   - אילו נתונים רגישים האפליקציה שלך מטפלת בהם?
   - אילו דרישות תאימות יש לך?
   - האם דרושה רשת פרטית?

3. **דרישות סרגלול:**
   - מה עומס העבודה הצפוי?
   - האם דרוש סרגלול אוטומטי?
   - האם יש דרישות אזוריות?

### שלב 5.2: צור תבנית AZD משלך

**עקוב אחרי דפוס זה להמרת האפליקציה:**

**רק שלד תבנית:** חלק זה אינו מספק קוד מקור של API/אפליקציית רשת, תשתית מארחת, פריסות מודלים, זהויות/RBAC או `main.parameters.json` גמורה. הבייסיק של Bicep ברמת resource-group מדגים הרכבת מודול; נקודת כניסה טיפוסית של מנוי AZD חייבת ליצור resource group ולהפעיל אותו בהיקף זה. אל תצפה ש-`azd up` יפרוס אפליקציה שלמה לאחר העתקת חלקים אלה בלבד. לשורת בסיס הניתנת להרצה, המשך להשתמש בתבנית RAG ממודול 1.

1. **צור את המבנה הבסיסי:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
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
- חשבון אחסון להעלאת מסמכים
- Function App ללוגיקת עיבוד
- אפליקציית רשת לממשק משתמש

**נקודות בונוס:**
- הוסף טיפול נכון בשגיאות
- כלול הערכת עלויות
- הקם לוחות בקרה לניטור

## מודול 6: פתרון בעיות נפוצות

### בעיות נפוצות בפריסה

#### בעיה 1: חריגה ממכסת שירות OpenAI
**תסמינים:** הפריסה נכשלה עם שגיאת מכסה
**פתרונות:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### בעיה 2: דגם לא זמין באזור
**תסמינים:** תגובות AI נכשלים או שגיאות בפריסת הדגם
**פתרונות:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
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
1. בדוק מדדים ב-Application Insights
2. עיין במדדי שירות OpenAI בפורטל Azure
3. אמת חיבוריות רשת ועיכובים

**פתרונות:**
- יישם caching לשאילתות נפוצות
- השתמש בדגם OpenAI מתאים למקרה השימוש שלך
- סקל אפליקציית רפליקות רק לאחר בדיקת מגבלות RPM/TPM של הדגם; פריסות Azure OpenAI אינן חושפות הגדרת "רפליקת קריאה" בסגנון בסיס נתונים גנרי

### **תרגיל מעבדה 6.1: אתגר דיבוג**

**תרחיש:** הפריסה הצליחה, אך האפליקציה מחזירה שגיאות 500.

**משימות דיבוג:**
1. בדוק לוגים של האפליקציה
2. אמת חיבור שירות
3. בדוק אימות
4. סקור תצורה

**כלים לשימוש:**
- `azd show` לסקירת פריסות
- פורטל Azure ליומני שירות מפורטים
- Application Insights למעקב טלמטריה של האפליקציה

## מודול 7: ניטור ואופטימיזציה

### שלב 7.1: הקמת ניטור מקיף

1. **צור לוחות בקרה מותאמים אישית:**

עבור לפורטל Azure וצור לוח בקרה הכולל:
- ספירת בקשות וזמני השהייה ל-OpenAI
- אחוזי שגיאות האפליקציה
- ניצול משאבים
- מעקב עלויות

2. **הגדר התראות:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

אמת שהרכיב משדר טלמטריה של בקשות והוסף קבוצת פעולה אם נדרשות התראות. המדד הוא ספירה, לא אחוז כישלונות; התראת שיעור דורשת שאילתה ומתאם מתאים.

### שלב 7.2: אופטימיזציה של עלויות

1. **נתח את העלויות הנוכחיות:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

החלף את משתני התאריך. תמיכת ממשק הצריכה משתנה לפי הסכם החיוב; השתמש בניהול עלויות בפורטל אם פרטי השימוש אינם זמינים. העלויות מתעכבות ואינן מדד בזמן אמת.

2. **יישם בקרות עלויות:**
- הגדר התראות תקציב
- השתמש במדיניות אוטוסקיילינג
- יישם מטמון לבקשות
- נטר שימוש ב-token עבור OpenAI

### **תרגיל מעבדה 7.1: אופטימיזציית ביצועים**

**משימה**: בצע אופטימיזציה לאפליקציית ה-AI שלך הן מבחינת ביצועים והן מבחינת עלויות.

**מדדים לשיפור:**
- הפחת זמן תגובה ממוצע ב-20%
- הפחת עלויות חודשיות ב-15%
- הגדר SLO זמינות של 99.9% וחלון מדידה (מעבדה קצרה לא תוכל להציג זמינות חודשית)

**אסטרטגיות לנסות:**
- יישם מטמון תגובות
- אופטימיזציה להנחיות ליעילות token
- השתמש ב-SKU מתאימים לחישוב
- הגדר אוטוסקיילינג נכון

## אתגר סופי: יישום מקצה לקצה

### תרחיש האתגר

זהו **אתגר ארכיטקטורה/עיצוב אופציונלי**, לא תרגיל הרצה מסופק או הסמכת ייצור. הצע צ׳אטבוט שירות לקוחות מבוסס AI ותעד אילו דרישות דורשות יישום נוסף והוכחות:

**דרישות פונקציונליות:**
- ממשק רשת לאינטראקציות עם לקוחות
- אינטגרציה עם מודלים של Microsoft Foundry לתגובות
- יכולת חיפוש במסמכים באמצעות Azure AI Search
- אינטגרציה עם מסד נתונים קיים של לקוחות
- תמיכה רב-לשונית

**דרישות לא פונקציונליות:**
- תמיכה ב-1000 משתמשים בו זמנית
- SLA זמינות של 99.9%
- תאימות SOC 2
- עלות מתחת ל-500 דולר לחודש
- פריסה במספר סביבות (פיתוח, בדיקה, ייצור)

אלה מגבלות היפותטיות של בעלי עניין, לא תוצאות מובטחות במקביל. הגדר שיעור בקשות, גודל הפרומפט/פלט, ומשך מושב לפני הערכת עלויות; 1000 משתמשים בו זמנית אינם מבססים עומס עבודה או מוכיחים שהתקציב של $500 ניתן להשגה. SOC 2 הוא תוצר ביקורת ארגונית, לא מתג שמופעל על ידי תבנית AZD. זהה פשרות ודחה מגבלות בלתי אפשריות עם הוכחות.

### שלבי יישום

1. **עצב את הארכיטקטורה**
2. **צור את תבנית ה-AZD**
3. **יישם אמצעי אבטחה**
4. **הגדר ניטור והתראה**
5. **צור צינורות פריסה**
6. **תעד את הפתרון**

### קריטריוני הערכה

- ✅ **פונקציונליות**: האם הוצגו יכולות מיושמות וחסרים שנותרו מפורשים?
- ✅ **אבטחה**: האם יושמו שיטות עבודה מומלצות?
- ✅ **יכולת התרחבות**: האם ניתן להתמודד עם העומס?
- ✅ **תחזוקה**: האם הקוד והתשתית מאורגנים היטב?
- ✅ **עלות**: האם נשאר במסגרת התקציב?

## משאבים נוספים

### תיעוד של Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### תבניות לדוגמה
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### משאבי קהילה
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 נקודת סיום

ברכות! השלמת את סדנת המעבדה של AI. כעת אמור להיות באפשרותך:

- ✅ להסביר כיצד להתאים אפליקציית AI קיימת לתבנית AZD
- ✅ לפרוס ולבדוק אפליקציית AI לדוגמה
- ✅ ליישם שיטות אבטחה מומלצות לעומסי עבודה של AI
- ✅ לנטר ולאופטם את ביצועי אפליקציית AI
- ✅ לפתור בעיות פריסה נפוצות

**ניקוי:** הרץ `azd env list`, בחר בכל סביבה חד-פעמית שנוצרה במעבדה זו (`myai-workshop`, ואם פרוסה `myai-production`/`myai-quota-test`), והרץ `azd down` בכל אחת. סקור את תוכנית המחיקה; מחיקת הגדרות מקומיות של סביבה בלבד אינה מוחקת משאבי Azure. הימנע מ-`--purge` אלא אם כן אתה מבין הסרת משאבים שנמחקו ברכות בלתי הפיכה.

### צעדים הבאים
1. יישם את התבניות הללו בפרויקטי ה-AI שלך
2. תרום תבניות חזרה לקהילה
3. הצטרף ל-Microsoft Foundry Discord לתמיכה שוטפת
4. חקור נושאים מתקדמים כמו פריסות מרובות אזורים

---

**משוב על הסדנה**: עזור לנו לשפר את הסדנה הזו על ידי שיתוף חווייתך בערוץ #Azure ב-[Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**ניווט בפרק:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח ממוקד AI
- **⬅️ הקודם**: [פריסת מודל AI](ai-model-deployment.md)
- **➡️ הבא**: [שיטות עבודה מומלצות ל-AI בייצור](../chapter-08-production/production-ai-practices.md)
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

**צריכים עזרה?** הצטרפו לקהילה שלנו לתמיכה ודיונים בנושא AZD ופריסות AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->