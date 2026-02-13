# Το Πρώτο Σας Έργο - Πρακτικό Σεμινάριο

**Πλοήγηση Κεφαλαίου:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Κεφάλαιο 1 - Θεμέλια & Γρήγορη Εκκίνηση
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Εισαγωγή

Καλώς ορίσατε στο πρώτο σας έργο με το Azure Developer CLI! Αυτό το ολοκληρωμένο πρακτικό σεμινάριο παρέχει έναν πλήρη οδηγό για τη δημιουργία, ανάπτυξη και διαχείριση μιας πλήρους εφαρμογής στο Azure χρησιμοποιώντας το azd. Θα εργαστείτε με μια πραγματική εφαρμογή todo που περιλαμβάνει ένα React frontend, ένα Node.js API backend και μια βάση δεδομένων MongoDB.

## Στόχοι Εκμάθησης

Με την ολοκλήρωση αυτού του σεμιναρίου, θα:
- Κατακτήσετε τη ροή αρχικοποίησης έργου azd χρησιμοποιώντας πρότυπα
- Κατανοήσετε τη δομή έργου και τα αρχεία ρύθμισης του Azure Developer CLI
- Εκτελέσετε πλήρη ανάπτυξη εφαρμογής στο Azure με παροχή υποδομής
- Υλοποιήσετε ενημερώσεις εφαρμογής και στρατηγικές επανα-ανάπτυξης
- Διαχειριστείτε πολλαπλά περιβάλλοντα για ανάπτυξη και staging
- Εφαρμόσετε πρακτικές καθαρισμού πόρων και διαχείρισης κόστους

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση, θα μπορείτε να:
- Αρχικοποιείτε και ρυθμίζετε έργα azd από πρότυπα ανεξάρτητα
- Πλοηγείστε και τροποποιείτε αποτελεσματικά τις δομές έργου azd
- Αναπτύσσετε πλήρεις εφαρμογές στο Azure με μεμονωμένες εντολές
- Αντιμετωπίζετε κοινά προβλήματα ανάπτυξης και ζητήματα αυθεντικοποίησης
- Διαχειρίζεστε πολλαπλά περιβάλλοντα Azure για διαφορετικά στάδια ανάπτυξης
- Υλοποιείτε ροές συνεχούς ανάπτυξης για ενημερώσεις εφαρμογών

## Έναρξη

### Προαπαιτούμενα - Λίστα Ελέγχου
- ✅ Azure Developer CLI εγκατεστημένο ([Οδηγός Εγκατάστασης](installation.md))
- ✅ Azure CLI εγκατεστημένο και αυθεντικοποιημένο
- ✅ Git εγκατεστημένο στο σύστημά σας
- ✅ Node.js 16+ (για αυτό το σεμινάριο)
- ✅ Visual Studio Code (συνιστάται)

### Επαληθεύστε τη Ρύθμισή Σας
```bash
# Ελέγξτε την εγκατάσταση του azd
azd version
```
### Επαληθεύστε τον έλεγχο ταυτότητας Azure

```bash
az account show
```

### Ελέγξτε την έκδοση Node.js
```bash
node --version
```

## Βήμα 1: Επιλογή και Αρχικοποίηση Προτύπου

Ας ξεκινήσουμε με ένα δημοφιλές πρότυπο εφαρμογής todo που περιλαμβάνει ένα React frontend και ένα Node.js API backend.

```bash
# Περιηγηθείτε στα διαθέσιμα πρότυπα
azd template list

# Αρχικοποιήστε το πρότυπο εφαρμογής todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Ακολουθήστε τις προτροπές:
# - Εισάγετε ένα όνομα περιβάλλοντος: "dev"
# - Επιλέξτε μια συνδρομή (αν έχετε περισσότερες από μία)
# - Επιλέξτε μια περιοχή: "East US 2" (ή την προτιμώμενη περιοχή σας)
```

### Τι Μόλις Έγινε;
- Κατεβάστηκε ο κώδικας του προτύπου στον τοπικό σας φάκελο
- Δημιουργήθηκε ένα αρχείο `azure.yaml` με ορισμούς υπηρεσιών
- Ρυθμίστηκε ο κώδικας υποδομής στον φάκελο `infra/`
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

### Κύρια Αρχεία για Κατανόηση

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

## Βήμα 3: Προσαρμόστε το Έργο σας (Προαιρετικά)

Πριν την ανάπτυξη, μπορείτε να προσαρμόσετε την εφαρμογή:

### Τροποποιήστε το Frontend
```bash
# Ανοίξτε το συστατικό της εφαρμογής React
code src/web/src/App.tsx
```

Κάντε μια απλή αλλαγή:
```typescript
// Βρείτε τον τίτλο και αλλάξτε τον
<h1>My Awesome Todo App</h1>
```

