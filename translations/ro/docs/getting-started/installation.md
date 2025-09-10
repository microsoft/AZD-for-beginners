<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-10T06:03:52+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "ro"
}
-->
# Ghid de instalare și configurare

## Introducere

Acest ghid cuprinzător te va ghida prin procesul de instalare și configurare a Azure Developer CLI (azd) pe sistemul tău. Vei învăța metode multiple de instalare pentru diferite sisteme de operare, configurarea autentificării și setările inițiale pentru a pregăti mediul de dezvoltare pentru implementările Azure.

## Obiective de învățare

La finalul acestei lecții, vei:
- Instala cu succes Azure Developer CLI pe sistemul tău de operare
- Configura autentificarea cu Azure folosind metode multiple
- Configura mediul de dezvoltare cu cerințele necesare
- Înțelege diferitele opțiuni de instalare și când să le folosești
- Depana problemele comune de instalare și configurare

## Rezultate de învățare

După finalizarea acestei lecții, vei putea:
- Instala azd folosind metoda potrivită pentru platforma ta
- Autentifica cu Azure folosind `azd auth login`
- Verifica instalarea și testa comenzile de bază azd
- Configura mediul de dezvoltare pentru utilizarea optimă a azd
- Rezolva independent problemele comune de instalare

Acest ghid te va ajuta să instalezi și să configurezi Azure Developer CLI pe sistemul tău, indiferent de sistemul de operare sau mediul de dezvoltare.

## Cerințe preliminare

Înainte de a instala azd, asigură-te că ai:
- **Abonament Azure** - [Creează un cont gratuit](https://azure.microsoft.com/free/)
- **Azure CLI** - Pentru autentificare și gestionarea resurselor
- **Git** - Pentru clonarea șabloanelor și controlul versiunilor
- **Docker** (opțional) - Pentru aplicații containerizate

## Metode de instalare

### Windows

#### Opțiunea 1: PowerShell (Recomandată)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opțiunea 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opțiunea 3: Chocolatey
```cmd
choco install azd
```

#### Opțiunea 4: Instalare manuală
1. Descarcă cea mai recentă versiune de pe [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrage în `C:\Program Files\azd\`
3. Adaugă în variabila de mediu PATH

### macOS

#### Opțiunea 1: Homebrew (Recomandată)
```bash
brew tap azure/azd
brew install azd
```

#### Opțiunea 2: Script de instalare
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opțiunea 3: Instalare manuală
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opțiunea 1: Script de instalare (Recomandată)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opțiunea 2: Manageri de pachete

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

azd vine preinstalat în GitHub Codespaces. Creează un codespace și începe să folosești azd imediat.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificarea instalării

După instalare, verifică dacă azd funcționează corect:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Rezultatul așteptat:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 Configurarea autentificării

### Autentificare Azure CLI (Recomandată)
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

### Autentificare prin cod de dispozitiv
Dacă folosești un sistem fără interfață grafică sau întâmpini probleme cu browserul:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Pentru medii automatizate:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ Configurare

### Configurare globală
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Variabile de mediu
Adaugă în profilul shell-ului tău (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 Integrare IDE

### Visual Studio Code
Instalează extensia Azure Developer CLI:
1. Deschide VS Code
2. Mergi la Extensii (Ctrl+Shift+X)
3. Caută "Azure Developer CLI"
4. Instalează extensia

Funcționalități:
- IntelliSense pentru azure.yaml
- Comenzi integrate în terminal
- Navigare prin șabloane
- Monitorizarea implementărilor

### GitHub Codespaces
Creează un fișier `.devcontainer/devcontainer.json`:
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
1. Instalează pluginul Azure
2. Configurează credențialele Azure
3. Folosește terminalul integrat pentru comenzile azd

## 🐛 Depanarea instalării

### Probleme comune

#### Permisiune refuzată (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Probleme cu PATH
Adaugă manual azd în PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Probleme de rețea/proxy
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Conflicte de versiune
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Obținerea mai multor informații
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Actualizarea azd

### Actualizări automate
azd te va notifica când sunt disponibile actualizări:
```bash
azd version --check-for-updates
```

### Actualizări manuale

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

## Următorii pași

1. **Completează autentificarea**: Asigură-te că poți accesa abonamentul Azure
2. **Încearcă prima implementare**: Urmează [Ghidul Primului Proiect](first-project.md)
3. **Explorează șabloanele**: Răsfoiește șabloanele disponibile cu `azd template list`
4. **Configurează IDE-ul tău**: Setează mediul de dezvoltare

## Suport

Dacă întâmpini probleme:
- [Documentație oficială](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Raportează probleme](https://github.com/Azure/azure-dev/issues)
- [Discuții comunitare](https://github.com/Azure/azure-dev/discussions)
- [Suport Azure](https://azure.microsoft.com/support/)

---

**Navigare**
- **Lecția anterioară**: [Bazele AZD](azd-basics.md)
- **Lecția următoare**: [Configurare](configuration.md)

**Instalare completă!** Continuă cu [Primul tău proiect](first-project.md) pentru a începe să construiești cu azd.

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.