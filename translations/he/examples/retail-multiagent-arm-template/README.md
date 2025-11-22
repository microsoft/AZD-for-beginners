<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-21T17:15:16+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "he"
}
-->
# פתרון רב-סוכנים לקמעונאות - תבנית תשתית

**פרק 5: חבילת פריסה לייצור**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק קשור**: [פרק 5: פתרונות AI רב-סוכנים](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 מדריך תרחיש**: [ארכיטקטורה מלאה](../retail-scenario.md)
- **🎯 פריסה מהירה**: [פריסה בלחיצה אחת](../../../../examples/retail-multiagent-arm-template)

> **⚠️ תבנית תשתית בלבד**  
> תבנית ARM זו פורסת **משאבי Azure** למערכת רב-סוכנים.  
>  
> **מה נפרס (15-25 דקות):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings בשלושה אזורים)
> - ✅ שירות חיפוש AI (ריק, מוכן ליצירת אינדקסים)
> - ✅ Container Apps (תמונות דמה, מוכן לקוד שלך)
> - ✅ אחסון, Cosmos DB, Key Vault, Application Insights
>  
> **מה לא כלול (דורש פיתוח):**
> - ❌ קוד מימוש סוכנים (סוכן לקוחות, סוכן מלאי)
> - ❌ לוגיקת ניתוב ונקודות קצה API
> - ❌ ממשק משתמש לצ'אט
> - ❌ סכמות אינדקס חיפוש וצינורות נתונים
> - ❌ **הערכת מאמץ פיתוח: 80-120 שעות**
>  
> **השתמש בתבנית זו אם:**
> - ✅ אתה רוצה להקים תשתית Azure לפרויקט רב-סוכנים
> - ✅ אתה מתכנן לפתח את מימוש הסוכנים בנפרד
> - ✅ אתה זקוק לתשתית בסיסית מוכנה לייצור
>  
> **אל תשתמש אם:**
> - ❌ אתה מצפה לדמו רב-סוכנים עובד מיד
> - ❌ אתה מחפש דוגמאות קוד שלמות לאפליקציה

## סקירה כללית

תיקייה זו מכילה תבנית Azure Resource Manager (ARM) מקיפה לפריסת **בסיס התשתית** של מערכת תמיכת לקוחות רב-סוכנים. התבנית מקימה את כל שירותי Azure הנדרשים, מוגדרים ומחוברים כראוי, ומוכנים לפיתוח האפליקציה שלך.

**לאחר הפריסה, יהיה לך:** תשתית Azure מוכנה לייצור  
**להשלמת המערכת, תצטרך:** קוד סוכנים, ממשק משתמש קדמי, וקונפיגורציית נתונים (ראה [מדריך ארכיטקטורה](../retail-scenario.md))

## 🎯 מה נפרס

### תשתית ליבה (סטטוס לאחר פריסה)

✅ **שירותי Azure OpenAI** (מוכנים לקריאות API)
  - אזור ראשי: פריסת GPT-4o (קיבולת 20K TPM)
  - אזור משני: פריסת GPT-4o-mini (קיבולת 10K TPM)
  - אזור שלישי: מודל embeddings טקסט (קיבולת 30K TPM)
  - אזור הערכה: מודל grader של GPT-4o (קיבולת 15K TPM)
  - **סטטוס:** פעיל לחלוטין - ניתן לבצע קריאות API מיד

✅ **Azure AI Search** (ריק - מוכן לקונפיגורציה)
  - יכולות חיפוש וקטורי מופעלות
  - רמת Standard עם מחיצה אחת, שכפול אחד
  - **סטטוס:** השירות פועל, אך דורש יצירת אינדקס
  - **פעולה נדרשת:** צור אינדקס חיפוש עם הסכמה שלך

✅ **Azure Storage Account** (ריק - מוכן להעלאות)
  - מכולות Blob: `documents`, `uploads`
  - קונפיגורציה מאובטחת (HTTPS בלבד, ללא גישה ציבורית)
  - **סטטוס:** מוכן לקבלת קבצים
  - **פעולה נדרשת:** העלה את נתוני המוצרים והמסמכים שלך

⚠️ **סביבת Container Apps** (תמונות דמה נפרסו)
  - אפליקציית ניתוב סוכנים (תמונת ברירת מחדל של nginx)
  - אפליקציה קדמית (תמונת ברירת מחדל של nginx)
  - קונפיגורציית אוטו-סקיילינג (0-10 מופעים)
  - **סטטוס:** מפעיל מכולות דמה
  - **פעולה נדרשת:** בנה ופרוס את אפליקציות הסוכנים שלך

