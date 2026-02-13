# Οδηγός Εγκατάστασης & Ρύθμισης

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάσεις & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [AZD Basics](azd-basics.md)
- **➡️ Επόμενο**: [Το Πρώτο σας Έργο](first-project.md)
- **🚀 Επόμενο Κεφάλαιο**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός θα σας καθοδηγήσει στην εγκατάσταση και διαμόρφωση του Azure Developer CLI (azd) στο σύστημά σας. Θα μάθετε πολλούς τρόπους εγκατάστασης για διαφορετικά λειτουργικά συστήματα, ρύθμιση πιστοποίησης και αρχική διαμόρφωση για να προετοιμάσετε το περιβάλλον ανάπτυξής σας για αναπτύξεις στο Azure.

## Στόχοι Μάθησης

Μέχρι το τέλος αυτού του μαθήματος, θα:
- Να εγκαταστήσετε επιτυχώς το Azure Developer CLI στο λειτουργικό σας σύστημα
- Να διαμορφώσετε την πιστοποίηση με το Azure χρησιμοποιώντας πολλούς τρόπους
- Να ρυθμίσετε το περιβάλλον ανάπτυξής σας με τα απαραίτητα προαπαιτούμενα
- Να κατανοήσετε τις διαφορετικές επιλογές εγκατάστασης και πότε να χρησιμοποιείτε κάθε μία
- Να αντιμετωπίζετε κοινά προβλήματα εγκατάστασης και ρύθμισης

## Μαθησιακά Αποτελέσματα

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Εγκαταστήσετε το azd χρησιμοποιώντας την κατάλληλη μέθοδο για την πλατφόρμα σας
- Πιστοποιηθείτε στο Azure χρησιμοποιώντας azd auth login
- Επαληθεύσετε την εγκατάστασή σας και δοκιμάσετε βασικές εντολές azd
- Διαμορφώσετε το περιβάλλον ανάπτυξής σας για βέλτιστη χρήση του azd
- Επιλύσετε κοινά προβλήματα εγκατάστασης ανεξάρτητα

Αυτός ο οδηγός θα σας βοηθήσει να εγκαταστήσετε και να διαμορφώσετε το Azure Developer CLI στο σύστημά σας, ανεξάρτητα από το λειτουργικό σύστημα ή το περιβάλλον ανάπτυξης.

## Προαπαιτούμενα

