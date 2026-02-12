# Käskude Spikker - Olulised AZD Käsklused

**Kiire viide kõikide peatükkide jaoks**
- **📚 Kursuse Avaleht**: [AZD Algajatele](../README.md)
- **📖 Kiirstart**: [1. Peatükk: Alus ja Kiirstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Käsklused**: [2. Peatükk: AI-Esimene Arendus](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Täiustatud**: [4. Peatükk: Infrastruktuur Koodina](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Sissejuhatus

See põhjalik spikker pakub kiiret viidet kõige sagedamini kasutatavatele Azure Developer CLI käskudele, organiseerituna kategooriate kaupa koos praktiliste näidetega. Täiuslik kiireteks otsinguteks arenduse, tõrkeotsingu ja igapäevaste toimingute ajal azd projektidega.

## Õpieesmärgid

Seda spikrit kasutades:
- On teil kohene juurdepääs olulistele Azure Developer CLI käskudele ja süntaksile
- Saate aru käskluste korraldusest funktsionaalsete kategooriate ja kasutusjuhtude järgi
- Võite viidata praktilistele näidetele tavapärastes arendus- ja juurutusstseenarites
- Saate kasutada tõrkeotsingu käske kiireks probleemide lahendamiseks
- Leiate tõhusaid võimalusi täiustatud konfiguratsiooniks ja kohandamiseks
- Leidke keskkonna halduse ja mitmekeskkondliku töövoo käsud

## Õpitulemused

Seda spikrit regulaarselt kasutades suudate:
- Käsklusi azd kasutada kindlalt ilma täismaterjali pideva kontrollita
- Kiirelt lahendada levinud probleeme sobivate diagnostikakäskudega
- Efektiivselt hallata mitut keskkonda ja juurutusstseene
- Vajadusel rakendada täiustatud azd funktsioone ja konfiguratsioonivalikuid
- Lahendada juurutusprobleeme süsteemsete käskluste jada abil
- Optimeerida töövooge tõhusate azd otseteedega ja valikutega

## Alustuskäsud

### Autentimine
```bash
# Logi sisse Azure'i kaudu AZD-ga
azd auth login

# Logi sisse Azure CLI-sse (AZD kasutab seda alltegevusena)
az login

# Kontrolli praegust kontot
az account show

# Sea vaike tellimus
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logi välja AZD-st
azd auth logout

# Logi välja Azure CLI-st
az logout
```

### Projekti initsialiseerimine
```bash
# Sirvi saadaolevaid malle
azd template list

# Algata mallist
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Algata praeguses kataloogis
azd init .

# Algata kohandatud nimega
azd init --template todo-nodejs-mongo my-awesome-app
```

## Põhijuhtimise käsud

### Täielik juurutusvoog
```bash
# Käivita kõik (hankeprotsess + juurutus)
azd up

# Juuruta ilma kinnitusviipadeta
azd up --confirm-with-no-prompt

# Juuruta konkreetsele keskkonnale
azd up --environment production

# Juuruta kohandatud parameetritega
azd up --parameter location=westus2
```

### Ainult infrastruktuur
```bash
# Varusta Azure'i ressursid
azd provision

# 🧪 Eelvaade infrastruktuuri muudatustest
azd provision --preview
# Kuvab kuivtöötluse vaate, milliseid ressursse luuakse/muudetakse/kustutatakse
# Sarnane 'terraform plan' või 'bicep what-if' käsule - ohutu käivitada, muudatusi ei rakendata
```

### Ainult rakendus
```bash
# Rakenduse koodi juurutamine
azd deploy

# Spetsiifilise teenuse juurutamine
azd deploy --service web
azd deploy --service api

# Kõigi teenuste juurutamine
azd deploy --all
```

### Koosta ja paki
```bash
# Ehita rakendusi
azd package

# Ehita konkreetne teenus
azd package --service api
```

## 🌍 Keskkonna haldus

### Keskkonna toimingud
```bash
# Loenda kõik keskkonnad
azd env list

# Loo uus keskkond
azd env new development
azd env new staging --location westus2

# Vali keskkond
azd env select production

# Näita current keskkonda
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

## ⚙️ Konfiguratsioonikäsud

### Globaalne konfiguratsioon
```bash
# Loetle kõik konfiguratsioonid
azd config list

# Määra globaalsed vaikeväärtused
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Eemalda konfiguratsioon
azd config unset defaults.location

# Lähtesta kõik konfiguratsioonid
azd config reset
```

### Projekti konfiguratsioon
```bash
# Kontrolli azure.yaml faili
azd config validate

# Näita projekti infot
azd show

# Hangi teenuse lõpp-punktid
azd show --output json
```

## 📊 Jälgimine ja diagnostika

### Jälgimisliides
```bash
# Ava Azure portaali jälgimise armatuurlaud
azd monitor

# Ava Application Insights live-meetrika
azd monitor --live

# Ava Application Insights logide vahekaart
azd monitor --logs

# Ava Application Insights ülevaade
azd monitor --overview
```

### Konteinerilogide vaatamine
```bash
# Vaata logisid Azure CLI kaudu (Container Apps jaoks)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Jälgi logisid reaalajas
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vaata logisid Azure Portaalist
azd monitor --logs
```

### Logianalüütika päringud
```bash
# Juurdepääs logianalüüsile Azure'i portaalis
azd monitor --logs

# Logide päring Azure CLI abil
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Hooldus

### Puhastus
```bash
# Eemalda kõik Azure'i ressursid
azd down

# Sundkustuta kustutamine ilma kinnitamiseta
azd down --force

# Puhasta pehmelt kustutatud ressursid
azd down --purge

# Täielik korrastus
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

## 🔧 Täiustatud käsud

### Pipelines ja CI/CD
```bash
# Konfigureeri GitHub Actions
azd pipeline config

# Konfigureeri Azure DevOps
azd pipeline config --provider azdo

# Näita torujuhtme konfiguratsiooni
azd pipeline show
```

### Infrastruktuuri haldus
```bash
# Genereeri infrastruktuuri malle
azd infra generate

# 🧪 Infrastruktuuri eelvaade ja planeerimine
azd provision --preview
# Simuleerib infrastruktuuri loomist ilma juurutamiseta
# Analüüsib Bicep/Terraform malle ja näitab:
# - Lisatavad ressursid (roheline +)
# - Muudetavad ressursid (kollane ~)
# - Kustutatavad ressursid (punane -)
# Ohutu käivitada - Azure keskkonda ei muudeta tegelikult

# Sünteesi infrastruktuur azure.yaml-ist
azd infra synth
```

### Projekti info
```bash
# Näita projekti olekut ja lõpp-punkte
azd show

# Näita üksikasjalikku projekti teavet JSON-ina
azd show --output json

# Hangi teenuste lõpp-punktid
azd show --output json | jq '.services'
```

## 🎯 Kiired töövood

### Arendustöövoog
```bash
# Alusta uut projekti
azd init --template todo-nodejs-mongo
cd my-project

# Paiguta arenduskeskkonda
azd env new dev
azd up

# Tee muudatusi ja paiguta uuesti
azd deploy

# Ava jälgimise armatuurlaud
azd monitor --live
```

### Mitme keskkonna töövoog
```bash
# Keskkondade seadistamine
azd env new dev
azd env new staging  
azd env new production

# Arenduskeskkonda juurutamine
azd env select dev
azd up

# Testimine ja edastamine eelvaatluskeskkonda
azd env select staging
azd up

# Tootmiskeskkonda juurutamine
azd env select production
azd up
```

### Tõrkeotsingu töövoog
```bash
# Luba silumisrežiim
export AZD_DEBUG=true

# Kontrolli juurutamise olekut
azd show

# Kontrolli konfiguratsiooni kehtivust
azd config list

# Ava logide jälgimise armatuurlaud
azd monitor --logs

# Kontrolli ressursi olekut
azd show --output json
```

## 🔍 Silumine

### Silumisinfo
```bash
# Luba silumise väljund
export AZD_DEBUG=true
azd <command> --debug

# Keela telemeetria paremaks väljundiks
export AZD_DISABLE_TELEMETRY=true

# Kontrolli praegust konfiguratsiooni
azd config list

# Kontrolli autentimise olekut
az account show
```

### Mallide silumine
```bash
# Loetle saadaolevad mallid koos detailidega
azd template list --output json

# Näita malli teavet
azd template show <template-name>

# Kontrolli malli enne algatamist
azd template validate <template-name>
```

## 📁 Failide ja kaustade käsud

### Projekti struktuur
```bash
# Näita praegust kataloogistruktuuri
tree /f  # Windows
find . -type f  # Linux/macOS

# Liigu azd projekti juurkausta
cd $(azd root)

# Näita azd konfiguratsioonikataloogi
echo $AZD_CONFIG_DIR  # Tavaliselt ~/.azd
```

## 🎨 Väljundi vormindamine

### JSON väljund
```bash
# Saa JSON väljund skriptimiseks
azd show --output json
azd env list --output json
azd config list --output json

# Parsida jq-iga
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeli väljund
```bash
# Vorminda tabelina
azd env list --output table

# Vaata kasutusele võetud teenuseid
azd show --output json | jq '.services | keys'
```

## 🔧 Levinud käskluste kombinatsioonid

### Tervisekontrolli skript
```bash
#!/bin/bash
# Kiire tervisekontroll
azd show
azd env show
azd monitor --logs
```

### Juurutuse valideerimine
```bash
#!/bin/bash
# Eelvalideerimine enne juurutamist
azd show
azd provision --preview  # Muudatuste eelvaade enne juurutamist
az account show
```

### Keskkondade võrdlus
```bash
#!/bin/bash
# Võrdle keskkondi
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Ressursside puhastusskript
```bash
#!/bin/bash
# Vanade keskkondade koristamine
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Keskkonnamuutujad

### Levinud keskkonnamuutujad
```bash
# Azure'i konfiguratsioon
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

## 🚨 Hädaolukorra käsud

### Kiired parandused
```bash
# Lähtesta autentimine
az account clear
az login

# Sundvärskenda keskkond
azd env refresh

# Taaskäivita kõik teenused
azd deploy

# Kontrolli juurutamise olekut
azd show --output json
```

### Taastamiskäsud
```bash
# Taasta ebaõnnestunud juurutamisest - puhasta ja juuruta uuesti
azd down --force --purge
azd up

# Taasta ainult infrastruktuur
azd provision

# Juuruta ainult rakendus uuesti
azd deploy
```

## 💡 Pro Nõuanded

### Kiiremaks töövooguks aliased
```bash
# Lisa oma .bashrc või .zshrc faili
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktsioonide otseteed
```bash
# Kiire keskkonna vahetamine
azd-env() {
    azd env select $1 && azd show
}

# Kiire juurutamine koos jälgimisega
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

## 📖 Abi ja dokumentatsioon

### Abi saamine
```bash
# Üldine abi
azd --help
azd help

# Käsu-spetsiifiline abi
azd up --help
azd env --help
azd config --help

# Näita versiooni ja ehituse infot
azd version
azd version --output json
```

### Dokumentatsiooni lingid
```bash
# Ava dokumentatsioon brauseris
azd docs

# Näita malli dokumentatsiooni
azd template show <template-name> --docs
```

---

**Nõuanne**: Lisage see spikker järjehoidjaks ja kasutage `Ctrl+F`, et kiiresti leida vajalikud käsud!

---

**Navigeerimine**
- **Eelmine õppetund**: [Ettevalmistuskontrollid](../docs/pre-deployment/preflight-checks.md)
- **Järgmine õppetund**: [Glosaar](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada usaldusväärseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Meie vastutus ei laiene selliste arusaamatuste ega valesti tõlgenduste eest, mis võivad tekkida selle tõlke kasutamisel.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->