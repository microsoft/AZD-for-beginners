<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-09T21:27:21+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "da"
}
-->
# Installations- og opsætningsguide

## Introduktion

Denne omfattende guide vil føre dig gennem installation og konfiguration af Azure Developer CLI (azd) på dit system. Du vil lære flere installationsmetoder til forskellige operativsystemer, opsætning af autentifikation og den indledende konfiguration, der forbereder dit udviklingsmiljø til Azure-udrulninger.

## Læringsmål

Ved afslutningen af denne lektion vil du:
- Have succesfuldt installeret Azure Developer CLI på dit operativsystem
- Konfigureret autentifikation med Azure ved hjælp af flere metoder
- Opsat dit udviklingsmiljø med nødvendige forudsætninger
- Forstået forskellige installationsmuligheder og hvornår de skal bruges
- Kunne fejlfinde almindelige installations- og opsætningsproblemer

## Læringsresultater

Efter at have gennemført denne lektion vil du være i stand til at:
- Installere azd ved hjælp af den passende metode til din platform
- Autentificere med Azure ved hjælp af `azd auth login`
- Verificere din installation og teste grundlæggende azd-kommandoer
- Konfigurere dit udviklingsmiljø for optimal brug af azd
- Løse almindelige installationsproblemer selvstændigt

Denne guide vil hjælpe dig med at installere og konfigurere Azure Developer CLI på dit system, uanset dit operativsystem eller udviklingsmiljø.

## Forudsætninger

Før du installerer azd, skal du sikre dig, at du har:
- **Azure-abonnement** - [Opret en gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Til autentifikation og ressourcehåndtering
- **Git** - Til kloning af skabeloner og versionskontrol
- **Docker** (valgfrit) - Til containeriserede applikationer

## Installationsmetoder

### Windows

#### Mulighed 1: PowerShell (Anbefalet)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Mulighed 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Mulighed 3: Chocolatey
```cmd
choco install azd
```

#### Mulighed 4: Manuel installation
1. Download den seneste udgivelse fra [GitHub](https://github.com/Azure/azure-dev/releases)
2. Udpak til `C:\Program Files\azd\`
3. Tilføj til PATH-miljøvariablen

### macOS

#### Mulighed 1: Homebrew (Anbefalet)
```bash
brew tap azure/azd
brew install azd
```

#### Mulighed 2: Installationsscript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Mulighed 3: Manuel installation
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Mulighed 1: Installationsscript (Anbefalet)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Mulighed 2: Pakkehåndteringssystemer

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

azd er forudinstalleret i GitHub Codespaces. Opret blot en codespace og begynd at bruge azd med det samme.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificer installation

Efter installationen skal du verificere, at azd fungerer korrekt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Forventet output:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 Opsætning af autentifikation

### Azure CLI-autentifikation (Anbefalet)
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

### Enhedskode-autentifikation
Hvis du bruger et system uden skærm eller har browserproblemer:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Til automatiserede miljøer:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ Konfiguration

### Global konfiguration
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Miljøvariabler
Tilføj til din shell-profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 IDE-integration

### Visual Studio Code
Installer Azure Developer CLI-udvidelsen:
1. Åbn VS Code
2. Gå til Udvidelser (Ctrl+Shift+X)
3. Søg efter "Azure Developer CLI"
4. Installer udvidelsen

Funktioner:
- IntelliSense til azure.yaml
- Integrerede terminalkommandoer
- Skabelonbrowsing
- Overvågning af udrulninger

### GitHub Codespaces
Opret en `.devcontainer/devcontainer.json`:
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
1. Installer Azure-pluginet
2. Konfigurer Azure-legitimationsoplysninger
3. Brug den integrerede terminal til azd-kommandoer

## 🐛 Fejlfinding af installation

### Almindelige problemer

#### Tilladelse nægtet (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-problemer
Tilføj azd manuelt til din PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Netværks-/proxyproblemer
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Versionskonflikter
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Få mere hjælp
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Opdatering af azd

### Automatiske opdateringer
azd vil give dig besked, når opdateringer er tilgængelige:
```bash
azd version --check-for-updates
```

### Manuelle opdateringer

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

## Næste trin

1. **Fuldfør autentifikation**: Sørg for, at du kan få adgang til dit Azure-abonnement
2. **Prøv din første udrulning**: Følg [Første projekt-guide](first-project.md)
3. **Udforsk skabeloner**: Gennemse tilgængelige skabeloner med `azd template list`
4. **Konfigurer din IDE**: Opsæt dit udviklingsmiljø

## Support

Hvis du støder på problemer:
- [Officiel dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapportér problemer](https://github.com/Azure/azure-dev/issues)
- [Community-diskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Navigation**
- **Forrige lektion**: [AZD Basics](azd-basics.md)
- **Næste lektion**: [Konfiguration](configuration.md)

**Installation fuldført!** Fortsæt til [Dit første projekt](first-project.md) for at begynde at bygge med azd.

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at sikre nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.