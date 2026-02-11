# Rýchly prehľad príkazov - Základné príkazy AZD

**Rýchla referencia pre všetky kapitoly**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Rýchly štart**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Príkazy AI**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Tento komplexný prehľad poskytuje rýchlu referenciu pre najčastejšie používané príkazy Azure Developer CLI, usporiadané podľa kategórií s praktickými príkladmi. Ideálne na rýchle vyhľadávanie počas vývoja, riešenia problémov a bežnej prevádzky projektov azd.

## Ciele učenia

Používaním tohto prehľadu budete:
- Mať okamžitý prístup k základným príkazom a syntaxi Azure Developer CLI
- Pochopiť organizáciu príkazov podľa funkčných kategórií a prípadov použitia
- Nájsť praktické príklady pre bežné scenáre vývoja a nasadenia
- Mať prístup k príkazom na riešenie problémov pre rýchle vyriešenie problémov
- Efektívne nájsť pokročilé možnosti konfigurácie a prispôsobenia
- Nájsť príkazy pre správu prostredí a pracovné postupy pre viaceré prostredia

## Výsledky učenia

Pravidelným odkazovaním na tento prehľad budete schopní:
- Spúšťať príkazy azd sebavedomo bez potreby odkazovať sa na úplnú dokumentáciu
- Rýchlo riešiť bežné problémy použitím vhodných diagnostických príkazov
- Efektívne spravovať viaceré prostredia a scenáre nasadenia
- Používať pokročilé funkcie azd a možnosti konfigurácie podľa potreby
- Riešiť problémy s nasadením pomocou systematických sekvencií príkazov
- Optimalizovať pracovné postupy efektívnym použitím skratiek a možností azd

## Začiatočné príkazy

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

# Inicializovať z šablóny
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializovať v aktuálnom adresári
azd init .

# Inicializovať s vlastným názvom
azd init --template todo-nodejs-mongo my-awesome-app
```

## Základné príkazy nasadenia

### Kompletný pracovný postup nasadenia
```bash
# Nasadiť všetko (príprava infraštruktúry + nasadenie)
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
# Nasadiť zdroje Azure
azd provision

# 🧪 Náhľad zmien infraštruktúry
azd provision --preview
# Zobrazuje náhľad (dry-run) toho, ktoré zdroje by boli vytvorené/upravené/odstránené
# Podobné ako 'terraform plan' alebo 'bicep what-if' - bezpečné na spustenie, žiadne zmeny sa neaplikujú
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

### Kompilácia a balenie
```bash
# Zostaviť aplikácie
azd package

# Zostaviť konkrétnu službu
azd package --service api
```

## 🌍 Správa prostredí

### Operácie prostredia
```bash
# Zobraziť všetky prostredia
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

# Resetovať všetky konfigurácie
azd config reset
```

### Konfigurácia projektu
```bash
# Overiť azure.yaml
azd config validate

# Zobraziť informácie o projekte
azd show

# Získať koncové body služieb
azd show --output json
```

## 📊 Monitorovanie a diagnostika

### Monitorovací panel
```bash
# Otvoriť monitorovací panel v portáli Azure
azd monitor

# Otvoriť živé metriky v Application Insights
azd monitor --live

# Otvoriť panel logov v Application Insights
azd monitor --logs

# Otvoriť prehľad v Application Insights
azd monitor --overview
```

### Zobrazenie logov kontajnera
```bash
# Zobraziť protokoly cez Azure CLI (pre Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Sledovať protokoly v reálnom čase
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Zobraziť protokoly v Azure portáli
azd monitor --logs
```

### Dotazy Log Analytics
```bash
# Prístup k Log Analytics prostredníctvom Azure portálu
azd monitor --logs

# Dotazovanie záznamov pomocou Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Príkazy údržby

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

# Získať aktuálnu verziu
azd version

# Zobraziť aktuálnu konfiguráciu
azd config list
```

## 🔧 Pokročilé príkazy

### Pipeline a CI/CD
```bash
# Nakonfigurujte GitHub Actions
azd pipeline config

# Nakonfigurujte Azure DevOps
azd pipeline config --provider azdo

# Zobrazte konfiguráciu pipeline
azd pipeline show
```

### Správa infraštruktúry
```bash
# Generovať šablóny infraštruktúry
azd infra generate

# 🧪 Náhľad a plánovanie infraštruktúry
azd provision --preview
# Simuluje poskytovanie infraštruktúry bez jej nasadenia
# Analyzuje Bicep/Terraform šablóny a zobrazuje:
# - Zdroje, ktoré budú pridané (zelené +)
# - Zdroje, ktoré budú upravené (žlté ~)
# - Zdroje, ktoré budú odstránené (červené -)
# Bezpečné spustenie - v prostredí Azure nebudú vykonané žiadne skutočné zmeny

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

## 🎯 Rýchle pracovné postupy

### Vývojový pracovný postup
```bash
# Začať nový projekt
azd init --template todo-nodejs-mongo
cd my-project

# Nasadiť do vývoja
azd env new dev
azd up

# Urobiť zmeny a znovu nasadiť
azd deploy

# Otvoriť monitorovací panel
azd monitor --live
```

### Pracovný postup pre viacero prostredí
```bash
# Nastaviť prostredia
azd env new dev
azd env new staging  
azd env new production

# Nasadiť do vývoja
azd env select dev
azd up

# Otestovať a povýšiť do stagingu
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

# Otvoriť monitorovací panel pre protokoly
azd monitor --logs

# Skontrolovať stav zdroja
azd show --output json
```

## 🔍 Príkazy na ladenie

### Informácie na ladenie
```bash
# Povoliť výstup pre ladenie
export AZD_DEBUG=true
azd <command> --debug

# Zakázať telemetriu pre čistejší výstup
export AZD_DISABLE_TELEMETRY=true

# Skontrolovať aktuálnu konfiguráciu
azd config list

# Skontrolovať stav overenia
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
# Zobraziť aktuálnu štruktúru adresára
tree /f  # Windows
find . -type f  # Linux/macOS

# Prejsť do koreňa projektu azd
cd $(azd root)

# Zobraziť konfiguračný adresár azd
echo $AZD_CONFIG_DIR  # Obvykle ~/.azd
```

## 🎨 Formátovanie výstupu

### Výstup JSON
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

### Overenie nasadenia
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

### Príkazy na obnovenie
```bash
# Obnoviť po zlyhanom nasadení - vyčistiť a znovu nasadiť
azd down --force --purge
azd up

# Len opätovné zriadenie infraštruktúry
azd provision

# Len znovu nasadiť aplikáciu
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
# Rýchle prepínanie prostredia
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

# Nápoveda pre konkrétny príkaz
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

**Tip**: Uložte si tento prehľad príkazov do záložiek a použite `Ctrl+F` na rýchle nájdenie príkazov, ktoré potrebujete!

---

**Navigácia**
- **Predchádzajúca lekcia**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Ďalšia lekcia**: [Glossary](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou AI prekladateľskej služby Co-op Translator (https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za rozhodujúci zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nepreberáme zodpovednosť za žiadne nedorozumenia alebo nesprávne interpretácie vzniknuté v dôsledku použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->