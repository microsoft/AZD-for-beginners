# ಸ್ಥಾಪನೆ ಮತ್ತು ಸೆಟ್ಅಪ್ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 1 - ಮೂಲಭೂತ & ವೇಗದ ಪ್ರಾರಂಭ
- **⬅️ ಹಿಂದಿನ**: [AZD Basics](azd-basics.md)
- **➡️ ಮುಂದಿನ**: [Your First Project](first-project.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ಪರಿಚಯ

ಈ ಸಂಪೂರ್ಣ ಮಾರ್ಗದರ್ಶಿ ನಿಮ್ಮ ಸಿಸ್ಟಮ್ನಲ್ಲಿ Azure Developer CLI (azd) ಅನ್ನು ಸ್ಥಾಪನೆ ಮತ್ತು ಸಂರಚಿಸುವುದರಲ್ಲಿ ನಿಮ್ಮನ್ನು ಹಂತಹಂತವಾಗಿ ಮಾರುತ್ತಾ ತೆಗೆಯುತ್ತದೆ. ನೀವು ವಿಭಿನ್ನ ಆಪರೇಟಿಂಗ್ ಸಿಸ್ಟಂಗಳಿಗಾಗಿ ಹಲವು ಸ್ಥಾಪನಾ ವಿಧಾನಗಳನ್ನು, ದೃಢೀಕರಣ ಸೆಟಪ್ ಮತ್ತು Azure ಡಿಪ್ಲೋಯ್‌ಗಳನ್ನು ಕೈಗೊಳ್ಳಲು ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ಪರಿಸರಕ್ಕಾಗಿ ಪ್ರಾಥಮಿಕ ಸಂರಚನೆಯನ್ನು ಕಲಿಯುತ್ತೀರಿ.

## ಕಲಿಕೆ ಗುರಿಗಳು

ಈ ಪಾಠದ ಅಂತ್ಯಕ್ಕೆ, ನೀವು:
- ನಿಮ್ಮ ഓಪರೇಟಿಂಗ್ ಸಿಸ್ಟಮ್ನಲ್ಲಿ Azure Developer CLI ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡುವುದು
- ಹಲವು ವಿಧಾನಗಳ ಮೂಲಕ Azure ಜೊತೆ ದೃಢೀಕರಣವನ್ನು ಸಂರಚಿಸುವುದು
- ಅಗತ್ಯ ಆದ್ಮಾಗುಳೊಂದಿಗೆ ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ಪರಿಸರವನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡುವುದು
- ವಿಭಿನ್ನ ಸ್ಥಾಪನಾ ಆಯ್ಕೆಗಳು ಮತ್ತು ಯಾವಾಗ ಯಾವದು ಬಳಸಬೇಕೆಂದು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಸಾಮಾನ್ಯ ಸ್ಥಾಪನೆ ಮತ್ತು ಸೆಟಪ್ ಸಮಸ್ಯೆಗಳನ್ನು ಟ್ರಬಲ್‌ಶೂಟ್ ಮಾಡುವುದು

## ಕಲಿಕಾ ಫಲಿತಾಂಶಗಳು

ಈ ಪಾಠವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಸಾಧ್ಯವಾಗುತ್ತದೆ:
- ನಿಮ್ಮ ಪ್ಲಾಟ್‌‌ಫಾರ್ಮ್‌ಗೆ מתאים ವಿಧಾನವನ್ನು ಬಳಸಿಕೊಂಡು azd ಅನ್ನು ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿಕೊಳ್ಳಲು
- `azd auth login` ಬಳಸಿ Azure ಜೊತೆ ದೃಢೀಕರಣ ಮಾಡಲು
- ನಿಮ್ಮ ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ ಮೂಲ azd ಆಜ್ಞೆಗಳನ್ನು ಪರೀಕ್ಷಿಸಲು
- azd ಬಳಸಲು ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ಪರಿಸರವನ್ನು ಅತಿ ಉತ್ತಮವಾಗಿ ಸಂರಚಿಸಲು
- ಸಾಮಾನ್ಯ ಸ್ಥಾಪನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಸ್ವತಂತ್ರವಾಗಿ ಪರಿಹರಿಸಲು

ಈ ಮಾರ್ಗದರ್ಶಿ ನಿಮ್ಮ ಆಪರೇಟಿಂಗ್ ಸಿಸ್ಟಮ್ ಅಥವಾ ಅಭಿವೃದ್ಧಿ ಪರಿಸರವೇ ಯಾವದ್ದೇ ಇರಲಿ, ನಿಮ್ಮ ಸಿಸ್ಟಮ್‌ನಲ್ಲಿ Azure Developer CLI ಅನ್ನು ಇನ್‌ಸ್ಟಾಲ್ ಮತ್ತು ಸಂರಚಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.

## ಪ್ರತ್ಯೇಕ ಅಗತ್ಯಗಳು

azd ಅನ್ನು ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡುವ ಮೊದಲು, ಈ зүйлಗಳು ಇದ್ದೇ ಇರಲು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ:
- **Azure ಚಂದಾದಾರಿಕೆ** - [ಉಚಿತ ಖಾತೆಯನ್ನು ರಚಿಸಿ](https://azure.microsoft.com/free/)
- **Azure CLI** - ದೃಢೀಕರಣ ಮತ್ತು ಸಂಪನ್ಮೂಲ ನಿರ್ವಹಣೆಗೆ
- **Git** - ಟೆಂಪ್ಲೇಟ್‌ಗಳನ್ನು ಕ್ಲೋನ್ ಮಾಡಲು ಮತ್ತು ವರ್ಝನ್ ನಿಯಂತ್ರಣದಲ್ಲಿ ಬಳಸಲು
- **Docker** (ಐಚ್ಛಿಕ) - ಕಂಟೈನರೈಜ್ಡ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ

## ಸ್ಥಾಪನೆ ವಿಧಾನಗಳು

### Windows

#### ಆಯ್ಕೆ 1: PowerShell (ಶಿಫಾರಸು)
```powershell
# ಅಡ್ಮಿನಿಸ್ಟ್ರೇಟರ್ ಆಗಿ ಅಥವಾ ಹೆಚ್ಚಾದ ಅನುಮತಿಗಳೊಂದಿಗೆ ಚಾಲನೆ ಮಾಡಿ
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
1. ಇತ್ತೀಚಿನ ಬಿಡುಗಡೆವನ್ನು [GitHub](https://github.com/Azure/azure-dev/releases) ನಿಂದ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ
2. Extract to `C:\Program Files\azd\`
3. PATH ಪರಿಸರ ಚರಕ್ಕೆ ಸೇರಿಸಿ

### macOS

#### ಆಯ್ಕೆ 1: Homebrew (ಶಿಫಾರಸು)
```bash
brew tap azure/azd
brew install azd
```

#### ಆಯ್ಕೆ 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ಆಯ್ಕೆ 3: ಕೈಯಿಂದ ಸ್ಥಾಪನೆ
```bash
# ಡೌನ್ಲೋಡ್ ಮಾಡಿ ಮತ್ತು ಸ್ಥಾಪಿಸಿ
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### ಆಯ್ಕೆ 1: Install Script (ಶಿಫಾರಸು)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ಆಯ್ಕೆ 2: Package Managers

**Ubuntu/Debian:**
```bash
# Microsoft ಪ್ಯಾಕೇಜ್ ರೆಪೊಜಿಟರಿ ಸೇರಿಸಿ
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ಅನ್ನು ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ
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

azd GitHub Codespaces ನಲ್ಲಿ ಪೂರ್ವಸ್ಥಾಪಿತವಾಗಿಯೇ ಬರುತ್ತದೆ. ಸೀಧಾ codespace ರಚಿಸಿ ಮತ್ತು ತಕ್ಷಣ azd ಬಳಸಲು ಪ್ರಾರಂಭಿಸಬಹುದು.

### Docker

```bash
# azd ಅನ್ನು ಕಂಟೈನರ್‌ನಲ್ಲಿ ಓಡಿಸಿ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# ಸುಲಭ ಬಳಕೆಗೆ ಆಲಿಯಾಸ್ ರಚಿಸಿ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ಸ್ಥಾಪನೆ ಪರಿಶೀಲನೆ

ಸ್ಥಾಪನೆಯ ನಂತರ, azd ಸರಿಯಾಗಿ ಕೆಲಸ ಮಾಡುತ್ತಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ:

```bash
# ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version

# ಸಹಾಯವನ್ನು ವೀಕ್ಷಿಸಿ
azd --help

# ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd template list
```

ಅನಿಕ್ಷಿತ ಫಲಿತಾಂಶ:
```
azd version 1.x.x (commit xxxxxx)
```

**ಗಮನಿಸಿ**: ವಾಸ್ತವಿಕ ಆವೃತ್ತಿ ಸಂಖ್ಯೆ ಬದಲಾಗಬಹುದು. ಇತ್ತೀಚಿನ ಆವೃತ್ತಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases).

**✅ ಸ್ಥಾಪನೆ ಯಶಸ್ಸಿನ ಚೆಕ್‌ಲಿಸ್ಟ್:**
- [ ] `azd version` ದೋಷವಿಲ್ಲದೆ ಆವೃತ್ತಿ ಸಂಖ್ಯೆಯನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] `azd --help` ಕಮಾಂಡ್ ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಅನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ
- [ ] `azd template list` ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] `az account show` ನಿಮ್ಮ Azure ಚಂದಾದಾರಿಕೆಯನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ
- [ ] ನೀವು ಟೆಸ್ಟ್ ಡೈರೆಕ್ಟರಿಯನ್ನು ರಚಿಸಿ `azd init` ಯಶಸ್ವಿಯಾಗಿ ಚಾಲನೆ ಮಾಡಬಹುದು

