# פריסת מודלים של AI עם Azure Developer CLI

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח עם AI כראשון
- **⬅️ קודם**: [סוכני AI](agents.md)
- **➡️ הבא**: [מעבדת סדנת AI](ai-workshop-lab.md)
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

מדריך זה מספק הוראות מקיפות לפריסת מודלים של AI תוך שימוש בתבניות AZD, ומכסה הכל מבחירת מודל ועד דפוסי פריסה לייצור.

> **בדיקת גרסה (2026-11-04):** שינויים קשורים ב-CLI נסקרו לעומת `azd` `1.37.2`; זמינות דגמים, גרסאות, ומכסת שימוש נשארות תלויות אזור ומנוי. `azd deploy --timeout <seconds>` מפקח על חלון פריסת השירות, לא מבטיח הפעלת הסוכן. ראו [הערות שחרור נוכחיות והנחיות מיגרציה ל-AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## תוכן העניינים

- [אסטרטגיית בחירת מודל](#model-selection-strategy)
- [תצורת AZD עבור מודלים של AI](#azd-configuration-for-ai-models)
- [דפוסי פריסה](#deployment-patterns)
- [ניהול מודלים](#model-management)
- [שיקולים בייצור](#production-considerations)
- [ניטור ותצפית](#monitoring-and-observability)

## אסטרטגיית בחירת מודל

### מודלים של Azure OpenAI ב-Microsoft Foundry

בחר את המודל המתאים למקרה השימוש שלך:

הכרז על פריסות מודלים ב-Bicep (להלן), לא בהגדרות `services.*.config.AZURE_OPENAI_MODELS` אקראיות. AZD אינה מפרשת הגדרה כזו כרשימת משאבי מודל. ה-`project` של שירות מצביע למקור היישום, לא לתיקיית ה-`infra/` שלו.

הדוגמאות משתמשות בגרסת `gpt-4.1-mini` שפורסמה **`2025-04-14`** ובגרסת ההטמעה **`1`**. אשר שהגרסה וה-SKU של הפריסה נתמכים באזור/חשבון היעד לפני ההקצאה.

### תכנון קיבולת המודל

| סוג המודל | מקרה השימוש | דרישת סימנים משוערת | שיקולי עלות |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | צ'אט, שאלות ותשובות | 10,000-50,000 סימנים לדקה | הערכת עלות ואיכות לעומס העבודה שלך |
| gpt-4.1 | משימות מורכבות | 20,000-100,000 סימנים לדקה | הערכת גידול איכות אל מול עלות הסימנים |
| text-embedding-3-large | חיפוש, RAG | 30,000-120,000 סימנים לדקה | התחשבות בכניסה ובתעבורת שאילתות |
| Whisper | דיבור לטקסט | תכנן לפי משך האודיו ומגבלות הבקשות | אל תיישם נוסחת קיבולת סימנים למודל טקסט |

TPM פירושו סימנים לדקה. לפריסות טקסט סטנדרטיות אלה, `sku.capacity` ב-ARM הוא ב**יחידות של 1,000 TPM**, לא TPM בודדים (קיבולת `10` משמעותה 10,000 TPM). יחס RPM ל-TPM משתנה לפי סוג מודל/פריסה; אמת את שתי המגבלות מול [תיעוד המכסה](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). טווחים אלה הם דוגמאות, לא המלצות מימדי.

## תצורת AZD עבור מודלים של AI

### תצורת תבנית Bicep

צור פריסות מודלים באמצעות תבניות Bicep:

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-3-large'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
    sku: {
      name: 'Standard'
      capacity: 30
    }
  }
]

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: openAiAccountName
    disableLocalAuth: true
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'S0'
  }
}

@batchSize(1)
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in openAiModelDeployments: {
  parent: openAi
  name: deployment.name
  properties: {
    model: deployment.model
  }
  sku: deployment.sku
}]
```

זהו דוגמה לתשתית **בטווח קבוצת משאבים**, לא תבנית AZD מלאה. החשבון מאפשר גישה לרשת ציבורית ודורש אימות Entra ID/RBAC (`Cognitive Services OpenAI User` לבקשות). לייצור דרוש קצה פרטי, DNS, וחיבור יישום המת beschrieben בפרק 8. AZD זקוק גם למיפוי תבנית/פרמטר ראשי ומשאבי אירוח יישומים; השתמש בדוגמה עובדת לפריסה מלאה.

### משתני סביבה

הגדר את סביבת האפליקציה שלך:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

אלו שמות שהוגדרו באפליקציה; חבר אותם לתצורת המארח שלך. נקודת הקצה של Azure OpenAI v1 המשמשת לבדיקה למטה אינה דורשת את פרמטר השאילתה המיושן `api-version`; לקוחות ישנים `AzureOpenAI` כן, לכן עקוב אחר גרסת ה-API בה האפליקציה שלך משתמשת.

## דפוסי פריסה

### דפוס 1: פריסה באיזור יחיד

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

מתאים ל:
- פיתוח ובדיקות
- יישומים בשוק יחיד
- אופטימיזציה של עלויות

### דפוס 2: פריסה במספר אזורים

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

תכונות החשבון/SKU שהושמטו חייבות להינתן; קטע זה אינו ניתן לפריסה כפי שהוא. פרוס מודלים בכל חשבון ויישם הגדרות ניתוב/כשל ונתוני שהות בנפרד.

מתאים ל:
- יישומים גלובליים
- דרישות זמינות גבוהה
- פיזור עומסים

### דפוס 3: פריסה מעורבת

שלב מודלים של Microsoft Foundry עם שירותי AI נוספים:

הקטעים הבאים מניחים ששמות ו-`location` ניתנים על ידי תבנית המכילה.

```bicep
// Hybrid AI services
resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: cognitiveServicesName
  location: location
  kind: 'CognitiveServices'
  properties: {
    customSubDomainName: cognitiveServicesName
  }
  sku: {
    name: 'S0'
  }
}

resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  properties: {
    customSubDomainName: documentIntelligenceName
  }
  sku: {
    name: 'S0'
  }
}
```

## ניהול מודלים

### בקרת גרסאות

עקוב אחרי גרסאות המודל בתצורת האפליקציה או IaC. JSON זה הוא **דוגמה שהוגדרה באפליקציה**, לא סכמת מודל מובנית ב-AZD; יש ליישם ולפרוס מגנון גיבוי במפורש:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### עדכוני מודל

השתמש בקוק ב-AZD לבדיקה לקריאה בלבד לזמינות, ואז עדכן IaC והקצה:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

הרץ את `azd up` **מחוץ** לקוק להחלת תשתית מודל מעודכנת ופריסת קוד. לעולם אל תקרא ל-`azd deploy` מתוך קוק `predeploy`: זה מפעיל מחדש רקורסיבית את אותו קוק. `azd deploy --timeout 1800` מאריך את זמן ההמתנה לפריסת אפליקציה; אינו מעדכן משאבי Bicep.

### בדיקות A/B

משאב הדוגמה מטה בוחר שם פריסה וקיבולת; הוא יוצר **פריסה אחת**, לא ניסוי A/B. לניסוי אמיתי, הקצה שני משאבי פריסה נפרדים, נהל הפניה מבוקרת של בקשות לכל אחד, והשווה איכות, שהייה ועלות. הוא מניח `openAi` מדוגמת החשבון:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## שיקולים בייצור

### תכנון קיבולת

חשב את הקיבולת הדרושה בהתבסס על דפוסי שימוש:

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

פלט צפוי: `Required capacity: 9100 TPM`. עם יחידות קיבולת של 1,000 TPM, עגל למעלה לפחות ל-`10`, ואז אמת את ההערכה הספציפית של RPM ומגבלות שירות (כולל תקציב פלט מבוקש). הערכת דרישת סימנים זו אינה הבטחה נגד החסימה.

### תצורת קנה מידה אוטומטי

הגדר קנה מידה אוטומטי עבור Container Apps:

**משאב חלקי:** שלב את הגדרות `template.scale` לתוך Container App מלא עם מיקום, סביבה מנוהלת, תמונת מכולה, משאבים וכניסה. הגדלת העתקים אינה מגדילה את מכסת המודל.

```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  properties: {
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-rule'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
          {
            name: 'cpu-rule'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'
              }
            }
          }
        ]
      }
    }
  }
}
```

### אופטימיזציית עלויות

יישם ביקורות עלויות:

**משאב תקציב דוגמטי:** הגדר את `budgetStartDate` כראשון לחודש הנוכחי ב-UTC (לדוגמה `2026-11-01T00:00:00Z` לביקורת זו), והחלף את כתובת הקשר. ההתחלה חייבת לעמוד במגבלות התאריך הנוכחי של השירות. תקציבים מזהירים באיחור בנתוני חיוב; הם אינם מפסיקים את ההוצאה.

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 1000
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@yourcompany.com'
        ]
      }
    }
  }
}
```

