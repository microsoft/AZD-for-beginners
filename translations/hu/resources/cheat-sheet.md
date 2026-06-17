# Parancs Gyorssegéd - Lényeges AZD Parancsok

**Gyors Referencia Minden Fejezethez**
- **📚 Tanfolyam Kezdőlap**: [AZD Kezdőknek](../README.md)
- **📖 Gyors Kezdés**: [1. fejezet: Alapok és Gyors Kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Parancsok**: [2. fejezet: AI-Központú Fejlesztés](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Haladó**: [4. fejezet: Infrastruktúra Kódként](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Bevezetés

Ez az átfogó gyorssegéd könnyű hozzáférést nyújt a leggyakrabban használt Azure Developer CLI parancsokhoz, kategóriák szerint rendszerezve gyakorlati példákkal. Tökéletes gyors kereséshez fejlesztés, hibakeresés és napi működés során az azd projektekkel.

## Tanulási Célok

Ezzel a gyorssegéd segítségével:
- Azonnal hozzáférsz az alapvető Azure Developer CLI parancsokhoz és szintaxisukhoz
- Megérted a parancsok funkcionális kategóriák szerinti felépítését és felhasználási eseteket
- Hivatkozhatsz gyakorlati példákra gyakori fejlesztési és telepítési helyzetekben
- Hozzáférsz a hibakeresési parancsokhoz gyors probléma megoldáshoz
- Hatékonyan megtalálod a haladó konfigurációs és testreszabási lehetőségeket
- Megtalálod a környezetkezelési és többkörnyezetes munkafolyamat parancsokat

## Tanulási Eredmények

A gyorssegéd rendszeres használatával képes leszel:
- Magabiztosan futtatni az azd parancsokat anélkül, hogy a teljes dokumentációt át kellene nézni
- Gyorsan megoldani gyakori problémákat a megfelelő diagnosztikai parancsok segítségével
- Hatékonyan kezelni több környezetet és telepítési helyzetet
- Szükség szerint alkalmazni haladó azd funkciókat és konfigurációs lehetőségeket
- Rendszeresen hibakeresni telepítési problémákat szisztematikus parancssorozatokkal
- Optimalizálni a munkafolyamatokat az azd gyorsparancsok és opciók hatékony használatával

## Kezdő Parancsok

### Hitelesítés
```bash
# Bejelentkezés az Azure-ba az AZD használatával
azd auth login

# Bejelentkezés az Azure CLI-be (az AZD ezt használja a háttérben)
az login

# Az aktuális fiók ellenőrzése
az account show

# Alapértelmezett előfizetés beállítása
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Kijelentkezés az AZD-ből
azd auth logout

# Kijelentkezés az Azure CLI-ből
az logout
```

### Projekt Inicializálás
```bash
# Böngésszen a rendelkezésre álló sablonok között
azd template list

# Inicializálás sablon alapján
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializálás az aktuális könyvtárban
azd init .

# Inicializálás egyéni névvel
azd init --template todo-nodejs-mongo my-awesome-app
```

## Alap Telepítési Parancsok

### Teljes Telepítési Munkafolyamat
```bash
# Minden telepítése (előkészítés + telepítés)
azd up

# Telepítés megerősítő promptok nélkül
azd up --confirm-with-no-prompt

# Telepítés meghatározott környezetbe
azd up --environment production

# Telepítés egyedi paraméterekkel
azd up --parameter location=westus2
```

### Csak Infrastruktúra
```bash
# Azure erőforrások biztosítása
azd provision

# 🧪 Infrastruktúra változások előnézete
azd provision --preview
# Egy próba-futtatási nézetet mutat arról, hogy milyen erőforrások lennének létrehozva/módosítva/törölve
# Hasonló a 'terraform plan' vagy 'bicep what-if' parancshoz – biztonságos futtatni, nem alkalmaz változásokat
```

### Csak Alkalmazás
```bash
# Alkalmazáskód telepítése
azd deploy

# Egy adott szolgáltatás telepítése
azd deploy --service web
azd deploy --service api

# Minden szolgáltatás telepítése
azd deploy --all
```

### Build és Csomagolás
```bash
# Az alkalmazásfüggőségek visszaállítása (letöltése)
azd restore

# Egy adott szolgáltatás visszaállítása
azd restore --service api

# Telepíthető fájl létrehozása telepítés nélkül
azd package

# Egy adott szolgáltatás fordítása
azd package --service api
```

> **`azd restore`** letölti az alkalmazás függőségeit (npm, pip, NuGet, Maven, stb.). Ez automatikusan lefut az `azd package` és `azd deploy` parancsok során, ezért ritkán hívod meg közvetlenül – kézzel futtasd előre a függőségek letöltéséhez (például CI cache melegítésére vagy offline munkához).

> **`azd package`** elkészíti a telepíthető csomagot (konténer képet vagy zip-et) **anélkül**, hogy azt az Azure-ba tolná. Használd önállóan a build sikerének ellenőrzésére, a kimenet vizsgálatára vagy egy másik folyamat számára gyártott csomag előállítására. Az `azd deploy` automatikusan csomagol, ezért csak akkor kell az `azd package`, ha a csomagot telepítés nélkül szeretnéd előállítani.


## 🌍 Környezetkezelés

### Környezet Műveletek
```bash
# Az összes környezet listázása
azd env list

# Új környezet létrehozása
azd env new development
azd env new staging --location westus2

# Környezet kiválasztása
azd env select production

# Elérhető környezetek megjelenítése
azd env list

# Környezet állapotának frissítése
azd env refresh
```

### Környezeti Változók
```bash
# Környezeti változó beállítása
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Környezeti változó lekérése
azd env get API_KEY

# Minden környezeti változó felsorolása
azd env get-values

# Környezeti változó eltávolítása
azd env unset DEBUG
```

## ⚙️ Konfigurációs Parancsok

### Globális Konfiguráció
```bash
# Az összes konfiguráció listázása
azd config show

# Globális alapértelmezett értékek beállítása
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Konfiguráció eltávolítása
azd config unset defaults.location

# Az összes konfiguráció visszaállítása
azd config reset
```

### Projekt Konfiguráció
```bash
# Ellenőrizze az azure.yaml fájlt
azd config validate

# Projektinformációk megjelenítése
azd show

# Szolgáltatási végpontok lekérése
azd show --output json
```

## 📊 Monitorozás és Diagnosztika

### Monitorozó Műszerfal
```bash
# Nyissa meg az Azure portál felügyeleti műszerfalát
azd monitor

# Nyissa meg az Application Insights élő metrikáit
azd monitor --live

# Nyissa meg az Application Insights naplópaneljét
azd monitor --logs

# Nyissa meg az Application Insights áttekintést
azd monitor --overview
```

### Konténer Naplók Nézése
```bash
# Naplók megtekintése az Azure CLI-n keresztül (Container Apps esetén)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Naplók valós időben történő követése
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Naplók megtekintése az Azure Portalon
azd monitor --logs
```

### Log Analytics Lekérdezések
```bash
# A hozzáférési naplóelemzés elérése az Azure portálon keresztül
azd monitor --logs

# Naplók lekérdezése az Azure CLI segítségével
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Karbantartó Parancsok

### Takarítás
```bash
# Minden Azure erőforrás eltávolítása
azd down

# Megerősítés nélküli végleges törlés
azd down --force

# Lágy törlésű erőforrások törlése
azd down --purge

# Teljes tisztítás
azd down --force --purge
```

### Frissítések
```bash
# Ellenőrizze az azd frissítéseket
azd version

# Az aktuális verzió lekérése
azd version

# A jelenlegi konfiguráció megtekintése
azd config show
```

## 🔧 Haladó Parancsok

### Pipeline és CI/CD
```bash
# GitHub Actions konfigurálása
azd pipeline config

# Azure DevOps konfigurálása
azd pipeline config --provider azdo

# Pipeline konfiguráció megjelenítése
azd pipeline show
```

### Infrastruktúra Kezelés
```bash
# Infrastruktúra sablonok generálása
azd infra generate

# 🧪 Infrastruktúra előnézet és tervezés
azd provision --preview
# Az infrastruktúra előkészítésének szimulálása telepítés nélkül
# Bicep/Terraform sablonok elemzése és megjelenítése:
# - Hozzáadandó erőforrások (zöld +)
# - Módosítandó erőforrások (sárga ~)
# - Törlendő erőforrások (piros -)
# Biztonságos futtatás - tényleges változtatások nélkül az Azure környezetben

# Infrastrukturális szintézis az azure.yaml fájlból
azd infra synth
```

### Projekt Információ
```bash
# Projekt állapotának és végpontjainak megjelenítése
azd show

# Részletes projektinformációk megjelenítése JSON formátumban
azd show --output json

# Szolgáltatási végpontok lekérése
azd show --output json | jq '.services'
```

## 🤖 AI & Kiterjesztések Parancsok

### AZD Kiterjesztések
```bash
# Az összes elérhető bővítmény listázása (beleértve az AI-t is)
azd extension list

# Telepítse a Foundry ügynökök bővítményt
azd extension install azure.ai.agents

# Telepítse az ügynök készségek bővítményt (előnézet)
azd extension install azure.ai.skills

# Telepítse a Foundry kapcsolatok bővítményt (előnézet)
azd extension install azure.ai.connections

# Telepítse a finomhangolás bővítményt
azd extension install azure.ai.finetune

# Telepítse az egyedi modellek bővítményt
azd extension install azure.ai.models

# Frissítsen minden telepített bővítményt
azd extension upgrade --all
```

### AI Ügynök Parancsok
```bash
# Ügynök projekt inicializálása egy manifesztből
azd ai agent init -m <manifest-path-or-uri>

# Egy adott Foundry projektre céloz
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Megadja az ügynök forráskönyvtárát
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Válasszon egy hosztolási célt
azd ai agent init -m agent-manifest.yaml --host containerapp

# Tesztelje a telepített ügynököt (késleltetés + első bájt ideje kiírásra kerül)
azd ai agent invoke

# Mutassa a élő végpont konfigurációját
azd ai agent endpoint show

# Értékelő adatállomány generálása, majd az ügynök optimalizálása
azd ai agent eval generate
azd ai agent optimize

# Töltse le a kód-alapú hosztolt ügynök telepített forrását
azd ai agent code download

# Töröljön egy hosztolt ügynököt és az összes verzióját (--force befejezi az aktív munkameneteket)
azd ai agent delete --force
```

### MCP Szerver (Alfa)
```bash
# Indítsa el az MCP szervert a projektjéhez
azd mcp start

# Kezelje az eszközhozzájárulást az MCP műveletekhez
azd copilot consent list
```

### Infrastruktúra Generálás
```bash
# Generálj IaC fájlokat a projektdefiníciódból
azd infra generate

# Infrastrukturát szintetizálj az azure.yaml alapján
azd infra synth
```

---

## 🎯 Gyors Munkafolyamatok

### Fejlesztési Munkafolyamat
```bash
# Új projekt indítása
azd init --template todo-nodejs-mongo
cd my-project

# Kiadás fejlesztési környezetbe
azd env new dev
azd up

# Változtatások végrehajtása és újratelepítés
azd deploy

# Megfigyelő irányítópult megnyitása
azd monitor --live
```

### Többkörnyezetes Munkafolyamat
```bash
# Környezetek beállítása
azd env new dev
azd env new staging  
azd env new production

# Telepítés fejlesztési környezetbe
azd env select dev
azd up

# Tesztelés és előléptetés staging környezetbe
azd env select staging
azd up

# Telepítés éles környezetbe
azd env select production
azd up
```

### Hibakeresési Munkafolyamat
```bash
# Engedélyezze a hibakeresési módot
export AZD_DEBUG=true

# Ellenőrizze a telepítés állapotát
azd show

# Érvényesítse a konfigurációt
azd config show

# Nyissa meg a naplózási felügyeleti műszerfalat
azd monitor --logs

# Ellenőrizze az erőforrás állapotát
azd show --output json
```

## 🔍 Hibakereső Parancsok

### Hibakeresési Információk
```bash
# Hibakeresési kimenet engedélyezése
export AZD_DEBUG=true
azd <command> --debug

# Telemetria letiltása a tisztább kimenet érdekében
export AZD_DISABLE_TELEMETRY=true

# Aktuális konfiguráció ellenőrzése
azd config show

# Hitelesítési állapot ellenőrzése
az account show
```

### Sablon Hibakeresés
```bash
# Elérhető sablonok listázása részletekkel
azd template list --output json

# Sablon információk megjelenítése
azd template show <template-name>

# Sablon ellenőrzése inicializálás előtt
azd template validate <template-name>
```

## 📁 Fájl és Könyvtár Parancsok

### Projekt Struktúra
```bash
# Jelenlegi könyvtárstruktúra megjelenítése
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigálás az azd projekt gyökeréhez
cd $(azd root)

# Az azd konfigurációs könyvtár megjelenítése
echo $AZD_CONFIG_DIR  # Általában ~/.azd
```

## 🎨 Kimenet Formázás

### JSON Kimenet
```bash
# JSON kimenet lekérése szkriptekhez
azd show --output json
azd env list --output json
azd config show --output json

# Elemzés jq-val
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Táblázatos Kimenet
```bash
# Formázás táblázatként
azd env list --output table

# Telepített szolgáltatások megtekintése
azd show --output json | jq '.services | keys'
```

## 🔧 Gyakori Parancs Kombinációk

### Állapotellenőrző Szkript
```bash
#!/bin/bash
# Gyors állapotellenőrzés
azd show
azd env get-values
azd monitor --logs
```

### Telepítési Érvényesítés
```bash
#!/bin/bash
# Elő telepítési ellenőrzés
azd show
azd provision --preview  # Változtatások előnézete a telepítés előtt
az account show
```

### Környezet Összehasonlítás
```bash
#!/bin/bash
# Környezetek összehasonlítása
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Erőforrás Takarító Szkript
```bash
#!/bin/bash
# Régi környezetek tisztítása
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Környezeti Változók

### Gyakori Környezeti Változók
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

## 🚨 Vészhelyzeti Parancsok

### Gyors Javítások
```bash
# Hitelesítés visszaállítása
az account clear
az login

# Környezet frissítésének kényszerítése
azd env refresh

# Az összes szolgáltatás újratelepítése
azd deploy

# Telepítési állapot ellenőrzése
azd show --output json
```

### Helyreállító Parancsok
```bash
# Helyreállítás sikertelen telepítésből - tisztítás és újratelepítés
azd down --force --purge
azd up

# Csak az infrastruktúra újraprovisionálása
azd provision

# Csak az alkalmazás újratelepítése
azd deploy
```

## 💡 Profi Tippek

### Gyorsabb Munkafolyamat Aliások
```bash
# Add hozzá a .bashrc vagy .zshrc fájlodhoz
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funkció Gyorsparancsok
```bash
# Gyors környezetváltás
azd-env() {
    azd env select $1 && azd show
}

# Gyors telepítés megfigyeléssel
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Környezet állapota
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Súgó és Dokumentáció

### Súgó Kérése
```bash
# Általános segítség
azd --help
azd help

# Parancs-specifikus segítség
azd up --help
azd env --help
azd config --help

# Verzió és build információk megjelenítése
azd version
azd version --output json
```

### Dokumentációs Linkek
```bash
# Dokumentáció megnyitása a böngészőben
azd docs

# Sablon dokumentáció megjelenítése
azd template show <template-name> --docs
```

---

**Tipp**: Könyvjelzőzd ezt a gyorssegédet, és használd a `Ctrl+F`-et a szükséges parancsok gyors megtalálásához!

---

**Navigáció**
- **Előző Lecke**: [Preflight Ellenőrzések](../docs/pre-deployment/preflight-checks.md)
- **Következő Lecke**: [Fogalomtár](glossary.md)

---

> **💡 Szeretnél Azure parancssegítséget a szerkesztődben?** Telepítsd a [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) kiegészítőt `npx skills add microsoft/github-copilot-for-azure` paranccsal — 37 képesség AI-hoz, Foundry-hoz, telepítéshez, diagnosztikához és még sok más.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->