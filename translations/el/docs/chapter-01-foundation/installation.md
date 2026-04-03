# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Αυτός ο ολοκληρωμένος οδηγός θα σας καθοδηγήσει στην εγκατάσταση και διαμόρφωση του Azure Developer CLI (azd) στο σύστημά σας. Θα μάθετε πολλαπλούς τρόπους εγκατάστασης για διαφορετικά λειτουργικά συστήματα, ρύθμιση ταυτοποίησης και αρχική διαμόρφωση για να προετοιμάσετε το περιβάλλον ανάπτυξής σας για αναπτύξεις στο Azure.

## Learning Goals

Μέχρι το τέλος αυτού του μαθήματος, θα:
- Εγκαταστήσετε επιτυχώς το Azure Developer CLI στο λειτουργικό σας σύστημα
- Διαμορφώσετε την ταυτοποίηση με το Azure χρησιμοποιώντας πολλαπλές μεθόδους
- Ετοιμάσετε το περιβάλλον ανάπτυξης με τα απαραίτητα προαπαιτούμενα
- Κατανοήσετε τις διαφορετικές επιλογές εγκατάστασης και πότε να χρησιμοποιείτε κάθε μία
- Εντοπίσετε και επιλύσετε κοινά προβλήματα εγκατάστασης και ρύθμισης

## Learning Outcomes

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Εγκαταστήσετε το azd χρησιμοποιώντας την κατάλληλη μέθοδο για την πλατφόρμα σας
- Πραγματοποιήσετε ταυτοποίηση με το Azure χρησιμοποιώντας `azd auth login`
- Επαληθεύσετε την εγκατάσταση και να δοκιμάσετε βασικές εντολές azd
- Διαμορφώσετε το περιβάλλον ανάπτυξης σας για βέλτιστη χρήση του azd
- Επιλύσετε συνήθη προβλήματα εγκατάστασης ανεξάρτητα

Αυτός ο οδηγός θα σας βοηθήσει να εγκαταστήσετε και να διαμορφώσετε το Azure Developer CLI στο σύστημά σας, ανεξάρτητα από το λειτουργικό σύστημα ή το περιβάλλον ανάπτυξης.

## Prerequisites

Πριν από την εγκατάσταση του azd, βεβαιωθείτε ότι έχετε:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Για ταυτοποίηση και διαχείριση πόρων
- **Git** - Για κλωνοποίηση προτύπων και έλεγχο έκδοσης
- **Docker** (προαιρετικά) - Για εφαρμογές σε κοντέινερ

## Installation Methods

### Windows

#### Option 1: Windows Package Manager (Recommended)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# Χρήσιμο όταν το winget δεν είναι διαθέσιμο
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# Κατεβάστε και εγκαταστήστε
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Manual installation from release assets:**
```bash
# Κατεβάστε το πιο πρόσφατο αρχείο για την αρχιτεκτονική Linux σας από:
# https://github.com/Azure/azure-dev/releases
# Στη συνέχεια, αποσυμπιέστε το και προσθέστε το εκτελέσιμο azd στο PATH σας.
```

### GitHub Codespaces

Ορισμένα Codespaces και περιβάλλοντα dev container περιλαμβάνουν ήδη το `azd`, αλλά θα πρέπει να το επαληθεύσετε αντί να το υποθέσετε:

```bash
azd version
```

If `azd` is missing, install it with the standard script for the environment.

### Docker

```bash
# Τρέξτε το azd σε ένα κοντέινερ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Δημιουργήστε ένα ψευδώνυμο για ευκολότερη χρήση
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

Μετά την εγκατάσταση, επαληθεύστε ότι το azd λειτουργεί σωστά:

```bash
# Έλεγχος έκδοσης
azd version

# Προβολή βοήθειας
azd --help

# Κατάλογος διαθέσιμων προτύπων
azd template list
```

Expected output:
```
azd version 1.x.x (commit xxxxxx)
```

**Note**: The actual version number will vary. Check [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for the latest version.

**✅ Installation Success Checklist:**
- [ ] `azd version` shows version number without errors
- [ ] `azd --help` displays command documentation
- [ ] `azd template list` shows available templates
- [ ] You can create a test directory and run `azd init` successfully

**If all checks pass, you're ready to proceed to [Your First Project](first-project.md)!**

## Authentication Setup

### Recommended Beginner Setup

Για ροές εργασίας με επίκεντρο το AZD, συνδεθείτε με `azd auth login`.

```bash
# Απαιτείται για εντολές AZD όπως το azd up
azd auth login

# Επαλήθευση της κατάστασης αυθεντικοποίησης του AZD
azd auth login --check-status
```

Use Azure CLI sign-in only when you plan to run `az` commands yourself during the course.

### Azure CLI Authentication (Optional)
```bash
# Εγκαταστήστε το Azure CLI αν δεν είναι ήδη εγκατεστημένο
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: δείτε τα έγγραφα εγκατάστασης του Azure CLI για τη διανομή σας

# Συνδεθείτε στο Azure
az login

