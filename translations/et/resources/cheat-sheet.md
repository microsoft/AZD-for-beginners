# Käskude Kiirviide - Olulised AZD käsud

**Kiire Viide Kõigi Peatükkide jaoks**
- **📚 Kursuse Avaleht**: [AZD Algajatele](../README.md)
- **📖 Kiire Algus**: [Peatükk 1: Alused & Kiire Algus](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Käsud**: [Peatükk 2: AI-Esimene Arendus](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Täpsem**: [Peatükk 4: Infrastruktuur Koodina](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Sissejuhatus

See põhjalik kiirviide pakub kiire ligipääsu kõige sagedamini kasutatavatele Azure Developer CLI käskudele, organiseeritud kategooriate kaupa koos praktiliste näidetega. Täiuslik kiireks otsimiseks arenduse, veaotsingu ja igapäevaste operatsioonide ajal azd projektidega.

## Õpieesmärgid

Seda kiirviidet kasutades:
- Saab kohe ligipääsu olulistele Azure Developer CLI käskudele ja süntaksile
- Mõistab käskude korraldust funktsionaalsete kategooriate ja kasutusjuhtumite kaupa
- Saab viidata praktilistele näidetele ühiste arendus- ja juurutusstsenaariumide puhul
- Saab kasutada veaotsingu käske kiireks probleemide lahendamiseks
- Leiab kiiresti täpsemad seade- ja kohandamisvalikud
- Leiab keskkonnahaldus- ja mitme keskkonna töövoo käske

## Õpitulemused

Seda kiirviidet regulaarselt kasutades suudad:
- Täita azd käske kindlalt ilma põhjalikku dokumentatsiooni vaatamata
- Kiiresti lahendada levinud probleeme sobivate diagnostikakäskude abil
- Efektiivselt hallata mitut keskkonda ja juurutusstsenaariumi
- Vajadusel rakendada täpsemaid azd funktsioone ja seadistamisvalikuid
- Veaotsinguks kasutada süsteemseid käsujärjestusi juurutusprobleemide lahendamiseks
- Optimeerida töövoogu, kasutades tõhusaid azd otseteid ja valikuid

## Algusjuhised

### Autentimine
```bash
# Logi sisse Azure'i AZD kaudu
azd auth login

# Logi sisse Azure CLI-sse (AZD kasutab seda tagaosas)
az login

# Kontrolli praegust kontot
az account show

# Sea vaikimisi tellimus
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logi välja AZD-st
azd auth logout

# Logi välja Azure CLI-st
az logout
```

### Projekti Algatamine
```bash
# Sirvi saadaval olevaid malle
azd template list

# Algata mallist
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Algata praeguses kataloogis
azd init .

# Algata kohandatud nimega
azd init --template todo-nodejs-mongo my-awesome-app
```

## Põhilised Juurutuskäsud

### Täielik Juurutustöövoog
```bash
# Rake kõik (varusta + juuruta)
azd up

# Juuruta ilma kinnituskäsklusteta
azd up --confirm-with-no-prompt

# Juuruta konkreetsele keskkonnale
azd up --environment production

# Juuruta kohandatud parameetritega
azd up --parameter location=westus2
```

### Ainult Infrastruktuur
```bash
# Azure'i ressursside loomine
azd provision

# 🧪 Eelvaade infrastruktuuri muudatustest
azd provision --preview
# Kuvab kuiv- jooksu vaate sellest, millised ressursid luuakse/muutakse/kustutatakse
# Sarnane 'terraform plan' või 'bicep what-if' käsule - ohutu käivitada, muudatusi ei rakendata
```

### Ainult Rakendus
```bash
# Rakenduse koodi juurutamine
azd deploy

# Konkreetse teenuse juurutamine
azd deploy --service web
azd deploy --service api

# Kõigi teenuste juurutamine
azd deploy --all
```

### Ehitamine ja Pakendamine
```bash
# Ehita rakendusi
azd package

# Ehita konkreetne teenus
azd package --service api
```

## 🌍 Keskkonna Haldus

### Keskkonna Tegevused
```bash
# Loendi kõik keskkonnad
azd env list

# Loo uus keskkond
azd env new development
azd env new staging --location westus2

# Vali keskkond
azd env select production

# Näita praegust keskkonda
azd env show

# Värskenda keskkonna olekut
azd env refresh
```

### Keskkonnamuutujad
```bash
# Määra keskkonnamuutuja
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Hangi keskkonnamuutuja
azd env get API_KEY

# Loetle kõik keskkonnamuutujad
azd env get-values

# Eemalda keskkonnamuutuja
azd env unset DEBUG
```

## ⚙️ Seadistuskäsud

### Globaalne Seadistus
```bash
# Loenda kõik konfiguratsioonid
azd config list

# Sea globaalsed vaikeseaded
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Eemalda konfiguratsioon
azd config unset defaults.location

# Lähtesta kõik konfiguratsioonid
azd config reset
```

### Projekti Seadistus
```bash
# Kontrolli azure.yaml faili
azd config validate

# Näita projekti teavet
azd show

# Hangi teenuse lõpp-punktid
azd show --output json
```

## 📊 Jälgimine ja Diagnostika

### Jälgimisarmatuurlaud
```bash
# Ava Azure portaali seire armatuurlaud
azd monitor

# Ava Application Insights reaalajas mõõdikud
azd monitor --live

# Ava Application Insights logide vaade
azd monitor --logs

# Ava Application Insights ülevaade
azd monitor --overview
```

### Konteineri Logide Vaade
```bash
# Vaata logisid Azure CLI kaudu (Container Apps jaoks)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Jälgi logisid reaalajas
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vaata logisid Azure Portaalist
azd monitor --logs
```

### Logianalüüsi Päringud
```bash
# Juurdepääs logianalüütikale Azure'i portaali kaudu
azd monitor --logs

# Päringulogi kasutamine Azure CLI abil
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Hoolduskäsud

### Puhastamine
```bash
# Eemalda kõik Azure'i ressursid
azd down

# Sundkustuta kustutamine
azd down --force

# Pehmelt kustutatud ressursside puhastamine
azd down --purge

# Täielik puhastus
azd down --force --purge
```

### Uuendused
```bash
# Kontrolli azd värskendusi
azd version

# Hangi praegune versioon
azd version

# Vaata praegust konfiguratsiooni
azd config list
```

## 🔧 Täpsemad Käsud

### Torujuhe ja CI/CD
```bash
# Konfigureeri GitHub Actions
azd pipeline config

# Konfigureeri Azure DevOps
azd pipeline config --provider azdo

# Näita torujuhtme konfiguratsiooni
azd pipeline show
```

### Infrastruktuuri Haldus
```bash
# Genereeri infrastruktuuri malle
azd infra generate

# 🧪 Infrastruktuuri eelvaade ja planeerimine
azd provision --preview
# Simuleerib infrastruktuuri loomist ilma juurutamata
# Analüüsib Bicep/Terraform malle ja kuvab:
# - Lisatavad ressursid (roheline +)
# - Muudetavad ressursid (kollane ~)
# - Kustutatavad ressursid (punane -)
# Turvaline käivitada - Azure keskkonnas ei tehta tegelikke muudatusi

# Sünteesi infrastruktuur azure.yaml failist
azd infra synth
```

### Projekti Informatsioon
```bash
# Näita projekti staatust ja lõpp-punkte
azd show

# Näita üksikasjalikku projekti infot JSON-formaadis
azd show --output json

# Hangi teenuse lõpp-punktid
azd show --output json | jq '.services'
```

## 🤖 AI & Laienduste Käsud

### AZD Laiendused
```bash
# Loetle kõik saadaval laiendused (sh AI)
azd extension list

# Paigalda Foundry agendi laiendus
azd extension install azure.ai.agents

# Paigalda täiustamise laiendus
azd extension install azure.ai.finetune

# Paigalda kohandatud mudelite laiendus
azd extension install azure.ai.models

# Uuenda kõik paigaldatud laiendused
azd extension upgrade --all
```

### AI Agendi Käsud
```bash
# Initsialiseeri agendi projekt manifestist
azd ai agent init -m <manifest-path-or-uri>

# Suuna kindlale Foundry projektile
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Määra agendi lähtekaust
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Vali majutamise sihtkoht
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alfa)
```bash
# Käivita MCP server oma projekti jaoks
azd mcp start

# Halda tööriistade nõusolekut MCP operatsioonide jaoks
azd mcp consent
```

### Infrastruktuuri Generatsioon
```bash
# Loo infrastruktuuri kui koodi failid oma projekti definitsioonist
azd infra generate

# Süntetiseeri infrastruktuur failist azure.yaml
azd infra synth
```

---

## 🎯 Kiired Töövood

### Arenduse Töövoog
```bash
# Alusta uut projekti
azd init --template todo-nodejs-mongo
cd my-project

# Paigalda arenduskeskkonda
azd env new dev
azd up

# Tee muudatused ja paigalda uuesti
azd deploy

# Ava jälgimisarmatuurlaud
azd monitor --live
```

### Mitme Keskkonna Töövoog
```bash
# Loo keskkonnad
azd env new dev
azd env new staging  
azd env new production

# Paigalda arenduskeskkonda
azd env select dev
azd up

# Testi ja vii eeltootmisse
azd env select staging
azd up

# Paigalda tootmiskeskkonda
azd env select production
azd up
```

### Veaotsingu Töövoog
```bash
# Luba silumisrežiim
export AZD_DEBUG=true

# Kontrolli juurutamise olekut
azd show

# Kontrolli konfiguratsiooni kehtivust
azd config list

# Ava logide jälgimise juhtpaneel
azd monitor --logs

# Kontrolli ressursi olekut
azd show --output json
```

## 🔍 Silumine

### Silumise Info
```bash
# Luba silumisväljund
export AZD_DEBUG=true
azd <command> --debug

# Keela telemeetria puhtama väljundi jaoks
export AZD_DISABLE_TELEMETRY=true

# Kontrolli praegust konfiguratsiooni
azd config list

# Kontrolli autentimise olekut
az account show
```

### Malli Silumine
```bash
# Loetle saadaolevad mallid koos üksikasjadega
azd template list --output json

# Näita malli teavet
azd template show <template-name>

# Kontrolli malli enne algust
azd template validate <template-name>
```

## 📁 Failide ja Kaustade Käsud

### Projekti Struktuur
```bash
# Näita praeguse kataloogi struktuuri
tree /f  # Windows
find . -type f  # Linux/macOS

# Liigu azd projekti juurkausta
cd $(azd root)

# Näita azd konfiguratsioonikataloogi
echo $AZD_CONFIG_DIR  # Tavaliselt ~/.azd
```

## 🎨 Väljundi Vormindamine

### JSON Väljund
```bash
# Saa JSON väljund skriptimiseks
azd show --output json
azd env list --output json
azd config list --output json

# Analüüsi jq-ga
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeli Väljund
```bash
# Vorminda tabelina
azd env list --output table

# Vaata juurutatud teenuseid
azd show --output json | jq '.services | keys'
```

## 🔧 Levinud Käsukombinatsioonid

### Tervisekontrolli Skript
```bash
#!/bin/bash
# Kiire tervisekontroll
azd show
azd env show
azd monitor --logs
```

### Juurutuse Kontrollimine
```bash
#!/bin/bash
# Eelkontroll enne juurutamist
azd show
azd provision --preview  # Muudatuste eelvaade enne juurutamist
az account show
```

### Keskkondade Võrdlus
```bash
#!/bin/bash
# Võrdle keskkondi
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Ressursside Puhastamise Skript
```bash
#!/bin/bash
# Puhasta vanad keskkonnad
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Keskkonnamuutujad

### Levinud Keskkonnamuutujad
```bash
# Azure konfiguratsioon
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD konfiguratsioon
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Rakenduse konfiguratsioon
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Hädaolukorra Käsud

### Kiired Parandused
```bash
# Autentimise lähtestamine
az account clear
az login

# Käsitsi keskkonna värskendamine
azd env refresh

# Kõikide teenuste uuesti juurutamine
azd deploy

# Juurutamise oleku kontrollimine
azd show --output json
```

### Taastamiskäsud
```bash
# Taastumine ebaõnnestunud juurutamisest - puhasta ja juuruta uuesti
azd down --force --purge
azd up

# Taastamine ainult infrastruktuuri jaoks
azd provision

# Rakenduse uuesti juurutamine ainult
azd deploy
```

## 💡 Pro Nõuanded

### Kiiremaks Töövooguks Aliased
```bash
# Lisa oma .bashrc või .zshrc faili
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktsioonide Otseteed
```bash
# Kiire keskkonna vahetamine
azd-env() {
    azd env select $1 && azd show
}

# Kiire juurutamine jälgimisega
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Keskkonna olek
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Abi ja Dokumentatsioon

### Abi Saamine
```bash
# Üldine abi
azd --help
azd help

# Käsklusepõhine abi
azd up --help
azd env --help
azd config --help

# Näita versiooni ja ehitusteavet
azd version
azd version --output json
```

### Dokumentatsiooni Lingid
```bash
# Ava dokumentatsioon brauseris
azd docs

# Näita malli dokumentatsiooni
azd template show <template-name> --docs
```

---

**Nõuanne**: Jäädvusta see kiirviide järjehoidjaks ja kasuta `Ctrl+F`, et kiiresti leida vajalikud käsud!

---

**Navigatsioon**
- **Eelmine Tund**: [Eelsõidu Kontrollid](../docs/pre-deployment/preflight-checks.md)
- **Järgmine Tund**: [Terminoloogia](glossary.md)

---

> **💡 Tahad Azure käsuabi oma redaktoris?** Paigalda [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) käsuga `npx skills add microsoft/github-copilot-for-azure` — 37 oskust AI, Foundry, juurutuse, diagnostika ja muude jaoks.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle algkeeles on pidada autoriteetseks allikaks. Kriitilise tähtsusega teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->