# ಸ್ಥಾಪನೆ ಮತ್ತು ಸೆಟ್‌ಅಪ್ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 1 - ಸ್ಥಾಪನ ಮತ್ತು ತ್ವರಿತ ಪ್ರಾರಂಭ
- **⬅️ ಹಿಂದಿನದು**: [AZD Basics](azd-basics.md)
- **➡️ ಮುಂದಿನದು**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ಪರಿಚಯ

ಈ ಸವಿಸ್ತಾರ ಮಾರ್ಗದರ್ಶಿ ನಿಮ್ಮ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ Azure Developer CLI (azd) ಅನ್ನು ಸ್ಥಾಪಿಸಲು ಮತ್ತು ಸಂರಚಿಸಲು ನಿಮಗೆ ಮಾರ್ಗದರ್ಶನ ಮಾಡುತ್ತದೆ. ವಿಭಿನ್ನ ಕಾರ್ಯಾಚರಣೆ ವ್ಯವಸ್ಥೆಗಳಿಗಾಗಿ ಹಲವು ಸ್ಥಾಪನೆ ವಿಧಾನಗಳು, ದೃಢೀಕರಣ ಸೆಟ್‌ಅಪ್ ಮತ್ತು Azure ನಿಯೋಜನೆಗಳಿಗಾಗಿ ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ಪರಿಸರವನ್ನು ಸಜ್ಜುಗೊಳಿಸುವ ಪ್ರಾಥಮಿಕ ಸಂರಚನೆಗಳು ಇವುಗಳಲ್ಲಿ cover ಆಗಿವೆ.

## ಕಲಿಕೆ ಗುರಿಗಳು

ಪಾಠದ ಅಂತ್ಯಕ್ಕೆ, ನೀವು:
- ನಿಮ್ಮ ಕಾರ್ಯಾಚರಣೆ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ Azure Developer CLI ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಸ್ಥಾಪಿಸಲು ಸಮರ್ಥರಾಗಿರುವಿರಿ
- ಬಹು ವಿಧಗಳ ಬಳಕೆಯಿಂದ Azure ಜೊತೆಗೆ ದೃಢೀಕರಣವನ್ನು ಸಂರಚಿಸಲು ತಿಳಿದುಕೊಳ್ಳುವಿರಿ
- ಅಗತ್ಯ ಪೂರ್ವಾಪೇಕ್ಷೆಗಳೊಂದಿಗೆ ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ಪರಿಸರವನ್ನು ಸೆಟ್‌ಅಪ್ ಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ವಿಭಿನ್ನ ಸ್ಥಾಪನೆ ಆಯ್ಕೆಗಳು ಮತ್ತು ಪ್ರತಿಯೊಬ್ಬವನ್ನು ಯಾವಾಗ ಬಳಸಬೇಕು ಎಂಬುದು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ಸಾಮಾನ್ಯ ಸ್ಥಾಪನೆ ಮತ್ತು ಸೆಟ್‌ಅಪ್ ಸಮಸ್ಯೆಗಳನ್ನು ಶೋಧಿಸಿ ಪರಿಹರಿಸುವನು

## ಕಲಿಕೆ ಫಲಿತಾಂಶಗಳು

ಈ ಪಾಠವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಸಾಧ್ಯವಾಗುವುದು:
- ನಿಮ್ಮ ಪ್ಲ್ಯಾಟ್‌ಫಾರ್ಮ್‌ಗೆ ಸೂಕ್ತವಾದ ವಿಧಾನ ಬಳಸಿಕೊಂಡು azd ಅನ್ನು ಸ್ಥಾಪಿಸುವುದು
- azd auth login ಬಳಸಿ Azure ಜೊತೆಗೆ ಪ್ರಾಮಾಣೀಕರಣ ಮಾಡುವುದು
- ನಿಮ್ಮ ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ ಮೂಲ azd ბრძಾನ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸುವುದು
- azd ಬಳಕೆಗೆ ಗರಿಷ್ಠ ಅನುಕೂಲಕರವಾಗಿ ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ಪರಿಸರವನ್ನು ಸಂರಚಿಸುವುದು
- ಸಾಮಾನ್ಯ ಸ್ಥಾಪನಾ ಸಮಸ್ಯೆಗಳನ್ನು ಸ್ವತಃ ಪರಿಹರಿಸಲು ಸಮರ್ಥರಾಗಿರುವುದು

