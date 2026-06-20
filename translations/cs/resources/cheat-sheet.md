# Příručka příkazů - Základní příkazy AZD

**Rychlý přehled pro všechny kapitoly**
- **📚 Domov kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Rychlý start**: [Kapitola 1: Základy a rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Příkazy AI**: [Kapitola 2: Vývoj orientovaný na AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Kapitola 4: Infrastruktura jako kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Tato obsáhlá příručka poskytuje rychlý přehled nejčastěji používaných příkazů Azure Developer CLI, uspořádaných podle kategorií s praktickými příklady. Ideální pro rychlé dohledávání během vývoje, řešení problémů a každodenních operací s projekty azd.

## Cíle učení

Používáním této příručky získáte:
- Okamžitý přístup k základním příkazům a syntaxi Azure Developer CLI
- Porozumění organizaci příkazů dle funkčních kategorií a případů použití
- Najít praktické příklady pro běžné scénáře vývoje a nasazení
- Přístup k diagnostickým příkazům pro rychlé řešení problémů
- Efektivně najít pokročilé možnosti konfigurace a přizpůsobení
- Najít příkazy pro správu prostředí a pracovní postupy pro více prostředí

## Výsledky učení

Při pravidelném používání této příručky budete schopni:
- Spouštět příkazy azd sebevědomě bez nutnosti odkazovat se na kompletní dokumentaci
- Rychle řešit běžné problémy pomocí vhodných diagnostických příkazů
- Efektivně spravovat více prostředí a scénáře nasazení
- Používat pokročilé funkce a možnosti konfigurace azd podle potřeby
- Řešit problémy s nasazením pomocí systematických sekvencí příkazů
- Optimalizovat pracovní postupy efektivním využitím zkratek a možností azd

## Příkazy pro začátek

### Autentizace
```bash
# Přihlásit se do Azure pomocí AZD
azd auth login

# Přihlásit se do Azure CLI (AZD to používá interně)
az login

# Zkontrolovat aktuální účet
az account show

# Nastavit výchozí předplatné
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Odhlásit se z AZD
azd auth logout

# Odhlásit se z Azure CLI
az logout
```

### Inicializace projektu
```bash
# Procházet dostupné šablony
azd template list

# Inicializovat ze šablony
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializovat v aktuálním adresáři
azd init .

# Inicializovat s vlastním názvem
azd init --template todo-nodejs-mongo my-awesome-app
```

## Základní příkazy nasazení

### Kompletní pracovní postup nasazení
```bash
# Nasadit vše (přidělení zdrojů + nasazení)
azd up

# Nasadit s vypnutými potvrzovacími výzvami
azd up --confirm-with-no-prompt

# Nasadit do konkrétního prostředí
azd up --environment production

# Nasadit s vlastními parametry
azd up --parameter location=westus2
```

### Pouze infrastruktura
```bash
# Zřizování prostředků Azure
azd provision

# 🧪 Náhled změn infrastruktury
azd provision --preview
# Zobrazuje simulovaný náhled toho, které prostředky by byly vytvořeny/upraveny/odstraněny
# Podobné 'terraform plan' nebo 'bicep what-if' – bezpečné spuštění, žádné změny nejsou aplikovány
```

### Pouze aplikace
```bash
# Nasadit kód aplikace
azd deploy

# Nasadit konkrétní službu
azd deploy --service web
azd deploy --service api

# Nasadit všechny služby
azd deploy --all
```

### Sestavení a balení
```bash
# Obnovit (stáhnout) závislosti aplikace
azd restore

# Obnovit konkrétní službu
azd restore --service api

# Sestavit nasaditelný artefakt bez nasazení
azd package

# Sestavit konkrétní službu
azd package --service api
```

> **`azd restore`** stahuje závislosti vaší aplikace (npm, pip, NuGet, Maven, atd.). Spouští se automaticky během `azd package` a `azd deploy`, takže ho zřídka voláte přímo — spusťte ho ručně pro přednačtení závislostí (například pro ohřátí cache CI nebo pro následnou práci offline).

> **`azd package`** sestaví nasaditelný artefakt (obraz kontejneru nebo zip) **bez** jeho odeslání do Azure. Použijte ho samostatně k ověření úspěšného sestavení, prohlédnutí výstupu nebo vytvoření artefaktu, který později nasadí jiný proces. `azd deploy` balí automaticky, takže `azd package` potřebujete jen když chcete artefakt bez nasazení.


## 🌍 Správa prostředí

### Operace s prostředím
```bash
# Vypsat všechna prostředí
azd env list

# Vytvořit nové prostředí
azd env new development
azd env new staging --location westus2

# Vybrat prostředí
azd env select production

# Zobrazit dostupná prostředí
azd env list

# Obnovit stav prostředí
azd env refresh
```

### Proměnné prostředí
```bash
# Nastavit proměnnou prostředí
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Získat proměnnou prostředí
azd env get API_KEY

# Vypsat všechny proměnné prostředí
azd env get-values

# Odstranit proměnnou prostředí
azd env unset DEBUG
```

## ⚙️ Příkazy konfigurace

### Globální konfigurace
```bash
# Vypsat všechna nastavení
azd config show

# Nastavit globální výchozí hodnoty
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Odstranit konfiguraci
azd config unset defaults.location

# Obnovit všechna nastavení
azd config reset
```

### Konfigurace projektu
```bash
# Ověřit azure.yaml
azd config validate

# Zobrazit informace o projektu
azd show

# Získat koncové body služby
azd show --output json
```

## 📊 Monitorování a diagnostika

### Monitorovací panel
```bash
# Otevřít panel monitorování v portálu Azure
azd monitor

# Otevřít živé metriky v Application Insights
azd monitor --live

# Otevřít panel protokolů v Application Insights
azd monitor --logs

# Otevřít přehled Application Insights
azd monitor --overview
```

### Zobrazení logů kontejneru
```bash
# Zobrazit protokoly pomocí Azure CLI (pro Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Sledovat protokoly v reálném čase
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Zobrazit protokoly z Azure Portal
azd monitor --logs
```

### Dotazy Log Analytics
```bash
# Přístup k Log Analytics přes portál Azure
azd monitor --logs

# Prohledávejte protokoly pomocí Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Příkazy údržby

### Úklid
```bash
# Odstranit všechny prostředky Azure
azd down

# Vynutit smazání bez potvrzení
azd down --force

# Natrvalo odstranit dočasně smazané prostředky
azd down --purge

# Úplné vyčištění
azd down --force --purge
```

### Aktualizace
```bash
# Zkontrolovat aktualizace azd
azd version

# Získat aktuální verzi
azd version

# Zobrazit aktuální konfiguraci
azd config show
```

## 🔧 Pokročilé příkazy

### Pipeline a CI/CD
```bash
# Konfigurovat GitHub Actions
azd pipeline config

# Konfigurovat Azure DevOps
azd pipeline config --provider azdo

# Zobrazit konfiguraci pipeline
azd pipeline show
```

### Správa infrastruktury
```bash
# Generovat šablony infrastruktury
azd infra generate

# 🧪 Náhled a plánování infrastruktury
azd provision --preview
# Simuluje zřizování infrastruktury bez jejího nasazení
# Analyzuje šablony Bicep/Terraform a zobrazuje:
# - Zdroje, které budou přidány (zelené +)
# - Zdroje, které budou upraveny (žluté ~)
# - Zdroje, které budou smazány (červené -)
# Bezpečné spuštění - v prostředí Azure nejsou provedeny žádné skutečné změny

# Syntetizovat infrastrukturu z azure.yaml
azd infra synth
```

### Informace o projektu
```bash
# Zobrazit stav projektu a koncové body
azd show

# Zobrazit podrobné informace o projektu ve formátu JSON
azd show --output json

# Získat koncové body služby
azd show --output json | jq '.services'
```

## 🤖 Příkazy AI a rozšíření

### Rozšíření AZD
```bash
# Vypište všechna dostupná rozšíření (včetně AI)
azd extension list

# Nainstalujte rozšíření Foundry agents
azd extension install azure.ai.agents

# Nainstalujte rozšíření agent skills (náhled)
azd extension install azure.ai.skills

# Nainstalujte rozšíření Foundry connections (náhled)
azd extension install azure.ai.connections

# Nainstalujte rozšíření fine-tuning
azd extension install azure.ai.finetune

# Nainstalujte rozšíření custom models
azd extension install azure.ai.models

# Aktualizujte všechna nainstalovaná rozšíření
azd extension upgrade --all
```

### Příkazy AI agenta
```bash
# Inicializovat projekt agenta z manifestu
azd ai agent init -m <manifest-path-or-uri>

# Zacílit na konkrétní projekt Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Určit adresář se zdrojovým kódem agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Vybrat hostingový cíl
azd ai agent init -m agent-manifest.yaml --host containerapp

# Otestovat nasazeného agenta (vypíše latenci a čas do prvního bajtu)
azd ai agent invoke

# Zobrazit konfiguraci živého koncového bodu
azd ai agent endpoint show

# Vygenerovat evaluační datovou sadu a poté optimalizovat agenta
azd ai agent eval generate
azd ai agent optimize

# Stáhnout nasazené zdrojové soubory hostovaného agenta založeného na kódu
azd ai agent code download

# Smazat hostovaného agenta a všechny jeho verze (--force ukončí aktivní relace)
azd ai agent delete --force
```

### MCP server (Alpha)
```bash
# Spusťte MCP server pro váš projekt
azd mcp start

# Spravujte souhlas nástroje pro operace MCP
azd copilot consent list
```

### Generování infrastruktury
```bash
# Vygenerujte soubory IaC z definice vašeho projektu
azd infra generate

# Syntetizujte infrastrukturu ze souboru azure.yaml
azd infra synth
```

---

## 🎯 Rychlé pracovní postupy

### Vývojový pracovní postup
```bash
# Zahájit nový projekt
azd init --template todo-nodejs-mongo
cd my-project

# Nasadit do vývojového prostředí
azd env new dev
azd up

# Proveďte změny a znovu nasaďte
azd deploy

# Otevřít monitorovací panel
azd monitor --live
```

### Pracovní postup pro více prostředí
```bash
# Nastavit prostředí
azd env new dev
azd env new staging  
azd env new production

# Nasadit do vývojového prostředí
azd env select dev
azd up

# Otestovat a přesunout do stagingového prostředí
azd env select staging
azd up

# Nasadit do produkčního prostředí
azd env select production
azd up
```

### Pracovní postup pro řešení problémů
```bash
# Povolit režim ladění
export AZD_DEBUG=true

# Zkontrolovat stav nasazení
azd show

# Ověřit konfiguraci
azd config show

# Otevřít monitorovací panel pro protokoly
azd monitor --logs

# Zkontrolovat stav prostředků
azd show --output json
```

## 🔍 Příkazy pro ladění

### Informace pro ladění
```bash
# Povolit ladicí výstup
export AZD_DEBUG=true
azd <command> --debug

# Zakázat telemetrii pro čistší výstup
export AZD_DISABLE_TELEMETRY=true

# Zkontrolovat aktuální konfiguraci
azd config show

# Zkontrolovat stav autentizace
az account show
```

### Ladění šablon
```bash
# Seznam dostupných šablon s podrobnostmi
azd template list --output json

# Zobrazit informace o šabloně
azd template show <template-name>

# Ověřit šablonu před inicializací
azd template validate <template-name>
```

## 📁 Příkazy pro soubory a adresáře

### Struktura projektu
```bash
# Zobrazit aktuální strukturu adresáře
tree /f  # Windows
find . -type f  # Linux/macOS

# Přejít do kořenového adresáře projektu azd
cd $(azd root)

# Zobrazit adresář konfigurace azd
echo $AZD_CONFIG_DIR  # Obvykle ~/.azd
```

## 🎨 Formátování výstupu

### Výstup JSON
```bash
# Získejte výstup JSON pro skriptování
azd show --output json
azd env list --output json
azd config show --output json

# Parsujte pomocí jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Výstup ve formě tabulky
```bash
# Formátovat jako tabulku
azd env list --output table

# Zobrazit nasazené služby
azd show --output json | jq '.services | keys'
```

## 🔧 Běžné kombinace příkazů

### Skript kontroly stavu
```bash
#!/bin/bash
# Rychlá kontrola stavu
azd show
azd env get-values
azd monitor --logs
```

### Validace nasazení
```bash
#!/bin/bash
# Validace před nasazením
azd show
azd provision --preview  # Náhled změn před nasazením
az account show
```

### Porovnání prostředí
```bash
#!/bin/bash
# Porovnat prostředí
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skript pro vyčištění zdrojů
```bash
#!/bin/bash
# Vyčistit stará prostředí
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Proměnné prostředí

### Běžné proměnné prostředí
```bash
# Konfigurace Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Konfigurace AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Konfigurace aplikace
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Nouzové příkazy

### Rychlá řešení
```bash
# Resetovat ověřování
az account clear
az login

# Vynutit obnovení prostředí
azd env refresh

# Znovu nasadit všechny služby
azd deploy

# Zkontrolovat stav nasazení
azd show --output json
```

### Příkazy pro obnovu
```bash
# Obnovit po neúspěšném nasazení - vyčistit a znovu nasadit
azd down --force --purge
azd up

# Pouze znovu připravit infrastrukturu
azd provision

# Pouze znovu nasadit aplikaci
azd deploy
```

## 💡 Tipy

### Alias pro rychlejší pracovní postup
```bash
# Přidejte do svého .bashrc nebo .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Zkratky funkcí
```bash
# Rychlé přepínání prostředí
azd-env() {
    azd env select $1 && azd show
}

# Rychlé nasazení s monitorováním
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Stav prostředí
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Nápověda a dokumentace

### Získání nápovědy
```bash
# Obecná nápověda
azd --help
azd help

# Nápověda k jednotlivým příkazům
azd up --help
azd env --help
azd config --help

# Zobrazit informace o verzi a sestavení
azd version
azd version --output json
```

### Odkazy na dokumentaci
```bash
# Otevřít dokumentaci v prohlížeči
azd docs

# Zobrazit dokumentaci šablony
azd template show <template-name> --docs
```

---

**Tip**: Přidejte tuto příručku do záložek a použijte `Ctrl+F` pro rychlé nalezení příkazů, které potřebujete!

---

**Navigace**
- **Předchozí lekce**: [Kontroly před nasazením](../docs/pre-deployment/preflight-checks.md)
- **Další lekce**: [Glosář](glossary.md)

---

> **💡 Chcete pomoc s příkazy Azure ve vašem editoru?** Nainstalujte [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) pomocí `npx skills add microsoft/github-copilot-for-azure` — 37 dovedností pro AI, Foundry, nasazení, diagnostiku a další.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->