# Το Πρώτο σας Έργο - Πρακτικό Σεμινάριο

**Πλοήγηση Κεφαλαίου:**
- **📚 Course Home**: [AZD για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάσεις & Γρήγορη Εκκίνηση
- **⬅️ Previous**: [Εγκατάσταση & Ρύθμιση](installation.md)
- **➡️ Next**: [Διαμόρφωση](configuration.md)
- **🚀 Next Chapter**: [Κεφάλαιο 2: Ανάπτυξη με προτεραιότητα στην ΤΝ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Εισαγωγή

Καλώς ήρθατε στο πρώτο σας έργο με το Azure Developer CLI! Αυτό το ολοκληρωμένο πρακτικό σεμινάριο παρέχει πλήρη βήμα-βήμα οδηγό για τη δημιουργία, ανάπτυξη και διαχείριση μιας πλήρους στοίβας εφαρμογής στο Azure χρησιμοποιώντας azd. Θα εργαστείτε με μια πραγματική εφαρμογή todo που περιλαμβάνει React frontend, Node.js API backend και MongoDB βάση δεδομένων.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτό το σεμινάριο, θα:
- Κατακτήσετε τη ροή εργασίας αρχικοποίησης έργου azd χρησιμοποιώντας πρότυπα
- Κατανοήσετε τη δομή του έργου Azure Developer CLI και τα αρχεία ρύθμισης
- Εκτελέσετε πλήρη ανάπτυξη εφαρμογής στο Azure με παροχή υποδομής
- Υλοποιήσετε στρατηγικές ενημέρωσης εφαρμογής και επανα-ανάπτυξης
- Διαχειριστείτε πολλαπλά περιβάλλοντα για ανάπτυξη και staging
- Εφαρμόσετε πρακτικές καθαρισμού πόρων και διαχείρισης κόστους

## Μαθησιακά Αποτελέσματα

Με την ολοκλήρωση, θα μπορείτε να:
- Αρχικοποιείτε και να ρυθμίζετε έργα azd από πρότυπα αυτόνομα
- Πλοηγείστε και να τροποποιείτε δομές έργων azd αποτελεσματικά
- Αναπτύσσετε πλήρεις στοίβες εφαρμογών στο Azure με εντολές ενός βήματος
- Εντοπίζετε και να επιλύετε κοινά προβλήματα ανάπτυξης και πιστοποίησης
- Διαχειρίζεστε πολλαπλά περιβάλλοντα Azure για διαφορετικά στάδια ανάπτυξης
- Υλοποιείτε ροές συνεχούς ανάπτυξης για ενημερώσεις εφαρμογής

## Ξεκινώντας

### Λίστα Ελέγχου Προαπαιτούμενων
- ✅ Azure Developer CLI installed ([Οδηγός Εγκατάστασης](installation.md))
- ✅ Ολοκληρώθηκε η πιστοποίηση AZD με `azd auth login`
- ✅ Το Git είναι εγκατεστημένο στο σύστημά σας
- ✅ Node.js 16+ (για αυτό το σεμινάριο)
- ✅ Visual Studio Code (συνιστάται)

Πριν συνεχίσετε, εκτελέστε τον validator εγκατάστασης από τη ρίζα του αποθετηρίου:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Επαλήθευση της Ρύθμισης σας
```bash
# Ελέγξτε την εγκατάσταση του azd
azd version

# Ελέγξτε την επαλήθευση ταυτότητας του AZD
azd auth login --check-status
```

### Επαλήθευση προαιρετικής πιστοποίησης Azure CLI

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

# Ακολουθήστε τις οδηγίες:
# - Εισάγετε ένα όνομα περιβάλλοντος: "dev"
# - Επιλέξτε μια συνδρομή (αν έχετε πολλές)
# - Επιλέξτε μια περιοχή: "East US 2" (ή την προτιμώμενη περιοχή σας)
```

### Τι Μόλις Συνέβη;
- Λήφθηκε ο κώδικας του προτύπου στον τοπικό σας φάκελο
- Δημιουργήθηκε το αρχείο `azure.yaml` με ορισμούς υπηρεσιών
- Οργανώθηκε ο κώδικας υποδομής στον κατάλογο `infra/`
- Δημιουργήθηκε μια ρύθμιση περιβάλλοντος

## Βήμα 2: Εξερευνήστε τη Δομή του Έργου

Ας εξετάσουμε τι δημιούργησε το azd για εμάς:

```bash
# Προβολή της δομής του έργου
tree /f   # Windows
# ή
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

**azure.yaml** - Η καρδιά του έργου azd σας:
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

### Διαμόρφωση Μεταβλητών Περιβάλλοντος
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
# 3. Αναπτύσσει στους παρεχθέντες πόρους
# 4. Εμφανίζει τη διεύθυνση URL της εφαρμογής
```

### Τι Συμβαίνει Κατά τη Διάρκεια της Ανάπτυξης;

Η εντολή `azd up` εκτελεί τα παρακάτω βήματα:
1. **Provision** (`azd provision`) - Δημιουργεί πόρους Azure
2. **Package** - Χτίζει τον κώδικα της εφαρμογής σας
3. **Deploy** (`azd deploy`) - Αναπτύσσει τον κώδικα στους πόρους Azure

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
Κάντε κλικ στο URL που παρέχεται στην έξοδο της ανάπτυξης, ή αποκτήστε το οποιαδήποτε στιγμή:
```bash
# Λήψη τελικών σημείων της εφαρμογής
azd show

# Ανοίξτε την εφαρμογή στον περιηγητή σας
azd show --output json | jq -r '.services.web.endpoint'
```

### Δοκιμάστε την Εφαρμογή Todo
1. **Προσθήκη ενός todo** - Κάντε κλικ στο κουμπί "Προσθήκη Todo" και εισάγετε μια εργασία
2. **Σήμανση ως ολοκληρωμένο** - Επισημάνετε τα ολοκληρωμένα στοιχεία
3. **Διαγραφή στοιχείων** - Αφαιρέστε todos που δεν χρειάζεστε πλέον

### Παρακολούθηση της Εφαρμογής σας
```bash
# Άνοιγμα του portal του Azure για τους πόρους σας
azd monitor

# Προβολή αρχείων καταγραφής εφαρμογής
azd monitor --logs

# Προβολή ζωντανών μετρικών
azd monitor --live
```

### ✅ Επαληθεύστε την Ανάπτυξή σας

Πριν προχωρήσετε, ακολουθήστε αυτό το γρήγορο cheklist για να επιβεβαιώσετε ότι όλα πράγματι λειτουργούν — μην υποθέσετε ότι "η ανάπτυξη πέτυχε" σημαίνει "η εφαρμογή λειτουργεί":

```bash
# 1. Επιβεβαιώστε ότι το σημείο τερματισμού υπάρχει και είναι προσβάσιμο
azd show

# 2. Εκτελέστε ένα σύντομο τεστ στο σημείο τερματισμού (αναμένει HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Ελέγξτε το σημείο τερματισμού υγείας αν η εφαρμογή σας εκθέτει ένα
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Η ανάπτυξη επαληθεύεται όταν:**
- ✅ `azd show` παραθέτει ένα προσβάσιμο URL endpoint
- ✅ Το URL ανοίγει στον browser σας χωρίς σφάλματα
- ✅ Οι βασικές λειτουργίες λειτουργούν (προσθήκη/ολοκλήρωση/διαγραφή ενός todo)
- ✅ `azd monitor --logs` εμφανίζει αιτήματα που φτάνουν χωρίς απρόσμενα σφάλματα

Αν κάποιος έλεγχος αποτύχει, μεταβείτε στο [Κεφάλαιο 7: Επίλυση Προβλημάτων](../chapter-07-troubleshooting/README.md).

## Βήμα 6: Κάντε Αλλαγές και Επανααναπτύξτε

Ας κάνουμε μια αλλαγή και να δούμε πόσο εύκολο είναι να ενημερώσετε:

### Τροποποιήστε το API
```bash
# Επεξεργαστείτε τον κώδικα του API
code src/api/src/routes/lists.js
```

Προσθέστε μια προσαρμοσμένη κεφαλίδα απάντησης:
```javascript
// Βρείτε έναν χειριστή διαδρομής και προσθέστε:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Αναπτύξτε Μόνο τις Αλλαγές Κώδικα
```bash
# Αναπτύξτε μόνο τον κώδικα της εφαρμογής (παραλείποντας την υποδομή)
azd deploy

# Αυτό είναι πολύ πιο γρήγορο από το 'azd up' αφού η υποδομή υπάρχει ήδη
```

## Βήμα 7: Διαχείριση Πολλαπλών Περιβαλλόντων

Δημιουργήστε ένα staging περιβάλλον για να δοκιμάζετε αλλαγές πριν την παραγωγή:

```bash
# Δημιουργήστε ένα νέο περιβάλλον προπαραγωγής
azd env new staging

# Αναπτύξτε στο περιβάλλον προπαραγωγής
azd up

# Επιστρέψτε στο περιβάλλον ανάπτυξης
azd env select dev

# Εμφανίστε όλα τα περιβάλλοντα
azd env list
```

### Σύγκριση Περιβαλλόντων
```bash
# Προβολή περιβάλλοντος ανάπτυξης
azd env select dev
azd show

# Προβολή περιβάλλοντος ενδιάμεσης δοκιμής
azd env select staging
azd show
```

## Βήμα 8: Καθαρισμός Πόρων

Όταν τελειώσετε τα πειράματα, καθαρίστε για να αποφύγετε συνεχιζόμενες χρεώσεις:

```bash
# Διαγραφή όλων των πόρων Azure για το τρέχον περιβάλλον
azd down

# Διαγραφή με εξαναγκασμό χωρίς επιβεβαίωση και μόνιμη απομάκρυνση των προσωρινά διαγραμμένων πόρων
azd down --force --purge

# Διαγραφή συγκεκριμένου περιβάλλοντος
azd env select staging
azd down --force --purge
```

## Κλασική Εφαρμογή vs. Εφαρμογή με ΤΝ: Ίδια Ροή Εργασίας

Μόλις αναπτύξατε μια παραδοσιακή web εφαρμογή. Αλλά τι γίνεται αν θέλετε να αναπτύξετε μια εφαρμογή με ΤΝ — για παράδειγμα, μια εφαρμογή συνομιλίας υποστηριζόμενη από Microsoft Foundry Models;

Τα καλά νέα: **η ροή εργασίας είναι ίδια.**

| Βήμα | Κλασική Εφαρμογή Todo | Εφαρμογή Συνομιλίας ΤΝ |
|------|-----------------------|------------------------|
| Αρχικοποίηση | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Πιστοποίηση | `azd auth login` | `azd auth login` |
| Ανάπτυξη | `azd up` | `azd up` |
| Παρακολούθηση | `azd monitor` | `azd monitor` |
| Καθαρισμός | `azd down --force --purge` | `azd down --force --purge` |

Η μόνη διαφορά είναι το **πρότυπο** από το οποίο ξεκινάτε. Ένα πρότυπο ΤΝ περιλαμβάνει επιπλέον υποδομή (όπως έναν πόρο Microsoft Foundry Models ή έναν δείκτη AI Search), αλλά το azd διαχειρίζεται όλο αυτό για εσάς. Δεν χρειάζεται να μάθετε νέες εντολές, να υιοθετήσετε διαφορετικό εργαλείο ή να αλλάξετε τον τρόπο που σκέφτεστε για την ανάπτυξη.

Αυτή είναι η βασική αρχή του azd: **μία ροή εργασίας, οποιοδήποτε φορτίο εργασίας.** Οι δεξιότητες που εξασκήσατε σε αυτό το σεμινάριο—αρχικοποίηση, ανάπτυξη, παρακολούθηση, επανα-ανάπτυξη και καθαρισμός—ισχύουν εξίσου για εφαρμογές ΤΝ και agents.

---

## Τι Μάθατε

Συγχαρητήρια! Έχετε επιτυχώς:
- ✅ Αρχικοποιήσει ένα έργο azd από ένα πρότυπο
- ✅ Εξερευνήσει τη δομή του έργου και τα βασικά αρχεία
- ✅ Αναπτύξει μια πλήρη στοίβα εφαρμογής στο Azure
- ✅ Κάνει αλλαγές κώδικα και επανα-ανάπτυξη
- ✅ Διαχειριστεί πολλαπλά περιβάλλοντα
- ✅ Καθάρισε πόρους

## 🎯 Ασκήσεις Επικύρωσης Δεξιοτήτων

### Άσκηση 1: Αναπτύξτε Ένα Διαφορετικό Πρότυπο (15 λεπτά)
**Στόχος**: Επιδείξτε επάρκεια στην εντολή azd init και στη ροή ανάπτυξης

```bash
# Δοκίμασε τη στοίβα Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Επαλήθευσε την ανάπτυξη
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Καθάρισε
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Η εφαρμογή αναπτύσσεται χωρίς σφάλματα
- [ ] Μπορείτε να αποκτήσετε πρόσβαση στο URL της εφαρμογής στον browser
- [ ] Η εφαρμογή λειτουργεί σωστά (προσθήκη/αφαίρεση todos)
- [ ] Έγινε επιτυχής καθαρισμός όλων των πόρων

### Άσκηση 2: Προσαρμόστε τη Διαμόρφωση (20 λεπτά)
**Στόχος**: Εξασκηθείτε στη διαμόρφωση μεταβλητών περιβάλλοντος

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
- [ ] Το προσαρμοσμένο περιβάλλον δημιουργήθηκε επιτυχώς
- [ ] Οι μεταβλητές περιβάλλοντος ορίστηκαν και ανακτώνται
- [ ] Η εφαρμογή αναπτύχθηκε με προσαρμοσμένη ρύθμιση
- [ ] Μπορείτε να επαληθεύσετε τις προσαρμοσμένες ρυθμίσεις στην αναπτυγμένη εφαρμογή

### Άσκηση 3: Ροή Εργασίας Πολλαπλών Περιβαλλόντων (25 λεπτά)
**Στόχος**: Κατακτήστε τη διαχείριση περιβαλλόντων και στρατηγικές ανάπτυξης

```bash
# Δημιουργήστε περιβάλλον ανάπτυξης
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Σημειώστε το URL ανάπτυξης
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Δημιουργήστε περιβάλλον προ-παραγωγής
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Σημειώστε το URL του περιβάλλοντος προ-παραγωγής
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
- [ ] Μπορείτε να μεταβαίνετε μεταξύ περιβαλλόντων με `azd env select`
- [ ] Οι μεταβλητές περιβάλλοντος διαφέρουν μεταξύ των περιβαλλόντων
- [ ] Έγινε επιτυχής καθαρισμός και των δύο περιβαλλόντων

## 📊 Η Πρόοδός σας

**Επενδεδυμένος Χρόνος**: ~60-90 λεπτά  
**Δεξιότητες που αποκτήθηκαν**:
- ✅ Αρχικοποίηση έργου με βάση πρότυπο
- ✅ Παροχή πόρων Azure
- ✅ Ροές εργασίας ανάπτυξης εφαρμογών
- ✅ Διαχείριση περιβαλλόντων
- ✅ Διαχείριση διαμόρφωσης
- ✅ Καθαρισμός πόρων και διαχείριση κόστους

**Επόμενο Επίπεδο**: Είστε έτοιμοι για τον [Οδηγό Διαμόρφωσης](configuration.md) για να μάθετε προχωρημένα πρότυπα διαμόρφωσης!

## Επίλυση Συνηθισμένων Προβλημάτων

### Σφάλματα Πιστοποίησης
```bash
# Επαναεπαλήθευση ταυτότητας με το Azure
az login

# Επαλήθευση πρόσβασης στη συνδρομή
az account show
```

### Αποτυχίες Ανάπτυξης
```bash
# Ενεργοποίηση καταγραφής εντοπισμού σφαλμάτων
export AZD_DEBUG=true
azd up --debug

# Προβολή καταγραφών εφαρμογής στο Azure
azd monitor --logs

# Για τα Container Apps, χρησιμοποιήστε το Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Συγκρούσεις Ονομάτων Πόρων
```bash
# Χρησιμοποιήστε ένα μοναδικό όνομα περιβάλλοντος
azd env new dev-$(whoami)-$(date +%s)
```

### Θέματα Θύρας/Δικτύου
```bash
# Ελέγξτε αν οι θύρες είναι διαθέσιμες
netstat -an | grep :3000
netstat -an | grep :3100
```

## Επόμενα Βήματα

Τώρα που ολοκληρώσατε το πρώτο σας έργο, εξερευνήστε αυτά τα προχωρημένα θέματα:

### 1. Προσαρμόστε την Υποδομή
- [Υποδομή ως Κώδικας](../chapter-04-infrastructure/provisioning.md)
- [Προσθέστε βάσεις δεδομένων, αποθήκευση και άλλες υπηρεσίες](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Ρύθμιση CI/CD
- [Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md) - Πλήρεις ροές εργασίας CI/CD
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Διαμόρφωση pipelines

### 3. Βέλτιστες Πρακτικές για Παραγωγή
- [Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md) - Ασφάλεια, απόδοση και παρακολούθηση

### 4. Εξερευνήστε Περισσότερα Πρότυπα
```bash
# Περιηγηθείτε σε πρότυπα ανά κατηγορία
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Δοκιμάστε διαφορετικές τεχνολογικές στοίβες
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Πρόσθετοι Πόροι

### Εκπαιδευτικό Υλικό
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Κέντρο Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Πλαίσιο Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Κοινότητα & Υποστήριξη
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Κοινότητα Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Πρότυπα & Παραδείγματα
- [Επίσημη Συλλογή Προτύπων](https://azure.github.io/awesome-azd/)
- [Πρότυπα της Κοινότητας](https://github.com/Azure-Samples/azd-templates)
- [Εταιρικά Πρότυπα](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Συγχαρητήρια για την ολοκλήρωση του πρώτου σας έργου azd!** Τώρα είστε έτοιμοι να δημιουργήσετε και να αναπτύξετε καταπληκτικές εφαρμογές στο Azure με αυτοπεποίθηση.

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Course Home**: [AZD για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάσεις & Γρήγορη Εκκίνηση
- **⬅️ Previous**: [Εγκατάσταση & Ρύθμιση](installation.md)
- **➡️ Next**: [Χρησιμοποιήστε τη Δική σας Εφαρμογή](bring-your-own-app.md)
- **🚀 Next Chapter**: [Κεφάλαιο 2: Ανάπτυξη με προτεραιότητα στην ΤΝ](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->