ಈ ಮಾರ್ಗದರ್ಶಿ ನಿಮ್ಮ ಕಾರ್ಯಾಚರಣೆ ವ್ಯವಸ್ಥೆ ಅಥವಾ ಅಭಿವೃದ್ಧಿ ಪರಿಸರವನ್ನು ಪರಿಗಣಿಸದೇ ನಿಮ್ಮ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ Azure Developer CLI ಅನ್ನು ಸ್ಥಾಪಿಸಲು ಮತ್ತು ಸಂರಚಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.

## ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

azd ಅನ್ನು ಸ್ಥಾಪಿಸುವ ಮೊದಲು, ಕೆಳಕಂಡವುಗಳಿವೆ ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ:
- **Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್** - [ಉಚಿತ ಖಾತೆ ರಚಿಸಿ](https://azure.microsoft.com/free/)
- **Azure CLI** - ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಸಂಪನ್ಮೂಲ ನಿರ್ವಹಣೆಗೆ
- **Git** - ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಕ್ಲೋನ್ ಮಾಡುವ ಮತ್ತು ವರ್ಸನ್ ಕಂಟ್ರೋಲಿಗಾಗಿ
- **Docker** (ಐಚ್ಛಿಕ) - ಕಂಟೈನರೈಸ್ ಮಾಡಿದ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ

## ಸ್ಥಾಪನಾ ವಿಧಾನಗಳು

### Windows

#### ಆಯ್ಕೆ 1: PowerShell (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
```powershell
# ಆಡ್ಮಿನಿಸ್ಟ್ರೇಟರ್ ಹಕ್ಕುಗಳೊಂದಿಗೆ ಅಥವಾ ಉನ್ನತ ಅನುಮತಿಗಳೊಂದಿಗೆ ಚಾಲನೆ ಮಾಡಿ
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ಆಯ್ಕೆ 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### ಆಯ್ಕೆ 3: Chocolatey
```cmd
choco install azd
```

#### ಆಯ್ಕೆ 4: ಕೈಯಿಂದ ಸ್ಥಾಪನೆ
1. ಇತ್ತೀಚಿನ ಬಿಡುಗಡೆಯನ್ನು [GitHub](https://github.com/Azure/azure-dev/releases) ನಿಂದ ಡೌನ್ಲೋಡ್ ಮಾಡಿ
2. `C:\Program Files\azd\` ಗೆ ಎಕ್ಸ್ಟ್ರಾಕ್ಟ್ ಮಾಡಿ
3. PATH ಪರಿಸರಚರಕ್ಕೆ ಸೇರಿಸಿ

### macOS

#### ಆಯ್ಕೆ 1: Homebrew (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
```bash
brew tap azure/azd
brew install azd
```

#### ಆಯ್ಕೆ 2: ಇನ್ಸ್ಟಾಲ್ ಸ್ಕ್ರಿಪ್ಟ್
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ಆಯ್ಕೆ 3: ಕೈಯಿಂದ ಸ್ಥಾಪನೆ
```bash
# ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ ಮತ್ತು ಸ್ಥಾಪಿಸಿ
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### ಆಯ್ಕೆ 1: ಇನ್ಸ್ಟಾಲ್ ಸ್ಕ್ರಿಪ್ಟ್ (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ಆಯ್ಕೆ 2: ಪ್ಯಾಕೇಜ್ ಮ್ಯಾನೇಜರ್‌ಗಳು

**Ubuntu/Debian:**
```bash
# Microsoft ಪ್ಯಾಕೇಜ್ ರೆಪೊಸಿಟರಿ ಸೇರಿಸಿ
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ಅನ್ನು ಸ್ಥಾಪಿಸಿ
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft ಪ್ಯಾಕೇಜ್ ರೆಪೊಸಿಟರಿಯನ್ನು ಸೇರಿಸಿ
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces ನಲ್ಲಿ ಪೂರ್ವ-ಸ್ಥಾಪಿತವಾಗಿರುತ್ತದೆ. ಕೇವಲ ಒಂದು codespace ರಚಿಸಿ ಮತ್ತು ತಕ್ಷಣವೇ azd ಬಳಸಲು ಆರಂಭಿಸಿ.

### Docker

```bash
# azd ಅನ್ನು ಕಂಟೈನರ್‌ನಲ್ಲಿ ಚಾಲನೆ ಮಾಡಿ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# ಸುಲಭವಾಗಿ ಬಳಸಲು ಒಂದು ಉಪನಾಮವನ್ನು ರಚಿಸಿ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ಸ್ಥಾಪನೆ ಪರಿಶೀಲಿಸಿ

ಸ್ಥಾಪನೆಯ ನಂತರ, azd ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ:

```bash
# ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version

# ಸಹಾಯವನ್ನು ನೋಡಿ
azd --help

# ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳ ಪಟ್ಟಿಯನ್ನು ಪ್ರದರ್ಶಿಸಿ
azd template list
```

ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್:
```
azd version 1.x.x (commit xxxxxx)
```

**ಗಮನಿಸಿ**: ನಿಜವಾದ ಆವೃತ್ತಿ ಸಂಖ್ಯೆ ವಿಭಿನ್ನವಾಗಬಹುದು. ಇತ್ತೀಚಿನ ಆವೃತ್ತಿಗಾಗಿ [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) ಅನ್ನು ಪರಿಶೀಲಿಸಿ.

**✅ ಸ್ಥಾಪನೆ ಯಶಸ್ಸಿನ ಚೆಕ್ಲಿಸ್ಟ್:**
- [ ] `azd version` ತಪ್ಪುಗಳಿಲ್ಲದೆ ಆವೃತ್ತಿ ಸಂಖ್ಯೆಯನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] `azd --help` ಕಮಾಂಡ್ ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಅನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ
- [ ] `azd template list` ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] `az account show` ನಿಮ್ಮ Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಅನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ
- [ ] ನೀವು ಒಂದು ಪರೀಕ್ಷಾ ಡೈರೆಕ್ಟರಿಯನ್ನು ರಚಿಸಿ `azd init` ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಚಾಲನೆ ಮಾಡಬಹುದು

