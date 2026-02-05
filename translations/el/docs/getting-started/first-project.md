# Το Πρώτο Σας Έργο - Εκπαιδευτικό Εγχειρίδιο

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάση & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Εγκατάσταση & Ρύθμιση](installation.md)
- **➡️ Επόμενο**: [Διαμόρφωση](configuration.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στην Τεχνητή Νοημοσύνη](../microsoft-foundry/microsoft-foundry-integration.md)

## Εισαγωγή

Καλώς ήρθατε στο πρώτο σας έργο με το Azure Developer CLI! Αυτό το ολοκληρωμένο εκπαιδευτικό εγχειρίδιο σας παρέχει μια πλήρη καθοδήγηση για τη δημιουργία, την ανάπτυξη και τη διαχείριση μιας εφαρμογής πλήρους στοίβας στο Azure χρησιμοποιώντας το azd. Θα εργαστείτε με μια πραγματική εφαρμογή todo που περιλαμβάνει frontend React, backend API Node.js και βάση δεδομένων MongoDB.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του εγχειριδίου, θα:
- Κατανοήσετε τη διαδικασία αρχικοποίησης έργου azd χρησιμοποιώντας πρότυπα
- Κατανοήσετε τη δομή έργου και τα αρχεία διαμόρφωσης του Azure Developer CLI
- Εκτελέσετε πλήρη ανάπτυξη εφαρμογής στο Azure με παροχή υποδομής
- Εφαρμόσετε ενημερώσεις εφαρμογής και στρατηγικές επανα-ανάπτυξης
- Διαχειριστείτε πολλαπλά περιβάλλοντα για ανάπτυξη και δοκιμές
- Εφαρμόσετε πρακτικές καθαρισμού πόρων και διαχείρισης κόστους

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα μπορείτε να:
- Αρχικοποιήσετε και να διαμορφώσετε έργα azd από πρότυπα ανεξάρτητα
- Πλοηγηθείτε και να τροποποιήσετε αποτελεσματικά τις δομές έργων azd
- Αναπτύξετε εφαρμογές πλήρους στοίβας στο Azure με μία εντολή
- Αντιμετωπίσετε κοινά προβλήματα ανάπτυξης και αυθεντικοποίησης
- Διαχειριστείτε πολλαπλά περιβάλλοντα Azure για διαφορετικά στάδια ανάπτυξης
- Εφαρμόσετε συνεχείς ροές ανάπτυξης για ενημερώσεις εφαρμογών

## Ξεκινώντας

### Λίστα Ελέγχου Προαπαιτούμενων
- ✅ Εγκατεστημένο Azure Developer CLI ([Οδηγός Εγκατάστασης](installation.md))
- ✅ Εγκατεστημένο και αυθεντικοποιημένο Azure CLI
- ✅ Εγκατεστημένο Git στο σύστημά σας
- ✅ Node.js 16+ (για αυτό το εγχειρίδιο)
- ✅ Visual Studio Code (συνιστάται)

### Επαλήθευση Ρύθμισης
```bash
# Ελέγξτε την εγκατάσταση azd
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
# Περιηγηθείτε στα διαθέσιμα πρότυπα
azd template list

# Αρχικοποιήστε το πρότυπο εφαρμογής todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Ακολουθήστε τις οδηγίες:
# - Εισάγετε ένα όνομα περιβάλλοντος: "dev"
# - Επιλέξτε μια συνδρομή (αν έχετε πολλαπλές)
# - Επιλέξτε μια περιοχή: "East US 2" (ή την προτιμώμενη περιοχή σας)
```

### Τι Μόλις Συνέβη;
- Κατεβάσατε τον κώδικα του προτύπου στον τοπικό σας κατάλογο
- Δημιουργήθηκε ένα αρχείο `azure.yaml` με ορισμούς υπηρεσιών
- Ρυθμίστηκε κώδικας υποδομής στον κατάλογο `infra/`
- Δημιουργήθηκε μια διαμόρφωση περιβάλλοντος

## Βήμα 2: Εξερεύνηση Δομής Έργου

Ας εξετάσουμε τι δημιούργησε το azd για εμάς:

```bash
# Δείτε τη δομή του έργου
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

**azure.yaml** - Η καρδιά του έργου σας azd:
```bash
# Δείτε τη διαμόρφωση του έργου
cat azure.yaml
```

**infra/main.bicep** - Ορισμός υποδομής:
```bash
# Δείτε τον κώδικα υποδομής
head -30 infra/main.bicep
```

## Βήμα 3: Προσαρμογή Έργου (Προαιρετικό)

Πριν την ανάπτυξη, μπορείτε να προσαρμόσετε την εφαρμογή:

### Τροποποίηση Frontend
```bash
# Άνοιξε το συστατικό εφαρμογής React
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

