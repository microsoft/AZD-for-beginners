# ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ ਗਾਈਡ

**ਛੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਬਿਗਿਨਰਜ਼](../../README.md)
- **📖 ਮੌਜੂਦਾ ਛੈਪਟਰ**: ਛੈਪਟਰ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲੇ**: [AZD ਬੇਸਿਕਸ](azd-basics.md)
- **➡️ ਅਗਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **🚀 ਅਗਲਾ ਛੈਪਟਰ**: [ਛੈਪਟਰ 2: ਏਆਈ-ਪਹਿਲਾ ਵਿਕਾਸ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ਜਾਣਪਛਾਣ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ ਤੁਹਾਡੇ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI (azd) ਇੰਸਟਾਲ ਅਤੇ ਸੰਰਚਿਤ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਵਿੱਚ ਰਾਹ ਦਿਖਾਏਗੀ। ਤੁਸੀਂ ਵੱਖ-ਵੱਖ ਆਪਰੇਟਿੰਗ ਸਿਸਟਮਾਂ ਲਈ ਕਈ ਇੰਸਟਾਲੇਸ਼ਨ ਤਰੀਕੇ, ਪ੍ਰਮਾਣੀਕਰਨ ਸੈਟਅਪ, ਅਤੇ ਪਹਿਲੀ ਸੰਰਚਨਾ ਸਿੱਖੋਗੇ ਤਾਂ ਜੋ ਤੁਸੀਂ ਆਪਣੇ ਵਿਕਾਸੀ ਵਾਤਾਵਰਣ ਨੂੰ Azure ਡਿਪਲੋਇਮੈਂਟਾਂ ਲਈ ਤਿਆਰ ਕਰ ਸਕੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- ਆਪਣੇ ਆਪਰੇਟਿੰਗ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI ਸਫਲਤਾਪੂਰਵਕ ਇੰਸਟਾਲ ਕਰਨਾ ਸਿੱਖੋਗੇ
- ਕਈ ਤਰੀਕਿਆਂ ਨਾਲ Azure ਦੇ ਨਾਲ ਪ੍ਰਮਾਣੀਕਰਨ ਸੰਰਚਿਤ ਕਰਨਾ
- ਲਾਜਮੀ ਪ੍ਰੀ-ਰਿਕਵਾਇਰਮੈਂਟਸ ਨਾਲ ਆਪਣਾ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਕਰਨਾ
- ਵੱਖ-ਵੱਖ ਇੰਸਟਾਲੇਸ਼ਨ ਵਿਕਲਪਾਂ ਨੂੰ ਸਮਝਣਾ ਅਤੇ ਕਿਸ ਸਮੇਂ ਕਿਹੜਾ ਉਪਯੋਗ ਕਰਨਾ ਹੈ
- ਆਮ ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਮਾਧਾਨ ਕਰਨਾ

## ਸਿੱਖਣ ਦੀਆਂ ਉਪਲਬਧੀਆਂ

ਇਸ ਪਾਠ ਨੂੰ ਮੁਕੰਮਲ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਆਪਣੇ ਪਲੇਟਫਾਰਮ ਲਈ ਉਚਿਤ ਤਰੀਕੇ ਨਾਲ azd ਇੰਸਟਾਲ ਕਰਨਾ
- azd auth login ਨਾਲ Azure ਨਾਲ ਪ੍ਰਮਾਣੀਕਰਨ ਕਰਨਾ
- ਆਪਣੀ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਅਤੇ ਬੁਨਿਆਦੀ azd ਕਮਾਂਡਾਂ ਦੀ ਟੈਸਟਿੰਗ ਕਰਨਾ
- azd ਦੀ最佳 ਵਰਤੋਂ ਲਈ ਆਪਣਾ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਸੰਰਚਿਤ ਕਰਨਾ
- ਆਮ ਇੰਸਟਾਲੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਹੱਲ ਕਰਨਾ

ਇਹ ਗਾਈਡ ਤੁਹਾਨੂੰ ਤੁਹਾਡੇ آپਰੇਟਿੰਗ ਸਿਸਟਮ ਜਾਂ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਦੀ ਪਰਵਾਹ ਕੀਤੇ ਬਿਨਾਂ Azure Developer CLI ਇੰਸਟਾਲ ਅਤੇ ਸੰਰਚਿਤ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰੇਗੀ।

## ਲੋੜੀਂਦੀਆਂ ਸ਼ਰਤਾਂ

azd ਇੰਸਟਾਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਯਕੀਨੀ ਬਣਾਵੋ ਕਿ ਤੁਹਾਡੇ ਕੋਲ ਹੈ:
- **Azure subscription** - [ਮੁਫ਼ਤ ਅਕਾਉਂਟ ਬਣਾਓ](https://azure.microsoft.com/free/)
- **Azure CLI** - ਪ੍ਰਮਾਣੀਕਰਨ ਅਤੇ ਸਰੋਤ ਪ੍ਰਬੰਧਨ ਲਈ
- **Git** - ਟੈਂਪਲੇਟ ਕਲੋਨ ਕਰਨ ਅਤੇ ਵਰਜਨ ਕੰਟਰੋਲ ਲਈ
- **Docker** (ਵਿਕਲਪਕ) - ਕੰਟੇਨਰਾਈਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ

## ਇੰਸਟਾਲੇਸ਼ਨ ਦੇ ਤਰੀਕੇ

### Windows

#### ਵਿਕਲਪ 1: PowerShell (ਸਿਫਾਰਸ਼ੀ)
```powershell
# ਐਡਮਿਨਿਸਟਰੇਟਰ ਵਜੋਂ ਜਾਂ ਉੱਚ ਅਧਿਕਾਰਾਂ ਨਾਲ ਚਲਾਓ
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
1. ਨਵੀਂਤਮ ਰਿਲੀਜ਼ ਨੂੰ [GitHub](https://github.com/Azure/azure-dev/releases) ਤੋਂ ਡਾਊਨਲੋਡ ਕਰੋ
2. `C:\Program Files\azd\` ਵਿੱਚ ਐਕਸਟ੍ਰੈਕਟ ਕਰੋ
3. PATH ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ

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
# ਡਾਊਨਲੋਡ ਅਤੇ ਇੰਸਟਾਲ ਕਰੋ
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
# Microsoft ਪੈਕੇਜ ਰਿਪੋਜ਼ਟਰੀ ਸ਼ਾਮِل ਕਰੋ
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ਇੰਸਟਾਲ ਕਰੋ
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# ਮਾਈਕ੍ਰੋਸੌਫਟ ਪੈਕੇਜ ਰਿਪੋਜ਼ਟਰੀ ਸ਼ਾਮਿਲ ਕਰੋ
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd ਪਹਿਲਾਂ ਤੋਂ GitHub Codespaces ਵਿੱਚ ਇੰਸਟਾਲ ਹੁੰਦਾ ਹੈ। ਸਿਰਫ਼ ਇੱਕ codespace ਬਣਾਓ ਅਤੇ ਤੁਰੰਤ azd ਵਰਤਣਾ ਸ਼ੁਰੂ ਕਰੋ।

### Docker

```bash
# azd ਨੂੰ ਇੱਕ ਕੰਟੇਨਰ ਵਿੱਚ ਚਲਾਓ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# ਸੌਖੀ ਵਰਤੋਂ ਲਈ ਇੱਕ ਅਲਿਆਸ ਬਣਾਓ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ

ਇੰਸਟਾਲੇਸ਼ਨ ਤੋਂ ਬਾਅਦ, azd ਦੀ ਸਹੀ ਕਾਰਗੁਜ਼ਾਰੀ ਦੀ ਜਾਂਚ ਕਰੋ:

```bash
# ਵਰਜ਼ਨ ਜਾਂਚੋ
azd version

# ਸਹਾਇਤਾ ਵੇਖੋ
azd --help

# ਉਪਲਬਧ ਟੈਮਪਲੇਟਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd template list
```

ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ:
```
azd version 1.x.x (commit xxxxxx)
```

**ਨੋਟ**: ਅਸਲ ਵਰਜਨ ਨੰਬਰ ਵੱਖਰਾ ਹੋ ਸਕਦਾ ਹੈ। ਨਵੀਂਤਮ ਵਰਜਨ ਲਈ ਵੇਰਵਾ ਦੇਖੋ: [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases)।

**✅ ਇੰਸਟਾਲੇਸ਼ਨ ਸਫਲਤਾ ਚੈੱਕਲਿਸਟ:**
- [ ] `azd version` ਗਲਤੀਆਂ ਤੋਂ ਬਿਨਾਂ ਵਰਜਨ ਨੰਬਰ ਦਿਖਾਂਦਾ ਹੈ
- [ ] `azd --help` ਕਮਾਂਡ ਦਸਤਾਵੇਜ਼ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] `azd template list` ਉਪਲਬਧ ਟੈਂਪਲੇਟ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] `az account show` ਤੁਹਾਡੀ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] ਤੁਸੀਂ ਇੱਕ ਟੈਸਟ ਡਾਇਰੈਕਟਰੀ ਬਣਾਕੇ `azd init` ਸਫਲਤਾਪੂਰਵਕ ਚਲਾ ਸਕਦੇ ਹੋ

