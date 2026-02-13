# Πράκτορες Τεχνητής Νοημοσύνης με Azure Developer CLI

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στην Τεχνητή Νοημοσύνη
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Πρακτικές AI για Παραγωγή](production-ai-practices.md)
- **🚀 Προχωρημένο**: [Λύσεις Πολλαπλών Πρακτόρων](../../examples/retail-scenario.md)

---

## Εισαγωγή

Οι πράκτορες AI είναι αυτόνομα προγράμματα που μπορούν να αντιλαμβάνονται το περιβάλλον τους, να λαμβάνουν αποφάσεις και να εκτελούν ενέργειες για να πετύχουν συγκεκριμένους στόχους. Σε αντίθεση με απλά chatbots που απαντούν σε προτροπές, οι πράκτορες μπορούν να:

- **Χρησιμοποιούν εργαλεία** - Καλούν APIs, αναζητούν σε βάσεις δεδομένων, εκτελούν κώδικα
- **Σχεδιάζουν και λογικοποιούν** - Διασπούν σύνθετες εργασίες σε βήματα
- **Μαθαίνουν από το πλαίσιο** - Διατηρούν μνήμη και προσαρμόζουν τη συμπεριφορά
- **Συνεργάζονται** - Εργάζονται με άλλους πράκτορες (συστήματα πολλαπλών πρακτόρων)

Αυτός ο οδηγός σας δείχνει πώς να αναπτύξετε πράκτορες AI στο Azure χρησιμοποιώντας το Azure Developer CLI (azd).

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του οδηγού, θα:
- Κατανοείτε τι είναι οι πράκτορες AI και πώς διαφέρουν από τα chatbots
- Αναπτύσσετε προ-κατασκευασμένα πρότυπα πρακτόρων χρησιμοποιώντας το AZD
- Διαμορφώνετε Foundry Agents για προσαρμοσμένους πράκτορες
- Υλοποιείτε βασικά πρότυπα πρακτόρων (χρήση εργαλείων, RAG, πολλαπλοί πράκτορες)
- Παρακολουθείτε και εντοπίζετε σφάλματα σε αναπτυγμένους πράκτορες

## Αναμενόμενα Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση, θα μπορείτε να:
- Αναπτύσσετε εφαρμογές πράκτορα AI στο Azure με μία εντολή
- Διαμορφώνετε εργαλεία και δυνατότητες πρακτόρων
- Υλοποιείτε retrieval-augmented generation (RAG) με πράκτορες
- Σχεδιάζετε αρχιτεκτονικές πολλαπλών πρακτόρων για σύνθετες ροές εργασίας
- Εντοπίζετε και διορθώνετε συνήθη προβλήματα ανάπτυξης πρακτόρων

---

## 🤖 Τι κάνει έναν Πράκτορα διαφορετικό από ένα Chatbot;

| Χαρακτηριστικό | Chatbot | Πράκτορας AI |
|---------------|---------|--------------|
| **Συμπεριφορά** | Απαντά σε προτροπές | Αναλαμβάνει αυτόνομες ενέργειες |
| **Εργαλεία** | Κανένα | Μπορεί να καλεί APIs, να αναζητά, να εκτελεί κώδικα |
| **Μνήμη** | Μόνο βάσει συνεδρίας | Επίμονη μνήμη ανά συνεδρίες |
| **Σχεδιασμός** | Μονοβηματική απάντηση | Πολλαπλά βήματα λογικής |
| **Συνεργασία** | Μονή οντότητα | Μπορεί να συνεργάζεται με άλλους πράκτορες |

### Απλή Αναλογία

- **Chatbot** = Ένα εξυπηρετικό άτομο που απαντά σε ερωτήσεις σε ένα πληροφοριακό γκισέ
- **Πράκτορας AI** = Ένας προσωπικός βοηθός που μπορεί να κάνει κλήσεις, να κλείνει ραντεβού και να ολοκληρώνει εργασίες για εσάς

---

## 🚀 Γρήγορη Εκκίνηση: Αναπτύξτε τον Πρώτο σας Πράκτορα

### Επιλογή 1: Πρότυπο Foundry Agents (Συνιστάται)

