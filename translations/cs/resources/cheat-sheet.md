# Příkazový přehled - Základní příkazy AZD

**Rychlá reference pro všechny kapitoly**
- **📚 Domov kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Rychlý start**: [Kapitola 1: Základy & Rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI příkazy**: [Kapitola 2: Vývoj s prioritou AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Kapitola 4: Infrastruktura jako kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Tento komplexní přehled poskytuje rychlou referenci pro nejčastěji používané příkazy Azure Developer CLI, uspořádané podle kategorií s praktickými příklady. Ideální pro rychlé vyhledávání během vývoje, řešení problémů a každodenní práce s projekty azd.

## Cíle učení

Používáním tohoto přehledu budete:
- Mít okamžitý přístup k základním příkazům a syntaxi Azure Developer CLI
- Rozumět organizaci příkazů podle funkcí a případů použití
- Odkazovat na praktické příklady pro běžné scénáře vývoje a nasazení
- Mít přístup k příkazům pro řešení problémů a rychlé odstranění závad
- Najít pokročilé možnosti konfigurace a přizpůsobení efektivně
- Lokalizovat příkazy pro správu prostředí a workflow pro více prostředí

## Výsledky učení

Pravidelným odkazováním na tento přehled budete schopni:
- Provádět příkazy azd s jistotou bez nutnosti číst kompletní dokumentaci
- Rychle řešit běžné problémy pomocí vhodných diagnostických příkazů
- Efektivně spravovat více prostředí a scénáře nasazení
- Používat pokročilé funkce a konfigurační možnosti azd podle potřeby
- Řešit problémy s nasazením pomocí systematických sekvencí příkazů
- Optimalizovat workflow pomocí efektivního využívání zkratek a možností azd

## Začínáme - příkazy

### Autentizace
```bash
# Přihlaste se do Azure přes AZD
azd auth login

# Přihlaste se do Azure CLI (AZD to používá na pozadí)
az login

# Zkontrolujte aktuální účet
az account show

# Nastavte výchozí předplatné
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Odhlaste se z AZD
azd auth logout

# Odhlaste se z Azure CLI
az logout
```

### Inicializace projektu
```bash
# Prohlížet dostupné šablony
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

### Kompletní workflow nasazení
```bash
# Nasadit vše (provision + deploy)
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
# Zajistit prostředky Azure
azd provision

# 🧪 Náhled změn infrastruktury
azd provision --preview
# Zobrazuje simulovaný náhled toho, jaké prostředky by byly vytvořeny/upraveny/smazány
# Podobné příkazům 'terraform plan' nebo 'bicep what-if' - bezpečné spuštění, žádné změny nejsou aplikovány
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
# Sestavujte aplikace
azd package

# Sestavte konkrétní službu
azd package --service api
```

## 🌍 Správa prostředí

### Operace s prostředím
```bash
# Vypsat všechny prostředí
azd env list

# Vytvořit nové prostředí
azd env new development
azd env new staging --location westus2

# Vybrat prostředí
azd env select production

# Zobrazit dostupná prostředí
azd env list

# Aktualizovat stav prostředí
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
# Vypsat veškerou konfiguraci
azd config show

# Nastavit globální výchozí hodnoty
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Odstranit konfiguraci
azd config unset defaults.location

# Obnovit veškerou konfiguraci
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

### Monitorovací dashboard
```bash
# Otevřít monitorovací panel Azure portálu
azd monitor

# Otevřít živé metriky Application Insights
azd monitor --live

# Otevřít panel protokolů Application Insights
azd monitor --logs

# Otevřít přehled Application Insights
azd monitor --overview
```

### Zobrazení logů kontejnerů
```bash
# Zobrazit protokoly přes Azure CLI (pro Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Sledujte protokoly v reálném čase
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Zobrazit protokoly z Azure Portal
azd monitor --logs
```

### Dotazy na analýzu logů
```bash
# Přístup k analýze protokolů přes Azure Portal
azd monitor --logs

# Dotazování se do protokolů pomocí Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Údržba

### Úklid
```bash
# Odstranit všechny zdroje Azure
azd down

# Vynucené smazání bez potvrzení
azd down --force

# Vymazat soft-deleted zdroje
azd down --purge

# Kompletní úklid
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
# Nakonfigurujte GitHub Actions
azd pipeline config

# Nakonfigurujte Azure DevOps
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
# Simuluje poskytování infrastruktury bez nasazení
# Analyzuje Bicep/Terraform šablony a ukazuje:
# - Zdrojové prostředky k přidání (zelené +)
# - Zdrojové prostředky k úpravě (žluté ~)
# - Zdrojové prostředky k odstranění (červené -)
# Bezpečné spuštění - nejsou provedeny žádné skutečné změny v Azure prostředí

# Syntetizovat infrastrukturu ze souboru azure.yaml
azd infra synth
```

### Informace o projektu
```bash
# Zobrazit stav projektu a koncové body
azd show

# Zobrazit podrobné informace o projektu jako JSON
azd show --output json

# Získat koncové body služby
azd show --output json | jq '.services'
```

## 🤖 AI a rozšíření

### Rozšíření AZD
```bash
# Vypište všechny dostupné rozšíření (včetně AI)
azd extension list

# Nainstalujte rozšíření agentů Foundry
azd extension install azure.ai.agents

# Nainstalujte rozšíření pro doladění
azd extension install azure.ai.finetune

# Nainstalujte rozšíření pro vlastní modely
azd extension install azure.ai.models

# Aktualizujte všechna nainstalovaná rozšíření
azd extension upgrade --all
```

### AI agent příkazy
```bash
# Inicializujte projekt agenta ze manifestu
azd ai agent init -m <manifest-path-or-uri>

# Cílení na konkrétní projekt Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Určete zdrojový adresář agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Vyberte cílový hosting
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP server (Alfa)
```bash
# Spusťte MCP server pro váš projekt
azd mcp start

# Spravujte souhlas nástroje pro operace MCP
azd copilot consent list
```

### Generování infrastruktury
```bash
# Generujte soubory IaC z definice vašeho projektu
azd infra generate

# Syntetizujte infrastrukturu z azure.yaml
azd infra synth
```

---

## 🎯 Rychlé workflow

### Vývojové workflow
```bash
# Začít nový projekt
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

### Workflow pro více prostředí
```bash
# Nastavit prostředí
azd env new dev
azd env new staging  
azd env new production

# Nasadit do vývoje
azd env select dev
azd up

# Testovat a povýšit na staging
azd env select staging
azd up

# Nasadit do produkce
azd env select production
azd up
```

### Workflow řešení problémů
```bash
# Povolit režim ladění
export AZD_DEBUG=true

# Zkontrolovat stav nasazení
azd show

# Ověřit konfiguraci
azd config show

# Otevřít monitorovací panel pro protokoly
azd monitor --logs

# Zkontrolovat stav zdrojů
azd show --output json
```

## 🔍 Ladicí příkazy

### Ladicí informace
```bash
# Povolit výstup ladění
export AZD_DEBUG=true
azd <command> --debug

# Zakázat telemetrii pro čistší výstup
export AZD_DISABLE_TELEMETRY=true

# Zkontrolovat aktuální konfiguraci
azd config show

# Zkontrolovat stav ověřování
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

# Zobrazit adresář konfigurace azd
echo $AZD_CONFIG_DIR  # Obvykle ~/.azd
```

## 🎨 Formátování výstupu

### Výstup JSON
```bash
# Získat JSON výstup pro skriptování
azd show --output json
azd env list --output json
azd config show --output json

# Parsovat pomocí jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Výstup tabulky
```bash
# Formátovat jako tabulku
azd env list --output table

# Zobrazit nasazené služby
azd show --output json | jq '.services | keys'
```

## 🔧 Běžná kombinace příkazů

### Skript pro kontrolu zdraví
```bash
#!/bin/bash
# Rychlá kontrola stavu systému
azd show
azd env get-values
azd monitor --logs
```

### Ověření nasazení
```bash
#!/bin/bash
# Kontrola před nasazením
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

### Skript pro úklid zdrojů
```bash
#!/bin/bash
# Vyčistěte stará prostředí
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

### Rychlá opravná opatření
```bash
# Obnovit ověření
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
# Zotavit se z neúspěšného nasazení - vyčistit a znovu nasadit
azd down --force --purge
azd up

# Pouze znovu poskytnout infrastrukturu
azd provision

# Pouze znovu nasadit aplikaci
azd deploy
```

## 💡 Profesionální tipy

### Alias pro rychlejší workflow
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
# Obecná pomoc
azd --help
azd help

# Pomoc specifická pro příkaz
azd up --help
azd env --help
azd config --help

# Zobrazit verzi a informace o sestavení
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

**Tip**: Přidejte si tento přehled do záložek a použijte `Ctrl+F` pro rychlé hledání potřebných příkazů!

---

**Navigace**
- **Předchozí lekce**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Další lekce**: [Glosář](glossary.md)

---

> **💡 Chcete pomoc s příkazy Azure přímo ve svém editoru?** Nainstalujte si [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) pomocí `npx skills add microsoft/github-copilot-for-azure` — 37 dovedností pro AI, Foundry, deployment, diagnostiku a další.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->