<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-21T10:30:54+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "el"
}
-->
# Εφαρμογή Συνομιλίας Azure OpenAI

**Διαδρομή Μάθησης:** Μεσαίο ⭐⭐ | **Χρόνος:** 35-45 λεπτά | **Κόστος:** $50-200/μήνα

Μια πλήρης εφαρμογή συνομιλίας Azure OpenAI που αναπτύσσεται χρησιμοποιώντας το Azure Developer CLI (azd). Αυτό το παράδειγμα δείχνει την ανάπτυξη του GPT-4, την ασφαλή πρόσβαση στο API και μια απλή διεπαφή συνομιλίας.

## 🎯 Τι θα μάθετε

- Ανάπτυξη της υπηρεσίας Azure OpenAI με το μοντέλο GPT-4
- Ασφαλής αποθήκευση κλειδιών API OpenAI με το Key Vault
- Δημιουργία απλής διεπαφής συνομιλίας με Python
- Παρακολούθηση χρήσης tokens και κόστους
- Εφαρμογή περιορισμού ρυθμού και διαχείρισης σφαλμάτων

## 📦 Τι περιλαμβάνεται

✅ **Υπηρεσία Azure OpenAI** - Ανάπτυξη μοντέλου GPT-4  
✅ **Εφαρμογή Συνομιλίας Python** - Απλή διεπαφή συνομιλίας γραμμής εντολών  
✅ **Ενσωμάτωση Key Vault** - Ασφαλής αποθήκευση κλειδιών API  
✅ **Πρότυπα ARM** - Πλήρης υποδομή ως κώδικας  
✅ **Παρακολούθηση Κόστους** - Παρακολούθηση χρήσης tokens  
✅ **Περιορισμός Ρυθμού** - Αποτροπή εξάντλησης ποσοστώσεων  

## Αρχιτεκτονική

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## Προαπαιτούμενα

### Απαιτούμενα