# Επαληθεύστε τον έλεγχο ταυτότητας
az account show
```

### Which Sign-In Flow Should You Use?

- Use `azd auth login` if you are following the beginner AZD path and mainly running `azd` commands.
- Use `az login` as well when you want to run Azure CLI commands such as `az account show` or inspect resources directly.
- If an exercise includes both `azd` and `az` commands, run both sign-in commands once at the start.

### Device Code Authentication
If you're on a headless system or having browser issues:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
For automated environments:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Validate Your Complete Setup

If you want a quick readiness check before starting Chapter 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configuration

### Global Configuration
```bash
# Ορισμός προεπιλεγμένης συνδρομής
azd config set defaults.subscription <subscription-id>

# Ορισμός προεπιλεγμένης τοποθεσίας
azd config set defaults.location eastus2

# Προβολή όλης της διαμόρφωσης
azd config show
```

### Environment Variables
Add to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Διαμόρφωση Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Διαμόρφωση azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ενεργοποίηση καταγραφής εντοπισμού σφαλμάτων
```

## IDE Integration

### Visual Studio Code
Install the Azure Developer CLI extension:
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Azure Developer CLI"
4. Install the extension

Features:
- IntelliSense for azure.yaml
- Integrated terminal commands
- Template browsing
- Deployment monitoring

### GitHub Codespaces
Create a `.devcontainer/devcontainer.json`:
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
1. Install the Azure plugin
2. Configure Azure credentials
3. Use integrated terminal for azd commands

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# Εκτελέστε το PowerShell ως Διαχειριστής
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
Manually add azd to your PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Network/Proxy Issues
```bash
# Ρύθμιση proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Παράβλεψη επαλήθευσης SSL (δεν συνιστάται για χρήση σε παραγωγή)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Αφαιρέστε τις παλιές εγκαταστάσεις
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: Αφαιρέστε το προηγούμενο εκτελέσιμο azd ή τον συμβολικό σύνδεσμο πριν από την επανεγκατάσταση

# Καθαρίστε τις ρυθμίσεις
rm -rf ~/.azd
```

### Getting More Help
```bash
# Ενεργοποίηση καταγραφής για αποσφαλμάτωση
export AZD_DEBUG=true
azd <command> --debug

# Προβολή τρέχουσας διαμόρφωσης
azd config show

# Προβολή τρέχουσας κατάστασης ανάπτυξης
azd show
```

## Updating azd

### Update Check
azd warns when a newer release is available, and you can confirm your current build with:
```bash
azd version
```

### Manual Updates

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

## 💡 Frequently Asked Questions

<details>
<summary><strong>Ποια είναι η διαφορά μεταξύ azd και az CLI;</strong></summary>

**Azure CLI (az)**: Εργαλείο χαμηλού επιπέδου για τη διαχείριση μεμονωμένων πόρων του Azure
- `az webapp create`, `az storage account create`
- Ένας πόρος τη φορά
- Έμφαση στη διαχείριση υποδομής

**Azure Developer CLI (azd)**: Εργαλείο υψηλού επιπέδου για ολοκληρωμένες αναπτύξεις εφαρμογών
- `azd up` αναπτύσσει ολόκληρη την εφαρμογή με όλους τους πόρους
- Ροές εργασίας βασισμένες σε πρότυπα
- Εστίαση στην παραγωγικότητα των προγραμματιστών

**Χρειάζεστε και τα δύο**: το azd χρησιμοποιεί το az CLI για την ταυτοποίηση
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω το azd με υπάρχοντες πόρους Azure;</strong></summary>

Ναι! Μπορείτε να:
1. Εισάγετε υπάρχοντες πόρους σε περιβάλλοντα azd
2. Αναφερθείτε σε υπάρχοντες πόρους στα Bicep πρότυπά σας
3. Χρησιμοποιήσετε το azd για νέες αναπτύξεις παράλληλα με την υπάρχουσα υποδομή

Δείτε τον [Configuration Guide](configuration.md) για λεπτομέρειες.
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
<summary><strong>Μπορώ να χρησιμοποιήσω το azd σε pipelines CI/CD;</strong></summary>

Απολύτως! Το azd έχει σχεδιαστεί για αυτοματοποίηση:
- Ενσωμάτωση με GitHub Actions
- Υποστήριξη Azure DevOps
- Ταυτοποίηση με service principal
- Λειτουργία χωρίς αλληλεπίδραση

Δείτε τον [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) για μοτίβα CI/CD.
</details>

<details>
<summary><strong>Πόρο κόστος έχει η χρήση του azd;</strong></summary>

Το azd καθαυτό είναι **πλήρως δωρεάν** και ανοιχτού κώδικα. Πληρώνετε μόνο για:
- Τους πόρους Azure που αναπτύσσετε
- Το κόστος κατανάλωσης Azure (υπολογιστική ισχύ, αποθήκευση, κ.λπ.)

Χρησιμοποιήστε `azd provision --preview` για να εκτιμήσετε τα έξοδα πριν την ανάπτυξη.
</details>

## Next Steps

1. **Complete authentication**: Ensure you can access your Azure subscription
2. **Try your first deployment**: Follow the [First Project Guide](first-project.md)
3. **Explore templates**: Browse available templates with `azd template list`
4. **Configure your IDE**: Set up your development environment

## Support

If you encounter issues:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Get Azure command guidance directly in your editor with `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** Continue to [Your First Project](first-project.md) to start building with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρότι επιδιώκουμε την ακρίβεια, να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για οποιεσδήποτε παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->