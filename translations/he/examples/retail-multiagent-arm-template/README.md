<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T07:26:28+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "he"
}
-->
# פתרון רב-סוכנים לקמעונאות - פריסת תבנית ARM

**פרק 5: חבילת פריסה לייצור**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק קשור**: [פרק 5: פתרונות AI רב-סוכנים](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 מדריך תרחיש**: [יישום מלא](../retail-scenario.md)
- **🎯 פריסה מהירה**: [פריסה בלחיצה אחת](../../../../examples/retail-multiagent-arm-template)

תיקייה זו מכילה תבנית Azure Resource Manager (ARM) מלאה לפריסת פתרון תמיכת לקוחות רב-סוכנים לקמעונאות, המספקת תשתית כקוד לכל הארכיטקטורה.

## 🎯 מה נפרס

### תשתית מרכזית
- **שירותי Azure OpenAI** (רב-אזורי לזמינות גבוהה)
  - אזור ראשי: GPT-4o עבור סוכן לקוחות
  - אזור משני: GPT-4o-mini עבור סוכן מלאי  
  - אזור שלישי: מודל הטמעת טקסט
  - אזור הערכה: מודל GPT-4o grader
- **Azure AI Search** עם יכולות חיפוש וקטורי
- **Azure Storage Account** עם מכולות blob למסמכים והעלאות
- **סביבת Azure Container Apps** עם יכולת התאמה אוטומטית
- **Container Apps** עבור ניתוב סוכנים וממשק קדמי
- **Azure Cosmos DB** לאחסון היסטוריית שיחות
- **Azure Key Vault** לניהול סודות (אופציונלי)
- **Application Insights** ו-Log Analytics לניטור (אופציונלי)
- **Document Intelligence** לעיבוד מסמכים
- **Bing Search API** למידע בזמן אמת

### מצבי פריסה

| מצב | תיאור | שימוש | משאבים |
|------|-------------|----------|-----------|
| **מינימלי** | פריסה בסיסית מותאמת עלות | פיתוח, בדיקות | SKUs בסיסיים, אזור יחיד, קיבולת מופחתת |
| **סטנדרטי** | פריסה מאוזנת לעומסי עבודה בייצור | ייצור, קנה מידה בינוני | SKUs סטנדרטיים, רב-אזורי, קיבולת סטנדרטית |
| **פרימיום** | פריסה בעלת ביצועים גבוהים ברמת ארגון | ארגון, קנה מידה גבוה | SKUs פרימיום, רב-אזורי, קיבולת גבוהה |

## 📋 דרישות מקדימות

1. **Azure CLI** מותקן ומוגדר
2. **מנוי Azure פעיל** עם מכסות מספקות
3. **הרשאות מתאימות** ליצירת משאבים במנוי היעד
4. **מכסות משאבים** עבור:
   - Azure OpenAI (בדוק זמינות אזורית)
   - Container Apps (משתנה לפי אזור)
   - AI Search (מומלץ Tier סטנדרטי או גבוה יותר)

## 🚀 פריסה מהירה

### אפשרות 1: שימוש ב-Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### אפשרות 2: שימוש בפורטל Azure

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### אפשרות 3: שימוש ישיר ב-Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ אפשרויות תצורה

### פרמטרים של תבנית

| פרמטר | סוג | ברירת מחדל | תיאור |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | קידומת לכל שמות המשאבים |
| `location` | string | מיקום קבוצת המשאבים | אזור הפריסה הראשי |
| `secondaryLocation` | string | "westus2" | אזור משני לפריסה רב-אזורית |
| `tertiaryLocation` | string | "francecentral" | אזור למודל הטמעת טקסט |
| `environmentName` | string | "dev" | ייעוד סביבתי (dev/staging/prod) |
| `deploymentMode` | string | "standard" | תצורת פריסה (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | הפעלת פריסה רב-אזורית |
| `enableMonitoring` | bool | true | הפעלת Application Insights ורישום |
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

## 🏗️ סקירת ארכיטקטורה

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

## 📖 שימוש בתסריט פריסה

תסריט `deploy.sh` מספק חוויית פריסה אינטראקטיבית:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### תכונות התסריט

- ✅ **אימות דרישות מקדימות** (Azure CLI, סטטוס התחברות, קבצי תבנית)
- ✅ **ניהול קבוצת משאבים** (יוצר אם לא קיימת)
- ✅ **אימות תבנית** לפני פריסה
- ✅ **מעקב אחר התקדמות** עם פלט צבעוני
- ✅ **הצגת תוצאות פריסה**
- ✅ **הנחיות לאחר פריסה**

## 📊 ניטור פריסה

### בדיקת סטטוס פריסה

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### תוצאות פריסה

לאחר פריסה מוצלחת, התוצאות הבאות זמינות:

- **כתובת URL של ממשק קדמי**: נקודת קצה ציבורית לממשק האינטרנט
- **כתובת URL של ניתוב סוכנים**: נקודת קצה API לניתוב סוכנים
- **נקודות קצה של OpenAI**: שירותי OpenAI ראשיים ומשניים
- **שירות חיפוש**: נקודת קצה של שירות Azure AI Search
- **חשבון אחסון**: שם חשבון האחסון למסמכים
- **Key Vault**: שם ה-Key Vault (אם הופעל)
- **Application Insights**: שם שירות הניטור (אם הופעל)

## 🔧 תצורה לאחר פריסה

### 1. הגדר אינדקס חיפוש

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. העלה נתונים ראשוניים

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. בדוק נקודות קצה של סוכנים

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. הגדר Container Apps

תבנית ARM מפרסת תמונות מיכל זמניות. כדי לפרוס קוד סוכנים בפועל:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ פתרון בעיות

### בעיות נפוצות

#### 1. מכסת Azure OpenAI חורגת

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. פריסת Container Apps נכשלה

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. אתחול שירות חיפוש

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### אימות פריסה

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 שיקולי אבטחה

### ניהול מפתחות
- כל הסודות מאוחסנים ב-Azure Key Vault (אם הופעל)
- אפליקציות מיכל משתמשות בזהות מנוהלת לאימות
- חשבונות אחסון מוגדרים עם ברירות מחדל מאובטחות (HTTPS בלבד, ללא גישה ציבורית ל-blob)

### אבטחת רשת
- אפליקציות מיכל משתמשות ברשת פנימית ככל האפשר
- שירות חיפוש מוגדר עם אפשרות נקודות קצה פרטיות
- Cosmos DB מוגדר עם הרשאות מינימליות הכרחיות

### תצורת RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 אופטימיזציית עלויות

### הערכות עלות (חודשיות, USD)

| מצב | OpenAI | Container Apps | חיפוש | אחסון | סה"כ משוער |
|------|--------|----------------|--------|---------|------------|
| מינימלי | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| סטנדרטי | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| פרימיום | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### ניטור עלויות

```bash
# Set up budget alerts
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
- נהל גרסאות של קבצי תבנית ARM
- בדוק שינויים בסביבת פיתוח תחילה
- השתמש במצב פריסה אינקרמנטלי לעדכונים

### עדכוני משאבים
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### גיבוי ושחזור
- גיבוי אוטומטי של Cosmos DB מופעל
- מחיקה רכה של Key Vault מופעלת
- גרסאות אפליקציות מיכל נשמרות לצורך שחזור

## 📞 תמיכה

- **בעיות תבנית**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **תמיכת Azure**: [פורטל תמיכת Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **קהילה**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ מוכן לפרוס את פתרון הרב-סוכנים שלך?**

התחל עם: `./deploy.sh -g myResourceGroup`

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.