- **Azure Developer CLI (azd)** - [Οδηγός εγκατάστασης](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Συνδρομή Azure** με πρόσβαση στο OpenAI - [Αίτηση πρόσβασης](https://aka.ms/oai/access)
- **Python 3.9+** - [Εγκατάσταση Python](https://www.python.org/downloads/)

### Επαλήθευση Προαπαιτούμενων

```bash
# Ελέγξτε την έκδοση azd (χρειάζεται 1.5.0 ή νεότερη)
azd version

# Επαληθεύστε τη σύνδεση στο Azure
azd auth login

# Ελέγξτε την έκδοση Python
python --version  # ή python3 --version

# Επαληθεύστε την πρόσβαση στο OpenAI (ελέγξτε στο Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Σημαντικό:** Το Azure OpenAI απαιτεί έγκριση αίτησης. Εάν δεν έχετε υποβάλει αίτηση, επισκεφθείτε [aka.ms/oai/access](https://aka.ms/oai/access). Η έγκριση συνήθως διαρκεί 1-2 εργάσιμες ημέρες.

## ⏱️ Χρονοδιάγραμμα Ανάπτυξης

| Φάση | Διάρκεια | Τι Συμβαίνει |
|------|----------|-------------|
| Έλεγχος προαπαιτούμενων | 2-3 λεπτά | Επαλήθευση διαθεσιμότητας ποσοστώσεων OpenAI |
| Ανάπτυξη υποδομής | 8-12 λεπτά | Δημιουργία OpenAI, Key Vault, ανάπτυξη μοντέλου |
| Ρύθμιση εφαρμογής | 2-3 λεπτά | Ρύθμιση περιβάλλοντος και εξαρτήσεων |
| **Σύνολο** | **12-18 λεπτά** | Έτοιμο για συνομιλία με GPT-4 |

**Σημείωση:** Η πρώτη ανάπτυξη του OpenAI μπορεί να διαρκέσει περισσότερο λόγω προετοιμασίας του μοντέλου.

## Γρήγορη Εκκίνηση

```bash
# Μεταβείτε στο παράδειγμα
cd examples/azure-openai-chat

# Αρχικοποιήστε το περιβάλλον
azd env new myopenai

# Αναπτύξτε τα πάντα (υποδομή + διαμόρφωση)
azd up
# Θα σας ζητηθεί να:
# 1. Επιλέξετε συνδρομή Azure
# 2. Επιλέξετε τοποθεσία με διαθεσιμότητα OpenAI (π.χ., eastus, eastus2, westus)
# 3. Περιμένετε 12-18 λεπτά για την ανάπτυξη

# Εγκαταστήστε τις εξαρτήσεις Python
pip install -r requirements.txt

# Ξεκινήστε τη συνομιλία!
python chat.py
```

**Αναμενόμενο Αποτέλεσμα:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Επαλήθευση Ανάπτυξης

### Βήμα 1: Έλεγχος Πόρων Azure

```bash
# Προβολή αναπτυγμένων πόρων
azd show

# Η αναμενόμενη έξοδος δείχνει:
# - Υπηρεσία OpenAI: (όνομα πόρου)
# - Key Vault: (όνομα πόρου)
# - Ανάπτυξη: gpt-4
# - Τοποθεσία: eastus (ή η επιλεγμένη περιοχή σας)
```

### Βήμα 2: Δοκιμή API OpenAI

```bash
# Λάβετε το endpoint και το κλειδί του OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Δοκιμή κλήσης API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Αναμενόμενη Απόκριση:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### Βήμα 3: Επαλήθευση Πρόσβασης στο Key Vault

```bash
# Λίστα μυστικών στο Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Αναμενόμενα Μυστικά:**
- `openai-api-key`
- `openai-endpoint`

**Κριτήρια Επιτυχίας:**
- ✅ Υπηρεσία OpenAI αναπτυγμένη με GPT-4
- ✅ Κλήση API επιστρέφει έγκυρη ολοκλήρωση
- ✅ Μυστικά αποθηκευμένα στο Key Vault
- ✅ Παρακολούθηση χρήσης tokens λειτουργεί

## Δομή Έργου

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## Χαρακτηριστικά Εφαρμογής

### Διεπαφή Συνομιλίας (`chat.py`)

Η εφαρμογή συνομιλίας περιλαμβάνει:

- **Ιστορικό Συνομιλίας** - Διατηρεί το πλαίσιο μεταξύ μηνυμάτων
- **Καταμέτρηση Tokens** - Παρακολουθεί τη χρήση και εκτιμά το κόστος
- **Διαχείριση Σφαλμάτων** - Χειρισμός περιορισμών ρυθμού και σφαλμάτων API
- **Εκτίμηση Κόστους** - Υπολογισμός κόστους σε πραγματικό χρόνο ανά μήνυμα
- **Υποστήριξη Ροής** - Προαιρετικές αποκρίσεις ροής

### Εντολές

Κατά τη συνομιλία, μπορείτε να χρησιμοποιήσετε:
- `quit` ή `exit` - Τερματισμός συνεδρίας
- `clear` - Εκκαθάριση ιστορικού συνομιλίας
- `tokens` - Εμφάνιση συνολικής χρήσης tokens
- `cost` - Εμφάνιση εκτιμώμενου συνολικού κόστους

### Ρύθμιση (`config.py`)

Φορτώνει τη ρύθμιση από μεταβλητές περιβάλλοντος:
```python
AZURE_OPENAI_ENDPOINT  # Από το Key Vault
AZURE_OPENAI_API_KEY   # Από το Key Vault
AZURE_OPENAI_MODEL     # Προεπιλογή: gpt-4
AZURE_OPENAI_MAX_TOKENS # Προεπιλογή: 800
```

## Παραδείγματα Χρήσης

### Βασική Συνομιλία

```bash
python chat.py
```

### Συνομιλία με Προσαρμοσμένο Μοντέλο

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Συνομιλία με Ροή

```bash
python chat.py --stream
```

### Παράδειγμα Συνομιλίας

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Διαχείριση Κόστους

### Τιμολόγηση Tokens (GPT-4)

| Μοντέλο | Είσοδος (ανά 1K tokens) | Έξοδος (ανά 1K tokens) |
|---------|-------------------------|-----------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Εκτιμώμενο Μηνιαίο Κόστος

Με βάση μοτίβα χρήσης:

| Επίπεδο Χρήσης | Μηνύματα/Ημέρα | Tokens/Ημέρα | Μηνιαίο Κόστος |
|----------------|----------------|--------------|----------------|
| **Ελαφρύ** | 20 μηνύματα | 3,000 tokens | $3-5 |
| **Μέτριο** | 100 μηνύματα | 15,000 tokens | $15-25 |
| **Βαρύ** | 500 μηνύματα | 75,000 tokens | $75-125 |

**Βασικό Κόστος Υποδομής:** $1-2/μήνα (Key Vault + ελάχιστος υπολογισμός)

### Συμβουλές Βελτιστοποίησης Κόστους

```bash
# 1. Χρησιμοποιήστε το GPT-3.5-Turbo για απλούστερες εργασίες (20x φθηνότερο)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Μειώστε τα μέγιστα tokens για συντομότερες απαντήσεις
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Παρακολουθήστε τη χρήση των tokens
python chat.py --show-tokens

# 4. Ρυθμίστε ειδοποιήσεις προϋπολογισμού
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Παρακολούθηση

### Προβολή Χρήσης Tokens

```bash
# Στο Azure Portal:
# Πόρος OpenAI → Μετρήσεις → Επιλέξτε "Συναλλαγή Token"

# Ή μέσω Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Προβολή Καταγραφών API

```bash
# Ροή διαγνωστικών καταγραφών
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Ερώτημα καταγραφών
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Αντιμετώπιση Προβλημάτων

### Πρόβλημα: Σφάλμα "Access Denied"

**Συμπτώματα:** 403 Forbidden κατά την κλήση API

**Λύσεις:**
```bash
# 1. Επαληθεύστε ότι η πρόσβαση στο OpenAI έχει εγκριθεί
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Ελέγξτε ότι το API key είναι σωστό
azd env get-value AZURE_OPENAI_API_KEY

# 3. Επαληθεύστε τη μορφή του URL του endpoint
azd env get-value AZURE_OPENAI_ENDPOINT
# Θα πρέπει να είναι: https://[name].openai.azure.com/
```

### Πρόβλημα: "Rate Limit Exceeded"

**Συμπτώματα:** 429 Too Many Requests

**Λύσεις:**
```bash
# 1. Ελέγξτε την τρέχουσα ποσόστωση
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Ζητήστε αύξηση ποσόστωσης (αν χρειάζεται)
# Μεταβείτε στο Azure Portal → Πόρος OpenAI → Ποσόστωση → Αίτημα Αύξησης

# 3. Εφαρμόστε λογική επαναπροσπάθειας (ήδη στο chat.py)
# Η εφαρμογή επαναπροσπαθεί αυτόματα με εκθετική καθυστέρηση
```

### Πρόβλημα: "Model Not Found"

**Συμπτώματα:** Σφάλμα 404 για την ανάπτυξη

**Λύσεις:**
```bash
# 1. Καταγράψτε τις διαθέσιμες αναπτύξεις
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Επαληθεύστε το όνομα του μοντέλου στο περιβάλλον
echo $AZURE_OPENAI_MODEL

# 3. Ενημερώστε στο σωστό όνομα ανάπτυξης
export AZURE_OPENAI_MODEL=gpt-4  # ή gpt-35-turbo
```

### Πρόβλημα: Υψηλή Καθυστέρηση

**Συμπτώματα:** Αργοί χρόνοι απόκρισης (>5 δευτερόλεπτα)

**Λύσεις:**
```bash
# 1. Ελέγξτε την περιφερειακή καθυστέρηση
# Αναπτύξτε στην περιοχή που είναι πιο κοντά στους χρήστες

# 2. Μειώστε τα max_tokens για ταχύτερες απαντήσεις
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Χρησιμοποιήστε streaming για καλύτερη εμπειρία χρήστη
python chat.py --stream
```

## Βέλτιστες Πρακτικές Ασφαλείας

### 1. Προστασία Κλειδιών API

```bash
# Ποτέ μην δεσμεύετε κλειδιά στον έλεγχο πηγαίου κώδικα
# Χρησιμοποιήστε το Key Vault (ήδη διαμορφωμένο)

# Περιστρέψτε τα κλειδιά τακτικά
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Εφαρμογή Φιλτραρίσματος Περιεχομένου

```python
# Το Azure OpenAI περιλαμβάνει ενσωματωμένο φιλτράρισμα περιεχομένου
# Ρύθμιση στο Azure Portal:
# Πόρος OpenAI → Φίλτρα Περιεχομένου → Δημιουργία Προσαρμοσμένου Φίλτρου

# Κατηγορίες: Μίσος, Σεξουαλικό, Βία, Αυτοτραυματισμός
# Επίπεδα: Χαμηλό, Μεσαίο, Υψηλό φιλτράρισμα
```

### 3. Χρήση Διαχειριζόμενης Ταυτότητας (Παραγωγή)

```bash
# Για αναπτύξεις παραγωγής, χρησιμοποιήστε διαχειριζόμενη ταυτότητα
# αντί για κλειδιά API (απαιτεί φιλοξενία εφαρμογής στο Azure)

# Ενημερώστε το infra/openai.bicep να περιλαμβάνει:
# identity: { type: 'SystemAssigned' }
```

## Ανάπτυξη

### Εκτέλεση Τοπικά

```bash
# Εγκαταστήστε εξαρτήσεις
pip install -r src/requirements.txt

# Ορίστε μεταβλητές περιβάλλοντος
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Εκτελέστε την εφαρμογή
python src/chat.py
```

### Εκτέλεση Δοκιμών

```bash
# Εγκαταστήστε εξαρτήσεις δοκιμής
pip install pytest pytest-cov

# Εκτελέστε δοκιμές
pytest tests/ -v

# Με κάλυψη
pytest tests/ --cov=src --cov-report=html
```

### Ενημέρωση Ανάπτυξης Μοντέλου

```bash
# Αναπτύξτε διαφορετική έκδοση μοντέλου
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## Καθαρισμός

```bash
# Διαγραφή όλων των πόρων Azure
azd down --force --purge

# Αυτό αφαιρεί:
# - Υπηρεσία OpenAI
# - Key Vault (με 90 ημέρες μαλακής διαγραφής)
# - Ομάδα πόρων
# - Όλες τις αναπτύξεις και τις διαμορφώσεις
```

## Επόμενα Βήματα

### Επέκταση Αυτού του Παραδείγματος

1. **Προσθήκη Διεπαφής Ιστού** - Δημιουργία frontend με React/Vue
   ```bash
   # Προσθήκη υπηρεσίας frontend στο azure.yaml
   # Ανάπτυξη σε Azure Static Web Apps
   ```

2. **Εφαρμογή RAG** - Προσθήκη αναζήτησης εγγράφων με Azure AI Search
   ```python
   # Ενσωμάτωση του Azure Cognitive Search
   # Μεταφόρτωση εγγράφων και δημιουργία ευρετηρίου διανυσμάτων
   ```

3. **Προσθήκη Κλήσης Λειτουργιών** - Ενεργοποίηση χρήσης εργαλείων
   ```python
   # Ορίστε συναρτήσεις στο chat.py
   # Επιτρέψτε στο GPT-4 να καλεί εξωτερικά APIs
   ```

4. **Υποστήριξη Πολλαπλών Μοντέλων** - Ανάπτυξη πολλαπλών μοντέλων
   ```bash
   # Προσθήκη gpt-35-turbo, μοντέλα embeddings
   # Υλοποίηση λογικής δρομολόγησης μοντέλου
   ```

### Σχετικά Παραδείγματα

- **[Retail Multi-Agent](../retail-scenario.md)** - Προηγμένη αρχιτεκτονική πολλαπλών πρακτόρων
- **[Database App](../../../../examples/database-app)** - Προσθήκη μόνιμης αποθήκευσης
- **[Container Apps](../../../../examples/container-app)** - Ανάπτυξη ως υπηρεσία container

### Πόροι Μάθησης

- 📚 [AZD For Beginners Course](../../README.md) - Κύριο μάθημα
- 📚 [Azure OpenAI Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - Επίσημα έγγραφα
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - Λεπτομέρειες API
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - Βέλτιστες πρακτικές

## Πρόσθετοι Πόροι

### Τεκμηρίωση
- **[Υπηρεσία Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/)** - Πλήρης οδηγός
- **[Μοντέλα GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Δυνατότητες μοντέλων
- **[Φιλτράρισμα Περιεχομένου](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Χαρακτηριστικά ασφάλειας
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Αναφορά azd

### Σεμινάρια
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Πρώτη ανάπτυξη
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Δημιουργία εφαρμογών συνομιλίας
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Προηγμένες δυνατότητες

### Εργαλεία
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Διαδικτυακή πλατφόρμα
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Δημιουργία καλύτερων προτροπών
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Εκτίμηση χρήσης tokens

### Κοινότητα
- **[Azure AI Discord](https://discord.gg/azure)** - Βοήθεια από την κοινότητα
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Φόρουμ ερωτήσεων και απαντήσεων
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Τελευταίες ενημερώσεις

---

**🎉 Επιτυχία!** Έχετε αναπτύξει το Azure OpenAI και δημιουργήσει μια λειτουργική εφαρμογή συνομιλίας. Ξεκινήστε να εξερευνάτε τις δυνατότητες του GPT-4 και να πειραματίζεστε με διαφορετικές προτροπές και περιπτώσεις χρήσης.

**Ερωτήσεις;** [Ανοίξτε ένα ζήτημα](https://github.com/microsoft/AZD-for-beginners/issues) ή ελέγξτε το [FAQ](../../resources/faq.md)

**Ειδοποίηση Κόστους:** Θυμηθείτε να εκτελέσετε `azd down` όταν τελειώσετε τη δοκιμή για να αποφύγετε συνεχιζόμενες χρεώσεις (~$50-100/μήνα για ενεργή χρήση).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->