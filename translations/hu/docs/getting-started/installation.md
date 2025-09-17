<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T22:16:32+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "hu"
}
-->
# Telepítési és beállítási útmutató

**Előző:** [Fő dokumentáció](../../README.md) | **Következő:** [AZD alapok](azd-basics.md)

## Bevezetés

Ez az átfogó útmutató végigvezet az Azure Developer CLI (azd) telepítésén és konfigurálásán a rendszereden. Megismerheted a különböző telepítési módszereket az eltérő operációs rendszerekhez, az autentikáció beállítását, valamint az első konfigurációt, hogy felkészítsd fejlesztési környezetedet az Azure telepítésekhez.

## Tanulási célok

A lecke végére képes leszel:
- Sikeresen telepíteni az Azure Developer CLI-t az operációs rendszeredre
- Többféle módszerrel konfigurálni az autentikációt az Azure-hoz
- Beállítani a fejlesztési környezetet a szükséges előfeltételekkel
- Megérteni a különböző telepítési lehetőségeket és tudni, mikor melyiket érdemes használni
- Elhárítani a gyakori telepítési és beállítási problémákat

## Tanulási eredmények

A lecke elvégzése után képes leszel:
- Az operációs rendszeredhez megfelelő módszerrel telepíteni az azd-t
- Az azd auth login segítségével autentikálni az Azure-hoz
- Ellenőrizni a telepítést és tesztelni az alapvető azd parancsokat
- Konfigurálni a fejlesztési környezetet az azd optimális használatához
- Önállóan megoldani a gyakori telepítési problémákat

Ez az útmutató segít telepíteni és konfigurálni az Azure Developer CLI-t a rendszereden, függetlenül attól, hogy milyen operációs rendszert vagy fejlesztési környezetet használsz.

## Előfeltételek

Az azd telepítése előtt győződj meg róla, hogy rendelkezel:
- **Azure előfizetéssel** - [Hozz létre ingyenes fiókot](https://azure.microsoft.com/free/)
- **Azure CLI-vel** - Az autentikációhoz és erőforrás-kezeléshez
- **Git-tel** - Sablonok klónozásához és verziókezeléshez
- **Dockerrel** (opcionális) - Konténeres alkalmazásokhoz

## Telepítési módszerek

### Windows

#### Opció 1: PowerShell (Ajánlott)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opció 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opció 3: Chocolatey
```cmd
choco install azd
```

#### Opció 4: Manuális telepítés
1. Töltsd le a legújabb kiadást innen: [GitHub](https://github.com/Azure/azure-dev/releases)
2. Csomagold ki a `C:\Program Files\azd\` mappába
3. Add hozzá a PATH környezeti változóhoz

### macOS

#### Opció 1: Homebrew (Ajánlott)
```bash
brew tap azure/azd
brew install azd
```

#### Opció 2: Telepítési script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opció 3: Manuális telepítés
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opció 1: Telepítési script (Ajánlott)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opció 2: Csomagkezelők

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

Az azd előre telepítve van a GitHub Codespaces-ben. Egyszerűen hozz létre egy codespace-et, és azonnal használhatod az azd-t.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Telepítés ellenőrzése

A telepítés után ellenőrizd, hogy az azd megfelelően működik:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Várt kimenet:
```
azd version 1.5.0 (commit abc123)
```

## Autentikáció beállítása

### Azure CLI autentikáció (Ajánlott)
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

### Eszközkódos autentikáció
Ha fej nélküli rendszeren dolgozol, vagy böngészőproblémák lépnek fel:
```bash
az login --use-device-code
```

### Szolgáltatási főazonosító (CI/CD)
Automatizált környezetekhez:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguráció

### Globális konfiguráció
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Környezeti változók
Add hozzá a shell profilodhoz (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE integráció

### Visual Studio Code
Telepítsd az Azure Developer CLI bővítményt:
1. Nyisd meg a VS Code-ot
2. Menj a Bővítményekhez (Ctrl+Shift+X)
3. Keress rá az "Azure Developer CLI"-re
4. Telepítsd a bővítményt

Funkciók:
- IntelliSense az azure.yaml-hez
- Integrált terminál parancsok
- Sablonböngészés
- Telepítési monitorozás

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

## 🐛 Telepítési hibák elhárítása

### Gyakori problémák

#### Hozzáférés megtagadva (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH problémák
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

#### Hálózati/proxy problémák
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

### További segítség
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Az azd frissítése

### Automatikus frissítések
Az azd értesít, ha elérhető frissítés:
```bash
azd version --check-for-updates
```

### Manuális frissítések

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

## Következő lépések

1. **Autentikáció befejezése**: Győződj meg róla, hogy hozzáférsz az Azure előfizetésedhez
2. **Próbáld ki az első telepítést**: Kövesd az [Első projekt útmutatót](first-project.md)
3. **Fedezd fel a sablonokat**: Böngészd az elérhető sablonokat az `azd template list` parancs segítségével
4. **Konfiguráld az IDE-t**: Állítsd be a fejlesztési környezetedet

## Támogatás

Ha problémákba ütközöl:
- [Hivatalos dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Hibák jelentése](https://github.com/Azure/azure-dev/issues)
- [Közösségi megbeszélések](https://github.com/Azure/azure-dev/discussions)
- [Azure támogatás](https://azure.microsoft.com/support/)

---

**Előző:** [Fő dokumentáció](../../README.md) | **Következő:** [AZD alapok](azd-basics.md)

**Telepítés kész!** Folytasd az [Első projekted](first-project.md) útmutatójával, hogy elkezdj dolgozni az azd-vel.

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.