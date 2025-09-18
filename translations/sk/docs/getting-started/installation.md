<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-18T10:01:52+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "sk"
}
-->
# Inštalačný a konfiguračný sprievodca

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základy AZD](azd-basics.md)
- **➡️ Ďalšia**: [Váš prvý projekt](first-project.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## Úvod

Tento komplexný sprievodca vás prevedie inštaláciou a konfiguráciou Azure Developer CLI (azd) na vašom systéme. Naučíte sa rôzne metódy inštalácie pre rôzne operačné systémy, nastavenie autentifikácie a počiatočnú konfiguráciu na prípravu vášho vývojového prostredia pre nasadenia v Azure.

## Ciele učenia

Na konci tejto lekcie budete schopní:
- Úspešne nainštalovať Azure Developer CLI na váš operačný systém
- Nastaviť autentifikáciu s Azure pomocou viacerých metód
- Pripraviť vaše vývojové prostredie s potrebnými predpokladmi
- Pochopiť rôzne možnosti inštalácie a kedy ich použiť
- Riešiť bežné problémy s inštaláciou a nastavením

## Výsledky učenia

Po dokončení tejto lekcie budete schopní:
- Nainštalovať azd pomocou vhodnej metódy pre vašu platformu
- Autentifikovať sa s Azure pomocou príkazu `azd auth login`
- Overiť vašu inštaláciu a otestovať základné príkazy azd
- Konfigurovať vaše vývojové prostredie pre optimálne používanie azd
- Samostatne riešiť bežné problémy s inštaláciou

Tento sprievodca vám pomôže nainštalovať a nakonfigurovať Azure Developer CLI na vašom systéme, bez ohľadu na váš operačný systém alebo vývojové prostredie.

## Predpoklady

Pred inštaláciou azd sa uistite, že máte:
- **Azure predplatné** - [Vytvorte si bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** - Na autentifikáciu a správu zdrojov
- **Git** - Na klonovanie šablón a správu verzií
- **Docker** (voliteľné) - Na kontajnerové aplikácie

## Metódy inštalácie

### Windows

#### Možnosť 1: PowerShell (Odporúčané)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnosť 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Možnosť 3: Chocolatey
```cmd
choco install azd
```

#### Možnosť 4: Manuálna inštalácia
1. Stiahnite si najnovšie vydanie z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Rozbaľte do `C:\Program Files\azd\`
3. Pridajte do systémovej premennej PATH

### macOS

#### Možnosť 1: Homebrew (Odporúčané)
```bash
brew tap azure/azd
brew install azd
```

#### Možnosť 2: Inštalačný skript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnosť 3: Manuálna inštalácia
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Možnosť 1: Inštalačný skript (Odporúčané)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnosť 2: Správcovia balíkov

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

azd je predinštalované v GitHub Codespaces. Stačí vytvoriť codespace a môžete okamžite začať používať azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Overenie inštalácie

Po inštalácii overte, či azd funguje správne:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Očakávaný výstup:
```
azd version 1.5.0 (commit abc123)
```

## Nastavenie autentifikácie

### Autentifikácia cez Azure CLI (Odporúčané)
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

### Autentifikácia pomocou kódu zariadenia
Ak používate systém bez grafického rozhrania alebo máte problémy s prehliadačom:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Pre automatizované prostredia:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurácia

### Globálna konfigurácia
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Premenné prostredia
Pridajte do vášho shell profilu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Integrácia s IDE

### Visual Studio Code
Nainštalujte rozšírenie Azure Developer CLI:
1. Otvorte VS Code
2. Prejdite na Rozšírenia (Ctrl+Shift+X)
3. Vyhľadajte "Azure Developer CLI"
4. Nainštalujte rozšírenie

Funkcie:
- IntelliSense pre azure.yaml
- Integrované terminálové príkazy
- Prehliadanie šablón
- Monitorovanie nasadení

### GitHub Codespaces
Vytvorte `.devcontainer/devcontainer.json`:
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
1. Nainštalujte Azure plugin
2. Nakonfigurujte Azure poverenia
3. Používajte integrovaný terminál na príkazy azd

## 🐛 Riešenie problémov s inštaláciou

### Bežné problémy

#### Prístup odmietnutý (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problémy s PATH
Manuálne pridajte azd do PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problémy so sieťou/proxy
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Konflikty verzií
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Získanie ďalšej pomoci
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Aktualizácia azd

### Automatické aktualizácie
azd vás upozorní, keď sú dostupné aktualizácie:
```bash
azd version --check-for-updates
```

### Manuálne aktualizácie

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

## Ďalšie kroky

1. **Dokončite autentifikáciu**: Uistite sa, že máte prístup k vášmu Azure predplatnému
2. **Vyskúšajte prvé nasadenie**: Postupujte podľa [Sprievodcu prvým projektom](first-project.md)
3. **Preskúmajte šablóny**: Prezrite si dostupné šablóny pomocou `azd template list`
4. **Nakonfigurujte vaše IDE**: Nastavte vaše vývojové prostredie

## Podpora

Ak narazíte na problémy:
- [Oficiálna dokumentácia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásiť problémy](https://github.com/Azure/azure-dev/issues)
- [Diskusie komunity](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)

---

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základy AZD](azd-basics.md) 
- **➡️ Ďalšia**: [Váš prvý projekt](first-project.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Inštalácia dokončená!** Pokračujte na [Váš prvý projekt](first-project.md) a začnite pracovať s azd.

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.