## ניטור ותצפית

### אינטגרציה עם Application Insights

הגדר ניטור לעומסי עבודה של AI:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

```

קטע המשאב מניח `applicationInsightsName`, `location`, ו-`logAnalyticsWorkspace` קיים. הוא מקצה ניטור, אך אינו מגדיר את האפליקציה ואינו יוצר מדדים מותאמים אישית.

### מדדים מותאמים אישית

עקוב אחרי מדדים ייחודיים ל-AI:

השתמש ב[הפצת Azure Monitor OpenTelemetry הנתמכת](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), לא ב-SDK הפייתון `applicationinsights` הישן. התקן את `azure-monitor-opentelemetry`, הגדר את `APPLICATIONINSIGHTS_CONNECTION_STRING`, ואתחל פעם אחת בעת ההפעלה:

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

זה מדגים שליחת מאפיינים, לא כלים לקריאה ממשית למודל. עטוף את הבקשה האמיתית בבזק על מנת למדוד את משכה; בדוק ב-`dependencies`/`traces` ב-Application Insights. אל תשלח פקודות, תגובות, מפתחות, או הודעות שגיאה גולמיות עם נתונים רגישים.

### בדיקות בריאות

יישם ניטור בריאות שירות AI:

התקן את `fastapi`, `uvicorn`, `httpx`, ו-`azure-identity`. הגדר למעלה את משתני ה-endpoint/הפריסה והענק לייצרן את `Cognitive Services OpenAI User`. זוהי **בדיקת מוכנות** המשתמשת במישור הנתונים Azure OpenAI v1 עם Entra ID; מבצעת קריאת מודל לחיוב. הרץ עם `uvicorn health:app` לאחר שמירת הקובץ כ-`health.py`. השתמש בבדיקת חיים נפרדת קלה, נהל הגבלה/מטמון לתוצאות המוכנות, ואל תחשוף נתיב זה בציבור ללא בקרות גישה.

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

צפוי: `GET /health/ai-models` מחזיר `200 {"status":"healthy"}` כאשר פריסת הצ'ט שהוגדרה זמינה לשימוש, או `503` ללא חשיפת פרטים מקדימים. רשימת פריסות היא פעולה במישור הניהול ואינה מהווה בדיקת בריאות למישור הנתונים.

## השלבים הבאים

1. **סקור את [מדריך האינטגרציה של Microsoft Foundry](microsoft-foundry-integration.md)** לדפוסי אינטגרציה של שירות
2. **סיים את [מעבדת הסדנה AI](ai-workshop-lab.md)** לניסיון מעשי
3. **יישם [פרקטיקות AI לייצור](../chapter-08-production/production-ai-practices.md)** לפריסות ארגוניות
4. **חקור את [מדריך פתרון בעיות AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** לבעיות נפוצות

## משאבים

- [זמינות מודלים ב-Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [קנה מידה של Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [אופטימיזציית עלויות למודל AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח עם AI כראשון
- **⬅️ קודם**: [סוכני AI](agents.md)
- **➡️ הבא**: [מעבדת סדנת AI](ai-workshop-lab.md)
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->