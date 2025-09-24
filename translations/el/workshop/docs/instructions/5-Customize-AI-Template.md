<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-24T21:27:59+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "el"
}
-->
# 5. Προσαρμογή Προτύπου

!!! tip "ΜΕΧΡΙ ΤΟ ΤΕΛΟΣ ΑΥΤΗΣ ΤΗΣ ΕΝΟΤΗΤΑΣ ΘΑ ΜΠΟΡΕΙΤΕ ΝΑ"

    - [ ] Εξερευνήσετε τις προεπιλεγμένες δυνατότητες του AI Agent
    - [ ] Προσθέσετε AI Search με τον δικό σας δείκτη
    - [ ] Ενεργοποιήσετε και αναλύσετε μετρικές Tracing
    - [ ] Εκτελέσετε μια αξιολόγηση
    - [ ] Εκτελέσετε έναν έλεγχο red-teaming
    - [ ] **Εργαστήριο 5: Δημιουργία Σχεδίου Προσαρμογής**

---

## 5.1 Δυνατότητες AI Agent

!!! success "Ολοκληρώσαμε αυτό στο Εργαστήριο 01"

- **Αναζήτηση Αρχείων**: Ενσωματωμένη αναζήτηση αρχείων της OpenAI για ανάκτηση γνώσης
- **Παραπομπές**: Αυτόματη αναφορά πηγών στις απαντήσεις
- **Προσαρμόσιμες Οδηγίες**: Τροποποίηση της συμπεριφοράς και της προσωπικότητας του agent
- **Ενσωμάτωση Εργαλείων**: Επεκτάσιμο σύστημα εργαλείων για προσαρμοσμένες δυνατότητες

---

## 5.2 Επιλογές Ανάκτησης Γνώσης

!!! task "Για να ολοκληρωθεί αυτό, πρέπει να κάνουμε αλλαγές και να επαναπροσαρμόσουμε"    
    
    ```bash title=""
    # Ορισμός μεταβλητών περιβάλλοντος
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Μεταφόρτωση δεδομένων και δημιουργία του δείκτη μου

    ```

---

**Αναζήτηση Αρχείων OpenAI (Προεπιλογή):**

- Ενσωματωμένο στην υπηρεσία Azure AI Agent
- Αυτόματη επεξεργασία και ευρετηρίαση εγγράφων
- Δεν απαιτείται πρόσθετη ρύθμιση

**Azure AI Search (Προαιρετικό):**

