# Cheat Sheet příkazů - Základní příkazy AZD

**Rychlá reference pro všechny kapitoly**
- **📚 Domovský kurz**: [AZD pro začátečníky](../README.md)
- **📖 Rychlý start**: [Kapitola 1: Základy & Rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI příkazy**: [Kapitola 2: Vývoj orientovaný na AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Kapitola 4: Infrastruktura jako kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Tento komplexní přehled poskytuje rychlou referenci pro nejčastěji používané příkazy Azure Developer CLI, uspořádané podle kategorií s praktickými příklady. Ideální pro rychlé vyhledávání během vývoje, řešení problémů a každodenních operací s projekty azd.

## Cíle učení

Používáním tohoto přehledu budete:
- Mít okamžitý přístup k základním příkazům a syntaxi Azure Developer CLI
- Rozumět organizaci příkazů podle funkčních kategorií a případů použití
- Odkazovat se na praktické příklady pro běžné scénáře vývoje a nasazení
- Získat příkazy pro řešení problémů pro rychlé odstranění chyb
- Efektivně najít pokročilé možnosti konfigurace a přizpůsobení
- Najít příkazy pro správu prostředí a pracovní postupy pro více prostředí

## Výsledky učení

Pravidelným používáním tohoto přehledu budete schopni:
- Spouštět příkazy azd sebejistě bez nutnosti nahlížet do úplné dokumentace
- Rychle řešit běžné problémy pomocí vhodných diagnostických příkazů
- Efektivně spravovat více prostředí a scénáře nasazení
- Používat pokročilé funkce azd a konfigurační možnosti podle potřeby
- Řešit problémy s nasazením pomocí systematických sekvencí příkazů
- Optimalizovat pracovní postupy prostřednictvím efektivního využití zkratek a možností azd

## Příkazy pro začátek

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

# Inicializovat z šablony
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializovat v aktuálním adresáři
azd init .

# Inicializovat s vlastním názvem
azd init --template todo-nodejs-mongo my-awesome-app
```

## Hlavní příkazy pro nasazení

### Kompletní pracovní postup nasazení
```bash
# Nasadit vše (příprava + nasazení)
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
# Zajistit prostředky v Azure
azd provision

# 🧪 Náhled změn infrastruktury
azd provision --preview
# Zobrazuje simulovaný náhled toho, jaké prostředky by byly vytvořeny/upraveny/smazány
# Podobné 'terraform plan' nebo 'bicep what-if' - bezpečné spustit, nebudou provedeny žádné změny
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

## ⚙️ Konfigurační příkazy

### Globální konfigurace
```bash
# Vypsat všechna nastavení
azd config list

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

# Získat koncové body služeb
azd show --output json
```

## 📊 Monitorování a diagnostika

### Monitorovací panel
```bash
# Otevřít panel monitorování v portálu Azure
azd monitor

# Otevřít živé metriky Application Insights
azd monitor --live

# Otevřít panel protokolů Application Insights
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

# Zobrazit protokoly v portálu Azure
azd monitor --logs
```

### Dotazy Log Analytics
```bash
# Přístup k Log Analytics prostřednictvím Azure Portal
azd monitor --logs

# Dotazování protokolů pomocí Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Příkazy pro údržbu

### Vyčištění
```bash
# Odstranit všechny prostředky Azure
azd down

# Vynutit smazání bez potvrzení
azd down --force

# Vymazat dočasně smazané prostředky
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
# Analyzuje šablony Bicep/Terraform a zobrazuje:
# - Zdroje, které budou přidány (zelené +)
# - Zdroje, které budou upraveny (žluté ~)
# - Zdroje, které budou smazány (červené -)
# Bezpečné spuštění - v prostředí Azure nejsou provedeny žádné skutečné změny

# Sestaví infrastrukturu z azure.yaml
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

## 🎯 Rychlé pracovní postupy

### Pracovní postup vývoje
```bash
# Zahajte nový projekt
azd init --template todo-nodejs-mongo
cd my-project

# Nasaďte do vývojového prostředí
azd env new dev
azd up

# Proveďte změny a znovu je nasaďte
azd deploy

# Otevřete monitorovací panel
azd monitor --live
```

### Pracovní postup pro více prostředí
```bash
# Nastavit prostředí
azd env new dev
azd env new staging  
azd env new production

# Nasadit na vývojové prostředí (dev)
azd env select dev
azd up

# Otestovat a nasadit do předprodukčního prostředí (staging)
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
azd config list

# Otevřít monitorovací panel pro protokoly
azd monitor --logs

# Zkontrolovat stav zdrojů
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
azd config list

# Zkontrolovat stav ověření
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

## 🎨 Formát výstupu

### Výstup JSON
```bash
# Získat výstup ve formátu JSON pro skriptování
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

### Skript pro kontrolu stavu
```bash
#!/bin/bash
# Rychlá kontrola stavu
azd show
azd env show
azd monitor --logs
```

### Validace nasazení
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

### Příkazy pro obnovení
```bash
# Obnova po selhání nasazení - vyčistit a znovu nasadit
azd down --force --purge
azd up

# Pouze znovu zřídit infrastrukturu
azd provision

# Pouze znovu nasadit aplikaci
azd deploy
```

## 💡 Užitečné tipy

### Zkratky (aliasy) pro rychlejší pracovní postup
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

### Získání pomoci
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

**Tip**: Uložte si tento přehled do záložek a použijte `Ctrl+F` pro rychlé nalezení požadovaných příkazů!

---

**Navigace**
- **Předchozí lekce**: [Kontroly před nasazením](../docs/pre-deployment/preflight-checks.md)
- **Další lekce**: [Glosář](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za rozhodující zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo špatné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->