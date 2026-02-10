# 5. Προσαρμογή ενός Προτύπου

!!! tip "ΜΕΧΡΙ ΤΟ ΤΕΛΟΣ ΑΥΤΗΣ ΤΗΣ ΕΝΟΤΗΤΑΣ ΘΑ ΜΠΟΡΕΙΤΕ"

    - [ ] Εξερευνήσατε τις προεπιλεγμένες δυνατότητες του AI Agent
    - [ ] Προσθέσατε AI Search με το δικό σας ευρετήριο
    - [ ] Ενεργοποιήσατε και αναλύσατε τα μετρικά ιχνηλάτησης
    - [ ] Εκτελέσατε μια εκτέλεση αξιολόγησης
    - [ ] Εκτελέσατε μια σάρωση red-teaming
    - [ ] **Εργαστήριο 5: Κατασκευάσατε ένα Σχέδιο Προσαρμογής** 

---

## 5.1 Δυνατότητες του AI Agent

!!! success "Ολοκληρώσαμε αυτό στο Εργαστήριο 01"

- **Αναζήτηση Αρχείων**: Ενσωματωμένη αναζήτηση αρχείων του OpenAI για ανάκτηση γνώσης
- **Αναφορές**: Αυτόματη απόδοση πηγών στις απαντήσεις
- **Προσαρμόσιμες Οδηγίες**: Τροποποίηση της συμπεριφοράς και της προσωπικότητας του agent
- **Ενσωμάτωση Εργαλείων**: Επεκτάσιμο σύστημα εργαλείων για προσαρμοσμένες δυνατότητες

---

## 5.2 Επιλογές Ανάκτησης Γνώσης

!!! task "Για να ολοκληρώσετε αυτό πρέπει να κάνετε αλλαγές και να αναπτύξετε ξανά"    
    
    ```bash title=""
    # Set environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Upload data and create my index

    ```

---

**OpenAI File Search (Προεπιλογή):**

- Ενσωματωμένο στους Foundry Agents
- Αυτόματη επεξεργασία εγγράφων και δεικτοδότηση
- Δεν απαιτείται πρόσθετη διαμόρφωση

**Azure AI Search (Προαιρετικό):**

