# Οδηγός Εγκατάστασης & Ρύθμισης

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάση & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Βασικά AZD](azd-basics.md)
- **➡️ Επόμενο**: [Το Πρώτο Σας Έργο](first-project.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: Ανάπτυξη με AI](../microsoft-foundry/microsoft-foundry-integration.md)

## Εισαγωγή

Αυτός ο αναλυτικός οδηγός θα σας καθοδηγήσει στην εγκατάσταση και τη ρύθμιση του Azure Developer CLI (azd) στο σύστημά σας. Θα μάθετε διάφορες μεθόδους εγκατάστασης για διαφορετικά λειτουργικά συστήματα, τη ρύθμιση πιστοποίησης και την αρχική διαμόρφωση για να προετοιμάσετε το περιβάλλον ανάπτυξης σας για αναπτύξεις στο Azure.

## Στόχοι Μάθησης

Μέχρι το τέλος αυτού του μαθήματος, θα:
- Έχετε εγκαταστήσει επιτυχώς το Azure Developer CLI στο λειτουργικό σας σύστημα
- Ρυθμίσετε την πιστοποίηση με το Azure χρησιμοποιώντας πολλαπλές μεθόδους
- Ετοιμάσετε το περιβάλλον ανάπτυξης σας με τις απαραίτητες προϋποθέσεις
- Κατανοήσετε τις διαφορετικές επιλογές εγκατάστασης και πότε να χρησιμοποιήσετε την κάθε μία
- Αντιμετωπίσετε κοινά προβλήματα εγκατάστασης και ρύθμισης

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε:
- Να εγκαταστήσετε το azd χρησιμοποιώντας την κατάλληλη μέθοδο για την πλατφόρμα σας
- Να πιστοποιηθείτε με το Azure χρησιμοποιώντας το azd auth login
- Να επαληθεύσετε την εγκατάσταση και να δοκιμάσετε βασικές εντολές azd
- Να διαμορφώσετε το περιβάλλον ανάπτυξης σας για βέλτιστη χρήση του azd
- Να επιλύσετε ανεξάρτητα κοινά προβλήματα εγκατάστασης

Αυτός ο οδηγός θα σας βοηθήσει να εγκαταστήσετε και να ρυθμίσετε το Azure Developer CLI στο σύστημά σας, ανεξάρτητα από το λειτουργικό σας σύστημα ή το περιβάλλον ανάπτυξης.

## Προαπαιτούμενα