**ಎಲ್ಲಾ ತಪಾಸಣೆಗಳು ಉತ್ತೀರ್ಣವಾದಲ್ಲಿ, ನೀವು [Your First Project](first-project.md) ಕಡೆಗೆ ಮುಂದುವರಿಯಲು ಸಿದ್ದರಾಗಿದ್ದೀರಿ!**

## ಪ್ರಮಾಣೀಕರಣ ಸೆಟಪ್

### Azure CLI ದೃಢೀಕರಣ (ಶಿಫಾರಸು)
```bash
# ಇನ್ನೂ ಸ್ಥಾಪಿಸಲಾಗಿಲ್ಲದಿದ್ದರೆ Azure CLI ಅನ್ನು ಸ್ಥಾಪಿಸಿ
# ವಿಂಡೋಸ್: winget install Microsoft.AzureCLI
# ಮ್ಯಾಕ್‌ಒಎಸ್: brew install azure-cli
# ಲಿನಕ್ಸ್: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login

# ಪ್ರಮಾಣೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
```

### ಡಿವೈಸ್ ಕೋಡ್ ದೃಢೀಕರಣ
ನೀವು ಹೆಡ್‌ಲೆಸ್ ಸಿಸ್ಟಂನಲ್ಲಿ ಇದ್ದರೆ ಅಥವಾ ಬ್ರೌಸರ್ ಸಮಸ್ಯೆಗಳಿದ್ದರೆ:
```bash
az login --use-device-code
```