### Διαμορφώστε Μεταβλητές Περιβάλλοντος
```bash
# Ορισμός προσαρμοσμένων μεταβλητών περιβάλλοντος
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Προβολή όλων των μεταβλητών περιβάλλοντος
azd env get-values
```

## Βήμα 4: Ανάπτυξη στο Azure

Τώρα το συναρπαστικό μέρος - αναπτύξτε τα πάντα στο Azure!

```bash
# Ανάπτυξη υποδομής και εφαρμογής
azd up

# Αυτή η εντολή θα:
# 1. Παρέχει πόρους Azure (App Service, Cosmos DB, κ.λπ.)
# 2. Δημιουργεί την εφαρμογή σας
# 3. Αναπτύσσει στους παρεχόμενους πόρους
# 4. Εμφανίζει το URL της εφαρμογής
```

### Τι συμβαίνει κατά τη διάρκεια της ανάπτυξης;

Η εντολή `azd up` εκτελεί αυτά τα βήματα:
1. **Provision** (`azd provision`) - Δημιουργεί πόρους Azure
2. **Package** - Δημιουργεί τον κώδικα της εφαρμογής σας
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
Κάντε κλικ στο URL που παρέχεται στο αποτέλεσμα ανάπτυξης, ή αποκτήστε το οποιαδήποτε στιγμή:
```bash
# Λήψη των τελικών σημείων της εφαρμογής
azd show

# Άνοιγμα της εφαρμογής στο πρόγραμμα περιήγησής σας
azd show --output json | jq -r '.services.web.endpoint'
```

### Δοκιμάστε την εφαρμογή Todo
1. **Προσθέστε ένα στοιχείο todo** - Κάντε κλικ στο "Προσθήκη Todo" και εισάγετε μια εργασία
2. **Σημειώστε ως ολοκληρωμένο** - Επιλέξτε τα ολοκληρωμένα στοιχεία
3. **Διαγράψτε στοιχεία** - Αφαιρέστε τα todos που δεν χρειάζεστε πλέον

### Παρακολουθήστε την Εφαρμογή σας
```bash
# Άνοιγμα της πύλης Azure για τους πόρους σας
azd monitor

# Προβολή αρχείων καταγραφής εφαρμογής
azd monitor --logs

# Προβολή μετρήσεων σε πραγματικό χρόνο
azd monitor --live
```

## Βήμα 6: Κάντε Αλλαγές και Επανα-Αναπτύξτε

Ας κάνουμε μια αλλαγή και δείτε πόσο εύκολο είναι να ενημερώσετε:

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

# Αυτό είναι πολύ πιο γρήγορο από το 'azd up' καθώς η υποδομή υπάρχει ήδη
```

## Βήμα 7: Διαχείριση Πολλαπλών Περιβαλλόντων

Δημιουργήστε ένα δοκιμαστικό (staging) περιβάλλον για να δοκιμάζετε αλλαγές πριν την παραγωγή:

```bash
# Δημιουργήστε ένα νέο περιβάλλον staging
azd env new staging

# Αναπτύξτε στο staging
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

# Προβολή περιβάλλοντος προπαραγωγής
azd env select staging
azd show
```

## Βήμα 8: Καθαρισμός Πόρων

Όταν ολοκληρώσετε τις δοκιμές, καθαρίστε για να αποφύγετε συνεχιζόμενες χρεώσεις:

```bash
# Διαγραφή όλων των πόρων του Azure για το τρέχον περιβάλλον
azd down

# Αναγκαστική διαγραφή χωρίς επιβεβαίωση και οριστική διαγραφή των προσωρινά διαγραμμένων πόρων
azd down --force --purge

# Διαγραφή συγκεκριμένου περιβάλλοντος
azd env select staging
azd down --force --purge
```

## Τι Μάθατε

Συγχαρητήρια! Επιτυχώς:
- ✅ Αρχικοποιήσατε ένα έργο azd από ένα πρότυπο
- ✅ Εξερευνήσατε τη δομή του έργου και τα κύρια αρχεία
- ✅ Αναπτύξατε μια πλήρη εφαρμογή στο Azure
- ✅ Κάνατε αλλαγές κώδικα και επανα-αναπτύξατε
- ✅ Διαχειριστήκατε πολλαπλά περιβάλλοντα
- ✅ Καθαρίσατε πόρους

## 🎯 Ασκήσεις Επικύρωσης Δεξιοτήτων

### Άσκηση 1: Αναπτύξτε ένα διαφορετικό πρότυπο (15 λεπτά)
**Στόχος**: Επιδείξτε την επάρκεια στην αρχικοποίηση azd init και στη ροή ανάπτυξης

```bash
# Δοκιμάστε τη στοίβα Python + MongoDB
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
- [ ] Μπορείτε να αποκτήσετε πρόσβαση στο URL της εφαρμογής στο πρόγραμμα περιήγησης
- [ ] Η εφαρμογή λειτουργεί σωστά (προσθήκη/διαγραφή todos)
- [ ] Καθαρίσατε επιτυχώς όλους τους πόρους

