# אינטגרציית Microsoft Foundry עם AZD

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח מכוון AI
- **⬅️ פרק קודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ ההבא**: [סוכני AI](agents.md)
- **🚀 הפרק הבא**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)

## סקירה כללית

מדריך זה מדגים כיצד לשלב את שירותי Microsoft Foundry עם Azure Developer CLI (AZD) לפריסות אפליקציות AI חלקות. Microsoft Foundry מספקת פלטפורמה מקיפה לבניית, פריסה וניהול אפליקציות AI, בעוד ש-AZD מפשט את התהליך של התשתית והפריסה.

## מהי Microsoft Foundry?

Microsoft Foundry היא פלטפורמה מאוחדת של מיקרוסופט לפיתוח AI הכוללת:

- **קטלוג מודלים**: גישה למודלים מתקדמים של AI
- **Prompt Flow**: מעצב חזותי של זרמי עבודה ל-AI
- **פורטל Microsoft Foundry**: סביבת פיתוח משולבת לאפליקציות AI
- **אפשרויות פריסה**: מגוון אפשרויות אירוח והרחבה
- **בטיחות ואבטחה**: תכונות AI אחראיות מובנות

## AZD + Microsoft Foundry: טובים יחד

| תכונה | Microsoft Foundry | יתרון האינטגרציה של AZD |
|---------|-----------------|------------------------|
| **פריסת מודלים** | פריסה ידנית בפורטל | פריסות אוטומטיות וחוזרות |
| **תשתית** | קונפיגורציית פרויקט ומשאבים | התחלה מ-`azure.yaml`; הוצא Bicep או Terraform במידת הצורך |
| **ניהול סביבה** | מיקוד בסביבה יחידה | סביבות מרובות (פיתוח/שלב ביניים/ייצור) |
| **אינטגרציית CI/CD** | שירותי פריסה והערכה | שימוש חוזר בקונפיגורציה ב-GitHub Actions או Azure DevOps |
| **ניהול עלויות** | מעקב בסיסי | אופטימיזציה של עלויות לכל סביבה |

## דרישות מוקדמות

- מנוי Azure עם הרשאות מתאימות
- Azure Developer CLI בגרסה 1.37.0 או חדשה יותר עבור זרימת העבודה GA של Foundry
- גישה לשירותי מודלים של Microsoft Foundry
- היכרות בסיסית עם Microsoft Foundry

> **עדכון Foundry GA (09-11-2026):** חבילת התוסף `microsoft.foundry` הגיעה לגרסת 1.0 וזמינות כללית ב-[5 בנובמבר 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). ההדרכה להלן עוקבת אחרי ההכרזה והקישור ל-Microsoft Learn ל'התחלה מהירה'. זוהי סקירת תיעוד, לא אימות פריסה חיה. תכונות מוקדמות אופציונליות ותוספים ששוחררו עצמאית שומרים על סטטוס שחרור משלהם.

