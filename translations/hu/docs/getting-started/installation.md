<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-23T10:46:18+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "hu"
}
-->
# Telepítési és Beállítási Útmutató

**Fejezet navigáció:**
- **📚 Kurzus Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 1. fejezet - Alapok és Gyors Kezdés
- **⬅️ Előző**: [AZD Alapok](azd-basics.md)
- **➡️ Következő**: [Az Első Projekted](first-project.md)
- **🚀 Következő Fejezet**: [2. fejezet: AI-First Fejlesztés](../microsoft-foundry/microsoft-foundry-integration.md)

## Bevezetés

Ez az átfogó útmutató végigvezet az Azure Developer CLI (azd) telepítésén és konfigurálásán a rendszereden. Megismerheted a különböző operációs rendszerekhez tartozó telepítési módszereket, az autentikáció beállítását, valamint az elsődleges konfigurációt, hogy felkészítsd fejlesztői környezetedet az Azure telepítésekhez.

## Tanulási Célok

A lecke végére képes leszel:
- Sikeresen telepíteni az Azure Developer CLI-t az operációs rendszeredre
- Többféle módszerrel konfigurálni az Azure autentikációt
- Beállítani a fejlesztői környezetedet a szükséges előfeltételekkel
- Megérteni a különböző telepítési lehetőségeket és azok használati eseteit
- Megoldani a gyakori telepítési és beállítási problémákat

## Tanulási Eredmények

A lecke elvégzése után képes leszel:
- Az operációs rendszeredhez megfelelő módszerrel telepíteni az azd-t
- Az azd auth login segítségével autentikálni az Azure-hoz
- Ellenőrizni a telepítést és tesztelni az alapvető azd parancsokat
- Konfigurálni a fejlesztői környezetedet az azd optimális használatához
- Önállóan megoldani a gyakori telepítési problémákat

Ez az útmutató segít telepíteni és konfigurálni az Azure Developer CLI-t a rendszereden, függetlenül attól, hogy milyen operációs rendszert vagy fejlesztői környezetet használsz.

## Előfeltételek