### ಸೆರ್ವಿಸ್ ಪ್ರಿನ್ಸಿಪಲ್ (CI/CD)
ಸ್ವಯಂಚಾಲಿತ ಪರಿಸರಗಳಿಗೆ:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## ಸಂರಚನೆ

### ಗ್ಲೋಬಲ್ ಸಂರಚನೆ
```bash
# ಡೀಫಾಲ್ಟ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಅನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.subscription <subscription-id>

# ಡೀಫಾಲ್ಟ್ ಸ್ಥಳವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.location eastus2

# ಎಲ್ಲಾ ಸಂರಚನೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd config list
```

### ಪರಿಸರ ಚರಗಳು
ನಿಮ್ಮ ಶೆಲ್ ಪ್ರೊಫೈಲ್ (`.bashrc`, `.zshrc`, `.profile`) ಗೆ ಸೇರಿಸಿರಿ:
```bash
# Azure ಕಾನ್ಫಿಗರೇಶನ್
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ಕಾನ್ಫಿಗರೇಶನ್
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ಡಿಬಗ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ
```

## IDE ಸಮನ್ವಯ

### Visual Studio Code
Azure Developer CLI ವಿಸ್ತರಣೆಯನ್ನು ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ:
1. VS Code ತೆರೆಯಿರಿ
2. ಎಕ್ಸ್ಟೆನ್‌ಷನ್‌ಗಳಿಗೆ ಹೋಗಿ (Ctrl+Shift+X)
3. "Azure Developer CLI" ಹುಡುಕಿ
4. ವಿಸ್ತರಣೆಯನ್ನು ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ

ವೈಶಿಷ್ಟ್ಯಗಳು:
- azure.yaml ಗೆ IntelliSense
- ಒಕ್ಕೂಟಗೊಳಿಸಿದ ಟರ್ಮಿನಲ್ ಕಮಾಂಡ್‌ಗಳು
- ಟೆಂಪ್ಲೇಟ್ ಬ್ರೌಸಿಂಗ್
- ಡಿಪ್ಲೋಯ್‌ಮೆಂಟ್ ಮಾನಿಟರಿಂಗ್

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
1. Azure ಪ್ಲಗಿನ್ ಅನ್ನು ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ
2. Azure ಕ್ರೆಡೆನ್ಷಿಯಲ್ಸ್ ಸಂರಚಿಸಿ
3. azd ಕಮಾಂಡ್‌ಗಳಿಗಾಗಿ ಒಕ್ಕೂಟಗೊಳಿಸಿದ ಟರ್ಮಿನಲ್ ಬಳಸಿ

