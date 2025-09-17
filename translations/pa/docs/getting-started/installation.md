<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-17T20:59:34+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "pa"
}
-->
# ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ ਗਾਈਡ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਸ਼ੁਰੂਆਤੀ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [AZD ਬੁਨਿਆਦੀਆਂ](azd-basics.md)
- **➡️ ਅਗਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../ai-foundry/azure-ai-foundry-integration.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ ਆਪਣੇ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI (azd) ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਦਿਖਾਏਗੀ। ਤੁਸੀਂ ਵੱਖ-ਵੱਖ ਓਪਰੇਟਿੰਗ ਸਿਸਟਮਾਂ ਲਈ ਕਈ ਇੰਸਟਾਲੇਸ਼ਨ ਵਿਧੀਆਂ, ਪ੍ਰਮਾਣਿਕਤਾ ਸੈਟਅਪ, ਅਤੇ ਸ਼ੁਰੂਆਤੀ ਕਨਫਿਗਰੇਸ਼ਨ ਸਿੱਖੋਗੇ ਤਾਂ ਜੋ Azure ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਆਪਣਾ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਤਿਆਰ ਕਰ ਸਕੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- ਆਪਣੇ ਓਪਰੇਟਿੰਗ ਸਿਸਟਮ 'ਤੇ ਸਫਲਤਾਪੂਰਵਕ Azure Developer CLI ਇੰਸਟਾਲ ਕਰ ਸਕੋਗੇ
- ਵੱਖ-ਵੱਖ ਵਿਧੀਆਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਨਾਲ ਪ੍ਰਮਾਣਿਕਤਾ ਕਨਫਿਗਰ ਕਰੋ
- ਜ਼ਰੂਰੀ ਪੂਰਕਾਂ ਨਾਲ ਆਪਣਾ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਕਰੋ
- ਵੱਖ-ਵੱਖ ਇੰਸਟਾਲੇਸ਼ਨ ਵਿਕਲਪਾਂ ਨੂੰ ਸਮਝੋ ਅਤੇ ਕਦੋਂ ਕਿਸੇ ਨੂੰ ਵਰਤਣਾ ਹੈ
- ਆਮ ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ:
- ਆਪਣੇ ਪਲੇਟਫਾਰਮ ਲਈ ਉਚਿਤ ਵਿਧੀ ਦੀ ਵਰਤੋਂ ਕਰਕੇ azd ਇੰਸਟਾਲ ਕਰ ਸਕੋਗੇ
- azd auth login ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਨਾਲ ਪ੍ਰਮਾਣਿਕਤਾ ਕਰੋ
- ਆਪਣੀ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ ਅਤੇ azd ਦੇ ਬੁਨਿਆਦੀ ਕਮਾਂਡਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
- azd ਦੀ ਵਧੀਆ ਵਰਤੋਂ ਲਈ ਆਪਣਾ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਕਨਫਿਗਰ ਕਰੋ
- ਆਮ ਇੰਸਟਾਲੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਖੁਦ ਹੱਲ ਕਰੋ

ਇਹ ਗਾਈਡ ਤੁਹਾਨੂੰ ਆਪਣੇ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰੇਗੀ, ਚਾਹੇ ਤੁਹਾਡਾ ਓਪਰੇਟਿੰਗ ਸਿਸਟਮ ਜਾਂ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਕੋਈ ਵੀ ਹੋਵੇ।

## ਪੂਰਵ ਸ਼ਰਤਾਂ

