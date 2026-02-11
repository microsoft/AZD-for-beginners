# Parancs Gyorsreferencia - Az alapvető AZD parancsok

**Gyors hozzáférés minden fejezethez**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../README.md)
- **📖 Gyors kezdés**: [1. fejezet: Alapok és gyors kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Mesterséges Intelligencia parancsok**: [2. fejezet: AI-First fejlesztés](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Haladó**: [4. fejezet: Kód alapú infrastruktúra](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Bevezetés

Ez az átfogó gyorsreferencia az Azure Developer CLI leggyakrabban használt parancsait tartalmazza, kategóriákba rendezve, gyakorlati példákkal. Tökéletes gyors visszakereséshez fejlesztés, hibakeresés és napi műveletek során az azd projektekkel.

## Tanulási célok

Ezzel a gyorsreferenciával:
- Azonnal hozzáférsz az alapvető Azure Developer CLI parancsokhoz és szintaxisukhoz
- Megérted a parancsok funkcionális kategóriák és használati esetek szerinti felosztását
- Gyakorlati példák alapján hivatkozhatsz a fejlesztési és telepítési forgatókönyvekre
- Hozzáférsz hibakeresési parancsokhoz gyors problémaelhárításhoz
- Hatékonyan megtalálod a haladó konfigurációs és testreszabási lehetőségeket
- Megtalálod a környezetkezelés és többkörnyezeti munkafolyamat parancsait

## Tanulási eredmények

Rendszeres használattal képes leszel:
- Magabiztosan futtatni az azd parancsokat anélkül, hogy a teljes dokumentációra szükséged lenne
- Gyorsan megoldani gyakori problémákat megfelelő diagnosztikai parancsokkal
- Hatékonyan kezelni több környezetet és telepítési forgatókönyvet
- Alkalmazni a haladó azd funkciókat és konfigurációs beállításokat szükség szerint
- Hibakeresni telepítési problémákat rendszerezett parancssorozatokkal
- Optimalizálni a munkafolyamatokat az azd gyorsbillentyűk és opciók használatával

## Kezdő parancsok

### Hitelesítés
```bash
# Bejelentkezés az Azure-ba AZD segítségével
azd auth login

# Bejelentkezés az Azure CLI-be (az AZD ezt használja a háttérben)
az login

# Aktuális fiók ellenőrzése
az account show

# Alapértelmezett előfizetés beállítása
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Kijelentkezés az AZD-ből
azd auth logout

# Kijelentkezés az Azure CLI-ből
az logout
```

### Projekt inicializálása
```bash
# Böngésszen a rendelkezésre álló sablonok között
azd template list

# Inicializálás sablonból
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializálás a jelenlegi könyvtárban
azd init .

# Inicializálás egyéni névvel
azd init --template todo-nodejs-mongo my-awesome-app
```

## Alap telepítési parancsok

### Teljes telepítési munkafolyamat
```bash
# Minden telepítése (előkészítés + telepítés)
azd up

# Telepítés megerősítő üzenetek nélkül
azd up --confirm-with-no-prompt

# Telepítés adott környezetbe
azd up --environment production

# Telepítés egyéni paraméterekkel
azd up --parameter location=westus2
```

### Csak infrastruktúra
```bash
# Azure erőforrások biztosítása
azd provision

# 🧪 Infrastruktúra változások előnézete
azd provision --preview
# Megjeleníti, hogy milyen erőforrások lennének létrehozva/módosítva/törölve próbaüzemben
# Hasonló a 'terraform plan' vagy 'bicep what-if' parancsokhoz - biztonságosan futtatható, nem alkalmaz változtatásokat
```

### Csak alkalmazás
```bash
# Alkalmazáskód telepítése
azd deploy

# Konkrét szolgáltatás telepítése
azd deploy --service web
azd deploy --service api

# Összes szolgáltatás telepítése
azd deploy --all
```

### Build és csomagolás
```bash
# Alkalmazások építése
azd package

# Specifikus szolgáltatás építése
azd package --service api
```

## 🌍 Környezetkezelés

### Környezeti műveletek
```bash
# Az összes környezet listázása
azd env list

# Új környezet létrehozása
azd env new development
azd env new staging --location westus2

# Környezet kiválasztása
azd env select production

# Aktuális környezet megjelenítése
azd env show

# Környezet állapotának frissítése
azd env refresh
```

### Környezeti változók
```bash
# Környezeti változó beállítása
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Környezeti változó lekérése
azd env get API_KEY

# Az összes környezeti változó listázása
azd env get-values

# Környezeti változó eltávolítása
azd env unset DEBUG
```

## ⚙️ Konfigurációs parancsok

### Globális konfiguráció
```bash
# Az összes konfiguráció listázása
azd config list

# Globális alapértelmezett értékek beállítása
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Konfiguráció eltávolítása
azd config unset defaults.location

# Az összes konfiguráció visszaállítása
azd config reset
```

### Projekt konfiguráció
```bash
# Az azure.yaml érvényesítése
azd config validate

# Projektinformációk megjelenítése
azd show

# Szolgáltatási végpontok lekérése
azd show --output json
```

## 📊 Monitorozás és diagnosztika

### Monitor dashboard
```bash
# Azure portál monitorozási műszerfal megnyitása
azd monitor

# Alkalmazás-információk élő metrikáinak megnyitása
azd monitor --live

# Alkalmazás-információk naplólap megnyitása
azd monitor --logs

# Alkalmazás-információk áttekintés megnyitása
azd monitor --overview
```

### Konténer naplók megtekintése
```bash
# Naplók megtekintése Azure CLI-n keresztül (Container Apps esetén)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Naplók valós idejű követése
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Naplók megtekintése az Azure Portálon
azd monitor --logs
```

### Log Analytics lekérdezések
```bash
# A Naplóelemzés elérése az Azure Portálon keresztül
azd monitor --logs

# Naplók lekérdezése az Azure CLI használatával
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Karbantartási parancsok

### Takarítás
```bash
# Az összes Azure erőforrás eltávolítása
azd down

# Megerősítés nélküli törlés kényszerítése
azd down --force

# Puha törlésű erőforrások törlése
azd down --purge

# Teljes takarítás
azd down --force --purge
```

### Frissítések
```bash
# Ellenőrizze az azd frissítéseket
azd version

# Szerezze be az aktuális verziót
azd version

# Tekintse meg az aktuális konfigurációt
azd config list
```

## 🔧 Haladó parancsok

### Pipeline és CI/CD
```bash
# GitHub Actions konfigurálása
azd pipeline config

# Azure DevOps konfigurálása
azd pipeline config --provider azdo

# Pipeline konfiguráció megjelenítése
azd pipeline show
```

### Infrastruktúra kezelés
```bash
# Infrastruktúra sablonok generálása
azd infra generate

# 🧪 Infrastruktúra előnézet és tervezés
azd provision --preview
# Infrastruktúra kiépítésének szimulálása telepítés nélkül
# Bicep/Terraform sablonok elemzése és megjelenítése:
# - Hozzáadandó erőforrások (zöld +)
# - Módosítandó erőforrások (sárga ~)
# - Törlendő erőforrások (piros -)
# Biztonságosan futtatható - az Azure környezetben nem történik tényleges változás

# Infrastrukturális szintézis az azure.yaml-ból
azd infra synth
```

### Projekt információk
```bash
# Projekt állapotának és végpontjainak megjelenítése
azd show

# Részletes projektinformációk megjelenítése JSON formátumban
azd show --output json

# Szolgáltatási végpontok lekérése
azd show --output json | jq '.services'
```

## 🎯 Gyors munkafolyamatok

### Fejlesztési munkafolyamat
```bash
# Új projekt indítása
azd init --template todo-nodejs-mongo
cd my-project

# Fejlesztésbe telepítés
azd env new dev
azd up

# Változtatások végrehajtása és újratelepítés
azd deploy

# Felügyeleti műszerfal megnyitása
azd monitor --live
```

### Többkörnyezeti munkafolyamat
```bash
# Környezetek beállítása
azd env new dev
azd env new staging  
azd env new production

# Telepítés fejlesztésre
azd env select dev
azd up

# Tesztelés és előléptetés előkészítő környezetbe
azd env select staging
azd up

# Telepítés éles környezetbe
azd env select production
azd up
```

### Hibakeresési munkafolyamat
```bash
# Debug mód engedélyezése
export AZD_DEBUG=true

# Telepítési állapot ellenőrzése
azd show

# Konfiguráció érvényesítése
azd config list

# Naplók megtekintéséhez nyissa meg a monitorozó műszerfalat
azd monitor --logs

# Erőforrás állapotának ellenőrzése
azd show --output json
```

## 🔍 Hibakereső parancsok

### Hibakeresési információk
```bash
# Debug kimenet engedélyezése
export AZD_DEBUG=true
azd <command> --debug

# Telemetria kikapcsolása a tisztább kimenetért
export AZD_DISABLE_TELEMETRY=true

# Aktuális konfiguráció ellenőrzése
azd config list

# Hitelesítési állapot ellenőrzése
az account show
```

### Sablon hibakeresés
```bash
# Elérhető sablonok listázása részletekkel
azd template list --output json

# Sablon információk megjelenítése
azd template show <template-name>

# Sablon érvényesítése az inicializálás előtt
azd template validate <template-name>
```

## 📁 Fájl- és könyvtárparancsok

### Projekt struktúra
```bash
# Jelenlegi könyvtár szerkezetének megjelenítése
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigálás az azd projekt gyökérkönyvtárához
cd $(azd root)

# Az azd konfigurációs könyvtárának megjelenítése
echo $AZD_CONFIG_DIR  # Általában ~/.azd
```

## 🎨 Kimenet formázása

### JSON kimenet
```bash
# JSON kimenet lekérése szkripteléshez
azd show --output json
azd env list --output json
azd config list --output json

# Elemzés jq-val
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Táblázatos kimenet
```bash
# Táblázatként formázás
azd env list --output table

# Telepített szolgáltatások megtekintése
azd show --output json | jq '.services | keys'
```

## 🔧 Gyakori parancs kombinációk

### Egészségellenőrző script
```bash
#!/bin/bash
# Gyors állapotellenőrzés
azd show
azd env show
azd monitor --logs
```

### Telepítési validáció
```bash
#!/bin/bash
# Előtelepítési érvényesítés
azd show
azd provision --preview  # Változtatások előnézete telepítés előtt
az account show
```

### Környezet összehasonlítás
```bash
#!/bin/bash
# Környezetek összehasonlítása
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Erőforrás takarító script
```bash
#!/bin/bash
# Régi környezetek tisztítása
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Környezeti változók

### Gyakori környezeti változók
```bash
# Azure konfiguráció
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD konfiguráció
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Alkalmazás konfiguráció
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Vészhelyzeti parancsok

### Gyors javítások
```bash
# Hitelesítés visszaállítása
az account clear
az login

# Környezet kényszerített frissítése
azd env refresh

# Az összes szolgáltatás újratelepítése
azd deploy

# Telepítési állapot ellenőrzése
azd show --output json
```

### Helyreállító parancsok
```bash
# Sikertelen telepítés helyreállítása - tisztítás és újratelepítés
azd down --force --purge
azd up

# Csak az infrastruktúra újragondozása
azd provision

# Csak az alkalmazás újratelepítése
azd deploy
```

## 💡 Profi tippek

### Gyorsabb munkafolyamat aliasok
```bash
# Add hozzá a .bashrc vagy .zshrc fájlodhoz
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funkció gyorsbillentyűk
```bash
# Gyors környezetváltás
azd-env() {
    azd env select $1 && azd show
}

# Gyors telepítés monitorozással
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Környezeti állapot
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Segítség és dokumentáció

### Segítség kérése
```bash
# Általános segítség
azd --help
azd help

# Parancs-specifikus segítség
azd up --help
azd env --help
azd config --help

# Verzió és build információ megjelenítése
azd version
azd version --output json
```

### Dokumentációs linkek
```bash
# Dokumentáció megnyitása a böngészőben
azd docs

# Sablon dokumentáció megjelenítése
azd template show <template-name> --docs
```

---

**Tipp**: Könyvjelzőzd ezt a gyorsreferenciát, és használd a `Ctrl+F`-et a kívánt parancsok gyors kereséséhez!

---

**Navigáció**
- **Előző leckéhez**: [Előzetes ellenőrzések](../docs/pre-deployment/preflight-checks.md)
- **Következő leckéhez**: [Szószedet](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ezt a dokumentumot a [Co-op Translator](https://github.com/Azure/co-op-translator) mesterséges intelligencia fordító szolgáltatás segítségével fordítottuk. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hivatalos forrásnak. Fontos információk esetén szakmai, emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->