**ਜੇ ਸਾਰੇ ਚੈਕ ਪਾਸ ਹੋ ਜਾਂਦੇ ਹਨ, ਤਾਂ ਤੁਸੀਂ [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) ਵੱਲ ਅੱਗੇ ਵਧਣ ਲਈ ਤਿਆਰ ਹੋ!**

## ਪ੍ਰਮਾਣੀਕਰਨ ਸੈਟਅਪ

### Azure CLI ਪ੍ਰਮਾਣੀਕਰਨ (ਸਿਫਾਰਸ਼ੀ)
```bash
# ਜੇ ਪਹਿਲਾਂ ਹੀ ਇੰਸਟਾਲ ਨਾ ਕੀਤਾ ਗਿਆ ਹੋਵੇ ਤਾਂ Azure CLI ਇੰਸਟਾਲ ਕਰੋ
# ਵਿੰਡੋਜ਼: winget install Microsoft.AzureCLI
# ਮੈਕਓਐਸ: brew install azure-cli
# ਲਿਨਕਸ: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ
az login

# ਪ੍ਰਮਾਣੀਕਰਨ ਦੀ ਜਾਂਚ ਕਰੋ
az account show
```

### ਡਿਵਾਈਸ ਕੋਡ ਪ੍ਰਮਾਣੀਕਰਨ
ਜੇ ਤੁਸੀਂ headless ਸਿਸਟਮ 'ਤੇ ਹੋ ਜਾਂ ਬ੍ਰਾਉਜ਼ਰ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਕਰ ਰਹੇ ਹੋ:
```bash
az login --use-device-code
```