Πριν εγκαταστήσετε το azd, βεβαιωθείτε ότι έχετε:
- **Συνδρομή Azure** - [Δημιουργήστε δωρεάν λογαριασμό](https://azure.microsoft.com/free/)
- **Azure CLI** - Για πιστοποίηση και διαχείριση πόρων
- **Git** - Για κλωνοποίηση προτύπων και έλεγχο εκδόσεων
- **Docker** (προαιρετικό) - Για εφαρμογές σε κοντέινερ

## Μέθοδοι Εγκατάστασης

### Windows

#### Επιλογή 1: PowerShell (Συνιστάται)
```powershell
# Εκτελέστε ως Διαχειριστής ή με αυξημένα προνόμια
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
2. Αποσυμπιέστε στο `C:\Program Files\azd\`
3. Προσθέστε στη μεταβλητή περιβάλλοντος PATH

### macOS

#### Επιλογή 1: Homebrew (Συνιστάται)
```bash
brew tap azure/azd
brew install azd
```

#### Επιλογή 2: Script Εγκατάστασης
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Επιλογή 3: Χειροκίνητη Εγκατάσταση
```bash
# Λήψη και εγκατάσταση
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Επιλογή 1: Script Εγκατάστασης (Συνιστάται)
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

Το azd είναι προεγκατεστημένο στο GitHub Codespaces. Απλώς δημιουργήστε ένα codespace και ξεκινήστε να χρησιμοποιείτε το azd άμεσα.

### Docker

```bash
# Εκτελέστε το azd μέσα σε κοντέινερ
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

Αναμενόμενη έξοδος:
```
azd version 1.x.x (commit xxxxxx)
```

**Σημείωση**: Ο πραγματικός αριθμός έκδοσης ενδέχεται να διαφέρει. Ελέγξτε τις [Κυκλοφορίες Azure Developer CLI](https://github.com/Azure/azure-dev/releases) για την τελευταία έκδοση.

**✅ Λίστα Ελέγχου Επιτυχούς Εγκατάστασης:**
- [ ] `azd version` εμφανίζει αριθμό έκδοσης χωρίς σφάλματα
- [ ] `azd --help` εμφανίζει τεκμηρίωση εντολών
- [ ] `azd template list` εμφανίζει διαθέσιμα πρότυπα
- [ ] `az account show` εμφανίζει τη συνδρομή Azure σας
- [ ] Μπορείτε να δημιουργήσετε ένα δοκιμαστικό φάκελο και να εκτελέσετε `azd init` επιτυχώς

**Εάν όλοι οι έλεγχοι περάσουν, είστε έτοιμοι να προχωρήσετε στο [Το Πρώτο σας Έργο](first-project.md)!**

## Ρύθμιση Πιστοποίησης

### Πιστοποίηση Azure CLI (Συνιστάται)
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

### Πιστοποίηση με Device Code
Αν βρίσκεστε σε μηχανή χωρίς γραφικό περιβάλλον ή αντιμετωπίζετε προβλήματα με το πρόγραμμα περιήγησης:
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
# Ορισμός προεπιλεγμένης συνδρομής
azd config set defaults.subscription <subscription-id>

# Ορισμός προεπιλεγμένης τοποθεσίας
azd config set defaults.location eastus2

# Προβολή όλης της διαμόρφωσης
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
2. Πηγαίνετε στις Επεκτάσεις (Ctrl+Shift+X)
3. Αναζητήστε "Azure Developer CLI"
4. Εγκαταστήστε την επέκταση

Χαρακτηριστικά:
- IntelliSense για azure.yaml
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
1. Εγκαταστήστε το πρόσθετο Azure
2. Διαμορφώστε τα διαπιστευτήρια Azure
3. Χρησιμοποιήστε το ενσωματωμένο τερματικό για εντολές azd

## 🐛 Επίλυση Προβλημάτων Εγκατάστασης

### Συνήθη Προβλήματα

#### Άρνηση Δικαιωμάτων (Windows)
```powershell
# Εκτελέστε το PowerShell ως Διαχειριστής
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Προβλήματα PATH
Προσθέστε χειροκίνητα το azd στο PATH σας:

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
# Ρυθμίστε τον διακομιστή μεσολάβησης
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Παράκαμψη της επαλήθευσης SSL (δεν συνιστάται για περιβάλλον παραγωγής)
azd config set http.insecure true
```

#### Συγκρούσεις Εκδόσεων
```bash
# Αφαιρέστε τις παλιές εγκαταστάσεις
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Καθαρίστε τη διαμόρφωση
rm -rf ~/.azd
```

### Λήψη Περισσότερης Βοήθειας
```bash
# Ενεργοποίηση καταγραφής εντοπισμού σφαλμάτων
export AZD_DEBUG=true
azd <command> --debug

# Προβολή τρέχουσας διαμόρφωσης
azd config list

# Προβολή τρέχουσας κατάστασης ανάπτυξης
azd show
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

**Azure CLI (az)**: Εργαλείο χαμηλού επιπέδου για διαχείριση μεμονωμένων πόρων Azure
- `az webapp create`, `az storage account create`
- Ένας πόρος ανά φορά
- Εστίαση στη διαχείριση υποδομής

**Azure Developer CLI (azd)**: Εργαλείο υψηλού επιπέδου για ολοκληρωμένες αναπτύξεις εφαρμογών
- `azd up` αναπτύσσει ολόκληρη εφαρμογή με όλους τους πόρους
- Ροές εργασίας βασισμένες σε πρότυπα
- Εστίαση στην παραγωγικότητα των προγραμματιστών

**Χρειάζεστε και τα δύο**: το azd χρησιμοποιεί το az CLI για πιστοποίηση
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω το azd με υπάρχοντες πόρους Azure;</strong></summary>

Ναι! Μπορείτε:
1. Εισάγετε υπάρχοντες πόρους σε περιβάλλοντα azd
2. Αναφερθείτε σε υπάρχοντες πόρους στα πρότυπα Bicep σας
3. Χρησιμοποιήστε το azd για νέες αναπτύξεις παράλληλα με την υπάρχουσα υποδομή

Δείτε τον [Οδηγό Διαμόρφωσης](configuration.md) για λεπτομέρειες.
</details>

<details>
<summary><strong>Λειτουργεί το azd με Azure Government ή Azure China;</strong></summary>

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
<summary><strong>Μπορώ να χρησιμοποιήσω το azd σε pipelines CI/CD;</strong></summary>

Απολύτως! Το azd είναι σχεδιασμένο για αυτοματοποίηση:
- Ενσωμάτωση με GitHub Actions
- Υποστήριξη Azure DevOps
- Πιστοποίηση με service principal
- Λειτουργία χωρίς διάδραση

Δείτε τον [Οδηγό Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md) για πρότυπα CI/CD.
</details>

<details>
<summary><strong>Πόσο κοστίζει η χρήση του azd;</strong></summary>

Το azd από μόνο του είναι **εντελώς δωρεάν** και ανοιχτού κώδικα. Πληρώνετε μόνο για:
- Τους πόρους Azure που αναπτύσσετε
- Το κόστος κατανάλωσης στο Azure (υπολογιστική ισχύς, αποθήκευση, κ.λπ.)

Χρησιμοποιήστε `azd provision --preview` για να εκτιμήσετε τα κόστη πριν την ανάπτυξη.
</details>

## Επόμενα Βήματα

1. **Ολοκληρώστε την πιστοποίηση**: Βεβαιωθείτε ότι μπορείτε να αποκτήσετε πρόσβαση στη συνδρομή Azure σας
2. **Δοκιμάστε την πρώτη σας ανάπτυξη**: Ακολουθήστε τον [Οδηγό Πρώτου Έργου](first-project.md)
3. **Εξερευνήστε πρότυπα**: Περιηγηθείτε στα διαθέσιμα πρότυπα με `azd template list`
4. **Διαμορφώστε το IDE σας**: Ρυθμίστε το περιβάλλον ανάπτυξής σας

## Υποστήριξη

Εάν αντιμετωπίσετε προβλήματα:
- [Επίσημη Τεκμηρίωση](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Αναφορά Προβλημάτων](https://github.com/Azure/azure-dev/issues)
- [Συζητήσεις Κοινότητας](https://github.com/Azure/azure-dev/discussions)
- [Υποστήριξη Azure](https://azure.microsoft.com/support/)

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάσεις & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [AZD Basics](azd-basics.md) 
- **➡️ Επόμενο**: [Το Πρώτο σας Έργο](first-project.md)
- **🚀 Επόμενο Κεφάλαιο**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Εγκατάσταση Ολοκληρώθηκε!** Συνεχίστε στο [Το Πρώτο σας Έργο](first-project.md) για να ξεκινήσετε να δημιουργείτε με το azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από ανθρώπινο μεταφραστή. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->