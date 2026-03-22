# Příručka příkazů - Základní příkazy AZD

**Rychlý přehled pro všechny kapitoly**
- **📚 Domov kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Rychlý start**: [Kapitola 1: Základy a rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Příkazy AI**: [Kapitola 2: Vývoj orientovaný na AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Kapitola 4: Infrastruktura jako kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Tento komplexní přehled poskytuje rychlou referenci pro nejčastěji používané příkazy Azure Developer CLI, uspořádané podle kategorií s praktickými příklady. Ideální pro rychlé dohledání během vývoje, řešení problémů a každodenních operací s projekty azd.

## Vzdělávací cíle

Používáním tohoto přehledu budete:
- Mít okamžitý přístup k základním příkazům a syntaxi Azure Developer CLI
- Rozumět organizaci příkazů podle funkčních kategorií a použití
- Najít praktické příklady pro běžné scénáře vývoje a nasazení
- Přistupovat k diagnostickým příkazům pro rychlé řešení problémů
- Efektivně najít pokročilé možnosti konfigurace a přizpůsobení
- Lokalizovat příkazy pro správu prostředí a pracovní postupy s více prostředími

## Očekávané výsledky učení

Při pravidelném odkazování na tento přehled budete schopni:
- Spouštět příkazy azd s jistotou bez nutnosti nahlížení do kompletní dokumentace
- Rychle řešit běžné problémy pomocí vhodných diagnostických příkazů
- Efektivně spravovat více prostředí a scénářů nasazení
- Aplikovat pokročilé funkce azd a možnosti konfigurace podle potřeby
- Řešit problémy s nasazením pomocí systematických sekvencí příkazů
- Optimalizovat pracovní postupy efektivním používáním zkratek a voleb azd

## Začínáme - příkazy

### Autentizace
```bash
# Přihlásit se do Azure přes AZD
azd auth login

# Přihlásit se do Azure CLI (AZD to používá na pozadí)
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
# Nasadit vše (provisionování + nasazení)
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
# Nasazení prostředků Azure
azd provision

# 🧪 Náhled změn infrastruktury
azd provision --preview
# Zobrazuje náhled v režimu suchého běhu, které prostředky by byly vytvořeny/upraveny/odstraněny
# Podobné jako 'terraform plan' nebo 'bicep what-if' – bezpečné ke spuštění, žádné změny nebudou provedeny
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

### Kompilace a balení
```bash
# Sestavit aplikace
azd package

# Sestavit konkrétní službu
azd package --service api
```

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

# Zobrazit aktuální prostředí
azd env show

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
# Vypsat všechny konfigurace
azd config list

# Nastavit globální výchozí hodnoty
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Odstranit konfiguraci
azd config unset defaults.location

# Resetovat všechna nastavení
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

# Otevřít přehled v Application Insights
azd monitor --overview
```

### Zobrazení logů kontejnerů
```bash
# Zobrazit protokoly pomocí Azure CLI (pro Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Sledovat protokoly v reálném čase
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Zobrazit protokoly z Azure portálu
azd monitor --logs
```

### Dotazy v Log Analytics
```bash
# Přístup k Log Analytics přes Azure Portal
azd monitor --logs

# Provádějte dotazy v protokolech pomocí Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Údržbové příkazy

### Vyčištění
```bash
# Odstranit všechny prostředky Azure
azd down

# Vynutit odstranění bez potvrzení
azd down --force

# Trvale vymazat dočasně smazané prostředky
azd down --purge

# Dokončit úklid
azd down --force --purge
```

### Aktualizace
```bash
# Zkontrolovat aktualizace azd
azd version

# Získat aktuální verzi
azd version

# Zobrazit aktuální konfiguraci
azd config list
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
# Vygenerovat šablony infrastruktury
azd infra generate

# 🧪 Náhled a plánování infrastruktury
azd provision --preview
# Simuluje zřizování infrastruktury bez nasazení
# Analyzuje šablony Bicep/Terraform a ukazuje:
# - Zdroje, které budou přidány (zelené +)
# - Zdroje, které budou upraveny (žluté ~)
# - Zdroje, které budou odstraněny (červené -)
# Bezpečné spuštění - nejsou provedeny žádné skutečné změny v prostředí Azure

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
# Zobrazit všechna dostupná rozšíření (včetně AI)
azd extension list

# Nainstalovat rozšíření Foundry agents
azd extension install azure.ai.agents

# Nainstalovat rozšíření pro doladění
azd extension install azure.ai.finetune

# Nainstalovat rozšíření pro vlastní modely
azd extension install azure.ai.models

# Aktualizovat všechna nainstalovaná rozšíření
azd extension upgrade --all
```

### Příkazy AI agenta
```bash
# Inicializovat projekt agenta z manifestu
azd ai agent init -m <manifest-path-or-uri>

# Zacílit na konkrétní projekt Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Určit zdrojový adresář agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Zvolit hostingový cíl
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Spusťte MCP server pro váš projekt
azd mcp start

# Spravujte souhlasy nástrojů pro operace MCP
azd mcp consent
```

### Generování infrastruktury
```bash
# Vygenerujte IaC soubory z definice vašeho projektu
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

# Nasadit do vývoje
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

# Nasadit do dev
azd env select dev
azd up

# Otestovat a nasadit na staging
azd env select staging
azd up

# Nasadit do produkce
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
azd config list

# Otevřít monitorovací panel pro protokoly
azd monitor --logs

# Zkontrolovat stav prostředků
azd show --output json
```

## 🔍 Ladicí příkazy

### Informace pro ladění
```bash
# Povolit ladicí výstup
export AZD_DEBUG=true
azd <command> --debug

# Zakázat telemetrii pro čistší výstup
export AZD_DISABLE_TELEMETRY=true

# Zkontrolovat aktuální konfiguraci
azd config list

# Zkontrolovat stav autentizace
az account show
```

### Ladění šablon
```bash
# Vypsat dostupné šablony s podrobnostmi
azd template list --output json

# Zobrazit informace o šabloně
azd template show <template-name>

# Ověřit šablonu před inicializací
azd template validate <template-name>
```

## 📁 Příkazy pro soubory a adresáře

### Struktura projektu
```bash
# Zobrazit aktuální strukturu adresářů
tree /f  # Windows
find . -type f  # Linux/macOS

# Přejít do kořenového adresáře projektu azd
cd $(azd root)

# Zobrazit konfigurační adresář azd
echo $AZD_CONFIG_DIR  # Obvykle ~/.azd
```

## 🎨 Formátování výstupu

### Výstup v JSON
```bash
# Získat JSON výstup pro skriptování
azd show --output json
azd env list --output json
azd config list --output json

# Parsovat pomocí jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Výstup v tabulce
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
azd env show
azd monitor --logs
```

### Ověření nasazení
```bash
#!/bin/bash
# Ověření před nasazením
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

### Skript pro vyčištění prostředků
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

### Rychlé opravy
```bash
# Resetovat autentizaci
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

# Obnovit pouze infrastrukturu
azd provision

# Znovu nasadit pouze aplikaci
azd deploy
```

## 💡 Profesionální tipy

### Aliasy pro rychlejší pracovní postup
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
    azd env show
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

# Nápověda ke konkrétnímu příkazu
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

**Tip**: Uložte si tuto příručku do záložek a použijte `Ctrl+F` pro rychlé nalezení příkazů, které potřebujete!

---

**Navigace**
- **Předchozí lekce**: [Kontroly před nasazením](../docs/pre-deployment/preflight-checks.md)
- **Další lekce**: [Slovník](glossary.md)

---

> **💡 Chcete nápovědu k příkazům Azure ve svém editoru?** Nainstalujte [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) pomocí `npx skills add microsoft/github-copilot-for-azure` — 37 dovedností pro AI, Foundry, nasazení, diagnostiku a další.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Ač usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho originálním jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakákoli nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->