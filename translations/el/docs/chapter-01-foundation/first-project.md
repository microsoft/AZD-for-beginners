# Το Πρώτο Σας Έργο - Πρακτικό Σεμινάριο

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Θεμέλια & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Installation & Setup](installation.md)
- **➡️ Επόμενο**: [Configuration](configuration.md)
- **🚀 Επόμενο Κεφάλαιο**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Εισαγωγή

Καλώς ορίσατε στο πρώτο σας έργο με το Azure Developer CLI! Αυτό το ολοκληρωμένο πρακτικό σεμινάριο παρέχει μια πλήρη καθοδήγηση για τη δημιουργία, ανάπτυξη και διαχείριση μιας πλήρους εφαρμογής στο Azure χρησιμοποιώντας το azd. Θα εργαστείτε με μια πραγματική εφαρμογή todo που περιλαμβάνει React frontend, Node.js API backend και βάση δεδομένων MongoDB.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτό το σεμινάριο, θα:
- Εξοικειωθείτε με τη ροή αρχικοποίησης έργου azd χρησιμοποιώντας πρότυπα
- Κατανοήσετε τη δομή έργου Azure Developer CLI και τα αρχεία ρύθμισης
- Εκτελέσετε πλήρη ανάπτυξη εφαρμογής στο Azure με παροχή υποδομής
- Εφαρμόσετε στρατηγικές ενημέρωσης και επανανάπτυξης εφαρμογών
- Διαχειριστείτε πολλαπλά περιβάλλοντα για ανάπτυξη και staging
- Εφαρμόσετε πρακτικές καθαρισμού πόρων και διαχείρισης κόστους

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση, θα μπορείτε να:
- Αρχικοποιήσετε και να ρυθμίσετε έργα azd από πρότυπα ανεξάρτητα
- Περιηγηθείτε και να τροποποιήσετε αποτελεσματικά τις δομές έργου azd
- Αναπτύξετε πλήρεις εφαρμογές στο Azure με εντολές μίας γραμμής
- Εντοπίσετε και να επιλύσετε συνηθισμένα προβλήματα ανάπτυξης και αυθεντικοποίησης
- Διαχειριστείτε πολλαπλά περιβάλλοντα Azure για διαφορετικά στάδια ανάπτυξης
- Εφαρμόσετε ροές συνεχούς ανάπτυξης για ενημερώσεις εφαρμογών

## Ξεκινώντας

### Λίστα Απαιτήσεων (Prerequisites)
- ✅ Azure Developer CLI εγκατεστημένο ([Οδηγός εγκατάστασης](installation.md))
- ✅ Ολοκληρωμένη αυθεντικοποίηση AZD με `azd auth login`
- ✅ Git εγκατεστημένο στο σύστημα σας
- ✅ Node.js 16+ (για αυτό το σεμινάριο)
- ✅ Visual Studio Code (συνιστάται)

Πριν συνεχίσετε, εκτελέστε τον έλεγχο ρύθμισης από τη ρίζα του αποθετηρίου:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Επαλήθευση της Ρύθμισής Σας
```bash
# Έλεγχος εγκατάστασης azd
azd version

# Έλεγχος ταυτοποίησης AZD
azd auth login --check-status
```

### Επαλήθευση προαιρετικής αυθεντικοποίησης Azure CLI

```bash
az account show
```

### Έλεγχος έκδοσης Node.js
```bash
node --version
```

## Βήμα 1: Επιλέξτε και Αρχικοποιήστε ένα Πρότυπο

Ας ξεκινήσουμε με ένα δημοφιλές πρότυπο εφαρμογής todo που περιλαμβάνει React frontend και Node.js API backend.

```bash
# Περιηγηθείτε στα διαθέσιμα πρότυπα
azd template list

# Αρχικοποιήστε το πρότυπο της εφαρμογής todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Ακολουθήστε τις προτροπές:
# - Εισαγάγετε ένα όνομα περιβάλλοντος: "dev"
# - Επιλέξτε μια συνδρομή (εάν έχετε πολλές)
# - Επιλέξτε μια περιοχή: "East US 2" (ή την προτιμώμενη περιοχή σας)
```

### Τι Μόλις Σημειώθηκε;
- Κατεβάστηκε ο κώδικας του προτύπου στον τοπικό σας κατάλογο
- Δημιουργήθηκε αρχείο `azure.yaml` με ορισμούς υπηρεσιών
- Ρυθμίστηκε κώδικας υποδομής στον κατάλογο `infra/`
- Δημιουργήθηκε ρύθμιση περιβάλλοντος

## Βήμα 2: Εξερευνήστε τη Δομή του Έργου

Ας εξετάσουμε τι δημιούργησε το azd για εμάς:

