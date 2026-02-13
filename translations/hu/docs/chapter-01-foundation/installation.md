# Telepítési és beállítási útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet - Alapok és Gyors kezdés
- **⬅️ Előző**: [AZD alapok](azd-basics.md)
- **➡️ Következő**: [Az első projekted](first-project.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Bevezetés

Ez az átfogó útmutató végigvezet az Azure Developer CLI (azd) telepítésén és konfigurálásán a rendszereden. Megismered a különböző telepítési módszereket különböző operációs rendszerekre, a hitelesítés beállítását és az alapkonfigurációt, hogy előkészíthesd a fejlesztői környezetedet Azure-telepítésekhez.

## Tanulási célok

A lecke végére képes leszel:
- Sikeresen telepíteni az Azure Developer CLI-t az operációs rendszeredre
- Konfigurálni a hitelesítést Azure-hoz több módszerrel
- Beállítani a fejlesztői környezetet a szükséges előfeltételekkel
- Megérteni a különböző telepítési lehetőségeket és mikor érdemes melyiket használni
- Hibakeresni a gyakori telepítési és beállítási problémákat

## Tanulási eredmények

A lecke elvégzése után képes leszel:
- Az azd telepítése a platformnak megfelelő módszerrel
- Hitelesítés az Azure felé az azd auth login használatával
- Ellenőrizni a telepítést és tesztelni az alapvető azd parancsokat
- Konfigurálni a fejlesztői környezetet az azd optimális használatához
- Önállóan megoldani a gyakori telepítési problémákat

Ez az útmutató segít az Azure Developer CLI telepítésében és konfigurálásában, függetlenül az operációs rendszeredtől vagy fejlesztői környezetedtől.

## Előfeltételek

Mielőtt telepítenéd az azd-t, győződj meg róla, hogy rendelkezel:
- **Azure-előfizetés** - [Hozz létre egy ingyenes fiókot](https://azure.microsoft.com/free/)
- **Azure CLI** - a hitelesítéshez és az erőforrás-kezeléshez
- **Git** - sablonok klónozásához és verziókezeléshez
- **Docker** (opcionális) - konténerizált alkalmazásokhoz

## Telepítési módszerek

### Windows

#### 1. lehetőség: PowerShell (Ajánlott)
```powershell
# Futtassa rendszergazdaként vagy emelt jogosultságokkal
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 2. lehetőség: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### 3. lehetőség: Chocolatey
```cmd
choco install azd
```

#### 4. lehetőség: Manuális telepítés
1. Töltsd le a legújabb kiadást a [GitHub](https://github.com/Azure/azure-dev/releases)-ról
2. Csomagold ki ide: `C:\Program Files\azd\`
3. Add hozzá a PATH környezeti változóhoz

### macOS

#### 1. lehetőség: Homebrew (Ajánlott)
```bash
brew tap azure/azd
brew install azd
```

#### 2. lehetőség: Telepítő script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 3. lehetőség: Manuális telepítés
```bash
# Letöltés és telepítés
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 1. lehetőség: Telepítő script (Ajánlott)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 2. lehetőség: Csomagkezelők

**Ubuntu/Debian:**
```bash
# Microsoft csomagtároló hozzáadása
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd telepítése
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft csomagtároló hozzáadása
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

Az azd előtelepítve érhető el a GitHub Codespaces-ben. Egyszerűen hozz létre egy codespace-et és azonnal használhatod az azd-t.

### Docker

```bash
# Futtassa az azd-t egy konténerben
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

**Megjegyzés**: A tényleges verziószám eltérhet. Nézd meg az [Azure Developer CLI kiadások](https://github.com/Azure/azure-dev/releases) oldalt a legfrissebb verzióért.

**✅ Sikeres telepítés ellenőrzőlista:**
- [ ] `azd version` verziószámot jelenít meg hiba nélkül
- [ ] `azd --help` parancsdokumentációt jelenít meg
- [ ] `azd template list` elérhető sablonokat jelenít meg
- [ ] `az account show` megjeleníti az Azure-előfizetésedet
- [ ] Létrehozhatsz egy teszt könyvtárat, és sikeresen futtathatod az `azd init` parancsot

**Ha minden ellenőrzés sikeres, készen állsz a folytatásra: [Az első projekted](first-project.md)!**

## Hitelesítés beállítása

### Azure CLI hitelesítés (ajánlott)
```bash
# Telepítse az Azure CLI-t, ha még nincs telepítve
# Windows: futtassa a következőt: winget install Microsoft.AzureCLI
# macOS: futtassa a következőt: brew install azure-cli
# Linux: futtassa a következőt: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Jelentkezzen be az Azure-ba
az login

# Ellenőrizze a hitelesítést
az account show
```

### Eszközkódos hitelesítés
Ha fej nélküli rendszeren vagy böngészőproblémáid vannak:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
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
# Alapértelmezett előfizetés beállítása
azd config set defaults.subscription <subscription-id>

# Alapértelmezett helyszín beállítása
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
Telepítsd az Azure Developer CLI kiterjesztést:
1. Nyisd meg a VS Code-ot
2. Menj a Kiterjesztésekhez (Ctrl+Shift+X)
3. Keresd meg az "Azure Developer CLI"-t
4. Telepítsd a kiterjesztést

Funkciók:
- IntelliSense az azure.yaml-hez
- Integrált terminálparancsok
- Sablonböngészés
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
1. Telepítsd az Azure bővítményt
2. Konfiguráld az Azure hitelesítő adataidat
3. Használd az integrált terminált az azd parancsok futtatásához

## 🐛 Hibakeresés telepítés közben

### Gyakori problémák

#### Engedély megtagadva (Windows)
```powershell
# Futtassa a PowerShellt rendszergazdaként
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH problémák
Add hozzá manuálisan az azd-t a PATH változóhoz:

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
# Proxy beállítása
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL-ellenőrzés kihagyása (nem ajánlott éles környezetben)
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

# Jelenlegi konfiguráció megtekintése
azd config list

# Jelenlegi telepítés állapotának megtekintése
azd show
```

## azd frissítése

### Automatikus frissítések
azd értesít, amikor elérhetőek frissítések:
```bash
azd version --check-for-updates
```

### Kézi frissítések

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

## 💡 Gyakran ismételt kérdések

<details>
<summary><strong>Mi a különbség az azd és az az CLI között?</strong></summary>

**Azure CLI (az)**: Alacsony szintű eszköz egyéni Azure-erőforrások kezeléséhez
- `az webapp create`, `az storage account create`
- Egy erőforrást egyszerre
- Infrastruktúra-kezelésre fókuszál

**Azure Developer CLI (azd)**: Magas szintű eszköz teljes alkalmazástelepítésekhez
- `azd up` telepíti az egész alkalmazást az összes erőforrással
- Sablonalapú munkafolyamatok
- Fejlesztői termelékenységre fókuszál

**Mindkettőre szükséged van**: azd az az CLI-t használja hitelesítéshez
</details>

<details>
<summary><strong>Használhatom az azd-t meglévő Azure-erőforrásokkal?</strong></summary>

Igen! Teheted:
1. Importálhatod a meglévő erőforrásokat az azd környezetekbe
2. Hivatkozhatsz meglévő erőforrásokra a Bicep sablonjaidban
3. Az azd-t használhatod új telepítésekhez a meglévő infrastruktúra mellett

Lásd a [Konfigurációs útmutató](configuration.md)-t a részletekért.
</details>

<details>
<summary><strong>Az azd működik az Azure Government vagy az Azure China környezettel?</strong></summary>

Igen, állítsd be a felhőt:
```bash
# Azure kormányzati
az cloud set --name AzureUSGovernment
az login

# Azure Kína
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Használhatom az azd-t CI/CD csővezetékekben?</strong></summary>

Abszolút! Az azd automatizálásra készült:
- GitHub Actions integráció
- Azure DevOps támogatás
- Service principal alapú hitelesítés
- Nem interaktív mód

Lásd a [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)-t a CI/CD mintákért.
</details>

<details>
<summary><strong>Mennyibe kerül az azd használata?</strong></summary>

Az azd önmagában **teljesen ingyenes** és nyílt forráskódú. Csak az alábbiakért kell fizetned:
- A telepített Azure-erőforrásokért
- Azure fogyasztási költségekért (számítási erőforrás, tárhely, stb.)

Használd az `azd provision --preview` parancsot a költségek becsléséhez telepítés előtt.
</details>

## Következő lépések

1. **Hitelesítés befejezése**: Győződj meg róla, hogy hozzáférsz az Azure-előfizetésedhez
2. **Próbáld ki az első telepítést**: Kövesd a [Első projekt útmutató](first-project.md)-t
3. **Fedezd fel a sablonokat**: Böngészd az elérhető sablonokat az `azd template list` segítségével
4. **Konfiguráld az IDE-det**: Állítsd be a fejlesztői környezetedet

## Támogatás

Ha problémába ütközöl:
- [Hivatalos dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Probléma bejelentése](https://github.com/Azure/azure-dev/issues)
- [Közösségi beszélgetések](https://github.com/Azure/azure-dev/discussions)
- [Azure támogatás](https://azure.microsoft.com/support/)

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet - Alapok és Gyors kezdés
- **⬅️ Előző**: [AZD alapok](azd-basics.md) 
- **➡️ Következő**: [Az első projekted](first-project.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Telepítés kész!** Folytasd a [Az első projekted](first-project.md) olvasását, hogy az azd használatával kezdj el építeni.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ezt a dokumentumot az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatizált fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén emberi, professzionális fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->