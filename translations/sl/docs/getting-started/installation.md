<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T22:44:55+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "sl"
}
-->
# Navodila za namestitev in nastavitev

**Prejšnje:** [Glavna dokumentacija](../../README.md) | **Naslednje:** [Osnove AZD](azd-basics.md)

## Uvod

Ta obsežen vodič vas bo popeljal skozi postopek namestitve in konfiguracije Azure Developer CLI (azd) na vašem sistemu. Spoznali boste različne metode namestitve za različne operacijske sisteme, nastavitev avtentikacije in začetno konfiguracijo, da pripravite svoje razvojno okolje za uvajanje v Azure.

## Cilji učenja

Do konca te lekcije boste:
- Uspešno namestili Azure Developer CLI na vaš operacijski sistem
- Konfigurirali avtentikacijo z Azure z več metodami
- Nastavili svoje razvojno okolje z vsemi potrebnimi predpogoji
- Razumeli različne možnosti namestitve in kdaj uporabiti posamezno
- Rešili pogoste težave pri namestitvi in nastavitvi

## Rezultati učenja

Po zaključku te lekcije boste sposobni:
- Namestiti azd z ustrezno metodo za vašo platformo
- Avtenticirati z Azure z ukazom `azd auth login`
- Preveriti namestitev in preizkusiti osnovne ukaze azd
- Konfigurirati svoje razvojno okolje za optimalno uporabo azd
- Samostojno reševati pogoste težave pri namestitvi

Ta vodič vam bo pomagal namestiti in konfigurirati Azure Developer CLI na vašem sistemu, ne glede na operacijski sistem ali razvojno okolje.

## Predpogoji

Pred namestitvijo azd poskrbite, da imate:
- **Azure naročnino** - [Ustvarite brezplačen račun](https://azure.microsoft.com/free/)
- **Azure CLI** - Za avtentikacijo in upravljanje virov
- **Git** - Za kloniranje predlog in nadzor različic
- **Docker** (neobvezno) - Za aplikacije v kontejnerjih

## Metode namestitve

### Windows

#### Možnost 1: PowerShell (Priporočeno)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnost 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Možnost 3: Chocolatey
```cmd
choco install azd
```

#### Možnost 4: Ročna namestitev
1. Prenesite najnovejšo izdajo z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Razpakirajte v `C:\Program Files\azd\`
3. Dodajte v okoljsko spremenljivko PATH

### macOS

#### Možnost 1: Homebrew (Priporočeno)
```bash
brew tap azure/azd
brew install azd
```

#### Možnost 2: Namestitveni skript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 3: Ročna namestitev
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Možnost 1: Namestitveni skript (Priporočeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 2: Upravljalniki paketov

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

azd je že prednameščen v GitHub Codespaces. Preprosto ustvarite codespace in takoj začnite uporabljati azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Preverjanje namestitve

Po namestitvi preverite, ali azd deluje pravilno:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Pričakovani izhod:
```
azd version 1.5.0 (commit abc123)
```

## Nastavitev avtentikacije

### Avtentikacija prek Azure CLI (Priporočeno)
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

### Avtentikacija z napravo
Če uporabljate sistem brez zaslona ali imate težave z brskalnikom:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Za avtomatizirana okolja:
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

### Okoljske spremenljivke
Dodajte v profil lupine (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Integracija z IDE

### Visual Studio Code
Namestite razširitev Azure Developer CLI:
1. Odprite VS Code
2. Pojdite na razširitve (Ctrl+Shift+X)
3. Poiščite "Azure Developer CLI"
4. Namestite razširitev

Funkcije:
- IntelliSense za azure.yaml
- Integrirani ukazi v terminalu
- Brskanje po predlogah
- Spremljanje uvajanja

### GitHub Codespaces
Ustvarite `.devcontainer/devcontainer.json`:
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
1. Namestite vtičnik Azure
2. Konfigurirajte Azure poverilnice
3. Uporabite integrirani terminal za ukaze azd

## 🐛 Odpravljanje težav pri namestitvi

### Pogoste težave

#### Zavrnjen dostop (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Težave s PATH
Ročno dodajte azd v PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Težave z omrežjem/proxyjem
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Konflikti različic
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Pridobivanje dodatne pomoči
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Posodabljanje azd

### Samodejne posodobitve
azd vas bo obvestil, ko bodo na voljo posodobitve:
```bash
azd version --check-for-updates
```

### Ročne posodobitve

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

## Naslednji koraki

1. **Dokončajte avtentikacijo**: Poskrbite, da imate dostop do svoje Azure naročnine
2. **Preizkusite prvo uvajanje**: Sledite [Vodiču za prvi projekt](first-project.md)
3. **Raziskujte predloge**: Brskajte po razpoložljivih predlogah z `azd template list`
4. **Konfigurirajte svoj IDE**: Nastavite svoje razvojno okolje

## Podpora

Če naletite na težave:
- [Uradna dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Prijava težav](https://github.com/Azure/azure-dev/issues)
- [Skupnostne razprave](https://github.com/Azure/azure-dev/discussions)
- [Azure podpora](https://azure.microsoft.com/support/)

---

**Prejšnje:** [Glavna dokumentacija](../../README.md) | **Naslednje:** [Osnove AZD](azd-basics.md)

**Namestitev zaključena!** Nadaljujte na [Vaš prvi projekt](first-project.md) in začnite graditi z azd.

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.