```bash
# Αρχικοποίηση του προτύπου πρακτόρων τεχνητής νοημοσύνης
azd init --template get-started-with-ai-agents

# Ανάπτυξη στο Azure
azd up
```

**Τι αναπτύσσεται:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (για RAG)
- ✅ Azure Container Apps (διαδικτυακή διεπαφή)
- ✅ Application Insights (παρακολούθηση)

**Χρόνος:** ~15-20 λεπτά
**Κόστος:** ~$100-150/μήνα (ανάπτυξη)

### Επιλογή 2: Πράκτορας OpenAI με Prompty

```bash
# Αρχικοποιήστε το πρότυπο πράκτορα που βασίζεται στο Prompty
azd init --template agent-openai-python-prompty

# Αναπτύξτε στο Azure
azd up
```

**Τι αναπτύσσεται:**
- ✅ Azure Functions (serverless εκτέλεση πράκτορα)
- ✅ Azure OpenAI
- ✅ Αρχεία διαμόρφωσης Prompty
- ✅ Δείγμα υλοποίησης πράκτορα

**Χρόνος:** ~10-15 λεπτά
**Κόστος:** ~$50-100/μήνα (ανάπτυξη)

### Επιλογή 3: RAG Chat Agent

```bash
# Αρχικοποίηση προτύπου συνομιλίας RAG
azd init --template azure-search-openai-demo

# Ανάπτυξη στο Azure
azd up
```

**Τι αναπτύσσεται:**
- ✅ Azure OpenAI
- ✅ Azure AI Search με δείγμα δεδομένων
- ✅ Pipeline επεξεργασίας εγγράφων
- ✅ Διεπαφή συνομιλίας με παραπομπές

**Χρόνος:** ~15-25 λεπτά
**Κόστος:** ~$80-150/μήνα (ανάπτυξη)

---

## 🏗️ Πρότυπα Αρχιτεκτονικής Πρακτόρων

### Πρότυπο 1: Ενιαίος Πράκτορας με Εργαλεία

Το πιο απλό πρότυπο πράκτορα - ένας πράκτορας που μπορεί να χρησιμοποιεί πολλαπλά εργαλεία.

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**Καλύτερο για:**
- Bots υποστήριξης πελατών
- Βοηθούς έρευνας
- Πράκτορες ανάλυσης δεδομένων

**AZD Template:** `azure-search-openai-demo`

### Πρότυπο 2: Πράκτορας RAG (Ανάκτηση-Εμπλουτισμένη Παραγωγή)

Ένας πράκτορας που ανακτά σχετικά έγγραφα πριν δημιουργήσει απαντήσεις.

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**Καλύτερο για:**
- Εταιρικές βάσεις γνώσης
- Συστήματα Q&A εγγράφων
- Έρευνα συμμόρφωσης και νομικών θεμάτων

**AZD Template:** `azure-search-openai-demo`

### Πρότυπο 3: Σύστημα Πολλαπλών Πρακτόρων

Πολλοί εξειδικευμένοι πράκτορες που συνεργάζονται για σύνθετες εργασίες.

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**Καλύτερο για:**
- Σύνθετη δημιουργία περιεχομένου
- Πολυβηματικές ροές εργασίας
- Εργασίες που απαιτούν διαφορετική ειδίκευση

**Μάθετε Περισσότερα:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Διαμόρφωση Εργαλείων Πρακτόρων

Οι πράκτορες γίνονται ισχυροί όταν μπορούν να χρησιμοποιούν εργαλεία. Δείτε πώς να διαμορφώσετε κοινά εργαλεία:

### Διαμόρφωση Εργαλείων σε Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Ορισμός προσαρμοσμένων εργαλείων
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# Δημιουργία πράκτορα με εργαλεία
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Διαμόρφωση Περιβάλλοντος

```bash
# Ρυθμίστε μεταβλητές περιβάλλοντος ειδικές για τον πράκτορα
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Αναπτύξτε με ενημερωμένη διαμόρφωση
azd deploy
```

---

## 📊 Παρακολούθηση Πρακτόρων

### Ενσωμάτωση Application Insights

Όλα τα πρότυπα πράκτορα AZD περιλαμβάνουν Application Insights για παρακολούθηση:

