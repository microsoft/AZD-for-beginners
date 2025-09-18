<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-18T09:18:28+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "hu"
}
-->
# Telepítési és Beállítási Útmutató

**Fejezet Navigáció:**
- **📚 Kurzus Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 1. fejezet - Alapok és Gyors Kezdés
- **⬅️ Előző**: [AZD Alapok](azd-basics.md)
- **➡️ Következő**: [Az első projekted](first-project.md)
- **🚀 Következő Fejezet**: [2. fejezet: AI-First Fejlesztés](../ai-foundry/azure-ai-foundry-integration.md)

## Bevezetés

Ez az átfogó útmutató végigvezet az Azure Developer CLI (azd) telepítésén és konfigurálásán a rendszereden. Megismerheted a különböző operációs rendszerekhez tartozó telepítési módszereket, az autentikáció beállítását, valamint az első konfigurációt, hogy felkészítsd fejlesztői környezetedet az Azure telepítésekhez.

## Tanulási Célok

A lecke végére képes leszel:
- Sikeresen telepíteni az Azure Developer CLI-t az operációs rendszeredre
- Többféle módszerrel konfigurálni az Azure autentikációt
- Beállítani a fejlesztői környezetet a szükséges előfeltételekkel
- Megérteni a különböző telepítési lehetőségeket és azok használatát
- Elhárítani a gyakori telepítési és beállítási problémákat

## Tanulási Eredmények

A lecke elvégzése után képes leszel:
- Az operációs rendszeredhez megfelelő módszerrel telepíteni az azd-t
- Az azd auth login segítségével autentikálni az Azure-ban
- Ellenőrizni a telepítést és tesztelni az alapvető azd parancsokat
- Optimalizálni a fejlesztői környezetet az azd használatához
- Önállóan megoldani a gyakori telepítési problémákat

Ez az útmutató segít telepíteni és konfigurálni az Azure Developer CLI-t a rendszereden, függetlenül attól, hogy milyen operációs rendszert vagy fejlesztői környezetet használsz.

## Előfeltételek

Az azd telepítése előtt győződj meg róla, hogy rendelkezel:
- **Azure előfizetéssel** - [Hozz létre ingyenes fiókot](https://azure.microsoft.com/free/)
- **Azure CLI** - Az autentikációhoz és erőforrás-kezeléshez
- **Git** - Sablonok klónozásához és verziókezeléshez
- **Docker** (opcionális) - Konténeres alkalmazásokhoz

## Telepítési Módszerek

### Windows

#### 1. lehetőség: PowerShell (Ajánlott)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 2. lehetőség: Windows Csomagkezelő (winget)
```cmd
winget install Microsoft.Azd
```

#### 3. lehetőség: Chocolatey
```cmd
choco install azd
```

#### 4. lehetőség: Manuális Telepítés
1. Töltsd le a legújabb kiadást innen: [GitHub](https://github.com/Azure/azure-dev/releases)
2. Csomagold ki a `C:\Program Files\azd\` mappába
3. Add hozzá a PATH környezeti változóhoz

### macOS

#### 1. lehetőség: Homebrew (Ajánlott)
```bash
brew tap azure/azd
brew install azd
```

#### 2. lehetőség: Telepítési Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 3. lehetőség: Manuális Telepítés
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 1. lehetőség: Telepítési Script (Ajánlott)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 2. lehetőség: Csomagkezelők

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

Az azd előre telepítve van a GitHub Codespaces-ben. Egyszerűen hozz létre egy codespace-et, és azd azonnal használható.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Telepítés Ellenőrzése

A telepítés után ellenőrizd, hogy az azd megfelelően működik:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Várható kimenet:
```
azd version 1.5.0 (commit abc123)
```

## Autentikáció Beállítása

### Azure CLI Autentikáció (Ajánlott)
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

### Eszközkódos Autentikáció
Ha fej nélküli rendszeren vagy böngészőproblémák esetén:
```bash
az login --use-device-code
```

### Szolgáltatási Principal (CI/CD)
Automatizált környezetekhez:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguráció

### Globális Konfiguráció
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Környezeti Változók
Add hozzá a shell profilodhoz (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE Integráció

### Visual Studio Code
Telepítsd az Azure Developer CLI bővítményt:
1. Nyisd meg a VS Code-ot
2. Menj a Bővítményekhez (Ctrl+Shift+X)
3. Keress rá az "Azure Developer CLI"-re
4. Telepítsd a bővítményt

Funkciók:
- IntelliSense az azure.yaml-hez
- Integrált terminál parancsok
- Sablon böngészés
- Telepítés nyomon követése

### GitHub Codespaces
Hozz létre egy `.devcontainer/devcontainer.json` fájlt:
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
1. Telepítsd az Azure bővítményt
2. Konfiguráld az Azure hitelesítő adatokat
3. Használd az integrált terminált az azd parancsokhoz

## 🐛 Telepítési Hibák Elhárítása

### Gyakori Problémák

#### Hozzáférés Megtagadva (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Problémák
Manuálisan add hozzá az azd-t a PATH-hoz:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Hálózati/Proxy Problémák
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Verzióütközések
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### További Segítség
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Az azd Frissítése

### Automatikus Frissítések
Az azd értesít, ha elérhető frissítés:
```bash
azd version --check-for-updates
```

### Manuális Frissítések

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

## Következő Lépések

1. **Autentikáció befejezése**: Győződj meg róla, hogy hozzáférsz az Azure előfizetésedhez
2. **Próbáld ki az első telepítést**: Kövesd az [Első Projekt Útmutatót](first-project.md)
3. **Fedezd fel a sablonokat**: Böngészd az elérhető sablonokat az `azd template list` parancs segítségével
4. **Konfiguráld az IDE-t**: Állítsd be a fejlesztői környezetedet

## Támogatás

Ha problémákba ütközöl:
- [Hivatalos Dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Hibák Jelentése](https://github.com/Azure/azure-dev/issues)
- [Közösségi Beszélgetések](https://github.com/Azure/azure-dev/discussions)
- [Azure Támogatás](https://azure.microsoft.com/support/)

---

**Fejezet Navigáció:**
- **📚 Kurzus Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 1. fejezet - Alapok és Gyors Kezdés
- **⬅️ Előző**: [AZD Alapok](azd-basics.md) 
- **➡️ Következő**: [Az első projekted](first-project.md)
- **🚀 Következő Fejezet**: [2. fejezet: AI-First Fejlesztés](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Telepítés Kész!** Folytasd az [Első Projekted](first-project.md) útmutatóval, hogy elkezdj dolgozni az azd-vel.

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.