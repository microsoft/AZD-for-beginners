# Το Πρώτο σας Έργο - Πρακτικό Σεμινάριο

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Εγκαθίδρυση & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Εγκατάσταση & Ρύθμιση](installation.md)
- **➡️ Επόμενο**: [Φέρε τη Δική σου Εφαρμογή](bring-your-own-app.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: AI-Πρώτη Ανάπτυξη](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Εισαγωγή

Καλώς ήλθατε στο πρώτο σας έργο Azure Developer CLI! Θα αναπτύξετε μια εφαρμογή todo με React frontend, Node.js API και Azure Cosmos DB. Το πρότυπο διατηρεί το ιστορικό όνομα `todo-nodejs-mongo`· η τρέχουσα υποδομή του χρησιμοποιεί το Cosmos DB για NoSQL, οπότε ελέγξτε το κατεβασμένο README και `infra/` αντί να συμπεράνετε το API βάσης δεδομένων από το όνομα.

> Εξετάστηκε σε σύγκριση με `azd 1.37.2` και το δημόσιο πρότυπο τον Νοέμβριο 2026. Τα παραδείγματα παρακάτω χρησιμοποιούν Bash∙ η εξαγωγή JSON απαιτεί επίσης `jq`. Οι αναπτύξεις Azure επιφέρουν χρεώσεις και δεν εκτελέστηκαν κατά την ανασκόπηση.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτό το σεμινάριο, θα:
- Κατανοήσετε τη ροή εργασιών αρχικοποίησης έργου azd χρησιμοποιώντας πρότυπα
- Καταλάβετε τη δομή έργου Azure Developer CLI και τα αρχεία διαμόρφωσης
- Εκτελέσετε πλήρη ανάπτυξη εφαρμογής στο Azure με παροχή υποδομής
- Εφαρμόσετε ενημερώσεις εφαρμογής και στρατηγικές επανανάπτυξης
- Διαχειριστείτε πολλαπλά περιβάλλοντα για ανάπτυξη και σταδιοποίηση
- Εφαρμόσετε πρακτικές καθαρισμού πόρων και διαχείρισης κόστους

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση, θα μπορείτε να:
- Αρχικοποιήσετε και να διαμορφώσετε έργα azd από πρότυπα ανεξάρτητα
- Πλοηγηθείτε και να τροποποιήσετε δομές έργων azd αποτελεσματικά
- Αναπτύξετε πλήρεις εφαρμογές στο Azure με μεμονωμένες εντολές
- Εντοπίσετε κοινά προβλήματα ανάπτυξης και θέματα πιστοποίησης
- Διαχειριστείτε πολλαπλά περιβάλλοντα Azure για διαφορετικά στάδια ανάπτυξης
- Εφαρμόσετε ροές εργασιών συνεχούς ανάπτυξης για ενημερώσεις εφαρμογής

## Ξεκινώντας

### Λίστα Ελέγχου Προαπαιτούμενων
- ✅ Azure Developer CLI εγκατεστημένο ([Οδηγός Εγκατάστασης](installation.md))
- ✅ Πιστοποίηση AZD ολοκληρωμένη με `azd auth login`
- ✅ Git εγκατεστημένο στο σύστημά σας
- ✅ Node.js 22 LTS (ή υποστηριζόμενη έκδοση απαιτούμενη από το κατεβασμένο πρότυπο)
- ✅ Visual Studio Code (προτεινόμενο)

Πριν προχωρήσετε, εκτελέστε τον ελεγκτή ρύθμισης από τη ρίζα του αποθετηρίου:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Επιβεβαιώστε τη Ρύθμισή σας
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Επιβεβαιώστε προαιρετική πιστοποίηση Azure CLI

```bash
az account show
```

### Ελέγξτε την έκδοση Node.js
```bash
node --version
```

## Βήμα 1: Επιλέξτε και Αρχικοποιήστε ένα Πρότυπο

Ας ξεκινήσουμε με ένα δημοφιλές πρότυπο εφαρμογής todo που περιλαμβάνει frontend React και backend Node.js API.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Τι Μόλις Συμβαίνει;
- Κατεβάστηκε ο κώδικας προτύπου στον τοπικό σας φάκελο
- Δημιουργήθηκε αρχείο `azure.yaml` με ορισμούς υπηρεσιών
- Ρυθμίστηκε κώδικας υποδομής στον φάκελο `infra/`
- Δημιουργήθηκε περιβάλλον διαμόρφωσης

## Βήμα 2: Εξερευνήστε τη Δομή του Έργου

Ας δούμε τι δημιούργησε για εμάς azd:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Θα δείτε:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Βασικά Αρχεία για Κατανόηση

**azure.yaml** - Η καρδιά του έργου azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Ορισμός υποδομής:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Βήμα 3: Εξατομικεύστε το Έργο σας (Προαιρετικό)

Πριν την ανάπτυξη, μπορείτε να εξατομικεύσετε την εφαρμογή:

### Τροποποιήστε το Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Κάντε μια απλή αλλαγή:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Διαμορφώστε Μεταβλητές Περιβάλλοντος
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Αυτές οι δύο προσαρμοσμένες τιμές δείχνουν μόνο τοπική αποθήκευση. Το αρχικό πρότυπο δεν χρησιμοποιεί `WEBSITE_TITLE` ή `API_VERSION`, οπότε δεν αλλάζουν την εφαρμογή. Η σαφής επεξεργασία πηγής πιο πάνω αλλάζει τον εμφανιζόμενο τίτλο.

## Βήμα 4: Αναπτύξτε στο Azure

Τώρα το συναρπαστικό κομμάτι - αναπτύξτε τα πάντα στο Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Τι Συμβαίνει Κατά την Ανάπτυξη;

Η ροή εργασιών παρέχει υποδομή και πακετάρει/αναπτύσσει κώδικα. Η ακριβής σειρά μπορεί να προσαρμοστεί μέσω `workflows.up` στο `azure.yaml`· αυτό το πρότυπο καθορίζει πρώτα την παροχή και μετά την ανάπτυξη. Μην βασίζεστε σε μια καθολική σειρά φάσεων για κάθε πρότυπο.

### Αναμενόμενη Έξοδος
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Βήμα 5: Δοκιμάστε την Εφαρμογή σας

### Πρόσβαση στην Εφαρμογή σας
Κάντε κλικ στο URL που δίνεται στην έξοδο ανάπτυξης ή αποκτήστε το οποτεδήποτε:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Δοκιμή Εφαρμογής Todo
1. **Προσθέστε μια εργασία** - Κάντε κλικ στο "Προσθήκη Todo" και εισάγετε εργασία
2. **Σημειώστε ως ολοκληρωμένη** - Επιλέξτε ολοκληρωμένες εργασίες
3. **Διαγράψτε εργασίες** - Αφαιρέστε todos που δεν χρειάζεστε πια

### Παρακολουθήστε την Εφαρμογή σας
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Επιβεβαιώστε την Ανάπτυξή σας

Πριν συνεχίσετε, κάντε αυτή τη γρήγορη λίστα ελέγχου για να επιβεβαιώσετε ότι όλα λειτουργούν — μην υποθέσετε ότι το "ανάπτυξη επιτυχής" σημαίνει "η εφαρμογή δουλεύει":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Η ανάπτυξη επιβεβαιώνεται όταν:**
- ✅ `azd show` καταγράφει ένα προσβάσιμο URL τελικού σημείου
- ✅ Το URL ανοίγει στον περιηγητή χωρίς λάθη
- ✅ Οι βασικές λειτουργίες δουλεύουν (προσθήκη/ολοκλήρωση/διαγραφή todo)
- ✅ `azd monitor --logs` εμφανίζει αιτήματα χωρίς απρόβλεπτα σφάλματα

Αν κάποιος έλεγχος αποτύχει, μεταβείτε στο [Κεφάλαιο 7: Αντιμετώπιση Προβλημάτων](../chapter-07-troubleshooting/README.md).

## Βήμα 6: Κάντε Αλλαγές και Επαναναπτύξτε

Ας κάνουμε μια αλλαγή και να δούμε πόσο εύκολο είναι να ενημερώσουμε:

### Τροποποιήστε το API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Προσθέστε μια προσαρμοσμένη κεφαλίδα απάντησης:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Αναπτύξτε Μόνο τις Αλλαγές Κώδικα
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Βήμα 7: Διαχείριση Πολλαπλών Περιβαλλόντων

Δημιουργήστε περιβάλλον σταδιοποίησης για να δοκιμάσετε αλλαγές πριν την παραγωγή:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Σύγκριση Περιβάλλοντος
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Βήμα 8: Καθαρισμός Πόρων

Όταν τελειώσετε με τα πειράματα, καθαρίστε για να αποφύγετε συνεχιζόμενες χρεώσεις:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Παραδοσιακή Εφαρμογή vs. Εφαρμογή με Τεχνητή Νοημοσύνη: Ίδια Ροή Εργασιών

Μόλις αναπτύξατε μια παραδοσιακή διαδικτυακή εφαρμογή. Αλλά τι θα γινόταν αν θέλατε να αναπτύξετε μια εφαρμογή με τεχνητή νοημοσύνη — όπως μια εφαρμογή συνομιλίας υποστηριζόμενη από Microsoft Foundry Models;

Τα καλά νέα: **η ροή εργασιών είναι η ίδια.**

| Βήμα | Παραδοσιακή Εφαρμογή Todo | Εφαρμογή Συνομιλίας AI |
|------|-------------------------|-------------------------|
| Αρχικοποίηση (κενός φάκελος) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Πιστοποίηση | `azd auth login` | `azd auth login` |
| Ανάπτυξη | `azd up` | `azd up` |
| Παρακολούθηση | `azd monitor` | `azd monitor` |
| Καθαρισμός | `azd down --force --purge` | `azd down --force --purge` |

Οι εντολές κύκλου ζωής είναι ίδιες, αλλά τα προαπαιτούμενα διαφέρουν. Ένα πρότυπο AI μπορεί να απαιτεί πρόσβαση σε μοντέλο, περιφερειακό όριο, εισαγωγή δεδομένων και επιπλέον διαμόρφωση. Διαβάστε το README πριν την ανάπτυξη· το `azd up` δεν μπορεί να παράσχει λείπουσες άδειες ή όρια.

Αυτός είναι ο βασικός κανόνας του azd: **μία ροή εργασιών, κάθε φόρτο εργασίας.** Οι δεξιότητες που εξασκηθήκατε σε αυτό το σεμινάριο — αρχικοποίηση, ανάπτυξη, παρακολούθηση, επανανάπτυξη και καθαρισμός — ισχύουν εξίσου για εφαρμογές AI και πράκτορες.

---

## Τι Μάθατε

Συγχαρητήρια! Επιτυχώς:
- ✅ Αρχικοποιήσατε ένα έργο azd από πρότυπο
- ✅ Εξερευνήσατε τη δομή του έργου και βασικά αρχεία
- ✅ Αναπτύξατε μια πλήρη εφαρμογή στο Azure
- ✅ Κάνατε αλλαγές κώδικα και επανεγκαταστήσατε
- ✅ Διαχειριστήκατε πολλαπλά περιβάλλοντα
- ✅ Καθαρίσατε πόρους

## 🎯 Ασκήσεις Επιβεβαίωσης Δεξιοτήτων

### Άσκηση 1: Αναπτύξτε Ένα Διαφορετικό Πρότυπο (15 λεπτά)
**Στόχος**: Επίδειξη δεξιότητας στην αρχικοποίηση azd init και στη ροή εργασιών ανάπτυξης

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Η εφαρμογή αναπτύσσεται χωρίς σφάλματα
- [ ] Υπάρχει πρόσβαση στο URL της εφαρμογής σε περιηγητή
- [ ] Η εφαρμογή λειτουργεί σωστά (προσθήκη/αφαίρεση todos)
- [ ] Όλοι οι πόροι καθαρίστηκαν επιτυχώς

### Άσκηση 2: Εξατομίκευση Διαμόρφωσης (20 λεπτά)
**Στόχος**: Εκπαίδευση στην τοπική αποθήκευση τιμών περιβάλλοντος χωρίς να τη μπερδεύουμε με εκτέλεση διαμόρφωσης

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκε επιτυχώς προσαρμοσμένο περιβάλλον
- [ ] Ορίστηκαν και ανακτώνται μεταβλητές περιβάλλοντος
- [ ] `azd env get-value APP_TITLE` εκτυπώνει `My Custom Todo App`
- [ ] Μπορεί να εξηγηθεί γιατί αυτές οι τιμές δεν αλλάζουν την αρχική εφαρμογή εκτός αν τις χρησιμοποιεί ο κώδικας/υποδομή

### Άσκηση 3: Ροή Εργασιών Πολλαπλών Περιβαλλόντων (25 λεπτά)
**Στόχος**: Εξειδίκευση στη διαχείριση περιβαλλόντων και στρατηγικές ανάπτυξης

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκαν δύο περιβάλλοντα με διαφορετικές διαμορφώσεις
- [ ] Και τα δύο περιβάλλοντα αναπτύχτηκαν επιτυχώς
- [ ] Υπάρχει δυνατότητα εναλλαγής μεταξύ περιβαλλόντων με `azd env select`
- [ ] Οι μεταβλητές περιβάλλοντος διαφέρουν μεταξύ περιβαλλόντων
- [ ] Και τα δύο περιβάλλοντα καθαρίστηκαν επιτυχώς

## 📊 Η Πρόοδός σας

**Επενδυμένος Χρόνος**: ~60-90 λεπτά  
**Αποκτηθείσες Δεξιότητες**:
- ✅ Αρχικοποίηση έργου από πρότυπο
- ✅ Παροχή πόρων Azure
- ✅ Ροές εργασιών ανάπτυξης εφαρμογών
- ✅ Διαχείριση περιβαλλόντων
- ✅ Διαχείριση διαμόρφωσης
- ✅ Καθαρισμός πόρων και διαχείριση κόστους

**Επόμενο Επίπεδο**: Είστε έτοιμοι για τον [Οδηγό Διαμόρφωσης](../chapter-03-configuration/configuration.md) για να μάθετε προχωρημένα μοτίβα διαμόρφωσης!

## Αντιμετώπιση Συχνών Προβλημάτων

### Σφάλματα Πιστοποίησης
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Αποτυχίες Ανάπτυξης
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Συγκρούσεις Ονομάτων Πόρων
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Προβλήματα Θύρας/Δικτύου
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Επόμενα Βήματα

Τώρα που ολοκληρώσατε το πρώτο σας έργο, εξερευνήστε αυτά τα προχωρημένα θέματα:

### 1. Εξατομίκευση Υποδομής
- [Υποδομή ως Κώδικας](../chapter-04-infrastructure/provisioning.md)
- [Προσθήκη υποδομής βάσης δεδομένων](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Ρύθμιση CI/CD
- [Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md) - Πλήρεις ροές εργασιών CI/CD
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Διαμόρφωση pipeline

### 3. Καλές Πρακτικές Παραγωγής
- [Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md) - Ασφάλεια, απόδοση, και παρακολούθηση

### 4. Εξερευνήστε Περισσότερα Πρότυπα
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Πρόσθετοι Πόροι

### Υλικό Εκμάθησης
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Κέντρο Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Πλαίσιο Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Κοινότητα & Υποστήριξη
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Κοινότητα Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Πρότυπα & Παραδείγματα
- [Επίσημη Συλλογή Προτύπων](https://azure.github.io/awesome-azd/)
- [Συνεισφορές Κοινοτικού Προτύπου](https://github.com/Azure/awesome-azd)
- [Πηγή Προτύπου Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Συγχαρητήρια για την ολοκλήρωση του πρώτου σας έργου azd!** Τώρα είστε έτοιμοι να δημιουργήσετε και να αναπτύξετε καταπληκτικές εφαρμογές στο Azure με αυτοπεποίθηση.

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Εγκαθίδρυση & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Εγκατάσταση & Ρύθμιση](installation.md)
- **➡️ Επόμενο**: [Φέρε τη Δική σου Εφαρμογή](bring-your-own-app.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: AI-Πρώτη Ανάπτυξη](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->