**ಎಲ್ಲಾ ಚೆಕ್‌ಗಳು ಸರಿ ಇದ್ದರೆ, ನೀವು [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md) ಗೆ ಮುಂದುವರಿಸಲು ಸಿದ್ಧರಿದ್ದೀರಿ!**

## ದೃಢೀಕರಣ ಸೆಟ್‌ಅಪ್

### Azure CLI ದೃಢೀಕರಣ (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
```bash
# Azure CLI ಅನ್ನು ಇನ್ನೂ ಸ್ಥಾಪಿಸಿಲ್ಲದಿದ್ದರೆ ಸ್ಥಾಪಿಸಿ
# ವಿಂಡೋಸ್: winget install Microsoft.AzureCLI
# ಮ್ಯಾಕ್‌ಒಎಸ್: brew install azure-cli
# ಲಿನಕ್ಸ್: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login

# ಪ್ರಾಮಾಣೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
```

### ಡಿವೈಸ್ ಕೋಡ್ ದೃಢೀಕರಣ
ನೀವು ಹೆಡ್‌ಲೆಸ್ ಸಿಸ್ಟಮ್‌ನಲ್ಲಿ ಇದ್ದರೆ ಅಥವಾ ಬ್ರೌಸರ್ ಸಮಸ್ಯೆಗಳಿದ್ದರೆ:
```bash
az login --use-device-code
```

### ಸರ್ವಿಸ್ ಪ್ರಿನ್ಸಿಪಾಲ್ (CI/CD)
ಸ್ವಯಂಚಾಲಿತ ವಾತಾವರಣಗಳಿಗಾಗಿ:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## ಸಂರಚನೆ

### ಜಾಗತಿಕ ಸಂರಚನೆ
```bash
# ಡೀಫಾಲ್ಟ್ ಚಂದಾದಾರಿಕೆಯನ್ನು ಹೊಂದಿಸಿ
azd config set defaults.subscription <subscription-id>

# ಡೀಫಾಲ್ಟ್ ಸ್ಥಳವನ್ನು ಹೊಂದಿಸಿ
azd config set defaults.location eastus2

# ಎಲ್ಲಾ ಸಂರಚನೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd config list
```

