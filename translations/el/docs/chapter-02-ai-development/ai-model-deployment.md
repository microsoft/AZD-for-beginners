# Ανάπτυξη Μοντέλων AI με το Azure Developer CLI

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με προτεραιότητα AI
- **⬅️ Προηγούμενο**: [Ενσωμάτωση Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Επόμενο**: [Εργαστήριο AI](ai-workshop-lab.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

Αυτός ο οδηγός παρέχει ολοκληρωμένες οδηγίες για την ανάπτυξη μοντέλων AI χρησιμοποιώντας πρότυπα AZD, καλύπτοντας τα πάντα από την επιλογή μοντέλου έως τα πρότυπα ανάπτυξης σε παραγωγή.

## Πίνακας Περιεχομένων

- [Στρατηγική Επιλογής Μοντέλου](../../../../docs/chapter-02-ai-development)
- [Διαμόρφωση AZD για Μοντέλα AI](../../../../docs/chapter-02-ai-development)
- [Πρότυπα Ανάπτυξης](../../../../docs/chapter-02-ai-development)
- [Διαχείριση Μοντέλου](../../../../docs/chapter-02-ai-development)
- [Παράγοντες για Παραγωγή](../../../../docs/chapter-02-ai-development)
- [Παρακολούθηση και Παρατηρησιμότητα](../../../../docs/chapter-02-ai-development)

## Στρατηγική Επιλογής Μοντέλου

### Μοντέλα Azure OpenAI

Επιλέξτε το κατάλληλο μοντέλο για την περίπτωσή σας:

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

### Σχεδιασμός Χωρητικότητας Μοντέλου

| Τύπος Μοντέλου | Περίπτωση Χρήσης | Συνιστώμενη Χωρητικότητα | Παράγοντες Κόστους |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | Συνομιλία, Ερωτήσεις & Απαντήσεις | 10-50 TPM | Οικονομικά αποδοτικό για τις περισσότερες εργασίες |
| GPT-4 | Σύνθετη λογική | 20-100 TPM | Υψηλότερο κόστος, να χρησιμοποιείται για premium λειτουργίες |
| Text-embedding-ada-002 | Αναζήτηση, RAG | 30-120 TPM | Απαραίτητο για σημασιολογική αναζήτηση |
| Whisper | Μετατροπή ομιλίας σε κείμενο | 10-50 TPM | Εργασίες επεξεργασίας ήχου |

## Διαμόρφωση AZD για Μοντέλα AI

### Διαμόρφωση Προτύπου Bicep

Δημιουργήστε αναπτύξεις μοντέλων μέσω προτύπων Bicep:

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

### Μεταβλητές Περιβάλλοντος

Διαμορφώστε το περιβάλλον της εφαρμογής σας:

```bash
# Διαμόρφωση .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Πρότυπα Ανάπτυξης

### Πρότυπο 1: Ανάπτυξη σε Μία Περιοχή

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

Κατάλληλο για:
- Ανάπτυξη και δοκιμές
- Εφαρμογές για μία αγορά
- Βελτιστοποίηση κόστους

### Πρότυπο 2: Ανάπτυξη σε Πολλαπλές Περιοχές

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Κατάλληλο για:
- Παγκόσμιες εφαρμογές
- Απαιτήσεις υψηλής διαθεσιμότητας
- Κατανομή φόρτου

### Πρότυπο 3: Υβριδική Ανάπτυξη

Συνδυάστε το Azure OpenAI με άλλες υπηρεσίες AI:

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

## Διαχείριση Μοντέλων

### Έλεγχος Εκδόσεων

Παρακολουθήστε τις εκδόσεις μοντέλων στη ρύθμιση AZD σας:

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

### Ενημερώσεις Μοντέλων

Χρησιμοποιήστε hooks του AZD για ενημερώσεις μοντέλων:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### Δοκιμές A/B

Αναπτύξτε πολλαπλές εκδόσεις μοντέλων:

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

## Παράγοντες για Παραγωγή

### Σχεδιασμός Χωρητικότητας

Υπολογίστε την απαιτούμενη χωρητικότητα βάσει προτύπων χρήσης:

```python
# Παράδειγμα υπολογισμού χωρητικότητας
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

# Παράδειγμα χρήσης
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Διαμόρφωση Αυτόματης Κλιμάκωσης

Διαμορφώστε αυτόματη κλιμάκωση για Container Apps:

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

### Βελτιστοποίηση Κόστους

Εφαρμόστε μέτρα ελέγχου κόστους:

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

## Παρακολούθηση και Παρατηρησιμότητα

### Ενσωμάτωση Application Insights

Διαμορφώστε την παρακολούθηση για φόρτους εργασίας AI:

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

### Προσαρμοσμένες Μετρικές

Παρακολουθήστε μετρικές ειδικές για AI:

```python
# Προσαρμοσμένη τηλεμετρία για μοντέλα τεχνητής νοημοσύνης
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

### Έλεγχοι Υγείας

Υλοποιήστε παρακολούθηση υγείας υπηρεσιών AI:

```python
# Σημεία τερματισμού ελέγχου υγείας
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Δοκιμή σύνδεσης με το OpenAI
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

## Επόμενα Βήματα

1. **Επισκοπήστε τον [Οδηγό Ενσωμάτωσης Microsoft Foundry](microsoft-foundry-integration.md)** για πρότυπα ενσωμάτωσης υπηρεσιών
2. **Ολοκληρώστε το [Εργαστήριο AI](ai-workshop-lab.md)** για πρακτική εμπειρία
3. **Εφαρμόστε τις [Πρακτικές Παραγωγής AI](production-ai-practices.md)** για επιχειρησιακές αναπτύξεις
4. **Εξερευνήστε τον [Οδηγό Αντιμετώπισης Προβλημάτων AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** για κοινά ζητήματα

## Πόροι

- [Διαθεσιμότητα Μοντέλων Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Κλιμάκωση Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Βελτιστοποίηση Κόστους Μοντέλων AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με προτεραιότητα AI
- **⬅️ Προηγούμενο**: [Ενσωμάτωση Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Επόμενο**: [Εργαστήριο AI](ai-workshop-lab.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί με χρήση της υπηρεσίας αυτόματης μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρόλο που επιδιώκουμε την ακρίβεια, παρακαλούμε λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το αρχικό έγγραφο στην πρωτότυπη γλώσσα του πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από άνθρωπο. Δεν φέρουμε ευθύνη για τυχόν παρανοήσεις ή παρερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->