- Υβριδική σημασιολογική και αναζήτηση διανυσμάτων
- Διαχείριση προσαρμοσμένου ευρετηρίου
- Προηγμένες δυνατότητες αναζήτησης
- Απαιτεί `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Ιχνηλάτηση & Παρακολούθηση](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Για να ολοκληρώσετε αυτό πρέπει να κάνετε αλλαγές και να αναπτύξετε ξανά"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

Ιχνηλάτηση:

- Ενσωμάτωση OpenTelemetry
- Παρακολούθηση αιτήσεων/απαντήσεων
- Μετρικά απόδοσης
- Διαθέσιμο στο Microsoft Foundry portal

Καταγραφή:

- Αρχεία καταγραφής εφαρμογής σε Container Apps
- Δομημένη καταγραφή με correlation IDs
- Προβολή καταγραφών σε πραγματικό χρόνο και ιστορικών καταγραφών

---

## 5.4 [Αξιολόγηση Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Τοπική Αξιολόγηση:**

- Ενσωματωμένοι αξιολογητές για αξιολόγηση ποιότητας
- Προσαρμοσμένα σενάρια αξιολόγησης
- Συγκριτική αξιολόγηση απόδοσης

**Συνεχής Παρακολούθηση:**

- Αυτόματη αξιολόγηση ζωντανών αλληλεπιδράσεων
- Παρακολούθηση μετρικών ποιότητας
- Ανίχνευση παλινδρόμησης απόδοσης

**Ενσωμάτωση CI/CD:**

- Ροή εργασίας GitHub Actions
- Αυτοματοποιημένα τεστ και αξιολόγηση
- Στατιστική σύγκριση δοκιμών

---

## 5.5 [Πράκτορας AI Red Teaming](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Αυτοματοποιημένη σάρωση ασφαλείας
- Αξιολόγηση κινδύνου για συστήματα AI
- Αξιολόγηση ασφάλειας σε πολλαπλές κατηγορίες

**Αυθεντικοποίηση:**

- Managed Identity για υπηρεσίες Azure
- Προαιρετική αυθεντικοποίηση Azure App Service
- Fallback βασικής αυθεντικοποίησης για ανάπτυξη



!!! quote "ΜΕΧΡΙ ΤΟ ΤΕΛΟΣ ΑΥΤΟΥ ΤΟΥ ΕΡΓΑΣΤΗΡΙΟΥ ΘΑ ΠΡΕΠΕΙ ΝΑ ΕΧΕΤΕ"
    - [ ] Ορίσατε τις απαιτήσεις του σεναρίου σας
    - [ ] Εξατομικεύσατε μεταβλητές περιβάλλοντος (config)
    - [ ] Εξατομικεύσατε τις οδηγίες του agent (task)
    - [ ] Αναπτύξατε το εξατομικευμένο πρότυπο (app)
    - [ ] Ολοκληρώσατε εργασίες μετά την ανάπτυξη (manual)
    - [ ] Εκτελέσατε μια δοκιμαστική αξιολόγηση

Αυτό το παράδειγμα επιδεικνύει την προσαρμογή του προτύπου για μια επιχειρηματική περίπτωση χρήσης στη λιανική με δύο εξειδικευμένους πράκτορες και πολλαπλές αναπτύξεις μοντέλων.

---

## 5.6 Προσαρμόστε το για εσάς!

### 5.6.1. Απαιτήσεις Σεναρίου

#### **Αναπτύξεις Πρακτόρων:** 

   - Shopper Agent: Βοηθά τους πελάτες να βρουν και να συγκρίνουν προϊόντα
   - Loyalty Agent: Διαχειρίζεται τα προγράμματα ανταμοιβών και τις προωθήσεις πελατών

#### **Αναπτύξεις Μοντέλων:**

   - `gpt-4.1`: Κύριο μοντέλο συνομιλίας
   - `o3`: Μοντέλο λογικής για πολύπλοκα ερωτήματα
   - `gpt-4.1-nano`: Ελαφρύ μοντέλο για απλές αλληλεπιδράσεις
   - `text-embedding-3-large`: Υψηλής ποιότητας embeddings για αναζήτηση

#### **Δυνατότητες:**

   - Ενεργοποίηση ιχνηλάτησης και παρακολούθησης
   - AI Search για το κατάλογο προϊόντων
   - Πλαίσιο αξιολόγησης για διασφάλιση ποιότητας
   - Red teaming για επικύρωση ασφάλειας

---

### 5.6.2 Υλοποίηση Σεναρίου


#### 5.6.2.1. Ρυθμίσεις Προ-Ανάπτυξης

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Ορίστε το όνομα του περιβάλλοντος
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Διαμορφώστε την περιοχή (επιλέξτε με βάση τη διαθεσιμότητα του μοντέλου)
azd env set AZURE_LOCATION "eastus2"

# Ενεργοποιήστε όλες τις προαιρετικές υπηρεσίες
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Διαμορφώστε το κύριο μοντέλο συνομιλίας (gpt-4o ως το πιο κοντινό διαθέσιμο στο gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Διαμορφώστε το μοντέλο ενσωμάτωσης για βελτιωμένη αναζήτηση
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Ορίστε το όνομα του πράκτορα (θα δημιουργήσει τον πρώτο πράκτορα)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Διαμορφώστε το ευρετήριο αναζήτησης
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Οδηγίες Πρακτόρων

Create `custom-agents/shopper-agent-instructions.md`:

```markdown
# Shopper Agent Instructions

You are a helpful shopping assistant for an enterprise retail company. Your role is to:

1. **Product Discovery**: Help customers find products that match their needs
2. **Comparison**: Provide detailed product comparisons with pros/cons
3. **Recommendations**: Suggest complementary products and alternatives
4. **Inventory**: Check product availability and delivery options

## Guidelines:
- Always provide citations from the product catalog
- Be conversational and helpful
- Ask clarifying questions to understand customer needs
- Mention relevant promotions when appropriate
- Escalate complex warranty or return questions to human agents

## Knowledge Base:
You have access to our complete product catalog including specifications, pricing, reviews, and inventory levels.
```

Create `custom-agents/loyalty-agent-instructions.md`:

```markdown
# Loyalty Agent Instructions

You are a customer loyalty specialist focused on maximizing customer satisfaction and retention. Your responsibilities include:

1. **Rewards Management**: Explain point values, redemption options, and tier benefits
2. **Promotions**: Identify applicable discounts and special offers
3. **Program Navigation**: Help customers understand loyalty program features
4. **Account Support**: Assist with account-related questions and updates

## Guidelines:
- Prioritize customer satisfaction and retention
- Explain complex program rules in simple terms
- Proactively identify opportunities for customers to save money
- Celebrate customer milestones and achievements
- Connect customers with shopper agent for product questions