✅ **Azure Cosmos DB** (ריק - מוכן לנתונים)
  - מסד נתונים ומכולה מוגדרים מראש
  - מותאם לפעולות בעלות השהיה נמוכה
  - TTL מופעל לניקוי אוטומטי
  - **סטטוס:** מוכן לאחסון היסטוריית צ'אט

✅ **Azure Key Vault** (אופציונלי - מוכן לסודות)
  - מחיקה רכה מופעלת
  - RBAC מוגדר לזהויות מנוהלות
  - **סטטוס:** מוכן לאחסון מפתחות API ומחרוזות חיבור

✅ **Application Insights** (אופציונלי - ניטור פעיל)
  - מחובר ל-Log Analytics workspace
  - מדדים והתראות מותאמים אישית מוגדרים
  - **סטטוס:** מוכן לקבלת טלמטריה מהאפליקציות שלך

✅ **Document Intelligence** (מוכן לקריאות API)
  - רמת S0 לעומסי עבודה בייצור
  - **סטטוס:** מוכן לעיבוד מסמכים שהועלו

✅ **Bing Search API** (מוכן לקריאות API)
  - רמת S1 לחיפושים בזמן אמת
  - **סטטוס:** מוכן לשאילתות חיפוש באינטרנט

### מצבי פריסה

| מצב | קיבולת OpenAI | מופעי מכולות | רמת חיפוש | יתירות אחסון | מתאים ל- |
|------|-----------------|---------------------|-------------|-------------------|----------|
| **מינימלי** | 10K-20K TPM | 0-2 שכפולים | Basic | LRS (מקומי) | פיתוח/בדיקות, למידה, הוכחת היתכנות |
| **סטנדרטי** | 30K-60K TPM | 2-5 שכפולים | Standard | ZRS (אזורי) | ייצור, תעבורה מתונה (<10K משתמשים) |
| **פרימיום** | 80K-150K TPM | 5-10 שכפולים, יתירות אזורית | Premium | GRS (גיאוגרפי) | ארגוני, תעבורה גבוהה (>10K משתמשים), SLA של 99.99% |

**השפעת עלות:**
- **מינימלי → סטנדרטי:** עלייה של פי 4 בעלות (~$100-370 לחודש → ~$420-1,450 לחודש)
- **סטנדרטי → פרימיום:** עלייה של פי 3 בעלות (~$420-1,450 לחודש → ~$1,150-3,500 לחודש)
- **בחר על בסיס:** עומס צפוי, דרישות SLA, מגבלות תקציב

**תכנון קיבולת:**
- **TPM (Tokens Per Minute):** סך הכל בכל פריסות המודלים
- **מופעי מכולות:** טווח אוטו-סקיילינג (מינימום-מקסימום שכפולים)
- **רמת חיפוש:** משפיעה על ביצועי שאילתות ומגבלות גודל אינדקס

## 📋 דרישות מוקדמות

### כלים נדרשים
1. **Azure CLI** (גרסה 2.50.0 או גבוהה יותר)
   ```bash
   az --version  # בדוק גרסה
   az login      # אימות
   ```

2. **מנוי Azure פעיל** עם גישת Owner או Contributor
   ```bash
   az account show  # אמת את המנוי
   ```

### מכסות Azure נדרשות

לפני הפריסה, ודא שיש לך מכסות מספקות באזורים היעד:

```bash
# בדוק זמינות של Azure OpenAI באזור שלך
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# אמת את מכסת OpenAI (דוגמה עבור gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# בדוק את מכסת Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**מכסות מינימליות נדרשות:**
- **Azure OpenAI:** 3-4 פריסות מודלים באזורים שונים
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **הערה:** ייתכן ש-GPT-4o יהיה ברשימת המתנה באזורים מסוימים - בדוק [זמינות מודלים](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** סביבה מנוהלת + 2-10 מופעי מכולות
- **AI Search:** רמת Standard (Basic לא מספיקה לחיפוש וקטורי)
- **Cosmos DB:** תפוקה סטנדרטית מוקצבת

**אם המכסה אינה מספיקה:**
1. עבור לפורטל Azure → מכסות → בקש הגדלה
2. או השתמש ב-Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. שקול אזורים חלופיים עם זמינות

## 🚀 פריסה מהירה

### אפשרות 1: שימוש ב-Azure CLI

```bash
# לשכפל או להוריד את קבצי התבנית
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# להפוך את סקריפט הפריסה לביצוע
chmod +x deploy.sh