Πριν εγκαταστήσετε το azd, βεβαιωθείτε ότι έχετε:
- **Συνδρομή Azure** - [Δημιουργήστε έναν δωρεάν λογαριασμό](https://azure.microsoft.com/free/)
- **Azure CLI** - Για πιστοποίηση και διαχείριση πόρων
- **Git** - Για κλωνοποίηση προτύπων και έλεγχο εκδόσεων
- **Docker** (προαιρετικό) - Για εφαρμογές σε κοντέινερ

## Μέθοδοι Εγκατάστασης

### Windows

#### Επιλογή 1: PowerShell (Συνιστάται)
```powershell
# Εκτελέστε ως Διαχειριστής ή με αυξημένα δικαιώματα
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Επιλογή 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Επιλογή 3: Chocolatey
```cmd
choco install azd
```

#### Επιλογή 4: Χειροκίνητη Εγκατάσταση
1. Κατεβάστε την τελευταία έκδοση από [GitHub](https://github.com/Azure/azure-dev/releases)
2. Εξαγάγετε στο `C:\Program Files\azd\`
3. Προσθέστε στη μεταβλητή περιβάλλοντος PATH

### macOS

#### Επιλογή 1: Homebrew (Συνιστάται)
```bash
brew tap azure/azd
brew install azd
```

#### Επιλογή 2: Εγκατάσταση μέσω Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Επιλογή 3: Χειροκίνητη Εγκατάσταση
```bash
# Λήψη και εγκατάσταση
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Επιλογή 1: Εγκατάσταση μέσω Script (Συνιστάται)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Επιλογή 2: Διαχειριστές Πακέτων

**Ubuntu/Debian:**
```bash
# Προσθήκη αποθετηρίου πακέτων Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Εγκατάσταση azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Προσθήκη αποθετηρίου πακέτων της Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

Το azd είναι προεγκατεστημένο στο GitHub Codespaces. Απλά δημιουργήστε ένα codespace και ξεκινήστε να χρησιμοποιείτε το azd αμέσως.

### Docker

```bash
# Εκτελέστε το azd σε ένα κοντέινερ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Δημιουργήστε ένα ψευδώνυμο για ευκολότερη χρήση
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Επαλήθευση Εγκατάστασης

Μετά την εγκατάσταση, επαληθεύστε ότι το azd λειτουργεί σωστά:

```bash
# Έλεγχος έκδοσης
azd version

# Προβολή βοήθειας
azd --help

# Λίστα διαθέσιμων προτύπων
azd template list
```

Αναμενόμενο αποτέλεσμα:
```
azd version 1.5.0 (commit abc123)
```

**✅ Λίστα Ελέγχου Επιτυχίας Εγκατάστασης:**
- [ ] Το `azd version` εμφανίζει τον αριθμό έκδοσης χωρίς σφάλματα
- [ ] Το `azd --help` εμφανίζει την τεκμηρίωση εντολών
- [ ] Το `azd template list` εμφανίζει διαθέσιμα πρότυπα
- [ ] Το `az account show` εμφανίζει τη συνδρομή σας στο Azure
- [ ] Μπορείτε να δημιουργήσετε έναν δοκιμαστικό φάκελο και να εκτελέσετε το `azd init` επιτυχώς

**Αν όλα τα σημεία ελέγχου περάσουν, είστε έτοιμοι να προχωρήσετε στο [Το Πρώτο Σας Έργο](first-project.md)!**

## Ρύθμιση Πιστοποίησης

### Πιστοποίηση μέσω Azure CLI (Συνιστάται)
```bash
# Εγκαταστήστε το Azure CLI αν δεν είναι ήδη εγκατεστημένο
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Συνδεθείτε στο Azure
az login

# Επαληθεύστε την αυθεντικοποίηση
az account show
```

### Πιστοποίηση μέσω Κωδικού Συσκευής
Αν βρίσκεστε σε σύστημα χωρίς γραφικό περιβάλλον ή αντιμετωπίζετε προβλήματα με τον περιηγητή:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Για αυτοματοποιημένα περιβάλλοντα:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Διαμόρφωση

### Παγκόσμια Διαμόρφωση
```bash
# Ορίστε την προεπιλεγμένη συνδρομή
azd config set defaults.subscription <subscription-id>

# Ορίστε την προεπιλεγμένη τοποθεσία
azd config set defaults.location eastus2

# Προβολή όλων των ρυθμίσεων
azd config list
```

### Μεταβλητές Περιβάλλοντος
Προσθέστε στο προφίλ του shell σας (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Διαμόρφωση Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Διαμόρφωση azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ενεργοποίηση καταγραφής αποσφαλμάτωσης
```

## Ενσωμάτωση IDE

### Visual Studio Code
Εγκαταστήστε την επέκταση Azure Developer CLI:
1. Ανοίξτε το VS Code
2. Μεταβείτε στις Επεκτάσεις (Ctrl+Shift+X)
3. Αναζητήστε "Azure Developer CLI"
4. Εγκαταστήστε την επέκταση

Χαρακτηριστικά:
- IntelliSense για το azure.yaml
- Ενσωματωμένες εντολές τερματικού
- Περιήγηση προτύπων
- Παρακολούθηση ανάπτυξης

### GitHub Codespaces
Δημιουργήστε ένα `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Εγκαταστήστε το plugin Azure
2. Ρυθμίστε τα διαπιστευτήρια Azure
3. Χρησιμοποιήστε το ενσωματωμένο τερματικό για εντολές azd

## 🐛 Αντιμετώπιση Προβλημάτων Εγκατάστασης

### Κοινά Προβλήματα

#### Άρνηση Άδειας (Windows)
```powershell
# Εκτελέστε το PowerShell ως Διαχειριστής
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Προβλήματα PATH
Προσθέστε χειροκίνητα το azd στο PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Προβλήματα Δικτύου/Proxy
```bash
# Ρύθμιση διαμεσολαβητή
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Παράβλεψη επαλήθευσης SSL (δεν συνιστάται για παραγωγή)
azd config set http.insecure true
```

#### Συγκρούσεις Έκδοσης
```bash
# Αφαιρέστε παλιές εγκαταστάσεις
# Windows: winget απεγκατάσταση Microsoft.Azd
# macOS: brew απεγκατάσταση azd
# Linux: sudo apt αφαίρεση azd

# Καθαρίστε τη διαμόρφωση
rm -rf ~/.azd
```

### Λήψη Περισσότερης Βοήθειας
```bash
# Ενεργοποίηση καταγραφής αποσφαλμάτωσης
export AZD_DEBUG=true
azd <command> --debug

# Προβολή λεπτομερών καταγραφών
azd logs

# Έλεγχος πληροφοριών συστήματος
azd info
```

## Ενημέρωση azd

### Αυτόματες Ενημερώσεις
Το azd θα σας ειδοποιήσει όταν υπάρχουν διαθέσιμες ενημερώσεις:
```bash
azd version --check-for-updates
```

### Χειροκίνητες Ενημερώσεις

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Συχνές Ερωτήσεις

<details>
<summary><strong>Ποια είναι η διαφορά μεταξύ azd και az CLI;</strong></summary>

**Azure CLI (az)**: Εργαλείο χαμηλού επιπέδου για τη διαχείριση μεμονωμένων πόρων Azure
- `az webapp create`, `az storage account create`
- Ένας πόρος τη φορά
- Εστίαση στη διαχείριση υποδομής

**Azure Developer CLI (azd)**: Εργαλείο υψηλού επιπέδου για πλήρεις αναπτύξεις εφαρμογών
- Το `azd up` αναπτύσσει ολόκληρη την εφαρμογή με όλους τους πόρους
- Ροές εργασίας βασισμένες σε πρότυπα
- Εστίαση στην παραγωγικότητα των προγραμματιστών

**Χρειάζεστε και τα δύο**: Το azd χρησιμοποιεί το az CLI για πιστοποίηση
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω το azd με υπάρχοντες πόρους Azure;</strong></summary>

Ναι! Μπορείτε:
1. Να εισάγετε υπάρχοντες πόρους σε περιβάλλοντα azd
2. Να αναφέρετε υπάρχοντες πόρους στα πρότυπα Bicep σας
3. Να χρησιμοποιήσετε το azd για νέες αναπτύξεις παράλληλα με την υπάρχουσα υποδομή

Δείτε τον [Οδηγό Διαμόρφωσης](configuration.md) για λεπτομέρειες.
</details>

<details>
<summary><strong>Λειτουργεί το azd με το Azure Government ή το Azure China;</strong></summary>

Ναι, διαμορφώστε το cloud:
```bash
# Azure Κυβέρνηση
az cloud set --name AzureUSGovernment
az login

# Azure Κίνα
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω το azd σε CI/CD pipelines;</strong></summary>

Απολύτως! Το azd είναι σχεδιασμένο για αυτοματοποίηση:
- Ενσωμάτωση με GitHub Actions
- Υποστήριξη Azure DevOps
- Πιστοποίηση μέσω service principal
- Λειτουργία χωρίς αλληλεπίδραση

Δείτε τον [Οδηγό Ανάπτυξης](../deployment/deployment-guide.md) για μοτίβα CI/CD.
</details>

<details>
<summary><strong>Ποιο είναι το κόστος χρήσης του azd;</strong></summary>

Το azd είναι **εντελώς δωρεάν** και ανοιχτού κώδικα. Πληρώνετε μόνο για:
- Πόρους Azure που αναπτύσσετε
- Κόστη κατανάλωσης Azure (υπολογισμός, αποθήκευση κ.λπ.)

Χρησιμοποιήστε το `azd provision --preview` για να εκτιμήσετε τα κόστη πριν την ανάπτυξη.
</details>

## Επόμενα Βήματα

1. **Ολοκληρώστε την πιστοποίηση**: Βεβαιωθείτε ότι μπορείτε να έχετε πρόσβαση στη συνδρομή σας στο Azure
2. **Δοκιμάστε την πρώτη σας ανάπτυξη**: Ακολουθήστε τον [Οδηγό Πρώτου Έργου](first-project.md)
3. **Εξερευνήστε πρότυπα**: Περιηγηθείτε στα διαθέσιμα πρότυπα με το `azd template list`
4. **Διαμορφώστε το IDE σας**: Ρυθμίστε το περιβάλλον ανάπτυξης σας

## Υποστήριξη

Αν αντιμετωπίσετε προβλήματα:
- [Επίσημη Τεκμηρίωση](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Αναφορά Προβλημάτων](https://github.com/Azure/azure-dev/issues)
- [Συζητήσεις Κοινότητας](https://github.com/Azure/azure-dev/discussions)
- [Υποστήριξη Azure](https://azure.microsoft.com/support/)

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάση & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Βασικά AZD](azd-basics.md) 
- **➡️ Επόμενο**: [Το Πρώτο Σας Έργο](first-project.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: Ανάπτυξη με AI](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Εγκατάσταση Ολοκληρώθηκε!** Συνεχίστε στο [Το Πρώτο Σας Έργο](first-project.md) για να ξεκινήσετε να δημιουργείτε με το azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης AI [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->