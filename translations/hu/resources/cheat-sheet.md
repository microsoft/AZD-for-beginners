# Parancs Gyorsreferencia - Alapvető AZD Parancsok

**Gyors Referencia Minden Fejezethez**
- **📚 Tanfolyam Kezdőlap**: [AZD Kezdőknek](../README.md)
- **📖 Gyors Kezdés**: [1. fejezet: Alapok & Gyors Kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Mesterséges Intelligencia Parancsok**: [2. fejezet: AI-első Fejlesztés](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Haladó**: [4. fejezet: Infrastrukturális Kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Bevezetés

Ez az átfogó gyorsreferencia a leggyakrabban használt Azure Developer CLI parancsokat tartalmazza, kategóriák szerint rendszerezve, gyakorlati példákkal. Kiválóan alkalmas gyors lekérdezésekhez fejlesztés, hibakeresés és mindennapi műveletek során az azd projektekkel.

## Tanulási Célok

Ezzel a gyorsreferenciával:
- Azonnal hozzáférsz az alapvető Azure Developer CLI parancsokhoz és szintaxisukhoz
- Megérted a parancsok szervezését funkcionális kategóriák és használati esetek szerint
- Hivatkozhatsz gyakorlati példákra a gyakori fejlesztési és telepítési forgatókönyvekhez
- Használhatod a hibakeresési parancsokat problémák gyors megoldásához
- Hatékonyan elérheted a haladó beállítási és testreszabási lehetőségeket
- Megtalálhatod a környezetkezelési és több környezetes munkafolyamat parancsokat

## Tanulási Eredmények

A gyorsreferencia rendszeres használatával képes leszel:
- Magabiztosan futtatni az azd parancsokat anélkül, hogy a teljes dokumentációt néznéd
- Gyorsan megoldani a gyakori problémákat a megfelelő diagnosztikai parancsokkal
- Hatékonyan kezelni több környezetet és telepítési forgatókönyvet
- Alkalmazni a haladó azd funkciókat és beállítási lehetőségeket szükség esetén
- Rendszeres parancssorozatokkal hibaelhárítani a telepítési problémákat
- Optimalizálni a munkafolyamatokat az azd gyorsbillentyűinek és opcióinak hatékony használatával

## Kezdő Parancsok

### Hitelesítés
```bash
# Jelentkezzen be az Azure-ba az AZD segítségével
azd auth login

# Jelentkezzen be az Azure CLI-be (AZD ezt a háttérben használja)
az login

# Ellenőrizze az aktuális fiókot
az account show

# Állítsa be az alapértelmezett előfizetést
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Jelentkezzen ki az AZD-ből
azd auth logout

# Jelentkezzen ki az Azure CLI-ből
az logout
```

### Projekt Inicializálás
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

## Alapvető Telepítési Parancsok

### Teljes Telepítési Munkafolyamat
```bash
# Telepítsen mindent (beszerzés + telepítés)
azd up

# Telepítés megerősítő felugró ablakok nélkül
azd up --confirm-with-no-prompt

# Telepítés meghatározott környezetbe
azd up --environment production

# Telepítés egyéni paraméterekkel
azd up --parameter location=westus2
```

### Csak Infrastruktúra
```bash
# Azure erőforrások biztosítása
azd provision

# 🧪 Előzetes infrastruktúra változások megtekintése
azd provision --preview
# Szárazfutás nézet megjelenítése arról, hogy mely erőforrások jönnének létre/módosulnának/törlődnének
# Hasonló a 'terraform plan' vagy 'bicep what-if' parancsokhoz - biztonságos a futtatás, nincs alkalmazott változtatás
```

### Csak Alkalmazás
```bash
# Alkalmazáskód telepítése
azd deploy

# Konkrét szolgáltatás telepítése
azd deploy --service web
azd deploy --service api

# Minden szolgáltatás telepítése
azd deploy --all
```

### Build és Csomagolás
```bash
# Alkalmazások építése
azd package

# Egy adott szolgáltatás építése
azd package --service api
```

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

# Jelenlegi környezet megjelenítése
azd env show

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

# Az összes környezeti változó listázása
azd env get-values

# Környezeti változó eltávolítása
azd env unset DEBUG
```

## ⚙️ Beállítási Parancsok

### Globális Beállítások
```bash
# Az összes konfiguráció listázása
azd config list

# Globális alapértelmezések beállítása
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Konfiguráció eltávolítása
azd config unset defaults.location

# Minden konfiguráció visszaállítása
azd config reset
```

### Projekt Beállítások
```bash
# Az azure.yaml érvényesítése
azd config validate

# Projekt információk megjelenítése
azd show

# Szolgáltatási végpontok lekérése
azd show --output json
```

## 📊 Monitoring és Diagnosztika

### Monitoring Műszerfal
```bash
# Azure portál megfigyelési műszerfalának megnyitása
azd monitor

# Application Insights élő metrikáinak megnyitása
azd monitor --live

# Application Insights naplók lap megnyitása
azd monitor --logs

# Application Insights áttekintés megnyitása
azd monitor --overview
```

### Konténer Naplók Megtekintése
```bash
# Naplók megtekintése az Azure CLI segítségével (Container Apps esetén)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Valós idejű naplók követése
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Naplók megtekintése az Azure Portal segítségével
azd monitor --logs
```

### Naplóelemzési Lekérdezések
```bash
# Hozzáférés a naplóelemzéshez az Azure Portálon keresztül
azd monitor --logs

# Naplók lekérdezése Azure CLI segítségével
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Karbantartó Parancsok

### Takarítás
```bash
# Távolítson el minden Azure erőforrást
azd down

# Erőltetett törlés megerősítés nélkül
azd down --force

# Puha törölt erőforrások végleges törlése
azd down --purge

# Teljes tisztítás
azd down --force --purge
```

### Frissítések
```bash
# Ellenőrizze az azd frissítéseket
azd version

# Szerezze be a jelenlegi verziót
azd version

# Tekintse meg az aktuális konfigurációt
azd config list
```

## 🔧 Haladó Parancsok

### Pipeline és CI/CD
```bash
# GitHub Actions beállítása
azd pipeline config

# Azure DevOps beállítása
azd pipeline config --provider azdo

# Pipeline konfiguráció megjelenítése
azd pipeline show
```

### Infrastruktúra Menedzsment
```bash
# Infrastruktúra sablonok generálása
azd infra generate

# 🧪 Infrastruktúra előnézet és tervezés
azd provision --preview
# Infrastruktúra előállítás szimulálása telepítés nélkül
# Bicep/Terraform sablonok elemzése és megjelenítése:
# - Hozzáadandó erőforrások (zöld +)
# - Módosítandó erőforrások (sárga ~)
# - Törlendő erőforrások (piros -)
# Biztonságos futtatás - nem történik tényleges változás az Azure környezetben

# Infrastruktúra szintetizálása az azure.yaml-ból
azd infra synth
```

### Projekt Információk
```bash
# Projekt állapotának és végpontjainak megjelenítése
azd show

# Részletes projektinformációk megjelenítése JSON formátumban
azd show --output json

# Szolgáltatási végpontok lekérése
azd show --output json | jq '.services'
```

## 🤖 AI és Kiterjesztések Parancsai

### AZD Kiterjesztések
```bash
# Sorolja fel az összes elérhető bővítményt (beleértve az MI-t is)
azd extension list

# Telepítse a Foundry agents bővítményt
azd extension install azure.ai.agents

# Telepítse a finomhangoló bővítményt
azd extension install azure.ai.finetune

# Telepítse az egyedi modellek bővítményt
azd extension install azure.ai.models

# Frissítsen minden telepített bővítményt
azd extension upgrade --all
```

### AI Ügynök Parancsok
```bash
# Ügynökprojekt inicializálása egy manifesztből
azd ai agent init -m <manifest-path-or-uri>

# Egy adott Foundry projekt kiválasztása
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Az ügynök forráskönyvtárának megadása
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Válassz egy hosztolási célpontot
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Szerver (Alpha)
```bash
# Indítsa el az MCP szervert a projektjéhez
azd mcp start

# Kezelje az eszközhozzájárulást az MCP műveletekhez
azd mcp consent
```

### Infrastruktúra Generálás
```bash
# Generáljon IaC fájlokat a projektdefinícióból
azd infra generate

# Szintezálja az infrastruktúrát az azure.yaml alapján
azd infra synth
```

---

## 🎯 Gyors Munkafolyamatok

### Fejlesztési Munkafolyamat
```bash
# Új projekt indítása
azd init --template todo-nodejs-mongo
cd my-project

# Telepítés fejlesztési környezetbe
azd env new dev
azd up

# Változtatások végrehajtása és újbóli telepítés
azd deploy

# Monitoring irányítópult megnyitása
azd monitor --live
```

### Több-környezetes Munkafolyamat
```bash
# Környezetek beállítása
azd env new dev
azd env new staging  
azd env new production

# Telepítés fejlesztésre
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
# Hibakeresési mód engedélyezése
export AZD_DEBUG=true

# Telepítési állapot ellenőrzése
azd show

# Konfiguráció érvényesítése
azd config list

# Megnyitás a naplókat tartalmazó megfigyelő irányítópultnak
azd monitor --logs

# Erőforrás állapotának ellenőrzése
azd show --output json
```

## 🔍 Debug Parancsok

### Hibakeresési Információk
```bash
# Debug kimenet engedélyezése
export AZD_DEBUG=true
azd <command> --debug

# Telemetria kikapcsolása a tisztább kimenet érdekében
export AZD_DISABLE_TELEMETRY=true

# Ellenőrizze a jelenlegi konfigurációt
azd config list

# Ellenőrizze az hitelesítési állapotot
az account show
```

### Sablon Hibakeresés
```bash
# Elérhető sablonok listázása részletekkel
azd template list --output json

# Sablon információk megjelenítése
azd template show <template-name>

# Sablon érvényesítése inicializálás előtt
azd template validate <template-name>
```

## 📁 Fájl és Könyvtár Parancsok

### Projekt Felépítés
```bash
# Jelenlegi könyvtárszerkezet megjelenítése
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigálás az azd projekt gyökérkönyvtárához
cd $(azd root)

# Az azd konfigurációs könyvtár megjelenítése
echo $AZD_CONFIG_DIR  # Általában ~/.azd
```

## 🎨 Kimenet Formázás

### JSON Kimenet
```bash
# JSON kimenet lekérése szkriptezéshez
azd show --output json
azd env list --output json
azd config list --output json

# Feldolgozás jq-val
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

### Állapot Ellenőrző Script
```bash
#!/bin/bash
# Gyors egészségügyi ellenőrzés
azd show
azd env show
azd monitor --logs
```

### Telepítés Érvényesítés
```bash
#!/bin/bash
# Előtelepítési ellenőrzés
azd show
azd provision --preview  # Változtatások előnézete telepítés előtt
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

### Erőforrás Takarító Script
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
# Hibás telepítés helyreállítása - tisztítás és újratelepítés
azd down --force --purge
azd up

# Csak az infrastruktúra újbóli biztosítása
azd provision

# Csak az alkalmazás újratelepítése
azd deploy
```

## 💡 Profi Tippek

### Gyorsabb Munkafolyamat Aliasok
```bash
# Add hozzá a .bashrc vagy .zshrc fájlodhoz
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Függvény Gyorsbillentyűk
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
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Súgó és Dokumentáció

### Segítség Kérése
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
# Dokumentáció megnyitása böngészőben
azd docs

# Sablon dokumentáció megjelenítése
azd template show <template-name> --docs
```

---

**Tipp**: Könyvjelzőzd ezt a gyorsreferenciát és használd a `Ctrl+F` billentyűkombinációt, hogy gyorsan megtaláld a szükséges parancsokat!

---

**Navigáció**
- **Előző Lecke**: [Előszelektálási Ellenőrzések](../docs/pre-deployment/preflight-checks.md)
- **Következő Lecke**: [Fogalomtár](glossary.md)

---

> **💡 Szeretnél Azure parancstámogatást a szerkesztődben?** Telepítsd a [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) csomagot az `npx skills add microsoft/github-copilot-for-azure` paranccsal — 37 készség AI-hoz, Foundry-hoz, telepítéshez, diagnosztikához és még sok máshoz.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi Nyilatkozat**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatás használatával készült. Bár igyekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hivatalos forrásnak. Kritikus információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->