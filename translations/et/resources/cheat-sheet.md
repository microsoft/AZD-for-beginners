# Käskude kiirabi - Olulised AZD käsud

**Kiire viide kõigile peatükkidele**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Kiire algus**: [1. peatükk: Alus ja kiire algus](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Tehisintellekti käsud**: [2. peatükk: Tehisintellekti esmane arendus](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Täiustatud**: [4. peatükk: Infrastruktuur koodina](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Sissejuhatus

See põhjalik kiirabi pakub kiiret viidet kõige sagedamini kasutatavatele Azure Developer CLI käskudele, korraldatuna kategooriate kaupa koos praktiliste näidetega. Täiuslik kiireks otsinguks arenduse, tõrkeotsingu ja igapäevaste operatsioonide ajal azd projektidega.

## Õpieesmärgid

Seda kiirabi kasutades:
- On teil kohene juurdepääs olulistele Azure Developer CLI käskudele ja süntaksile
- Mõistate käskude organiseerimist funktsionaalsete kategooriate ja kasutusjuhtude kaupa
- Leiate praktilisi näiteid tavapäraste arendus- ja juurutusstsenaariumite jaoks
- Pääsete ligi tõrkeotsingu käskudele kiireks probleemilahenduseks
- Leiatega tõhusaid viise täiendavate seadistuste ja kohanduste tegemiseks
- Leiatega keskkonnahaldus- ja multi-keskkonna töövoogudega seotud käske

## Õpitulemused

Selle kiirabi regulaarse kasutamisega suudate:
- Käivitada azd käske kindlalt ilma täielikku dokumentatsiooni vaatamata
- Lahendada kiiresti tavalisi probleeme vastavate diagnostikakäskude abil
- Haldada tõhusalt mitut keskkonda ja juurutusstsenaariume
- Rakendada vajadusel täiustatud azd funktsioone ja seadistusvalikuid
- Tõrkeotsida juurutamise probleeme süsteemsete käskude järjestuste abil
- Optimeerida töövooge läbi tõhusate azd otseteede ja valikute

## Alguskäsud

### Autentimine
```bash
# Logi sisse Azure'i kaudu AZD-ga
azd auth login

# Logi sisse Azure CLI-sse (AZD kasutab seda taustal)
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

### Projekti algatamine
```bash
# Sirvi saadaolevaid malle
azd template list

# Algust mallist
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Algust praeguses kataloogis
azd init .

# Algust kohandatud nimega
azd init --template todo-nodejs-mongo my-awesome-app
```

## Põhilised juurutamiskäsud

### Täielik juurutustöövoog
```bash
# Paigalda kõik (varustamine + paigaldamine)
azd up

# Paigalda ilma kinnitusviipadeta
azd up --confirm-with-no-prompt

# Paigalda kindlasse keskkonda
azd up --environment production

# Paigalda kohandatud parameetritega
azd up --parameter location=westus2
```

### Ainult infrastruktuur
```bash
# Azure'i ressursside loomine
azd provision

# 🧪 Eeltutvustus infrastruktuuri muudatustest
azd provision --preview
# Kuvab kuivkäigu vaate sellest, milliseid ressursse luuakse/muutakse/kustutatakse
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

### Ehita ja paki
```bash
# Koosta rakendused
azd package

# Koosta konkreetset teenust
azd package --service api
```

## 🌍 Keskkonna haldus

### Keskkonna toimingud
```bash
# Loetle kõik keskkonnad
azd env list

# Loo uus keskkond
azd env new development
azd env new staging --location westus2

# Vali keskkond
azd env select production

# Näita saadaolevaid keskkondi
azd env list

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

# Loenda kõik keskkonnamuutujad
azd env get-values

# Eemalda keskkonnamuutuja
azd env unset DEBUG
```

## ⚙️ Seadistuskäsud

### Globaalne seadistus
```bash
# Loetle kõik konfiguratsioonid
azd config show

# Määra globaalsed vaikeseaded
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Eemalda konfiguratsioon
azd config unset defaults.location

# Lähtesta kogu konfiguratsioon
azd config reset
```

### Projekti seadistus
```bash
# Kontrolli azure.yaml faili kehtivust
azd config validate

# Näita projekti infot
azd show

# Hangi teenuse lõpp-punktid
azd show --output json
```

## 📊 Jälgimine ja diagnostika

### Jälgimisdashboard
```bash
# Ava Azure portaali jälgimise juhtpaneel
azd monitor

# Ava Application Insights reaalajas mõõdikud
azd monitor --live

# Ava Application Insights logide vaade
azd monitor --logs

# Ava Application Insights ülevaade
azd monitor --overview
```

### Konteineri logide vaatamine
```bash
# Vaata logisid Azure CLI kaudu (Container Apps jaoks)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Jälgi logisid reaalajas
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vaata logisid Azure portaalist
azd monitor --logs
```

### Logianalüüsi päringud
```bash
# Logianalüütika avamine Azure portaali kaudu
azd monitor --logs

# Logide päringud Azure CLI abil
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Hoolduskäsud

### Puhastus
```bash
# Eemalda kõik Azure'i ressursid
azd down

# Sundkustuta kustutamine ilma kinnitamiseta
azd down --force

# Puhasta pehmekustutatud ressursid
azd down --purge

# Täielik puhastus
azd down --force --purge
```

### Uuendused
```bash
# Kontrolli azd uuendusi
azd version

# Hangi praegune versioon
azd version

# Vaata praegust konfiguratsiooni
azd config show
```

## 🔧 Täiustatud käsud

### Töötlemisliin ja CI/CD
```bash
# Konfigureeri GitHub Actions
azd pipeline config

# Konfigureeri Azure DevOps
azd pipeline config --provider azdo

# Näita kanali konfiguratsiooni
azd pipeline show
```

### Infrastruktuuri haldus
```bash
# Genereeri infrastruktuuri malle
azd infra generate

# 🧪 Infrastruktuuri eelvaade ja planeerimine
azd provision --preview
# Simuleerib infrastruktuuri loomist ilma juurutamiseta
# Analüüsib Bicep/Terraform malle ja kuvab:
# - Lisatavad ressursid (roheline +)
# - Muudetavad ressursid (kollane ~)
# - Kustutatavad ressursid (punane -)
# Ohutu käivitada – Azure keskkonnas ei tehta tegelikke muudatusi

# Sünteesi infrastruktuur azure.yaml põhjal
azd infra synth
```

### Projekti info
```bash
# Kuva projekti olek ja lõpp-punktid
azd show

# Kuva üksikasjalik projekti info JSON-ina
azd show --output json

# Hangi teenuse lõpp-punktid
azd show --output json | jq '.services'
```

## 🤖 Tehisintellekti ja laienduste käsud

### AZD laiendused
```bash
# Loetle kõik saadaval olevad laiendused (sh AI)
azd extension list

# Paigalda Foundry agentide laiendus
azd extension install azure.ai.agents

# Paigalda peenhäälestuse laiendus
azd extension install azure.ai.finetune

# Paigalda kohandatud mudelite laiendus
azd extension install azure.ai.models

# Uuenda kõiki paigaldatud laiendusi
azd extension upgrade --all
```

### Tehisintellekti agendi käsud
```bash
# Algatage agendi projekt manifestist
azd ai agent init -m <manifest-path-or-uri>

# Suunake kindlale Foundry projektile
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Määrake agendi lähtekoha kataloog
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Valige hostimise sihtkoht
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP server (Alfa)
```bash
# Käivita MCP server oma projekti jaoks
azd mcp start

# Halda tööriista nõusolekut MCP operatsioonide jaoks
azd copilot consent list
```

### Infrastruktuuri genereerimine
```bash
# Genereeri IaC-failid oma projekti definitsioonist
azd infra generate

# Sünteesi infrastruktuur failist azure.yaml
azd infra synth
```

---

## 🎯 Kiired töövood

### Arendustöövoog
```bash
# Alusta uut projekti
azd init --template todo-nodejs-mongo
cd my-project

# Käivita arenduskeskkonda
azd env new dev
azd up

# Tee muudatused ja käivita uuesti
azd deploy

# Ava monitooringu juhtpaneel
azd monitor --live
```

### Mitmekeskkonna töövoog
```bash
# Seadista keskkonnad
azd env new dev
azd env new staging  
azd env new production

# Paigalda arenduskeskkonda
azd env select dev
azd up

# Testi ja edenda testkeskkonda
azd env select staging
azd up

# Paigalda tootmiskeskkonda
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
azd config show

# Ava jälgimise juhtpaneel logide jaoks
azd monitor --logs

# Kontrolli ressursi olekut
azd show --output json
```

## 🔍 Silumine

### Silumise info
```bash
# Luba silumisväljund
export AZD_DEBUG=true
azd <command> --debug

# Keela telemeetria puhtama väljundi saamiseks
export AZD_DISABLE_TELEMETRY=true

# Kontrolli praegust konfiguratsiooni
azd config show

# Kontrolli autentimisseisundit
az account show
```

### Mallide silumine
```bash
# Loetle saadaolevad mallid koos üksikasjadega
azd template list --output json

# Näita malli teavet
azd template show <template-name>

# Kontrolli malli kehtivust enne algust
azd template validate <template-name>
```

## 📁 Faili- ja kataloogikäsklused

### Projekti struktuur
```bash
# Näita praegust kataloogistruktuuri
tree /f  # Windows
find . -type f  # Linux/macOS

# Liigu azd projekti juurkataloogi
cd $(azd root)

# Näita azd konfiguratsioonikataloogi
echo $AZD_CONFIG_DIR  # Tavaliselt ~/.azd
```

## 🎨 Väljundi vormindamine

### JSON väljund
```bash
# Saa JSON-väljund skriptimiseks
azd show --output json
azd env list --output json
azd config show --output json

# Parsida jq-ga
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeliväljund
```bash
# Vorminda tabelina
azd env list --output table

# Vaata paigaldatud teenuseid
azd show --output json | jq '.services | keys'
```

## 🔧 Levinumad käsukombinatsioonid

### Tervisekontrolli skript
```bash
#!/bin/bash
# Kiire tervisekontroll
azd show
azd env get-values
azd monitor --logs
```

### Juurutamise valideerimine
```bash
#!/bin/bash
# Eelkontroll enne juurutamist
azd show
azd provision --preview  # Vaata muudatusi enne juurutamist
az account show
```

### Keskkondade võrdlus
```bash
#!/bin/bash
# Keskkondade võrdlemine
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Ressursside puhastamise skript
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
# Autentimise lähtestamine
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
# Taastumine ebaõnnestunud juurutamisest - puhasta ja juuruta uuesti
azd down --force --purge
azd up

# Juuruta infrastruktuur uuesti ainult
azd provision

# Juuruta rakendus ainult uuesti
azd deploy
```

## 💡 Professionaalsed nipid

### Otseteed kiiremaks töövooguks
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

# Kiire juurutamine järelevalvega
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Keskkonna olek
azd-status() {
    echo "Current environment:"
    azd env get-values
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

# Näita mallide dokumentatsiooni
azd template show <template-name> --docs
```

---

**Nipp**: Lisage see kiirabi järjehoidjatesse ja kasutage käsukäsude kiire ülesleidmiseks `Ctrl+F`!

---

**Navigeerimine**
- **Eelmine õppetükk**: [Eelpäringud](../docs/pre-deployment/preflight-checks.md)
- **Järgmine õppetükk**: [Terminite sõnastik](glossary.md)

---

> **💡 Kas soovite Azure käskude abi oma koodiredaktoris?** Paigaldage [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) käsuga `npx skills add microsoft/github-copilot-for-azure` — 37 oskust AI, Foundry, juurutamise, diagnostika ja muu jaoks.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud kasutades AI-tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüame täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta mistahes arusaamatuste või valesti tõlgendamise eest, mis võivad tuleneda selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->