**תוצאות למידה:** התקנת חבילת GA, סקירת `azure.yaml` של סוכן, השוואת תגובות מקומיות מול פרוסות, והסבר על הערכה, CI/CD וגבולות ניקוי. לפריסת סוכן שלב-אחר-שלב, עבור להדרכת [hosted-agent](#hosted-agent-walkthrough-ga). מקטעי המשאבים שלמטה מכסים דגם אינטגרציה נוסף.

## דפוסי אינטגרציה מרכזיים

**טווח הדוגמאות:** Bicep למטה מכיל מקטעי משאבים לדוגמה, לא תבנית פריסה מלאה. התבנית המכילה חייבת להגדיר שמות, `location`, משאבים משוערים, זהויות, פלטים ואירוח אפליקציה. השתמש בדוגמה מקושרת כנקודת התחלה להרצה. דוגמאות ב-Bash דורשות אימות Azure CLI בנפרד מ-`azd auth login`.

### דפוס 1: אינטגרציה עם מודלי Microsoft Foundry

**מקרה שימוש**: פריסת אפליקציות שיחה עם מודלי Azure OpenAI ב-Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**תשתית (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

למזמין דרושה זהות מנוהלת מצורפת ו-`Cognitive Services OpenAI User` בהיקף החשבון; ניתוק מפתחות אינו מקנה גישה. אמת זמינות אזור/מודל/SKU ומכסה לפני פריסה.

### דפוס 2: AI Search + אינטגרציית RAG

**מקרה שימוש**: פריסת אפליקציות יצירתיות בהגדלת שליפה (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

אין משאב `Microsoft.Search/searchServices/dataConnections` ARM לאינטגרציה זו. קונפיגור מדד חיפוש, מקור נתונים, אינדקסר/קבוצת מיומנויות או וקטורייזר דרך API הנתונים הנתמכים של Search. אם Search מפעיל מודל אמבדינג, הפעל את הזהות המנוהלת שלו, הענק את תפקיד המודל הרלוונטי, וקונפג את מיומנות האמבדינג/וקטורייזר שלו. ראה [וקטוריזציה משולבת](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### דפוס 3: אינטגרציית בינה למסמכים

**מקרה שימוש**: תהליכי עיבוד וניתוח מסמכים

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 דפוסי קונפיגורציה

### הגדרת משתני סביבה

למעט הגדרות AZD מתועדות כ-`AZURE_LOCATION`, אלה הם **שמות קלט תבנית מותאמת אישית**. הם אינם משפיעים אלא אם כן התבנית/אפליקציה צורכת אותם דרך פרמטרים ומיפויי סביבות מארחות. עבור `azure-search-openai-demo`, השתמש בשמות הפועל שלהם כמו `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` ו-`AZURE_SEARCH_SERVICE_SKU` במקום. קיבולת מודל אינה SKU חשבון.

**קונפיגורציה לייצור:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**קונפיגורציה לפיתוח:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### קונפיגורציה מאובטחת עם Key Vault

העדף Entra ID עם אימות מקומי של מפתחות מושבת. הבאה היא רק **חלופה ישנה לאימות מפתחות** לאפליקציות שדורשות מפתחות: היא דורשת חשבון עם אימות מפתחות מופעל, זהות האפליקציה צמודה למארחה, וגישה/רשת Key Vault פעילה. אל תשלב אחזור מפתחות עם `disableLocalAuth: true` ואל תצפה לקריאות מבוססות מפתחות לפעול.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## זרימות עבודה לפריסה

### תוספי AZD ל-Foundry

עבור זרימת העבודה GA, התקן את חבילת `microsoft.foundry` במקום להרכיב את התוספים המרכזיים אחד אחד:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

החבילה מתקינה סוכנים, חיבורים, מבקר, פרויקטים, שגרות, מיומנויות וארגזי כלים. היא אינה מוסיפה קבוצת פקודות `microsoft.foundry`. הערכות, מערכי נתונים, כיוונון עדין ומודלים מותאמים מותקנים בנפרד לפי הצורך. ראה את [הפניה לאריזת תוספים](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### הדרכת hosted-agent (GA)

**סוכן מנוהל** מריץ את קוד הסוכן שלך על חישוב מנוהל ב-Foundry. התרגול הזה משתמש בדוגמת API תגובות ממסגרת הפייתון הבסיסית upstream, לא מקטעי SDK של שירות סוכן הקלאסי בשיעורים אחרים.

#### 1. הכנה והפעלה

השתמש בתיקיה ריקה מחוץ לבדיקה הזו של הקורס. התקן Python 3.13 או חדש יותר וגרסת [uv עדכנית](https://docs.astral.sh/uv/getting-started/installation/). התקנות uv עצמאיות יכולות להשתמש ב-`uv self update`. בדוק את [הרשאות hosted-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), זמינות מודל, ומכסה במנוי ובאזור שלך לפני אספקה. משאבי Azure וקריאות מקומיות למודל מחייבות.

השלם התקנה של `azd auth login` והחבילה מעל. דוגמת קוד מקומית משתמשת ב-`DefaultAzureCredential`; אם משתמש ב-אישורי Azure CLI, היכנס עם `az login` על אותו חשבון ו-tenant כמו AZD. כניסה ב-AZD בלבד אינה כניסת Azure CLI.

הרץ פקודה בשורה אחת זו ב-Bash או PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

בחר פרויקט Foundry חדש או קיים והמנוי והאזור המתוכננים. לשימוש חוזר בפריסת מודל, הוסף `--model-deployment <existing-deployment-name>` לפקודת ההפעלה **לפני ההרצה**, ובחר בפרויקט הקיים. הישאר בתיקיית הפרויקט עם `azure.yaml` שנוצרו לפקודות הנותרות.

#### 2. סקירת הגדרת הפריסה

פתח את `azure.yaml` ומצא הגדרות אלו ב-[דוגמת upstream](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| הגדרה | מה לבדוק |
|---------|---------------|
| `host: azure.ai.project` ו-`deployments` | פרויקט Foundry המיועד ושם המודל, גרסה, SKU פריסה וקיבולת |
| `host: azure.ai.agent` ו-`project` | הסוכן המאוחסן ותיקיית המקור שלו |
| `codeConfiguration` | סביבת ריצה בפייתון ונקודת כניסה; הדוגמה מתמשכת משתמשת ב-`python_3_13` ו-`main.py` |
| `uses` | תלות בשירות פרויקט Foundry |
| `container.resources` | הקצאת CPU וזיכרון, אף שהקוד מורץ מרחוק |
| `env` | מיפוי פריסת מודל ו-`PYTHONNOUSERSITE: "1"` להשבתת טעינת חבילות משתמש באתר |
| `infra.provider` | `microsoft.foundry`, המסנתז את התשתית הנדרשת |

שים את הקוד וה-`azure.yaml` הסוכן שנסקרו יחד. אין צורך בתשתית כתובה ידנית להתחלה; כשתזדקק לקבצי פריסה ניתנים לעריכה, עקוב אחרי [הוצאת תשתית](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) עבור Bicep או Terraform והמשך להשתמש ב-`azd provision`. אל תתעד הרשאות או מצב סביבה `.azure/`.

#### 3. ספק ובדוק מקומית

```bash
azd provision
azd ai agent run
```

אספקה יכולה ליצור פריסות מודל חסרות **אפילו בפרויקט שהוחזר לשימוש**. סקור את הפקודות למודל ובחר סוג פריסה זמין מקוון כגון Global Standard או Data Zone Standard; מכסה ותמיכה אזורית משתנות.

הריצה המקומית מכינה תלות ופותחת את **Agent Inspector**, שבו אפשר לבדוק בקשות, תגובות, ופעילות כלי/מודל. השאר אותו פתוח ופתח טרמינל שני באותה תיקיית פרויקט:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**נקודת ביקורת:** ודא שאתה מקבל תגובה רלוונטית ויכול לבדוק את הפעילות המקומית המשויכת. ההרצה המקומית עדיין קוראת לפריסת המודל שלך באז'ור; זו לא בדיקה לא מקוונת או חינמית. השתמש בפקודות סינתטיות והימנע מחשיפת סודות או מידע רגיש בתוצר המבקר.

#### 4. פרוס והשווה

עצור את הריצה המקומית עם Ctrl+C כשסיימת. לפני קריאה מרחוק, קונפג או אמת את [חיבור Application Insights וגישת קריאת עקבות](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) בפרויקט.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

במצב פריסת קוד, AZD מעלה מקור לבנייה מרחוק ב-Foundry; אין צורך בבנייה מקומית של מכולה בשביל נתיב זה. פלט הפריסה מספק קישורים למגרש ומשטח קצה. אמת תגובה מהסוכן הפרוס ועקבות הענן שלו; אירועי מבקר מקומי לבדם אינם מוכיחים שעבודת עקבות ענן פעילה.

לשינויים הבאים, סקור את קונפיגורציית ה-hosted-agent הנתמכת עם `azd deploy --preview`. זרם לוגים עם `azd ai agent monitor --follow`, או אובחן בעיות התקנה וגישה עם `azd ai agent doctor`. תצוגה מקדימה של פריסה אינה סקירה מלאה של תשתית או אבטחה.

#### 5. הוסף בדיקת איכות שניתן לחזור עליה

התקן את תוסף ההערכות ששוחרר בנפרד, ואז הפק טיוטות נכסי בדיקה:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

תאר את התנהגות הסוכן המיועדת ובחר **מערך נתונים ושופט**, ואז **הפעל**. סקור וערוך את המקרים שנוצרו ואת סולם הציונים, כולל מקרה שאלה לא נתמך, לפני קונפיגור ההערכה:

```bash
azd ai eval init --name quality
```

בחר את מערך הנתונים והסולם שנסקרו ואמת את פריסת מודל השופט. בדוק את `evals/azure.eval.yaml` והפניה לשירות ההערכה ב-`azure.yaml`, ואז רשם את הנכסים והפעל:

```bash
azd up
azd ai eval run start --eval quality
```

בדוק ציונים ומקרים שנכשלו או נתקלו בשגיאות; הערכה שהושלמה אינה בהכרח מעבר איכות. יצירה וציונים גם מחייבים מודל. חתום קונפיגורציה לא סודית, מערכי נתונים וסולמות כדי שחברי צוות יוכלו להשוות שינויים. `azd ai agent optimize` יכול להשתמש שוב בהערכה תואמת כבכורת בסיס, אבל סקור מועמדים לפני פריסת אחד מפורשות. ראה [שערי איכות והגירה](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) לפרויקטים ישנים ו-CI.

#### 6. השתמש שוב בזרימת העבודה ב-CI/CD

לאחר `azd up` מוצלח, הפעל `azd pipeline config` וסקור את זרימת העבודה שנוצרה ב-GitHub Actions או Azure DevOps. התקן את `microsoft.foundry` על הרץ, ו-`azure.ai.evaluations` אם מריץ הערכות. שמור את הגדרות הבדיקה, הכניסה והסביבה שנוצרו; ההתקנה בלבד אינה מאמת את הצינור.

השתמש בסביבת AZD נפרדת לכל שלב, הענק לזהות הצינור את ההרשאות הדרושות למשאבים ול-Foundry, והחזק את האישורים בסודות הצינור או השתמש בזהות מאוחדת. בצע קומיט לנכסי הערכה ואמת שהזהות יכולה לגשת לסטים/מוערכים שהוזכרו. ראה את [דוגמת צינור הקורס](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) ואת [המדריך Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. נקה בכוונה

עבור **פרויקט חדש שנוצר על ידי סביבה זו**, סקור את המשאבים הרשומים על ידי `azd down` לפני האישור: הוא מוחק את קבוצת המשאבים ואת כל התוכן שבה.

עבור **פרויקט חוזר**, `azd down` משאיר את הפרויקט, הסוכן המתארח ומשאבים אחרים במקומם. הסר רק משאבים בלתי רצויים שבבעלותך באמצעות [הנחיות ניקוי התחלה מהירה](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); אל תמחק קבוצת משאבים משותפת כדי לנקות תרגיל אחד.

**בדיקת סיום:** הסבר אילו הגדרות שולטות בהתנהגות המקומית והעננית, הצג תגובות מקומיות ופרוסות, סקור תוצאת הערכה, וזיהה אילו משאבים נשארים לאחר הניקוי.

### אופציונלי: בנה מסגרת עם Microsoft Foundry Skill

התקן את [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) למארח סוכן הקוד שלך, ואז פתח תיקייה ריקה נפרדת. בקש ממנו לבנות דוגמת API בסיסית של Python Agent Framework Responses במצב פריסת קוד, הסבר את ה-`azure.yaml` שנוצר, והצע את המנוי, האזור, הפרויקט, ופריסת המודל. דרוש אישור **לפני יצירת משאבי Azure**, בקש בדיקה מקומית, והפסק לפני הפריסה. סקור את הפלט שלו והמשך עם שלבי הפריסה לעיל רק כשאתה מוכן.

עבור פרויקטים קיימים, `--template`/`-t` מחליף את איות ה-`--manifest`/`-m` המיושן; שינוי הדגל אינו מגרש את המניפסטים הישנים או את תצורת הסוכן המקוננת. ראה את [הפנייה ל-AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### פריסה בפקודה יחידה

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### פריסות ספציפיות לסביבה

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## ניטור ותצפית

### אינטגרציה עם Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

זה מספק משאב Insights, לא הכללת מדידות טלמטריה. לאחר שהיישום שלך מפיק מרחבי קריאות מודל יוצאות, הרץ את השאילתה הממחישה הזו ב-Application Insights Logs (התאם את המסנן לשמות המרחב האמיתיים שלך):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### ניטור עלויות

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

השתמש בנמען אמיתי ואמת הרשאות בתחום החיוב. תקציב שולח התראות; הוא אינו כובע הוצאה.

## 🔐 שיטות עבודה מומלצות לאבטחה

### תצורת זהות מנוהלת

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### אבטחת רשת

קטע קצה זה זקוק גם לאזור/קבוצה פרטית ב-DNS, קישורי VNet, חיבור VNet ליישום ומדיניות גישה ציבורית מפורשת. יצירת נקודת קצה פרטית בלבד אינה מבטלת גישה ציבורית.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
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

## אופטימיזציה לביצועים

### אסטרטגיות קאשינג

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache for Redis Basic/Standard/Premium נמצאת [במסלול פרישה](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); השתמש ב-Azure Managed Redis לפריסות חדשות ועקוב אחר הנחיות התבנית/האימות הנוכחיות שלה. טווח תשובות AI במטמון לפי הרשאה, מודל/הוראות וגרסת נתונים, עם תוקף; אל תשתף תשובות פרטיות רק עם טקסט השאילתה.

### תצורת סקיילינג אוטומטי

**משאב חלקי:** שלב את הגדרות הסקייל/הכניסה האלה לתוך Container App מלא עם סביבה מנוהלת, תמונת מכולה ומגבלות משאבים. שכפולים יותר לא מגדילים מכסת מודל.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## פתירת בעיות נפוצות

### בעיה 1: חריגה ממכסת OpenAI

**תסמינים:**
- הפריסה נכשלת עם שגיאות מכסה
- שגיאות 429 ביומני היישום

**פתרונות:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

משתנה הקיבולת שלמעלה חל רק על תבנית מותאמת אישית המחוברת לצרוך אותה. לדוגמת RAG, השתמש ב-`AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. אל תשנה את `AZURE_LOCATION` כדי להעביר משאבים קיימים; צור סביבה נפרדת לאזור חדש ותכנן הגירה/ניקוי.

### בעיה 2: שגיאות אימות

**תסמינים:**
- שגיאות 401/403 בקריאה לשירותי AI
- הודעות "גישה נדחתה"

**פתרונות:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### בעיה 3: בעיות בפריסת מודל

**תסמינים:**
- מודלים לא זמינים בפריסה
- גרסאות מודל ספציפיות נכשלות

**פתרונות:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## תבניות לדוגמה

אלה חלופות, לא פקודות עוקבות. התחל כל אחת בתיקיה ריקה נפרדת. היעד המפורש `.` שומר את האתחול בתיקיה הנוכחית שלך; אחרת AZD הנוכחי עשוי ליצור תיקיה-ילד בשם התבנית בלי לשנות את ספריית העבודה של ה-shell שלך.

### יישום שיחת RAG (פיתון)

**מאגר**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**תיאור**: יישום שיחת RAG לדוגמה לשאלות בנוגע למסמכים שלך, עם אחזור Azure AI Search. עיין במודלים הנתמכים בדוגמה הנוכחית, תכונות אופציונליות, הנחיות עלות והקשחת ייצור לפני השימוש; פריסת דוגמה אינה הופכת יישום למוכן לייצור.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### יישום שיחת RAG (.NET)

**מאגר**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**תיאור**: מקבילה ב-.NET/C# לדוגמת שיחת RAG בפיתון. בנוי עם ASP.NET Core Minimal API ו- Blazor WebAssembly בקצה הקליינט. כולל שיחת קול, תמיכה ב-GPT-4o-mini vision, ולקוח משולב .NET MAUI Blazor למחשב שולחני/נייד.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### יישום שיחת RAG (ג'אווה)

**מאגר**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**תיאור**: גרסת Java לדוגמת שיחת RAG המשתמשת ב-Langchain4J לתזמור AI. תומך בארכיטקטורת מיקרו-שירותים מונעת אירועים, אסטרטגיות חיפוש מרובות (טקסט, וקטור, היברידי), העלאת מסמכים עם Azure Document Intelligence, ופריסה ב-Azure Container Apps או Azure Kubernetes Service.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### עוזר קמעונאי ארגוני עם Microsoft Foundry

**מאגר**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**שירותים**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**תיאור**: עוזר RAG קמעונאי מקצה לקצה המשתמש ב-Microsoft Foundry ו-Prompty. чатבוט קמעונאי חיצוני של Contoso שמבוסס על קטלוג המוצרים ונתוני הזמנות הלקוחות. מציג את זרימת העבודה המלאה של GenAIOps — אבטיפוס עם Prompty, הערכה עם שופטים בעזרת AI, ופריסה דרך AZD ל-Container Apps.

**התחלה מהירה**:
```bash
azd init --template contoso-chat .
azd up
```

### יישום כתיבה יצירתית רב-סוכן

**מאגר**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**שירותים**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**תיאור**: דוגמת רב-סוכן המדגימה תזמור סוכני AI עם Prompty. משתמש בסוכן מחקר (Bing Grounding ב-Azure AI Agent Service), סוכן מוצר (Azure AI Search), סוכן כותב וסוכן עורך לשיתוף פעולה ביצירת מאמרים מתועדים היטב. כולל CI/CD עם הערכה ב-GitHub Actions.

**התחלה מהירה**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### שיחת RAG ללא שרת (JavaScript/TypeScript)

**מאגר**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**שירותים**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**תיאור**: צ'אטבוט RAG ללא שרת מלא המשתמש ב-LangChain.js עם Azure Functions ל-API ו-Azure Static Web Apps לאירוח. משתמש ב-Azure Cosmos DB כאחסון וקטורי ומאגר היסטוריית שיחות. תומך בפיתוח מקומי עם Ollama לבדיקות ללא עלות.

**התחלה מהירה**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### מואץ שיחה עם הנתונים שלך

**מאגר**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**שירותים**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search עם Cosmos DB, או PostgreSQL עם pgvector

**תיאור**: מואץ שיחה מבוסס מסמכים עם ציטוטים. הדוגמה הנוכחית מארחת React בקצה הקליינט, FastAPI בשרת ועובד Functions לבליעה ב-Container Apps; אפשרויות התזמור הן Agent Framework ו-LangGraph. אפשרויות מאגר נתונים/אחזור נבחרות בפריסה. זה נקודת התחלה, לא מערכת ייצור מוכנה; אל תניח שגרסאות ישנות יותר של App Service, Semantic Kernel או Prompt Flow מתארות את המצב הנוכחי.

**התחלה מהירה**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### סוכני נסיעות AI — תזמור MCP רב-סוכן

**מאגר**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**שירותים**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**תיאור**: יישום ייחוס לתזמור AI רב-סוכן המשתמש בשלוש מסגרות (LangChain.js, LlamaIndex.TS, ו-Microsoft Agent Framework). כולל שרתי MCP (Model Context Protocol) בארבע שפות שפרוסים כ-Container Apps ללא שרת עם ניטור OpenTelemetry.

**התחלה מהירה**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **עיין בתבניות נוספות**: בקר ב-[גלריית תבניות AI מדהימות AZD](https://azure.github.io/awesome-azd/?tags=ai) לקבלת תבניות זמינות כרגע בשפות ותרחישים שונים. כל דוגמה מקושרת היא מאגר חיצוני, לא דוגמה מקומית של הקורס; קרא את הדרישות וההנחיות העדכניות לפני פריסה.

## השלבים הבאים

1. **נסה את הדוגמאות**: התחל עם תבנית מוכנה שמתאימה למקרה השימוש שלך
2. **התאם לצרכים שלך**: שנה את התשתית וקוד היישום
3. **הוסף ניטור**: יישם תצפית מקיפה
4. **אופטימיזציה לעלויות**: כוונן תצורות בהתאם לתקציב שלך
5. **אבטח את הפריסה שלך**: יישם דפוסי אבטחה ארגוניים
6. **הרחב לייצור**: הוסף תכונות רב-אזוריות וגבוהות זמינות

## 🎯 תרגילים מעשיים

### תרגיל 1: פריסת יישום שיחת Microsoft Foundry Models (30 דקות)
**מטרה**: פרוס ובחן יישום ייחוס שיחת AI

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**קריטריוני הצלחה:**
- [ ] הפריסה מסתיימת ללא שגיאות מכסה
- [ ] ניתן לגשת לממשק השיחה בדפדפן
- [ ] ניתן לשאול שאלות ולקבל תשובות מונעות AI
- [ ] Application Insights מציג נתוני טלמטריה
- [ ] משאבים נוקו בהצלחה

**עלות:** עיין במדריך עלויות נוכחי וב-SKU הנבחרים לפני הפריסה. החיוב ממשיך עד למחיקת המשאבים; אין הערכה קבועה ל-30 דקות לכול תצורה.

### תרגיל 2: תצורת פריסה מרובת מודלים (45 דקות)
**מטרה**: פרוס מודלים מרובים עם תצורות שונות

**נקודת התחלה:** חשבון Azure OpenAI קיים ותבנית מודול resource-group ב-AZD שיכולה לקרוא לקובץ זה. צור את `infra/ai-models.bicep` עם התוכן הבא בעורך שלך. היא לא נפרסת אוטומטית רק כי היא תחת `infra/`.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

מהמודול בתחום resource-group שמחזיק בחשבון, הוסף קריאת מודול (התאם את שם הסמל לחשבון שלך):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

אל תכריז על אותם הפריסות בשני המודולים. אם נקודת הכניסה של AZD היא בהיקף מינוי, הפעל זאת מתוך מודול ילד במסגרת resource-group והשתנה את הנתיב היחסי. הרכב את מודול המכיל עם `az bicep build --file <path-to-containing-module>`, ואז:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**קריטריוני הצלחה:**
- [ ] מספר מודלים הופרחו בהצלחה
- [ ] הוגדרו הגדרות קיבולת שונות
- [ ] מודלים נגישים דרך API
- [ ] ניתן לקרוא לשני המודלים מהיישום

### תרגיל 3: יישום ניטור עלויות (20 דקות)
**מטרה**: הגדרת התראות תקציב ומעקב עלויות

**נקודת התחלה:** דפוס התקציב למעלה ומודול תשתית בתחום resource-group. הוסף משאב זה עם העורך שלך; העבר את `budgetStartDate` מהמיפוי הפרמטרי שלך (אל תכפיל אם כבר הוכרז). החלף את הנמען ואמת שיש לך הרשאת כתיבת תקציב.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

צפוי: התגובה כוללת `amount: 200`, שתי הספים, ונמען שלך. בדוק את ניהול העלויות בפורטל עבור חיובים בפועל; נתוני עלות מאוחרים וההתראה לא חייבת להופיע במהלך תרגיל קצר.

**קריטריוני הצלחה:**
- [ ] זיהוי תקציב נוצר ב-Azure
- [ ] התראות דואר אלקטרוני מוגדרות
- [ ] ניתן לצפות בנתוני עלויות בפורטל Azure
- [ ] ספי תקציב מוגדרים באופן מתאים

## 💡 שאלות נפוצות

<details>
<summary><strong>כיצד להקטין עלויות Microsoft Foundry Models במהלך פיתוח?</strong></summary>

1. **בדוק תמחור**: אין קצבת 50,000 טוקנים חינם חודשית כללית למודלים של Azure OpenAI
2. **גודל נכון לקיבולת**: קיבולת `10` בדרך כלל מייצגת 10,000 TPM עבור מודלי טקסט סטנדרטיים אלו, לא 10 TPM. הפחתת מגבלת שיעור לא מפחיתה מחירי טוקן ליחידה
3. **השתמש ב-azd down**: מחק משאבים שאינם בשימוש בעת לא בפיתוח פעיל (זו לא שחרור משאבים)
4. **מטמון תשובות**: הטמע מטמון Redis לשאילתות חוזרות
5. **השתמש בהנדסת פרומפט**: צמצם שימוש בטוקנים עם פרומפטים יעילים

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>מה ההבדל בין Microsoft Foundry Models ל-OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- אבטחה ועמידה ארגונית
- אינטגרציה לרשת פרטית
- הבטחות SLA
- אימות זהות מנוהלת
- מכסות גבוהות יותר זמינות

**OpenAI API**: ספק/API נפרד עם זמינות מודלים, תמחור, אימות ואפשרויות חיבור ארגוניות נפרדות. השווה הצעות נוכחיות ולא הנח שזו רק רשת ציבורית או שכל המודלים נשלחים תחילה דרכה.

בחר על פי דרישות הארגון שלך; דוגמאות לזהות מנוהלת וקישור פרטי של Azure במדריך זה חלות על שירותי Azure מאוחסנים, לא על כל מודל/ספק בקטלוג Foundry.
</details>

<details>
<summary><strong>כיצד להתמודד עם שגיאות חריגה ממכסת Microsoft Foundry Models?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>האם ניתן להשתמש בנתונים שלי עם Microsoft Foundry Models?</strong></summary>

כן! השתמש ב-**Azure AI Search** עבור RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

ראה את התבנית [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>כיצד אבטיח נקודות קצה של מודלים בינה מלאכותית?</strong></summary>

**הנחיות מיטביות**:
1. השתמשו בזהות מנוהלת (ללא מפתחות API)
2. הפעל נקודות קצה פרטיות
3. הגדירו קבוצות אבטחת רשת
4. יישמו הגבלת קצב
5. השתמשו ב-Azure Key Vault עבור סודות

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## קהילה ותמיכה

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [בעיות ודיונים](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [תיעוד רשמי](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [מיומנות Microsoft Foundry ב-skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - התקן מיומנויות סוכן של Azure + Foundry בעורך שלך עם `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח מובנה בינה מלאכותית
- **⬅️ פרק קודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [סוכני בינה מלאכותית](agents.md)
- **🚀 פרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

**צריך עזרה?** הצטרף לדיוני הקהילה שלנו או פתח בעיה במאגר הקוד. קהילת Azure AI + AZD כאן כדי לעזור לך להצליח!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->