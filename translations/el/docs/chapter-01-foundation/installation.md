# Οδηγός Εγκατάστασης & Ρύθμισης

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Θεμέλια & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Βασικά AZD](azd-basics.md)
- **➡️ Επόμενο**: [Το Πρώτο Σου Έργο](first-project.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: Ανάπτυξη Πρώτα με AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός θα σας καθοδηγήσει στην εγκατάσταση και ρύθμιση του Azure Developer CLI (azd) στο σύστημά σας. Θα μάθετε πολλαπλές μεθόδους εγκατάστασης για διαφορετικά λειτουργικά συστήματα, ρύθμιση ταυτοποίησης και αρχική διαμόρφωση για να προετοιμάσετε το περιβάλλον ανάπτυξής σας για αναπτύξεις Azure.

## Στόχοι Μάθησης

Στο τέλος αυτού του μαθήματος, θα:
- Εγκαταστήσετε επιτυχώς το Azure Developer CLI στο λειτουργικό σας σύστημα
- Ρυθμίσετε την ταυτοποίηση με Azure χρησιμοποιώντας πολλαπλές μεθόδους
- Ετοιμάσετε το περιβάλλον ανάπτυξης με τις απαραίτητες προϋποθέσεις
- Κατανοήσετε τις διάφορες επιλογές εγκατάστασης και πότε να χρησιμοποιείτε κάθε μία
- Εντοπίσετε και επιλύσετε κοινά προβλήματα εγκατάστασης και ρύθμισης

## Αποτελέσματα Μάθησης

Αφού ολοκληρώσετε αυτό το μάθημα, θα μπορείτε να:
- Εγκαταστήσετε το azd χρησιμοποιώντας τη κατάλληλη μέθοδο για την πλατφόρμα σας
- Πραγματοποιήσετε ταυτοποίηση με Azure χρησιμοποιώντας το azd auth login
- Επαληθεύσετε την εγκατάσταση και να δοκιμάσετε βασικές εντολές azd
- Ρυθμίσετε το περιβάλλον ανάπτυξης για βέλτιστη χρήση του azd
- Επίλυση κοινών προβλημάτων εγκατάστασης ανεξάρτητα

Αυτός ο οδηγός θα σας βοηθήσει να εγκαταστήσετε και να ρυθμίσετε το Azure Developer CLI στο σύστημά σας, ανεξάρτητα από το λειτουργικό σύστημα ή το περιβάλλον ανάπτυξής σας.

## Προαπαιτούμενα

Πριν εγκαταστήσετε το azd, βεβαιωθείτε ότι έχετε:
- **Συνδρομή Azure** - [Δημιουργήστε δωρεάν λογαριασμό](https://azure.microsoft.com/free/)
- **Azure CLI** (προαιρετικό) - Για παραδείγματα που εκτελούν ρητά `az`; το azd πραγματοποιεί ταυτοποίηση ανεξάρτητα
- **Git** - Για κλωνοποίηση προτύπων και έλεγχο εκδοχών
- **Docker** (προαιρετικό) - Για εφαρμογές σε κοντέινερ

**Μονοπάτι Foundry GA Κεφαλαίου 2:** Χρησιμοποιήστε AZD **1.37.0 ή νεότερο**, εγκαταστήστε το πακέτο με `azd ext install microsoft.foundry`, και χρησιμοποιήστε Python **3.13+** και τρέχον **uv** για το δείγμα φιλοξενούμενου πράκτορα. Η λειτουργία ανάπτυξης κώδικα κατασκευάζει απομακρυσμένα, οπότε δεν απαιτεί τοπική κατασκευή Docker. Απαιτούνται δικαιώματα Foundry, διαθεσιμότητα μοντέλου ανά περιοχή και ποσοστώσεις· δείτε τη [ρύθμιση φιλοξενούμενου πράκτορα](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Μέθοδοι Εγκατάστασης

### Windows

#### Επιλογή 1: Windows Package Manager (Συνιστάται)
```cmd
winget install microsoft.azd
```

#### Επιλογή 2: Εγκατάσταση με PowerShell Script
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Επιλογή 3: Chocolatey
```cmd
choco install azd
```

#### Επιλογή 4: Χειροκίνητη Εγκατάσταση
1. Κατεβάστε την τελευταία έκδοση από το [GitHub](https://github.com/Azure/azure-dev/releases)
2. Αποσυμπιέστε στο `C:\Program Files\azd\`
3. Προσθέστε στη μεταβλητή περιβάλλοντος PATH

### macOS

#### Επιλογή 1: Homebrew (Συνιστάται)
```bash
brew tap azure/azd
brew install azd
```

#### Επιλογή 2: Εγκατάσταση με Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Επιλογή 3: Χειροκίνητη Εγκατάσταση
Κατεβάστε το αρχείο για την αρχιτεκτονική του macOS σας από τα [αρχεία έκδοσης](https://github.com/Azure/azure-dev/releases), αποσυμπιέστε το και προσθέστε το δυαδικό αρχείο `azd` στο `PATH` σας.

### Linux

#### Επιλογή 1: Εγκατάσταση με Script (Συνιστάται)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Επιλογή 2: Package Managers

**Χειροκίνητη εγκατάσταση από αρχεία έκδοσης:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Μερικά Codespaces και περιβάλλοντα κοντέινερ ανάπτυξης περιλαμβάνουν ήδη `azd`, αλλά πρέπει να το επιβεβαιώσετε αντί να το υποθέσετε:

```bash
azd version
```

Αν λείπει το `azd`, εγκαταστήστε το με το τυπικό script για το περιβάλλον.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Αυτό το προσωρινό κοντέινερ δεν διατηρεί κατάσταση σύνδεσης μεταξύ των εκτελέσεων. Για επαναλαμβανόμενες αναπτύξεις, χρησιμοποιήστε τη [ρύθμιση κοντέινερ ανάπτυξης](dev-containers.md); η κατασκευή κοντέινερ απαιτεί επίσης έναν Docker daemon προσβάσιμο από μέσα στο κοντέινερ.

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

Αναμενόμενη έξοδος:
```
azd version 1.x.x (commit xxxxxx)
```

**Σημείωση**: Ο αριθμός έκδοσης θα διαφέρει. Ελέγξτε τις [εκδόσεις Azure Developer CLI](https://github.com/Azure/azure-dev/releases) για την τελευταία έκδοση.

**✅ Λίστα Ελέγχου Επιτυχίας Εγκατάστασης:**
- [ ] `azd version` εμφανίζει αριθμό έκδοσης χωρίς σφάλματα
- [ ] `azd --help` εμφανίζει τεκμηρίωση εντολών
- [ ] `azd template list` εμφανίζει διαθέσιμα πρότυπα
- [ ] Μπορείτε να δημιουργήσετε έναν δοκιμαστικό φάκελο και να εκτελέσετε επιτυχώς `azd init`

**Αν όλα περάσουν τους ελέγχους, είστε έτοιμοι να προχωρήσετε στο [Το Πρώτο Σου Έργο](first-project.md)!**

## Ρύθμιση Ταυτοποίησης

### Συνιστώμενη Ρύθμιση για Αρχάριους

Για ροές εργασίας που ξεκινούν με AZD, συνδεθείτε με `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Χρησιμοποιήστε τη σύνδεση Azure CLI μόνο όταν σκοπεύετε να εκτελέσετε εντολές `az` κατά τη διάρκεια του μαθήματος.

### Ταυτοποίηση Azure CLI (Προαιρετικό)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### Ποια Ροή Σύνδεσης Πρέπει να Χρησιμοποιήσετε;

- Χρησιμοποιήστε `azd auth login` αν ακολουθείτε την αρχική διαδρομή AZD και εκτελείτε κυρίως εντολές `azd`.
- Χρησιμοποιήστε επίσης `az login` όταν θέλετε να εκτελέσετε εντολές Azure CLI όπως `az account show` ή να εξετάσετε απευθείας πόρους.
- Αν μια άσκηση περιλαμβάνει και εντολές `azd` και `az`, εκτελέστε και τις δύο εντολές σύνδεσης μία φορά στην αρχή.

### Ταυτοποίηση με Κωδικό Συσκευής
Αν βρίσκεστε σε ένα σύστημα χωρίς περιβάλλον εργασίας ή αντιμετωπίζετε προβλήματα με τον περιηγητή:
```bash
azd auth login --use-device-code
```

### Υπηρεσία Principal (CI/CD)
Για αυτοματοποιημένα περιβάλλοντα:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Επαλήθευση της Πλήρους Ρύθμισής σας

Αν θέλετε έναν γρήγορο έλεγχο ετοιμότητας πριν ξεκινήσετε το Κεφάλαιο 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Διαμόρφωση

### Παγκόσμια Διαμόρφωση
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Μεταβλητές Περιβάλλοντος
Προσθέστε στο προφίλ του κελύφους σας (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
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
- Ολοκληρωμένες εντολές τερματικού
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
1. Εγκαταστήστε το πρόσθετο Azure
2. Ρυθμίστε τα διαπιστευτήρια Azure
3. Χρησιμοποιήστε το ολοκληρωμένο τερματικό για εντολές azd

## 🐛 Αντιμετώπιση Προβλημάτων Εγκατάστασης

### Κοινά Προβλήματα

#### Άρνηση Δικαιωμάτων (Windows)
```powershell
# Run PowerShell as Administrator
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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Συγκρούσεις Εκδόσεων
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Λήψη Περισσότερης Βοήθειας
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Ενημέρωση azd

### Έλεγχος Ενημέρωσης
Το azd προειδοποιεί όταν υπάρχει νεότερη έκδοση διαθέσιμη, και μπορείτε να επιβεβαιώσετε την τρέχουσα έκδοσή σας με:
```bash
azd version
```

### Χειροκίνητες Ενημερώσεις

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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
- Ένας πόρος τη φορά
- Εστίαση στη διαχείριση υποδομών

**Azure Developer CLI (azd)**: Εργαλείο υψηλού επιπέδου για ολοκληρωμένες αναπτύξεις εφαρμογών
- `azd up` αναπτύσσει ολόκληρη την εφαρμογή με όλους τους πόρους
- Ροές εργασίας βασισμένες σε πρότυπα
- Εστίαση στην παραγωγικότητα των προγραμματιστών

**Είναι ανεξάρτητα**: το azd χρησιμοποιεί τη δική του ταυτοποίηση από προεπιλογή. Εγκαταστήστε και συνδεθείτε στο Azure CLI μόνο για εντολές `az`, ή επιλέξτε ρητά `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω το azd με υπάρχοντες πόρους Azure;</strong></summary>

Ναι! Μπορείτε να:
1. Εισάγετε υπάρχοντες πόρους σε περιβάλλοντα azd
2. Αναφέρετε υπάρχοντες πόρους στα πρότυπα Bicep σας
3. Χρησιμοποιείτε το azd για νέες αναπτύξεις μαζί με υπάρχουσα υποδομή

Δείτε τον [Οδηγό Διαμόρφωσης](../chapter-03-configuration/configuration.md) για περισσότερες λεπτομέρειες.
</details>

<details>
<summary><strong>Λειτουργεί το azd με το Azure Government ή το Azure China;</strong></summary>

Ναι, ρυθμίστε το cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Αν χρησιμοποιείτε επίσης το Azure CLI, ρυθμίστε ξεχωριστά το `az cloud set --name ...`. Οι υπηρεσίες προτύπων και η διαθεσιμότητα μοντέλων διαφέρουν ανά cloud.
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω το azd σε pipelines CI/CD;</strong></summary>

Απολύτως! Το azd είναι σχεδιασμένο για αυτοματοποίηση:
- Ενσωμάτωση με GitHub Actions
- Υποστήριξη Azure DevOps
- Ταυτοποίηση με υπηρεσία principal
- Λειτουργία χωρίς αλληλεπίδραση

Δείτε τον [Οδηγό Αναπτύξεων](../chapter-04-infrastructure/deployment-guide.md) για σενάρια CI/CD.
</details>

<details>
<summary><strong>Ποιο είναι το κόστος χρήσης του azd;</strong></summary>

Το ίδιο το azd είναι **απολύτως δωρεάν** και ανοιχτού κώδικα. Πληρώνετε μόνο για:
- Πόρους Azure που αναπτύσσετε
- Κόστη κατανάλωσης Azure (υπολογιστική ισχύ, αποθήκευση, κ.ά.)

Χρησιμοποιήστε `azd provision --preview` για να ελέγξετε τους προτεινόμενους πόρους, και στη συνέχεια εκτιμήστε τα κόστη τους με τον [Υπολογιστή Τιμών Azure](https://azure.microsoft.com/pricing/calculator/). Η προβολή δεν υπολογίζει τιμές.
</details>

## Επόμενα Βήματα

1. **Ολοκληρώστε την ταυτοποίηση**: Βεβαιωθείτε ότι έχετε πρόσβαση στη συνδρομή Azure σας
2. **Δοκιμάστε την πρώτη σας ανάπτυξη**: Ακολουθήστε τον [Οδηγό Πρώτου Έργου](first-project.md)
3. **Εξερευνήστε πρότυπα**: Περιηγηθείτε διαθέσιμα πρότυπα με `azd template list`
4. **Διαμορφώστε το IDE σας**: Ρυθμίστε το περιβάλλον ανάπτυξής σας

## Υποστήριξη

Αν αντιμετωπίσετε προβλήματα:
- [Επίσημη Τεκμηρίωση](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Αναφορά Προβλημάτων](https://github.com/Azure/azure-dev/issues)
- [Συζητήσεις Κοινότητας](https://github.com/Azure/azure-dev/discussions)
- [Υποστήριξη Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Λάβετε καθοδήγηση εντολών Azure απευθείας στον επεξεργαστή σας με `npx skills add microsoft/github-copilot-for-azure`

---

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Θεμέλια & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Βασικά AZD](azd-basics.md) 
- **➡️ Επόμενο**: [Το Πρώτο Σου Έργο](first-project.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: Ανάπτυξη Πρώτα με AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Εγκατάσταση Ολοκληρώθηκε!** Συνεχίστε στο [Το Πρώτο Σου Έργο](first-project.md) για να ξεκινήσετε την κατασκευή με το azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->