# Rýchly prehľad príkazov - Základné AZD príkazy

**Rýchla referencia pre všetky kapitoly**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Rýchly štart**: [Kapitola 1: Základy & Rýchly štart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI príkazy**: [Kapitola 2: Vývoj zameraný na AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Kapitola 4: Infrastruktúra ako kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Tento komplexný rýchly prehľad poskytuje stručnú referenciu pre najčastejšie používané príkazy Azure Developer CLI, usporiadané podľa kategórií s praktickými príkladmi. Ideálne na rýchle vyhľadávanie počas vývoja, riešenia problémov a každodenných operácií s azd projektami.

## Ciele učenia

Používaním tohto rýchleho prehľadu:
- Budete mať okamžitý prístup k základným príkazom a syntaxi Azure Developer CLI
- Pochopíte organizáciu príkazov podľa funkčných kategórií a prípadov použitia
- Nájdete praktické príklady pre bežné scenáre vývoja a nasadenia
- Získate príkazy na riešenie problémov pre rýchle odstraňovanie chýb
- Efektívne nájdete pokročilé možnosti konfigurácie a prispôsobenia
- Lokalizujete príkazy na správu prostredí a workflow pre viac prostredí

## Výsledky učenia

Pri pravidelnom používaní tohto prehľadu budete schopní:
- Spúšťať azd príkazy sebevedome bez nutnosti odkazovať sa na plnú dokumentáciu
- Rýchlo riešiť bežné problémy použitím vhodných diagnostických príkazov
- Efektívne spravovať viacero prostredí a scenárov nasadenia
- Používať pokročilé funkcie a možnosti konfigurácie azd podľa potreby
- Riešiť problémy s nasadením pomocou systematických sekvencií príkazov
- Optimalizovať workflowy pomocou efektívneho využitia azd skratiek a možností

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

## Hlavné príkazy nasadenia

### Kompletný pracovný tok nasadenia
```bash
# Nasadiť všetko (príprava + nasadenie)
azd up

# Nasadiť s vypnutými potvrzovacími výzvami
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
# Zobrazuje simulovaný náhľad toho, ktoré zdroje by boli vytvorené/upravené/odstránené
# Podobné 'terraform plan' alebo 'bicep what-if' - bezpečné spustiť, žiadne zmeny sa neaplikujú
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
# Obnoviť (stiahnuť) závislosti aplikácie
azd restore

# Obnoviť konkrétnu službu
azd restore --service api

# Zostaviť nasaditeľný artefakt bez nasadenia
azd package

# Zostaviť konkrétnu službu
azd package --service api
```

> **`azd restore`** stiahne závislosti vašej aplikácie (npm, pip, NuGet, Maven, atď.). Spúšťa sa automaticky počas `azd package` a `azd deploy`, takže ho zriedka voláte priamo — spustite ho manuálne na prednačítanie závislostí (napríklad na nahriatie CI cache alebo na prácu offline neskôr).

> **`azd package`** zostaví nasaditeľný artefakt (kontajnerový image alebo zip) **bez** jeho odoslania do Azure. Použite ho samostatne na overenie, že zostavenie prebehlo úspešne, na preskúmanie výstupu alebo na vytvorenie artefaktu, ktorý neskôr nasadí samostatný proces. `azd deploy` balí automaticky, takže potrebujete `azd package` len keď chcete artefakt bez nasadenia.


## 🌍 Správa prostredí

### Operácie prostredia
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

# Zobraziť všetky premenné prostredia
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

# Resetovať všetky konfigurácie
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
# Otvoriť monitorovací panel v portáli Azure
azd monitor

# Otvoriť živé metriky Application Insights
azd monitor --live

# Otvoriť blade s logmi Application Insights
azd monitor --logs

# Otvoriť prehľad Application Insights
azd monitor --overview
```

### Zobrazenie logov kontajnera
```bash
# Zobraziť záznamy cez Azure CLI (pre Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Sledovať záznamy v reálnom čase
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Zobraziť záznamy v Azure Portal
azd monitor --logs
```

### Dotazy Log Analytics
```bash
# Prístup k Log Analytics cez Azure portál
azd monitor --logs

# Dotazovanie v protokoloch pomocou Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Príkazy údržby

### Čistenie
```bash
# Odstrániť všetky zdroje Azure
azd down

# Vynútiť zmazanie bez potvrdenia
azd down --force

# Natrvalo odstrániť dočasne zmazané zdroje
azd down --purge

# Dokončiť vyčistenie
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
# Konfigurovať GitHub Actions
azd pipeline config

# Konfigurovať Azure DevOps
azd pipeline config --provider azdo

# Zobraziť konfiguráciu pipeline
azd pipeline show
```

### Správa infraštruktúry
```bash
# Vygenerovať šablóny infraštruktúry
azd infra generate

# 🧪 Náhľad a plánovanie infraštruktúry
azd provision --preview
# Simuluje poskytovanie infraštruktúry bez nasadenia
# Analyzuje Bicep/Terraform šablóny a zobrazuje:
# - Prostriedky, ktoré budú pridané (zelené +)
# - Prostriedky, ktoré budú upravené (žlté ~)
# - Prostriedky, ktoré budú odstránené (červené -)
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

## 🤖 Príkazy pre AI a rozšírenia

### Rozšírenia AZD
```bash
# Zobraziť všetky dostupné rozšírenia (vrátane AI)
azd extension list

# Nainštalovať rozšírenie Foundry Agents
azd extension install azure.ai.agents

# Nainštalovať rozšírenie Agent Skills (náhľad)
azd extension install azure.ai.skills

# Nainštalovať rozšírenie Foundry Connections (náhľad)
azd extension install azure.ai.connections

# Nainštalovať rozšírenie pre doladenie
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

# Určiť adresár so zdrojovým kódom agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Vybrať hostingový cieľ
azd ai agent init -m agent-manifest.yaml --host containerapp

# Otestovať nasadeného agenta (vypíše latenciu + čas do prvého bajtu)
azd ai agent invoke

# Zobraziť konfiguráciu živého koncového bodu
azd ai agent endpoint show

# Vygenerovať evaluačnú dátovú sadu, potom optimalizovať agenta
azd ai agent eval generate
azd ai agent optimize

# Stiahnuť nasadený zdrojový kód hostovaného agenta
azd ai agent code download

# Zmazať hostovaného agenta a všetky jeho verzie (--force ukončí aktívne relácie)
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# Spustite MCP server pre váš projekt
azd mcp start

# Spravujte súhlas nástrojov pre operácie MCP
azd copilot consent list
```

### Generovanie infraštruktúry
```bash
# Vygenerujte súbory IaC z definície vášho projektu
azd infra generate

# Syntetizovať infraštruktúru zo súboru azure.yaml
azd infra synth
```

---

## 🎯 Rýchle pracovné postupy

### Vývojový pracovný postup
```bash
# Začať nový projekt
azd init --template todo-nodejs-mongo
cd my-project

# Nasadiť do vývojového prostredia
azd env new dev
azd up

# Urobte zmeny a vykonajte opätovné nasadenie
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

# Otestovať a presunúť do prípravného prostredia
azd env select staging
azd up

# Nasadiť do produkčného prostredia
azd env select production
azd up
```

### Postup pri riešení problémov
```bash
# Povoliť režim ladenia
export AZD_DEBUG=true

# Skontrolovať stav nasadenia
azd show

# Overiť konfiguráciu
azd config show

# Otvoriť monitorovací panel pre protokoly
azd monitor --logs

# Skontrolovať stav zdrojov
azd show --output json
```

## 🔍 Príkazy na ladenie

### Informácie na ladenie
```bash
# Povoliť ladený výstup
export AZD_DEBUG=true
azd <command> --debug

# Vypnúť telemetriu pre čistejší výstup
export AZD_DISABLE_TELEMETRY=true

# Skontrolovať aktuálnu konfiguráciu
azd config show

# Skontrolovať stav autentifikácie
az account show
```

### Ladenie šablón
```bash
# Zobraziť dostupné šablóny s podrobnosťami
azd template list --output json

# Zobraziť informácie o šablóne
azd template show <template-name>

# Overiť šablónu pred inicializáciou
azd template validate <template-name>
```

## 📁 Príkazy súborov a adresárov

### Štruktúra projektu
```bash
# Zobraziť aktuálnu štruktúru adresárov
tree /f  # Windows
find . -type f  # Linux/macOS

# Prejdite do koreňového adresára projektu azd
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
# Rýchla kontrola stavu
azd show
azd env get-values
azd monitor --logs
```

### Overenie nasadenia
```bash
#!/bin/bash
# Validácia pred nasadením
azd show
azd provision --preview  # Prezrite si zmeny pred nasadením
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

### Skript čistenia prostriedkov
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

## 🚨 Pohotovostné príkazy

### Rýchle opravy
```bash
# Obnoviť autentifikáciu
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
# Obnoviť po neúspešnom nasadení - vyčistiť a znovu nasadiť
azd down --force --purge
azd up

# Iba opätovné nasadenie infraštruktúry
azd provision

# Iba opätovné nasadenie aplikácie
azd deploy
```

## 💡 Užitočné tipy

### Aliasy pre rýchlejší pracovný postup
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

### Získanie pomoci
```bash
# Všeobecná pomoc
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

**Tip**: Uložte si tento rýchly prehľad príkazov a použite `Ctrl+F` na rýchle nájdenie príkazov, ktoré potrebujete!

---

**Navigácia**
- **Predchádzajúca lekcia**: [Kontroly pred nasadením](../docs/pre-deployment/preflight-checks.md)
- **Nasledujúca lekcia**: [Slovník](glossary.md)

---

> **💡 Chcete pomoc s Azure príkazmi vo vašom editore?** Nainštalujte [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) pomocou `npx skills add microsoft/github-copilot-for-azure` — 37 zručností pre AI, Foundry, nasadenie, diagnostiku a ďalšie.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->