```bash
# Προβολή της δομής του έργου
tree /f   # Windows
# ή
find . -type f | head -20   # macOS/Linux
```

Πρέπει να δείτε:
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

**azure.yaml** - Η καρδιά του έργου azd:
```bash
# Προβολή της διαμόρφωσης του έργου
cat azure.yaml
```

**infra/main.bicep** - Ορισμός υποδομής:
```bash
# Προβολή του κώδικα υποδομής
head -30 infra/main.bicep
```

## Βήμα 3: Προσαρμόστε το Έργο σας (Προαιρετικό)

Πριν την ανάπτυξη, μπορείτε να προσαρμόσετε την εφαρμογή:

### Τροποποιήστε το Frontend
```bash
# Άνοιξε το συστατικό της εφαρμογής React
code src/web/src/App.tsx
```

Κάντε μια απλή αλλαγή:
```typescript
// Βρείτε τον τίτλο και αλλάξτε τον
<h1>My Awesome Todo App</h1>
```

### Ρυθμίστε Μεταβλητές Περιβάλλοντος
```bash
# Ορίστε προσαρμοσμένες μεταβλητές περιβάλλοντος
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Προβολή όλων των μεταβλητών περιβάλλοντος
azd env get-values
```

## Βήμα 4: Αναπτύξτε στο Azure

Ώρα για το συναρπαστικό μέρος - αναπτύξτε τα πάντα στο Azure!

```bash
# Ανάπτυξη υποδομής και εφαρμογής
azd up

# Αυτή η εντολή θα:
# 1. Παρέχει πόρους Azure (App Service, Cosmos DB κ.λπ.)
# 2. Δημιουργεί την εφαρμογή σας
# 3. Αναπτύσσει στους παρεχόμενους πόρους
# 4. Εμφανίζει το URL της εφαρμογής
```

### Τι Συμβαίνει Κατά την Ανάπτυξη;

Η εντολή `azd up` εκτελεί αυτά τα βήματα:
1. **Provision** (`azd provision`) - Δημιουργεί πόρους Azure
2. **Package** - Μεταγλωττίζει/πακετάρει τον κώδικα της εφαρμογής σας
3. **Deploy** (`azd deploy`) - Αναπτύσσει τον κώδικα στους πόρους Azure

### Αναμενόμενο αποτέλεσμα
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
Κάντε κλικ στο URL που παρέχεται στην έξοδο ανάπτυξης, ή λάβετε το οποιαδήποτε στιγμή:
```bash
# Λάβετε τα σημεία τερματισμού της εφαρμογής
azd show

# Ανοίξτε την εφαρμογή στον περιηγητή σας
azd show --output json | jq -r '.services.web.endpoint'
```

### Δοκιμάστε την Εφαρμογή Todo
1. **Προσθέστε ένα στοιχείο todo** - Κάντε κλικ στο "Προσθήκη Todo" και εισάγετε μια εργασία
2. **Σημειώστε ως ολοκληρωμένο** - Επιλέξτε τα ολοκληρωμένα στοιχεία
3. **Διαγράψτε στοιχεία** - Αφαιρέστε τα todos που δεν χρειάζεστε πλέον

### Παρακολουθήστε την Εφαρμογή σας
```bash
# Άνοιγμα του Azure Portal για τους πόρους σας
azd monitor

# Προβολή καταγραφών εφαρμογής
azd monitor --logs

# Προβολή ζωντανών μετρήσεων
azd monitor --live
```

## Βήμα 6: Κάντε Αλλαγές και Επαναναπτύξτε

Ας κάνουμε μια αλλαγή και δούμε πόσο εύκολο είναι να ενημερώσετε:

### Τροποποιήστε το API
```bash
# Επεξεργαστείτε τον κώδικα του API
code src/api/src/routes/lists.js
```

Προσθέστε μια προσαρμοσμένη κεφαλίδα απόκρισης:
```javascript
// Βρείτε έναν χειριστή διαδρομής και προσθέστε:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Αναπτύξτε Μόνο τις Αλλαγές Κώδικα
```bash
# Αναπτύξτε μόνο τον κώδικα της εφαρμογής (παραλείψτε την υποδομή)
azd deploy

# Αυτό είναι πολύ πιο γρήγορο από το 'azd up' αφού η υποδομή υπάρχει ήδη
```

## Βήμα 7: Διαχείριση Πολλαπλών Περιβαλλόντων

Δημιουργήστε ένα περιβάλλον staging για δοκιμή αλλαγών πριν την παραγωγή:

```bash
# Δημιουργήστε ένα νέο περιβάλλον staging
azd env new staging

# Αναπτύξτε στο staging
azd up

# Επιστρέψτε στο περιβάλλον ανάπτυξης (dev)
azd env select dev

