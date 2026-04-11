# Príkazový podklad - Základné príkazy AZD

**Rýchly prehľad pre všetky kapitoly**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Rýchly štart**: [Kapitola 1: Základy a rýchly štart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI príkazy**: [Kapitola 2: AI-prvé vývojárstvo](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Kapitola 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Tento komplexný podklad obsahuje rýchly prehľad najpoužívanejších príkazov Azure Developer CLI, usporiadaných podľa kategórií s praktickými príkladmi. Ideálne pre rýchle vyhľadávanie počas vývoja, riešenia problémov a každodenných operácií s projektmi azd.

## Ciele učenia

Používaním tohto podkladu budete:
- Mať okamžitý prístup k základným príkazom a syntaxi Azure Developer CLI
- Rozumieť organizácii príkazov podľa funkčných kategórií a prípadov použitia
- Používať praktické príklady bežných scenárov vývoja a nasadzovania
- Pristupovať k príkazom na riešenie problémov pre rýchle odstránenie chýb
- Efektívne nájsť možnosti pokročilej konfigurácie a prispôsobenia
- Vyhľadávať príkazy pre správu prostredí a viacnásobných pracovných tokov

## Výsledky učenia

Pravidelným používaním tohto podkladu budete schopní:
- Sebavedome vykonávať príkazy azd bez potreby úplnej dokumentácie
- Rýchlo vyriešiť bežné problémy pomocou vhodných diagnostických príkazov
- Efektívne spravovať viaceré prostredia a nasadzovacie scenáre
- Používať pokročilé vlastnosti a možnosti konfigurácie azd podľa potreby
- Diagnostikovať problémy s nasadením použitím systematických sekvencií príkazov
- Optimalizovať pracovné toky účinným použitím skratiek a možností azd

## Začiatočné príkazy

### Overenie identity
```bash
# Prihlásiť sa do Azure cez AZD
azd auth login

# Prihlásiť sa do Azure CLI (AZD to používa na pozadí)
az login

# Skontrolovať aktuálny účet
az account show

# Nastaviť predplatné ako predvolené
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Odhlásiť sa z AZD
azd auth logout

# Odhlásiť sa z Azure CLI
az logout
```

### Inicializácia projektu
```bash
# Prezerať dostupné šablóny
azd template list

# Inicializovať zo šablóny
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializovať v aktuálnom adresári
azd init .

# Inicializovať s vlastným názvom
azd init --template todo-nodejs-mongo my-awesome-app
```

## Hlavné príkazy nasadenia

### Kompletný pracovný tok nasadenia
```bash
# Nasadiť všetko (príprava + nasadenie)
azd up

# Nasadiť s vypnutými potvrdzovacími výzvami
azd up --confirm-with-no-prompt

# Nasadiť do konkrétneho prostredia
azd up --environment production

# Nasadiť s vlastnými parametrami
azd up --parameter location=westus2
```

### Iba infraštruktúra
```bash
# Poskytnúť Azure zdroje
azd provision

# 🧪 Náhľad infraštruktúrnych zmien
azd provision --preview
# Zobrazuje suchý beh toho, aké zdroje by boli vytvorené/upravené/zmazané
# Podobné 'terraform plan' alebo 'bicep what-if' - bezpečné spustiť, žiadne zmeny nie sú aplikované
```

### Iba aplikácia
```bash
# Nasadiť kód aplikácie
azd deploy

# Nasadiť konkrétnu službu
azd deploy --service web
azd deploy --service api

# Nasadiť všetky služby
azd deploy --all
```

### Build a balenie
```bash
# Vytvoriť aplikácie
azd package

# Vytvoriť konkrétnu službu
azd package --service api
```

## 🌍 Správa prostredí

### Operácie s prostrediami
```bash
# Zoznam všetkých prostredí
azd env list

# Vytvoriť nové prostredie
azd env new development
azd env new staging --location westus2

# Vybrať prostredie
azd env select production

# Zobraziť dostupné prostredia
azd env list

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

# Zoznam všetkých premenných prostredia
azd env get-values

# Odstrániť premennú prostredia
azd env unset DEBUG
```

## ⚙️ Konfiguračné príkazy

### Globálna konfigurácia
```bash
# Zoznam všetkých konfigurácií
azd config show

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

### Monitorovací panel
```bash
# Otvoriť monitorovací panel portálu Azure
azd monitor

# Otvoriť live metriky Application Insights
azd monitor --live

# Otvoriť panel denníkov Application Insights
azd monitor --logs

# Otvoriť prehľad Application Insights
azd monitor --overview
```

### Zobrazenie logov kontajnerov
```bash
# Zobraziť denníky cez Azure CLI (pre Kontajnerové aplikácie)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Sledovať denníky v reálnom čase
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Zobraziť denníky z Azure Portálu
azd monitor --logs
```

### Dopyty Log Analytics
```bash
# Prístup k analýze protokolov cez Azure portál
azd monitor --logs

# Dotazovanie protokolov pomocou Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Príkazy údržby

### Vyčistenie
```bash
# Odstrániť všetky zdroje Azure
azd down

# Vynútiť vymazanie bez potvrdenia
azd down --force

# Vymazať zdroje odstránené na mäkko
azd down --purge

# Kompletné vyčistenie
azd down --force --purge
```

### Aktualizácie
```bash
# Skontrolovať aktualizácie azd
azd version

# Získať aktuálnu verziu
azd version

# Zobraziť aktuálnu konfiguráciu
azd config show
```

## 🔧 Pokročilé príkazy

### Pipeline a CI/CD
```bash
# Nastaviť GitHub Actions
azd pipeline config

# Nastaviť Azure DevOps
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
# Analyzuje Bicep/Terraform šablóny a zobrazuje:
# - Prostriedky na pridanie (zelené +)
# - Prostriedky na úpravu (žlté ~)
# - Prostriedky na vymazanie (červené -)
# Bezpečné spustenie - žiadne skutočné zmeny v prostredí Azure

# Syntetizuje infraštruktúru zo súboru azure.yaml
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

## 🤖 AI & Rozšírenia

### Rozšírenia AZD
```bash
# Zoznam všetkých dostupných rozšírení (vrátane AI)
azd extension list

# Nainštalujte rozšírenie agentov Foundry
azd extension install azure.ai.agents

# Nainštalujte rozšírenie pre doladenie
azd extension install azure.ai.finetune

# Nainštalujte rozšírenie vlastných modelov
azd extension install azure.ai.models

# Aktualizujte všetky nainštalované rozšírenia
azd extension upgrade --all
```

### AI agent príkazy
```bash
# Inicializujte projekt agenta z manifesta
azd ai agent init -m <manifest-path-or-uri>

# Zacieľte na konkrétny projekt Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Zadajte adresár zdrojov agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Vyberte cieľ hosťovania
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (alpha)
```bash
# Spustite MCP server pre váš projekt
azd mcp start

# Spravujte súhlas nástroja pre operácie MCP
azd copilot consent list
```

### Generovanie infraštruktúry
```bash
# Generujte IaC súbory z definície vášho projektu
azd infra generate

# Syntetizujte infraštruktúru z azure.yaml
azd infra synth
```

---

## 🎯 Rýchle pracovné toky

### Vývojový pracovný tok
```bash
# Začať nový projekt
azd init --template todo-nodejs-mongo
cd my-project

# Nasadiť do vývoja
azd env new dev
azd up

# Urobiť zmeny a znovu nasadiť
azd deploy

# Otvoriť panel monitorovania
azd monitor --live
```

### Viacnásobný pracovný tok prostredí
```bash
# Nastaviť prostredia
azd env new dev
azd env new staging  
azd env new production

# Nasadiť do vývoja
azd env select dev
azd up

# Testovať a povýšiť na staging
azd env select staging
azd up

# Nasadiť do produkcie
azd env select production
azd up
```

### Pracovný tok riešenia problémov
```bash
# Povoliť režim ladenia
export AZD_DEBUG=true

# Skontrolovať stav nasadenia
azd show

# Overiť konfiguráciu
azd config show

# Otvoriť monitorovací panel pre logy
azd monitor --logs

# Skontrolovať stav zdrojov
azd show --output json
```

## 🔍 Ladacie príkazy

### Ladacie informácie
```bash
# Povoliť ladenie výstupu
export AZD_DEBUG=true
azd <command> --debug

# Zakázať telemetriu pre čistejší výstup
export AZD_DISABLE_TELEMETRY=true

# Skontrolovať aktuálnu konfiguráciu
azd config show

# Skontrolovať stav autentifikácie
az account show
```

### Ladanie šablón
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
# Zobraziť aktuálnu štruktúru adresára
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigovať do koreňového adresára projektu azd
cd $(azd root)

# Zobraziť adresár konfigurácie azd
echo $AZD_CONFIG_DIR  # Obvykle ~/.azd
```

## 🎨 Formátovanie výstupu

### Výstup v JSON
```bash
# Získať JSON výstup pre skriptovanie
azd show --output json
azd env list --output json
azd config show --output json

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
# Rýchla kontrola zdravia
azd show
azd env get-values
azd monitor --logs
```

### Validácia nasadenia
```bash
#!/bin/bash
# Pred nasadením validácia
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

### Bežné premenné prostredí
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
# Resetovať overenie
az account clear
az login

# Nútene obnoviť prostredie
azd env refresh

# Znovu nasadiť všetky služby
azd deploy

# Skontrolovať stav nasadenia
azd show --output json
```

### Príkazy na obnovu
```bash
# Obnoviť z neúspešného nasadenia - vyčistiť a znovu nasadiť
azd down --force --purge
azd up

# Znovu zabezpečiť infraštruktúru iba
azd provision

# Znovu nasadiť len aplikáciu
azd deploy
```

## 💡 Profesionálne tipy

### Alias pre rýchlejší pracovný tok
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Pomoc a dokumentácia

### Ako získať pomoc
```bash
# Všeobecná pomoc
azd --help
azd help

# Pomoc špecifická pre príkaz
azd up --help
azd env --help
azd config --help

# Zobraziť verziu a informácie o zostavení
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

**Tip**: Uložte si tento podklad do záložiek a použite `Ctrl+F` pre rýchle vyhľadanie potrebných príkazov!

---

**Navigácia**
- **Predchádzajúca lekcia**: [Predbežné kontroly](../docs/pre-deployment/preflight-checks.md)
- **Nasledujúca lekcia**: [Slovník pojmov](glossary.md)

---

> **💡 Chcete pomoc s príkazmi Azure vo vašom editore?** Nainštalujte si [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) cez `npx skills add microsoft/github-copilot-for-azure` — 37 zručností pre AI, Foundry, nasadenie, diagnostiku a ďalšie.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, majte prosím na pamäti, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nepochopenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->