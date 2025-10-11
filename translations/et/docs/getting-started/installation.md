<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-10-11T16:08:51+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "et"
}
-->
# Paigaldus- ja seadistusjuhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD Algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused ja kiirstart
- **⬅️ Eelmine**: [AZD Põhitõed](azd-basics.md)
- **➡️ Järgmine**: [Sinu Esimene Projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-põhine arendus](../ai-foundry/azure-ai-foundry-integration.md)

## Sissejuhatus

See põhjalik juhend aitab sul paigaldada ja seadistada Azure Developer CLI (azd) oma süsteemis. Õpid erinevaid paigaldusmeetodeid erinevatele operatsioonisüsteemidele, autentimise seadistamist ja esmast konfiguratsiooni, et valmistada oma arenduskeskkond ette Azure'i juurutusteks.

## Õpieesmärgid

Selle õppetunni lõpuks suudad:
- Edukalt paigaldada Azure Developer CLI oma operatsioonisüsteemile
- Seadistada autentimise Azure'iga mitmel viisil
- Valmistada oma arenduskeskkonna ette vajalike eeldustega
- Mõista erinevaid paigaldusvõimalusi ja millal neid kasutada
- Lahendada levinud paigaldus- ja seadistusprobleeme

## Õpitulemused

Pärast selle õppetunni läbimist suudad:
- Paigaldada azd sobiva meetodiga oma platvormile
- Autentida Azure'iga, kasutades käsku azd auth login
- Kontrollida paigaldust ja testida põhilisi azd käske
- Konfigureerida oma arenduskeskkonda azd optimaalseks kasutamiseks
- Iseseisvalt lahendada levinud paigaldusprobleeme

See juhend aitab sul paigaldada ja seadistada Azure Developer CLI oma süsteemis, olenemata operatsioonisüsteemist või arenduskeskkonnast.

## Eeldused

Enne azd paigaldamist veendu, et sul on:
- **Azure'i tellimus** - [Loo tasuta konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Autentimiseks ja ressursside haldamiseks
- **Git** - Mallide kloonimiseks ja versioonihalduseks
- **Docker** (valikuline) - Konteineriseeritud rakenduste jaoks

## Paigaldusmeetodid

### Windows

#### Valik 1: PowerShell (soovitatav)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Valik 2: Windowsi pakettihaldur (winget)
```cmd
winget install Microsoft.Azd
```

#### Valik 3: Chocolatey
```cmd
choco install azd
```

#### Valik 4: Käsitsi paigaldamine
1. Laadi alla viimane versioon [GitHubist](https://github.com/Azure/azure-dev/releases)
2. Paki lahti kausta `C:\Program Files\azd\`
3. Lisa PATH keskkonnamuutujasse

### macOS

#### Valik 1: Homebrew (soovitatav)
```bash
brew tap azure/azd
brew install azd
```

#### Valik 2: Paigaldusskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Valik 3: Käsitsi paigaldamine
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Valik 1: Paigaldusskript (soovitatav)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Valik 2: Pakettihaldurid

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

azd on eelpaigaldatud GitHub Codespaces'is. Lihtsalt loo Codespace ja alusta azd kasutamist kohe.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Paigalduse kontrollimine

Pärast paigaldamist kontrolli, kas azd töötab korrektselt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Oodatav väljund:
```
azd version 1.5.0 (commit abc123)
```

## Autentimise seadistamine

### Azure CLI autentimine (soovitatav)
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

### Seadme koodi autentimine
Kui kasutad peata süsteemi või sul on probleeme brauseriga:
```bash
az login --use-device-code
```

### Teenusepõhimõte (CI/CD)
Automatiseeritud keskkondade jaoks:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguratsioon

### Üldine konfiguratsioon
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Keskkonnamuutujad
Lisa oma shelli profiili (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE integratsioon

### Visual Studio Code
Paigalda Azure Developer CLI laiendus:
1. Ava VS Code
2. Mine laienduste juurde (Ctrl+Shift+X)
3. Otsi "Azure Developer CLI"
4. Paigalda laiendus

Funktsioonid:
- IntelliSense azure.yaml jaoks
- Integreeritud terminali käsud
- Mallide sirvimine
- Juurutuse jälgimine

### GitHub Codespaces
Loo `.devcontainer/devcontainer.json`:
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
1. Paigalda Azure'i plugin
2. Konfigureeri Azure'i mandaadid
3. Kasuta integreeritud terminali azd käskude jaoks

## 🐛 Paigaldusprobleemide lahendamine

### Levinud probleemid

#### Luba keelatud (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH probleemid
Lisa azd käsitsi PATH-i:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Võrgu/proksi probleemid
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Versioonikonfliktid
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Kuidas saada rohkem abi
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd uuendamine

### Automaatne uuendamine
azd teavitab sind, kui uuendused on saadaval:
```bash
azd version --check-for-updates
```

### Käsitsi uuendamine

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

## Järgmised sammud

1. **Lõpeta autentimine**: Veendu, et sul on juurdepääs oma Azure'i tellimusele
2. **Proovi esimest juurutust**: Järgi [Esimese Projekti Juhendit](first-project.md)
3. **Uuri malle**: Sirvi saadaolevaid malle käsuga `azd template list`
4. **Konfigureeri oma IDE**: Seadista oma arenduskeskkond

## Tugi

Kui sul tekib probleeme:
- [Ametlik dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Teata probleemidest](https://github.com/Azure/azure-dev/issues)
- [Kogukonna arutelud](https://github.com/Azure/azure-dev/discussions)
- [Azure'i tugi](https://azure.microsoft.com/support/)

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD Algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused ja kiirstart
- **⬅️ Eelmine**: [AZD Põhitõed](azd-basics.md) 
- **➡️ Järgmine**: [Sinu Esimene Projekt](first-project.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-põhine arendus](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Paigaldus lõpetatud!** Jätka [Sinu Esimese Projektiga](first-project.md), et alustada azd-ga töötamist.

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.