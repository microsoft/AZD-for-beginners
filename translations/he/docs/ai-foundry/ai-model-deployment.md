# פריסת מודלים של AI עם Azure Developer CLI

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח מבוסס AI
- **⬅️ קודם**: [אינטגרציה עם Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ הבא**: [מעבדת סדנת AI](ai-workshop-lab.md)
- **🚀 פרק הבא**: [פרק 3: תצורה](../getting-started/configuration.md)

מדריך זה מספק הוראות מקיפות לפריסת מודלים של AI באמצעות תבניות AZD, כולל הכל מבחירת מודלים ועד דפוסי פריסה בסביבת ייצור.

## תוכן עניינים

- [אסטרטגיית בחירת מודלים](../../../../docs/ai-foundry)
- [תצורת AZD למודלים של AI](../../../../docs/ai-foundry)
- [דפוסי פריסה](../../../../docs/ai-foundry)
- [ניהול מודלים](../../../../docs/ai-foundry)
- [שיקולים לסביבת ייצור](../../../../docs/ai-foundry)
- [מעקב וניטור](../../../../docs/ai-foundry)

## אסטרטגיית בחירת מודלים

### מודלים של Azure OpenAI

בחרו את המודל המתאים לשימוש שלכם:

```yaml
# azure.yaml - Model configuration
services:
  ai-service:
    project: ./infra
    host: containerapp
    config:
      AZURE_OPENAI_MODELS: |
        [
          {
            "name": "gpt-4o-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4o-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-ada-002",
            "version": "2",
            "deployment": "text-embedding-ada-002", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### תכנון קיבולת מודלים

| סוג מודל | שימוש | קיבולת מומלצת | שיקולי עלות |
|----------|-------|---------------|-------------|
| GPT-4o-mini | צ'אט, שאלות ותשובות | 10-50 TPM | חסכוני לרוב העומסים |
| GPT-4 | הסקת מסקנות מורכבת | 20-100 TPM | עלות גבוהה יותר, מתאים לתכונות פרימיום |
| Text-embedding-ada-002 | חיפוש, RAG | 30-120 TPM | חיוני לחיפוש סמנטי |
| Whisper | דיבור לטקסט | 10-50 TPM | עומסי עיבוד שמע |

## תצורת AZD למודלים של AI

### תצורת תבנית Bicep

צרו פריסות מודלים באמצעות תבניות Bicep:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4o-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-ada-002'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
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

### משתני סביבה

הגדירו את סביבת האפליקציה שלכם:

```bash
# תצורת .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## דפוסי פריסה

### דפוס 1: פריסה לאזור יחיד

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4o-mini
```

מתאים ל:
- פיתוח ובדיקות
- אפליקציות לשוק יחיד
- אופטימיזציה של עלויות

### דפוס 2: פריסה רב-אזורית

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

מתאים ל:
- אפליקציות גלובליות
- דרישות זמינות גבוהה
- חלוקת עומסים

### דפוס 3: פריסה היברידית

שילוב Azure OpenAI עם שירותי AI אחרים:

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

עקבו אחר גרסאות מודלים בתצורת AZD שלכם:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4o-mini",
      "version": "2024-07-18",
      "fallback": "gpt-35-turbo"
    },
    "embedding": {
      "name": "text-embedding-ada-002",
      "version": "2"
    }
  }
}
```

### עדכוני מודלים

השתמשו ב-AZD hooks לעדכוני מודלים:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### בדיקות A/B

פרסו גרסאות מודלים מרובות:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## שיקולים לסביבת ייצור

### תכנון קיבולת

חשב את הקיבולת הנדרשת בהתבסס על דפוסי שימוש:

```python
# דוגמה לחישוב קיבולת
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return int(total_tpm * (1 + safety_margin))

# דוגמה לשימוש
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### תצורת Auto-scaling

הגדירו Auto-scaling עבור Container Apps:

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

### אופטימיזציה של עלויות

יישמו בקרות עלויות:

```bicep
@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
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

## מעקב וניטור

### אינטגרציה עם Application Insights

הגדירו ניטור לעומסי עבודה של AI:

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

// Custom metrics for AI models
resource aiMetrics 'Microsoft.Insights/components/analyticsItems@2020-02-02' = {
  parent: applicationInsights
  name: 'ai-model-metrics'
  properties: {
    content: '''
      customEvents
      | where name == "AI_Model_Request"
      | extend model = tostring(customDimensions.model)
      | extend tokens = toint(customDimensions.tokens)
      | extend latency = toint(customDimensions.latency_ms)
      | summarize 
          requests = count(),
          avg_tokens = avg(tokens),
          avg_latency = avg(latency)
        by model, bin(timestamp, 5m)
    '''
    type: 'query'
    scope: 'shared'
  }
}
```

### מדדים מותאמים אישית

עקבו אחר מדדים ספציפיים ל-AI:

```python
# טלמטריה מותאמת אישית עבור מודלים של AI
import logging
from applicationinsights import TelemetryClient

class AITelemetry:
    def __init__(self, instrumentation_key: str):
        self.client = TelemetryClient(instrumentation_key)
    
    def track_model_request(self, model: str, tokens: int, latency_ms: int, success: bool):
        """Track AI model request metrics."""
        self.client.track_event(
            'AI_Model_Request',
            {
                'model': model,
                'tokens': str(tokens),
                'latency_ms': str(latency_ms),
                'success': str(success)
            }
        )
        
    def track_model_error(self, model: str, error_type: str, error_message: str):
        """Track AI model errors."""
        self.client.track_exception(
            type=error_type,
            value=error_message,
            properties={
                'model': model,
                'component': 'ai_model'
            }
        )
```

### בדיקות בריאות

יישמו ניטור בריאות לשירותי AI:

```python
# נקודות קצה לבדיקת בריאות
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # בדיקת חיבור ל-OpenAI
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/deployments",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            
        if response.status_code == 200:
            return {"status": "healthy", "models": response.json()}
        else:
            raise HTTPException(status_code=503, detail="AI models unavailable")
            
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Health check failed: {str(e)}")
```

## צעדים הבאים

1. **סקירה של [מדריך אינטגרציה עם Microsoft Foundry](microsoft-foundry-integration.md)** לדפוסי אינטגרציה של שירותים
2. **השלמת [מעבדת סדנת AI](ai-workshop-lab.md)** לחוויה מעשית
3. **יישום [שיטות AI בסביבת ייצור](production-ai-practices.md)** לפריסות ארגוניות
4. **חקירת [מדריך פתרון בעיות AI](../troubleshooting/ai-troubleshooting.md)** לבעיות נפוצות

## משאבים

- [זמינות מודלים של Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [סקיילינג של Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [אופטימיזציה של עלויות מודלים של AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח מבוסס AI
- **⬅️ קודם**: [אינטגרציה עם Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ הבא**: [מעבדת סדנת AI](ai-workshop-lab.md)
- **🚀 פרק הבא**: [פרק 3: תצורה](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. אנו לא נושאים באחריות לאי הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->