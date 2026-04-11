# ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ ਗਾਈਡ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: Chapter 1 - Foundation & Quick Start
- **⬅️ ਪਿਛਲਾ**: [AZD ਮੂਲ ਭੂਤ](azd-basics.md)
- **➡️ ਅਗਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰਾਜੈਕਟ](first-project.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ ਤੁਹਾਡੇ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI (azd) ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਕਾਂਫਿਗਰ ਕਰਨ ਵਿਚ ਰਾਹ ਦਿਖਾਏਗੀ। ਤੁਸੀਂ ਵੱਖ-ਵੱਖ آپਰੇਟਿੰਗ ਸਿਸਟਮਾਂ ਲਈ ਕਈ ਇੰਸਟਾਲੇਸ਼ਨ ਤਰੀਕੇ, ਪ੍ਰਮਾਣੀਕਰਨ ਸੈਟਅਪ, ਅਤੇ Azure ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਨੂੰ ਤਿਆਰ ਕਰਨ ਲਈ ਸ਼ੁਰੂਆਤੀ ਕਾਂਫਿਗਰੇਸ਼ਨ ਸਿਖੋਗੇ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- ਆਪਣੇ آپਰੇਟਿੰਗ ਸਿਸਟਮ 'ਤੇ Azure Developer CLI ਸਫਲਤਾਪੂਰਕ ਇੰਸਟਾਲ ਕਰਨਾ ਸਿੱਖ ਲਵੋਗੇ
- ਕਈ ਤਰੀਕਿਆਂ ਨਾਲ Azure ਨਾਲ ਪ੍ਰਮਾਣੀਕਰਨ ਕਾਂਫਿਗਰ ਕਰਨਾ
- ਲੋੜੀਂਦੀ ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ ਨਾਲ ਆਪਣੇ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਨੂੰ ਸੈਟਅਪ ਕਰਨਾ
- ਵੱਖ-ਵੱਖ ਇੰਸਟਾਲੇਸ਼ਨ ਵਿਕਲਪਾਂ ਨੂੰ ਸਮਝਣਾ ਅਤੇ ਕਿਸ ਵੇਲੇ ਕਿਹੜਾ ਵਰਤਣਾ ਚਾਹੀਦਾ ਹੈ
- ਆਮ ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਠੀਕ ਕਰਨਾ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਮਗਰੋਂ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਆਪਣੇ ਪਲੇਟਫਾਰਮ ਲਈ ਉਚਿਤ ਤਰੀਕੇ ਨਾਲ azd ਇੰਸਟਾਲ ਕਰਨਾ
- `azd auth login` ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਨਾਲ ਪ੍ਰਮਾਣੀਕਰਨ ਕਰਨਾ
- ਆਪਣੀ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਅਤੇ ਮੂਲ azd ਕਮਾਂਡਾਂ ਦੀ ਜਾਂਚ ਕਰਨ ਦੀ ਸਮਰੱਥਾ
- azd ਦੀ ਸੁਚੱਜੀ ਵਰਤੋਂ ਲਈ ਆਪਣੇ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਨੂੰ ਕਾਂਫਿਗਰ ਕਰਨਾ
- ਆਮ ਇੰਸਟਾਲੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਹੱਲ ਕਰਨਾ

ਇਹ ਗਾਈਡ ਤੁਹਾਨੂੰ ਤੁਹਾਡੇ ਆਪਰੇਟਿੰਗ ਸਿਸਟਮ ਜਾਂ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਤੋਂ ਇਲਾਵਾ Azure Developer CLI ਇੰਸਟਾਲ ਅਤੇ ਕਾਂਫਿਗਰ ਕਰਨ ਵਿਚ ਮਦਦ ਕਰੇਗੀ।

## ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ

azd ਇੰਸਟਾਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਹਾਡੇ ਕੋਲ ਹਨ:
- **Azure subscription** - [ਮੁਫ਼ਤ ਖਾਤਾ ਬਣਾਓ](https://azure.microsoft.com/free/)
- **Azure CLI** - ਪ੍ਰਮਾਣੀਕਰਨ ਅਤੇ ਰਿਸੋਰਸ ਪ੍ਰਬੰਧਨ ਲਈ
- **Git** - ਟੈਮਪਲੇਟ ਕਲੋਨ ਕਰਨ ਅਤੇ ਵਰਜ਼ਨ ਕੰਟਰੋਲ ਲਈ
- **Docker** (ਵਿਕਲਪੀ) - ਕੰਟੇਨਰ-ਆਧਾਰਿਤ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ

## ਇੰਸਟਾਲੇਸ਼ਨ ਦੇ ਤਰੀਕੇ

### Windows

#### Option 1: Windows Package Manager (ਸੁਝਾਇਆ ਗਿਆ)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# ਜਦੋਂ winget ਉਪਲਬਧ ਨਹੀਂ ਹੁੰਦਾ ਤਾਂ ਇਹ ਲਾਭਦਾਇਕ ਹੁੰਦਾ ਹੈ
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. ਤਾਜ਼ਾ ਰਿਲੀਜ਼ ਨੂੰ [GitHub](https://github.com/Azure/azure-dev/releases) ਤੋਂ ਡਾਊਨਲੋਡ ਕਰੋ
2. ਇਸ ਨੂੰ `C:\Program Files\azd\` ਵਿੱਚ ਐਕਸਟਰੈਕਟ ਕਰੋ
3. PATH ਇੰਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ ਵਿੱਚ ਜੋੜੋ

### macOS

#### Option 1: Homebrew (ਸੁਝਾਇਆ ਗਿਆ)
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
# ਡਾਊਨਲੋਡ ਅਤੇ ਇੰਸਟਾਲ ਕਰੋ
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (ਸੁਝਾਇਆ ਗਿਆ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Manual installation from release assets:**
```bash
# ਆਪਣੀ ਲਿਨਕਸ ਆਰਕੀਟੈਕਚਰ ਲਈ ਨਵੀਨਤਮ ਆਰਕਾਈਵ ਇੱਥੋਂ ਡਾਊਨਲੋਡ ਕਰੋ:
# https://github.com/Azure/azure-dev/releases
# ਫਿਰ ਇਸ ਨੂੰ ਨਿਕਾਲੋ ਅਤੇ azd ਬਾਇਨਰੀ ਨੂੰ ਆਪਣੇ PATH ਵਿੱਚ ਸ਼ਾਮِل ਕਰੋ.
```

### GitHub Codespaces

ਕਈ Codespaces ਅਤੇ dev container ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ ਪਹਿਲਾਂ ਤੋਂ `azd` ਸ਼ਾਮਲ ਹੁੰਦਾ ਹੈ, ਪਰ ਤੁਹਾਨੂੰ ਇਹ ਧਿਆਨ ਨਾਲ ਜਾਂਚਣਾ ਚਾਹੀਦਾ ਹੈ ਨਾ ਕਿ فرض ਕਰਨਾ:

```bash
azd version
```

ਜੇ `azd` ਗੈਰਮੌਜੂਦ ਹੈ, ਤਾਂ ਉਸ ਵਾਤਾਵਰਣ ਲਈ ਸਟੈਂਡਰਡ ਸਕ੍ਰਿਪਟ ਨਾਲ ਇਸਨੂੰ ਇੰਸਟਾਲ ਕਰੋ।

### Docker

```bash
# azd ਨੂੰ ਇੱਕ ਕੰਟੇਨਰ ਵਿੱਚ ਚਲਾਓ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# ਆਸਾਨ ਵਰਤੋਂ ਲਈ ਇੱਕ ਐਲਿਆਸ ਬਣਾਓ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ

ਇੰਸਟਾਲੇਸ਼ਨ ਦੇ ਬਾਅਦ, azd ਦੇ ਸਹੀ ਤਰ੍ਹਾਂ ਕੰਮ ਕਰਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:

```bash
# ਵਰਜ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# ਸਹਾਇਤਾ ਵੇਖੋ
azd --help

# ਉਪਲਬਧ ਟੈਮਪਲੇਟਾਂ ਦੀ ਸੂਚੀ
azd template list
```

ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ:
```
azd version 1.x.x (commit xxxxxx)
```

**ਨੋਟ**: ਅਸਲ ਵਰਜ਼ਨ ਨੰਬਰ ਵੱਖ-ਵੱਖ ਹੋ ਸਕਦਾ ਹੈ। ਤਾਜ਼ਾ ਵਰਜਨ ਲਈ ਦੇਖੋ [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) ।

**✅ ਇੰਸਟਾਲੇਸ਼ਨ ਸਫਲਤਾ ਚੈੱਕਲਿਸਟ:**
- [ ] `azd version` ਗਲਤੀ ਦੇ ਬਿਨਾਂ ਵਰਜ਼ਨ ਨੰਬਰ ਦਿਖਾਂਦਾ ਹੈ
- [ ] `azd --help` ਕਮਾਂਡ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] `azd template list` ਉਪਲਬਧ ਟੈਮਪਲੇਟ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] ਤੁਸੀਂ ਇੱਕ ਟੈਸਟ ਡਾਇਰੈਕਟਰੀ ਬਣਾ ਕੇ `azd init` ਸਫਲਤਾਪੂਰਵਕ ਚਲਾ ਸਕਦੇ ਹੋ

**ਜੇ ਸਾਰੇ ਚੈਕ ਪਾਸ ਹੋ ਜਾਂਦੇ ਹਨ, ਤਾਂ ਤੁਸੀਂ ਅੱਗੇ ਵਧਣ ਲਈ [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰਾਜੈਕਟ](first-project.md) ਵੱਲ ਤਿਆਰ ਹੋ!**

## ਪ੍ਰਮਾਣੀਕਰਨ ਸੈਟਅਪ

### ਨਵੇਂ ਉਪਭੋਗਤਾਵਾਂ ਲਈ ਸੁਝਾਇਆ ਗਿਆ ਸੈਟਅਪ

AZD-ਪਹਿਲਾਂ ਵਰਕਫਲੋਜ਼ ਲਈ, `azd auth login` ਨਾਲ ਸਾਈਨ ਇਨ ਕਰੋ।

```bash
# AZD ਕਮਾਂਡਾਂ ਜਿਵੇਂ ਕਿ azd up ਲਈ ਲੋੜੀਂਦਾ ਹੈ
azd auth login

# AZD ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਸਥਿਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
azd auth login --check-status
```

ਕੋਰਸ ਦੌਰਾਨ ਜਦੋਂ ਤੁਸੀਂ ਖੁਦ `az` ਕਮਾਂਡਾਂ ਚਲਾਉਣ ਦੀ ਯੋਜਨਾ ਬਣਾਉਂਦੇ ਹੋ ਤਾਂ ਕੇਵਲ Azure CLI ਸਾਈਨ-ਇਨ ਦੀ ਵਰਤੋਂ ਕਰੋ।

### Azure CLI ਪ੍ਰਮਾਣੀਕਰਨ (ਵਿਕਲਪੀ)
```bash
# ਜੇ ਪਹਿਲਾਂ ਤੋਂ ਇੰਸਟਾਲ ਨਹੀਂ ਕੀਤਾ ਗਿਆ ਤਾਂ Azure CLI ਇੰਸਟਾਲ ਕਰੋ
# ਵਿੰਡੋਜ਼: winget install Microsoft.AzureCLI
# ਮੈਕਓਐਸ: brew install azure-cli
# ਲਿਨਕਸ: ਆਪਣੇ ਡਿਸਟ੍ਰੀਬਿਊਸ਼ਨ ਲਈ Azure CLI ਇੰਸਟਾਲ ਦਸਤਾਵੇਜ਼ ਵੇਖੋ

# Azure ਵਿੱਚ ਲਾਗਇਨ ਕਰੋ
az login

# ਪ੍ਰਮਾਣੀਕਰਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az account show
```

### ਤੁਹਾਨੂੰ ਕਿਹੜਾ ਸਾਇਨ-ਇਨ ਫਲੋ ਵਰਤਣਾ ਚਾਹੀਦਾ ਹੈ?

- ਜੇ ਤੁਸੀਂ ਬਿਗਿਨਰ AZD ਰਾਹ ਦੀ ਪਾਲਣਾ ਕਰ ਰਹੇ ਹੋ ਅਤੇ ਮੁੱਖ ਤੌਰ 'ਤੇ `azd` ਕਮਾਂਡਾਂ ਚਲਾ ਰਹੇ ਹੋ, ਤਾਂ `azd auth login` ਵਰਤੋਂ।
- ਜਦੋਂ ਤੁਸੀਂ `az account show` ਵਰਗੀਆਂ Azure CLI ਕਮਾਂਡਾਂ ਚਲਾਉਣੀ ਚਾਹੁੰਦੇ ਹੋ ਜਾਂ ਸਿੱਧਾ ਰਿਸੋਰਸਾਂ ਦੀ ਜਾਂਚ ਕਰਨੀ ਹੋਵੇ ਤਾਂ `az login` ਵੀ ਵਰਤੋ।
- ਜੇ ਕਿਸੇ ਅਭਿਆਸ ਵਿੱਚ `azd` ਅਤੇ `az` ਦੋਹਾਂ ਕਮਾਂਡਾਂ ਸ਼ਾਮਲ ਹਨ, ਤਾਂ ਸ਼ੁਰੂ ਵਿੱਚ ਦੋਹਾਂ ਸਾਈਨ-ਇਨ ਕਮਾਂਡ ਇੱਕ ਵਾਰੀ ਚਲਾਓ।

### ਡਿਵਾਈਸ ਕੋਡ ਪ੍ਰਮਾਣੀਕਰਨ
ਜੇ ਤੁਸੀਂ ਹੇਡਲੈੱਸ ਸਿਸਟਮ 'ਤੇ ਹੋ ਜਾਂ ਬ੍ਰਾਊਜ਼ਰ ਸਮੱਸਿਆਵਾਂ ਹਨ:
```bash
azd auth login --use-device-code
```

### ਸਰਵਿਸ ਪ੍ਰਿੰਸੀਪਲ (CI/CD)
ਆਟੋਮੇਟਿਡ ਵਾਤਾਵਰਣਾਂ ਲਈ:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### ਆਪਣੇ ਪੂਰੇ ਸੈਟਅਪ ਦੀ ਜਾਂਚ ਕਰੋ

ਜੇ ਤੁਸੀਂ ਚੈਪਟਰ 1 ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਇੱਕ ਤੇਜ਼ ਤਿਆਰੀ ਚੇਕ ਚਾਹੁੰਦੇ ਹੋ:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## ਕਾਨਫਿਗਰੇਸ਼ਨ

### ਗਲੋਬਲ ਕਾਨਫਿਗਰੇਸ਼ਨ
```bash
# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.subscription <subscription-id>

# ਡਿਫਾਲਟ ਸਥਾਨ ਸੈੱਟ ਕਰੋ
azd config set defaults.location eastus2

# ਸਭ ਸੰਰਚਨਾਵਾਂ ਵੇਖੋ
azd config show
```

### ਇੰਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ
ਆਪਣੇ shell ਪ੍ਰੋਫਾਈਲ (`.bashrc`, `.zshrc`, `.profile`) ਵਿੱਚ ਜੋੜੋ:
```bash
# Azure ਸੰਰਚਨਾ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ਸੰਰਚਨਾ
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ਡਿਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ
```

## IDE ਏਕੀਕਰਨ

### Visual Studio Code
Azure Developer CLI ਐਕਸਟੈਨਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ:
1. VS Code ਖੋਲ੍ਹੋ
2. Extensions (Ctrl+Shift+X) 'ਤੇ ਜਾਓ
3. "Azure Developer CLI" ਲੱਭੋ
4. ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ

ਫੀਚਰ:
- azure.yaml ਲਈ IntelliSense
- ਇੰਟੀਗਰੇਟਡ ਟਰਮੀਨਲ ਕਮਾਂਡ
- ਟੈਮਪਲੇਟ ਬ੍ਰਾਊਜ਼ਿੰਗ
- ਡਿਪਲੋਇਮੈਂਟ ਮਾਨੀਟਰਨਗ

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
2. Azure ਕ੍ਰੈਡੈਂਸ਼ਿਆਲ ਸੈੱਟ ਕਰੋ
3. `azd` ਕਮਾਂਡਾਂ ਲਈ ਇੰਟੀਗਰੇਟਡ ਟਰਮੀਨਲ ਦੀ ਵਰਤੋਂ ਕਰੋ

## 🐛 ਇੰਸਟਾਲੇਸ਼ਨ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ

### ਆਮ ਸਮੱਸਿਆਵਾਂ

#### Permission Denied (Windows)
```powershell
# PowerShell ਨੂੰ ਐਡਮਿਨਿਸਟਰੇਟਰ ਵਜੋਂ ਚਲਾਓ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ਸਮੱਸਿਆਵਾਂ
ਹੱਥੋਂ azd ਨੂੰ ਆਪਣੇ PATH ਵਿੱਚ ਜੋੜੋ:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### ਨੈੱਟਵਰਕ/ਪ੍ਰੋਕਸੀ ਸਮੱਸਿਆਵਾਂ
```bash
# ਪ੍ਰਾਕਸੀ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL ਤਸਦੀਕ ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਕਰੋ (ਉਤਪਾਦਨ ਲਈ ਸਿਫਾਰਿਸ਼ ਨਹੀਂ ਕੀਤੀ ਜਾਂਦੀ)
azd config set http.insecure true
```

#### ਵਰਜ਼ਨ ਟਕਰਾਅ
```bash
# ਪੁਰਾਣੀਆਂ ਇੰਸਟਾਲੇਸ਼ਨਾਂ ਨੂੰ ਹਟਾਓ
# ਵਿੰਡੋਜ਼: winget uninstall microsoft.azd
# ਮੈਕਓਐਸ: brew uninstall azd
# ਲਿਨਕਸ: ਦੁਬਾਰਾ ਇੰਸਟਾਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਪਿਛਲਾ azd ਬਾਈਨਰੀ ਜਾਂ ਸਾਇੰਲਿੰਕ ਹਟਾਓ

# ਕੰਫਿਗਰੇਸ਼ਨ ਸਾਫ਼ ਕਰੋ
rm -rf ~/.azd
```

### ਹੋਰ ਮਦਦ ਪ੍ਰਾਪਤ ਕਰੋ
```bash
# ਡਿਬੱਗ ਲੌਗਿੰਗ ਨੂੰ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
azd <command> --debug

# ਮੌਜੂਦਾ ਸੰਰਚਨਾ ਵੇਖੋ
azd config show

# ਮੌਜੂਦਾ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਵੇਖੋ
azd show
```

## azd ਅੱਪਡੇਟ ਕਰਨਾ

### ਅਪਡੇਟ ਜਾਂਚ
azd ਨਵੀਂ ਰਿਲੀਜ਼ ਉਪਲਬਧ ਹੋਣ 'ਤੇ ਚੇਤਾਵਨੀ ਦਿੰਦਾ ਹੈ, ਅਤੇ ਤੁਸੀਂ ਆਪਣੇ ਮੌਜੂਦ ਬਿਲਡ ਦੀ ਪੁਸ਼ਟੀ ਇਹਨਾਂ ਨਾਲ ਕਰ ਸਕਦੇ ਹੋ:
```bash
azd version
```

### ਮੈਨੁਅਲ ਅੱਪਡੇਟ

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

## 💡 ਅਕਸਰ ਪੁੱਛੇ ਜਾਂਦੇ ਪ੍ਰਸ਼ਨ

<details>
<summary><strong>azd ਅਤੇ az CLI ਵਿਚ ਕੀ ਫਰਕ ਹੈ?</strong></summary>

**Azure CLI (az)**: ਵਿਅਕਤੀਗਤ Azure ਰਿਸੋਰਸਾਂ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਲਈ ਨੀਵੀਂ ਪੱਧਰ ਦੀ ਟੂਲ
- `az webapp create`, `az storage account create`
- ਇਕ ਵਾਰੀ ਇਕ ਰਿਸੋਰਸ
- ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰਬੰਧਨ 'ਤੇ ਧਿਆਨ

**Azure Developer CLI (azd)**: ਪੂਰੇ ਐਪਲਿਕੇਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਉੱਚ-ਪੱਧਰੀ ਟੂਲ
- `azd up` ਪੂਰੇ ਐਪ ਨਾਲ ਸਬੰਧਤ ਸਾਰੇ ਰਿਸੋਰਸ ਡਿਪਲੋਇ ਕਰਦਾ ਹੈ
- ਟੈਮਪਲੇਟ-ਆਧਾਰਿਤ ਵਰਕਫਲੋਜ਼
- ਡਿਵੈਲਪਰ ਉਤਪਾਦਕਤਾ 'ਤੇ ਧਿਆਨ

**ਤੁਹਾਨੂੰ ਦੋਹਾਂ ਦੀ ਲੋੜ ਹੈ**: azd ਪ੍ਰਮਾਣੀਕਰਨ ਲਈ az CLI ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ
</details>

<details>
<summary><strong>ਕੀ ਮੈਂ ਮੌਜੂਦਾ Azure ਰਿਸੋਰਸਾਂ ਨਾਲ azd ਵਰਤ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?</strong></summary>

ਹਾਂ! ਤੁਸੀਂ ਕਰ ਸਕਦੇ ਹੋ:
1. ਮੌਜੂਦਾ ਰਿਸੋਰਸਾਂ ਨੂੰ azd ਇਨਵਾਇਰਨਮੈਂਟਸ ਵਿੱਚ ਇੰਪੋਰਟ ਕਰੋ
2. ਆਪਣੇ Bicep ਟੈਮਪਲੇਟਾਂ ਵਿੱਚ ਮੌਜੂਦਾ ਰਿਸੋਰਸਾਂ ਦਾ ਹਵਾਲਾ ਦਿਓ
3. ਮੌਜੂਦਾ ਇੰਫਰਾਸਟਰਕਚਰ ਦੇ ਨਾਲ ਨਵੀਆਂ ਡਿਪਲੋਇਮੈਂਟ ਲਈ azd ਵਰਤੋ

ਵਿਸਤਾਰ ਲਈ ਦੇਖੋ [Configuration Guide](configuration.md) ।
</details>

<details>
<summary><strong>ਕੀ azd Azure Government ਜਾਂ Azure China ਨਾਲ ਕੰਮ ਕਰਦਾ ਹੈ?</strong></summary>

ਹਾਂ, ਕਲਾਉਡ ਨੂੰ ਕਾਂਫਿਗਰ ਕਰੋ:
```bash
# ਐਜ਼ੂਰ ਸਰਕਾਰ
az cloud set --name AzureUSGovernment
az login

# ਐਜ਼ੂਰ ਚੀਨ
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>ਕੀ ਮੈਂ CI/CD ਪਾਈਪਲਾਈਨਾਂ ਵਿੱਚ azd ਵਰਤ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?</strong></summary>

ਬਿਲਕੁਲ! azd ਆਟੋਮੇਸ਼ਨ ਲਈ ਡਿਜ਼ਾਈਨ ਕੀਤਾ ਗਿਆ ਹੈ:
- GitHub Actions ਇੰਟੀਗਰੇਸ਼ਨ
- Azure DevOps ਸਹਾਇਤਾ
- ਸਰਵਿਸ ਪ੍ਰਿੰਸੀਪਲ ਪ੍ਰਮਾਣੀਕਰਨ
- ਨਾਨ-ਇੰਟਰੈਕਟਿਵ ਮੋਡ

CI/CD ਪੈਟਰਨਾਂ ਲਈ ਦੇਖੋ [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) ।
</details>

<details>
<summary><strong>azd ਦੀ ਵਰਤੋਂ ਕਰਨ ਦਾ ਖ਼ਰਚਾ ਕਿੰਨਾ ਹੈ?</strong></summary>

azd ਖੁਦ **ਬਿਲਕੁਲ ਮੁਫ਼ਤ** ਅਤੇ open-source ਹੈ। ਤੁਸੀਂ ਸਿਰਫ਼ ਇਸ ਲਈ ਭੁਗਤਾਨ ਕਰੋ ਗੇ:
- ਉਹ Azure ਰਿਸੋਰਸ ਜੋ ਤੁਸੀਂ ਡਿਪਲੋਇ ਕਰਦੇ ਹੋ
- Azure ਖਪਤ ਖਰਚੇ (compute, storage ਆਦਿ)

ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਲਾਗਤ ਦਾ ਅੰਦਾਜ਼ੇ ਲਗਾਉਣ ਲਈ `azd provision --preview` ਵਰਤੋ।
</details>

## ਅਗਲੇ ਕਦਮ

1. **ਪੂਰਾ ਪ੍ਰਮਾਣੀਕਰਨ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਸੀਂ ਆਪਣੀ Azure subscription ਤੱਕ ਪਹੁੰਚ ਰੱਖਦੇ ਹੋ
2. **ਆਪਣਾ ਪਹਿਲਾ ਡਿਪਲੋਇਮੈਂਟ ਕਰਕੇ ਦੇਖੋ**: [ਪਹਿਲਾ ਪ੍ਰਾਜੈਕਟ ਗਾਈਡ](first-project.md) ਦੀ ਪਾਲਣਾ ਕਰੋ
3. **ਟੈਮਪਲੇਟ ਐਕਸਪਲੋਰ ਕਰੋ**: `azd template list` ਨਾਲ ਉਪਲਬਧ ਟੈਮਪਲੇਟ ਵੇਖੋ
4. **ਆਪਣੇ IDE ਨੂੰ ਕਾਂਫਿਗਰ ਕਰੋ**: ਆਪਣੇ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਨੂੰ ਸੈਟਅਪ ਕਰੋ

## ਸਹਾਇਤਾ

ਜੇ ਤੁਹਾਨੂੰ ਮੁਸ਼ਕਿਲਾਂ ਆਉਂਦੀਆਂ ਹਨ:
- [ਆਧਿਕਾਰਿਕ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ਇਸ਼ੂ ਰਿਪੋਰਟ ਕਰੋ](https://github.com/Azure/azure-dev/issues)
- [ਕਮਿਊਨਿਟੀ ਚਰਚਾ](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - ਆਪਣੇ ਐਡੀਟਰ ਵਿਚ ਸਿੱਧਾ Azure ਕਮਾਂਡ ਮਦਦ ਲਈ `npx skills add microsoft/github-copilot-for-azure` ਲਗਾਓ

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: Chapter 1 - Foundation & Quick Start
- **⬅️ ਪਿਛਲਾ**: [AZD ਮੂਲ ਭੂਤ](azd-basics.md) 
- **➡️ ਅਗਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰਾਜੈਕਟ](first-project.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ਇੰਸਟਾਲੇਸ਼ਨ ਪੂਰਾ!** azd ਨਾਲ ਬਣਾਉਣ ਦੀ ਸ਼ੁਰੂਆਤ ਕਰਨ ਲਈ [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰਾਜੈਕਟ](first-project.md) ਨੂੰ ਜਾਰੀ ਰੱਖੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਹ ਦਸਤਾਵੇਜ਼ [Co-op Translator](https://github.com/Azure/co-op-translator) ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਭੁੱਲਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼, ਜੋ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੈ, ਉਸਨੂੰ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਸੰਵੇਦਨਸ਼ੀਲ ਜਾਂ ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਉਤਪੰਨ ਕਿਸੇ ਵੀ ਗਲਤ-ਫਹਿਮੀ ਜਾਂ ਗਲਤ-ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->