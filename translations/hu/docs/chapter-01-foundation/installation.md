# Telepítési és Beállítási Útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 1. fejezet - Alapok és Gyorskezdés
- **⬅️ Előző**: [AZD Alapok](azd-basics.md)
- **➡️ Következő**: [Az első projekted](first-project.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Bevezetés

Ez az átfogó útmutató végigvezeti az Azure Developer CLI (azd) telepítésén és beállításán a rendszereden. Megtanulod a különféle telepítési módszereket különböző operációs rendszerekhez, a hitelesítés beállítását és az első konfigurációkat, hogy fejlesztői környezeted készen álljon az Azure-alapú telepítésekre.

## Tanulási célok

A tananyag elvégzése után:
- Sikeresen telepíted az Azure Developer CLI-t az operációs rendszereden
- Többféle módszerrel állítod be az Azure hitelesítést
- Beállítod a fejlesztői környezeted szükséges előfeltételeit
- Megérted a különböző telepítési lehetőségeket és hogy mikor melyiket érdemes használni
- Hibaelhárítod a gyakori telepítési és beállítási problémákat

## Tanulási eredmények

A tananyag elvégzése után képes leszel:
- Az azd telepítésére a platformodnak megfelelő módszerrel
- Az azd auth login használatával hitelesíteni az Azure-hoz
- Ellenőrizni a telepítés helyességét és az alap azd parancsokat kipróbálni
- A fejlesztői környezetet optimálisan beállítani az azd használatához
- Önállóan megoldani a gyakori telepítési problémákat

Ez az útmutató segít az Azure Developer CLI telepítésében és konfigurálásában függetlenül az operációs rendszeredtől vagy fejlesztői környezetedtől.

## Előfeltételek

Az azd telepítése előtt győződj meg róla, hogy rendelkezel:
- **Azure előfizetéssel** - [Ingyenes fiók létrehozása](https://azure.microsoft.com/free/)
- **Azure CLI** - Hitelesítéshez és erőforráskezeléshez
- **Git** - Sablonok klónozásához és verziókezeléshez
- **Docker** (opcionális) - Konténeres alkalmazásokhoz

## Telepítési Módszerek

### Windows

#### 1. Opció: PowerShell (ajánlott)
```powershell
# Futtassa rendszergazdaként vagy emelt szintű jogosultságokkal
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 2. Opció: Windows Csomagkezelő (winget)
```cmd
winget install Microsoft.Azd
```

#### 3. Opció: Chocolatey
```cmd
choco install azd
```

#### 4. Opció: Kézi telepítés
1. Töltsd le a legújabb kiadást a [GitHubról](https://github.com/Azure/azure-dev/releases)
2. Csomagold ki a `C:\Program Files\azd\` könyvtárba
3. Add hozzá a PATH környezeti változóhoz

### macOS

#### 1. Opció: Homebrew (ajánlott)
```bash
brew tap azure/azd
brew install azd
```

#### 2. Opció: Telepítő script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 3. Opció: Kézi telepítés
```bash
# Letöltés és telepítés
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 1. Opció: Telepítő script (ajánlott)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 2. Opció: Csomagkezelők

**Ubuntu/Debian:**
```bash
# Microsoft csomagtároló hozzáadása
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azd telepítése
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft csomagtár hozzáadása
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

Az azd előre telepítve érhető el a GitHub Codespaces-ben. Egyszerűen hozz létre egy codespace-et és azonnal használhatod az azd-t.

### Docker

```bash
# Futtassa azd-t egy konténerben
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Hozzon létre egy alias-t a könnyebb használathoz
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Telepítés ellenőrzése

A telepítés után ellenőrizd, hogy az azd megfelelően működik:

```bash
# Verzió ellenőrzése
azd version

# Súgó megtekintése
azd --help

# Elérhető sablonok listázása
azd template list
```

Várt kimenet:
```
azd version 1.x.x (commit xxxxxx)
```

**Megjegyzés**: A verziószám eltérő lehet. Ellenőrizd az [Azure Developer CLI kiadásokat](https://github.com/Azure/azure-dev/releases) a legfrissebb verzióért.

**✅ Telepítés sikerességi ellenőrző lista:**
- [ ] Az `azd version` parancs hiba nélkül megjeleníti a verziószámot
- [ ] Az `azd --help` megjeleníti a parancsdokumentációt
- [ ] Az `azd template list` mutatja az elérhető sablonokat
- [ ] Az `az account show` mutatja az Azure előfizetésedet
- [ ] Tudsz teszt könyvtárat létrehozni és sikeresen futtatni az `azd init`-et

**Ha minden ellenőrzés sikeres, folytathatsz a [Az első projekteddel](first-project.md)!**

## Hitelesítés beállítása

### Azure CLI hitelesítés (ajánlott)
```bash
# Az Azure CLI telepítése, ha még nincs telepítve
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Bejelentkezés az Azure-ba
az login

# Hitelesítés ellenőrzése
az account show
```

### Eszközkódos hitelesítés
Ha fej nélküli rendszeren vagy böngésző problémád van:
```bash
az login --use-device-code
```

### Szolgáltatásazonosító (CI/CD)
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
# Állítsa be az alapértelmezett előfizetést
azd config set defaults.subscription <subscription-id>

# Állítsa be az alapértelmezett helyet
azd config set defaults.location eastus2

# Az összes konfiguráció megtekintése
azd config list
```

### Környezeti változók
Add hozzá a shell profilodhoz (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfiguráció
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfiguráció
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Hibakeresési naplózás engedélyezése
```

## IDE integráció

### Visual Studio Code
Telepítsd az Azure Developer CLI bővítményt:
1. Nyisd meg a VS Code-ot
2. Menj a Bővítményekhez (Ctrl+Shift+X)
3. Keresd meg az "Azure Developer CLI"-t
4. Telepítsd a bővítményt

Funkciók:
- IntelliSense az azure.yaml fájlhoz
- Integrált terminálparancsok
- Sablon böngészés
- Telepítésfigyelés

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
1. Telepítsd az Azure plugint
2. Állítsd be az Azure hitelesítő adatokat
3. Használd az integrált terminált az azd parancsok futtatásához

## 🐛 Telepítési hibakeresés

### Gyakori problémák

#### Hozzáférés megtagadva (Windows)
```powershell
# Futtassa a PowerShellt rendszergazdaként
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH problémák
Add hozzá kézzel az azd-t a PATH-hoz:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Hálózati/Proxy problémák
```bash
# Proxy beállítása
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL ellenőrzés kihagyása (nem ajánlott éles környezetben)
azd config set http.insecure true
```

#### Verzióütközések
```bash
# Régi telepítések eltávolítása
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Konfiguráció tisztítása
rm -rf ~/.azd
```

### További segítség
```bash
# Hibakeresési naplózás engedélyezése
export AZD_DEBUG=true
azd <command> --debug

# Aktuális konfiguráció megtekintése
azd config list

# Aktuális telepítési állapot megtekintése
azd show
```

## azd frissítése

### Automatikus frissítések
Az azd értesít, amikor frissítés elérhető:
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

## 💡 Gyakran Ismételt Kérdések

<details>
<summary><strong>Miben különbözik az azd az az CLI-től?</strong></summary>

**Azure CLI (az)**: Alacsony szintű eszköz az egyedi Azure erőforrások kezelésére
- `az webapp create`, `az storage account create`
- Egyszerre egy erőforrás
- Infrastrukturális menedzsment fókusz

**Azure Developer CLI (azd)**: Magas szintű eszköz komplett alkalmazás telepítésekhez
- `azd up` az egész alkalmazást az összes erőforrással telepíti
- Sablonalapú munkafolyamatok
- Fejlesztői termelékenység fókusz

**Mindkettőre szükség van**: azd az az CLI-t használja hitelesítésre
</details>

<details>
<summary><strong>Használhatom az azd-t meglévő Azure erőforrásokkal?</strong></summary>

Igen! Lehetőségeid:
1. Importáld a meglévő erőforrásokat az azd környezetekbe
2. Hivatkozz meglévő erőforrásokra a Bicep sablonjaidban
3. Használj azd-t új telepítésekhez a meglévő infrastruktúra mellett

Részletekért lásd a [Konfigurációs Útmutatót](configuration.md).
</details>

<details>
<summary><strong>Működik az azd Azure Government vagy Azure China környezettel?</strong></summary>

Igen, állítsd be a felhőt:
```bash
# Azure Kormányzat
az cloud set --name AzureUSGovernment
az login

# Azure Kína
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Használhatom az azd-t CI/CD folyamatokban?</strong></summary>

Természetesen! Az azd automatizálásra készült:
- GitHub Actions integráció
- Azure DevOps támogatás
- Szolgáltatásazonosító hitelesítés
- Nem interaktív mód

Lásd a [Telepítési Útmutatót](../chapter-04-infrastructure/deployment-guide.md) a CI/CD mintákért.
</details>

<details>
<summary><strong>Mennyibe kerül az azd használata?</strong></summary>

Az azd **teljesen ingyenes** és nyílt forráskódú. Csak az alábbiakért kell fizetni:
- Az Azure erőforrásokért, amiket telepítesz
- Az Azure fogyasztási díjakért (számítási kapacitás, tárolás stb.)

Használd az `azd provision --preview` parancsot a költségek becsléséhez telepítés előtt.
</details>

## Következő lépések

1. **Befejezni a hitelesítést**: Győződj meg róla, hogy hozzáférsz az Azure előfizetésedhez
2. **Próbáld ki az első telepítést**: Kövesd az [Első Projekt Útmutatót](first-project.md)
3. **Fedezd fel a sablonokat**: Böngészd az elérhető sablonokat az `azd template list` paranccsal
4. **Állítsd be az IDE-det**: Készítsd el a fejlesztői környezetet

## Támogatás

Ha problémákba ütközöl:
- [Hivatalos dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Probléma bejelentése](https://github.com/Azure/azure-dev/issues)
- [Közösségi beszélgetések](https://github.com/Azure/azure-dev/discussions)
- [Azure támogatás](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) – Szerezz Azure parancs javaslatokat közvetlenül a szerkesztődbe a `npx skills add microsoft/github-copilot-for-azure` segítségével

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 1. fejezet - Alapok és Gyorskezdés
- **⬅️ Előző**: [AZD Alapok](azd-basics.md) 
- **➡️ Következő**: [Az első projekted](first-project.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Telepítés befejezve!** Folytasd az [Az első projekteddel](first-project.md), hogy elkezdhess az azd-vel dolgozni.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatás segítségével készült. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén professzionális, emberi fordítás ajánlott. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->