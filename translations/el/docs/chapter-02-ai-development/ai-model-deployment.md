# Ανάπτυξη Μοντέλου AI με το Azure Developer CLI

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα το AI
- **⬅️ Προηγούμενο**: [AI Agents](agents.md)
- **➡️ Επόμενο**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Παραμετροποίηση](../chapter-03-configuration/configuration.md)

Αυτός ο οδηγός παρέχει αναλυτικές οδηγίες για την ανάπτυξη μοντέλων AI χρησιμοποιώντας πρότυπα AZD, καλύπτοντας από την επιλογή μοντέλου μέχρι τα πρότυπα ανάπτυξης παραγωγής.

> **Αναθεώρηση έκδοσης (2026-11-04):** Οι σχετικές αλλαγές CLI εξετάστηκαν έναντι `azd` `1.37.2`· η διαθεσιμότητα μοντέλων, οι εκδόσεις και τα όρια παραμένουν εξαρτημένα από την περιοχή και τον λογαριασμό. `azd deploy --timeout <seconds>` ελέγχει το παράθυρο ανάπτυξης υπηρεσίας, όχι εγγύηση ενεργοποίησης πράκτορα. Δείτε [σημειώσεις τρέχουσας έκδοσης και καθοδήγηση μετανάστευσης AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Περιεχόμενα

- [Στρατηγική Επιλογής Μοντέλου](#model-selection-strategy)
- [Παραμετροποίηση AZD για Μοντέλα AI](#azd-configuration-for-ai-models)
- [Πρότυπα Ανάπτυξης](#deployment-patterns)
- [Διαχείριση Μοντέλου](#model-management)
- [Παρατηρήσεις Παραγωγής](#production-considerations)
- [Παρακολούθηση και Παρατηρησιμότητα](#monitoring-and-observability)

## Στρατηγική Επιλογής Μοντέλου

### Μοντέλα Azure OpenAI στο Microsoft Foundry

Επιλέξτε το σωστό μοντέλο για την περίπτωσή σας:

Δηλώστε τις αναπτύξεις μοντέλων σε Bicep (παρακάτω), όχι σε αυθαίρετες ρυθμίσεις `services.*.config.AZURE_OPENAI_MODELS`. Το AZD δεν ερμηνεύει τέτοια ρύθμιση ως λίστα πόρων μοντέλου. Το `project` μιας υπηρεσίας δείχνει στην πηγή εφαρμογής, όχι στον κατάλογο `infra/`.

Τα παραδείγματα χρησιμοποιούν την δημοσιευμένη έκδοση `gpt-4.1-mini` **`2025-04-14`** και την έκδοση ενσωμάτωσης **`1`**. Επιβεβαιώστε ότι η έκδοση μοντέλου και το SKU ανάπτυξης υποστηρίζονται στην περιοχή/λογαριασμό στόχο πριν την παροχή.

### Σχεδιασμός Χωρητικότητας Μοντέλου

| Τύπος Μοντέλου | Περίπτωση Χρήσης | Ενδεικτική Ζήτηση Token | Οικονομικές Σκέψεις |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Συνομιλία, Ερωτ-Απ | 10.000-50.000 TPM | Κόστος και ποιότητα σημείου αναφοράς για το φόρτο εργασίας σας |
| gpt-4.1 | Πολύπλοκες εργασίες | 20.000-100.000 TPM | Αξιολογήστε βελτιώσεις ποιότητας έναντι κόστους token |
| text-embedding-3-large | Αναζήτηση, RAG | 30.000-120.000 TPM | Λάβετε υπόψη εισαγωγή και κίνηση ερωτημάτων |
| Whisper | Μετατροπή ομιλίας σε κείμενο | Προγραμματίστε με βάση διάρκεια ήχου και όρια αιτημάτων | Μην εφαρμόζετε τύπο χωρητικότητας TPM για μοντέλο κειμένου |

TPM σημαίνει tokens ανά λεπτό. Για αυτές τις τυπικές αναπτύξεις κειμένου, ARM `sku.capacity` είναι σε μονάδες **1.000-TPM**, όχι ατομικό TPM (π.χ., χωρητικότητα `10` σημαίνει 10.000 TPM). Οι αναλογίες RPM-σε-TPM διαφέρουν ανά τύπο μοντέλου/ανάπτυξης· ελέγξτε και τα δύο όρια έναντι της [τεκμηρίωσης ορίων](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Αυτά τα εύρη είναι παραδείγματα, όχι συστάσεις μεγέθους.

## Παραμετροποίηση AZD για Μοντέλα AI

### Παραμετροποίηση Προτύπου Bicep

Δημιουργήστε αναπτύξεις μοντέλων μέσω προτύπων Bicep:

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

Αυτό είναι ένα παράδειγμα **υποδομής ανάπτυξης με εύρος ομάδας πόρων**, όχι πλήρες πρότυπο εφαρμογής AZD. Ο λογαριασμός επιτρέπει δημόσια πρόσβαση δικτύου και απαιτεί πιστοποίηση ταυτότητας Entra ID/RBAC (`Cognitive Services OpenAI User` για καλούντες). Η παραγωγή χρειάζεται το ιδιωτικό endpoint, DNS, και συνδεσιμότητα εφαρμογής που περιγράφονται στο Κεφάλαιο 8. Το AZD χρειάζεται επίσης ένα κύριο πρότυπο/χαρτογράφηση παραμέτρων και πόρους εφαρμογής-φιλοξενίας· χρησιμοποιήστε ένα λειτουργικό δείγμα για πλήρη ανάπτυξη.

### Μεταβλητές Περιβάλλοντος

Παραμετροποιήστε το περιβάλλον της εφαρμογής σας:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Αυτά είναι ονόματα που ορίζονται από την εφαρμογή· συνδέστε τα στην παραμετροποίηση του host σας. Το Azure OpenAI v1 endpoint που χρησιμοποιείται από τον έλεγχο υγείας παρακάτω δεν απαιτεί την παλιά παράμετρο `api-version` στο ερώτημα· οι παλαιότεροι πελάτες `AzureOpenAI` το απαιτούν, οπότε ακολουθήστε τον τρόπο χρήσης που έχει η εφαρμογή σας.

## Πρότυπα Ανάπτυξης

### Πρότυπο 1: Ανάπτυξη Μίας Περιοχής

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

Καλύτερο για:
- Ανάπτυξη και δοκιμές
- Εφαρμογές μίας αγοράς
- Βελτιστοποίηση κόστους

### Πρότυπο 2: Ανάπτυξη Πολλαπλών Περιοχών

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

Οι παραληφθείσες ιδιότητες λογαριασμού/SKU πρέπει να δοθούν· αυτό το τμήμα δεν μπορεί να αναπτυχθεί όπως γράφτηκε. Αναπτύξτε μοντέλα σε κάθε λογαριασμό και εφαρμόστε διαχείριση δρομολόγησης/ανακατεύθυνσης και ελέγχους διαμονής δεδομένων ξεχωριστά.

Καλύτερο για:
- Παγκόσμιες εφαρμογές
- Απαιτήσεις υψηλής διαθεσιμότητας
- Κατανομή φορτίου

### Πρότυπο 3: Υβριδική Ανάπτυξη

Συνδυάστε τα Microsoft Foundry Models με άλλες υπηρεσίες AI:

Τα παρακάτω αποσπάσματα υποθέτουν ότι ονόματα και `location` δίνονται από το περιλαμβανόμενο πρότυπο.

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

## Διαχείριση Μοντέλου

### Έλεγχος Εκδόσεων

Παρακολουθείστε τις εκδόσεις μοντέλου στην παραμετροποίηση της εφαρμογής ή στο IaC. Αυτό το JSON είναι ένα **παράδειγμα ορισμένο από την εφαρμογή**, όχι ένα ενσωματωμένο σχήμα μοντέλου AZD· πρέπει να υλοποιηθεί και αναπτυχθεί ρητά μια εναλλακτική λύση:

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

### Ενημερώσεις Μοντέλου

Χρησιμοποιήστε ένα hook AZD για έναν ελέγχο διαθεσιμότητας μόνο ανάγνωσης, μετά ενημερώστε το IaC και κάντε παροχή:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Τρέξτε `azd up` **εκτός** του hook για να εφαρμόσετε αλλαγές υποδομής μοντέλου και να αναπτύξετε κώδικα. Μην καλείτε ποτέ `azd deploy` από hook `predeploy`· προκαλεί επαναληπτική εκτέλεση του ίδιου hook. `azd deploy --timeout 1800` επεκτείνει το χρονικό όριο ανάπτυξης εφαρμογής· δεν ενημερώνει πόρους Bicep.

### Δοκιμή A/B

Ο υποδειγματικός πόρος παρακάτω επιλέγει όνομα ανάπτυξης και χωρητικότητα· δημιουργεί **μία** ανάπτυξη, όχι δοκιμή A/B. Για πραγματικό πείραμα, αναπτύξτε δύο διακριτούς πόρους ανάπτυξης, δρομολογήστε ελεγχόμενο ποσοστό αιτήσεων σε κάθε έναν και συγκρίνετε ποιότητα, καθυστέρηση και κόστος. Υποθέτει `openAi` από το παράδειγμα λογαριασμού:

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

## Παρατηρήσεις Παραγωγής

### Σχεδιασμός Χωρητικότητας

Υπολογίστε την απαιτούμενη χωρητικότητα βάσει προτύπων χρήσης:

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

Αναμενόμενο αποτέλεσμα: `Required capacity: 9100 TPM`. Με μονάδες χωρητικότητας 1.000-TPM, στρογγυλοποιήστε προς τα πάνω σε τουλάχιστον `10`, μετά επαληθεύστε την εκτίμηση ορίων RPM και ρυθμού υπηρεσίας για το μοντέλο (συμπεριλαμβανομένου του προϋπολογισμού εξόδου αιτήματος). Αυτή η εκτίμηση ζήτησης token δεν εγγυάται αποφυγή περιορισμών.

### Παραμετροποίηση Αυτόματης Κλιμάκωσης

Παραμετροποιήστε αυτόματη κλιμάκωση για Container Apps:

**Μερικός πόρος:** συγχωνεύστε τις ρυθμίσεις `template.scale` σε πλήρη Container App με τοποθεσία, διαχειριζόμενο περιβάλλον, εικόνα container, πόρους και εισόδους. Η κλιμάκωση αντιγράφων δεν αυξάνει το όριο μοντέλου.

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

**Ενδεικτικός πόρος προϋπολογισμού:** ορίστε `budgetStartDate` ως την πρώτη ημέρα του τρέχοντος μήνα σε UTC (π.χ. `2026-11-01T00:00:00Z` για αυτή την αναθεώρηση), και αντικαταστήστε τη διεύθυνση επικοινωνίας. Η εκκίνηση πρέπει να πληροί τους τρέχοντες χρονικούς περιορισμούς υπηρεσίας. Οι προϋπολογισμοί ειδοποιούν για καθυστερημένα δεδομένα χρέωσης· δεν σταματούν δαπάνες.

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

## Παρακολούθηση και Παρατηρησιμότητα

### Ενσωμάτωση Application Insights

Παραμετροποιήστε παρακολούθηση για φόρτους εργασίας AI:

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

Το απόσπασμα πόρου υποθέτει `applicationInsightsName`, `location`, και υπάρχον `logAnalyticsWorkspace`. Παρέχει παρακολούθηση, αλλά δεν ενορχηστρώνει την εφαρμογή ή δημιουργεί προσαρμοσμένες μετρήσεις.

### Προσαρμοσμένες Μετρήσεις

Παρακολουθείστε μετρήσεις ειδικές για AI:

Χρησιμοποιείστε την υποστηριζόμενη [διανομή Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), όχι το παλιό SDK Python `applicationinsights`. Εγκαταστήστε `azure-monitor-opentelemetry`, παραμετροποιήστε `APPLICATIONINSIGHTS_CONNECTION_STRING`, και αρχικοποιήστε μία φορά κατά την εκκίνηση:

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

Αυτό δείχνει αποστολή χαρακτηριστικού, όχι πραγματική οργάνωση κλήσης μοντέλου. Περιβάλτε το πραγματικό αίτημα σε ένα span για να μετρήσετε τη διάρκεια· ελέγξτε `dependencies`/`traces` στο Application Insights. Μην στέλνετε μηνύματα προτροπής, απαντήσεις, κλειδιά ή ακατέργαστα μηνύματα εξαιρέσεων με ευαίσθητα δεδομένα.

### Έλεγχοι Υγείας

Υλοποιήστε παρακολούθηση υγείας υπηρεσίας AI:

Εγκαταστήστε `fastapi`, `uvicorn`, `httpx`, και `azure-identity`. Ορίστε τις μεταβλητές endpoint/ανάπτυξης παραπάνω και δώστε στον καλούντα `Cognitive Services OpenAI User`. Αυτό το **probe ετοιμότητας** χρησιμοποιεί το Azure OpenAI v1 data plane με Entra ID· πραγματοποιεί χρεώσιμη κλήση μοντέλου. Τρέξτε με `uvicorn health:app` μετά την αποθήκευση ως `health.py`. Χρησιμοποιήστε ξεχωριστή ελαφριά έλεγχο ζωντάνιας, περιορίστε/κάντε cache τα αποτελέσματα ετοιμότητας και μην εκθέσετε αυτήν τη διαδρομή δημόσια χωρίς ελέγχους πρόσβασης.

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

Αναμενόμενο: `GET /health/ai-models` επιστρέφει `200 {"status":"healthy"}` όταν η ρυθμισμένη ανάπτυξη συνομιλίας είναι χρησιμοποιήσιμη, ή `503` χωρίς να αποκαλύπτει λεπτομέρειες στο upstream. Η απαρίθμηση αναπτύξεων είναι λειτουργία διαχειριστικού επιπέδου και δεν είναι έγκυρο probe υγείας επιπέδου δεδομένων.

## Επόμενα Βήματα

1. **Εξετάστε τον [Οδηγό Ενσωμάτωσης Microsoft Foundry](microsoft-foundry-integration.md)** για πρότυπα ενσωμάτωσης υπηρεσιών
2. **Ολοκληρώστε το [AI Workshop Lab](ai-workshop-lab.md)** για πρακτική εμπειρία
3. **Υλοποιήστε τις [Καλές Πρακτικές Παραγωγής AI](../chapter-08-production/production-ai-practices.md)** για επιχειρησιακές αναπτύξεις
4. **Εξερευνήστε τον [Οδηγό Αντιμετώπισης Προβλημάτων AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** για κοινά ζητήματα

## Πόροι

- [Διαθεσιμότητα Μοντέλων Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Κλιμάκωση Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Βελτιστοποίηση Κόστους Μοντέλου AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα το AI
- **⬅️ Προηγούμενο**: [AI Agents](agents.md)
- **➡️ Επόμενο**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Παραμετροποίηση](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->