### ਸਰਵਿਸ ਪ੍ਰਿੰਸੀਪਲ (CI/CD)
ਆਟੋਮੇਟਡ ਵਾਤਾਵਰਣਾਂ ਲਈ:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## ਸੰਰਚਨਾ

### ਗਲੋਬਲ ਸੰਰਚਨਾ
```bash
# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.subscription <subscription-id>

# ਡਿਫਾਲਟ ਸਥਾਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.location eastus2

# ਸਭ ਕੰਫਿਗਰੇਸ਼ਨ ਵੇਖੋ
azd config list
```

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
ਆਪਣੇ ਸ਼ੈੱਲ ਪ੍ਰੋਫਾਈਲ (`.bashrc`, `.zshrc`, `.profile`) ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ:
```bash
# Azure ਸੰਰਚਨਾ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ਸੰਰਚਨਾ
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ਡਿਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ
```

## IDE ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### Visual Studio Code
Azure Developer CLI ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ:
1. VS Code ਖੋਲ੍ਹੋ
2. ਐਕਸਟੈਂਸ਼ਨਜ਼ (Ctrl+Shift+X) 'ਤੇ ਜਾਓ
3. "Azure Developer CLI" ਲਈ ਖੋਜ ਕਰੋ
4. ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ

ਫੀਚਰ:
- azure.yaml ਲਈ IntelliSense
- ਇੰਟੀਗਰੇਟਿਡ ਟਰਮੀਨਲ ਕਮਾਂਡਜ਼
- ਟੈਂਪਲੇਟ ਬ੍ਰਾਉਜ਼ਿੰਗ
- ਡਿਪਲੋਇਮੈਂਟ ਮਾਨੀਟਰਨਿੰਗ