```bash
# Άνοιγμα πίνακα ελέγχου παρακολούθησης
azd monitor --overview

# Προβολή ζωντανών καταγραφών
azd monitor --logs

# Προβολή ζωντανών μετρήσεων
azd monitor --live
```

### Βασικοί Δείκτες προς Παρακολούθηση

| Δείκτης | Περιγραφή | Στόχος |
|--------|-------------|--------|
| Καθυστέρηση Απάντησης | Χρόνος για τη δημιουργία απάντησης | < 5 δευτερόλεπτα |
| Χρήση Token | Tokens ανά αίτημα | Παρακολούθηση για κόστος |
| Ποσοστό Επιτυχίας Κλήσεων Εργαλείων | % επιτυχημένων εκτελέσεων εργαλείων | > 95% |
| Ποσοστό Σφαλμάτων | Αποτυχημένα αιτήματα πράκτορα | < 1% |
| Ικανοποίηση Χρηστών | Βαθμολογίες ανατροφοδότησης | > 4.0/5.0 |

### Προσαρμοσμένη Καταγραφή για Πράκτορες

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 Παράγοντες Κόστους

### Εκτιμώμενο Μηνιαίο Κόστος ανά Πρότυπο

| Πρότυπο | Περιβάλλον Ανάπτυξης | Παραγωγή |
|---------|---------------------|----------|
| Ενιαίος Πράκτορας | $50-100 | $200-500 |
| Πράκτορας RAG | $80-150 | $300-800 |
| Πολλαπλοί Πράκτορες (2-3 πράκτορες) | $150-300 | $500-1,500 |
| Εταιρικό Σύστημα Πολλαπλών Πρακτόρων | $300-500 | $1,500-5,000+ |

### Συμβουλές Βελτιστοποίησης Κόστους

1. **Χρησιμοποιήστε GPT-4o-mini για απλές εργασίες**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Εφαρμόστε caching για επαναλαμβανόμενα ερωτήματα**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Ορίστε όρια tokens**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Περιορίστε το μήκος της απάντησης
   )
   ```

4. **Κλιμακώστε στο μηδέν όταν δεν χρησιμοποιείται**
   ```bash
   # Οι Container Apps κλιμακώνονται αυτόματα στο μηδέν
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Αντιμετώπιση Προβλημάτων Πρακτόρων

### Συνήθη Προβλήματα και Λύσεις

<details>
<summary><strong>❌ Ο πράκτορας δεν αποκρίνεται στις κλήσεις εργαλείων</strong></summary>

```bash
# Ελέγξτε αν τα εργαλεία έχουν καταχωριστεί σωστά
azd show

# Επαληθεύστε την ανάπτυξη του OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Ελέγξτε τα αρχεία καταγραφής του πράκτορα
azd monitor --logs
```

**Συνηθισμένοι λόγοι:**
- Ασυμφωνία υπογραφής συνάρτησης εργαλείου
- Λείπουν απαιτούμενα δικαιώματα
- Η διεύθυνση τελικού σημείου API δεν είναι προσβάσιμη
</details>

<details>
<summary><strong>❌ Υψηλή καθυστέρηση στις απαντήσεις του πράκτορα</strong></summary>

```bash
# Ελέγξτε το Application Insights για σημεία συμφόρησης
azd monitor --live

# Σκεφτείτε να χρησιμοποιήσετε ένα ταχύτερο μοντέλο
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Συμβουλές βελτιστοποίησης:**
- Χρησιμοποιήστε ροή απαντήσεων (streaming)
- Εφαρμόστε caching απαντήσεων
- Μειώστε το μέγεθος παραθύρου συμφραζομένων
</details>

<details>
<summary><strong>❌ Ο πράκτορας επιστρέφει λανθασμένες ή επινοημένες πληροφορίες</strong></summary>

```python
# Βελτίωσε με καλύτερες υποδείξεις συστήματος
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Πρόσθεσε ανάκτηση για τεκμηρίωση
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Βάσισε τις απαντήσεις σε έγγραφα
)
```
</details>

<details>
<summary><strong>❌ Σφάλματα υπέρβασης ορίου token</strong></summary>

```python
# Υλοποίηση διαχείρισης παραθύρου συμφραζομένων
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Προσεγγιστική εκτίμηση
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Πρακτικές Ασκήσεις