## 🐛 ದೋಷ ಪರಿಹಾರ

### ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು

####Permission Denied (Windows)
```powershell
# PowerShell ಅನ್ನು ಆಡ್ಮಿನಿಸ್ಟ್ರೇಟರ್ ಹಕ್ಕುಗಳೊಂದಿಗೆ ಚಾಲನೆ ಮಾಡಿ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
ಹಸ್ತಚಾಲಿತವಾಗಿ azd ಅನ್ನು PATH ಗೆ ಸೇರ್ಪಡೆ ಮಾಡಿರಿ:

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
# ಪ್ರಾಕ್ಸಿಯನ್ನು ಸಂರಚಿಸಿ
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL ಪರಿಶೀಲನೆಯನ್ನು ತಪ್ಪಿಸಿ (ಉತ್ಪಾದನೆಗಾಗಿ ಶಿಫಾರಸು ಮಾಡಲಾಗುವುದಿಲ್ಲ)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# ಹಳೆ ಸ್ಥಾಪನೆಗಳನ್ನು ತೆಗೆದುಹಾಕಿ
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# ಸಂರಚನೆಯನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
rm -rf ~/.azd
```

### ಹೆಚ್ಚಿನ ಸಹಾಯ ಪಡೆಯುವುದು
```bash
# ಡೀಬಗ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd <command> --debug

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
azd config list

# ಪ್ರಸ್ತುತ ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸಿ
azd show
```

## azd ನವೀಕರಣ

### ಸ್ವಯಂಚಾಲಿತ ನವೀಕರಣಗಳು
azd ನವೀಕರಣಗಳು ಲಭ್ಯವಾಗಿದೆಯೆಂದಾದರೆ ನಿಮಗೆ ಸೂಚನೆ ನೀಡುತ್ತದೆ:
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

## 💡 ಸಾಮಾನ್ಯವಾಗಿ ಕೇಳುವ ಪ್ರಶ್ನೆಗಳು

<details>
<summary><strong>azd ಮತ್ತು az CLI ನಡುವೆ有什么 ವ್ಯತ್ಯಾಸ?</strong></summary>

**Azure CLI (az)**: ವೈಯಕ್ತಿಕ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿರ್ವಹಿಸಲು ಕಡಿಮೆ-ಕಡತದ ಉಪಕರಣ
- `az webapp create`, `az storage account create`
- ಒಂದೇ ವೇಳೆಯಲ್ಲಿ ಒಂದು ಸಂಪನ್ಮೂಲ
- ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ನಿರ್ವಹಣೆಯ ಮೇಲೆ ದೃಷ್ಠಿ

**Azure Developer CLI (azd)**: ಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಾಗಿ ಉನ್ನತ-ಮಟ್ಟದ ಉಪಕರಣ
- `azd up` ಸಂಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳೊಂದಿಗೆ ಡಿಪ್ಲೋಯ್ ಮಾಡುತ್ತದೆ
- ಟೆಂಪ್ಲೇಟ್ ಆಧಾರಿತ ವರ್ಕ್‌ಫ್ಲೋಗಳು
- ಡಿವೆಲಪರ್ ಉತ್ಪಾದಕತೆ ಮೇಲೆ ಮಟ್ಟ

**ನಿಮಗೆ ಎರಡೂ ಬೇಕು**: azd ದೃಢೀಕರಣಕ್ಕಾಗಿ az CLI ಅನ್ನು ಬಳಸುತ್ತದೆ
</details>

<details>
<summary><strong>ನಾನು നിലവിലുള്ള Azure ಸಂಪನ್ಮೂಲಗಳೊಂದಿಗೆ azd ಬಳಸಬಹುದೇ?</strong></summary>

ಹೌದು! ನೀವು ಮಾಡಬಹುದು:
1. գոյಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು azd ಪರಿಸರಗಳಿಗೆ ಇಂಪೋರ್ಟ್ ಮಾಡಿ
2. ನಿಮ್ಮ Bicep ಟೆಂಪ್ಲೇಟ್‌ಗಳಲ್ಲಿ ಇರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಉಲ್ಲೇಖಿಸಿ
3. ನವೀನ್ ಡಿಪ್ಲೋಯ್‌ಗಳೊಂದಿಗೆ ಜೊತೆಗೆ azd ಅನ್ನು ಬಳಸಿ

