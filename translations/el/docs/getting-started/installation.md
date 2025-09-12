<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T20:54:29+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "el"
}
-->
# Οδηγός Εγκατάστασης & Ρύθμισης

**Προηγούμενο:** [Κύρια Τεκμηρίωση](../../README.md) | **Επόμενο:** [Βασικά AZD](azd-basics.md)

## Εισαγωγή

Αυτός ο αναλυτικός οδηγός θα σας καθοδηγήσει στην εγκατάσταση και τη ρύθμιση του Azure Developer CLI (azd) στο σύστημά σας. Θα μάθετε διάφορες μεθόδους εγκατάστασης για διαφορετικά λειτουργικά συστήματα, τη ρύθμιση αυθεντικοποίησης και την αρχική διαμόρφωση για να προετοιμάσετε το περιβάλλον ανάπτυξης σας για αναπτύξεις στο Azure.

## Στόχοι Μάθησης

Μέχρι το τέλος αυτού του μαθήματος, θα:
- Εγκαταστήσετε με επιτυχία το Azure Developer CLI στο λειτουργικό σας σύστημα
- Ρυθμίσετε την αυθεντικοποίηση με το Azure χρησιμοποιώντας διάφορες μεθόδους
- Διαμορφώσετε το περιβάλλον ανάπτυξης σας με τις απαραίτητες προϋποθέσεις
- Κατανοήσετε τις διαφορετικές επιλογές εγκατάστασης και πότε να χρησιμοποιήσετε την κάθε μία
- Αντιμετωπίσετε κοινά προβλήματα εγκατάστασης και ρύθμισης

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Εγκαταστήσετε το azd χρησιμοποιώντας την κατάλληλη μέθοδο για την πλατφόρμα σας
- Αυθεντικοποιηθείτε με το Azure χρησιμοποιώντας την εντολή `azd auth login`
- Επαληθεύσετε την εγκατάσταση και να δοκιμάσετε βασικές εντολές του azd
- Διαμορφώσετε το περιβάλλον ανάπτυξης σας για βέλτιστη χρήση του azd
- Επιλύσετε ανεξάρτητα κοινά προβλήματα εγκατάστασης

Αυτός ο οδηγός θα σας βοηθήσει να εγκαταστήσετε και να ρυθμίσετε το Azure Developer CLI στο σύστημά σας, ανεξάρτητα από το λειτουργικό σας σύστημα ή το περιβάλλον ανάπτυξης.

## Προαπαιτούμενα

Πριν εγκαταστήσετε το azd, βεβαιωθείτε ότι έχετε:
- **Συνδρομή Azure** - [Δημιουργήστε έναν δωρεάν λογαριασμό](https://azure.microsoft.com/free/)
- **Azure CLI** - Για αυθεντικοποίηση και διαχείριση πόρων
- **Git** - Για κλωνοποίηση προτύπων και έλεγχο εκδόσεων
- **Docker** (προαιρετικό) - Για εφαρμογές σε κοντέινερ

## Μέθοδοι Εγκατάστασης

### Windows

#### Επιλογή 1: PowerShell (Συνιστάται)
```powershell
# Run as Administrator or with elevated privileges
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
3. Προσθέστε στη μεταβλητή PATH του περιβάλλοντος

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
# Download and install
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
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

Το azd είναι προεγκατεστημένο στο GitHub Codespaces. Απλώς δημιουργήστε ένα codespace και ξεκινήστε να χρησιμοποιείτε το azd άμεσα.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Επαλήθευση Εγκατάστασης

Μετά την εγκατάσταση, επαληθεύστε ότι το azd λειτουργεί σωστά:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Αναμενόμενο αποτέλεσμα:
```
azd version 1.5.0 (commit abc123)
```

## Ρύθμιση Αυθεντικοποίησης

### Αυθεντικοποίηση μέσω Azure CLI (Συνιστάται)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Αυθεντικοποίηση μέσω Device Code
Εάν βρίσκεστε σε σύστημα χωρίς γραφικό περιβάλλον ή αντιμετωπίζετε προβλήματα με τον browser:
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
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Μεταβλητές Περιβάλλοντος
Προσθέστε στο προφίλ του shell σας (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Ενσωμάτωση με IDE

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
2. Ρυθμίστε τα διαπιστευτήρια του Azure
3. Χρησιμοποιήστε το ενσωματωμένο τερματικό για εντολές azd

## 🐛 Αντιμετώπιση Προβλημάτων Εγκατάστασης

### Συνηθισμένα Προβλήματα

#### Άρνηση Άδειας (Windows)
```powershell
# Run PowerShell as Administrator
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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Συγκρούσεις Εκδόσεων
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Λήψη Περισσότερης Βοήθειας
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
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

## Επόμενα Βήματα

1. **Ολοκληρώστε την αυθεντικοποίηση**: Βεβαιωθείτε ότι έχετε πρόσβαση στη συνδρομή σας στο Azure
2. **Δοκιμάστε την πρώτη σας ανάπτυξη**: Ακολουθήστε τον [Οδηγό Πρώτου Έργου](first-project.md)
3. **Εξερευνήστε πρότυπα**: Περιηγηθείτε στα διαθέσιμα πρότυπα με την εντολή `azd template list`
4. **Διαμορφώστε το IDE σας**: Ρυθμίστε το περιβάλλον ανάπτυξης σας

## Υποστήριξη

Εάν αντιμετωπίσετε προβλήματα:
- [Επίσημη Τεκμηρίωση](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Αναφορά Προβλημάτων](https://github.com/Azure/azure-dev/issues)
- [Συζητήσεις Κοινότητας](https://github.com/Azure/azure-dev/discussions)
- [Υποστήριξη Azure](https://azure.microsoft.com/support/)

---

**Προηγούμενο:** [Κύρια Τεκμηρίωση](../../README.md) | **Επόμενο:** [Βασικά AZD](azd-basics.md)

**Η Εγκατάσταση Ολοκληρώθηκε!** Συνεχίστε στον [Οδηγό Πρώτου Έργου](first-project.md) για να ξεκινήσετε να δημιουργείτε με το azd.

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.