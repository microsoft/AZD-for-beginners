<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T22:41:01+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "hr"
}
-->
# Vodič za instalaciju i postavljanje

**Prethodno:** [Glavna dokumentacija](../../README.md) | **Sljedeće:** [Osnove AZD-a](azd-basics.md)

## Uvod

Ovaj detaljan vodič će vas provesti kroz proces instalacije i konfiguracije Azure Developer CLI (azd) na vašem sustavu. Naučit ćete različite metode instalacije za različite operativne sustave, postavljanje autentifikacije i početnu konfiguraciju kako biste pripremili razvojno okruženje za implementaciju na Azure.

## Ciljevi učenja

Na kraju ove lekcije, moći ćete:
- Uspješno instalirati Azure Developer CLI na vaš operativni sustav
- Konfigurirati autentifikaciju s Azureom koristeći različite metode
- Postaviti razvojno okruženje s potrebnim preduvjetima
- Razumjeti različite opcije instalacije i kada ih koristiti
- Rješavati uobičajene probleme s instalacijom i postavljanjem

## Ishodi učenja

Nakon završetka ove lekcije, bit ćete sposobni:
- Instalirati azd koristeći odgovarajuću metodu za vašu platformu
- Autentificirati se s Azureom koristeći `azd auth login`
- Provjeriti instalaciju i testirati osnovne azd naredbe
- Konfigurirati razvojno okruženje za optimalno korištenje azd-a
- Samostalno rješavati uobičajene probleme s instalacijom

Ovaj vodič će vam pomoći da instalirate i konfigurirate Azure Developer CLI na vašem sustavu, bez obzira na operativni sustav ili razvojno okruženje.

## Preduvjeti

Prije instalacije azd-a, osigurajte da imate:
- **Azure pretplatu** - [Kreirajte besplatni račun](https://azure.microsoft.com/free/)
- **Azure CLI** - Za autentifikaciju i upravljanje resursima
- **Git** - Za kloniranje predložaka i kontrolu verzija
- **Docker** (opcionalno) - Za aplikacije u kontejnerima

## Metode instalacije

### Windows

#### Opcija 1: PowerShell (Preporučeno)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opcija 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opcija 3: Chocolatey
```cmd
choco install azd
```

#### Opcija 4: Ručna instalacija
1. Preuzmite najnoviju verziju s [GitHub-a](https://github.com/Azure/azure-dev/releases)
2. Ekstrahirajte u `C:\Program Files\azd\`
3. Dodajte u PATH varijablu okruženja

### macOS

#### Opcija 1: Homebrew (Preporučeno)
```bash
brew tap azure/azd
brew install azd
```

#### Opcija 2: Instalacijski skript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcija 3: Ručna instalacija
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opcija 1: Instalacijski skript (Preporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcija 2: Paketni menadžeri

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

azd dolazi unaprijed instaliran u GitHub Codespaces. Jednostavno kreirajte codespace i odmah počnite koristiti azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Provjera instalacije

Nakon instalacije, provjerite radi li azd ispravno:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Očekivani izlaz:
```
azd version 1.5.0 (commit abc123)
```

## Postavljanje autentifikacije

### Autentifikacija putem Azure CLI-a (Preporučeno)
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

### Autentifikacija putem koda uređaja
Ako koristite sustav bez grafičkog sučelja ili imate problema s preglednikom:
```bash
az login --use-device-code
```

### Servisni principal (CI/CD)
Za automatizirana okruženja:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguracija

### Globalna konfiguracija
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Varijable okruženja
Dodajte u svoj shell profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Integracija s IDE-om

### Visual Studio Code
Instalirajte ekstenziju za Azure Developer CLI:
1. Otvorite VS Code
2. Idite na Ekstenzije (Ctrl+Shift+X)
3. Potražite "Azure Developer CLI"
4. Instalirajte ekstenziju

Značajke:
- IntelliSense za azure.yaml
- Integrirane terminalske naredbe
- Pregled predložaka
- Praćenje implementacije

### GitHub Codespaces
Kreirajte `.devcontainer/devcontainer.json`:
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
1. Instalirajte Azure plugin
2. Konfigurirajte Azure vjerodajnice
3. Koristite integrirani terminal za azd naredbe

## 🐛 Rješavanje problema s instalacijom

### Uobičajeni problemi

#### Dozvola odbijena (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemi s PATH-om
Ručno dodajte azd u PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problemi s mrežom/proxyjem
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Sukobi verzija
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Dobivanje dodatne pomoći
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Ažuriranje azd-a

### Automatska ažuriranja
azd će vas obavijestiti kada su dostupna ažuriranja:
```bash
azd version --check-for-updates
```

### Ručna ažuriranja

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

## Sljedeći koraci

1. **Dovršite autentifikaciju**: Osigurajte pristup svojoj Azure pretplati
2. **Isprobajte svoju prvu implementaciju**: Slijedite [Vodič za prvi projekt](first-project.md)
3. **Istražite predloške**: Pregledajte dostupne predloške s `azd template list`
4. **Konfigurirajte svoj IDE**: Postavite razvojno okruženje

## Podrška

Ako naiđete na probleme:
- [Službena dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijavite probleme](https://github.com/Azure/azure-dev/issues)
- [Rasprave u zajednici](https://github.com/Azure/azure-dev/discussions)
- [Azure podrška](https://azure.microsoft.com/support/)

---

**Prethodno:** [Glavna dokumentacija](../../README.md) | **Sljedeće:** [Osnove AZD-a](azd-basics.md)

**Instalacija dovršena!** Nastavite na [Vaš prvi projekt](first-project.md) kako biste započeli rad s azd-om.

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.