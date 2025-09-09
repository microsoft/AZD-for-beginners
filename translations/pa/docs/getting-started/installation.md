<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-09T19:09:19+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "pa"
}
-->
# ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ ਗਾਈਡ

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ ਆਪਣੇ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI (azd) ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਦਿਖਾਏਗੀ। ਤੁਸੀਂ ਵੱਖ-ਵੱਖ ਓਪਰੇਟਿੰਗ ਸਿਸਟਮਾਂ ਲਈ ਇੰਸਟਾਲੇਸ਼ਨ ਦੇ ਤਰੀਕੇ, ਪ੍ਰਮਾਣਿਕਤਾ ਸੈਟਅਪ, ਅਤੇ ਸ਼ੁਰੂਆਤੀ ਕਨਫਿਗਰੇਸ਼ਨ ਬਾਰੇ ਸਿੱਖੋਗੇ ਤਾਂ ਜੋ ਆਪਣੇ ਵਿਕਾਸ ਦੇ ਮਾਹੌਲ ਨੂੰ Azure ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਤਿਆਰ ਕਰ ਸਕੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- ਆਪਣੇ ਓਪਰੇਟਿੰਗ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਇੰਸਟਾਲ ਕਰ ਸਕੋਗੇ
- ਵੱਖ-ਵੱਖ ਤਰੀਕਿਆਂ ਨਾਲ Azure ਨਾਲ ਪ੍ਰਮਾਣਿਕਤਾ ਸੈਟਅਪ ਕਰ ਸਕੋਗੇ
- ਆਪਣੇ ਵਿਕਾਸ ਦੇ ਮਾਹੌਲ ਨੂੰ ਜ਼ਰੂਰੀ ਪੂਰਕਾਂ ਨਾਲ ਸੈਟਅਪ ਕਰ ਸਕੋਗੇ
- ਵੱਖ-ਵੱਖ ਇੰਸਟਾਲੇਸ਼ਨ ਵਿਕਲਪਾਂ ਨੂੰ ਸਮਝ ਸਕੋਗੇ ਅਤੇ ਕਦੋਂ ਕਿਹੜਾ ਵਰਤਣਾ ਹੈ ਇਹ ਜਾਣ ਸਕੋਗੇ
- ਆਮ ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰ ਸਕੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਦੇ ਬਾਅਦ, ਤੁਸੀਂ:
- ਆਪਣੇ ਪਲੇਟਫਾਰਮ ਲਈ ਸਹੀ ਤਰੀਕੇ ਨਾਲ azd ਨੂੰ ਇੰਸਟਾਲ ਕਰ ਸਕੋਗੇ
- azd auth login ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਨਾਲ ਪ੍ਰਮਾਣਿਕਤਾ ਕਰ ਸਕੋਗੇ
- ਆਪਣੀ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰ ਸਕੋਗੇ ਅਤੇ azd ਦੇ ਬੁਨਿਆਦੀ ਕਮਾਂਡਾਂ ਦੀ ਜਾਂਚ ਕਰ ਸਕੋਗੇ
- azd ਦੀ ਵਧੀਆ ਵਰਤੋਂ ਲਈ ਆਪਣੇ ਵਿਕਾਸ ਦੇ ਮਾਹੌਲ ਨੂੰ ਕਨਫਿਗਰ ਕਰ ਸਕੋਗੇ
- ਆਮ ਇੰਸਟਾਲੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਖੁਦ ਹੱਲ ਕਰ ਸਕੋਗੇ

ਇਹ ਗਾਈਡ ਤੁਹਾਨੂੰ ਆਪਣੇ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰੇਗੀ, ਭਾਵੇਂ ਤੁਹਾਡਾ ਓਪਰੇਟਿੰਗ ਸਿਸਟਮ ਜਾਂ ਵਿਕਾਸ ਦਾ ਮਾਹੌਲ ਕੋਈ ਵੀ ਹੋਵੇ।

## ਪੂਰਵ ਸ਼ਰਤਾਂ

