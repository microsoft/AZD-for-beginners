# ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ ਗਾਈਡ

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਵਰਤਮਾਨ ਚੈਪਟਰ**: ਚੈਪਟਰ 1 - ਫਾਉਂਡੇਸ਼ਨ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਹਿਲਾਂ**: [AZD ਬੇਸਿਕਸ](azd-basics.md)
- **➡️ ਅਗਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **🚀 ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ਪਰIntroduction

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ ਤੁਹਾਡੇ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI (azd) ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰੇਗੀ। ਤੁਸੀਂ ਵੱਖ-ਵੱਖ ਓਪਰੇਟਿੰਗ ਸਿਸਟਮਾਂ ਲਈ ਕਈ ਇੰਸਟਾਲੇਸ਼ਨ ਢੰਗ, ਪ੍ਰਮਾਣਿਕਤਾ ਸੈਟਅਪ, ਅਤੇ ਸ਼ੁਰੂਆਤੀ ਕਨਫਿਗਰੇਸ਼ਨ ਸਿੱਖੋਗੇ ਤਾਂ ਜੋ ਤੁਹਾਡਾ ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਨ Azure ਡਿਪਲਾਇਮੈਂਟ ਲਈ ਤਿਆਰ ਹੋ ਜਾਏ।

## ਲਰਨਿੰਗ ਲਕੜੀਆਂ

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- ਆਪਣੇ ਓਪਰੇਟਿੰਗ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI ਸਫਲਤਾਪੂਰਵਕ ਇੰਸਟਾਲ ਕਰ ਲਵੋਗੇ
- ਵੱਖ-ਵੱਖ ਢੰਗਾਂ ਨਾਲ Azure ਲਈ ਪ੍ਰਮਾਣਿਕਤਾ ਕਨਫਿਗਰ ਕਰੋਂਗੇ
- ਲੋੜੀਂਦੇ ਪੂਰਵ-ਸ਼ਰਤਾਂ ਨਾਲ ਆਪਣਾ ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਨ ਸੈਟਅਪ ਕਰੋਗੇ
- ਵੱਖ-ਵੱਖ ਇੰਸਟਾਲੇਸ਼ਨ ਵਿਕਲਪਾਂ ਨੂੰ ਸਮਝੋਗੇ ਅਤੇ ਕਦੋਂ ਕਿਹੜਾ ਵਰਤਣਾ ਹੈ ਪਤਾ ਲਾ ਲਵੋਗੇ
- ਆਮ ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਟਰਬਲਸ਼ੂਟ ਕਰ ਸਕੋਗੇ

## ਲਰਨਿੰਗ ਆਉਟਕਮ्स

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਆਪਣੇ ਪਲੈਟਫਾਰਮ ਲਈ ਢੰਗ ਮੁਤਾਬਕ azd ਇੰਸਟਾਲ ਕਰਨਾ
- azd auth login ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਨਾਲ ਪ੍ਰਮਾਣਿਕਤਾ ਕਰਨੀ
- ਆਪਣੀ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਅਤੇ ਮੂਲ azd ਕਮਾਂਡਾਂ ਦੀ ਜਾਂਚ ਕਰਨੀ
- azd ਦੀ ਆਦਿ ਪਹੁੰਚ ਲਈ ਆਪਣਾ ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਨ ਕਨਫਿਗਰ ਕਰਨਾ
- ਆਮ ਇੰਸਟਾਲੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਖੁਦ ਹੱਲ ਕਰਨਾ

ਇਹ ਗਾਈਡ ਤੁਹਾਨੂੰ ਤੁਹਾਡੇ ਓਪਰੇਟਿੰਗ ਸਿਸਟਮ ਜਾਂ ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਨ ਨਾਲ ਕੋਈ ਫਰਕ ਨਹੀਂ ਕਰਦੀ, azd ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰੇਗੀ।

## ਲਾਜ਼ਮੀ ਸ਼ਰਤਾਂ

