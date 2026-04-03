# Ανάπτυξη Μοντέλων AI με το Azure Developer CLI

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στο AI
- **⬅️ Προηγούμενο**: [Ενσωμάτωση Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Επόμενο**: [Εργαστήριο AI](ai-workshop-lab.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

Αυτός ο οδηγός παρέχει ολοκληρωμένες οδηγίες για την ανάπτυξη μοντέλων AI χρησιμοποιώντας πρότυπα AZD, καλύπτοντας τα πάντα από την επιλογή μοντέλου έως τα μοτίβα ανάπτυξης σε παραγωγή.

> **Σημείωση επικύρωσης (2026-03-25):** Η ροή εργασίας AZD σε αυτόν τον οδηγό ελέγχθηκε έναντι `azd` `1.23.12`. Για αναπτύξεις AI που διαρκούν περισσότερο από το προεπιλεγμένο παράθυρο ανάπτυξης υπηρεσίας, οι τρέχουσες εκδόσεις AZD υποστηρίζουν `azd deploy --timeout <seconds>`.

## Πίνακας Περιεχομένων

- [Στρατηγική Επιλογής Μοντέλου](#στρατηγική-επιλογής-μοντέλου)
- [Διαμόρφωση AZD για Μοντέλα AI](#διαμόρφωση-azd-για-μοντέλα-ai)
- [Μοτίβα Ανάπτυξης](#μοτίβα-ανάπτυξης)
- [Διαχείριση Μοντέλων](#διαχείριση-μοντέλων)
- [Παρατηρήσεις για Παραγωγή](#παρατηρήσεις-για-παραγωγή)
- [Παρακολούθηση και Παρατηρησιμότητα](#παρακολούθηση-και-παρατηρησιμότητα)

## Στρατηγική Επιλογής Μοντέλου

### Μοντέλα Microsoft Foundry

Επιλέξτε το κατάλληλο μοντέλο για την περίπτωσή σας χρήσης:

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
            "name": "gpt-4.1-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4.1-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-3-large",
            "version": "1",
            "deployment": "text-embedding-3-large", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Σχεδιασμός Χωρητικότητας Μοντέλου

| Τύπος Μοντέλου | Περίπτωση Χρήσης | Προτεινόμενη Χωρητικότητα | Θέματα Κόστους |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Συνομιλία, Ερωταπαντήσεις | 10-50 TPM | Οικονομικά αποδοτικό για τις περισσότερες φορτίσεις εργασίας |
| gpt-4.1 | Σύνθετη συλλογιστική | 20-100 TPM | Υψηλότερο κόστος, χρήση για προνομιακές λειτουργίες |
| text-embedding-3-large | Αναζήτηση, RAG | 30-120 TPM | Καλή προεπιλογή για σημασιολογική αναζήτηση και ανάκτηση |
| Whisper | Μετατροπή ομιλίας σε κείμενο | 10-50 TPM | Φορτία εργασίας επεξεργασίας ήχου |

## Διαμόρφωση AZD για Μοντέλα AI

### Διαμόρφωση Προτύπου Bicep

Δημιουργήστε αναπτύξεις μοντέλων μέσω προτύπων Bicep:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
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
# .env διαμόρφωση
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Μοτίβα Ανάπτυξης

### Μοτίβο 1: Ανάπτυξη σε Μία Περιοχή

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Καλύτερο για:
- Ανάπτυξη και δοκιμές
- Εφαρμογές για μία αγορά
- Βελτιστοποίηση κόστους

### Μοτίβο 2: Ανάπτυξη σε Πολλές Περιοχές

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Καλύτερο για:
- Παγκόσμιες εφαρμογές
- Απαιτήσεις υψηλής διαθεσιμότητας
- Κατανομή φορτίου

### Μοτίβο 3: Υβριδική Ανάπτυξη

Συνδυάστε τα Μοντέλα Microsoft Foundry με άλλες υπηρεσίες AI:

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

Παρακολουθήστε τις εκδόσεις μοντέλων στη διαμόρφωση AZD σας:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2024-07-18",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Ενημερώσεις Μοντέλου

Χρησιμοποιήστε hooks του AZD για ενημερώσεις μοντέλου:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Αν η ανάπτυξη διαρκέσει περισσότερο από το προεπιλεγμένο χρονικό όριο
azd deploy --timeout 1800
```

### Δοκιμές A/B

Αναπτύξτε πολλαπλές εκδόσεις μοντέλου:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Παρατηρήσεις για Παραγωγή

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

Διαμορφώστε την αυτόματη κλιμάκωση για Container Apps:

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

Εφαρμόστε ελέγχους κόστους:

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

### Ενσωμάτωση με Application Insights

Διαμορφώστε την παρακολούθηση για φορτία εργασίας AI:

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
# Σημεία ελέγχου υγείας
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

1. **Ανασκόπηση του [Οδηγού Ενσωμάτωσης Microsoft Foundry](microsoft-foundry-integration.md)** για μοτίβα ενσωμάτωσης υπηρεσιών
2. **Ολοκληρώστε το [Εργαστήριο AI](ai-workshop-lab.md)** για πρακτική εμπειρία
3. **Εφαρμόστε τις [Πρακτικές AI για Παραγωγή](production-ai-practices.md)** για αναπτύξεις σε επιχειρήσεις
4. **Εξερευνήστε τον [Οδηγό Επίλυσης Προβλημάτων AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** για κοινά ζητήματα

## Πόροι

- [Διαθεσιμότητα Μοντέλων Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Κλιμάκωση Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Βελτιστοποίηση Κόστους Μοντέλων AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στο AI
- **⬅️ Προηγούμενο**: [Ενσωμάτωση Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Επόμενο**: [Εργαστήριο AI](ai-workshop-lab.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση Ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να γνωρίζετε ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική μετάφραση από άνθρωπο. Δεν φέρουμε ευθύνη για τυχόν παρανοήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->