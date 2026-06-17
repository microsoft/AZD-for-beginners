# Käskude kokkuvõte - Olulised AZD käsud

**Kiirviide kõigi peatükkide jaoks**
- **📚 Kooli avaleht**: [AZD algajatele](../README.md)
- **📖 Kiire algus**: [1. peatükk: Alused ja kiire algus](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI käsud**: [2. peatükk: AI-eespaineline arendus](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Täiustatud**: [4. peatükk: Infrastruktuur koodina](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Sissejuhatus

See põhjalik abileht pakub kiiret viidet kõige sagedamini kasutatavatele Azure Developer CLI käskudele, organiseerituna kategooriate kaupa koos praktiliste näidetega. Ideaalne kiireteks otsinguteks arenduse, tõrkeotsingu ja igapäevaste tegevuste käigus azd projektidega.

## Õpieesmärgid

Selle abilehe kasutamisel saad:
- Kohese juurdepääsu olulistele Azure Developer CLI käskudele ja süntaksile
- Mõista käskude organiseerimist funktsionaalsete kategooriate ja kasutusjuhtumite kaupa
- Viidata praktilistele näidetele sagedaste arendus- ja juurutusstsenaariumite jaoks
- Ligipääsu tõrkeotsingu käskudele kiireks probleemide lahendamiseks
- Leida tõhusaid täiustatud konfiguratsiooni ja kohandamise võimalusi
- Paindlikult hallata keskkondi ja mitmekesiseid töövooge

## Õpitulemused

Abilehte regulaarselt kasutades suudad:
- Käivitada azd käske kindlalt ilma täielikku dokumentatsiooni vaja minemata
- Kiirelt lahendada levinud probleeme sobivate diagnostikakäskude abil
- Tõhusalt hallata mitut keskkonda ja juurutusstsenaariume
- Vajadusel rakendada azd täiustatud funktsioone ja konfiguratsioone
- Tõrkeotsinguks kasutada süsteemseid käskude jadasid
- Optimeerida töövooge azd otseteede ja valikute abil

## Alguskäsud

### Autentimine
```bash
# Logi sisse Azure'i AZD kaudu
azd auth login

# Logi sisse Azure CLI-sse (AZD kasutab seda taustal)
az login

# Kontrolli praegust kontot
az account show

# Määra vaikimisi tellimus
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

## Põhijuurutuse käsud

### Täisjuurutuse töövoog
```bash
# Paigalda kõik (tarne + juurutus)
azd up

# Paigalda ilma kinnituskutseteta
azd up --confirm-with-no-prompt

# Paigalda konkreetsele keskkonnale
azd up --environment production

# Paigalda kohandatud parameetritega
azd up --parameter location=westus2
```

### Ainult infrastruktuur
```bash
# Azure'i ressursside loomine
azd provision

# 🧪 Infrastruktuuri muudatuste eelvaade
azd provision --preview
# Kuvab kuivkäigu vaate sellest, millised ressursid luuakse/muudetakse/kustutatakse
# Sarnane "terraform plan" või "bicep what-if" käsuga – ohutu käivitada, muudatusi ei rakendata
```

### Ainult rakendus
```bash
# Rakenduse koodi juurutamine
azd deploy

# Kindla teenuse juurutamine
azd deploy --service web
azd deploy --service api

# Kõigi teenuste juurutamine
azd deploy --all
```

### Koosta ja paki
```bash
# Taasta (laadi alla) rakenduse sõltuvused
azd restore

# Taasta konkreetne teenus
azd restore --service api

# Ehita juurutatav artefakt ilma juurutamata
azd package

# Ehita konkreetne teenus
azd package --service api
```

> **`azd restore`** laadib alla sinu rakenduse sõltuvused (npm, pip, NuGet, Maven jt). See käivitatakse automaatselt käskude `azd package` ja `azd deploy` ajal, nii et seda ei ole tavaliselt vaja käsitsi käivitada — tee seda käsitsi ainult sõltuvuste eellaadimiseks (näiteks CI vahemälu soojendamiseks või hiljem võrguühenduseta tööks).

> **`azd package`** ehitab levitatava artefakti (konteineripildi või zip-faili) **ilma** seda Azuresse üles tõstmata. Kasuta eraldi, et veenduda ehituse edukuses, kontrollida väljundit või toota artefakti, mida mõni teine protsess hiljem levitab. Käsk `azd deploy` pakib automaatselt, seega on `azd package` vajalik vaid siis, kui soovid artefakti ilma juurutamiseta.


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
# Sea keskkonnamuutuja
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Hangi keskkonnamuutuja
azd env get API_KEY

# Loetle kõik keskkonnamuutujad
azd env get-values

# Eemalda keskkonnamuutuja
azd env unset DEBUG
```

## ⚙️ Konfiguratsiooni käsud

### Globaalne konfiguratsioon
```bash
# Loenda kogu konfiguratsioon
azd config show

# Sea globaalsed vaikeväärtused
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Eemalda konfiguratsioon
azd config unset defaults.location

# Lähtesta kogu konfiguratsioon
azd config reset
```

### Projekti konfiguratsioon
```bash
# Kontrolli azure.yaml faili kehtivust
azd config validate

# Näita projekti teavet
azd show

# Hangi teenuse lõpp-punktid
azd show --output json
```

## 📊 Jälgimine ja diagnostika

### Jälgimisdashbord
```bash
# Ava Azure portaali jälgimisvaade
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
# Logide vaatamine Azure CLI kaudu (Container Apps jaoks)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Logide reaalajas jälgimine
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Logide vaatamine Azure portaali kaudu
azd monitor --logs
```

### Logianalüüsi päringud
```bash
# Juurdepääs logianalüüsile Azure portaali kaudu
azd monitor --logs

# Päringute logid Azure CLI abil
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Hooldus käsud

### Puhastamine
```bash
# Eemalda kõik Azure ressursid
azd down

# Sundkustuta kustutamine ilma kinnitamiseta
azd down --force

# Puhasta pehmelt kustutatud ressursid
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

### Torujuhtme- ja CI/CD-käsud
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
# Analüüsib Bicep/Terraform malle ja kuvab:
# - Lisaandmed ressursid (roheline +)
# - Muudetavad ressursid (kollane ~)
# - Kustutatavad ressursid (punane -)
# Turvaline käivitada - tegelikke muudatusi Azure keskkonnas ei tehta

# Sünteesi infrastruktuur failist azure.yaml
azd infra synth
```

### Projekti info
```bash
# Näita projekti staatust ja otspunktide teavet
azd show

# Näita detailset projekti infot JSON formaadis
azd show --output json

# Hangi teenuse otspunktid
azd show --output json | jq '.services'
```

## 🤖 AI ja laiendused

### AZD laiendused
```bash
# Loetle kõik saadaolevad laiendused (sh tehisintellekt)
azd extension list

# Paigalda Foundry agendid laiendus
azd extension install azure.ai.agents

# Paigalda agendi oskused laiendus (eelvaade)
azd extension install azure.ai.skills

# Paigalda Foundry ühendused laiendus (eelvaade)
azd extension install azure.ai.connections

# Paigalda peenhäälestuse laiendus
azd extension install azure.ai.finetune

# Paigalda kohandatud mudelite laiendus
azd extension install azure.ai.models

# Uuenda kõiki paigaldatud laiendusi
azd extension upgrade --all
```

### AI agentide käsud
```bash
# Algata agentuuri projekt manifestist
azd ai agent init -m <manifest-path-or-uri>

# Sihtmärk konkreetsele Foundry projektile
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Määra agentuuri allikakausta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Vali hostimise sihtkoht
azd ai agent init -m agent-manifest.yaml --host containerapp

# Testi juurutatud agentuuri (näitab latentsust + esimese baidi aega)
azd ai agent invoke

# Näita otse kaudu lõpp-punkti konfiguratsiooni
azd ai agent endpoint show

# Genereeri hindamise andmestik, seejärel optimeeri agentuuri
azd ai agent eval generate
azd ai agent optimize

# Laadi alla juhtekoodipõhise hostitud agentuuri juurutatud lähtekood
azd ai agent code download

# Kustuta hostitud agentuur ja kõik selle versioonid (--force lõpetab aktiivsed seansid)
azd ai agent delete --force
```

### MCP server (Alpha)
```bash
# Käivita MCP server oma projekti jaoks
azd mcp start

# Halda tööriista nõusolekut MCP toimingute jaoks
azd copilot consent list
```

### Infrastruktuuri genereerimine
```bash
# Genereeri IaC faile oma projekti definitsioonist
azd infra generate

# Sünthetiseeri infrastruktuur failist azure.yaml
azd infra synth
```

---

## 🎯 Kiired töövood

### Arendus töövoog
```bash
# Alusta uut projekti
azd init --template todo-nodejs-mongo
cd my-project

# Paigalda arenduskeskkonda
azd env new dev
azd up

# Tee muudatused ja paigalda uuesti
azd deploy

# Ava jälgimise juhtpaneel
azd monitor --live
```

### Mitmekeskkonna töövoog
```bash
# Seadista keskkonnad
azd env new dev
azd env new staging  
azd env new production

# Juhi arenduskeskkonda
azd env select dev
azd up

# Testi ja edenda lavastuskeskkonda
azd env select staging
azd up

# Juhi tootmiskeskkonda
azd env select production
azd up
```

### Tõrkeotsingu töövoog
```bash
# Luba silumisrežiim
export AZD_DEBUG=true

# Kontrolli juurutamise staatust
azd show

# Kinnita konfiguratsioon
azd config show

# Ava jälgimise juhtpaneel logide jaoks
azd monitor --logs

# Kontrolli ressursi staatust
azd show --output json
```

## 🔍 Silumine käsud

### Silumise info
```bash
# Luba silumisväljund
export AZD_DEBUG=true
azd <command> --debug

# Keela telemeetria puhtama väljundi jaoks
export AZD_DISABLE_TELEMETRY=true

# Kontrolli praegust konfiguratsiooni
azd config show

# Kontrolli autentimise olekut
az account show
```

### Malli silumine
```bash
# Loetle saadaolevad mallid koos üksikasjadega
azd template list --output json

# Näita malli teavet
azd template show <template-name>

# Kontrolli malli enne initsialiseerimist
azd template validate <template-name>
```

## 📁 Failide ja kaustade käsud

### Projekti struktuur
```bash
# Näita praegust kataloogi struktuuri
tree /f  # Windows
find . -type f  # Linux/macOS

# Liigu azd projekti juurkausta
cd $(azd root)

# Näita azd konfiguratsiooni kataloogi
echo $AZD_CONFIG_DIR  # Tavaliselt ~/.azd
```

## 🎨 Väljundi vormindamine

### JSON väljund
```bash
# Hangi skriptimiseks JSON-väljund
azd show --output json
azd env list --output json
azd config show --output json

# Töötle jq-ga
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeli väljund
```bash
# Vorminda tabelina
azd env list --output table

# Vaata juurutatud teenuseid
azd show --output json | jq '.services | keys'
```

## 🔧 Levinud käskude kombinatsioonid

### Oleku kontrollskript
```bash
#!/bin/bash
# Kiire tervisekontroll
azd show
azd env get-values
azd monitor --logs
```

### Juurutuse valideerimine
```bash
#!/bin/bash
# Eelkontroll enne kasutuselevõttu
azd show
azd provision --preview  # Vaata muudatusi enne kasutuselevõttu
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

## 🚨 Hädaabikäsklused

### Kiired parandused
```bash
# Autentimise lähtestamine
az account clear
az login

# Keskkonna sunnitud värskendamine
azd env refresh

# Kõigi teenuste uuesti juurutamine
azd deploy

# Juurutamise oleku kontrollimine
azd show --output json
```

### Taastamiskäsud
```bash
# Taasta ebaõnnestunud juurutamisest - puhasta ja juuruta uuesti
azd down --force --purge
azd up

# Juuruta infrastruktuur ainult uuesti
azd provision

# Juuruta rakendus ainult uuesti
azd deploy
```

## 💡 Profi näpunäited

### Otseteed kiiremateks töövoogudeks
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

# Näita malli dokumentatsiooni
azd template show <template-name> --docs
```

---

**Näpunäide**: Salvesta see abileht järjehoidjatesse ja kasuta `Ctrl+F`, et kiiresti leida soovitud käske!

---

**Navigatsioon**
- **Eelmine õppetund**: [Eelhoiatused](../docs/pre-deployment/preflight-checks.md)
- **Järgmine õppetund**: [Sõnastik](glossary.md)

---

> **💡 Tahad Azure käskude abi otse oma toimetajas?** Paigalda [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) käsuga `npx skills add microsoft/github-copilot-for-azure` — 37 oskust AI, Foundry, juurutuse, diagnostika ja muu jaoks.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->