# Εμφανίστε όλα τα περιβάλλοντα
azd env list
```

### Σύγκριση Περιβαλλόντων
```bash
# Προβολή περιβάλλοντος ανάπτυξης
azd env select dev
azd show

# Προβολή περιβάλλοντος προπαραγωγής
azd env select staging
azd show
```

## Βήμα 8: Καθαρισμός Πόρων

Όταν τελειώσετε με τα πειράματα, καθαρίστε για να αποφύγετε συνεχείς χρεώσεις:

```bash
# Διαγραφή όλων των πόρων του Azure για το τρέχον περιβάλλον
azd down

# Αναγκαστική διαγραφή χωρίς επιβεβαίωση και μόνιμη εκκαθάριση πόρων με μαλακή διαγραφή
azd down --force --purge

# Διαγραφή συγκεκριμένου περιβάλλοντος
azd env select staging
azd down --force --purge
```

## Κλασική Εφαρμογή vs Εφαρμογή με AI: Ίδια Ροή Εργασίας

Μόλις αναπτύξατε μια παραδοσιακή web εφαρμογή. Αλλά τι γίνεται αν θέλατε να αναπτύξετε μια εφαρμογή με υποστήριξη AI — για παράδειγμα, μια εφαρμογή συνομιλίας που υποστηρίζεται από Microsoft Foundry Models;

Τα καλά νέα: **η ροή εργασίας είναι ταυτόσημη.**

| Βήμα | Κλασική εφαρμογή Todo | Εφαρμογή συνομιλίας με AI |
|------|----------------------|---------------------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Η μόνη διαφορά είναι το **template** από το οποίο ξεκινάτε. Ένα πρότυπο AI περιλαμβάνει επιπλέον υποδομή (όπως πόρο Microsoft Foundry Models ή ένα δείκτη AI Search), αλλά το azd αναλαμβάνει όλα αυτά για εσάς. Δεν χρειάζεται να μάθετε νέες εντολές, να υιοθετήσετε ένα διαφορετικό εργαλείο ή να αλλάξετε τον τρόπο σκέψης σας σχετικά με την ανάπτυξη.

Αυτό είναι το βασικό αξίωμα του azd: **μία ροή εργασίας, οποιοδήποτε φόρτο εργασίας.** Οι δεξιότητες που εξασκήσατε σε αυτό το σεμινάριο — αρχικοποίηση, ανάπτυξη, παρακολούθηση, επανανάπτυξη και καθαρισμός — ισχύουν εξίσου για εφαρμογές AI και agents.

---

## Τι Μάθατε

Συγχαρητήρια! Επιτυχώς:
- ✅ Αρχικοποιήσατε ένα έργο azd από ένα πρότυπο
- ✅ Εξερευνήσατε τη δομή έργου και τα βασικά αρχεία
- ✅ Αναπτύξατε μια πλήρη εφαρμογή στο Azure
- ✅ Κάνατε αλλαγές κώδικα και επαναναπτύξατε
- ✅ Διαχειριστήκατε πολλαπλά περιβάλλοντα
- ✅ Καθαρίσατε πόρους

## 🎯 Ασκήσεις Επικύρωσης Δεξιοτήτων

### Άσκηση 1: Αναπτύξτε ένα Διαφορετικό Πρότυπο (15 λεπτά)
**Στόχος**: Να επιδείξετε τη δεξιότητα στην αρχικοποίηση azd init και στη ροή ανάπτυξης

```bash
# Δοκιμάστε στοίβα Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Επαληθεύστε την ανάπτυξη
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Καθαρίστε
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Η εφαρμογή αναπτύσσεται χωρίς σφάλματα
- [ ] Μπορείτε να αποκτήσετε πρόσβαση στο URL της εφαρμογής μέσω του προγράμματος περιήγησης
- [ ] Η εφαρμογή λειτουργεί σωστά (προσθήκη/αφαίρεση todos)
- [ ] Ολοκληρώθηκε επιτυχώς ο καθαρισμός όλων των πόρων

### Άσκηση 2: Προσαρμογή Ρυθμίσεων (20 λεπτά)
**Στόχος**: Εξάσκηση στη ρύθμιση μεταβλητών περιβάλλοντος