### Άσκηση 1: Αναπτύξτε έναν Βασικό Πράκτορα (20 λεπτά)

**Στόχος:** Αναπτύξτε τον πρώτο σας πράκτορα AI χρησιμοποιώντας το AZD

```bash
# Βήμα 1: Αρχικοποιήστε το πρότυπο
azd init --template get-started-with-ai-agents

# Βήμα 2: Συνδεθείτε στο Azure
azd auth login

# Βήμα 3: Αναπτύξτε
azd up

# Βήμα 4: Δοκιμάστε τον πράκτορα
# Ανοίξτε το URL που εμφανίζεται στην έξοδο

# Βήμα 5: Καθαρίστε
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Ο πράκτορας απαντά σε ερωτήσεις
- [ ] Μπορεί να έχει πρόσβαση στον πίνακα παρακολούθησης
- [ ] Οι πόροι καθαρίστηκαν επιτυχώς

### Άσκηση 2: Προσθέστε ένα Προσαρμοσμένο Εργαλείο (30 λεπτά)

**Στόχος:** Επεκτείνετε έναν πράκτορα με ένα προσαρμοσμένο εργαλείο

1. Αναπτύξτε το πρότυπο πράκτορα
2. Δημιουργήστε μια νέα συνάρτηση εργαλείου:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Κλήση API στην υπηρεσία καιρού
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Εγγράψτε το εργαλείο με τον πράκτορα
4. Δοκιμάστε ότι ο πράκτορας χρησιμοποιεί το νέο εργαλείο

**Κριτήρια Επιτυχίας:**
- [ ] Ο πράκτορας αναγνωρίζει ερωτήματα σχετικά με τον καιρό
- [ ] Το εργαλείο καλείται σωστά
- [ ] Η απάντηση περιλαμβάνει πληροφορίες καιρού

### Άσκηση 3: Δημιουργήστε έναν Πράκτορα RAG (45 λεπτά)

**Στόχος:** Δημιουργήστε έναν πράκτορα που απαντά σε ερωτήματα από τα έγγραφά σας

```bash
# Αναπτύξτε το πρότυπο RAG
azd init --template azure-search-openai-demo
azd up

# Ανεβάστε τα έγγραφά σας
# (Ακολουθήστε τον οδηγό εισαγωγής δεδομένων του προτύπου)

# Δοκιμάστε με ερωτήσεις συγκεκριμένου τομέα
```

**Κριτήρια Επιτυχίας:**
- [ ] Ο πράκτορας απαντά από τα ανεβασμένα έγγραφα
- [ ] Οι απαντήσεις περιλαμβάνουν παραπομπές
- [ ] Καμία επινόηση σε ερωτήματα εκτός πεδίου

---

## 📚 Επόμενα Βήματα

Τώρα που κατανοείτε τους πράκτορες AI, εξερευνήστε αυτά τα προχωρημένα θέματα:

| Θέμα | Περιγραφή | Σύνδεσμος |
|------|-----------|----------|
| **Συστήματα Πολλαπλών Πρακτόρων** | Δημιουργήστε συστήματα με πολλούς συνεργαζόμενους πράκτορες | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Πρότυπα Συντονισμού** | Μάθετε προτύπα ορχήστρωσης και επικοινωνίας | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Ανάπτυξη για Παραγωγή** | Ανάπτυξη πρακτόρων έτοιμη για την επιχείρηση | [Production AI Practices](production-ai-practices.md) |
| **Αξιολόγηση Πρακτόρων** | Δοκιμάστε και αξιολογήστε την απόδοση των πρακτόρων | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Επιπλέον Πόροι

### Επίσημη Τεκμηρίωση
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Πρότυπα AZD για Πράκτορες
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Κοινοτικοί Πόροι
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **Επόμενο Μάθημα**: [Πρακτικές AI για Παραγωγή](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, να γνωρίζετε ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από ανθρώπινο μεταφραστή. Δεν φέρουμε καμία ευθύνη για τυχόν παρερμηνείες ή παρεξηγήσεις που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->