Az azd telepítése előtt győződj meg róla, hogy rendelkezel az alábbiakkal:
- **Azure előfizetés** - [Hozz létre egy ingyenes fiókot](https://azure.microsoft.com/free/)
- **Azure CLI** - Az autentikációhoz és az erőforrások kezeléséhez
- **Git** - Sablonok klónozásához és verziókezeléshez
- **Docker** (opcionális) - Konténerizált alkalmazásokhoz

## Telepítési Módszerek

### Windows

#### 1. lehetőség: PowerShell (Ajánlott)
```powershell
# Futtassa rendszergazdaként vagy emelt jogosultságokkal
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

#### 4. lehetőség: Kézi Telepítés
1. Töltsd le a legújabb kiadást a [GitHub](https://github.com/Azure/azure-dev/releases) oldaláról
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

#### 3. lehetőség: Kézi Telepítés
```bash
# Letöltés és telepítés
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
# Adja hozzá a Microsoft csomagtárolót
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Telepítse az azd-t
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Adja hozzá a Microsoft csomagtárolót
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

Az azd előre telepítve van a GitHub Codespaces-ben. Egyszerűen hozz létre egy codespace-t, és azonnal kezdheted az azd használatát.

### Docker

```bash
# Futtassa az azd-t egy konténerben
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Hozzon létre egy alias-t a könnyebb használat érdekében
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Telepítés Ellenőrzése

A telepítés után ellenőrizd, hogy az azd megfelelően működik:

```bash
# Ellenőrizze a verziót
azd version

# Nézze meg a súgót
azd --help

# Listázza az elérhető sablonokat
azd template list
```

Várt kimenet:
```
azd version 1.5.0 (commit abc123)
```

**✅ Telepítési Siker Ellenőrzőlista:**
- [ ] Az `azd version` verziószámot mutat hibák nélkül
- [ ] Az `azd --help` megjeleníti a parancsdokumentációt
- [ ] Az `azd template list` megjeleníti az elérhető sablonokat
- [ ] Az `az account show` megjeleníti az Azure előfizetésedet
- [ ] Létre tudsz hozni egy tesztkönyvtárat, és sikeresen futtatni az `azd init` parancsot

**Ha minden ellenőrzés sikeres, készen állsz a [Your First Project](first-project.md) folytatására!**

## Autentikáció Beállítása

### Azure CLI Autentikáció (Ajánlott)
```bash
# Telepítse az Azure CLI-t, ha még nincs telepítve
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Jelentkezzen be az Azure-ba
az login

# Ellenőrizze a hitelesítést
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
# Alapértelmezett előfizetés beállítása
azd config set defaults.subscription <subscription-id>

# Alapértelmezett hely beállítása
azd config set defaults.location eastus2

# Az összes konfiguráció megtekintése
azd config list
```

### Környezeti Változók
Add hozzá a shell profilodhoz (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfiguráció
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfiguráció
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Hibakeresési naplózás engedélyezése
```

## IDE Integráció

### Visual Studio Code
Telepítsd az Azure Developer CLI bővítményt:
1. Nyisd meg a VS Code-ot
2. Menj a Bővítményekhez (Ctrl+Shift+X)
3. Keresd meg az "Azure Developer CLI"-t
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

## 🐛 Telepítési Hibák Elhárítása

### Gyakori Problémák

#### Hozzáférés Megtagadva (Windows)
```powershell
# Futtassa a PowerShell-t rendszergazdaként
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
# Proxy konfigurálása
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL ellenőrzés kihagyása (nem ajánlott éles környezetben)
azd config set http.insecure true
```

#### Verzióütközések
```bash
# Távolítsa el a régi telepítéseket
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Tisztítsa meg a konfigurációt
rm -rf ~/.azd
```

### További Segítség
```bash
# Engedélyezze a hibakeresési naplózást
export AZD_DEBUG=true
azd <command> --debug

# Részletes naplók megtekintése
azd logs

# Rendszerinformáció ellenőrzése
azd info
```

## azd Frissítése

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

## 💡 Gyakran Ismételt Kérdések

<details>
<summary><strong>Mi a különbség az azd és az az CLI között?</strong></summary>

**Azure CLI (az)**: Alacsony szintű eszköz egyedi Azure erőforrások kezeléséhez
- `az webapp create`, `az storage account create`
- Egy erőforrás egyszerre
- Infrastruktúra-kezelési fókusz

**Azure Developer CLI (azd)**: Magas szintű eszköz teljes alkalmazástelepítésekhez
- Az `azd up` az egész alkalmazást telepíti az összes erőforrással
- Sablon-alapú munkafolyamatok
- Fejlesztői termelékenység fókusz

**Mindkettőre szükséged van**: azd az az CLI-t használja az autentikációhoz
</details>

<details>
<summary><strong>Használhatom az azd-t meglévő Azure erőforrásokkal?</strong></summary>

Igen! Az alábbiakat teheted:
1. Importálhatod a meglévő erőforrásokat az azd környezetekbe
2. Hivatkozhatsz meglévő erőforrásokra a Bicep sablonjaidban
3. Használhatod az azd-t új telepítésekhez a meglévő infrastruktúra mellett

Részletekért lásd a [Konfigurációs Útmutatót](configuration.md).
</details>

<details>
<summary><strong>Működik az azd az Azure Government vagy Azure China környezetekkel?</strong></summary>

Igen, konfiguráld a felhőt:
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

Természetesen! Az azd automatizálásra lett tervezve:
- GitHub Actions integráció
- Azure DevOps támogatás
- Szolgáltatási principal autentikáció
- Nem interaktív mód

Részletekért lásd a [Telepítési Útmutatót](../deployment/deployment-guide.md) a CI/CD mintákhoz.
</details>

<details>
<summary><strong>Mennyibe kerül az azd használata?</strong></summary>

Az azd maga **teljesen ingyenes** és nyílt forráskódú. Csak az alábbiakért kell fizetned:
- Az Azure erőforrások, amelyeket telepítesz
- Azure fogyasztási költségek (számítási kapacitás, tárhely stb.)

Használd az `azd provision --preview` parancsot a költségek becsléséhez a telepítés előtt.
</details>

## Következő Lépések

1. **Fejezd be az autentikációt**: Győződj meg róla, hogy hozzáférsz az Azure előfizetésedhez
2. **Próbáld ki az első telepítést**: Kövesd az [Első Projekt Útmutatót](first-project.md)
3. **Fedezd fel a sablonokat**: Böngéssz az elérhető sablonok között az `azd template list` segítségével
4. **Konfiguráld az IDE-det**: Állítsd be a fejlesztői környezetedet

## Támogatás

Ha problémákba ütközöl:
- [Hivatalos Dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Hibák Jelentése](https://github.com/Azure/azure-dev/issues)
- [Közösségi Beszélgetések](https://github.com/Azure/azure-dev/discussions)
- [Azure Támogatás](https://azure.microsoft.com/support/)

---

**Fejezet navigáció:**
- **📚 Kurzus Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 1. fejezet - Alapok és Gyors Kezdés
- **⬅️ Előző**: [AZD Alapok](azd-basics.md) 
- **➡️ Következő**: [Az Első Projekted](first-project.md)
- **🚀 Következő Fejezet**: [2. fejezet: AI-First Fejlesztés](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Telepítés Kész!** Folytasd az [Első Projekteddel](first-project.md), hogy elkezdhesd az azd használatát.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->