```bash
cd my-first-azd-app

# Δημιουργήστε προσαρμοσμένο περιβάλλον
azd env new custom-config

# Ορίστε προσαρμοσμένες μεταβλητές
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Επαληθεύστε τις μεταβλητές
azd env get-values | grep APP_TITLE

# Αναπτύξτε με προσαρμοσμένη διαμόρφωση
azd up
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκε επιτυχώς προσαρμοσμένο περιβάλλον
- [ ] Οι μεταβλητές περιβάλλοντος έχουν οριστεί και είναι ανακτήσιμες
- [ ] Η εφαρμογή αναπτύσσεται με την προσαρμοσμένη ρύθμιση
- [ ] Μπορείτε να επαληθεύσετε τις προσαρμοσμένες ρυθμίσεις στην αναπτυγμένη εφαρμογή

### Άσκηση 3: Ροή Εργασίας Πολλαπλών Περιβαλλόντων (25 λεπτά)
**Στόχος**: Δεξιότητα στη διαχείριση περιβαλλόντων και στρατηγικές ανάπτυξης

```bash
# Δημιουργήστε περιβάλλον ανάπτυξης
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Σημειώστε το URL του περιβάλλοντος ανάπτυξης
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Δημιουργήστε περιβάλλον προπαραγωγής
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Σημειώστε το URL του περιβάλλοντος προπαραγωγής
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Συγκρίνετε τα περιβάλλοντα
azd env list

# Δοκιμάστε και τα δύο περιβάλλοντα
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Καθαρίστε και τα δύο περιβάλλοντα
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκαν δύο περιβάλλοντα με διαφορετικές ρυθμίσεις
- [ ] Και τα δύο περιβάλλοντα αναπτύχθηκαν επιτυχώς
- [ ] Μπορείτε να εναλλάσσετε μεταξύ περιβαλλόντων χρησιμοποιώντας `azd env select`
- [ ] Οι μεταβλητές περιβάλλοντος διαφέρουν μεταξύ των περιβαλλόντων
- [ ] Ολοκληρώθηκε επιτυχώς ο καθαρισμός και των δύο περιβαλλόντων

## 📊 Η Πρόοδός Σας

**Επενδεδυμένος Χρόνος**: ~60-90 λεπτά  
**Δεξιότητες που Αποκτήσατε**:
- ✅ Αρχικοποίηση έργου βάσει προτύπου
- ✅ Παροχή πόρων Azure
- ✅ Ροές ανάπτυξης εφαρμογών
- ✅ Διαχείριση περιβαλλόντων
- ✅ Διαχείριση ρυθμίσεων/παραμετροποίησης
- ✅ Καθαρισμός πόρων και διαχείριση κόστους

**Επόμενο Επίπεδο**: Είστε έτοιμοι για τον [Οδηγό Διαμόρφωσης](configuration.md) για να μάθετε προχωρημένα μοτίβα ρύθμισης!

## Επίλυση Συνηθισμένων Προβλημάτων

### Σφάλματα Αυθεντικοποίησης
```bash
# Επαναέλεγχος ταυτότητας με το Azure
az login

# Επαλήθευσε την πρόσβαση στη συνδρομή
az account show
```

### Αποτυχίες Ανάπτυξης
```bash
# Ενεργοποιήστε την καταγραφή εντοπισμού σφαλμάτων
export AZD_DEBUG=true
azd up --debug

# Προβολή καταγραφών εφαρμογής στο Azure
azd monitor --logs

# Για Container Apps, χρησιμοποιήστε το Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Συγκρούσεις Ονομάτων Πόρων
```bash
# Χρησιμοποιήστε ένα μοναδικό όνομα περιβάλλοντος
azd env new dev-$(whoami)-$(date +%s)
```

### Θέματα Πόρτας/Δικτύου
```bash
# Ελέγξτε εάν οι θύρες είναι διαθέσιμες
netstat -an | grep :3000
netstat -an | grep :3100
```

## Επόμενα Βήματα

Τώρα που ολοκληρώσατε το πρώτο σας έργο, εξερευνήστε αυτά τα προχωρημένα θέματα:

### 1. Προσαρμόστε την Υποδομή
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Ρύθμιση CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Πλήρεις ροές εργασίας CI/CD
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Ρύθμιση pipeline

### 3. Βέλτιστες Πρακτικές για Παραγωγή
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Ασφάλεια, απόδοση και παρακολούθηση

### 4. Εξερευνήστε Περισσότερα Πρότυπα
```bash
# Περιηγηθείτε σε πρότυπα ανά κατηγορία
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Δοκιμάστε διαφορετικές στοίβες τεχνολογίας
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Επιπλέον Πόροι

### Υλικά Εκμάθησης
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Κοινότητα & Υποστήριξη
- [Azure Developer CLI στο GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Πρότυπα & Παραδείγματα
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Συγχαρητήρια για την ολοκλήρωση του πρώτου σας έργου με το azd!** Τώρα είστε έτοιμοι να δημιουργήσετε και να αναπτύξετε εκπληκτικές εφαρμογές στο Azure με αυτοπεποίθηση.

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Θεμέλια & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Installation & Setup](installation.md)
- **➡️ Επόμενο**: [Configuration](configuration.md)
- **🚀 Επόμενο Κεφάλαιο**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Επόμενο Μάθημα**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρότι επιδιώκουμε την ακρίβεια, να γνωρίζετε ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε καμία ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->