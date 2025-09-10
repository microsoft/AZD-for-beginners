<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:14:35+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "el"
}
-->
# Το Πρώτο Σας Έργο - Εργαστηριακός Οδηγός

## Εισαγωγή

Καλώς ήρθατε στο πρώτο σας έργο με το Azure Developer CLI! Αυτός ο ολοκληρωμένος εργαστηριακός οδηγός σας παρέχει μια πλήρη περιήγηση στη δημιουργία, ανάπτυξη και διαχείριση μιας εφαρμογής πλήρους στοίβας στο Azure χρησιμοποιώντας το azd. Θα εργαστείτε με μια πραγματική εφαρμογή todo που περιλαμβάνει frontend React, backend API Node.js και βάση δεδομένων MongoDB.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτόν τον οδηγό, θα:
- Μάθετε τη διαδικασία αρχικοποίησης έργου azd χρησιμοποιώντας πρότυπα
- Κατανοήσετε τη δομή έργου και τα αρχεία ρυθμίσεων του Azure Developer CLI
- Εκτελέσετε πλήρη ανάπτυξη εφαρμογής στο Azure με παροχή υποδομής
- Εφαρμόσετε στρατηγικές ενημέρωσης και επαναδιάθεσης εφαρμογών
- Διαχειριστείτε πολλαπλά περιβάλλοντα για ανάπτυξη και δοκιμές
- Εφαρμόσετε πρακτικές καθαρισμού πόρων και διαχείρισης κόστους

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα μπορείτε να:
- Αρχικοποιείτε και ρυθμίζετε έργα azd από πρότυπα ανεξάρτητα
- Πλοηγείστε και τροποποιείτε αποτελεσματικά τις δομές έργων azd
- Αναπτύσσετε εφαρμογές πλήρους στοίβας στο Azure με μία εντολή
- Εντοπίζετε και διορθώνετε κοινά προβλήματα ανάπτυξης και αυθεντικοποίησης
- Διαχειρίζεστε πολλαπλά περιβάλλοντα Azure για διαφορετικά στάδια ανάπτυξης
- Εφαρμόζετε συνεχείς ροές ανάπτυξης για ενημερώσεις εφαρμογών

## Ξεκινώντας

### Λίστα Προαπαιτούμενων
- ✅ Εγκατεστημένο Azure Developer CLI ([Οδηγός Εγκατάστασης](installation.md))
- ✅ Εγκατεστημένο και αυθεντικοποιημένο Azure CLI
- ✅ Εγκατεστημένο Git στο σύστημά σας
- ✅ Node.js 16+ (για αυτόν τον οδηγό)
- ✅ Visual Studio Code (συνιστάται)

### Επαλήθευση Ρύθμισης
```bash
# Check azd installation
azd version
```
### Επαλήθευση αυθεντικοποίησης Azure

```bash
az account show
```

### Έλεγχος έκδοσης Node.js
```bash
node --version
```

## Βήμα 1: Επιλογή και Αρχικοποίηση Προτύπου

Ας ξεκινήσουμε με ένα δημοφιλές πρότυπο εφαρμογής todo που περιλαμβάνει frontend React και backend API Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Τι Μόλις Συνέβη;
- Κατεβάσατε τον κώδικα του προτύπου στον τοπικό σας κατάλογο
- Δημιουργήθηκε ένα αρχείο `azure.yaml` με ορισμούς υπηρεσιών
- Ρυθμίστηκε κώδικας υποδομής στον κατάλογο `infra/`
- Δημιουργήθηκε μια ρύθμιση περιβάλλοντος

## Βήμα 2: Εξερεύνηση Δομής Έργου

Ας εξετάσουμε τι δημιούργησε το azd για εμάς:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Θα πρέπει να δείτε:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Βασικά Αρχεία για Κατανόηση

**azure.yaml** - Η καρδιά του έργου σας azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Ορισμός υποδομής:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Βήμα 3: Προσαρμογή του Έργου σας (Προαιρετικό)

Πριν την ανάπτυξη, μπορείτε να προσαρμόσετε την εφαρμογή:

### Τροποποίηση του Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Κάντε μια απλή αλλαγή:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Ρύθμιση Μεταβλητών Περιβάλλοντος
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Βήμα 4: Ανάπτυξη στο Azure

Ώρα για το συναρπαστικό μέρος - αναπτύξτε τα πάντα στο Azure!

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

