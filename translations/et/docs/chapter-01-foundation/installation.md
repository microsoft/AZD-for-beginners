# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alus & Kiire algus
- **⬅️ Previous**: [AZD alused](azd-basics.md)
- **➡️ Next**: [Teie esimene projekt](first-project.md)
- **🚀 Next Chapter**: [Peatükk 2: AI-esmane arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

See põhjalik juhend juhendab teid Azure Developer CLI (azd) installimisel ja konfigureerimisel teie süsteemis. Õppisite mitmeid installimeetodeid erinevateks operatsioonisüsteemideks, autentimise seadistamist ja esialgset konfiguratsiooni, et valmistada teie arenduskeskkond Azure'i juurutusteks.

## Learning Goals

Selle tunni lõpuks te:
- Installite edukalt Azure Developer CLI oma operatsioonisüsteemile
- Konfigureerite autentimise Azure'iga mitme meetodiga
- Seate üles oma arenduskeskkonna vajalikud eeltingimused
- Mõistate erinevaid installimisvalikuid ja millal igaüht kasutada
- Lahendate levinumaid installi- ja seadistusprobleeme

## Learning Outcomes

Pärast selle tunni lõpetamist oskate:
- Installida azd sobiva meetodiga teie platvormil
- Autentida Azure'iga kasutades azd auth login
- Kontrollida paigaldust ja testida põhilisi azd käske
- Konfigureerida oma arenduskeskkonda optimaalseks azd kasutamiseks
- Iseseisvalt lahendada levinumaid installiprobleeme

See juhend aitab teil installida ja konfigureerida Azure Developer CLI teie süsteemi, sõltumata teie operatsioonisüsteemist või arenduskeskkonnast.

## Prerequisites

Enne azd installimist veenduge, et teil on:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Autentimiseks ja ressursside haldamiseks
- **Git** - Mallide kloonimiseks ja versioonihalduseks
- **Docker** (valikuline) - Kontextneeritud rakenduste jaoks

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Käivita administraatorina või kõrgendatud õigustega
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Laadige alla viimane väljaanne [GitHubist](https://github.com/Azure/azure-dev/releases)
2. Pakige lahti kataloogi `C:\Program Files\azd\`
3. Lisage PATH keskkonnamuutuja

### macOS

#### Option 1: Homebrew (Recommended)
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
# Laadi alla ja paigalda
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Lisa Microsofti pakettide hoidla
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Paigalda azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Lisa Microsofti pakettide hoidla
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd on GitHub Codespaces'is eelinstallitud. Looge lihtsalt codespace ja alustage azd kasutamist kohe.

### Docker

```bash
# Käivita azd konteineris
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Loo alias mugavamaks kasutamiseks
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

Pärast installi veenduge, et azd töötab õigesti:

```bash
# Kontrolli versiooni
azd version

# Kuva abi
azd --help

# Loetle saadaolevad mallid
azd template list
```

Oodatav väljund:
```
azd version 1.x.x (commit xxxxxx)
```

**Märkus**: Tegelik versiooninumber võib erineda. Kontrollige [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) viimast versiooni.

**✅ Paigalduse õnnestumise kontrollnimekiri:**
- [ ] `azd version` näitab versiooninumbrit ilma vigadeta
- [ ] `azd --help` kuvab käsu dokumentatsiooni
- [ ] `azd template list` näitab saadaolevaid malle
- [ ] `az account show` kuvab teie Azure tellimuse
- [ ] Saate luua testkataloogi ja käivitada `azd init` edukalt

**Kui kõik kontrollid õnnestuvad, olete valmis jätkama juhendiga [Teie esimene projekt](first-project.md)!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# Paigalda Azure CLI, kui see pole veel installitud
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Logi sisse Azure'i
az login

# Kontrolli autentimist
az account show
```

### Device Code Authentication
Kui olete peata süsteemis või teil on brauseriga probleeme:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Automatiseeritud keskkondade jaoks:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuration

### Global Configuration
```bash
# Määra vaikimisi tellimus
azd config set defaults.subscription <subscription-id>

# Määra vaikimisi asukoht
azd config set defaults.location eastus2

# Kuva kogu konfiguratsioon
azd config list
```

### Environment Variables
Lisage oma shelli profiili (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure'i konfiguratsioon
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfiguratsioon
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Luba silumise logimine
```

## IDE Integration

### Visual Studio Code
Installige Azure Developer CLI laiendus:
1. Avage VS Code
2. Minge laienduste juurde (Ctrl+Shift+X)
3. Otsige "Azure Developer CLI"
4. Installige laiendus

Funktsioonid:
- IntelliSense azure.yaml jaoks
- Integreeritud terminali käsud
- Mallide sirvimine
- Juurutuse jälgimine

### GitHub Codespaces
Looge `.devcontainer/devcontainer.json`:
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
1. Installige Azure plugin
2. Konfigureerige Azure volikirjad
3. Kasutage integreeritud terminali azd käskude jaoks

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# Käivita PowerShell administraatorina
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
Lisage azd käsitsi oma PATH-i:

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
# Seadista puhverserver
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Jäta SSL-i kinnitamine vahele (ei ole soovitatav tootmiskeskkonnas)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Eemalda vanad installatsioonid
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Puhasta konfiguratsioon
rm -rf ~/.azd
```

### Getting More Help
```bash
# Luba silumise logimine
export AZD_DEBUG=true
azd <command> --debug

# Kuva praegust konfiguratsiooni
azd config list

# Kuva praegust juurutamise olekut
azd show
```

## Updating azd

### Automatic Updates
azd annab teile teada, kui värskendused on saadaval:
```bash
azd version --check-for-updates
```

### Manual Updates

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

## 💡 Frequently Asked Questions

<details>
<summary><strong>Mis vahe on azd ja az CLI vahel?</strong></summary>

**Azure CLI (az)**: Madala taseme tööriist üksikute Azure'i ressursside haldamiseks
- `az webapp create`, `az storage account create`
- Üks ressurss korraga
- Infrastruktuuri halduse fookus

**Azure Developer CLI (azd)**: Kõrgetasemeline tööriist terviklikeks rakenduste juurutusteks
- `azd up` juurutab kogu rakenduse koos kõigi ressurssidega
- Mallipõhised töövood
- Arendaja tootlikkuse fookus

**Vaja on mõlemat**: azd kasutab autentimiseks az CLI-d
</details>

<details>
<summary><strong>Kas ma saan kasutada azd olemasolevate Azure'i ressurssidega?</strong></summary>

Jah! Te saate:
1. Impordida olemasolevad ressursid azd keskkondadesse
2. Viidata olemasolevatele ressurssidele oma Bicep mallides
3. Kasutada azd uusi juurutusi koos olemasoleva infrastruktuuriga

Vaata [Seadistuse juhend](configuration.md) üksikasjade jaoks.
</details>

<details>
<summary><strong>Kas azd töötab Azure Governmenti või Azure China'ga?</strong></summary>

Jah, seadistage pilv:
```bash
# Azure valitsus
az cloud set --name AzureUSGovernment
az login

# Azure Hiina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kas saan kasutada azd CI/CD torudes?</strong></summary>

Absoluutselt! azd on loodud automatiseerimiseks:
- GitHub Actions integratsioon
- Azure DevOpsi tugi
- Service principal autentimine
- Mitte-interaktiivne režiim

Vaata [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md) CI/CD mustrite kohta.
</details>

<details>
<summary><strong>Mis on azd kasutamise maksumus?</strong></summary>

azd ise on **täiesti tasuta** ja avatud lähtekoodiga. Te maksate ainult:
- Azure ressursid, mida te juurutate
- Azure tarbimise kulud (compute, storage jne)

Kasutage `azd provision --preview`, et hinnata kulusid enne juurutamist.
</details>

## Next Steps

1. **Viige autentimine lõpule**: Veenduge, et pääsete ligi oma Azure tellimusele
2. **Proovige oma esimest juurutust**: Järgige [Esimese projekti juhend](first-project.md)
3. **Uurige malle**: Sirvige saadaolevaid malle käsuga `azd template list`
4. **Konfigureerige oma IDE**: Seadistage oma arenduskeskkond

## Support

Kui teil tekib probleeme:
- [Ametlik dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alus & Kiire algus
- **⬅️ Previous**: [AZD alused](azd-basics.md) 
- **➡️ Next**: [Teie esimene projekt](first-project.md)
- **🚀 Next Chapter**: [Peatükk 2: AI-esmane arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Paigaldus lõpetatud!** Jätkake [Teie esimene projekt](first-project.md), et alustada azd-ga ehitamist.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Lahtiütlus:
Seda dokumenti on tõlgitud tehisintellektil põhineva tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsuse, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega valede tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->