- Υβριδική σημασιολογική και διανυσματική αναζήτηση
- Διαχείριση προσαρμοσμένων δεικτών
- Προηγμένες δυνατότητες αναζήτησης
- Απαιτεί `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Για να ολοκληρωθεί αυτό, πρέπει να κάνουμε αλλαγές και να επαναπροσαρμόσουμε"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Ενσωμάτωση OpenTelemetry
- Παρακολούθηση αιτημάτων/απαντήσεων
- Μετρικές απόδοσης
- Διαθέσιμο στο portal AI Foundry

**Καταγραφή:**

- Καταγραφές εφαρμογής στα Container Apps
- Δομημένη καταγραφή με αναγνωριστικά συσχέτισης
- Προβολή καταγραφών σε πραγματικό χρόνο και ιστορικά

---

## 5.4 [Αξιολόγηση Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Τοπική Αξιολόγηση:**

- Ενσωματωμένοι αξιολογητές για εκτίμηση ποιότητας
- Προσαρμοσμένα σενάρια αξιολόγησης
- Μετρήσεις απόδοσης

**Συνεχής Παρακολούθηση:**

- Αυτόματη αξιολόγηση ζωντανών αλληλεπιδράσεων
- Παρακολούθηση μετρικών ποιότητας
- Ανίχνευση υποβάθμισης απόδοσης

**Ενσωμάτωση CI/CD:**

- Ροή εργασίας GitHub Actions
- Αυτοματοποιημένες δοκιμές και αξιολογήσεις
- Στατιστική σύγκριση αποτελεσμάτων

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Αυτοματοποιημένος έλεγχος ασφάλειας
- Εκτίμηση κινδύνου για συστήματα AI
- Αξιολόγηση ασφάλειας σε πολλαπλές κατηγορίες

**Αυθεντικοποίηση:**

- Διαχειριζόμενη Ταυτότητα για υπηρεσίες Azure
- Προαιρετική αυθεντικοποίηση Azure App Service
- Εναλλακτική βασική αυθεντικοποίηση για ανάπτυξη

!!! quote "ΜΕΧΡΙ ΤΟ ΤΕΛΟΣ ΑΥΤΟΥ ΤΟΥ ΕΡΓΑΣΤΗΡΙΟΥ ΘΑ ΕΧΕΤΕ"
    - [ ] Ορίσει τις απαιτήσεις του σεναρίου σας
    - [ ] Προσαρμόσει μεταβλητές περιβάλλοντος (config)
    - [ ] Προσαρμόσει οδηγίες agent (task)
    - [ ] Αναπτύξει το προσαρμοσμένο πρότυπο (app)
    - [ ] Ολοκληρώσει εργασίες μετά την ανάπτυξη (manual)
    - [ ] Εκτελέσει μια δοκιμαστική αξιολόγηση

Αυτό το παράδειγμα δείχνει πώς να προσαρμόσετε το πρότυπο για μια επιχειρηματική περίπτωση λιανικής με δύο εξειδικευμένους agents και πολλαπλές αναπτύξεις μοντέλων.

---

## 5.6 Προσαρμόστε το για Εσάς!

### 5.6.1 Απαιτήσεις Σεναρίου

#### **Αναπτύξεις Agent:** 

   - Shopper Agent: Βοηθά τους πελάτες να βρουν και να συγκρίνουν προϊόντα
   - Loyalty Agent: Διαχειρίζεται ανταμοιβές και προσφορές πελατών

#### **Αναπτύξεις Μοντέλων:**

   - `gpt-4.1`: Κύριο μοντέλο συνομιλίας
   - `o3`: Μοντέλο λογικής για σύνθετα ερωτήματα
   - `gpt-4.1-nano`: Ελαφρύ μοντέλο για απλές αλληλεπιδράσεις
   - `text-embedding-3-large`: Υψηλής ποιότητας ενσωματώσεις για αναζήτηση

#### **Δυνατότητες:**

   - Ενεργοποιημένο tracing και monitoring
   - AI Search για κατάλογο προϊόντων
   - Πλαίσιο αξιολόγησης για διασφάλιση ποιότητας
   - Red teaming για επαλήθευση ασφάλειας

---

### 5.6.2 Υλοποίηση Σεναρίου

#### 5.6.2.1 Προ-Ανάπτυξη Ρύθμιση

Δημιουργήστε ένα script ρύθμισης (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Set environment name
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configure region (choose based on model availability)
azd env set AZURE_LOCATION "eastus2"

# Enable all optional services
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configure primary chat model (gpt-4o as closest available to gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configure embedding model for enhanced search
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Set agent name (will create first agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configure search index
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2 Οδηγίες Agent

Δημιουργήστε `custom-agents/shopper-agent-instructions.md`:

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

Δημιουργήστε `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3 Script Ανάπτυξης

Δημιουργήστε `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Validate prerequisites
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Set up environment
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Check quota in selected region
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

# Deploy infrastructure and application
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capture deployment outputs
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Get the web app URL
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 AI Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in AI Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4 Μετά την Ανάπτυξη Ρύθμιση

Δημιουργήστε `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Get deployment information
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instructions for manual configuration
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to AI Foundry portal: https://ai.azure.com
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
- Tracing: Available in AI Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3 Δοκιμή και Επαλήθευση

Δημιουργήστε `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verify environment variables are set
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test web application availability
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

# Run evaluation if configured
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
2. Create the second agent (Loyalty Agent) in AI Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Αναμενόμενα Αποτελέσματα

Ακολουθώντας αυτόν τον οδηγό υλοποίησης, θα έχετε:

1. **Αναπτυγμένη Υποδομή:**

      - Έργο AI Foundry με αναπτύξεις μοντέλων
      - Container Apps που φιλοξενούν την εφαρμογή web
      - Υπηρεσία AI Search για κατάλογο προϊόντων
      - Application Insights για παρακολούθηση

2. **Αρχικός Agent:**

      - Shopper Agent ρυθμισμένος με βασικές οδηγίες
      - Ενεργοποιημένη δυνατότητα αναζήτησης αρχείων
      - Ρυθμισμένο tracing και monitoring

3. **Έτοιμο για Προσαρμογή:**

      - Πλαίσιο για προσθήκη Loyalty Agent
      - Πρότυπα προσαρμοσμένων οδηγιών
      - Σενάρια δοκιμής και επαλήθευσης
      - Ρύθμιση παρακολούθησης και αξιολόγησης

4. **Ετοιμότητα για Παραγωγή:**

      - Έλεγχος ασφάλειας με red teaming
      - Παρακολούθηση απόδοσης
      - Πλαίσιο αξιολόγησης ποιότητας
      - Κλιμακούμενη αρχιτεκτονική

Αυτό το παράδειγμα δείχνει πώς το πρότυπο AZD μπορεί να επεκταθεί και να προσαρμοστεί για συγκεκριμένα επιχειρηματικά σενάρια, διατηρώντας τις βέλτιστες πρακτικές για ασφάλεια, παρακολούθηση και κλιμακούμενη ανάπτυξη.

---