## Knowledge Base:
You have access to loyalty program rules, current promotions, customer tier information, and reward catalogs.
```

---

#### 5.6.2.3: Script Ανάπτυξης

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Επαλήθευση προαπαιτούμενων
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Ρύθμιση περιβάλλοντος
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Έλεγχος ποσοστώσεων στην επιλεγμένη περιοχή
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4o: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Ανάπτυξη υποδομής και εφαρμογής
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Καταγραφή αποτελεσμάτων ανάπτυξης
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Λήψη του URL της web εφαρμογής
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 Microsoft Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in Microsoft Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: Ρυθμίσεις Μετά την Ανάπτυξη

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Λήψη πληροφοριών ανάπτυξης
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Οδηγίες για χειροκίνητη διαμόρφωση
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to Microsoft Foundry portal: https://ai.azure.com
   - Navigate to your project
   - Select Agents tab
   - Edit the existing agent
   - Update instructions with content from custom-agents/shopper-agent-instructions.md

2. **Create Loyalty Agent:**
   - In Agents tab, click 'Create Agent'
   - Name: 'loyalty-agent'
   - Model: Use same deployment as shopper agent
   - Instructions: Use content from custom-agents/loyalty-agent-instructions.md
   - Enable file search tool
   - Save and note the Agent ID

3. **Upload Knowledge Base:**
   - Prepare product catalog files (JSON/CSV format)
   - Upload to both agents' file search
   - Or configure Azure AI Search index

4. **Test Configuration:**
   - Test shopper agent with product queries
   - Test loyalty agent with rewards questions
   - Verify citations and search functionality

📊 Monitoring Setup:
- Tracing: Available in Microsoft Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: Δοκιμές και Επικύρωση

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Επαλήθευση ότι οι μεταβλητές περιβάλλοντος έχουν οριστεί
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Δοκιμή διαθεσιμότητας της εφαρμογής web
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')
if [ ! -z "$APP_URL" ]; then
    echo "🌐 Testing web application at: $APP_URL"
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ Web application is responding"
    else
        echo "❌ Web application returned status: $HTTP_STATUS"
    fi
else
    echo "❌ Could not retrieve web application URL"
fi

# Εκτέλεση αξιολόγησης εάν έχει ρυθμιστεί
if [ -f "evals/evaluate.py" ]; then
    echo "📊 Running agent evaluation..."
    cd evals
    python -m pip install -r ../src/requirements.txt
    python -m pip install azure-ai-evaluation
    python evaluate.py
    cd ..
fi

echo "
🎯 Deployment validation complete!

Next steps:
1. Access the web application and test basic functionality
2. Create the second agent (Loyalty Agent) in Microsoft Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Αναμενόμενα Αποτελέσματα

Αφού ακολουθήσετε αυτόν τον οδηγό υλοποίησης, θα έχετε:

1. **Αναπτυγμένη Υποδομή:**

      - Έργο Microsoft Foundry με αναπτύξεις μοντέλων
      - Container Apps που φιλοξενούν την web εφαρμογή
      - Υπηρεσία AI Search για τον κατάλογο προϊόντων
      - Application Insights για παρακολούθηση

2. **Αρχικός Πράκτορας:**

      - Shopper Agent ρυθμισμένος με βασικές οδηγίες
      - Ενεργοποιημένη δυνατότητα αναζήτησης αρχείων
      - Ρυθμισμένη ιχνηλάτηση και παρακολούθηση

3. **Έτοιμο για Προσαρμογή:**

      - Πλαίσιο για προσθήκη Loyalty Agent
      - Πρότυπα προσαρμοσμένων οδηγιών
      - Σενάρια δοκιμών και επικύρωσης
      - Διαμόρφωση παρακολούθησης και αξιολόγησης

4. **Ετοιμότητα Παραγωγής:**

      - Σάρωση ασφάλειας με red teaming
      - Παρακολούθηση απόδοσης
      - Πλαίσιο αξιολόγησης ποιότητας
      - Κλιμακώσιμη αρχιτεκτονική

Αυτό το παράδειγμα δείχνει πώς το πρότυπο AZD μπορεί να επεκταθεί και να προσαρμοστεί για συγκεκριμένα επιχειρησιακά σενάρια διατηρώντας ταυτόχρονα βέλτιστες πρακτικές για ασφάλεια, παρακολούθηση και κλιμακωσιμότητα.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα προέλευσής του πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική μετάφραση από άνθρωπο. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->