## Βήμα 4: Ανάπτυξη στο Azure

Τώρα το συναρπαστικό μέρος - αναπτύξτε τα πάντα στο Azure!

```bash
# Ανάπτυξη υποδομής και εφαρμογής
azd up

# Αυτή η εντολή θα:
# 1. Παρέχει πόρους Azure (App Service, Cosmos DB, κ.λπ.)
# 2. Δημιουργήσει την εφαρμογή σας
# 3. Αναπτύξει στους παρεχόμενους πόρους
# 4. Εμφανίσει τη διεύθυνση URL της εφαρμογής
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

## Βήμα 5: Δοκιμή της Εφαρμογής Σας

### Πρόσβαση στην Εφαρμογή Σας
Κάντε κλικ στο URL που παρέχεται στο αποτέλεσμα της ανάπτυξης ή αποκτήστε το οποιαδήποτε στιγμή:
```bash
# Λάβετε τα τελικά σημεία της εφαρμογής
azd show

# Ανοίξτε την εφαρμογή στον περιηγητή σας
azd show --output json | jq -r '.services.web.endpoint'
```

### Δοκιμή της Εφαρμογής Todo
1. **Προσθήκη στοιχείου todo** - Κάντε κλικ στο "Add Todo" και εισάγετε μια εργασία
2. **Σήμανση ως ολοκληρωμένο** - Επιλέξτε ολοκληρωμένα στοιχεία
3. **Διαγραφή στοιχείων** - Αφαιρέστε τα todos που δεν χρειάζεστε πλέον

### Παρακολούθηση της Εφαρμογής Σας
```bash
# Ανοίξτε την πύλη Azure για τους πόρους σας
azd monitor

# Προβολή αρχείων καταγραφής εφαρμογής
azd logs
```

## Βήμα 6: Κάντε Αλλαγές και Επανα-Αναπτύξτε

Ας κάνουμε μια αλλαγή και ας δούμε πόσο εύκολο είναι να ενημερώσετε:

### Τροποποίηση API
```bash
# Επεξεργαστείτε τον κώδικα API
code src/api/src/routes/lists.js
```

Προσθέστε μια προσαρμοσμένη κεφαλίδα απάντησης:
```javascript
// Βρείτε έναν χειριστή διαδρομής και προσθέστε:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Ανάπτυξη Μόνο των Αλλαγών Κώδικα
```bash
# Αναπτύξτε μόνο τον κώδικα της εφαρμογής (παραλείψτε την υποδομή)
azd deploy

# Αυτό είναι πολύ πιο γρήγορο από το 'azd up' καθώς η υποδομή υπάρχει ήδη
```

## Βήμα 7: Διαχείριση Πολλαπλών Περιβαλλόντων

Δημιουργήστε ένα περιβάλλον δοκιμών για να δοκιμάσετε αλλαγές πριν την παραγωγή:

```bash
# Δημιουργήστε ένα νέο περιβάλλον προετοιμασίας
azd env new staging

# Αναπτύξτε στο περιβάλλον προετοιμασίας
azd up

# Επιστρέψτε στο περιβάλλον ανάπτυξης
azd env select dev

# Καταγράψτε όλα τα περιβάλλοντα
azd env list
```

### Σύγκριση Περιβαλλόντων
```bash
# Προβολή περιβάλλοντος ανάπτυξης
azd env select dev
azd show

# Προβολή περιβάλλοντος σταδιοποίησης
azd env select staging
azd show
```

## Βήμα 8: Καθαρισμός Πόρων

Όταν τελειώσετε με τις δοκιμές, καθαρίστε για να αποφύγετε συνεχιζόμενες χρεώσεις:

```bash
# Διαγραφή όλων των πόρων Azure για το τρέχον περιβάλλον
azd down

# Αναγκαστική διαγραφή χωρίς επιβεβαίωση και εκκαθάριση πόρων που έχουν διαγραφεί προσωρινά
azd down --force --purge

# Διαγραφή συγκεκριμένου περιβάλλοντος
azd env select staging
azd down --force --purge
```

## Τι Έχετε Μάθει

Συγχαρητήρια! Έχετε επιτυχώς:
- ✅ Αρχικοποιήσει ένα έργο azd από πρότυπο
- ✅ Εξερευνήσει τη δομή έργου και τα βασικά αρχεία
- ✅ Αναπτύξει μια εφαρμογή πλήρους στοίβας στο Azure
- ✅ Κάνει αλλαγές κώδικα και επανα-αναπτύξει
- ✅ Διαχειριστεί πολλαπλά περιβάλλοντα
- ✅ Καθαρίσει πόρους

## 🎯 Ασκήσεις Επικύρωσης Δεξιοτήτων

### Άσκηση 1: Ανάπτυξη Διαφορετικού Προτύπου (15 λεπτά)
**Στόχος**: Επιδείξτε την κατανόηση της διαδικασίας αρχικοποίησης και ανάπτυξης azd