azd ਇੰਸਟਾਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਹਾਡੇ ਕੋਲ ਹੈ:
- **Azure سبسکرਿਪਸ਼ਨ** - [ਇਕ ਮੁਫ਼ਤ ਖਾਤਾ ਬਣਾਓ](https://azure.microsoft.com/free/)
- **Azure CLI** - ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਰਿਸੋਰਸ ਮੈਨੇਜਮੈਂਟ ਲਈ
- **Git** - ਟੈmplੇਟ ਕਲੋਨ ਕਰਨ ਅਤੇ ਵਰਜ਼ਨ ਕੰਟਰੋਲ ਲਈ
- **Docker** (ਆਪਸ਼ਨਲ) - ਕੰਟੇਨਰਾਈਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ

## ਇੰਸਟਾਲੇਸ਼ਨ ਦੇ ਢੰਗ

### Windows

#### ਵਿਕਲਪ 1: PowerShell (ਸੁਝਾਅ)
```powershell
# ਐਡਮਿਨਿਸਟ੍ਰੇਟਰ ਵਜੋਂ ਜਾਂ ਉੱਚ ਅਧਿਕਾਰਾਂ ਨਾਲ ਚਲਾਓ
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
1. ਤਾਜ਼ਾ ਰਿਲੀਜ਼ ਡਾਊਨਲੋਡ ਕਰੋ [GitHub](https://github.com/Azure/azure-dev/releases)
2. ਇਸਨੂੰ ਐਕਸਟ੍ਰੈਕਟ ਕਰੋ `C:\Program Files\azd\`
3. PATH ਵਾਤਾਵਰਨ ਭਿੰਡ ਵਿੱਚ ਸ਼ਾਮِل ਕਰੋ

### macOS

#### ਵਿਕਲਪ 1: Homebrew (ਸੁਝਾਅ)
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

#### ਵਿਕਲਪ 1: ਇੰਸਟਾਲ ਸਕ੍ਰਿਪਟ (ਸੁਝਾਅ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ਵਿਕਲਪ 2: ਪੈਕੇਜ ਮੈਨੇਜਰ

**Ubuntu/Debian:**
```bash
# Microsoft ਪੈਕੇਜ ਰਿਪੋਜ਼ਟਰੀ ਸ਼ਾਮਲ ਕਰੋ
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ਇੰਸਟਾਲ ਕਰੋ
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# ਮਾਈਕਰੋਸੌਫਟ ਪੈਕੇਜ ਰਿਪੋਜ਼ਿਟਰੀ ਜੋੜੋ
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd ਪਹਿਲਾਂ ਤੋਂ GitHub Codespaces ਵਿੱਚ ਇੰਸਟਾਲ ਆਉਂਦਾ ਹੈ। ਸਿਰਫ਼ ਇੱਕ codespace ਬਣਾਓ ਅਤੇ ਤੁਰੰਤ azd ਦੀ ਵਰਤੋਂ ਸ਼ੁਰੂ ਕਰੋ।

### Docker

```bash
# azd ਨੂੰ ਇੱਕ ਕੰਟੇਨਰ ਵਿੱਚ ਚਲਾਓ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# ਆਸਾਨ ਵਰਤੋਂ ਲਈ ਇੱਕ ਉਪਨਾਮ ਬਣਾਓ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ

ਇੰਸਟਾਲੇਸ਼ਨ ਤੋਂ ਬਾਦ, azd ਠੀਕ ਕੰਮ ਕਰ ਰਿਹਾ ਹੈ ਜਾਂ ਨਹੀਂ ਇਹ ਪੜਤਾਲ ਕਰੋ:

```bash
# ਵਰਜ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# ਮਦਦ ਵੇਖੋ
azd --help

# ਉਪਲਬਧ ਟੈਂਪਲੇਟਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd template list
```

ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ:
```
azd version 1.x.x (commit xxxxxx)
```

**ਨੋਟ**: ਅਸਲੀ ਵਰਜਨ ਨੰਬਰ ਵੱਖਰੇ ਹੋ ਸਕਦੇ ਹਨ। ਤਾਜ਼ਾ ਵਰਜਨ ਲਈ ਚੈੱਕ ਕਰੋ [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases)।

**✅ ਇੰਸਟਾਲੇਸ਼ਨ ਸਫਲਤਾ ਚੈਕੇਲਿਸਟ:**
- [ ] `azd version` ਵਰਜਨ ਨੰਬਰ ਬਿਨਾਂ ਗਲਤੀ ਦੇ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] `azd --help` ਕਮਾਂਡ ਦਸਤਾਵੇਜ਼ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] `azd template list` ਉਪਲਬਧ ਟੈmplੇਟ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] `az account show` ਤੁਹਾਡੀ Azure سبسکرਿਪਸ਼ਨ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] ਤੁਸੀਂ ਟੈਸਟ ਡਾਇਰੈਕਟਰੀ ਬਣਾਕੇ `azd init` ਸਫਲਤਾਪੂਰਵਕ ਚਲਾ ਸਕਦੇ ਹੋ

**ਜੇ ਸਾਰੇ ਚੈੱਕ ਪਾਸ ਹੋ ਜਾਂਦੇ ਹਨ, ਤੁਸੀਂ [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) ਵੱਲ ਅੱਗੇ ਵਧਣ ਲਈ ਤਿਆਰ ਹੋ!**

## ਪ੍ਰਮਾਣਿਕਤਾ ਸੈਟਅਪ

### Azure CLI ਪ੍ਰਮਾਣਿਕਤਾ (ਸੁਝਾਅ)
```bash
# ਜੇ ਪਹਿਲਾਂ ਤੋਂ ਇੰਸਟਾਲ ਨਾ ਹੋਇਆ ਹੋਵੇ ਤਾਂ Azure CLI ਇੰਸਟਾਲ ਕਰੋ
# ਵਿੰਡੋਜ਼: winget install Microsoft.AzureCLI
# ਮੈਕਓਐਸ: brew install azure-cli
# ਲਿਨਕਸ: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
az login

# ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
az account show
```

### ਡਿਵਾਈਸ ਕੋਡ ਪ੍ਰਮਾਣਿਕਤਾ
ਜੇ ਤੁਸੀਂ ਹੈਡਲੈੱਸ ਸਿਸਟਮ 'ਤੇ ਹੋ ਜਾਂ ਬ੍ਰਾਊਜ਼ਰ ਸਮੱਸਿਆਵਾਂ ਹਨ:
```bash
az login --use-device-code
```

### ਸਰਵਿਸ ਪ੍ਰਿੰਸੀਪਲ (CI/CD)
ਆਟੋਮੇਟਡ ਮਾਹੌਲ ਲਈ:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## ਕਨਫਿਗਰੇਸ਼ਨ

### ਗਲੋਬਲ ਕਨਫਿਗਰੇਸ਼ਨ
```bash
# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈਟ ਕਰੋ
azd config set defaults.subscription <subscription-id>

# ਡਿਫਾਲਟ ਸਥਾਨ ਸੈਟ ਕਰੋ
azd config set defaults.location eastus2

# ਸਭ ਸੰਰਚਨਾਵਾਂ ਵੇਖੋ
azd config list
```

### ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਜ਼
ਆਪਣੇ ਸ਼ੈੱਲ ਪ੍ਰੋਫ਼ਾਈਲ (`.bashrc`, `.zshrc`, `.profile`) ਵਿੱਚ ਸ਼ਾਮِل ਕਰੋ:
```bash
# ਅਜ਼ੂਰ ਸੰਰਚਨਾ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ਸੰਰਚਨਾ
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ਡੀਬੱਗ ਲੌਗਿੰਗ ਨੂੰ ਚਾਲੂ ਕਰੋ
```

## IDE ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### Visual Studio Code
Azure Developer CLI ਐਕਸਟੈਨਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ:
1. VS Code ਖੋਲ੍ਹੋ
2. Extensions (Ctrl+Shift+X) ਤੇ ਜਾਓ
3. "Azure Developer CLI" ਲਈ ਖੋਜ ਕਰੋ
4. ਐਕਸਟੈਨਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ

ਫੀਚਰ:
- azure.yaml ਲਈ IntelliSense
- ਇੰਟੀਗਰੇਟਿਡ ਟਰਮੀਨਲ ਕਮਾਂਡਸ
- ਟੈmplੇਟ ਬ੍ਰਾਊਜ਼ਿੰਗ
- ਡਿਪਲਾਇਮੈਂਟ ਮਾਨੀਟਰਿੰਗ

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
2. Azure ਕ੍ਰੈਡੈਂਸ਼ਲ ਕਨਫਿਗਰ ਕਰੋ
3. azd ਕਮਾਂਡਾਂ ਲਈ ਇੰਟੀਗਰੇਟਿਡ ਟਰਮੀਨਲ ਵਰਤੋ

## 🐛 ਇੰਸਟਾਲੇਸ਼ਨ ਟਰਬਲਸ਼ੂਟਿੰਗ

### ਆਮ ਸਮੱਸਿਆਵਾਂ

#### ਪਰਮੀਸ਼ਨ ਡਿਨਾਇਡ (Windows)
```powershell
# PowerShell ਨੂੰ ਐਡਮਿਨਿਸਟਰੇਟਰ ਵਜੋਂ ਚਲਾਓ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ਸਮੱਸਿਆਵਾਂ
azd ਨੂੰ ਆਪਣੇ PATH ਵਿੱਚ ਮੈਨੁਅਲੀ ਤੌਰ ਤੇ ਸ਼ਾਮِل ਕਰੋ:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### ਨੈਟਵਰਕ/ਪ੍ਰਾਕਸੀ ਸਮੱਸਿਆਵਾਂ
```bash
# ਪ੍ਰਾਕਸੀ ਸੰਰਚਨਾ ਕਰੋ
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL ਦੀ ਪੁਸ਼ਟੀ ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਕਰੋ (ਉਤਪਾਦਨ ਲਈ ਸਿਫਾਰਸ਼ ਨਹੀਂ ਕੀਤੀ ਜਾਂਦੀ)
azd config set http.insecure true
```

#### ਵਰਜਨ ਟਕਰਾਅ
```bash
# ਪੁਰਾਣੀਆਂ ਇੰਸਟਾਲੇਸ਼ਨਾਂ ਨੂੰ ਹਟਾਓ
# ਵਿਂਡੋਜ਼: winget uninstall Microsoft.Azd
# ਮੈਕਓਐਸ: brew uninstall azd
# ਲਿਨਕਸ: sudo apt remove azd

# ਸੰਰਚਨਾ ਸਾਫ ਕਰੋ
rm -rf ~/.azd
```

### ਹੋਰ ਮਦਦ ਲੈਣੀ ਹੈ?
```bash
# ਡੀਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd <command> --debug

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਵੇਖੋ
azd config list

# ਮੌਜੂਦਾ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਵੇਖੋ
azd show
```

## azd ਅਪਡੇਟ ਕਰਨਾ

### ਆਟੋਮੈਟਿਕ ਅਪਡੇਟਸ
azd ਤੁਹਾਨੂੰ ਅਪਡੇਟਾਂ ਦੀ ਸੂਚਨਾ ਦੇਵੇਗਾ ਜਦੋਂ ਉਪਲਬਧ ਹੋਣਗੀਆਂ:
```bash
azd version --check-for-updates
```

### ਮੈਨੂਅਲ ਅਪਡੇਟਸ

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

## 💡 ਅਕਸਰ ਪੁੱਛੇ ਜਾਂਦੇ ਸਵਾਲ

<details>
<summary><strong>azd ਅਤੇ az CLI ਵਿੱਚ ਕੀ ਫਰਕ ਹੈ?</strong></summary>

**Azure CLI (az)**: ਵਿੱਥ-ਨੀਵੀਂ ਉਸਤਰੀ ਟੂਲ ਜੋ ਵਿਅਕਤੀਗਤ Azure ਰਿਸੋਰਸਾਂ ਨੂੰ ਮੈਨੇਜ ਕਰਨ ਲਈ ਹੈ
- `az webapp create`, `az storage account create`
- ਇੱਕ ਵਾਰ ਵਿੱਚ ਇੱਕ ਰਿਸੋਰਸ
- ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਮੈਨੇਜਮੈਂਟ 'ਤੇ ਧਿਆਨ

**Azure Developer CLI (azd)**: ਪੂਰੇ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲਾਇਮੈਂਟ ਲਈ ਉੱਚ-ਸਤਰ ਦਾ ਟੂਲ
- `azd up` ਸਾਰੇ ਰਿਸੋਰਸਾਂ ਨਾਲ ਪੂਰੇ ਐਪ ਨੂੰ ਡਿਪਲੋਇ ਕਰਦਾ ਹੈ
- ਟੈmplੇਟ-ਅਧਾਰਿਤ ਵਰਕਫਲੋਜ਼
- ਡਿਵੈਲਪਰ ਉਤਪਾਦਕਤਾ 'ਤੇ ਧਿਆਨ

**ਤੁਹਾਨੂੰ ਦੋਹਾਂ ਦੀ ਲੋੜ ਹੈ**: azd ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ az CLI ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ
</details>

<details>
<summary><strong>ਕੀ ਮੈਂ ਮੌਜੂਦਾ Azure ਰਿਸੋਰਸਾਂ ਨਾਲ azd ਵਰਤ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?</strong></summary>

ਹਾਂ! ਤੁਸੀਂ ਇਹ ਕਰ ਸਕਦੇ ਹੋ:
1. ਮੌਜੂਦਾ ਰਿਸੋਰਸਾਂ ਨੂੰ azd ਇਨਵਾਇਰਨਮੈਂਟ ਵਿੱਚ ਇੰਪੋਰਟ ਕਰੋ
2. ਆਪਣੇ Bicep ਟੈmplੇਟਾਂ ਵਿੱਚ ਮੌਜੂਦਾ ਰਿਸੋਰਸਾਂ ਦਾ ਹਵਾਲਾ ਦਿਓ
3. ਮੌਜੂਦਾ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਦੇ ਨਾਲ ਨਵੀਆਂ ਡਿਪਲਾਇਮੈਂਟ ਲਈ azd ਵਰਤੋ

ਵਧੇਰੇ ਵੇਰਵੇ ਲਈ ਦੇਖੋ [Configuration Guide](configuration.md)।
</details>

<details>
<summary><strong>ਕੀ azd Azure Government ਜਾਂ Azure China ਨਾਲ ਕੰਮ ਕਰਦਾ ਹੈ?</strong></summary>

ਹਾਂ, ਕਲਾਉਡ ਨੂੰ ਕਨਫਿਗਰ ਕਰੋ:
```bash
# ਅਜ਼ੂਰ ਸਰਕਾਰੀ
az cloud set --name AzureUSGovernment
az login

# ਅਜ਼ੂਰ ਚੀਨ
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>ਕੀ ਮੈਂ azd CI/CD ਪਾਇਪਲਾਈਨ ਵਿੱਚ ਵਰਤ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?</strong></summary>

ਬਿਲਕੁਲ! azd ਆਟੋਮੇਸ਼ਨ ਲਈ ਡਿਜ਼ਾਈਨ ਕੀਤਾ ਗਿਆ ਹੈ:
- GitHub Actions ਇੰਟੀਗਰੇਸ਼ਨ
- Azure DevOps ਸਪੋਰਟ
- ਸਰਵਿਸ ਪ੍ਰਿੰਸੀਪਲ ਪ੍ਰਮਾਣਿਕਤਾ
- ਨਾਨ-ਇੰਟਰਐਕਟਿਵ ਮੋਡ

CI/CD ਪੈਟਰਨ ਲਈ ਦੇਖੋ [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)।
</details>

<details>
<summary><strong>azd ਵਰਤਣ ਦੀ ਲਾਗਤ ਕੀ ਹੈ?</strong></summary>

azd ਖੁਦ **ਪੂਰੀ ਤਰ੍ਹਾਂ ਮੁਫ਼ਤ** ਅਤੇ ਓਪਨ-ਸੋਰਸ ਹੈ। ਤੁਸੀਂ ਸਿਰਫ਼ ਹੇਠਾਂ ਲਈ ਭੁਗਤਾਨ ਕਰਦੇ ਹੋ:
- ਉਹ Azure ਰਿਸੋਰਸ ਜੋ ਤੁਸੀਂ ਡਿਪਲੋਇ ਕਰਦੇ ਹੋ
- Azure ਖਪਤ ਲਾਗਤਾਂ (compute, storage, ਆਦਿ)

ਡਿਪਲਾਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਲਾਗਤ ਦਾ ਅੰਦਾਜ਼ਾ ਲਗਾਉਣ ਲਈ `azd provision --preview` ਵਰਤੋ।
</details>

## ਅਗਲੇ ਕਦਮ

1. **ਪ੍ਰਮਾਣਿਕਤਾ ਪੂਰੀ ਕਰੋ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਸੀਂ ਆਪਣੀ Azure سبਸکرਿਪਸ਼ਨ ਤੱਕ ਪਹੁੰਚ ਕਰ ਸਕਦੇ ਹੋ
2. **ਆਪਣਾ ਪਹਿਲਾ ਡਿਪਲਾਇਮੈਂਟ ਕੋਸ਼ਿਸ਼ ਕਰੋ**: [First Project Guide](first-project.md) ਦੀ ਪਾਲਣਾ ਕਰੋ
3. **ਟੈmplੇਟਾਂ ਨੂੰ ਖੰਗਾਲੋ**: `azd template list` ਨਾਲ ਉਪਲਬਧ ਟੈmplੇਟ ਵੇਖੋ
4. **ਆਪਣਾ IDE ਕਨਫਿਗਰ ਕਰੋ**: ਆਪਣਾ ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਨ ਸੈਟਅਪ ਕਰੋ

## ਸਹਾਇਤਾ

ਜੇ ਤੁਸੀਂ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਕਰਦੇ ਹੋ:
- [ਅਧਿਕਾਰਿਕ ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ਇਸ਼ੂਜ਼ ਰਿਪੋਰਟ ਕਰੋ](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` ਨਾਲ ਆਪਣੇ ਐਡੀਟਰ ਵਿੱਚ ਸਿੱਧਾ Azure ਕਮਾਂਡ ਮਦਦ ਪ੍ਰਾਪਤ ਕਰੋ

---

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਵਰਤਮਾਨ ਚੈਪਟਰ**: ਚੈਪਟਰ 1 - ਫਾਉਂਡੇਸ਼ਨ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
- **⬅️ ਪਹਿਲਾਂ**: [AZD ਬੇਸਿਕਸ](azd-basics.md) 
- **➡️ ਅਗਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md)
- **🚀 ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ਇੰਸਟਾਲੇਸ਼ਨ ਪੂਰਾ ਹੋ ਗਿਆ!** azd ਨਾਲ ਬਿਲਡਿੰਗ ਸ਼ੁਰੂ ਕਰਨ ਲਈ [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) ਤੇ ਜਾਰੀ ਰੱਖੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਜਵਾਬਦੇਹੀ ਅਸਵੀਕਾਰ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸੱਚਾਈਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਕ ਸ੍ਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪ੍ਰੋਫੈਸ਼ਨਲ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਭ੍ਰਮਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->