ವಿವರಣೆಗೆ ನೋಡಿ [Configuration Guide](configuration.md).
</details>

<details>
<summary><strong>azd ಯಾವ Azure Government ಅಥವಾ Azure China ಜೊತೆ ಕೆಲಸ ಮಾಡುತ್ತದೆಯೇ?</strong></summary>

ಹೌದು, ಕ್ಲೌಡ್ ಅನ್ನು ಸಂರಚಿಸಿ:
```bash
# ಅಜೂರ್ ಸರ್ಕಾರ
az cloud set --name AzureUSGovernment
az login

# ಅಜೂರ್ ಚೀನಾ
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>ನಾನು CI/CD ಪೈಪ್ಲೈನ್‌ಗಳಲ್ಲಿ azd ಬಳಸಬಹುದೇ?</strong></summary>

ಖಂಡಿತವಾಗಿಯೂ! azd ಸ್ವಯಂಚಾಲಿತತೆಗೆ ವಿನ್ಯಾಸಗೊಳಿಸಲಾಗಿದೆ:
- GitHub Actions ಏಕೀಕರಣ
- Azure DevOps ಬೆಂಬಲ
- ಸೆರ್ವಿಸ್ ಪ್ರಿನ್ಸಿಪಲ್ ದೃಢೀಕರಣ
- ಇಂಟರಾಕ್ಟಿವ್ ಹೊರತುಪಡಿಸದ ಮೋಡ್

CI/CD ಪ್ಯಾಟರ್ನ್ಗಳಿಗಾಗಿ ನೋಡಿ [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>azd ಬಳಸುವುದರಿಂದ ವೆಚ್ಚ ಎಷ್ಟು?</strong></summary>

azd ಸ್ವಯಂ **ಒಟ್ಟು ಮುಕ್ತ** ಮತ್ತು open-source ಆಗಿದೆ. ನಿಮಗೆ ಮಾತ್ರ ಪಾವತಿಸಬೇಕಾದದ್ದು:
- ನೀವು ಡಿಪ್ಲಾಯ್ ಮಾಡುವ Azure ಸಂಪನ್ಮೂಲಗಳು
- Azure ಬಳಕೆಯ ವೆಚ್ಚಗಳು (compute, storage, ಇತ್ಯಾದಿ)

ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮುನ್ನ ಖರ್ಚನ್ನು ಅಂದಾಜಿಸಲು `azd provision --preview` ಬಳಸಿ.
</details>

## ಮುಂದಿನ ಹಂತಗಳು

1. **ದೃಢೀಕರಣ ಪೂರ್ಣಗೊಳಿಸಿ**: ನೀವು ನಿಮ್ಮ Azure ಚಂದಾದಾರಿಕೆಯನ್ನು ಪ್ರವೇಶಿಸಬಹುದು ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
2. **ನಿಮ್ಮ ಮೊದಲ ಡಿಪ್ಲಾಯ್ ಪ್ರಯತ್ನಿಸಿ**: ಅನುಸರಿಸಿ [First Project Guide](first-project.md)
3. **ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಅನ್ವೇಷಿಸಿ**: `azd template list` ಬಳಸಿ ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ
4. **ನಿಮ್ಮ IDE ಸಂರಚಿಸಿ**: ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ಪರಿಸರವನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ

## ಬೆಂಬಲ

ನೀವು ಸಮಸ್ಯೆಗಳನ್ನು ಎದುರಿಸಿದರೆ:
- [ಅಧಿಕೃತ ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Problem Repo](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 1 - ಮೂಲಭೂತ & ವೇಗದ ಪ್ರಾರಂಭ
- **⬅️ ಹಿಂದಿನ**: [AZD Basics](azd-basics.md) 
- **➡️ ಮುಂದಿನ**: [Your First Project](first-project.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ಸ್ಥಾಪನೆ ಪೂರ್ಣಗೊಳ್ಳಿತು!** azd ಬಳಸಿ ನಿರ್ಮಿಸಲು ಪ್ರಾರಂಭಿಸಲು [Your First Project](first-project.md) ಗೆ ಮುಂದುವರಿಯಿರಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಜವಾಬ್ದಾರಿ ನಿರಾಕರಣೆ:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗಾಗಿ ಪ್ರಯತ್ನಿಸಿದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಂಗತಿಗಳು ಇರಬಹುದಾಗಿದೆ. ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅದರ ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗೊಳ್ಳಿಕೆಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗಾಗಿ ನಾವು ಜವಾಬ್ದಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->