```bash
# Δοκιμάστε τη στοίβα Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Επαληθεύστε την ανάπτυξη
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Καθαρισμός
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Η εφαρμογή αναπτύσσεται χωρίς σφάλματα
- [ ] Μπορείτε να αποκτήσετε πρόσβαση στο URL της εφαρμογής στον περιηγητή
- [ ] Η εφαρμογή λειτουργεί σωστά (προσθήκη/αφαίρεση todos)
- [ ] Έχετε καθαρίσει επιτυχώς όλους τους πόρους

### Άσκηση 2: Προσαρμογή Διαμόρφωσης (20 λεπτά)
**Στόχος**: Εξασκηθείτε στη διαμόρφωση μεταβλητών περιβάλλοντος

```bash
cd my-first-azd-app

# Δημιουργία προσαρμοσμένου περιβάλλοντος
azd env new custom-config

# Ορισμός προσαρμοσμένων μεταβλητών
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Επαλήθευση μεταβλητών
azd env get-values | grep APP_TITLE

# Ανάπτυξη με προσαρμοσμένη διαμόρφωση
azd up
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκε επιτυχώς προσαρμοσμένο περιβάλλον
- [ ] Οι μεταβλητές περιβάλλοντος έχουν οριστεί και είναι ανακτήσιμες
- [ ] Η εφαρμογή αναπτύσσεται με προσαρμοσμένη διαμόρφωση
- [ ] Μπορείτε να επαληθεύσετε τις προσαρμοσμένες ρυθμίσεις στην αναπτυγμένη εφαρμογή

### Άσκηση 3: Ροή Πολλαπλών Περιβαλλόντων (25 λεπτά)
**Στόχος**: Κατανοήστε τη διαχείριση περιβαλλόντων και στρατηγικές ανάπτυξης

```bash
# Δημιουργία περιβάλλοντος ανάπτυξης
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Σημειώστε τη διεύθυνση URL ανάπτυξης
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Δημιουργία περιβάλλοντος δοκιμών
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Σημειώστε τη διεύθυνση URL δοκιμών
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Συγκρίνετε τα περιβάλλοντα
azd env list

# Δοκιμάστε και τα δύο περιβάλλοντα
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Καθαρίστε και τα δύο
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκαν δύο περιβάλλοντα με διαφορετικές διαμορφώσεις
- [ ] Και τα δύο περιβάλλοντα αναπτύχθηκαν επιτυχώς
- [ ] Μπορείτε να εναλλάσσετε μεταξύ περιβαλλόντων χρησιμοποιώντας `azd env select`
- [ ] Οι μεταβλητές περιβάλλοντος διαφέρουν μεταξύ των περιβαλλόντων
- [ ] Έχετε καθαρίσει επιτυχώς και τα δύο περιβάλλοντα

## 📊 Η Πρόοδός Σας

**Χρόνος Επένδυσης**: ~60-90 λεπτά  
**Αποκτηθείσες Δεξιότητες**:
- ✅ Αρχικοποίηση έργου με βάση πρότυπα
- ✅ Παροχή πόρων Azure
- ✅ Ροές ανάπτυξης εφαρμογών
- ✅ Διαχείριση περιβαλλόντων
- ✅ Διαχείριση διαμόρφωσης
- ✅ Καθαρισμός πόρων και διαχείριση κόστους

**Επόμενο Επίπεδο**: Είστε έτοιμοι για [Οδηγό Διαμόρφωσης](configuration.md) για να μάθετε προηγμένα μοτίβα διαμόρφωσης!

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
# Ενεργοποίηση καταγραφής αποσφαλμάτωσης
export AZD_DEBUG=true
azd up --debug

# Προβολή λεπτομερών καταγραφών
azd logs --service api
azd logs --service web
```

### Συγκρούσεις Ονομάτων Πόρων
```bash
# Χρησιμοποιήστε ένα μοναδικό όνομα περιβάλλοντος
azd env new dev-$(whoami)-$(date +%s)
```

### Θέματα Θυρών/Δικτύου
```bash
# Ελέγξτε αν οι θύρες είναι διαθέσιμες
netstat -an | grep :3000
netstat -an | grep :3100
```

## Επόμενα Βήματα

Τώρα που ολοκληρώσατε το πρώτο σας έργο, εξερευνήστε αυτά τα προηγμένα θέματα:

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

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάση & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Εγκατάσταση & Ρύθμιση](installation.md)
- **➡️ Επόμενο**: [Διαμόρφωση](configuration.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στην Τεχνητή Νοημοσύνη](../microsoft-foundry/microsoft-foundry-integration.md)
- **Επόμενο Μάθημα**: [Οδηγός Ανάπτυξης](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->