### ಪರಿಸರ ಚರಗಳು
ನಿಮ್ಮ ಶೆಲ್ ಪ್ರೊಫೈಲ್ (`.bashrc`, `.zshrc`, `.profile`) ಗೆ ಸೇರಿಸಿ:
```bash
# ಅಜೂರ್ ಸಂರಚನೆ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ಸಂರಚನೆ
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ಡಿಬಗ್ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
```

## IDE ಏಕೀಕರಣ

### Visual Studio Code
Azure Developer CLI ಎಕ್ಸ್ಟೆನ್ಷನ್ ಅನ್ನು ಇನ್ಸ್‌ಟಾಲ್ ಮಾಡಿ:
1. VS Code ತೆರೆಯಿರಿ
2. ಎಕ್ಸ್‌ಟೆನ್ಷನ್‌ಗಳಿಗೆ ಹೋಗಿ (Ctrl+Shift+X)
3. "Azure Developer CLI" ಅನ್ನು ಹುಡುಕಿ
4. ಎಕ್ಸ್ಟೆನ್ಷನ್ ಅನ್ನು ಇನ್ಸ್‌ಟಾಲ್ ಮಾಡಿ

ವೈಶಿಷ್ಟ್ಯಗಳು:
- azure.yaml ಗೆ IntelliSense
- ಒಟ್ಟುಗೂಡಿದ ಟರ್ಮಿನಲ್ ಕಮಾಂಡ್‌ಗಳು
- ಟೆಂಪ್ಲೇಟು ಬ್ರೌಸಿಂಗ್
- ನಿಯೋಜನೆ ಮೇಲ್ವಿಚಾರಣೆ

### GitHub Codespaces
`.devcontainer/devcontainer.json` ರಚಿಸಿ:
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
1. Azure ಪ್ಲಗಿನ್ ಇನ್ಸ್ಟಾಲ್ ಮಾಡಿ
2. Azure ಕ್ರಿಡೆನ್ಶಿಯಲ್ಗಳನ್ನು ಸಂರಚಿಸಿ
3. azd ಕಮಾಂಡ್‌ಗಳಿಗಾಗಿ ಒಳಗಿನ್ನಿ ಟರ್ಮಿನಲ್ ಬಳಸಿ

## 🐛 ಸ್ಥಾಪನಾ ಸಮಸ್ಯೆ ಪರಿಹಾರ

### ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು

#### ಅನುಮತಿ ನಿರಾಕರಿಸಲಾಗಿದೆ (Windows)
```powershell
# PowerShell ಅನ್ನು ಆಡಳಿತಾಧಿಕಾರಿಯಾಗಿ ಓಡಿಸಿ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ಸಮಸ್ಯೆಗಳು
ಹಸ್ತಚಾಲಿತವಾಗಿ azd ಅನ್ನು ನಿಮ್ಮ PATH ಗೆ ಸೇರಿಸಿ:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### ನೆಟ್‌ವರ್ಕ್/ಪ್ರಾಕ್ಸಿ ಸಮಸ್ಯೆಗಳು
```bash
# ಪ್ರಾಕ್ಸಿಯನ್ನು ಸಂರಚಿಸಿ
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL ಪರಿಶೀಲನೆಯನ್ನು ಬಿಟ್ಟುಬಿಡಿ (ಉತ್ಪಾದನಾ ಪರಿಸರಕ್ಕೆ ಶಿಫಾರಸು ಮಾಡಲಾಗುವುದಿಲ್ಲ)
azd config set http.insecure true
```

#### ಆವೃತ್ತಿ ಗೊಂದಲಗಳು
```bash
# ಹಳೆಯ ಸ್ಥಾಪನೆಗಳನ್ನು ತೆಗೆದುಹಾಕಿ
# ವಿಂಡೋಸ್: winget uninstall Microsoft.Azd
# ಮ್ಯಾಕ್‌ಒಎಸ್: brew uninstall azd
# ಲಿನಕ್ಸ: sudo apt remove azd

# ಸಂರಚನೆಯನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
rm -rf ~/.azd
```

### ಹೆಚ್ಚಿನ ಸಹಾಯ ಪಡೆಯುವುದು
```bash
# ಡಿಬಗ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd <command> --debug

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
azd config list