### Άσκηση 2: Προσαρμόστε τη ρύθμιση (20 λεπτά)
**Στόχος**: Εξασκηθείτε στη ρύθμιση μεταβλητών περιβάλλοντος

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
- [ ] Οι μεταβλητές περιβάλλοντος ορίστηκαν και είναι ανακτήσιμες
- [ ] Η εφαρμογή αναπτύσσεται με την προσαρμοσμένη ρύθμιση
- [ ] Μπορείτε να επαληθεύσετε τις προσαρμοσμένες ρυθμίσεις στην αναπτυγμένη εφαρμογή

### Άσκηση 3: Ροή εργασίας πολλαπλών περιβαλλόντων (25 λεπτά)
**Στόχος**: Κατακτήστε τη διαχείριση περιβαλλόντων και στρατηγικές ανάπτυξης

```bash
# Δημιουργήστε περιβάλλον ανάπτυξης
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Σημειώστε το URL του περιβάλλοντος ανάπτυξης
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Δημιουργήστε περιβάλλον staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Σημειώστε το URL του περιβάλλοντος staging
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
- [ ] Μπορείτε να αλλάζετε μεταξύ περιβαλλόντων χρησιμοποιώντας `azd env select`
- [ ] Οι μεταβλητές περιβάλλοντος διαφέρουν μεταξύ περιβαλλόντων
- [ ] Καθαρίσατε επιτυχώς και τα δύο περιβάλλοντα

## 📊 Η Πρόοδός σας

**Επενδεδυμένος Χρόνος**: ~60-90 λεπτά  
**Αποκτηθείσες Δεξιότητες**:
- ✅ Αρχικοποίηση έργου με βάση πρότυπο
- ✅ Παροχή πόρων Azure
- ✅ Ροές εργασίας ανάπτυξης εφαρμογών
- ✅ Διαχείριση περιβαλλοντων
- ✅ Διαχείριση ρυθμίσεων
- ✅ Καθαρισμός πόρων και διαχείριση κόστους

**Επόμενο Επίπεδο**: Είστε έτοιμοι για τον [Configuration Guide](configuration.md) για να μάθετε προχωρημένα μοτίβα ρύθμισης!

## Αντιμετώπιση Συνηθισμένων Προβλημάτων

### Σφάλματα Αυθεντικοποίησης
```bash
# Επαναπιστοποίηση με το Azure
az login

# Επαλήθευση πρόσβασης στη συνδρομή
az account show
```

### Αποτυχίες Ανάπτυξης
```bash
# Ενεργοποιήστε την καταγραφή εντοπισμού σφαλμάτων
export AZD_DEBUG=true
azd up --debug

# Προβολή αρχείων καταγραφής εφαρμογής στο Azure
azd monitor --logs

# Για τις Container Apps, χρησιμοποιήστε το Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Συγκρούσεις Ονομάτων Πόρων
```bash
# Χρησιμοποιήστε ένα μοναδικό όνομα περιβάλλοντος
azd env new dev-$(whoami)-$(date +%s)
```

### Προβλήματα Θύρας/Δικτύου
```bash
# Έλεγχος αν οι θύρες είναι διαθέσιμες
netstat -an | grep :3000
netstat -an | grep :3100
```

## Επόμενα Βήματα

Τώρα που ολοκληρώσατε το πρώτο σας έργο, εξερευνήστε αυτά τα προχωρημένα θέματα:

### 1. Προσαρμόστε την Υποδομή
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Ρυθμίστε CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Πλήρεις ροές εργασίας CI/CD
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Ρύθμιση pipeline

### 3. Καλές Πρακτικές για Παραγωγή
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

### Υλικό Μάθησης
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Κοινότητα & Υποστήριξη
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Πρότυπα & Παραδείγματα
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Συγχαρητήρια για την ολοκλήρωση του πρώτου σας έργου με το azd!** Είστε πλέον έτοιμοι να δημιουργείτε και να αναπτύσσετε υπέροχες εφαρμογές στο Azure με αυτοπεποίθηση.

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Κεφάλαιο 1 - Θεμέλια & Γρήγορη Εκκίνηση
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:
Το παρόν έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες συνιστάται η χρήση επαγγελματικής ανθρώπινης μετάφρασης. Δεν φέρουμε ευθύνη για τυχόν παρερμηνείες ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->