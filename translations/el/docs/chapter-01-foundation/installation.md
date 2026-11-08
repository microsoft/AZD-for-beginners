# Οδηγός Εγκατάστασης & Ρύθμισης

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Θεμέλια & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Βασικά του AZD](azd-basics.md)
- **➡️ Επόμενο**: [Το Πρώτο Σου Έργο](first-project.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα την Τεχνητή Νοημοσύνη](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός θα σε καθοδηγήσει στην εγκατάσταση και παραμετροποίηση του Azure Developer CLI (azd) στο σύστημά σου. Θα μάθεις πολλές μεθόδους εγκατάστασης για διαφορετικά λειτουργικά συστήματα, ρύθμιση αυθεντικοποίησης και αρχική παραμετροποίηση για να προετοιμάσεις το περιβάλλον ανάπτυξης για αναπτύξεις στο Azure.

## Στόχοι Μάθησης

Στο τέλος αυτού του μαθήματος, θα:
- Εγκαταστήσεις επιτυχώς το Azure Developer CLI στο λειτουργικό σου σύστημα
- Παραμετροποιήσεις την αυθεντικοποίηση με το Azure μέσω πολλαπλών μεθόδων
- Ρυθμίσεις το περιβάλλον ανάπτυξης με τα απαραίτητα προαπαιτούμενα
- Κατανοήσεις τις διαφορετικές επιλογές εγκατάστασης και πότε να χρησιμοποιείς καθεμία
- Αντιμετωπίσεις κοινά προβλήματα εγκατάστασης και ρύθμισης

## Αποτέλεσμα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείς να:
- Εγκαταστήσεις το azd χρησιμοποιώντας την κατάλληλη μέθοδο για την πλατφόρμα σου
- Αυθεντικοποιηθείς με το Azure χρησιμοποιώντας την εντολή azd auth login
- Επαληθεύσεις την εγκατάσταση και να δοκιμάσεις βασικές εντολές azd
- Παραμετροποιήσεις το περιβάλλον ανάπτυξης για βέλτιστη χρήση του azd
- Επίλυσης κοινούς προβλήματα εγκατάστασης ανεξάρτητα

Αυτός ο οδηγός θα σε βοηθήσει να εγκαταστήσεις και να παραμετροποιήσεις το Azure Developer CLI στο σύστημά σου, ανεξαρτήτως λειτουργικού συστήματος ή περιβάλλοντος ανάπτυξης.

## Προαπαιτούμενα

Πριν εγκαταστήσεις το azd, βεβαιώσου ότι έχεις:
- **Συνδρομή Azure** - [Δημιούργησε δωρεάν λογαριασμό](https://azure.microsoft.com/free/)
- **Azure CLI** (προαιρετικό) - Για παραδείγματα που εκτελούν ρητά `az`; το azd αυθεντικοποιείται ανεξάρτητα
- **Git** - Για κλωνοποίηση προτύπων και έλεγχο εκδόσεων
- **Docker** (προαιρετικό) - Για εφαρμογές κοντέινερ

## Μέθοδοι Εγκατάστασης

### Windows

#### Επιλογή 1: Windows Package Manager (Συνιστάται)
```cmd
winget install microsoft.azd
```

#### Επιλογή 2: Εγκατάσταση με PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Επιλογή 3: Chocolatey
```cmd
choco install azd
```

#### Επιλογή 4: Χειροκίνητη Εγκατάσταση
1. Κατέβασε την τελευταία έκδοση από [GitHub](https://github.com/Azure/azure-dev/releases)
2. Αποσυμπίεσε στο `C:\Program Files\azd\`
3. Πρόσθεσε στο μεταβλητό περιβάλλον PATH

### macOS

#### Επιλογή 1: Homebrew (Συνιστάται)
```bash
brew tap azure/azd
brew install azd
```

#### Επιλογή 2: Εγκατάσταση μέσω script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Επιλογή 3: Χειροκίνητη Εγκατάσταση
Κατέβασε το αρχείο για την αρχιτεκτονική macOS από [τα αρχεία έκδοσης](https://github.com/Azure/azure-dev/releases), αποσυμπίεσε το, και πρόσθεσε το δυαδικό `azd` στο `PATH` σου.

### Linux

#### Επιλογή 1: Εγκατάσταση μέσω script (Συνιστάται)
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

Μερικά περιβάλλοντα Codespaces και κοντέινερ ανάπτυξης ήδη περιλαμβάνουν `azd`, αλλά καλό είναι να το επαληθεύσεις αντί να το υποθέσεις:

```bash
azd version
```

Αν λείπει `azd`, εγκατέστησέ το με το πρότυπο script για το περιβάλλον.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Αυτό το πρόσκαιρο κοντέινερ δεν διατηρεί την σύνδεση εισόδου μεταξύ των εκτελέσεων. Για επαναλαμβανόμενες αναπτύξεις, χρησιμοποίησε το [dev container setup](dev-containers.md); οι κατασκευές κοντέινερ απαιτούν επίσης έναν Docker daemon προσβάσιμο από μέσα.

## ✅ Επαλήθευση Εγκατάστασης

Μετά την εγκατάσταση, επαλήθευσε ότι το azd λειτουργεί σωστά:

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

**Σημείωση**: Ο αριθμός έκδοσης διαφέρει. Έλεγξε τις [Azure Developer CLI εκδόσεις](https://github.com/Azure/azure-dev/releases) για την πιο πρόσφατη.

**✅ Λίστα ελέγχου επιτυχούς εγκατάστασης:**
- [ ] `azd version` εμφανίζει αριθμό έκδοσης χωρίς σφάλματα
- [ ] `azd --help` εμφανίζει την τεκμηρίωση εντολών
- [ ] `azd template list` εμφανίζει διαθέσιμα πρότυπα
- [ ] Μπορείς να δημιουργήσεις έναν δοκιμαστικό φάκελο και να εκτελέσεις επιτυχώς `azd init`

**Αν όλα τα παραπάνω λειτουργούν, είσαι έτοιμος να συνεχίσεις στο [Πρώτο σου Έργο](first-project.md)!**

## Ρύθμιση Αυθεντικοποίησης

### Συνιστώμενη Ρύθμιση για Αρχάριους

Για ροές εργασίας με προτεραιότητα στο AZD, κάνε είσοδο με `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Χρησιμοποίησε την είσοδο Azure CLI μόνο εάν σκοπεύεις να εκτελείς εντολές `az` ο ίδιος κατά τη διάρκεια του μαθήματος.

### Αυθεντικοποίηση μέσω Azure CLI (Προαιρετικό)
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

### Ποια ροή εισόδου να χρησιμοποιήσεις;

- Χρησιμοποίησε `azd auth login` αν ακολουθείς το αρχικό μονοπάτι AZD και εκτελείς κυρίως εντολές `azd`.
- Χρησιμοποίησε επίσης `az login` όταν θέλεις να εκτελέσεις εντολές Azure CLI όπως `az account show` ή να ελέγξεις πόρους άμεσα.
- Αν μια άσκηση περιλαμβάνει τόσο `azd` όσο και `az`, τρέξε και τις δύο εντολές εισόδου μία φορά στην αρχή.

### Αυθεντικοποίηση μέσω κωδικού συσκευής
Έχεις σύστημα χωρίς περιβάλλον γραφικών ή προβλήματα browser:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Για αυτοματοποιημένα περιβάλλοντα:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Επικύρωσε τη συνολική σου ρύθμιση

Θέλεις έναν γρήγορο έλεγχο πριν ξεκινήσεις το Κεφάλαιο 1;

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Παραμετροποίηση

### Παγκόσμια Παραμετροποίηση
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Μεταβλητές Περιβάλλοντος
Πρόσθεσε στο προφίλ του shell σου (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Ενσωμάτωση σε IDE

### Visual Studio Code
Εγκατάστησε την επέκταση Azure Developer CLI:
1. Άνοιξε το VS Code
2. Πήγαινε στις Επεκτάσεις (Ctrl+Shift+X)
3. Αναζήτησε "Azure Developer CLI"
4. Εγκατάστησε την επέκταση

Χαρακτηριστικά:
- IntelliSense για azure.yaml
- Ενσωματωμένες εντολές τερματικού
- Περιήγηση προτύπων
- Παρακολούθηση ανάπτυξης

### GitHub Codespaces
Δημιούργησε ένα `.devcontainer/devcontainer.json`:
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
1. Εγκατάστησε το plugin Azure
2. Ρύθμισε τα διαπιστευτήρια Azure
3. Χρησιμοποίησε το ενσωματωμένο τερματικό για εντολές azd

## 🐛 Αντιμετώπιση Προβλημάτων Εγκατάστασης

### Κοινά Προβλήματα

#### Άρνηση Άδειας (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Προβλήματα PATH
Πρόσθεσε χειροκίνητα το azd στο PATH:

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

#### Συγκρούσεις Έκδοσης
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Λήψη Περαιτέρω Βοήθειας
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Ενημέρωση του azd

### Έλεγχος Ενημέρωσης
Το azd προειδοποιεί όταν υπάρχει νεότερη έκδοση, και μπορείς να επιβεβαιώσεις την τρέχουσα έκδοσή σου με:
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
<summary><strong>Ποια η διαφορά ανάμεσα σε azd και az CLI;</strong></summary>

**Azure CLI (az)**: Εργαλείο χαμηλού επιπέδου για διαχείριση μεμονωμένων πόρων Azure
- `az webapp create`, `az storage account create`
- Ένας πόρος τη φορά
- Εστίαση στη διαχείριση υποδομής

**Azure Developer CLI (azd)**: Εργαλείο υψηλού επιπέδου για ολοκληρωμένες αναπτύξεις εφαρμογών
- `azd up` αναπτύσσει ολόκληρη εφαρμογή με όλους τους πόρους
- Ροές εργασίας βασισμένες σε πρότυπα
- Εστίαση στην παραγωγικότητα των προγραμματιστών

**Είναι ανεξάρτητα**: Το azd χρησιμοποιεί τη δική του αυθεντικοποίηση από προεπιλογή. Εγκατέστησε και κάνε είσοδο στο Azure CLI μόνο για εντολές `az`, ή επικεντρώσου ρητά στο `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω το azd με υπάρχοντες πόρους Azure;</strong></summary>

Ναι! Μπορείς:
1. Να εισάγεις υπάρχοντες πόρους σε περιβάλλοντα azd
2. Να αναφέρεσαι σε υπάρχοντες πόρους στα πρότυπα Bicep σου
3. Να χρησιμοποιήσεις το azd για νέες αναπτύξεις μαζί με υπάρχουσα υποδομή

Δες τον [Οδηγό Παραμετροποίησης](../chapter-03-configuration/configuration.md) για λεπτομέρειες.
</details>

<details>
<summary><strong>Το azd λειτουργεί με Azure Government ή Azure China;</strong></summary>

Ναι, ρύθμισε το cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Αν χρησιμοποιείς επίσης Azure CLI, ρύθμισε ξεχωριστά το `az cloud set --name ...`. Οι υπηρεσίες προτύπων και η διαθεσιμότητα μοντέλων διαφέρουν ανά cloud.
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω το azd σε CI/CD pipelines;</strong></summary>

Απόλυτα! Το azd έχει σχεδιαστεί για αυτοματοποίηση:
- Ενσωμάτωση με GitHub Actions
- Υποστήριξη Azure DevOps
- Αυθεντικοποίηση μέσω service principal
- Λειτουργία χωρίς παρέμβαση χρήστη (non-interactive)

Δες τον [Οδηγό Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md) για πρότυπα CI/CD.
</details>

<details>
<summary><strong>Πόσο κοστίζει η χρήση του azd;</strong></summary>

Το azd είναι **εντελώς δωρεάν** και ανοιχτού κώδικα. Πληρώνεις μόνο για:
- Τους Azure πόρους που αναπτύσσεις
- Το κόστος χρήσης Azure (υπολογισμός, αποθήκευση, κλπ.)

Χρησιμοποίησε `azd provision --preview` για να ελέγξεις τους προτεινόμενους πόρους και μετά εκτίμησε το κόστος με τον [Υπολογιστή Τιμολόγησης Azure](https://azure.microsoft.com/pricing/calculator/). Το Preview δεν υπολογίζει τιμές.
</details>

## Επόμενα Βήματα

1. **Ολοκλήρωσε την αυθεντικοποίηση**: Βεβαιώσου ότι έχεις πρόσβαση στη συνδρομή σου στο Azure
2. **Δοκίμασε την πρώτη σου ανάπτυξη**: Ακολούθησε τον [Οδηγό Πρώτου Έργου](first-project.md)
3. **Εξερεύνησε πρότυπα**: Περιηγήσου στα διαθέσιμα πρότυπα με `azd template list`
4. **Ρύθμισε το IDE σου**: Παραμετροποίησε το περιβάλλον ανάπτυξης

## Υποστήριξη

Αν αντιμετωπίσεις προβλήματα:
- [Επίσημη Τεκμηρίωση](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Αναφορά Προβλημάτων](https://github.com/Azure/azure-dev/issues)
- [Συζητήσεις Κοινότητας](https://github.com/Azure/azure-dev/discussions)
- [Υποστήριξη Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Λάβε καθοδήγηση εντολών Azure απευθείας στον επεξεργαστή σου με `npx skills add microsoft/github-copilot-for-azure`

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Θεμέλια & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Βασικά του AZD](azd-basics.md) 
- **➡️ Επόμενο**: [Το Πρώτο Σου Έργο](first-project.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα την Τεχνητή Νοημοσύνη](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Εγκατάσταση Ολοκληρώθηκε!** Συνέχισε στο [Πρώτο Σου Έργο](first-project.md) για να ξεκινήσεις να δημιουργείς με το azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->