Η εντολή `azd up` εκτελεί τα εξής βήματα:
1. **Παροχή** (`azd provision`) - Δημιουργεί πόρους Azure
2. **Πακετάρισμα** - Δημιουργεί τον κώδικα της εφαρμογής σας
3. **Ανάπτυξη** (`azd deploy`) - Αναπτύσσει τον κώδικα στους πόρους Azure

### Αναμενόμενο Αποτέλεσμα
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Βήμα 5: Δοκιμή της Εφαρμογής σας

### Πρόσβαση στην Εφαρμογή σας
Κάντε κλικ στο URL που παρέχεται στην έξοδο της ανάπτυξης ή αποκτήστε το οποιαδήποτε στιγμή:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Δοκιμή της Εφαρμογής Todo
1. **Προσθήκη στοιχείου todo** - Κάντε κλικ στο "Add Todo" και εισάγετε μια εργασία
2. **Σήμανση ως ολοκληρωμένο** - Επιλέξτε τα ολοκληρωμένα στοιχεία
3. **Διαγραφή στοιχείων** - Αφαιρέστε τα todo που δεν χρειάζεστε πλέον

### Παρακολούθηση της Εφαρμογής σας
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Βήμα 6: Κάντε Αλλαγές και Επαναδιάθεση

Ας κάνουμε μια αλλαγή και ας δούμε πόσο εύκολο είναι να ενημερώσετε:

### Τροποποίηση του API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Προσθέστε μια προσαρμοσμένη κεφαλίδα απάντησης:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Ανάπτυξη Μόνο των Αλλαγών Κώδικα
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Βήμα 7: Διαχείριση Πολλαπλών Περιβαλλόντων

Δημιουργήστε ένα περιβάλλον δοκιμών για να ελέγξετε τις αλλαγές πριν την παραγωγή:

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

### Σύγκριση Περιβαλλόντων
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Βήμα 8: Καθαρισμός Πόρων

Όταν τελειώσετε με τις δοκιμές, καθαρίστε για να αποφύγετε συνεχιζόμενες χρεώσεις:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Τι Έχετε Μάθει

Συγχαρητήρια! Έχετε επιτυχώς:
- Αρχικοποιήσει ένα έργο azd από πρότυπο
- Εξερευνήσει τη δομή έργου και τα βασικά αρχεία
- Αναπτύξει μια εφαρμογή πλήρους στοίβας στο Azure
- Κάνει αλλαγές στον κώδικα και επαναδιάθεση
- Διαχειριστεί πολλαπλά περιβάλλοντα
- Καθαρίσει πόρους

## Επίλυση Συνηθισμένων Προβλημάτων

### Σφάλματα Αυθεντικοποίησης
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Αποτυχίες Ανάπτυξης
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Συγκρούσεις Ονομάτων Πόρων
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Προβλήματα Θυρών/Δικτύου
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Επόμενα Βήματα

Τώρα που ολοκληρώσατε το πρώτο σας έργο, εξερευνήστε αυτά τα προχωρημένα θέματα:

### 1. Προσαρμογή Υποδομής
- [Υποδομή ως Κώδικας](../deployment/provisioning.md)
- [Προσθήκη βάσεων δεδομένων, αποθηκευτικών χώρων και άλλων υπηρεσιών](../deployment/provisioning.md#adding-services)

### 2. Ρύθμιση CI/CD
- [Ενσωμάτωση GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Βέλτιστες Πρακτικές Παραγωγής
- [Ρυθμίσεις ασφαλείας](../deployment/best-practices.md#security)
- [Βελτιστοποίηση απόδοσης](../deployment/best-practices.md#performance)
- [Παρακολούθηση και καταγραφή](../deployment/best-practices.md#monitoring)

### 4. Εξερεύνηση Περισσότερων Προτύπων
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Πρόσθετοι Πόροι

### Εκπαιδευτικό Υλικό
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Κέντρο Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Πλαίσιο Καλά Σχεδιασμένης Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Κοινότητα & Υποστήριξη
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Κοινότητα Προγραμματιστών Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Πρότυπα & Παραδείγματα
- [Επίσημη Συλλογή Προτύπων](https://azure.github.io/awesome-azd/)
- [Πρότυπα Κοινότητας](https://github.com/Azure-Samples/azd-templates)
- [Εταιρικά Μοτίβα](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Συγχαρητήρια για την ολοκλήρωση του πρώτου σας έργου azd!** Είστε πλέον έτοιμοι να δημιουργήσετε και να αναπτύξετε εκπληκτικές εφαρμογές στο Azure με αυτοπεποίθηση.

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Ρύθμιση](configuration.md)
- **Επόμενο Μάθημα**: [Οδηγός Ανάπτυξης](../deployment/deployment-guide.md)

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.