# ಪ್ರಸ್ತುತ ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸಿ
azd show
```

## azd ನನ್ನು ನವೀಕರಿಸುವುದು

### ಸ್ವಯಂಚಾಲಿತ ನವೀಕರಣಗಳು
azd ನವೀಕರಣಗಳು ಲಭ್ಯವಾದಾಗ ನಿಮಗೆ ಸೂಚನೆ ನೀಡುತ್ತದೆ:
```bash
azd version --check-for-updates
```

### ಕೈಯಿಂದ ನವೀಕರಣಗಳು

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

## 💡 ವ್ಯಾಪಕವಾಗಿ ಕೇಳಲಾಗುವ ಪ್ರಶ್ನೆಗಳು

<details>
<summary><strong>azd ಮತ್ತು az CLI ನಡುವೆ ವ್ಯತ್ಯಾಸವೇನು?</strong></summary>

**Azure CLI (az)**: ವೈಯಕ್ತಿಕ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿರ್ವಹಿಸಲು ಕಡಿಮೆ-ಮಟ್ಟದ ಸಾಧನ
- `az webapp create`, `az storage account create`
- ಒಂದು ಸಮಯದಲ್ಲಿ ಒಂದು ಸಂಪನ್ಮೂಲ
- ಇಂಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ನಿರ್ವಹಣಾ ಕಡೆ ತೀವ್ರ ಗಮನ

**Azure Developer CLI (azd)**: ಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಗಳಿಗೆ ಉನ್ನತ-ಮಟ್ಟದ ಸಾಧನ
- `azd up` ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳೊಂದಿಗೆ ಸಂಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ
- ಟೆಂಪ್ಲೇಟ್ ಆಧಾರಿತ ವರ್ಕ್‌ಫ್ಲೋಗಳು
- ಡೆವಲಪರ್ ಉತ್ಪಾದಕತೆ ಮೇಲೆ ಕೇಂದ್ರಿತ

**ನಿಮಗೆ ಎರಡೂ ಬೇಕು**: azd ಪ್ರಾಮಾಣೀಕರಿಸಲು az CLI ಅನ್ನು ಬಳಸುತ್ತದೆ
</details>

<details>
<summary><strong>ನಾನು ఇప్పటికే ಇರುವ Azure ಸಂಪನ್ಮೂಲಗಳೊಂದಿಗೆ azd ಬಳಸಬಹುದೇ?</strong></summary>

ಹೌದು! ನೀವು ಆಗಬಹುದು:
1. ಆಗಿದ್ದ ಸಂಪನ್ಮuelo ಗಳನ್ನು azd ವಾತಾವರಣಗಳಿಗೆ ಇಂಪೋರ್ಟ್ ಮಾಡಿ
2. ನಿಮ್ಮ Bicep ಟೆಂಪ್ಲೇಟ್ಗಳಲ್ಲಿ ಈಗಿರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಉಲ್ಲೇಖಿಸಿ
3. ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಮೂಲಸೌಕರ್ಯಗಳ ಜೊತೆಗೆ ಹೊಸ ನಿಯೋಜನೆಗಳಿಗಾಗಿ azd ಅನ್ನು ಬಳಸಿ

ವಿವರಗಳಿಗೆ [Configuration Guide](configuration.md) ಅನ್ನು ನೋಡಿ.
</details>

<details>
<summary><strong>azd Azure ಗವರ್ನಮೆಂಟ್ ಅಥವಾ Azure ಚೀನಾ ಜೊತೆ ಕೆಲಸ ಮಾಡುತ್ತದೆಯೇ?</strong></summary>

ಹೌದು, ಕ್ಲೌಡ್ ಅನ್ನು ಸಂರಚಿಸಿ:
```bash
# Azure ಸರ್ಕಾರ
az cloud set --name AzureUSGovernment
az login

# Azure ಚೀನಾ
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>ನಾನು azd ಅನ್ನು CI/CD ಪೈಪ್‌ಲೈನಿನಲ್ಲಿ ಬಳಸಬಹುದೇ?</strong></summary>

ಖಂಡಿತವಾಗಿ! azd automation ಗಾಗಿ ವಿನ್ಯಾಸಗೊಳಿಸಲಾಗಿದೆ:
- GitHub Actions ಏಕೀಕರಣೆ
- Azure DevOps ಬೆಂಬಲ
- ಸರ್ವಿಸ್ ಪ್ರಿನ್ಸಿಪಲ್ ದೃಢೀಕರಣ
- ಅಇಂಟರಾಕ್ಟಿವ್ ಮೋಡ್

