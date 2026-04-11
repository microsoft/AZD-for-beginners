# Telepítési és beállítási útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 1. fejezet - Alapok és gyors kezdés
- **⬅️ Előző**: [AZD alapok](azd-basics.md)
- **➡️ Következő**: [Az első projekted](first-project.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Bevezetés

Ez az átfogó útmutató végigvezeti az Azure Developer CLI (azd) telepítésén és konfigurálásán a rendszereden. Megismerheted az operációs rendszeredhez tartozó különféle telepítési módszereket, az autentikáció beállítását és az első konfigurációt, hogy fejlesztői környezeted felkészüljön az Azure telepítésekre.

## Tanulási célok

A lecke végére képes leszel:
- Sikeresen telepíteni az Azure Developer CLI-t az operációs rendszereden
- Többféle módszerrel autentikálni az Azure-ral
- Bekonfigurálni a fejlesztői környezeted a szükséges előfeltételekkel
- Megérteni a különböző telepítési lehetőségeket és, hogy mikor melyiket érdemes használni
- Hibakeresni a gyakori telepítési és beállítási problémákat

## Elvárt tanulási eredmények

A lecke elvégzése után képes leszel:
- Az azd telepítése a platformodnak megfelelő módszerrel
- Autentikálás az Azure-ral az azd auth login használatával
- Telepítés ellenőrzése és alap azd parancsok tesztelése
- Fejlesztői környezet konfigurálása az azd optimális használatához
- Gyakori telepítési problémák önálló megoldása

Ez az útmutató segít az Azure Developer CLI telepítésében és konfigurálásában a rendszereden, függetlenül az operációs rendszeredtől vagy fejlesztői környezetedtől.

## Előfeltételek

Az azd telepítése előtt győződj meg róla, hogy rendelkezel:
- **Azure előfizetéssel** - [Ingyenes fiók létrehozása](https://azure.microsoft.com/free/)
- **Azure CLI** - Autentikációhoz és erőforráskezeléshez
- **Git** - Sablonok klónozásához és verziókezeléshez
- **Docker** (opcionális) - Konténerizált alkalmazásokhoz

## Telepítési módok

### Windows

#### 1. opció: Windows csomagkezelő (ajánlott)
```cmd
winget install microsoft.azd
```

#### 2. opció: PowerShell telepítő script
```powershell
# Hasznos, ha a winget nem elérhető
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 3. opció: Chocolatey
```cmd
choco install azd
```

#### 4. opció: Kézi telepítés
1. Töltsd le a legfrissebb kiadást a [GitHub-ról](https://github.com/Azure/azure-dev/releases)
2. Csomagold ki a `C:\Program Files\azd\` helyre
3. Add hozzá a PATH környezeti változóhoz

### macOS

#### 1. opció: Homebrew (ajánlott)
```bash
brew tap azure/azd
brew install azd
```

#### 2. opció: Telepítő script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 3. opció: Kézi telepítés
```bash
# Letöltés és telepítés
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 1. opció: Telepítő script (ajánlott)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 2. opció: Csomagkezelők

**Kézi telepítés a kiadási fájlokból:**
```bash
# Töltse le a legújabb archívumot a Linux architektúrájához innen:
# https://github.com/Azure/azure-dev/releases
# Ezután csomagolja ki, és adja hozzá az azd binárist az útvonalához (PATH).
```

### GitHub Codespaces

Néhány Codespace és fejlesztői konténer környezet már tartalmazza az `azd`-t, de ezt ellenőrizni kell, nem feltételezni:

```bash
azd version
```

Ha hiányzik az `azd`, telepítsd a környezethez tartozó szabványos scripttel.

### Docker

```bash
# Az azd futtatása konténerben
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Alias létrehozása a könnyebb használathoz
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Telepítés ellenőrzése

A telepítés után ellenőrizd, hogy az azd megfelelően működik:

```bash
# Verzió ellenőrzése
azd version

# Segítség megtekintése
azd --help

# Elérhető sablonok listázása
azd template list
```

Várt kimenet:
```
azd version 1.x.x (commit xxxxxx)
```

**Megjegyzés**: A konkrét verziószám változhat. Nézd meg a legfrissebb verziót az [Azure Developer CLI kiadások](https://github.com/Azure/azure-dev/releases) oldalon.

**✅ Telepítési sikeresség ellenőrzőlista:**
- [ ] Az `azd version` verziószámot mutat hibák nélkül
- [ ] Az `azd --help` megjeleníti a parancs dokumentációt
- [ ] Az `azd template list` listázza a rendelkezésre álló sablonokat
- [ ] Tudsz új teszt mappát létrehozni és sikeresen futtatni az `azd init` parancsot

**Ha minden ellenőrzés sikeres, folytathatsz a [Az első projekted](first-project.md) leckével!**

## Autentikáció beállítása

### Ajánlott kezdő beállítás

AZD-alapú munkafolyamatokhoz jelentkezz be az `azd auth login` paranccsal.

```bash
# Szükséges az olyan AZD parancsokhoz, mint az azd up
azd auth login

# Az AZD hitelesítési állapotának ellenőrzése
azd auth login --check-status
```

Az Azure CLI bejelentkezést csak akkor használd, ha saját magad futtatsz `az` parancsokat a tanfolyam során.

### Azure CLI autentikáció (opcionális)
```bash
# Telepítse az Azure CLI-t, ha még nincs telepítve
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: tekintse meg az Azure CLI telepítési dokumentációját a disztribúciójához

# Jelentkezzen be az Azure-ba
az login

# Hitelesítés ellenőrzése
az account show
```

### Melyik bejelentkezési folyamatot használd?

- Használd az `azd auth login`-t, ha az AZD kezdő útvonalat követed, és főleg az `azd` parancsokat használod.
- Használd az `az login`-t is, ha szeretnél közvetlenül Azure CLI parancsokat futtatni, például `az account show` vagy erőforrásokat ellenőrizni.
- Ha egy gyakorlat mind az `azd`, mind az `az` parancsokat tartalmaz, akkor mindkét bejelentkezést egyszer futtasd a kezdésnél.

### Eszköz kódos autentikáció
Ha fej nélküli rendszeren vagy böngésző problémáid vannak:
```bash
azd auth login --use-device-code
```

### Szolgáltatás alapú hitelesítés (CI/CD)
Automatizált környezetekben:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Teljes beállítás ellenőrzése

Ha gyorsan szeretnéd ellenőrizni a készenlétet az 1. fejezet megkezdése előtt:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfiguráció

### Globális konfiguráció
```bash
# Alapértelmezett előfizetés beállítása
azd config set defaults.subscription <subscription-id>

# Alapértelmezett hely beállítása
azd config set defaults.location eastus2

# Az összes konfiguráció megtekintése
azd config show
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
3. Keresd meg az "Azure Developer CLI" kifejezést
4. Telepítsd a bővítményt

Funkciók:
- IntelliSense az azure.yaml-hoz
- Integrált terminál parancsokkal
- Sablon böngészés
- Telepítés figyelése

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
2. Konfiguráld az Azure hitelesítési adatokat
3. Használj integrált terminált az azd parancsokhoz

## 🐛 Telepítési hibák elhárítása

### Gyakori problémák

#### Jogosultság megtagadva (Windows)
```powershell
# Futtassa a PowerShellt rendszergazdaként
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH problémák
Add hozzá manuálisan az azd-t a PATH-hoz:

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
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: távolítsa el az előző azd binárist vagy szimbolikus linket az újratelepítés előtt

# Konfiguráció tisztítása
rm -rf ~/.azd
```

### További segítség

```bash
# Engedélyezze a hibakeresési naplózást
export AZD_DEBUG=true
azd <command> --debug

# Nézze meg a jelenlegi konfigurációt
azd config show

# Nézze meg az aktuális telepítési állapotot
azd show
```

## azd frissítése

### Frissítés ellenőrzése
Az azd figyelmeztet, ha újabb kiadás érhető el, és megtekintheted a jelenlegi verziót a következővel:
```bash
azd version
```

### Kézi frissítés

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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

**Azure CLI (az)**: Alacsony szintű eszköz az egyedi Azure erőforrások kezelésére
- `az webapp create`, `az storage account create`
- Egy erőforrás egyszerre
- Infrastruktúra kezelési fókusz

**Azure Developer CLI (azd)**: Magas szintű eszköz teljes alkalmazás telepítésekhez
- `azd up` az egész alkalmazás összes erőforrásával telepítve
- Sablon alapú munkafolyamatok
- Fejlesztői produktivitás fókusz

**Mindkettőre szükséged van**: azd használja az az CLI-t az autentikációhoz
</details>

<details>
<summary><strong>Használhatom az azd-t meglévő Azure erőforrásokkal?</strong></summary>

Igen! Megteheted:
1. Meglévő erőforrások importálása az azd környezetekbe
2. Meglévő erőforrásokra hivatkozás Bicep sablonokban
3. Új telepítések végrehajtása az azd használatával a meglévő infrastruktúrával együtt

Részletekért lásd: [Konfigurációs útmutató](configuration.md).
</details>

<details>
<summary><strong>Működik az azd az Azure Government vagy Azure China környezetekben?</strong></summary>

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
<summary><strong>Használhatom az azd-t CI/CD pipeline-okban?</strong></summary>

Abszolút! Az azd az automatizálásra lett tervezve:
- GitHub Actions integráció
- Azure DevOps támogatás
- Szolgáltatás alapú hitelesítés
- Interakció nélküli mód

CI/CD mintákért lásd: [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Mennyibe kerül az azd használata?</strong></summary>

Az azd **teljesen ingyenes** és nyílt forráskódú. Csak az alábbiakért fizetsz:
- Az Azure-ban telepített erőforrásokért
- Azure fogyasztás (számítási kapacitás, tárolás stb.) költségeiért

Használd az `azd provision --preview` parancsot a költségek előzetes becslésére.
</details>

## Következő lépések

1. **Autentikáció befejezése**: Győződj meg róla, hogy hozzáférsz az Azure előfizetésedhez
2. **Kezdd el az első telepítést**: Kövesd az [Első projekt útmutatót](first-project.md)
3. **Fedezd fel a sablonokat**: Böngészd az elérhető sablonokat az `azd template list` paranccsal
4. **Állítsd be az IDE-det**: Konfiguráld a fejlesztői környezetedet

## Támogatás

Ha problémába ütközöl:
- [Hivatalos dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Hibabejelentés](https://github.com/Azure/azure-dev/issues)
- [Közösségi beszélgetések](https://github.com/Azure/azure-dev/discussions)
- [Azure támogatás](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Szerezz Azure parancs útmutatást közvetlenül a szerkesztődben az `npx skills add microsoft/github-copilot-for-azure` parancs segítségével

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 1. fejezet - Alapok és gyors kezdés
- **⬅️ Előző**: [AZD alapok](azd-basics.md)
- **➡️ Következő**: [Az első projekted](first-project.md)
- **🚀 Következő fejezet**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Telepítés kész!** Folytasd az [Az első projekted](first-project.md) leckével, hogy elkezdhesd az azd használatát.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ezt a dokumentumot az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) használatával fordítottuk le. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítás hibákat vagy pontatlanságokat tartalmazhat. Az eredeti dokumentum anyanyelvű változata tekintendő hiteles forrásnak. Kritikus információk esetén szakmai emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből az átiratból eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->