azd ਨੂੰ ਇੰਸਟਾਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਹਾਡੇ ਕੋਲ:
- **Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ** - [ਮੁਫ਼ਤ ਖਾਤਾ ਬਣਾਓ](https://azure.microsoft.com/free/)
- **Azure CLI** - ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਸਰੋਤ ਪ੍ਰਬੰਧਨ ਲਈ
- **Git** - ਟੈਂਪਲੇਟ ਕਲੋਨ ਕਰਨ ਅਤੇ ਵਰਜਨ ਕੰਟਰੋਲ ਲਈ
- **Docker** (ਵਿਕਲਪਿਕ) - ਕੰਟੇਨਰਾਈਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨ ਲਈ

## ਇੰਸਟਾਲੇਸ਼ਨ ਦੇ ਤਰੀਕੇ

### Windows

#### ਵਿਕਲਪ 1: PowerShell (ਸਿਫਾਰਸ਼ੀ)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ਵਿਕਲਪ 2: Windows ਪੈਕੇਜ ਮੈਨੇਜਰ (winget)
```cmd
winget install Microsoft.Azd
```

#### ਵਿਕਲਪ 3: Chocolatey
```cmd
choco install azd
```

#### ਵਿਕਲਪ 4: ਮੈਨੂਅਲ ਇੰਸਟਾਲੇਸ਼ਨ
1. [GitHub](https://github.com/Azure/azure-dev/releases) ਤੋਂ ਨਵਾਂ ਰਿਲੀਜ਼ ਡਾਊਨਲੋਡ ਕਰੋ
2. `C:\Program Files\azd\` ਵਿੱਚ ਐਕਸਟ੍ਰੈਕਟ ਕਰੋ
3. PATH ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ

### macOS

#### ਵਿਕਲਪ 1: Homebrew (ਸਿਫਾਰਸ਼ੀ)
```bash
brew tap azure/azd
brew install azd
```

#### ਵਿਕਲਪ 2: ਇੰਸਟਾਲ ਸਕ੍ਰਿਪਟ
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ਵਿਕਲਪ 3: ਮੈਨੂਅਲ ਇੰਸਟਾਲੇਸ਼ਨ
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### ਵਿਕਲਪ 1: ਇੰਸਟਾਲ ਸਕ੍ਰਿਪਟ (ਸਿਫਾਰਸ਼ੀ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ਵਿਕਲਪ 2: ਪੈਕੇਜ ਮੈਨੇਜਰ

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

azd GitHub Codespaces ਵਿੱਚ ਪਹਿਲਾਂ ਤੋਂ ਇੰਸਟਾਲ ਹੁੰਦਾ ਹੈ। ਸਿਰਫ਼ ਇੱਕ ਕੋਡਸਪੇਸ ਬਣਾਓ ਅਤੇ azd ਦੀ ਤੁਰੰਤ ਵਰਤੋਂ ਸ਼ੁਰੂ ਕਰੋ।

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ

ਇੰਸਟਾਲੇਸ਼ਨ ਦੇ ਬਾਅਦ, ਯਕੀਨੀ ਬਣਾਓ ਕਿ azd ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਕੰਮ ਕਰ ਰਿਹਾ ਹੈ:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

ਉਮੀਦਵਾਰ ਨਤੀਜਾ:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 ਪ੍ਰਮਾਣਿਕਤਾ ਸੈਟਅਪ

### Azure CLI ਪ੍ਰਮਾਣਿਕਤਾ (ਸਿਫਾਰਸ਼ੀ)
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

### ਡਿਵਾਈਸ ਕੋਡ ਪ੍ਰਮਾਣਿਕਤਾ
ਜੇਕਰ ਤੁਸੀਂ ਹੈਡਲੈੱਸ ਸਿਸਟਮ 'ਤੇ ਹੋ ਜਾਂ ਬ੍ਰਾਊਜ਼ਰ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਕਰ ਰਹੇ ਹੋ:
```bash
az login --use-device-code
```

### ਸਰਵਿਸ ਪ੍ਰਿੰਸਿਪਲ (CI/CD)
ਆਟੋਮੈਟਿਕ ਮਾਹੌਲਾਂ ਲਈ:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ ਕਨਫਿਗਰੇਸ਼ਨ

### ਗਲੋਬਲ ਕਨਫਿਗਰੇਸ਼ਨ
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ
ਆਪਣੇ ਸ਼ੈਲ ਪ੍ਰੋਫਾਈਲ (`.bashrc`, `.zshrc`, `.profile`) ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ:
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 IDE ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### Visual Studio Code
Azure Developer CLI ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ:
1. VS Code ਖੋਲ੍ਹੋ
2. ਐਕਸਟੈਂਸ਼ਨ (Ctrl+Shift+X) 'ਤੇ ਜਾਓ
3. "Azure Developer CLI" ਖੋਜੋ
4. ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ

ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ:
- azure.yaml ਲਈ IntelliSense
- ਇੰਟੀਗ੍ਰੇਟਡ ਟਰਮੀਨਲ ਕਮਾਂਡ
- ਟੈਂਪਲੇਟ ਬ੍ਰਾਊਜ਼ਿੰਗ
- ਡਿਪਲੌਇਮੈਂਟ ਮਾਨੀਟਰਿੰਗ

### GitHub Codespaces
`.devcontainer/devcontainer.json` ਬਣਾਓ:
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
1. Azure ਪਲੱਗਇਨ ਇੰਸਟਾਲ ਕਰੋ
2. Azure ਪ੍ਰਮਾਣਿਕਤਾ ਕਨਫਿਗਰ ਕਰੋ
3. azd ਕਮਾਂਡਾਂ ਲਈ ਇੰਟੀਗ੍ਰੇਟਡ ਟਰਮੀਨਲ ਦੀ ਵਰਤੋਂ ਕਰੋ

## 🐛 ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ

### ਆਮ ਸਮੱਸਿਆਵਾਂ

#### ਪਰਮਿਸ਼ਨ ਡਿਨਾਇਡ (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ਸਮੱਸਿਆਵਾਂ
azd ਨੂੰ ਆਪਣੇ PATH ਵਿੱਚ ਮੈਨੂਅਲ ਤੌਰ 'ਤੇ ਸ਼ਾਮਲ ਕਰੋ:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### ਨੈਟਵਰਕ/ਪ੍ਰੌਕਸੀ ਸਮੱਸਿਆਵਾਂ
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### ਵਰਜਨ ਕਨਫਲਿਕਟ
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### ਹੋਰ ਮਦਦ ਪ੍ਰਾਪਤ ਕਰਨਾ
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd ਨੂੰ ਅਪਡੇਟ ਕਰਨਾ

### ਆਟੋਮੈਟਿਕ ਅਪਡੇਟ
azd ਤੁਹਾਨੂੰ ਅਪਡੇਟ ਉਪਲਬਧ ਹੋਣ 'ਤੇ ਸੂਚਿਤ ਕਰੇਗਾ:
```bash
azd version --check-for-updates
```

### ਮੈਨੂਅਲ ਅਪਡੇਟ

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

## ਅਗਲੇ ਕਦਮ

1. **ਪ੍ਰਮਾਣਿਕਤਾ ਪੂਰੀ ਕਰੋ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਸੀਂ ਆਪਣੇ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਤੱਕ ਪਹੁੰਚ ਸਕਦੇ ਹੋ
2. **ਆਪਣਾ ਪਹਿਲਾ ਡਿਪਲੌਇਮੈਂਟ ਅਜ਼ਮਾਓ**: [ਪਹਿਲੇ ਪ੍ਰੋਜੈਕਟ ਦੀ ਗਾਈਡ](first-project.md) ਦੀ ਪਾਲਣਾ ਕਰੋ
3. **ਟੈਂਪਲੇਟ ਖੋਜੋ**: `azd template list` ਨਾਲ ਉਪਲਬਧ ਟੈਂਪਲੇਟ ਬ੍ਰਾਊਜ਼ ਕਰੋ
4. **ਆਪਣਾ IDE ਕਨਫਿਗਰ ਕਰੋ**: ਆਪਣੇ ਵਿਕਾਸ ਦੇ ਮਾਹੌਲ ਨੂੰ ਸੈਟਅਪ ਕਰੋ

## ਸਹਾਇਤਾ

ਜੇਕਰ ਤੁਹਾਨੂੰ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਕਰਨਾ ਪਏ:
- [ਆਧਿਕਾਰਿਕ ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ਸਮੱਸਿਆਵਾਂ ਦੀ ਰਿਪੋਰਟ ਕਰੋ](https://github.com/Azure/azure-dev/issues)
- [ਕਮਿਊਨਿਟੀ ਚਰਚਾ](https://github.com/Azure/azure-dev/discussions)
- [Azure ਸਹਾਇਤਾ](https://azure.microsoft.com/support/)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [AZD ਬੇਸਿਕਸ](azd-basics.md)
- **ਅਗਲਾ ਪਾਠ**: [ਕਨਫਿਗਰੇਸ਼ਨ](configuration.md)

**ਇੰਸਟਾਲੇਸ਼ਨ ਪੂਰੀ!** [ਆਪਣਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) 'ਤੇ ਜਾਓ ਅਤੇ azd ਨਾਲ ਬਣਾਉਣਾ ਸ਼ੁਰੂ ਕਰੋ।

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚੀਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।