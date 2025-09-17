<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T21:01:53+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "sv"
}
-->
# Installations- och konfigurationsguide

**Föregående:** [Huvuddokumentation](../../README.md) | **Nästa:** [AZD Grunder](azd-basics.md)

## Introduktion

Den här omfattande guiden hjälper dig att installera och konfigurera Azure Developer CLI (azd) på ditt system. Du kommer att lära dig olika installationsmetoder för olika operativsystem, autentiseringsinställningar och grundläggande konfiguration för att förbereda din utvecklingsmiljö för Azure-distributioner.

## Lärandemål

I slutet av denna lektion kommer du att:
- Framgångsrikt installera Azure Developer CLI på ditt operativsystem
- Konfigurera autentisering med Azure via flera metoder
- Ställa in din utvecklingsmiljö med nödvändiga förutsättningar
- Förstå olika installationsalternativ och när du ska använda dem
- Felsöka vanliga installations- och konfigurationsproblem

## Läranderesultat

Efter att ha avslutat denna lektion kommer du att kunna:
- Installera azd med rätt metod för din plattform
- Autentisera med Azure med hjälp av `azd auth login`
- Verifiera din installation och testa grundläggande azd-kommandon
- Konfigurera din utvecklingsmiljö för optimal användning av azd
- Självständigt lösa vanliga installationsproblem

Den här guiden hjälper dig att installera och konfigurera Azure Developer CLI på ditt system, oavsett operativsystem eller utvecklingsmiljö.

## Förutsättningar

Innan du installerar azd, se till att du har:
- **Azure-prenumeration** - [Skapa ett gratis konto](https://azure.microsoft.com/free/)
- **Azure CLI** - För autentisering och resursadministration
- **Git** - För att klona mallar och versionshantering
- **Docker** (valfritt) - För containerbaserade applikationer

## Installationsmetoder

### Windows

#### Alternativ 1: PowerShell (Rekommenderas)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Alternativ 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Alternativ 3: Chocolatey
```cmd
choco install azd
```

#### Alternativ 4: Manuell installation
1. Ladda ner den senaste versionen från [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrahera till `C:\Program Files\azd\`
3. Lägg till i PATH-miljövariabeln

### macOS

#### Alternativ 1: Homebrew (Rekommenderas)
```bash
brew tap azure/azd
brew install azd
```

#### Alternativ 2: Installationsskript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 3: Manuell installation
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Alternativ 1: Installationsskript (Rekommenderas)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Alternativ 2: Paketadministratörer

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

azd är förinstallerat i GitHub Codespaces. Skapa bara en codespace och börja använda azd direkt.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifiera installationen

Efter installationen, verifiera att azd fungerar korrekt:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Förväntad utdata:
```
azd version 1.5.0 (commit abc123)
```

## Autentiseringsinställningar

### Azure CLI-autentisering (Rekommenderas)
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

### Enhetskodautentisering
Om du använder ett system utan grafiskt gränssnitt eller har problem med webbläsaren:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
För automatiserade miljöer:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguration

### Global konfiguration
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Miljövariabler
Lägg till i din shell-profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE-integrering

### Visual Studio Code
Installera Azure Developer CLI-tillägget:
1. Öppna VS Code
2. Gå till Tillägg (Ctrl+Shift+X)
3. Sök efter "Azure Developer CLI"
4. Installera tillägget

Funktioner:
- IntelliSense för azure.yaml
- Integrerade terminalkommandon
- Mallbläddring
- Övervakning av distributioner

### GitHub Codespaces
Skapa en `.devcontainer/devcontainer.json`:
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
1. Installera Azure-plugin
2. Konfigurera Azure-uppgifter
3. Använd den integrerade terminalen för azd-kommandon

## 🐛 Felsökning av installation

### Vanliga problem

#### Åtkomst nekad (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH-problem
Lägg till azd manuellt i din PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Nätverks-/proxyproblem
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

### Få mer hjälp
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Uppdatera azd

### Automatiska uppdateringar
azd meddelar dig när uppdateringar är tillgängliga:
```bash
azd version --check-for-updates
```

### Manuella uppdateringar

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

## Nästa steg

1. **Slutför autentisering**: Se till att du kan komma åt din Azure-prenumeration
2. **Testa din första distribution**: Följ [Första projektguiden](first-project.md)
3. **Utforska mallar**: Bläddra bland tillgängliga mallar med `azd template list`
4. **Konfigurera din IDE**: Ställ in din utvecklingsmiljö

## Support

Om du stöter på problem:
- [Officiell dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Rapportera problem](https://github.com/Azure/azure-dev/issues)
- [Community-diskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Föregående:** [Huvuddokumentation](../../README.md) | **Nästa:** [AZD Grunder](azd-basics.md)

**Installation klar!** Fortsätt till [Ditt första projekt](first-project.md) för att börja bygga med azd.

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.