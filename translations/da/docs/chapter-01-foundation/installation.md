# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD for begyndere](../../README.md)
- **📖 Current Chapter**: Kapitel 1 - Fundament & Hurtig start
- **⬅️ Previous**: [AZD Grundlæggende](azd-basics.md)
- **➡️ Next**: [Dit første projekt](first-project.md)
- **🚀 Next Chapter**: [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Denne omfattende guide vil føre dig gennem installation og konfiguration af Azure Developer CLI (azd) på dit system. Du lærer flere installationsmetoder for forskellige operativsystemer, opsætning af autentificering og initial konfiguration for at forberede dit udviklingsmiljø til Azure-udrulninger.

## Learning Goals

Når du er færdig med denne lektion, vil du:
- Installere Azure Developer CLI på dit operativsystem med succes
- Konfigurere autentificering med Azure ved hjælp af flere metoder
- Sætte dit udviklingsmiljø op med nødvendige forudsætninger
- Forstå forskellige installationsmuligheder og hvornår hver skal bruges
- Fejlsøge almindelige installations- og opsætningsproblemer

## Learning Outcomes

Efter at have gennemført denne lektion vil du kunne:
- Installere azd ved hjælp af den passende metode til din platform
- Autentificere med Azure ved hjælp af azd auth login
- Bekræfte din installation og teste grundlæggende azd-kommandoer
- Konfigurere dit udviklingsmiljø til optimal azd-brug
- Løse almindelige installationsproblemer på egen hånd

Denne guide hjælper dig med at installere og konfigurere Azure Developer CLI på dit system, uanset dit operativsystem eller udviklingsmiljø.

## Prerequisites

Før du installerer azd, skal du sikre dig, at du har:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Til autentificering og ressourcestyring
- **Git** - Til at klone skabeloner og versionsstyring
- **Docker** (valgfrit) - Til containeriserede applikationer

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Kør som administrator eller med forhøjede rettigheder
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
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

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
# Hent og installer
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
# Tilføj Microsofts pakkearkiv
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installer azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Tilføj Microsoft-pakkearkiv
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd kommer forudinstalleret i GitHub Codespaces. Opret blot en codespace og begynd at bruge azd med det samme.

### Docker

```bash
# Kør azd i en container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Opret et alias for nemmere brug
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

Efter installationen, bekræft at azd fungerer korrekt:

```bash
# Kontroller version
azd version

# Vis hjælp
azd --help

# Vis tilgængelige skabeloner
azd template list
```

Forventet output:
```
azd version 1.x.x (commit xxxxxx)
```

**Note**: Versionsnummeret vil variere. Tjek [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for den seneste version.

**✅ Installation Success Checklist:**
- [ ] `azd version` viser versionsnummer uden fejl
- [ ] `azd --help` viser kommando-dokumentation
- [ ] `azd template list` viser tilgængelige skabeloner
- [ ] `az account show` viser din Azure-abonnement
- [ ] Du kan oprette en testmappe og køre `azd init` med succes

**Hvis alle tjek passerer, er du klar til at fortsætte til [Dit første projekt](first-project.md)!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# Installer Azure CLI, hvis det ikke allerede er installeret
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Log ind på Azure
az login

# Bekræft autentificering
az account show
```

### Device Code Authentication
Hvis du er på et headless-system eller har browserproblemer:
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

## Configuration

### Global Configuration
```bash
# Angiv standardabonnement
azd config set defaults.subscription <subscription-id>

# Angiv standardplacering
azd config set defaults.location eastus2

# Vis alle konfigurationer
azd config list
```

### Environment Variables
Tilføj til din shell-profil (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure-konfiguration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd-konfiguration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktivér debug-logning
```

## IDE Integration

### Visual Studio Code
Installer Azure Developer CLI-udvidelsen:
1. Åbn VS Code
2. Gå til Extensions (Ctrl+Shift+X)
3. Søg efter "Azure Developer CLI"
4. Installer udvidelsen

Funktioner:
- IntelliSense til azure.yaml
- Integrerede terminalkommandoer
- Gennemse skabeloner
- Overvågning af udrulning

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

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# Kør PowerShell som administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
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

#### Network/Proxy Issues
```bash
# Konfigurer proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Spring SSL-verifikation over (anbefales ikke i produktion)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Fjern gamle installationer
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Ryd konfigurationen
rm -rf ~/.azd
```

### Getting More Help
```bash
# Aktivér fejlsøgningslogning
export AZD_DEBUG=true
azd <command> --debug

# Vis aktuel konfiguration
azd config list

# Vis aktuel udrulningsstatus
azd show
```

## Updating azd

### Automatic Updates
azd vil underrette dig, når opdateringer er tilgængelige:
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
<summary><strong>Hvad er forskellen mellem azd og az CLI?</strong></summary>

**Azure CLI (az)**: Lavniveauværktøj til at administrere individuelle Azure-ressourcer
- `az webapp create`, `az storage account create`
- Én ressource ad gangen
- Fokus på infrastrukturstyring

**Azure Developer CLI (azd)**: Høj-niveau værktøj til komplette applikationsudrulninger
- `azd up` udruller hele appen med alle ressourcer
- Skabelon-baserede workflows
- Fokus på udviklerproduktivitet

**Du har brug for begge**: azd bruger az CLI til autentificering
</details>

<details>
<summary><strong>Kan jeg bruge azd med eksisterende Azure-ressourcer?</strong></summary>

Ja! Du kan:
1. Importere eksisterende ressourcer ind i azd-miljøer
2. Referere eksisterende ressourcer i dine Bicep-skabeloner
3. Bruge azd til nye udrulninger sammen med eksisterende infrastruktur

Se [Konfigurationsguide](configuration.md) for detaljer.
</details>

<details>
<summary><strong>Virker azd med Azure Government eller Azure China?</strong></summary>

Ja, konfigurer clouden:
```bash
# Azure Regering
az cloud set --name AzureUSGovernment
az login

# Azure Kina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Kan jeg bruge azd i CI/CD pipelines?</strong></summary>

Absolut! azd er designet til automatisering:
- GitHub Actions-integration
- Azure DevOps-understøttelse
- Service principal-autentificering
- Ikke-interaktiv tilstand

Se [Udrulningsguide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD-mønstre.
</details>

<details>
<summary><strong>Hvad koster det at bruge azd?</strong></summary>

azd i sig selv er **fuldstændig gratis** og open source. Du betaler kun for:
- Azure-ressourcer, du udruller
- Azure-forbrug (compute, storage osv.)

Brug `azd provision --preview` til at estimere omkostninger før udrulning.
</details>

## Next Steps

1. **Fuldfør autentificeringen**: Sørg for, at du kan få adgang til dit Azure-abonnement
2. **Prøv din første udrulning**: Følg [Første projektguide](first-project.md)
3. **Udforsk skabeloner**: Gennemse tilgængelige skabeloner med `azd template list`
4. **Konfigurer dit IDE**: Sæt dit udviklingsmiljø op

## Support

Hvis du støder på problemer:
- [Officiel dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Indberet problemer](https://github.com/Azure/azure-dev/issues)
- [Fællesskabsdiskussioner](https://github.com/Azure/azure-dev/discussions)
- [Azure-support](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD for begyndere](../../README.md)
- **📖 Current Chapter**: Kapitel 1 - Fundament & Hurtig start
- **⬅️ Previous**: [AZD Grundlæggende](azd-basics.md) 
- **➡️ Next**: [Dit første projekt](first-project.md)
- **🚀 Next Chapter**: [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** Fortsæt til [Dit første projekt](first-project.md) for at begynde at bygge med azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. Til kritisk information anbefales en professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->