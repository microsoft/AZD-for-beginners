# Príručka príkazov - Základné príkazy AZD

**Rýchla referencia pre všetky kapitoly**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Rýchly štart**: [Kapitola 1: Základy & Rýchly štart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Príkazy AI**: [Kapitola 2: Vývoj orientovaný na AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Kapitola 4: Infrastruktúra ako kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Táto komplexná príručka poskytuje rýchlu referenciu pre najčastejšie používané príkazy Azure Developer CLI, zorganizovanú podľa kategórií s praktickými príkladmi. Ideálna na rýchle vyhľadávanie počas vývoja, riešenia problémov a každodenných operácií s azd projektmi.

## Ciele učenia

Používaním tejto príručky:
- Budete mať okamžitý prístup k základným príkazom a syntaxi Azure Developer CLI
- Pochopíte organizáciu príkazov podľa funkčných kategórií a prípadov použitia
- Nájdete praktické príklady pre bežné scenáre vývoja a nasadenia
- Získate príkazy na riešenie problémov pre rýchle vyriešenie chýb
- Efektívne nájdete pokročilé možnosti konfigurácie a prispôsobenia
- Nájdete príkazy na správu prostredí a workflow pre viacero prostredí

## Výsledky učenia

Pri pravidelnom používaní tejto príručky budete schopní:
- Spúšťať príkazy azd s istotou bez nutnosti odkazovať sa na plnú dokumentáciu
- Rýchlo riešiť bežné problémy pomocou vhodných diagnostických príkazov
- Efektívne spravovať viaceré prostredia a scenáre nasadenia
- Používať pokročilé funkcie azd a možnosti konfigurácie podľa potreby
- Riešiť problémy s nasadením pomocou systematických sekvencií príkazov
- Optimalizovať pracovné postupy efektívnym využitím skratiek a možností azd

## Príkazy pre začiatok

### Autentifikácia
```bash
# Prihlásiť sa do Azure cez AZD
azd auth login

# Prihlásiť sa do Azure CLI (AZD to používa na pozadí)
az login

# Skontrolovať aktuálny účet
az account show

# Nastaviť predvolené predplatné
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Odhlásiť sa z AZD
azd auth logout

# Odhlásiť sa z Azure CLI
az logout
```

### Inicializácia projektu
```bash
# Prehliadať dostupné šablóny
azd template list

# Inicializovať zo šablóny
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializovať v aktuálnom priečinku
azd init .

# Inicializovať s vlastným názvom
azd init --template todo-nodejs-mongo my-awesome-app
```

## Hlavné príkazy nasadenia

### Kompletný pracovný postup nasadenia
```bash
# Nasadiť všetko (príprava + nasadenie)
azd up

# Nasadiť s vypnutými výzvami na potvrdenie
azd up --confirm-with-no-prompt

# Nasadiť do konkrétneho prostredia
azd up --environment production

# Nasadiť s vlastnými parametrami
azd up --parameter location=westus2
```

### Len infraštruktúra
```bash
# Nasadiť zdroje Azure
azd provision

# 🧪 Náhľad zmien v infraštruktúre
azd provision --preview
# Zobrazuje simulovaný náhľad toho, ktoré zdroje by boli vytvorené, upravené alebo odstránené
# Podobné 'terraform plan' alebo 'bicep what-if' - bezpečné spustiť, žiadne zmeny sa neaplikujú
```

### Len aplikácia
```bash
# Nasadiť kód aplikácie
azd deploy

# Nasadiť konkrétnu službu
azd deploy --service web
azd deploy --service api

# Nasadiť všetky služby
azd deploy --all
```

### Zostavenie a balenie
```bash
# Zostaviť aplikácie
azd package

# Zostaviť konkrétnu službu
azd package --service api
```

## 🌍 Správa prostredí

### Operácie prostredí
```bash
# Zoznam všetkých prostredí
azd env list

# Vytvoriť nové prostredie
azd env new development
azd env new staging --location westus2

# Vybrať prostredie
azd env select production

# Zobraziť aktuálne prostredie
azd env show

# Obnoviť stav prostredia
azd env refresh
```

### Premenné prostredia
```bash
# Nastaviť premennú prostredia
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Získať premennú prostredia
azd env get API_KEY

# Zobraziť všetky premenné prostredia
azd env get-values

# Odstrániť premennú prostredia
azd env unset DEBUG
```

## ⚙️ Príkazy konfigurácie

### Globálna konfigurácia
```bash
# Zobraziť všetky konfigurácie
azd config list

# Nastaviť globálne predvolené hodnoty
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Odstrániť konfiguráciu
azd config unset defaults.location

# Obnoviť všetky konfigurácie
azd config reset
```

### Konfigurácia projektu
```bash
# Overiť azure.yaml
azd config validate

# Zobraziť informácie o projekte
azd show

# Získať koncové body služby
azd show --output json
```

## 📊 Monitorovanie a diagnostika

### Panel monitorovania
```bash
# Otvoriť monitorovací panel portálu Azure
azd monitor

# Otvoriť živé metriky v Application Insights
azd monitor --live

# Otvoriť panel logov v Application Insights
azd monitor --logs

# Otvoriť prehľad Application Insights
azd monitor --overview
```

### Zobrazenie logov kontajnera
```bash
# Zobraziť logy pomocou Azure CLI (pre Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Sledovať logy v reálnom čase
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Zobraziť logy v Azure Portáli
azd monitor --logs
```

### Dotazy Log Analytics
```bash
# Prístup k Log Analytics cez Azure Portal
azd monitor --logs

# Spúšťajte dotazy nad logmi pomocou Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Príkazy na údržbu

### Vyčistenie
```bash
# Odstrániť všetky zdroje Azure
azd down

# Vynútiť odstránenie bez potvrdenia
azd down --force

# Natrvalo odstrániť dočasne zmazané zdroje
azd down --purge

# Úplné vyčistenie
azd down --force --purge
```

### Aktualizácie
```bash
# Skontrolovať aktualizácie azd
azd version

# Zobraziť aktuálnu verziu
azd version

# Zobraziť aktuálnu konfiguráciu
azd config list
```

## 🔧 Pokročilé príkazy

### Pipeline a CI/CD
```bash
# Konfigurovať GitHub Actions
azd pipeline config

# Konfigurovať Azure DevOps
azd pipeline config --provider azdo

# Zobraziť konfiguráciu pipeline
azd pipeline show
```

### Správa infraštruktúry
```bash
# Generovať šablóny infraštruktúry
azd infra generate

# 🧪 Náhľad a plánovanie infraštruktúry
azd provision --preview
# Simuluje poskytovanie infraštruktúry bez nasadenia
# Analyzuje šablóny Bicep/Terraform a zobrazuje:
# - Zdroje, ktoré budú pridané (zelené +)
# - Zdroje, ktoré budú upravené (žlté ~)
# - Zdroje, ktoré budú odstránené (červené -)
# Bezpečné spustiť - v prostredí Azure sa nevykonajú žiadne skutočné zmeny

# Syntetizovať infraštruktúru z azure.yaml
azd infra synth
```

### Informácie o projekte
```bash
# Zobraziť stav projektu a koncové body
azd show

# Zobraziť podrobné informácie o projekte vo formáte JSON
azd show --output json

# Získať koncové body služby
azd show --output json | jq '.services'
```

## 🤖 Príkazy AI a rozšírenia

### Rozšírenia AZD
```bash
# Zobraziť všetky dostupné rozšírenia (vrátane AI)
azd extension list

# Nainštalovať rozšírenie Foundry Agents
azd extension install azure.ai.agents

# Nainštalovať rozšírenie pre jemné doladenie
azd extension install azure.ai.finetune

# Nainštalovať rozšírenie pre vlastné modely
azd extension install azure.ai.models

# Aktualizovať všetky nainštalované rozšírenia
azd extension upgrade --all
```

### Príkazy AI agenta
```bash
# Inicializovať projekt agenta z manifestu
azd ai agent init -m <manifest-path-or-uri>

# Zamerať sa na konkrétny projekt Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Určiť adresár so zdrojmi agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Vybrať cieľ hostovania
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Spustite MCP server pre váš projekt
azd mcp start

# Spravujte súhlas nástrojov pre operácie MCP
azd mcp consent
```

### Generovanie infraštruktúry
```bash
# Vygenerujte súbory IaC z definície vášho projektu
azd infra generate

# Syntetizujte infraštruktúru z azure.yaml
azd infra synth
```

---

## 🎯 Rýchle pracovné postupy

### Vývojový pracovný postup
```bash
# Začnite nový projekt
azd init --template todo-nodejs-mongo
cd my-project

# Nasaďte do vývojového prostredia
azd env new dev
azd up

# Urobte zmeny a znovu nasaďte
azd deploy

# Otvorte monitorovací panel
azd monitor --live
```

### Pracovný postup pre viacero prostredí
```bash
# Nastaviť prostredia
azd env new dev
azd env new staging  
azd env new production

# Nasadiť do vývojového prostredia
azd env select dev
azd up

# Otestovať a povýšiť do predprodukčného prostredia
azd env select staging
azd up

# Nasadiť do produkcie
azd env select production
azd up
```

### Pracovný postup riešenia problémov
```bash
# Povoliť režim ladenia
export AZD_DEBUG=true

# Skontrolovať stav nasadenia
azd show

# Overiť konfiguráciu
azd config list

# Otvoriť monitorovací panel pre denníky
azd monitor --logs

# Skontrolovať stav zdrojov
azd show --output json
```

## 🔍 Príkazy pre ladenie

### Informácie pre ladenie
```bash
# Povoliť výstup ladenia
export AZD_DEBUG=true
azd <command> --debug

# Vypnúť telemetriu pre čistejší výstup
export AZD_DISABLE_TELEMETRY=true

# Skontrolovať aktuálnu konfiguráciu
azd config list

# Skontrolovať stav autentifikácie
az account show
```

### Ladenie šablón
```bash
# Zoznam dostupných šablón s podrobnosťami
azd template list --output json

# Zobraziť informácie o šablóne
azd template show <template-name>

# Overiť šablónu pred inicializáciou
azd template validate <template-name>
```

## 📁 Príkazy pre súbory a adresáre

### Štruktúra projektu
```bash
# Zobraziť štruktúru aktuálneho adresára
tree /f  # Windows
find . -type f  # Linux/macOS

# Prejsť do koreňa projektu azd
cd $(azd root)

# Zobraziť konfiguračný adresár azd
echo $AZD_CONFIG_DIR  # Zvyčajne ~/.azd
```

## 🎨 Formátovanie výstupu

### Výstup v JSON
```bash
# Získať JSON výstup pre skriptovanie
azd show --output json
azd env list --output json
azd config list --output json

# Parsovať pomocou jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Výstup v tabuľke
```bash
# Formátovať ako tabuľku
azd env list --output table

# Zobraziť nasadené služby
azd show --output json | jq '.services | keys'
```

## 🔧 Bežné kombinácie príkazov

### Skript kontroly stavu
```bash
#!/bin/bash
# Rýchla kontrola stavu
azd show
azd env show
azd monitor --logs
```

### Validácia nasadenia
```bash
#!/bin/bash
# Overenie pred nasadením
azd show
azd provision --preview  # Náhľad zmien pred nasadením
az account show
```

### Porovnanie prostredí
```bash
#!/bin/bash
# Porovnať prostredia
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skript na vyčistenie zdrojov
```bash
#!/bin/bash
# Vyčistiť staré prostredia
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Premenné prostredia

### Bežné premenné prostredia
```bash
# Konfigurácia Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Konfigurácia AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Konfigurácia aplikácie
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Núdzové príkazy

### Rýchle opravy
```bash
# Resetovať autentifikáciu
az account clear
az login

# Vynútiť obnovenie prostredia
azd env refresh

# Znovu nasadiť všetky služby
azd deploy

# Skontrolovať stav nasadenia
azd show --output json
```

### Príkazy na obnovu
```bash
# Obnoviť po neúspešnom nasadení - vyčistiť a znovu nasadiť
azd down --force --purge
azd up

# Obnoviť iba infraštruktúru
azd provision

# Znovu nasadiť iba aplikáciu
azd deploy
```

## 💡 Profesionálne tipy

### Alias-y pre rýchlejší pracovný postup
```bash
# Pridajte do svojho .bashrc alebo .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Skratky funkcií
```bash
# Rýchle prepínanie prostredí
azd-env() {
    azd env select $1 && azd show
}

# Rýchle nasadenie s monitorovaním
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Stav prostredia
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Pomoc a dokumentácia

### Získanie pomoci
```bash
# Všeobecná nápoveda
azd --help
azd help

# Nápoveda k príkazu
azd up --help
azd env --help
azd config --help

# Zobraziť informácie o verzii a zostavení
azd version
azd version --output json
```

### Odkazy na dokumentáciu
```bash
# Otvoriť dokumentáciu v prehliadači
azd docs

# Zobraziť dokumentáciu šablóny
azd template show <template-name> --docs
```

---

**Tip**: Uložte si túto príručku do záložiek a použite `Ctrl+F` na rýchle vyhľadanie potrebných príkazov!

---

**Navigácia**
- **Predchádzajúca lekcia**: [Predbežné kontroly](../docs/pre-deployment/preflight-checks.md)
- **Nasledujúca lekcia**: [Slovník](glossary.md)

---

> **💡 Chcete pomoc s príkazmi Azure vo vašom editore?** Nainštalujte [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) pomocou `npx skills add microsoft/github-copilot-for-azure` — 37 skills pre AI, Foundry, nasadenie, diagnostiku a ďalšie.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Za akékoľvek nedorozumenia alebo chybné výklady vzniknuté použitím tohto prekladu nenesieme zodpovednosť.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->