azd ਇੰਸਟਾਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਹਾਡੇ ਕੋਲ:
- **Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ** - [ਮੁਫ਼ਤ ਖਾਤਾ ਬਣਾਓ](https://azure.microsoft.com/free/)
- **Azure CLI** - ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਸਰੋਤ ਪ੍ਰਬੰਧਨ ਲਈ
- **Git** - ਟੈਂਪਲੇਟ ਕਲੋਨ ਕਰਨ ਅਤੇ ਵਰਜਨ ਕੰਟਰੋਲ ਲਈ
- **Docker** (ਵਿਕਲਪਿਕ) - ਕੰਟੇਨਰਾਈਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨ ਲਈ

## ਇੰਸਟਾਲੇਸ਼ਨ ਵਿਧੀਆਂ

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
3. PATH ਵਾਤਾਵਰਣ ਚਰ ਨੂੰ ਸ਼ਾਮਲ ਕਰੋ

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

## ✅ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

ਇੰਸਟਾਲੇਸ਼ਨ ਤੋਂ ਬਾਅਦ, ਯਕੀਨੀ ਬਣਾਓ ਕਿ azd ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਕੰਮ ਕਰ ਰਿਹਾ ਹੈ:

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

## ਪ੍ਰਮਾਣਿਕਤਾ ਸੈਟਅਪ

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
ਜੇਕਰ ਤੁਸੀਂ ਇੱਕ headless ਸਿਸਟਮ 'ਤੇ ਹੋ ਜਾਂ ਬ੍ਰਾਊਜ਼ਰ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਕਰ ਰਹੇ ਹੋ:
```bash
az login --use-device-code
```

### ਸੇਵਾ ਪ੍ਰਿੰਸਿਪਲ (CI/CD)
ਆਟੋਮੈਟਿਕ ਵਾਤਾਵਰਣਾਂ ਲਈ:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## ਕਨਫਿਗਰੇਸ਼ਨ

### ਗਲੋਬਲ ਕਨਫਿਗਰੇਸ਼ਨ
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### ਵਾਤਾਵਰਣ ਚਰ
ਆਪਣੇ ਸ਼ੈਲ ਪ੍ਰੋਫਾਈਲ (`.bashrc`, `.zshrc`, `.profile`) ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ:
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE ਇੰਟੀਗ੍ਰੇਸ਼ਨ

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

## 🐛 ਇੰਸਟਾਲੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਦਾ ਨਿਪਟਾਰਾ

### ਆਮ ਸਮੱਸਿਆਵਾਂ

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ਸਮੱਸਿਆਵਾਂ
azd ਨੂੰ ਆਪਣੇ PATH ਵਿੱਚ ਮੈਨੂਅਲ ਤਰੀਕੇ ਨਾਲ ਸ਼ਾਮਲ ਕਰੋ:

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

#### ਵਰਜਨ ਸੰਘਰਸ਼
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

1. **ਪ੍ਰਮਾਣਿਕਤਾ ਪੂਰੀ ਕਰੋ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਸੀਂ ਆਪਣੀ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਤੱਕ ਪਹੁੰਚ ਸਕਦੇ ਹੋ
2. **ਪਹਿਲਾ ਡਿਪਲੌਇਮੈਂਟ ਅਜ਼ਮਾਓ**: [ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ ਗਾਈਡ](first-project.md) ਦੀ ਪਾਲਣਾ ਕਰੋ
3. **ਟੈਂਪਲੇਟ ਖੋਜੋ**: `azd template list` ਨਾਲ ਉਪਲਬਧ ਟੈਂਪਲੇਟਾਂ ਨੂੰ ਬ੍ਰਾਊਜ਼ ਕਰੋ
4. **ਆਪਣਾ IDE ਕਨਫਿਗਰ ਕਰੋ**: ਆਪਣਾ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਕਰੋ

## ਸਹਾਇਤਾ

ਜੇਕਰ ਤੁਸੀਂ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਕਰਦੇ ਹੋ:
- [ਅਧਿਕਾਰਤ ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ਸਮੱਸਿਆਵਾਂ ਦੀ ਰਿਪੋਰਟ ਕਰੋ](https://github.com/Azure/azure-dev/issues)
- [ਕਮਿਊਨਿਟੀ ਚਰਚਾ](https://github.com/Azure/azure-dev/discussions)
- [Azure ਸਹਾਇਤਾ](https://azure.microsoft.com/support/)

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਸ਼ੁਰੂਆਤੀ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲਾ**: [AZD ਬੁਨਿਆਦੀਆਂ](azd-basics.md) 
- **➡️ ਅਗਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../ai-foundry/azure-ai-foundry-integration.md)

**✅ ਇੰਸਟਾਲੇਸ਼ਨ ਪੂਰੀ!** [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) 'ਤੇ ਜਾਰੀ ਰੱਖੋ ਤਾਂ ਜੋ azd ਨਾਲ ਬਣਾਉਣਾ ਸ਼ੁਰੂ ਕੀਤਾ ਜਾ ਸਕੇ।

---

**ਅਸਵੀਕਾਰਨਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼, ਜੋ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੈ, ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।