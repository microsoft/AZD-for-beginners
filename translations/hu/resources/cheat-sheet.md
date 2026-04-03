# Parancs Gyorsútmutató - Lényeges AZD Parancsok

**Gyors Hivatkozás Minden Fejezethez**
- **📚 Tanfolyam Kezdőlap**: [AZD Kezdőknek](../README.md)
- **📖 Gyors Kezdés**: [1. fejezet: Alapok és Gyors Kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Parancsok**: [2. fejezet: AI-első Fejlesztés](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Haladó**: [4. fejezet: Infrastruktúra mint Kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Bevezetés

Ez az átfogó gyorsútmutató gyors hivatkozást biztosít a leggyakrabban használt Azure Developer CLI parancsokhoz, kategóriák szerint rendezve, gyakorlati példákkal. Tökéletes gyors lekérdezésekhez fejlesztés, hibakeresés és napi műveletek során az azd projektekkel.

## Tanulási Célok

Ennek a gyorsútmutatónak a használatával:
- Azonnal hozzáférsz a lényeges Azure Developer CLI parancsokhoz és szintaxisukhoz
- Megérted a parancsok szervezését funkcionális kategóriák és használati esetek szerint
- Hivatkozhatsz gyakorlati példákra gyakori fejlesztési és telepítési forgatókönyveknél
- Hozzáférsz hibakereső parancsokhoz gyors hibamegoldáshoz
- Hatékonyan megtalálod a haladó konfigurációs és testreszabási lehetőségeket
- Megtalálod a környezetkezelési és többkörnyezetes munkafolyamat parancsokat

## Tanulási Eredmények

A gyorsútmutató rendszeres használatával képes leszel:
- Magabiztosan végrehajtani az azd parancsokat teljes dokumentáció nélkül
- Gyorsan megoldani gyakori problémákat megfelelő diagnosztikai parancsokkal
- Hatékonyan kezelni több környezetet és telepítési forgatókönyvet
- Szükség esetén alkalmazni az azd haladó funkcióit és konfigurációs lehetőségeit
- Rendszeres parancssorozatokkal hibakeresni a telepítési problémákat
- Optimalizálni a munkafolyamatokat hatékony azd parancsikonsok és opciók használatával

## Kezdő Lépések Parancsai

### Hitelesítés
```bash
# Jelentkezzen be az Azure-ba az AZD használatával
azd auth login

# Jelentkezzen be az Azure CLI-be (az AZD ezt használja a háttérben)
az login

# Ellenőrizze a jelenlegi fiókot
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
# Böngészés elérhető sablonok között
azd template list

# Inicializálás sablonból
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializálás a jelenlegi könyvtárban
azd init .

# Inicializálás egyedi névvel
azd init --template todo-nodejs-mongo my-awesome-app
```

## Alap Telepítési Parancsok

### Teljes Telepítési Munkafolyamat
```bash
# Telepíts mindent (ellátás + telepítés)
azd up

# Telepítés megerősítő kérdések nélkül
azd up --confirm-with-no-prompt

# Telepítés egy adott környezetbe
azd up --environment production

# Telepítés egyedi paraméterekkel
azd up --parameter location=westus2
```

### Csak Infrastruktúra
```bash
# Azure erőforrások biztosítása
azd provision

# 🧪 Előzetes infrastruktúra változások
azd provision --preview
# Megjeleníti egy próbafuttatás nézetét arról, hogy milyen erőforrások jönnének létre/módosulnának/törlődnének
# Hasonló a 'terraform plan' vagy 'bicep what-if' parancshoz - biztonságos futtatni, nem alkalmaz változtatásokat
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
# Alkalmazások építése
azd package

# Specifikus szolgáltatás építése
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

# Minden környezeti változó listázása
azd env get-values

# Környezeti változó eltávolítása
azd env unset DEBUG
```

## ⚙️ Konfigurációs Parancsok

### Globális Konfiguráció
```bash
# Az összes konfiguráció listázása
azd config show

# Globális alapértelmezések beállítása
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Konfiguráció eltávolítása
azd config unset defaults.location

# Az összes konfiguráció alaphelyzetbe állítása
azd config reset
```

### Projekt Konfiguráció
```bash
# Az azure.yaml érvényesítése
azd config validate

# Projekt információk megjelenítése
azd show

# Szolgáltatás végpontjainak lekérése
azd show --output json
```

## 📊 Monitoring és Diagnosztika

### Monitoring Irányítópult
```bash
# Azure portál monitoring irányítópult megnyitása
azd monitor

# Application Insights valós idejű mérőszámok megnyitása
azd monitor --live

# Application Insights naplózó lap megnyitása
azd monitor --logs

# Application Insights áttekintés megnyitása
azd monitor --overview
```

### Konténer Naplók Megtekintése
```bash
# Naplók megtekintése az Azure CLI segítségével (Container Apps esetén)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Naplók valós idejű követése
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Naplók megtekintése az Azure Portalon
azd monitor --logs
```

### Naplóelemzési Lekérdezések
```bash
# Naplóelemzés elérése az Azure portálon keresztül
azd monitor --logs

# Naplók lekérdezése az Azure CLI segítségével
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

# Lágon törölt erőforrások végleges eltávolítása
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

# Tekintse meg a jelenlegi konfigurációt
azd config show
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

### Infrastruktúra Kezelés
```bash
# Infrastruktúra sablonok generálása
azd infra generate

# 🧪 Infrastruktúra előnézet és tervezés
azd provision --preview
# Az infrastruktúra előkészítésének szimulálása telepítés nélkül
# Bicep/Terraform sablonokat elemez és megmutatja:
# - Hozzáadandó erőforrások (zöld +)
# - Módosítandó erőforrások (sárga ~)
# - Törlendő erőforrások (piros -)
# Biztonságos futtatás - az Azure környezetben nem történik valós változtatás

# Infrastruktur szintetizálása az azure.yaml alapján
azd infra synth
```

### Projekt Információk
```bash
# Projekt állapot és végpontok megjelenítése
azd show

# Részletes projekt információk megjelenítése JSON formátumban
azd show --output json

# Szolgáltatás végpontjainak lekérése
azd show --output json | jq '.services'
```

## 🤖 AI & Bővítmények Parancsai

### AZD Bővítmények
```bash
# Listázza az összes elérhető bővítményt (beleértve az MI-t is)
azd extension list

# Telepítse a Foundry ügynökök bővítményt
azd extension install azure.ai.agents

# Telepítse a finomhangolás bővítményt
azd extension install azure.ai.finetune

# Telepítse az egyedi modellek bővítményt
azd extension install azure.ai.models

# Frissítsen minden telepített bővítményt
azd extension upgrade --all
```

### AI Ügynök Parancsok
```bash
# Együgynök projekt inicializálása egy manifesztből
azd ai agent init -m <manifest-path-or-uri>

# Egy adott Foundry projekt célozása
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Az ügynök forráskönyvtárának megadása
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Hosztolási cél kiválasztása
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Szerver (Alfa)
```bash
# Indítsa el a MCP szervert a projektjéhez
azd mcp start

# Kezelje az eszköz hozzájárulását az MCP műveletekhez
azd copilot consent list
```

### Infrastruktúra Generálás
```bash
# IaC fájlok generálása a projektdefinícióból
azd infra generate

# Infrastruktúra szintetizálása az azure.yaml alapján
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

### Többkörnyezetes Munkafolyamat
```bash
# Környezetek beállítása
azd env new dev
azd env new staging  
azd env new production

# Telepítés fejlesztői környezetbe
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
azd config show

# Megnyitás a naplózó monitorozó műszerfal számára
azd monitor --logs

# Erőforrás állapotának ellenőrzése
azd show --output json
```

## 🔍 Hibakeresési Parancsok

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

# Sablon érvényesítése az inicializálás előtt
azd template validate <template-name>
```

## 📁 Fájl és Könyvtár Parancsok

### Projekt Szerkezet
```bash
# Jelenlegi könyvtárszerkezet megjelenítése
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
# JSON kimenet lekérése szkripteléshez
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

### Telepítési Ellenőrzés
```bash
#!/bin/bash
# Telepítés előtti ellenőrzés
azd show
azd provision --preview  # Változások előnézete telepítés előtt
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

### Erőforrás Takarítási Szkript
```bash
#!/bin/bash
# Régi környezetek takarítása
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

# Minden szolgáltatás újratelepítése
azd deploy

# Telepítés állapotának ellenőrzése
azd show --output json
```

### Helyreállítási Parancsok
```bash
# Hibás telepítésből való visszaállítás - tisztítás és újratelepítés
azd down --force --purge
azd up

# Csak az infrastruktúra újraprovisionálása
azd provision

# Csak az alkalmazás újratelepítése
azd deploy
```

## 💡 Profi Tippek

### Aliasok Gyorsabb Munkafolyamathoz
```bash
# Add hozzá a .bashrc vagy .zshrc fájlodhoz
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Függvényparancsikonsok
```bash
# Gyors környezetváltás
azd-env() {
    azd env select $1 && azd show
}

# Gyors telepítés monitoringgal
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

## 📖 Segítség és Dokumentáció

### Segítség Kérése
```bash
# Általános segítség
azd --help
azd help

# Parancsspecifikus segítség
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

# Sablondokumentáció megjelenítése
azd template show <template-name> --docs
```

---

**Tipp**: Könyvjelzőzd ezt a gyorsútmutatót, és használd a `Ctrl+F` funkciót, hogy gyorsan megtaláld a szükséges parancsokat!

---

**Navigáció**
- **Előző Lecke**: [Preflight Ellenőrzések](../docs/pre-deployment/preflight-checks.md)
- **Következő Lecke**: [Fogalomtár](glossary.md)

---

> **💡 Szeretnéd az Azure parancssegítséget az editorodban?** Telepítsd a [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) bővítményt az `npx skills add microsoft/github-copilot-for-azure` paranccsal — 37 képesség AI-hoz, Foundry-hoz, telepítéshez, diagnosztikához és még sok máshoz.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:  
Ez a dokumentum az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum a saját nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt a professzionális emberi fordítás igénybevétele. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->