CI/CD ಮಾದರಿಗಳಿಗಾಗಿ [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md) ಅನ್ನು ನೋಡಿ.
</details>

<details>
<summary><strong>azd ಬಳಸುವುದರಿಂದ ವೆಚ್ಚ ಎಷ್ಟು ಬರುತ್ತದೆ?</strong></summary>

azd само **ಸಂಪೂರ್ಣವಾಗಿ ಉಚಿತ** ಮತ್ತು ಓಪನ್-ಸೋರ್ಸ್ ಆಗಿದೆ. ನೀವು ಕೇವಲ ದರಹೋಗುವವುಗಳಿಗೆ ಹಣಕೊಡಬೇಕು:
- ನೀವು ನಿಯೋಜಿಸುವ Azure ಸಂಪನ್ಮೂಲಗಳು
- Azure ಉಪಭೋಗದ ವೆಚ್ಚಗಳು (compute, storage, ಇತ್ಯಾದಿ)

ನಿಯೋಜನೆಯ ಮುಂಚಿತವಾಗಿ ವೆಚ್ಚದ ಮುನ್ಸಾವಯವಕ್ಕೆ `azd provision --preview` ಅನ್ನು ಬಳಸಿ.
</details>

## ಮುಂದಿನ ಹಂತಗಳು

1. **ದೃಢೀಕರಣ ಪೂರ್ಣಗೊಳಿಸಿ**: ನೀವು ನಿಮ್ಮ Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್‌에 ಪ್ರವೇಶಿಸಬಹುದು ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
2. **ನಿಮ್ಮ ಮೊದಲ ನಿಯೋಜನೆಯನ್ನು ಪ್ರಯತ್ನಿಸಿ**: [ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್ ಮಾರ್ಗದರ್ಶಿ](first-project.md) ಅನ್ನು ಅನುಸರಿಸಿ
3. **ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಅನ್ವೇಷಿಸಿ**: `azd template list` ಮೂಲಕ ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ
4. **ನಿಮ್ಮ IDE ಅನ್ನು ಸಂರಚಿಸಿ**: ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ಪರಿಸರವನ್ನು ಸೆಟ್‌ಅಪ್ ಮಾಡಿ

## ಬೆಂಬಲ

ನೀವು ಸಮಸ್ಯೆಗಳನ್ನು ಎದುರಿಸಿದರೆ:
- [ಅಧಿಕೃತ ಡಾಕ್ಯುಮೆಂಟೇಷನ್](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ಸಮಸ್ಯೆಗಳನ್ನು ರಿಪೋರ್ಟ್ ಮಾಡಿ](https://github.com/Azure/azure-dev/issues)
- [ಸಮುದಾಯ ಚರ್ಚೆಗಳು](https://github.com/Azure/azure-dev/discussions)
- [Azure ಬೆಂಬಲ](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - ನಿಮ್ಮ ಸಂಪಾದಕದಲ್ಲಿ ನೇರವಾಗಿ Azure ಕಮಾಂಡ್ ಮಾರ್ಗದರ್ಶನ ಪಡೆಯಲು `npx skills add microsoft/github-copilot-for-azure` ಬಳಸಿ

---

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ અધ್ಯಾಯ**: ಅಧ್ಯಾಯ 1 - ಸ್ಥಾಪನ ಮತ್ತು ತ್ವರಿತ ಪ್ರಾರಂಭ
- **⬅️ ಹಿಂದಿನದು**: [AZD Basics](azd-basics.md) 
- **➡️ ಮುಂದಿನದು**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅధ్యಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ಸ್ಥಾಪನೆ ಪೂರ್ಣ!** [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md) ಗೆ ಮುಂದುವರಿದು azd ನೊಂದಿಗೆ ನಿರ್ಮಿಸಲು ಪ್ರಾರಂಭಿಸಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ಈ ದಾಖಲೆವು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗಾಗಿ ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅನಿಖರತೆಗಳು ಇರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಾಖಲೆವನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಗಳಿಂದ ಉಂಟಾಗುವ anumang ತಪ್ಪು ಗ್ರಹಿಕೆಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->