### GitHub Codespaces
ਇੱਕ `.devcontainer/devcontainer.json` ਬਣਾਓ:
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
2. Azure ਪ੍ਰਮਾਣਪੱਤਰ ਸੰਰਚਿਤ ਕਰੋ
3. azd ਕਮਾਂਡਾਂ ਲਈ ਇੰਟੀਗਰੇਟਿਡ ਟਰਮੀਨਲ ਵਰਤੋਂ

## 🐛 ਇੰਸਟਾਲੇਸ਼ਨ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ

### ਆਮ ਸਮੱਸਿਆਵਾਂ

#### ਅਨੁਮਤੀ ਨਕਾਰ (Windows)
```powershell
# PowerShell ਨੂੰ ਐਡਮਿਨਿਸਟ੍ਰੇਟਰ ਵਜੋਂ ਚਲਾਓ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ਸਮੱਸਿਆਵਾਂ
ਹੱਥੋਂ-ਹੱਥ azd ਨੂੰ ਆਪਣੇ PATH ਵਿੱਚ ਜੋੜੋ:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### ਨੈੱਟਵਰਕ/ਪ੍ਰਾਕਸੀ ਸਮੱਸਿਆਵਾਂ
```bash
# ਪ੍ਰਾਕਸੀ ਦੀ ਸੰਰਚਨਾ ਕਰੋ
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL ਵੈਰੀਫਿਕੇਸ਼ਨ ਨੂੰ ਛੱਡੋ (ਉਤਪਾਦਨ ਲਈ ਸਿਫਾਰਸ਼ ਨਹੀਂ ਕੀਤੀ ਜਾਂਦੀ)
azd config set http.insecure true
```

#### ਵਰਜਨ ਟਕਰਾਅ
```bash
# ਪੁਰਾਣੀਆਂ ਇੰਸਟਾਲੇਸ਼ਨਾਂ ਨੂੰ ਹਟਾਓ
# ਵਿੰਡੋਜ਼: winget uninstall Microsoft.Azd
# ਮੈਕਓਐਸ: brew uninstall azd
# ਲਿਨਕਸ: sudo apt remove azd

# ਕੰਫਿਗਰੇਸ਼ਨ ਸਾਫ਼ ਕਰੋ
rm -rf ~/.azd
```

### ਹੋਰ ਮਦਦ ਪ੍ਰਾਪਤ ਕਰਨਾ
```bash
# ਡੀਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd <command> --debug

# ਮੌਜੂਦਾ ਕੰਫਿਗਰੇਸ਼ਨ ਵੇਖੋ
azd config list

