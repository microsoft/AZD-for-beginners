# Ενσωμάτωση Microsoft Foundry με AZD

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - AI-Πρώτη Ανάπτυξη
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 1: Το Πρώτο Σου Έργο](../chapter-01-foundation/first-project.md)
- **➡️ Επόμενο**: [AI Πράκτορες](agents.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

## Επισκόπηση

Αυτός ο οδηγός δείχνει πώς να ενσωματώσετε τις υπηρεσίες Microsoft Foundry με το Azure Developer CLI (AZD) για απλοποιημένες αναπτύξεις εφαρμογών AI. Το Microsoft Foundry παρέχει μια ολοκληρωμένη πλατφόρμα για την κατασκευή, ανάπτυξη και διαχείριση εφαρμογών AI, ενώ το AZD απλοποιεί τη διαδικασία υποδομής και ανάπτυξης.

## Τι είναι το Microsoft Foundry;

Το Microsoft Foundry είναι η ενοποιημένη πλατφόρμα της Microsoft για την ανάπτυξη AI, που περιλαμβάνει:

- **Κατάλογος Μοντέλων**: Πρόσβαση σε σύγχρονα μοντέλα AI
- **Prompt Flow**: Οπτικός σχεδιαστής για ροές εργασίας AI
- **Microsoft Foundry Portal**: Ενσωματωμένο περιβάλλον ανάπτυξης για εφαρμογές AI
- **Επιλογές Ανάπτυξης**: Πολλαπλές επιλογές φιλοξενίας και κλιμάκωσης
- **Ασφάλεια και Προστασία**: Ενσωματωμένα χαρακτηριστικά υπεύθυνης AI

## AZD + Microsoft Foundry: Καλύτερα Μαζί

| Χαρακτηριστικό | Microsoft Foundry | Όφελος Ενσωμάτωσης AZD |
|---------|-----------------|------------------------|
| **Ανάπτυξη Μοντέλου** | Χειροκίνητη ανάπτυξη μέσω πύλης | Αυτοματοποιημένες, επαναλαμβανόμενες αναπτύξεις |
| **Υποδομή** | Διαμόρφωση έργου και πόρων | Ξεκίνα από `azure.yaml`; εξαγωγή Bicep ή Terraform αν χρειάζεται |
| **Διαχείριση Περιβάλλοντος** | Εστίαση σε ένα περιβάλλον | Πολλαπλά περιβάλλοντα (ανάπτυξη/δοκιμαστική/παραγωγή) |
| **Ενσωμάτωση CI/CD** | Υπηρεσίες ανάπτυξης και αξιολόγησης | Επαναχρησιμοποίηση διαμόρφωσης σε GitHub Actions ή Azure DevOps |
| **Διαχείριση Κόστους** | Βασική παρακολούθηση | Βελτιστοποίηση κόστους ανά περιβάλλον |

## Προαπαιτούμενα

- Συνδρομή Azure με κατάλληλες άδειες
- Azure Developer CLI 1.37.0 ή νεότερο για τη ροή εργασίας GA Foundry
- Πρόσβαση στις υπηρεσίες Microsoft Foundry Models
- Βασική εξοικείωση με το Microsoft Foundry

> **Ενημέρωση Foundry GA (2026-11-09):** Το πακέτο `microsoft.foundry` έφτασε την έκδοση 1.0 και τη γενική διαθεσιμότητα στις [5 Νοεμβρίου 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Η παρακάτω ανάλυση ακολουθεί αυτή την ανακοίνωση και τον σχετικό γρήγορο οδηγό του Microsoft Learn. Αυτή είναι ανασκόπηση τεκμηρίωσης, όχι ζωντανή επικύρωση ανάπτυξης. Προαιρετικά χαρακτηριστικά προεπισκόπησης και ανεξάρτητα κυκλοφορημένα πρόσθετα διατηρούν τη δική τους κατάσταση κυκλοφορίας.

**Μαθησιακά αποτελέσματα:** Εγκατάσταση του πακέτου GA, ανασκόπηση `azure.yaml` ενός πράκτορα, σύγκριση τοπικών και αναπτυγμένων αποκρίσεων, και εξήγηση ορίων αξιολόγησης, CI/CD και καθαρισμού. Για βήμα-βήμα ανάπτυξη πράκτορα, δείτε τον [οδηγό hosted-agent](#hosted-agent-walkthrough-ga). Τα παρακάτω αποσπάσματα πόρων καλύπτουν άλλα μοτίβα ενσωμάτωσης.

## Βασικά Μοτίβα Ενσωμάτωσης

**Πεδίο των παραδειγμάτων:** Το Bicep παρακάτω περιέχει εικονογραφικά αποσπάσματα πόρων, όχι πλήρες πρότυπο για ανάπτυξη. Το περιεχόμενο πρότυπο πρέπει να ορίζει ονόματα, `location`, αναφερόμενους πόρους, ταυτότητες, εξόδους και φιλοξενία εφαρμογής. Χρησιμοποιήστε ένα συνδεδεμένο δείγμα για σημείο εκκίνησης εκτελέσιμο. Τα παραδείγματα Bash απαιτούν ξεχωριστή πιστοποίηση Azure CLI από `azd auth login`.

### Μοτίβο 1: Ενσωμάτωση Microsoft Foundry Models

**Περίπτωση Χρήσης**: Ανάπτυξη εφαρμογών συνομιλίας με μοντέλα Azure OpenAI στο Microsoft Foundry

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

**Υποδομή (main.bicep):**
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

Ο καλών χρειάζεται συνδεδεμένη διαχειριζόμενη ταυτότητα και `Cognitive Services OpenAI User` σε επίπεδο λογαριασμού· η απενεργοποίηση κλειδιών δεν παρέχει πρόσβαση. Επιβεβαιώστε τη διαθεσιμότητα περιοχής/μοντέλου/SKU και το όριο πριν την ανάπτυξη.

### Μοτίβο 2: AI Αναζήτηση + Ενσωμάτωση RAG

**Περίπτωση Χρήσης**: Ανάπτυξη εφαρμογών παραγωγής εμπλουτισμένης ανάκτησης (RAG)

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

Δεν υπάρχει πόρος ARM `Microsoft.Search/searchServices/dataConnections` για αυτή την ενσωμάτωση. Ρυθμίστε ευρετήριο Search, πηγή δεδομένων, ευρετηριοποιητή/σετ δεξιοτήτων ή διανυσματοποιητή μέσω των υποστηριζόμενων API επιπέδου δεδομένων Search. Αν το Search καλεί μοντέλο ενσωμάτωσης, ενεργοποιήστε τη διαχειριζόμενη ταυτότητά του, εκχωρήστε το σχετικό ρόλο μοντέλου, και ρυθμίστε τη δεξιότητα ενσωμάτωσης/διανυσματοποίησης. Δείτε [ενσωματωμένη διανυσματοποίηση](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Μοτίβο 3: Ενσωμάτωση Ντοκουμέντων Έξυπνης Ανάλυσης

**Περίπτωση Χρήσης**: Ροές εργασίας επεξεργασίας και ανάλυσης εγγράφων

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

## 🔧 Μοτίβα Διαμόρφωσης

### Ρύθμιση Μεταβλητών Περιβάλλοντος

Εκτός από τις τεκμηριωμένες ρυθμίσεις AZD όπως `AZURE_LOCATION`, αυτά είναι **εισαγωγές ονομάτων προσαρμοσμένου προτύπου**. Δεν έχουν αποτέλεσμα εκτός αν το πρότυπο/εφαρμογή τα καταναλώνει μέσω παραμέτρων και αντιστοιχίσεων περιβάλλοντος κεντρικού υπολογιστή. Για `azure-search-openai-demo`, χρησιμοποιήστε τα πραγματικά του ονόματα όπως `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` και `AZURE_SEARCH_SERVICE_SKU` αντίστοιχα. Η χωρητικότητα μοντέλου δεν είναι SKU λογαριασμού.

**Διαμόρφωση Παραγωγής:**
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

**Διαμόρφωση Ανάπτυξης:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Ασφαλής Διαμόρφωση με Key Vault

Προτιμήστε Entra ID με απενεργοποιημένη τοπική πιστοποίηση κλειδιού. Το ακόλουθο είναι μόνο **παλαιότερη εναλλακτική πιστοποίησης με κλειδί** για εφαρμογές που απαιτούν κλειδιά: απαιτεί λογαριασμό με ενεργοποιημένη πιστοποίηση κλειδιού, ταυτότητα εφαρμογής συνδεδεμένη στη φιλοξενία της, και λειτουργική πρόσβαση/δικτύωση Key Vault. Μην συνδυάζετε ανάκτηση κλειδιού με `disableLocalAuth: true` και μην αναμένετε ότι κλήσεις με κλειδί θα λειτουργήσουν.

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

## Ροές Εργασίας Ανάπτυξης

### Επεκτάσεις AZD για Foundry

Για τη ροή εργασίας GA, εγκαταστήστε το πακέτο `microsoft.foundry` και όχι μεμονωμένα τις βασικές επεκτάσεις:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Το πακέτο εγκαθιστά πράκτορες, συνδέσεις, επιθεωρητή, έργα, ρουτίνες, δεξιότητες και εργαλειοθήκες. Δεν προσθέτει ομάδα εντολών `microsoft.foundry`. Αξιολογήσεις, σύνολα δεδομένων, λεπτομερής εκπαίδευση και προσαρμοσμένα μοντέλα εγκαθίστανται ξεχωριστά όταν χρειάζεται. Δείτε την [αναφορά συσκευασίας επεκτάσεων](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Οδηγός Hosted-Agent (GA)

Ένας **hosted agent** εκτελεί τον κώδικα του πράκτορα σας σε υπολογιστική μονάδα που διαχειρίζεται το Foundry. Αυτή η άσκηση χρησιμοποιεί το βασικό δείγμα API Απαντήσεων Πλαίσιο Python Πράκτορα ανάντη, όχι τα κλασικά αποσπάσματα SDK Agent Service σε άλλα μαθήματα.

#### 1. Προετοιμασία και αρχικοποίηση

Χρησιμοποιήστε έναν κενό κατάλογο έξω από αυτή την ανάληψη μαθήματος. Εγκαταστήστε Python 3.13 ή νεότερο και μια πρόσφατη [κυκλοφορία uv](https://docs.astral.sh/uv/getting-started/installation/). Για αυτόνομες εγκαταστάσεις uv, χρησιμοποιήστε `uv self update`. Ελέγξτε [δικαιώματα hosted-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), διαθεσιμότητα μοντέλου και ποσόστωση στη συνδρομή και την περιοχή πριν από την παροχή. Οι πόροι Azure και οι τοπικές κλήσεις μοντέλου επιβαρύνονται.

Ολοκληρώστε την εγκατάσταση `azd auth login` και πακέτου παραπάνω. Ο τοπικός δείγμα κώδικα χρησιμοποιεί `DefaultAzureCredential`· αν χρησιμοποιείτε διαπιστευτήρια Azure CLI, συνδεθείτε με `az login` χρησιμοποιώντας τον ίδιο λογαριασμό και νοικιαστή με το AZD. Η σύνδεση στο AZD μόνο δεν είναι σύνδεση Azure CLI.

Εκτελέστε αυτή την εντολή μόνο σε μία γραμμή στο Bash ή PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Επιλέξτε ένα νέο ή υπάρχον έργο Foundry και τη συνδρομή και περιοχή που προορίζονται. Για επαναχρησιμοποίηση ανάπτυξης μοντέλου, προσθέστε `--model-deployment <existing-deployment-name>` στην εντολή αρχικοποίησης **πριν την εκτελέσετε**, και επιλέξτε το υπάρχον έργο. Μείνετε στον κατάλογο που περιέχει το παραχθέν `azure.yaml` για τις υπόλοιπες εντολές.

#### 2. Ανασκόπηση ορισμού ανάπτυξης

Ανοίξτε `azure.yaml` και βρείτε αυτές τις ρυθμίσεις στο [ανάντη δείγμα](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Ρύθμιση | Τι να ελέγξετε |
|---------|---------------|
| `host: azure.ai.project` και `deployments` | Προοριζόμενο έργο Foundry και όνομα μοντέλου, έκδοση, SKU ανάπτυξης και χωρητικότητα |
| `host: azure.ai.agent` και `project` | Hosted agent και ο κατάλογος που περιέχει τον κώδικά του |
| `codeConfiguration` | Χρόνος εκτέλεσης Python και σημείο εισόδου· το δείγμα χρησιμοποιεί `python_3_13` και `main.py` |
| `uses` | Εξάρτηση από την υπηρεσία έργου Foundry |
| `container.resources` | Κατανομή CPU και μνήμης, αν και ο κώδικας εκτελείται απομακρυσμένα |
| `env` | Χαρτογράφηση ανάπτυξης μοντέλου και `PYTHONNOUSERSITE: "1"` για απενεργοποίηση φόρτωσης πακέτων από τον χρήστη |
| `infra.provider` | `microsoft.foundry`, που συνθέτει την απαιτούμενη υποδομή |

Δεσμεύστε τον ανασκοπημένο `azure.yaml` και κώδικα πράκτορα μαζί. Δεν απαιτείται χειρόγραφη υποδομή για εκκίνηση· όταν χρειάζεστε επεξεργάσιμα αρχεία παροχής, ακολουθήστε τον [εξαγωγή υποδομής](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) για Bicep ή Terraform και συνεχίστε να χρησιμοποιείτε `azd provision`. Μην δεσμεύετε διαπιστευτήρια ή κατάσταση περιβάλλοντος `.azure/`.

#### 3. Παροχή και δοκιμή τοπικά

```bash
azd provision
azd ai agent run
```

Η παροχή μπορεί να δημιουργήσει ελλείπουσες αναπτύξεις μοντέλων **ακόμα και σε επαναχρησιμοποιημένο έργο**. Ελέγξτε τα prompts μοντέλου και επιλέξτε διαθέσιμο τύπο ανάπτυξης online όπως Global Standard ή Data Zone Standard· η ποσόστωση και η υποστήριξη ανά περιοχή διαφέρουν.

Η τοπική εκτέλεση προετοιμάζει τις εξαρτήσεις και ανοίγει το **Agent Inspector**, όπου μπορείτε να ελέγξετε αιτήσεις, απαντήσεις και δραστηριότητα εργαλείων/μοντέλων. Κρατήστε το ανοιχτό και ανοίξτε δεύτερο τερματικό στον ίδιο κατάλογο έργου:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Έλεγχος:** Επιβεβαιώστε ότι λαμβάνετε σχετική απάντηση και μπορείτε να ελέγξετε τη σχετική τοπική δραστηριότητα. Η τοπική εκτέλεση εξακολουθεί να καλεί την ανάπτυξη μοντέλου Azure σας· δεν είναι εκτός σύνδεσης ή δωρεάν δοκιμή. Χρησιμοποιήστε συνθετικά prompts και αποφύγετε να αποκαλύπτετε μυστικά ή ευαίσθητα δεδομένα στην έξοδο του επιθεωρητή.

#### 4. Ανάπτυξη και σύγκριση

Σταματήστε την τοπική εκτέλεση με Ctrl+C όταν τελειώσετε. Πριν από απομακρυσμένη κλήση, ρυθμίστε ή επαληθεύστε τη [σύνδεση Application Insights και δικαιώματα ανάγνωσης ιχνών](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) του έργου.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

Σε λειτουργία ανάπτυξης κώδικα, το AZD ανεβάζει τον πηγαίο κώδικα για απομακρυσμένη κατασκευή Foundry· δεν χρειάζεστε τοπικό container build γι’ αυτή τη διαδρομή. Η έξοδος ανάπτυξης παρέχει συνδέσμους playground και endpoint. Επιβεβαιώστε απόκριση από τον αναπτυγμένο πράκτορα και τα ίχνη του στο cloud· τα τοπικά συμβάντα επιθεωρητή από μόνα τους δεν αποδεικνύουν ότι δουλεύει το cloud tracing.

Για επόμενες αλλαγές, ανασκοπήστε τη ρυθμιζόμενη υποστήριξη hosted-agent με `azd deploy --preview`. Ροή καταγραφών με `azd ai agent monitor --follow`, ή διαγνώστε προβλήματα ρύθμισης και πρόσβασης με `azd ai agent doctor`. Μια προεπισκόπηση ανάπτυξης δεν είναι πλήρης ανασκόπηση υποδομής ή ασφάλειας.

#### 5. Προσθέστε έναν επαναλαμβανόμενο έλεγχο ποιότητας

Εγκαταστήστε την ανεξάρτητα κυκλοφορημένη επέκταση αξιολογήσεων, στη συνέχεια δημιουργήστε προσχέδια τεστ:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Περιγράψτε τη συμπεριφορά που επιθυμείτε για τον πράκτορα και επιλέξτε **Dataset and evaluator**, μετά **Turn**. Εξετάστε και επεξεργαστείτε τις δημιουργημένες περιπτώσεις και το βαθμολόγιο, συμπεριλαμβανομένης μίας περίπτωσης μη υποστηριζόμενης ερώτησης, πριν ρυθμίσετε την αξιολόγηση:

```bash
azd ai eval init --name quality
```

Επιλέξτε το ανασκοπημένο dataset και rubric και επιβεβαιώστε την ανάπτυξη μοντέλου κριτή. Εξετάστε `evals/azure.eval.yaml` και την αναφορά της υπηρεσίας αξιολόγησης σε `azure.yaml`, μετά καταχωρίστε τα assets και εκτελέστε:

```bash
azd up
azd ai eval run start --eval quality
```

Εξετάστε βαθμολογίες και αποτυχημένες ή λαθεμένες περιπτώσεις· μια ολοκληρωμένη αξιολόγηση δεν είναι αυτόματα πέρασμα ποιότητας. Η παραγωγή και η βαθμολόγηση επιβαρύνονται μοντέλο. Δεσμεύστε μη μυστική διαμόρφωση, datasets και rubrics ώστε οι συνεργάτες να συγκρίνουν αλλαγές. Το `azd ai agent optimize` μπορεί να επαναχρησιμοποιήσει μια συμβατή αξιολόγηση ως βάση, αλλά εξετάστε τους υποψηφίους πριν αναπτύξετε ρητά. Δείτε [πόρτες ποιότητας και μετανάστευση](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) για παλαιότερα έργα και CI.

#### 6. Επαναχρησιμοποίηση της ροής εργασίας σε CI/CD

Μετά από επιτυχή `azd up`, εκτελέστε `azd pipeline config` και ανασκοπήστε την παραγόμενη ροή εργασίας GitHub Actions ή Azure DevOps. Εγκαταστήστε `microsoft.foundry` στον runner, συν `azure.ai.evaluations` αν εκτελείτε αξιολογήσεις. Διατηρήστε ρυθμίσεις checkout, σύνδεσης και περιβάλλοντος· η εγκατάσταση από μόνη της δεν πιστοποιεί τη ροή.

Χρησιμοποιήστε ξεχωριστό περιβάλλον AZD ανά στάδιο, δώστε στο pipeline την απαιτούμενη ταυτότητα με δικαιώματα πόρων και Foundry, και κρατήστε διαπιστευτήρια στα μυστικά pipeline ή χρησιμοποιήστε ομοσπονδιακή ταυτότητα. Δεσμεύστε αρχεία αξιολόγησης και επαληθεύστε ότι η ταυτότητα έχει πρόσβαση σε αναφερόμενα datasets/κριτές. Δείτε το [παράδειγμα pipeline μαθήματος](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) και [οδηγό Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Καθαρισμός σκόπιμα

Για **νέο έργο που δημιουργήθηκε από αυτό το περιβάλλον**, επανεξετάστε τους πόρους που παραθέτει `azd down` πριν επιβεβαιώσετε: διαγράφει την ομάδα πόρων και όλα όσα περιέχει.

Για **επαναχρησιμοποιημένο έργο**, `azd down` αφήνει το έργο, hosted agent και άλλους πόρους στη θέση τους. Αφαιρέστε μόνο ανεπιθύμητους πόρους που κατέχετε χρησιμοποιώντας τις [οδηγίες γρήγορου καθαρισμού](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); μην διαγράψετε κοινή ομάδα πόρων για να καθαρίσετε μια άσκηση.

**Έλεγχος ολοκλήρωσης:** Εξηγήστε ποιες ρυθμίσεις ελέγχουν τοπική και cloud συμπεριφορά, δείξτε τοπικές και αναπτυγμένες αποκρίσεις, ανασκοπήστε αποτέλεσμα αξιολόγησης, και εντοπίστε ποιοι πόροι μένουν μετά τον καθαρισμό.

### Προαιρετικό: Δημιουργία με το Microsoft Foundry Skill

Εγκαταστήστε το [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) για τον κεντρικό υπολογιστή πράκτορα κώδικα σας, μετά ανοίξτε έναν ξεχωριστό κενό φάκελο. Ζητήστε να δημιουργήσει το βασικό δείγμα API Απαντήσεων Πλαίσιο Python Πράκτορα σε λειτουργία ανάπτυξης κώδικα, εξηγήστε το παραχθέν `azure.yaml`, και προτείνετε συνδρομή, περιοχή, έργο και ανάπτυξη μοντέλου. Απαιτήστε έγκριση **πριν από τη δημιουργία πόρων Azure**, ζητήστε τοπικό τεστ, και σταματήστε πριν την ανάπτυξη. Ανασκοπήστε την έξοδό του και συνεχίστε με τα βήματα ανάπτυξης παραπάνω μόνο όταν είστε έτοιμοι.

Για υπάρχοντα έργα, `--template`/`-t` αντικαθιστά την παρωχημένη ορθογραφία `--manifest`/`-m`· η αλλαγή της σημαίας δεν μεταφέρει παλαιά manifests ή εμφωλευμένη ρύθμιση πράκτορα. Δείτε το [AI CLI reference](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Ανάπτυξη με Μια Εντολή

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Αναπτύξεις κατά Περιβάλλον

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

## Παρακολούθηση και Παρατηρησιμότητα

### Ενσωμάτωση Application Insights

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

Αυτό προμηθεύει έναν πόρο Insights, όχι τηλεμετρικό εξοπλισμό. Μόλις η εφαρμογή σας εκπέμψει εξωτερικά spans κλήσης μοντέλου, τρέξτε αυτό το ενδεικτικό ερώτημα στα Application Insights Logs (προσαρμόστε το φίλτρο στα πραγματικά ονόματα των spans σας):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Παρακολούθηση Κόστους

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

Χρησιμοποιήστε έναν πραγματικό παραλήπτη και επιβεβαιώστε τα δικαιώματα ορίου τιμολόγησης. Ένας προϋπολογισμός στέλνει ειδοποιήσεις· δεν είναι όριο δαπανών.

## 🔐 Καλές Πρακτικές Ασφαλείας

### Ρύθμιση Διαχειριζόμενης Ταυτότητας

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

### Ασφάλεια Δικτύου

Αυτό το τμήμα του endpoint χρειάζεται επίσης ιδιωτική ζώνη DNS/ομάδα, συνδέσεις VNet, συνδεσιμότητα εφαρμογής σε VNet και ρητή πολιτική δημόσιας πρόσβασης. Η δημιουργία μόνο ιδιωτικού endpoint δεν απενεργοποιεί τη δημόσια πρόσβαση.

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

## Βελτιστοποίηση Απόδοσης

### Στρατηγικές Cache

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

Το Azure Cache for Redis Basic/Standard/Premium είναι σε [διαδρομή συνταξιοδότησης](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq)· χρησιμοποιήστε Azure Managed Redis για νέες αναπτύξεις και ακολουθήστε τις τρέχουσες οδηγίες προτύπου/πιστοποίησης. Περιορίστε τις προσωρινά αποθηκευμένες απαντήσεις AI ανά εξουσιοδότηση, μοντέλο/οδηγίες και έκδοση δεδομένων, με λήξη· μη μοιράζεστε ποτέ ιδιωτικές απαντήσεις χρησιμοποιώντας μόνο το κείμενο ερωτήματος.

### Ρύθμιση Αυτόματης Κλιμάκωσης

**Μερικός πόρος:** συγχωνεύστε αυτές τις ρυθμίσεις κλιμάκωσης/εισόδου σε μια πλήρη Container App με διαχειριζόμενο περιβάλλον, εικόνα κοντέινερ και όρια πόρων. Περισσότερα αντίγραφα δεν αυξάνουν το όριο μοντέλου.

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

## Επίλυση Συνηθισμένων Προβλημάτων

### Πρόβλημα 1: Υπέρβαση Ορίου OpenAI

**Συμπτώματα:**
- Η ανάπτυξη αποτυγχάνει με σφάλματα ορίου
- Σφάλματα 429 στα αρχεία καταγραφής της εφαρμογής

**Λύσεις:**
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

Η μεταβλητή capacity παραπάνω εφαρμόζεται μόνο σε προσαρμοσμένο πρότυπο που τη χρησιμοποιεί. Για το δείγμα RAG, χρησιμοποιήστε `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Μη μεταβάλλετε `AZURE_LOCATION` για να μετακινήσετε υπάρχοντες πόρους· δημιουργήστε ξεχωριστό περιβάλλον για νέα περιοχή και σχεδιάστε μετανάστευση/καθαρισμό.

### Πρόβλημα 2: Αποτυχίες Πιστοποίησης

**Συμπτώματα:**
- Σφάλματα 401/403 κατά την κλήση υπηρεσιών AI
- Μηνύματα "Απαγορεύεται η πρόσβαση"

**Λύσεις:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Πρόβλημα 3: Προβλήματα Ανάπτυξης Μοντέλου

**Συμπτώματα:**
- Μοντέλα μη διαθέσιμα στην ανάπτυξη
- Αποτυχίες συγκεκριμένων εκδόσεων μοντέλου

**Λύσεις:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Παραδείγματα Προτύπων

Αυτά είναι εναλλακτικές, όχι διαδοχικές εντολές. Ξεκινήστε κάθε ένα σε ξεχωριστό άδειο φάκελο. Ο ρητός προορισμός `.` κρατά την αρχικοποίηση στον τρέχοντα φάκελό σας· διαφορετικά, το τρέχον AZD μπορεί να δημιουργήσει ένα φάκελο παιδί ονοματισμένο με το πρότυπο χωρίς να αλλάξει ο τρέχων κατάλογος εργασίας του κελύφους σας.

### Εφαρμογή RAG Chat (Python)

**Αποθετήριο**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Υπηρεσίες**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Περιγραφή**: Μια εφαρμόγή rαγ αναφοράς chat για ερωτήσεις σε έγγραφά σας, με ανάκτηση Azure AI Search. Εξετάστε τα υποστηριζόμενα μοντέλα του τρέχοντος δείγματος, τις προαιρετικές δυνατότητες, τις οδηγίες κόστους και την προετοιμασία παραγωγής πριν τη χρήση· η ανάπτυξη δείγματος δεν καθιστά μια εφαρμογή έτοιμη για παραγωγή.

**Γρήγορη Έναρξη**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Εφαρμογή RAG Chat (.NET)

**Αποθετήριο**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Υπηρεσίες**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Περιγραφή**: Το αντίστοιχο .NET/C# του δείγματος Python RAG chat. Χτισμένο με ASP.NET Core Minimal API και Blazor WebAssembly frontend. Περιλαμβάνει φωνητική συνομιλία, υποστήριξη όρασης GPT-4o-mini, και συνοδευτικό πελάτη .NET MAUI Blazor Hybrid για desktop/mobile.

**Γρήγορη Έναρξη**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Εφαρμογή RAG Chat (Java)

**Αποθετήριο**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Υπηρεσίες**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Περιγραφή**: Έκδοση Java του δείγματος RAG chat χρησιμοποιώντας Langchain4J για ορχήστρωση AI. Υποστηρίζει μικροσυγκείμενη αρχιτεκτονική ενεργοποιούμενη από γεγονότα, πολλαπλές στρατηγικές αναζήτησης (κείμενο, διάνυσμα, υβριδική), μεταφόρτωση εγγράφων με Azure Document Intelligence, και ανάπτυξη σε Azure Container Apps ή Azure Kubernetes Service.

**Γρήγορη Έναρξη**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot με Microsoft Foundry

**Αποθετήριο**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Υπηρεσίες**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Περιγραφή**: Ολοκληρωμένος λιανικός RAG copilot χρησιμοποιώντας Microsoft Foundry και Prompty. Ένα chatbot λιανικής Contoso Outdoor που βασίζει απαντήσεις σε κατάλογο προϊόντων και δεδομένα παραγγελιών πελατών. Επιδεικνύει ολόκληρη τη ροή GenAIOps — πρωτότυπο με Prompty, αξιολόγηση με AI-sυνηγμένους αξιολογητές, και ανάπτυξη μέσω AZD σε Container Apps.

**Γρήγορη Έναρξη**:
```bash
azd init --template contoso-chat .
azd up
```

### Εφαρμογή Πολλαπλών Πρακτόρων Δημιουργικής Γραφής

**Αποθετήριο**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Υπηρεσίες**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Περιγραφή**: Δείγμα πολλαπλών πρακτόρων που επιδεικνύει ορχήστρωση AI agent με Prompty. Χρησιμοποιεί έναν πράκτορα έρευνας (Bing Grounding στο Azure AI Agent Service), έναν πράκτορα προϊόντος (Azure AI Search), έναν πράκτορα συγγραφέα και έναν επεξεργαστή για συνεργατική παραγωγή καλά ερευνημένων άρθρων. Περιλαμβάνει CI/CD με αξιολόγηση σε GitHub Actions.

**Γρήγορη Έναρξη**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Αποθετήριο**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Υπηρεσίες**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Περιγραφή**: Πλήρως serverless chatbot RAG χρησιμοποιώντας LangChain.js με Azure Functions για το API και Azure Static Web Apps για φιλοξενία. Χρησιμοποιεί την Azure Cosmos DB ως κατάστημα διανυσμάτων και βάση δεδομένων ιστορικού συνομιλιών. Υποστηρίζει τοπική ανάπτυξη με Ollama για δοκιμές χωρίς κόστος.

**Γρήγορη Έναρξη**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Επιταχυντής Λύσης Chat με Τα Δεδομένα Σας

**Αποθετήριο**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Υπηρεσίες**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search με Cosmos DB, ή PostgreSQL με pgvector

**Περιγραφή**: Επιταχυντής συνομιλίας βασισμένος σε έγγραφα με παραπομπές. Το τρέχον δείγμα φιλοξενεί frontend React, backend FastAPI, και λειτουργικό ingestion worker σε Container Apps· επιλογές orchestrator είναι Agent Framework και LangGraph. Επιλογές βάσης δεδομένων/ανάκτησης επιλέγονται κατά την ανάπτυξη. Είναι σημείο εκκίνησης, όχι πλήρες σύστημα παραγωγής· μην υποθέτετε ότι παλαιότερα App Service, Semantic Kernel, ή Prompt Flow περιγραφές ισχύουν για την τρέχουσα προεπιλογή.

**Γρήγορη Έναρξη**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Ορχήστρωση Multi-Agent MCP

**Αποθετήριο**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Υπηρεσίες**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Περιγραφή**: Αναφορά εφαρμογής για ορχήστρωση AI πολλαπλών πρακτόρων χρησιμοποιώντας τρία frameworks (LangChain.js, LlamaIndex.TS, και Microsoft Agent Framework). Διαθέτει MCP (Model Context Protocol) διακομιστές σε τέσσερις γλώσσες αναπτυγμένους ως serverless Azure Container Apps με παρακολούθηση OpenTelemetry.

**Γρήγορη Έναρξη**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Περισσότερα πρότυπα**: Επισκεφθείτε το [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) για διαθέσιμα πρότυπα σε γλώσσες και σενάρια. Κάθε παράδειγμα συνδέσμου είναι εξωτερικό αποθετήριο, όχι τοπικό παράδειγμα από το μάθημα· ελέγξτε τις τρέχουσες προϋποθέσεις και οδηγίες παραγωγής πριν την ανάπτυξη.

## Επόμενα Βήματα

1. **Δοκιμάστε τα Παραδείγματα**: Ξεκινήστε με ένα προετοιμασμένο πρότυπο που ταιριάζει στην περίπτωσή σας
2. **Προσαρμόστε στις Ανάγκες σας**: Τροποποιήστε την υποδομή και τον κώδικα εφαρμογής
3. **Προσθέστε Παρακολούθηση**: Υλοποιήστε πλήρη παρατηρησιμότητα
4. **Βελτιστοποιήστε Κόστη**: Ρυθμίστε προσεκτικά για τον προϋπολογισμό σας
5. **Ασφαλίστε την Ανάπτυξή σας**: Υλοποιήστε μοτίβα ασφάλειας επιχειρήσεων
6. **Κλιμακώστε για Παραγωγή**: Προσθέστε δυνατότητες πολλαπλών περιοχών και υψηλής διαθεσιμότητας

## 🎯 Πρακτικές Ασκήσεις

### Άσκηση 1: Αναπτύξτε την Εφαρμογή Συνομιλίας Microsoft Foundry Models (30 λεπτά)
**Στόχος**: Αναπτύξτε και δοκιμάστε μια εφαρμογή συνομιλίας AI αναφοράς

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

**Κριτήρια Επιτυχίας:**
- [ ] Η ανάπτυξη ολοκληρώνεται χωρίς σφάλματα ορίου
- [ ] Μπορεί να πρόσβαση στην διεπαφή συνομιλίας στον περιηγητή
- [ ] Μπορεί να θέσει ερωτήσεις και να λάβει απαντήσεις υποβοηθούμενες από AI
- [ ] Το Application Insights εμφανίζει δεδομένα τηλεμετρίας
- [ ] Οι πόροι καθαρίστηκαν επιτυχώς

**Κόστος:** Εξετάστε τον τρέχοντα οδηγό κόστους και τις επιλεγμένες SKU πριν την ανάπτυξη. Η χρέωση συνεχίζεται μέχρι να διαγραφούν οι πόροι· δεν υπάρχει σταθερή εκτίμηση 30 λεπτών για κάθε ρύθμιση.

### Άσκηση 2: Ρυθμίστε Ανάπτυξη Πολλαπλών Μοντέλων (45 λεπτά)
**Στόχος**: Αναπτύξτε πολλαπλά μοντέλα AI με διαφορετικές ρυθμίσεις

**Αφετηρία:** Λογαριασμός Azure OpenAI και ένα module υποδομής ομάδας πόρων AZD που μπορεί να καλέσει αυτό το αρχείο. Δημιουργήστε `infra/ai-models.bicep` με το ακόλουθο περιεχόμενο χρησιμοποιώντας τον επεξεργαστή σας. Δεν αναπτύσσεται αυτόματα απλά επειδή βρίσκεται κάτω από `infra/`.

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

Από το module που έχει εύρος ομάδας πόρων κατόχου του λογαριασμού, προσθέστε μια κλήση module (προσαρμόστε το όνομα συμβόλου στον πραγματικό λογαριασμό σας):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Μην δηλώνετε τις ίδιες αναπτύξεις και στα δύο modules. Εάν το σημείο εισόδου AZD είναι σε εύρος συνδρομής, καλέστε αυτό από το παιδικό του module σε εύρος ομάδας πόρων και προσαρμόστε τη σχετική διαδρομή. Δημιουργήστε το περιέχον module με `az bicep build --file <path-to-containing-module>`, μετά:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Κριτήρια Επιτυχίας:**
- [ ] Επιτυχής ανάπτυξη πολλαπλών μοντέλων
- [ ] Εφαρμογή διαφορετικών ρυθμίσεων χωρητικότητας
- [ ] Πρόσβαση στα μοντέλα μέσω API
- [ ] Δυνατότητα κλήσης και των δύο μοντέλων από την εφαρμογή

### Άσκηση 3: Υλοποίηση Παρακολούθησης Κόστους (20 λεπτά)
**Στόχος**: Ρυθμίστε ειδοποιήσεις προϋπολογισμού και παρακολούθηση κόστους

**Αφετηρία:** Το πρότυπο προϋπολογισμού παραπάνω και ένα module υποδομής σε εύρος ομάδας πόρων. Προσθέστε αυτόν τον πόρο χρησιμοποιώντας τον επεξεργαστή σας· περάστε `budgetStartDate` από τον χάρτη παραμέτρων σας (μην διπλοκαταχωρείτε την παράμετρο αν έχει δηλωθεί ήδη). Αντικαταστήστε τον παραλήπτη και επιβεβαιώστε ότι έχετε δικαίωμα εγγραφής στον προϋπολογισμό.

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

Αναμενόμενο: η απάντηση περιέχει `amount: 200`, και τα δύο όρια, και τον παραλήπτη σας. Ελέγξτε το Cost Management στο portal για πραγματικές χρεώσεις· τα δεδομένα κόστους είναι καθυστερημένα και δεν απαιτείται να ενεργοποιηθεί ειδοποίηση κατά τη διάρκεια σύντομης άσκησης.

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργία ειδοποίησης προϋπολογισμού στο Azure
- [ ] Διαμόρφωση ειδοποιήσεων με email
- [ ] Δυνατότητα προβολής δεδομένων κόστους στο Azure Portal
- [ ] Κατάλληλη ρύθμιση ορίων προϋπολογισμού

## 💡 Συχνές Ερωτήσεις

<details>
<summary><strong>Πώς μειώνω τα κόστη Microsoft Foundry Models κατά την ανάπτυξη;</strong></summary>

1. **Ελέγξτε τις τιμές**: Δεν υπάρχει καθολικό δωρεάν όριο 50,000 tokens μηνιαίως για τα μοντέλα Azure OpenAI
2. **Καθορίστε κατάλληλη χωρητικότητα**: Η χωρητικότητα `10` συνήθως αντιστοιχεί σε 10,000 TPM για αυτά τα Standard μοντέλα κειμένου, όχι 10 TPM. Μείωση του ορίου αυτού δεν μειώνει τις τιμές ανά token
3. **Χρησιμοποιήστε azd down**: Διαγράψτε πόρους που δεν χρησιμοποιείτε ενεργά (δεν είναι απελευθέρωση πόρων)
4. **Κάντε Cache Απαντήσεων**: Εφαρμόστε Redis cache για επαναλαμβανόμενα ερωτήματα
5. **Χρησιμοποιήστε Prompt Engineering**: Μειώστε τη χρήση tokens με αποδοτικά prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Ποια είναι η διαφορά μεταξύ Microsoft Foundry Models και OpenAI API;</strong></summary>

**Microsoft Foundry Models**:
- Ασφάλεια και συμμόρφωση επιχείρησης
- Ενσωμάτωση σε ιδιωτικό δίκτυο
- Εγγυήσεις SLA
- Πιστοποίηση με διαχειριζόμενη ταυτότητα
- Διαθέσιμα υψηλότερα όρια

**OpenAI API**: Ξεχωριστός πάροχος/API με τη δική του διαθεσιμότητα μοντέλων, τιμολόγηση, πιστοποίηση, και επιλογές σύνδεσης επιχειρήσεων. Συγκρίνετε τις τρέχουσες προσφορές αντί να υποθέτετε ότι είναι μόνο δημόσιο δίκτυο ή ότι πάντα προσφέρει μοντέλα πρώτα.

Επιλέξτε με βάση τις απαιτήσεις του οργανισμού σας· τα Azure-ειδικά παραδείγματα με διαχειριζόμενη ταυτότητα και ιδιωτικό σύνδεσμο στο μάθημα αφορούν μόνο υπηρεσίες που φιλοξενούνται στο Azure, όχι κάθε μοντέλο/πάροχο στον κατάλογο Foundry.
</details>

<details>
<summary><strong>Πώς χειρίζομαι σφάλματα υπέρβασης ορίου Microsoft Foundry Models;</strong></summary>

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
<summary><strong>Μπορώ να χρησιμοποιήσω τα δικά μου δεδομένα με Microsoft Foundry Models;</strong></summary>

Ναι! Χρησιμοποιήστε **Azure AI Search** για RAG (Retrieval Augmented Generation):

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

Δείτε το πρότυπο [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Πώς ασφαλίζω τα τελικά σημεία μοντέλων AI;</strong></summary>

**Καλές Πρακτικές**:
1. Χρησιμοποιήστε Διαχειριζόμενη Ταυτότητα (χωρίς κλειδιά API)
2. Ενεργοποιήστε Ιδιωτικά Τελικά Σημεία
3. Διαμορφώστε ομάδες ασφάλειας δικτύου
4. Εφαρμόστε περιορισμό ρυθμού
5. Χρησιμοποιήστε το Azure Key Vault για μυστικά

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

## Κοινότητα και Υποστήριξη

- **Microsoft Foundry Discord**: [#κανάλι Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Θέματα και συζητήσεις](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Επίσημη τεκμηρίωση](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Δεξιότητες Microsoft Foundry στο skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Εγκαταστήστε τις δεξιότητες πρακτόρων Azure + Foundry στον επεξεργαστή σας με `npx skills add microsoft/github-copilot-for-azure`

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στο AI
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 1: Το Πρώτο σας Έργο](../chapter-01-foundation/first-project.md)
- **➡️ Επόμενο**: [Πρακτορες AI](agents.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

**Χρειάζεστε Βοήθεια;** Ελάτε στις συζητήσεις της κοινότητάς μας ή ανοίξτε ένα θέμα στο αποθετήριο. Η κοινότητα Azure AI + AZD είναι εδώ για να σας βοηθήσει να πετύχετε!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->