# Οδηγός Εγκατάστασης και Ρύθμισης

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάσεις & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Βασικά του AZD](azd-basics.md)
- **➡️ Επόμενο**: [Το Πρώτο Σας Έργο](first-project.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: Ανάπτυξη με προτεραιότητα στην ΤΝ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός θα σας καθοδηγήσει στην εγκατάσταση και ρύθμιση του Azure Developer CLI (azd) στο σύστημά σας. Θα μάθετε πολλαπλούς τρόπους εγκατάστασης για διάφορα λειτουργικά συστήματα, τη ρύθμιση πιστοποίησης, και την αρχική διαμόρφωση για να προετοιμάσετε το περιβάλλον ανάπτυξής σας για αναπτύξεις στο Azure.

## Στόχοι Μάθησης

Στο τέλος αυτού του μαθήματος, θα:
- Εγκαταστήσετε με επιτυχία το Azure Developer CLI στο λειτουργικό σας σύστημα
- Διαμορφώσετε πιστοποίηση με το Azure χρησιμοποιώντας πολλαπλές μεθόδους
- Ρυθμίσετε το περιβάλλον ανάπτυξης με τα απαραίτητα προαπαιτούμενα
- Κατανοήσετε τις διαφορετικές επιλογές εγκατάστασης και πότε να χρησιμοποιείτε κάθε μία
- Εντοπίσετε και διορθώσετε κοινά προβλήματα εγκατάστασης και ρύθμισης

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Εγκαταστήσετε το azd χρησιμοποιώντας την κατάλληλη μέθοδο για την πλατφόρμα σας
- Πιστοποιηθείτε με το Azure χρησιμοποιώντας azd auth login
- Επαληθεύσετε την εγκατάστασή σας και να δοκιμάσετε βασικές εντολές azd
- Διαμορφώσετε το περιβάλλον ανάπτυξής σας για βέλτιστη χρήση του azd
- Επίλυση κοινών προβλημάτων εγκατάστασης ανεξάρτητα

Αυτός ο οδηγός θα σας βοηθήσει να εγκαταστήσετε και να ρυθμίσετε το Azure Developer CLI στο σύστημά σας, ανεξάρτητα από το λειτουργικό σύστημα ή το περιβάλλον ανάπτυξής σας.

## Προαπαιτούμενα

Πριν εγκαταστήσετε το azd, βεβαιωθείτε ότι έχετε:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
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
1. Κατεβάστε την τελευταία έκδοση από το [GitHub](https://github.com/Azure/azure-dev/releases)
2. Αποσυμπιέστε σε `C:\Program Files\azd\`
3. Προσθέστε στη μεταβλητή περιβάλλοντος PATH

### macOS

#### Επιλογή 1: Homebrew (Συνιστάται)
```bash
brew tap azure/azd
brew install azd
```

#### Επιλογή 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Επιλογή 3: Χειροκίνητη Εγκατάσταση
```bash
# Λήψη και εγκατάσταση
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Επιλογή 1: Install Script (Συνιστάται)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Επιλογή 2: Package Managers

**Ubuntu/Debian:**
```bash
# Προσθέστε το αποθετήριο πακέτων της Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Εγκαταστήστε το azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Προσθέστε το αποθετήριο πακέτων της Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

Το azd είναι προεγκατεστημένο στα GitHub Codespaces. Απλώς δημιουργήστε ένα codespace και ξεκινήστε να χρησιμοποιείτε το azd άμεσα.

### Docker

```bash
# Εκτέλεση του azd σε ένα κοντέινερ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Δημιουργία ενός ψευδώνύμου για ευκολότερη χρήση
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

**Σημείωση**: Ο πραγματικός αριθμός έκδοσης θα διαφέρει. Ελέγξτε τις [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) για την πιο πρόσφατη έκδοση.

**✅ Λίστα Ελέγχου Επιτυχούς Εγκατάστασης:**
- [ ] `azd version` εμφανίζει αριθμό έκδοσης χωρίς σφάλματα
- [ ] `azd --help` εμφανίζει την τεκμηρίωση εντολών
- [ ] `azd template list` εμφανίζει διαθέσιμα πρότυπα
- [ ] `az account show` εμφανίζει το Azure subscription σας
- [ ] Μπορείτε να δημιουργήσετε έναν δοκιμαστικό φάκελο και να εκτελέσετε `azd init` με επιτυχία

**Αν όλοι οι έλεγχοι είναι επιτυχείς, είστε έτοιμοι να προχωρήσετε στο [Το Πρώτο Σας Έργο](first-project.md)!**

## Ρύθμιση Πιστοποίησης

### Πιστοποίηση Azure CLI (Συνιστάται)
```bash
# Εγκαταστήστε το Azure CLI αν δεν είναι ήδη εγκατεστημένο
# Windows: εκτελέστε 'winget install Microsoft.AzureCLI'
# macOS: εκτελέστε 'brew install azure-cli'
# Linux: εκτελέστε curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Συνδεθείτε στο Azure
az login

# Επαληθεύστε τον έλεγχο ταυτότητας
az account show
```

### Πιστοποίηση με Device Code
Αν βρίσκεστε σε περιβάλλον χωρίς γραφικό περιβάλλον ή αντιμετωπίζετε προβλήματα με τον περιηγητή:
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
export AZD_DEBUG=true  # Ενεργοποίηση καταγραφής εντοπισμού σφαλμάτων
```

## Ενσωμάτωση IDE

### Visual Studio Code
Εγκαταστήστε την επέκταση Azure Developer CLI:
1. Ανοίξτε το VS Code
2. Μεταβείτε στις Επεκτάσεις (Ctrl+Shift+X)
3. Αναζητήστε "Azure Developer CLI"
4. Εγκαταστήστε την επέκταση

Δυνατότητες:
- IntelliSense για azure.yaml
- Ενσωματωμένο τερματικό για εντολές
- Περιήγηση προτύπων
- Παρακολούθηση αναπτύξεων

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
2. Διαμορφώστε τα διαπιστευτήρια Azure
3. Χρησιμοποιήστε το ενσωματωμένο τερματικό για εντολές azd

## 🐛 Επίλυση Σφαλμάτων Εγκατάστασης

### Συνηθισμένα Προβλήματα

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
# Ρυθμίστε τον proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Παράκαμψη επαλήθευσης SSL (δεν συνιστάται για παραγωγή)
azd config set http.insecure true
```

#### Σύγκρουση Εκδόσεων
```bash
# Αφαίρεση παλαιών εγκαταστάσεων
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Καθαρισμός ρυθμίσεων
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
Το azd θα σας ειδοποιεί όταν υπάρχουν διαθέσιμες ενημερώσεις:
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
- Ένας πόρος κάθε φορά
- Εστίαση στη διαχείριση υποδομής

**Azure Developer CLI (azd)**: Εργαλείο υψηλού επιπέδου για ολοκληρωμένες αναπτύξεις εφαρμογών
- `azd up` αναπτύσσει ολόκληρη την εφαρμογή με όλους τους πόρους
- Ροές εργασίας βασισμένες σε πρότυπα
- Εστίαση στην παραγωγικότητα του προγραμματιστή

**Χρειάζεστε και τα δύο**: το azd χρησιμοποιεί το az CLI για πιστοποίηση
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω το azd με υπάρχοντες πόρους Azure;</strong></summary>

Ναι! Μπορείτε να:
1. Εισάγετε υπάρχοντες πόρους σε περιβάλλοντα azd
2. Αναφερθείτε σε υπάρχοντες πόρους στα Bicep πρότυπά σας
3. Χρησιμοποιήσετε το azd για νέες αναπτύξεις παράλληλα με την υπάρχουσα υποδομή

Δείτε τον [Οδηγό Διαμόρφωσης](configuration.md) για λεπτομέρειες.
</details>

<details>
<summary><strong>Λειτουργεί το azd με το Azure Government ή το Azure China;</strong></summary>

Ναι, ρυθμίστε το cloud:
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

Φυσικά! Το azd έχει σχεδιαστεί για αυτοματοποίηση:
- Ενσωμάτωση με GitHub Actions
- Υποστήριξη Azure DevOps
- Πιστοποίηση με service principal
- Λειτουργία χωρίς αλληλεπίδραση

Δείτε τον [Οδηγό Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md) για μοτίβα CI/CD.
</details>

<details>
<summary><strong>Ποιο είναι το κόστος χρήσης του azd;</strong></summary>

Το azd είναι **εντελώς δωρεάν** και ανοιχτού κώδικα. Πληρώνετε μόνο για:
- Τους πόρους Azure που αναπτύσσετε
- Το κόστος κατανάλωσης του Azure (υπολογιστική ισχύς, αποθήκευση κ.λπ.)

Χρησιμοποιήστε `azd provision --preview` για να εκτιμήσετε το κόστος πριν την ανάπτυξη.
</details>

## Επόμενα Βήματα

1. **Ολοκληρώστε την πιστοποίηση**: Βεβαιωθείτε ότι έχετε πρόσβαση στο Azure subscription σας
2. **Δοκιμάστε την πρώτη σας ανάπτυξη**: Ακολουθήστε τον [Οδηγό Πρώτου Έργου](first-project.md)
3. **Εξερευνήστε πρότυπα**: Περιηγηθείτε στα διαθέσιμα πρότυπα με `azd template list`
4. **Διαμορφώστε το IDE σας**: Ρυθμίστε το περιβάλλον ανάπτυξής σας

## Υποστήριξη

Αν αντιμετωπίσετε προβλήματα:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Λάβετε καθοδήγηση εντολών Azure απευθείας στον επεξεργαστή σας με `npx skills add microsoft/github-copilot-for-azure`

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάσεις & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Βασικά του AZD](azd-basics.md) 
- **➡️ Επόμενο**: [Το Πρώτο Σας Έργο](first-project.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: Ανάπτυξη με προτεραιότητα στην ΤΝ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Η Εγκατάσταση Ολοκληρώθηκε!** Συνεχίστε στο [Το Πρώτο Σας Έργο](first-project.md) για να ξεκινήσετε να δημιουργείτε με το azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Το παρόν έγγραφο έχει μεταφραστεί με τη χρήση υπηρεσίας μετάφρασης με τεχνητή νοημοσύνη (Co-op Translator: https://github.com/Azure/co-op-translator). Παρότι καταβάλλουμε προσπάθειες για την ακρίβεια, λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική/επίσημη πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από ανθρώπους. Δεν φέρουμε καμία ευθύνη για τυχόν παρερμηνείες ή παρανοήσεις που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->