# ਮੌਜੂਦਾ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਵੇਖੋ
azd show
```

## azd ਨੂੰ ਅਪਡੇਟ ਕਰਨਾ

### ਆਟੋਮੈਟਿਕ ਅਪਡੇਟਸ
azd ਤੁਹਾਨੂੰ ਅੱਪਡੇਟ ਉਪਲਬਧ ਹੋਣ 'ਤੇ ਸੂਚਿਤ ਕਰੇਗਾ:
```bash
azd version --check-for-updates
```

### ਮੈਨੁਅਲ ਅਪਡੇਟਸ

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

## 💡 ਅਕਸਰ ਪੁੱਛੇ ਜਾਂਦੇ ਪ੍ਰਸ਼ਨ

<details>
<summary><strong>azd ਅਤੇ az CLI ਵਿੱਚ ਕੀ ਫ਼ਰਕ ਹੈ?</strong></summary>

**Azure CLI (az)**: ਇਕ ਨੀਵੀਂ-ਸਤਰ ਦਾ ਟੂਲ ਜੋ ਵਿਅਕਤੀਗਤ Azure ਸਰੋਤਾਂ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ
- `az webapp create`, `az storage account create`
- ਇੱਕ ਵਾਰੀ ਇੱਕ ਸਰੋਤ
- ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰਬੰਧਨ 'ਤੇ ਕੇਂਦ੍ਰਿਤ

**Azure Developer CLI (azd)**: ਪੂਰੀ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਉੱਚ-ਸਤਰ ਟੂਲ
- `azd up` ਸਾਰਾ ਐਪ ਅਤੇ ਸਾਰੇ ਸਰੋਤ ਡਿਪਲੋਇ ਕਰਦਾ ਹੈ
- ਟੈਂਪਲੇਟ-ਆਧਾਰਤ ਵਰਕਫਲੋਜ਼
- ਵਿਕਾਸਕਾਰ ਦੀ ਉਤਪਾਦਕਤਾ 'ਤੇ ਧਿਆਨ

**ਤੁਹਾਨੂੰ ਦੋਵਾਂ ਦੀ ਲੋੜ ਹੈ**: azd ਪ੍ਰਮਾਣੀਕਰਨ ਲਈ az CLI ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ
</details>

<details>
<summary><strong>ਕੀ ਮੈਂ ਮੌਜੂਦਾ Azure ਸਰੋਤਾਂ ਨਾਲ azd ਵਰਤ ਸਕਦਾ ਹਾਂ?</strong></summary>

ਹਾਂ! ਤੁਸੀਂ ਕਰ ਸਕਦੇ ਹੋ:
1. ਮੌਜੂਦਾ ਸਰੋਤਾਂ ਨੂੰ azd ਵਾਤਾਵਰਣ ਵਿੱਚ ਇੰਪੋਰਟ ਕਰੋ
2. ਆਪਣੇ Bicep ਟੈਂਪਲੇਟਾਂ ਵਿੱਚ ਮੌਜੂਦਾ ਸਰੋਤਾਂ ਦਾ ਸੰਦਰਭ ਲਓ
3. ਮੌਜੂਦਾ ਇੰਫਰਾਸਟਰਕਚਰ ਦੇ ਨਾਲ-ਨਾਲ ਨਵੀਆਂ ਡਿਪਲੋਇਮੈਂਟਾਂ ਲਈ azd ਵਰਤੋ

ਵੇਰਵਾ ਲਈ [ਸੰਰਚਨਾ ਗਾਈਡ](configuration.md) ਵੇਖੋ।
</details>

<details>
<summary><strong>ਕੀ azd Azure Government ਜਾਂ Azure China ਨਾਲ ਕੰਮ ਕਰਦਾ ਹੈ?</strong></summary>

ਹਾਂ, ਕਲਾਉਡ ਸੰਰਚਨਾ ਕਰੋ:
```bash
# Azure ਸਰਕਾਰ
az cloud set --name AzureUSGovernment
az login

# Azure ਚੀਨ
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>ਕੀ ਮੈਂ CI/CD ਪਾਈਪਲਾਈਨਾਂ ਵਿੱਚ azd ਵਰਤ ਸਕਦਾ ਹਾਂ?</strong></summary>

ਬਿਲਕੁਲ! azd ਆਟੋਮੇਸ਼ਨ ਲਈ ਡਿਜ਼ਾਇਨ ਕੀਤਾ ਗਿਆ ਹੈ:
- GitHub Actions ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- Azure DevOps ਸਪੋਰਟ
- ਸਰਵਿਸ ਪ੍ਰਿੰਸੀਪਲ ਪ੍ਰਮਾਣੀਕਰਨ
- ਗੈਰ-ਇੰਟਰਐਕਟਿਵ ਮੋਡ