# לפרוס עם הגדרות ברירת מחדל
./deploy.sh -g myResourceGroup

# לפרוס לייצור עם תכונות פרימיום
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### אפשרות 2: שימוש בפורטל Azure

[![פרוס ל-Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### אפשרות 3: שימוש ישיר ב-Azure CLI

```bash
# צור קבוצת משאבים
az group create --name myResourceGroup --location eastus2

# פרוס תבנית
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ ציר זמן לפריסה

### למה לצפות

| שלב | משך זמן | מה קורה |
|-------|----------|--------------||
| **אימות תבנית** | 30-60 שניות | Azure מאמת את תחביר תבנית ARM והפרמטרים |
| **הקמת קבוצת משאבים** | 10-20 שניות | יוצר קבוצת משאבים (אם נדרש) |
| **פריסת OpenAI** | 5-8 דקות | יוצר 3-4 חשבונות OpenAI ומפריס מודלים |
| **Container Apps** | 3-5 דקות | יוצר סביבה ומפריס מכולות דמה |
| **חיפוש ואחסון** | 2-4 דקות | מקים שירות חיפוש AI וחשבונות אחסון |
| **Cosmos DB** | 2-3 דקות | יוצר מסד נתונים ומגדיר מכולות |
| **הגדרת ניטור** | 2-3 דקות | מקים Application Insights ו-Log Analytics |
| **קונפיגורציית RBAC** | 1-2 דקות | מגדיר זהויות מנוהלות והרשאות |
| **סה"כ פריסה** | **15-25 דקות** | תשתית מלאה מוכנה |

**לאחר הפריסה:**
- ✅ **תשתית מוכנה:** כל שירותי Azure נפרסו ופועלים
- ⏱️ **פיתוח אפליקציה:** 80-120 שעות (באחריותך)
- ⏱️ **קונפיגורציית אינדקס:** 15-30 דקות (דורש את הסכמה שלך)
- ⏱️ **העלאת נתונים:** משתנה לפי גודל מערך הנתונים
- ⏱️ **בדיקות ואימות:** 2-4 שעות

---

## ✅ אימות הצלחת פריסה

### שלב 1: בדוק הקמת משאבים (2 דקות)

```bash
# ודא שכל המשאבים נפרסו בהצלחה
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**מצופה:** טבלה ריקה (כל המשאבים מציגים סטטוס "Succeeded")

### שלב 2: אמת פריסות Azure OpenAI (3 דקות)

```bash
# רשום את כל חשבונות OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# בדוק פריסות מודלים עבור האזור הראשי
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**מצופה:** 
- 3-4 חשבונות OpenAI (אזורים ראשי, משני, שלישי, הערכה)
- 1-2 פריסות מודלים לכל חשבון (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### שלב 3: בדוק נקודות קצה של תשתית (5 דקות)

```bash
# קבל כתובות URL של אפליקציית מכולה
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# בדוק נקודת קצה של נתב (תמונה מציינת מקום תענה)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**מצופה:** 
- Container Apps מציגים סטטוס "Running"
- nginx דמה מגיב עם HTTP 200 או 404 (עדיין אין קוד אפליקציה)

### שלב 4: אמת גישת API של Azure OpenAI (3 דקות)

```bash
# קבל נקודת קצה ומפתח של OpenAI
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# בדוק פריסת GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**מצופה:** תגובת JSON עם השלמת צ'אט (מאשר ש-OpenAI פעיל)

### מה עובד ומה לא

**✅ עובד לאחר פריסה:**
- מודלים של Azure OpenAI נפרסו ומקבלים קריאות API
- שירות חיפוש AI פועל (ריק, ללא אינדקסים עדיין)
- Container Apps פועלים (תמונות דמה של nginx)
- חשבונות אחסון נגישים ומוכנים להעלאות
- Cosmos DB מוכן לפעולות נתונים
- Application Insights אוסף טלמטריה של תשתית
- Key Vault מוכן לאחסון סודות

**❌ לא עובד עדיין (דורש פיתוח):**
- נקודות קצה של סוכנים (אין קוד אפליקציה נפרס)
- פונקציונליות צ'אט (דורש ממשק קדמי + אחורי)
- שאילתות חיפוש (אין אינדקס חיפוש שנוצר עדיין)
- צינור עיבוד מסמכים (אין נתונים שהועלו)
- טלמטריה מותאמת אישית (דורש אינסטרומנטציה של אפליקציה)

**השלבים הבאים:** ראה [קונפיגורציה לאחר פריסה](../../../../examples/retail-multiagent-arm-template) לפיתוח ופריסת האפליקציה שלך

---

## ⚙️ אפשרויות קונפיגורציה

### פרמטרי תבנית

| פרמטר | סוג | ברירת מחדל | תיאור |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | קידומת לכל שמות המשאבים |
| `location` | string | מיקום קבוצת המשאבים | אזור פריסה ראשי |
| `secondaryLocation` | string | "westus2" | אזור משני לפריסה רב-אזורית |
| `tertiaryLocation` | string | "francecentral" | אזור למודל embeddings |
| `environmentName` | string | "dev" | ייעוד סביבה (dev/staging/prod) |
| `deploymentMode` | string | "standard" | קונפיגורציית פריסה (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | הפעלת פריסה רב-אזורית |
| `enableMonitoring` | bool | true | הפעלת Application Insights וניטור |
| `enableSecurity` | bool | true | הפעלת Key Vault ואבטחה משופרת |

### התאמת פרמטרים

ערוך `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ סקירה ארכיטקטונית

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 שימוש בסקריפט פריסה

הסקריפט `deploy.sh` מספק חוויית פריסה אינטראקטיבית:

```bash
# הצג עזרה
./deploy.sh --help

# פריסה בסיסית
./deploy.sh -g myResourceGroup

# פריסה מתקדמת עם הגדרות מותאמות אישית
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# פריסת פיתוח ללא ריבוי אזורים
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### תכונות הסקריפט

- ✅ **אימות דרישות מוקדמות** (Azure CLI, סטטוס התחברות, קבצי תבנית)
- ✅ **ניהול קבוצת משאבים** (יוצר אם לא קיים)
- ✅ **אימות תבנית** לפני פריסה
- ✅ **מעקב התקדמות** עם פלט צבעוני
- ✅ **תצוגת פלטי פריסה**
- ✅ **הנחיות לאחר פריסה**

## 📊 ניטור פריסה

### בדוק סטטוס פריסה

```bash
# רשימת פריסות
az deployment group list --resource-group myResourceGroup --output table

# קבלת פרטי פריסה
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# מעקב אחר התקדמות הפריסה
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### פלטי פריסה

לאחר פריסה מוצלחת, הפלטים הבאים זמינים:

- **כתובת URL קדמית**: נקודת קצה ציבורית לממשק האינטרנט
- **כתובת URL של ניתוב**: נקודת קצה API לנתב הסוכנים
- **נקודות קצה של OpenAI**: נקודות קצה של שירות OpenAI ראשי ומשני
- **שירות חיפוש**: נקודת קצה של שירות חיפוש AI של Azure
- **חשבון אחסון**: שם חשבון האחסון למסמכים
- **Key Vault**: שם ה-Key Vault (אם מופעל)
- **Application Insights**: שם שירות הניטור (אם מופעל)

## 🔧 לאחר פריסה: השלבים הבאים
> **📝 חשוב:** התשתית נפרסה, אך עליכם לפתח ולפרוס את קוד האפליקציה.

### שלב 1: פיתוח אפליקציות סוכנים (באחריותכם)

תבנית ARM יוצרת **אפליקציות קונטיינר ריקות** עם תמונות nginx לדוגמה. עליכם:

**פיתוח נדרש:**
1. **מימוש סוכנים** (30-40 שעות)
   - סוכן שירות לקוחות עם אינטגרציה ל-GPT-4o
   - סוכן מלאי עם אינטגרציה ל-GPT-4o-mini
   - לוגיקת ניתוב סוכנים

2. **פיתוח ממשק קדמי** (20-30 שעות)
   - ממשק משתמש לצ'אט (React/Vue/Angular)
   - פונקציונליות להעלאת קבצים
   - עיצוב ותצוגת תגובות

3. **שירותי צד שרת** (12-16 שעות)
   - FastAPI או Express router
   - Middleware לאימות
   - אינטגרציה של טלמטריה

**ראו:** [מדריך ארכיטקטורה](../retail-scenario.md) לדפוסי יישום ודוגמאות קוד מפורטות

### שלב 2: הגדרת אינדקס חיפוש AI (15-30 דקות)

צרו אינדקס חיפוש התואם למודל הנתונים שלכם:

```bash
# קבל פרטי שירות חיפוש
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# צור אינדקס עם הסכימה שלך (דוגמה)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**משאבים:**
- [עיצוב סכמת אינדקס חיפוש AI](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [הגדרת חיפוש וקטורי](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### שלב 3: העלאת הנתונים שלכם (זמן משתנה)

לאחר שיש לכם נתוני מוצרים ומסמכים:

```bash
# קבל פרטי חשבון אחסון
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# העלה את המסמכים שלך
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# דוגמה: העלאת קובץ יחיד
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### שלב 4: בנייה ופריסת האפליקציות שלכם (8-12 שעות)

לאחר שפיתחתם את קוד הסוכן:

```bash
# 1. צור רישום מכולות של Azure (אם נדרש)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. בנה ודחף תמונת סוכן נתב
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. בנה ודחף תמונת ממשק קדמי
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. עדכן אפליקציות מכולה עם התמונות שלך
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. הגדר משתני סביבה
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### שלב 5: בדיקת האפליקציה שלכם (2-4 שעות)

```bash
# קבל את כתובת ה-URL של היישום שלך
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# בדוק את נקודת הקצה של הסוכן (לאחר שהקוד שלך נפרס)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# בדוק את יומני היישום
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### משאבי יישום

**ארכיטקטורה ועיצוב:**
- 📖 [מדריך ארכיטקטורה מלא](../retail-scenario.md) - דפוסי יישום מפורטים
- 📖 [דפוסי עיצוב רב-סוכנים](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**דוגמאות קוד:**
- 🔗 [דוגמת צ'אט Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - דפוס RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - מסגרת סוכנים (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - תזמור סוכנים (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - שיחות רב-סוכנים

**הערכת מאמץ כולל:**
- פריסת תשתית: 15-25 דקות (✅ הושלם)
- פיתוח אפליקציה: 80-120 שעות (🔨 העבודה שלכם)
- בדיקות ואופטימיזציה: 15-25 שעות (🔨 העבודה שלכם)

## 🛠️ פתרון בעיות

### בעיות נפוצות

#### 1. חריגה ממכסת Azure OpenAI

```bash
# בדוק את השימוש הנוכחי במכסה
az cognitiveservices usage list --location eastus2

# בקש הגדלת מכסה
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. פריסת אפליקציות קונטיינר נכשלה

```bash
# בדוק יומני אפליקציית מכולה
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# הפעל מחדש את אפליקציית המכולה
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. אתחול שירות חיפוש

```bash
# בדוק את מצב שירות החיפוש
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# בדוק את קישוריות שירות החיפוש
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### אימות פריסה

```bash
# ודא שכל המשאבים נוצרו
az resource list \
  --resource-group myResourceGroup \
  --output table

# בדוק את מצב הבריאות של המשאבים
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 שיקולי אבטחה

### ניהול מפתחות
- כל הסודות נשמרים ב-Azure Key Vault (כאשר מופעל)
- אפליקציות קונטיינר משתמשות בזהות מנוהלת לאימות
- חשבונות אחסון מוגדרים עם ברירות מחדל מאובטחות (HTTPS בלבד, ללא גישה ציבורית לבלוב)

### אבטחת רשת
- אפליקציות קונטיינר משתמשות ברשת פנימית ככל האפשר
- שירות החיפוש מוגדר עם אפשרות נקודות קצה פרטיות
- Cosmos DB מוגדר עם ההרשאות המינימליות הנדרשות

### הגדרת RBAC
```bash
# הקצה תפקידים נחוצים לזהות מנוהלת
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 אופטימיזציית עלויות

### הערכות עלות (חודשיות, USD)

| מצב | OpenAI | אפליקציות קונטיינר | חיפוש | אחסון | סה"כ משוער |
|------|--------|--------------------|--------|---------|------------|
| מינימלי | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| סטנדרטי | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| פרימיום | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### מעקב עלויות

```bash
# הגדר התראות תקציב
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 עדכונים ותחזוקה

### עדכוני תבנית
- ניהול גרסאות של קבצי תבנית ARM
- בדיקת שינויים בסביבת פיתוח תחילה
- שימוש במצב פריסה אינקרמנטלי לעדכונים

### עדכוני משאבים
```bash
# עדכן עם פרמטרים חדשים
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### גיבוי ושחזור
- גיבוי אוטומטי של Cosmos DB מופעל
- מחיקה רכה של Key Vault מופעלת
- גרסאות אפליקציות קונטיינר נשמרות לצורך שחזור

## 📞 תמיכה

- **בעיות בתבנית**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **תמיכת Azure**: [פורטל תמיכת Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **קהילה**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ מוכנים לפרוס את פתרון הרב-סוכנים שלכם?**

התחילו עם: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**הצהרת אחריות**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. למידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. אנו לא נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->