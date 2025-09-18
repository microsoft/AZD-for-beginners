<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-18T06:51:49+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "nl"
}
-->
# Installatie- en Setupgids

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorige**: [AZD Basisprincipes](azd-basics.md)
- **➡️ Volgende**: [Je Eerste Project](first-project.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First Ontwikkeling](../ai-foundry/azure-ai-foundry-integration.md)

## Introductie

Deze uitgebreide gids begeleidt je bij het installeren en configureren van Azure Developer CLI (azd) op je systeem. Je leert verschillende installatiemethoden voor verschillende besturingssystemen, het instellen van authenticatie en de eerste configuratie om je ontwikkelomgeving klaar te maken voor Azure-implementaties.

## Leerdoelen

Aan het einde van deze les kun je:
- Azure Developer CLI succesvol installeren op je besturingssysteem
- Authenticatie met Azure configureren via verschillende methoden
- Je ontwikkelomgeving instellen met de benodigde vereisten
- Verschillende installatiemogelijkheden begrijpen en weten wanneer je welke moet gebruiken
- Veelvoorkomende installatie- en setupproblemen oplossen

## Leerresultaten

Na het voltooien van deze les kun je:
- azd installeren met de juiste methode voor jouw platform
- Authenticeren met Azure via `azd auth login`
- Je installatie verifiëren en basis azd-commando's testen
- Je ontwikkelomgeving configureren voor optimaal gebruik van azd
- Veelvoorkomende installatieproblemen zelfstandig oplossen

Deze gids helpt je bij het installeren en configureren van Azure Developer CLI op je systeem, ongeacht je besturingssysteem of ontwikkelomgeving.

## Vereisten

Voordat je azd installeert, zorg ervoor dat je beschikt over:
- **Azure-abonnement** - [Maak een gratis account aan](https://azure.microsoft.com/free/)
- **Azure CLI** - Voor authenticatie en resourcebeheer
- **Git** - Voor het klonen van templates en versiebeheer
- **Docker** (optioneel) - Voor containerapplicaties

## Installatiemethoden

### Windows

#### Optie 1: PowerShell (Aanbevolen)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Optie 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Optie 3: Chocolatey
```cmd
choco install azd
```

#### Optie 4: Handmatige Installatie
1. Download de nieuwste release van [GitHub](https://github.com/Azure/azure-dev/releases)
2. Pak uit naar `C:\Program Files\azd\`
3. Voeg toe aan de PATH-omgevingsvariabele

### macOS

#### Optie 1: Homebrew (Aanbevolen)
```bash
brew tap azure/azd
brew install azd
```

#### Optie 2: Installatiescript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Optie 3: Handmatige Installatie
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Optie 1: Installatiescript (Aanbevolen)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Optie 2: Pakketbeheerders

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

azd is vooraf geïnstalleerd in GitHub Codespaces. Maak eenvoudig een codespace aan en begin direct met azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Installatie Verifiëren

Na installatie, verifieer dat azd correct werkt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Verwachte output:
```
azd version 1.5.0 (commit abc123)
```

## Authenticatie Instellen

### Azure CLI Authenticatie (Aanbevolen)
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

### Device Code Authenticatie
Als je op een systeem zonder scherm werkt of browserproblemen hebt:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Voor geautomatiseerde omgevingen:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuratie

### Globale Configuratie
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Omgevingsvariabelen
Voeg toe aan je shell-profiel (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE Integratie

### Visual Studio Code
Installeer de Azure Developer CLI-extensie:
1. Open VS Code
2. Ga naar Extensies (Ctrl+Shift+X)
3. Zoek naar "Azure Developer CLI"
4. Installeer de extensie

Functies:
- IntelliSense voor azure.yaml
- Geïntegreerde terminalcommando's
- Template browsing
- Implementatiemonitoring

### GitHub Codespaces
Maak een `.devcontainer/devcontainer.json`:
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
1. Installeer de Azure-plugin
2. Configureer Azure-credentials
3. Gebruik de geïntegreerde terminal voor azd-commando's

## 🐛 Problemen Oplossen bij Installatie

### Veelvoorkomende Problemen

#### Toegang Geweigerd (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Problemen
Voeg azd handmatig toe aan je PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Netwerk-/Proxyproblemen
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Versieconflicten
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Meer Hulp Krijgen
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd Updaten

### Automatische Updates
azd geeft een melding wanneer er updates beschikbaar zijn:
```bash
azd version --check-for-updates
```

### Handmatige Updates

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

## Volgende Stappen

1. **Voltooi authenticatie**: Zorg ervoor dat je toegang hebt tot je Azure-abonnement
2. **Probeer je eerste implementatie**: Volg de [Eerste Projectgids](first-project.md)
3. **Verken templates**: Bekijk beschikbare templates met `azd template list`
4. **Configureer je IDE**: Stel je ontwikkelomgeving in

## Ondersteuning

Als je problemen ondervindt:
- [Officiële Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Problemen Melden](https://github.com/Azure/azure-dev/issues)
- [Community Discussies](https://github.com/Azure/azure-dev/discussions)
- [Azure Ondersteuning](https://azure.microsoft.com/support/)

---

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorige**: [AZD Basisprincipes](azd-basics.md) 
- **➡️ Volgende**: [Je Eerste Project](first-project.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First Ontwikkeling](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Installatie Voltooid!** Ga verder naar [Je Eerste Project](first-project.md) om te beginnen met bouwen met azd.

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.