CI/CD ਨਮੂਨਿਆਂ ਲਈ [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md) ਵੇਖੋ।
</details>

<details>
<summary><strong>azd ਵਰਤਣ ਦਾ ਖਰਚਾ ਕਿੰਨਾ ਹੈ?</strong></summary>

azd ਖ਼ੁਦ **ਪੂਰੀ ਤਰ੍ਹਾਂ ਮੁਫ਼ਤ** ਅਤੇ ਖੁੱਲਾ ਸੌਰਸ ਹੈ। ਤੁਸੀਂ ਸਿਰਫ਼ ਇਹਨਾਂ ਲਈ ਭੁਗਤਾਨ ਕਰਦੇ ਹੋ:
- ਉਹ Azure ਸਰੋਤ ਜੋ ਤੁਸੀਂ ਡਿਪਲੋਇ ਕਰਦੇ ਹੋ
- Azure ਖਪਤ ਖਰਚੇ (ਕੰਪਿਊਟ, ਸਟੋਰੇਜ ਆਦਿ)

ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਲਗਤ ਦਾ ਅੰਦਾਜ਼ਾ ਲਗਾਉਣ ਲਈ `azd provision --preview` ਵਰਤੋ।
</details>

## ਅਗਲੇ ਕਦਮ

1. **ਪ੍ਰਮਾਣੀਕਰਨ ਪੂਰਾ ਕਰੋ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਸੀਂ ਆਪਣੀ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਤੱਕ ਪਹੁੰਚ ਕਰ ਸਕਦੇ ਹੋ
2. **ਆਪਣਾ ਪਹਿਲਾ ਡਿਪਲੋਇਮੈਂਟ آزਮਾਓ**: [First Project Guide](first-project.md) ਦੀ ਪਾਲਨਾ ਕਰੋ
3. **ਟੈਂਪਲੇਟ ਸਮੂਹੀ ਖੋਜੋ**: `azd template list` ਨਾਲ ਉਪਲਬਧ ਟੈਂਪਲੇਟ ਵੇਖੋ
4. **ਆਪਣੇ IDE ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ**: ਆਪਣਾ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਕਰੋ

## ਸਹਾਇਤਾ

ਜੇ ਤੁਹਾਨੂੰ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਹੋਵੇ:
- [ਆਧਿਕਾਰਿਕ ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ਮਸਲੇ ਰਿਪੋਰਟ ਕਰੋ](https://github.com/Azure/azure-dev/issues)
- [ਕਮਿਊਨਿਟੀ ਚਰਚਾ](https://github.com/Azure/azure-dev/discussions)
- [Azure ਸਹਾਇਤਾ](https://azure.microsoft.com/support/)

---

**ਛੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਬਿਗਿਨਰਜ਼](../../README.md)
- **📖 ਮੌਜੂਦਾ ਛੈਪਟਰ**: ਛੈਪਟਰ 1 - ਬੁਨਿਆਦ ਅਤੇ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਿਛਲੇ**: [AZD ਬੇਸਿਕਸ](azd-basics.md) 
- **➡️ ਅਗਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **🚀 ਅਗਲਾ ਛੈਪਟਰ**: [ਛੈਪਟਰ 2: ਏਆਈ-ਪਹਿਲਾ ਵਿਕਾਸ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ਇੰਸਟਾਲੇਸ਼ਨ ਪੂਰਾ ਹੋ गया!** azd ਨਾਲ ਬਿਲਡਿੰਗ ਸ਼ੁਰੂ ਕਰਨ ਲਈ [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) ਵੱਲ ਚੱਲੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਚੇਤਾਵਨੀ:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਂ ਸੰਵੇਦਨਸ਼ੀਲ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->