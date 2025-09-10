<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-10T06:03:09+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "cs"
}
-->
# Průvodce instalací a nastavením

## Úvod

Tento komplexní průvodce vás provede instalací a konfigurací Azure Developer CLI (azd) na vašem systému. Naučíte se různé metody instalace pro různé operační systémy, nastavení autentizace a počáteční konfiguraci, abyste připravili své vývojové prostředí pro nasazení na Azure.

## Cíle učení

Na konci této lekce budete:
- Úspěšně mít nainstalovaný Azure Developer CLI na vašem operačním systému
- Nastavit autentizaci s Azure pomocí různých metod
- Připravit své vývojové prostředí s potřebnými předpoklady
- Porozumět různým možnostem instalace a kdy je použít
- Řešit běžné problémy s instalací a nastavením

## Výsledky učení

Po dokončení této lekce budete schopni:
- Nainstalovat azd pomocí vhodné metody pro vaši platformu
- Autentizovat se s Azure pomocí příkazu azd auth login
- Ověřit instalaci a otestovat základní příkazy azd
- Konfigurovat své vývojové prostředí pro optimální použití azd
- Samostatně řešit běžné problémy s instalací

Tento průvodce vám pomůže nainstalovat a nastavit Azure Developer CLI na vašem systému, bez ohledu na operační systém nebo vývojové prostředí.

## Předpoklady

Před instalací azd se ujistěte, že máte:
- **Azure předplatné** - [Vytvořte si bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** - Pro autentizaci a správu zdrojů
- **Git** - Pro klonování šablon a verzování
- **Docker** (volitelné) - Pro kontejnerové aplikace

## Metody instalace

### Windows

#### Možnost 1: PowerShell (doporučeno)
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

#### Možnost 4: Manuální instalace
1. Stáhněte si nejnovější verzi z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Rozbalte do `C:\Program Files\azd\`
3. Přidejte do proměnné PATH

### macOS

#### Možnost 1: Homebrew (doporučeno)
```bash
brew tap azure/azd
brew install azd
```

#### Možnost 2: Instalační skript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 3: Manuální instalace
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Možnost 1: Instalační skript (doporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 2: Správci balíčků

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

azd je předinstalován v GitHub Codespaces. Stačí vytvořit codespace a ihned začít používat azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Ověření instalace

Po instalaci ověřte, že azd funguje správně:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Očekávaný výstup:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 Nastavení autentizace

### Autentizace pomocí Azure CLI (doporučeno)
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

### Autentizace pomocí kódu zařízení
Pokud pracujete na systému bez grafického rozhraní nebo máte problémy s prohlížečem:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Pro automatizovaná prostředí:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ Konfigurace

### Globální konfigurace
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Proměnné prostředí
Přidejte do svého shell profilu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 Integrace s IDE

### Visual Studio Code
Nainstalujte rozšíření Azure Developer CLI:
1. Otevřete VS Code
2. Přejděte na Rozšíření (Ctrl+Shift+X)
3. Vyhledejte "Azure Developer CLI"
4. Nainstalujte rozšíření

Funkce:
- IntelliSense pro azure.yaml
- Integrované příkazy v terminálu
- Procházení šablon
- Monitorování nasazení

### GitHub Codespaces
Vytvořte `.devcontainer/devcontainer.json`:
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
1. Nainstalujte plugin Azure
2. Nastavte Azure přihlašovací údaje
3. Použijte integrovaný terminál pro příkazy azd

## 🐛 Řešení problémů s instalací

### Běžné problémy

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problémy s PATH
Manuálně přidejte azd do PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problémy s sítí/proxy
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Konflikty verzí
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Další pomoc
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Aktualizace azd

### Automatické aktualizace
azd vás upozorní, když jsou dostupné aktualizace:
```bash
azd version --check-for-updates
```

### Manuální aktualizace

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

## Další kroky

1. **Dokončete autentizaci**: Ujistěte se, že máte přístup k vašemu Azure předplatnému
2. **Vyzkoušejte první nasazení**: Postupujte podle [Průvodce prvním projektem](first-project.md)
3. **Prozkoumejte šablony**: Prohlédněte si dostupné šablony pomocí `azd template list`
4. **Nakonfigurujte své IDE**: Nastavte své vývojové prostředí

## Podpora

Pokud narazíte na problémy:
- [Oficiální dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásit problémy](https://github.com/Azure/azure-dev/issues)
- [Diskuse komunity](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)

---

**Navigace**
- **Předchozí lekce**: [Základy AZD](azd-basics.md)
- **Další lekce**: [Konfigurace](configuration.md)

**Instalace dokončena!** Pokračujte na [Váš první projekt](first-project.md) a začněte pracovat s azd.

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.