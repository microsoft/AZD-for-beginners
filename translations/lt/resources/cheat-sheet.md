# Komandų atmintinė - Esminės AZD komandos

**Greita nuoroda visiems skyriams**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../README.md)
- **📖 Greitas startas**: [1 skyrius: Pagrindai ir greitas pradėjimas](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI komandos**: [2 skyrius: AI-pirmasis kūrimas](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pažangūs**: [4 skyrius: Infrastruktūra kaip kodas](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Įvadas

Ši išsami atmintinė suteikia greitą nuorodą dažniausiai naudojamoms Azure Developer CLI (azd) komandoms, suskirstytoms pagal kategorijas su praktiškais pavyzdžiais. Puikiai tinka greitai pasitikrinti kūrimo, trikčių šalinimo ir kasdienių operacijų metu dirbant su azd projektais.

## Mokymosi tikslai

Naudodami šią atmintinę, jūs:
- Turėsite greitą prieigą prie esminių Azure Developer CLI komandų ir sintaksės
- Suprasite komandų organizavimą pagal funkcines kategorijas ir naudojimo atvejus
- Galėsite pasikliauti praktiniais pavyzdžiais dažnai pasitaikančioms kūrimo ir diegimo situacijoms
- Turėsite prieigą prie trikčių šalinimo komandų greitam problemų sprendimui
- Lengvai rasite pažangias konfigūracijos ir pritaikymo parinktis
- Surasite aplinkų valdymo ir kelių aplinkų darbo eigos komandas

## Mokymosi rezultatai

Reguliariai naudodamiesi šia atmintine, jūs gebėsite:
- Vykdyti azd komandas užtikrintai nežiūrint į pilną dokumentaciją
- Greitai išspręsti įprastas problemas naudodami tinkamas diagnostines komandas
- Efektyviai valdyti kelias aplinkas ir diegimo scenarijus
- Taikyti pažangias azd funkcijas ir konfigūracijos parinktis pagal poreikį
- Trikčių šalinimą diegiant atlikti naudojant sistemingas komandų sekas
- Optimizuoti darbo eigos naudodami efektyvias azd nuorodas ir parinktis

## Pradžios komandos

### Autentifikacija
```bash
# Prisijungti prie Azure naudojant AZD
azd auth login

# Prisijungti prie Azure CLI (AZD tai naudoja po gaubtu)
az login

# Patikrinti dabartinę paskyrą
az account show

# Nustatyti numatytąją prenumeratą
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Atsijungti nuo AZD
azd auth logout

# Atsijungti nuo Azure CLI
az logout
```

### Projekto inicializavimas
```bash
# Naršyti prieinamus šablonus
azd template list

# Inicializuoti iš šablono
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializuoti dabartiniame kataloge
azd init .

# Inicializuoti su pasirinktu pavadinimu
azd init --template todo-nodejs-mongo my-awesome-app
```

## Pagrindinės diegimo komandos

### Pilna diegimo darbo eiga
```bash
# Įdiegti viską (paruošimas + diegimas)
azd up

# Įdiegti su išjungtais patvirtinimo raginimais
azd up --confirm-with-no-prompt

# Įdiegti į konkrečią aplinką
azd up --environment production

# Įdiegti su pasirinktiniais parametrais
azd up --parameter location=westus2
```

### Tik infrastruktūra
```bash
# Paruošti Azure išteklius
azd provision

# 🧪 Peržiūrėti infrastruktūros pakeitimus
azd provision --preview
# Rodo bandomąją peržiūrą, kokie ištekliai būtų sukurti/pakeisti/ištrinti
# Panašu į 'terraform plan' arba 'bicep what-if' - saugu vykdyti, jokie pakeitimai nebus taikomi
```

### Tik aplikacija
```bash
# Diegti programos kodą
azd deploy

# Diegti konkrečią paslaugą
azd deploy --service web
azd deploy --service api

# Diegti visas paslaugas
azd deploy --all
```

### Kūrimas ir pakavimas
```bash
# Atkurti (atsisiųsti) programos priklausomybes
azd restore

# Atkurti konkrečią paslaugą
azd restore --service api

# Sukurti diegimui skirtą artefaktą neįdiegiant
azd package

# Sukurti konkrečią paslaugą
azd package --service api
```

> **`azd restore`** atsisiunčia jūsų programos priklausomybes (npm, pip, NuGet, Maven ir kt.). Jis automatiškai paleidžiamas vykdant `azd package` ir `azd deploy`, todėl retai jį kviečiate tiesiogiai — paleiskite rankiniu būdu iš anksto parsisiųsti priklausomybes (pavyzdžiui, kad užpildytumėte CI kešą arba vėliau dirbtumėte neprisijungę).

> **`azd package`** sukuria diegtiną artefaktą (konteinerio atvaizdą arba zip) **neįkeldamas** jo į Azure. Naudokite atskirai, kad patikrintumėte, ar kūrimas pavyksta, peržiūrėtumėte išvestį arba sukurtumėte artefaktą, kurį vėliau diegs atskiras procesas. `azd deploy` automatiškai pakuoja, todėl `azd package` reikės tik tada, kai norite artefakto be diegimo.


## 🌍 Aplinkų valdymas

### Aplinkų operacijos
```bash
# Išvardinti visas aplinkas
azd env list

# Sukurti naują aplinką
azd env new development
azd env new staging --location westus2

# Pasirinkti aplinką
azd env select production

# Rodyti prieinamas aplinkas
azd env list

# Atnaujinti aplinkos būseną
azd env refresh
```

### Aplinkos kintamieji
```bash
# Nustatyti aplinkos kintamąjį
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Gauti aplinkos kintamąjį
azd env get API_KEY

# Išvardinti visus aplinkos kintamuosius
azd env get-values

# Pašalinti aplinkos kintamąjį
azd env unset DEBUG
```

## ⚙️ Konfigūracijos komandos

### Globali konfigūracija
```bash
# Išvardyti visas konfigūracijas
azd config show

# Nustatyti globalius numatytuosius parametrus
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Pašalinti konfigūraciją
azd config unset defaults.location

# Atstatyti visas konfigūracijas
azd config reset
```

### Projekto konfigūracija
```bash
# Patikrinti azure.yaml
azd config validate

# Rodyti projekto informaciją
azd show

# Gauti paslaugų galinius taškus
azd show --output json
```

## 📊 Stebėsena ir diagnostika

### Stebėjimo panelė
```bash
# Atidaryti Azure portalo stebėjimo prietaisų skydą
azd monitor

# Atidaryti Application Insights tiesiogines metrikas
azd monitor --live

# Atidaryti Application Insights žurnalų sritį
azd monitor --logs

# Atidaryti Application Insights apžvalgą
azd monitor --overview
```

### Konteinerių žurnalų peržiūra
```bash
# Peržiūrėti žurnalus per Azure CLI (Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Stebėti žurnalus realiuoju laiku
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Peržiūrėti žurnalus Azure portale
azd monitor --logs
```

### Log Analytics užklausos
```bash
# Prieiga prie Log Analytics per Azure portalą
azd monitor --logs

# Užklauskite žurnalus naudodami Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Techninės priežiūros komandos

### Valymas
```bash
# Pašalinti visus Azure išteklius
azd down

# Priverstinai ištrinti be patvirtinimo
azd down --force

# Galutinai pašalinti minkštai ištrintus išteklius
azd down --purge

# Užbaigti valymą
azd down --force --purge
```

### Atnaujinimai
```bash
# Patikrinti, ar yra azd atnaujinimų
azd version

# Gauti dabartinę versiją
azd version

# Peržiūrėti dabartinę konfigūraciją
azd config show
```

## 🔧 Pažangios komandos

### Pipeline ir CI/CD
```bash
# Konfigūruoti GitHub Actions
azd pipeline config

# Konfigūruoti Azure DevOps
azd pipeline config --provider azdo

# Rodyti vamzdyno konfigūraciją
azd pipeline show
```

### Infrastruktūros valdymas
```bash
# Generuoti infrastruktūros šablonus
azd infra generate

# 🧪 Infrastruktūros peržiūra ir planavimas
azd provision --preview
# Simuliuoja infrastruktūros diegimo procesą neįdiegant
# Analizuoja Bicep/Terraform šablonus ir rodo:
# - Resursai, kurie bus pridėti (žalia +)
# - Resursai, kurie bus pakeisti (geltona ~)
# - Resursai, kurie bus pašalinti (raudona -)
# Saugu vykdyti - į Azure aplinką nebus atlikti jokie tikri pakeitimai

# Sintezuoti infrastruktūrą iš azure.yaml
azd infra synth
```

### Projekto informacija
```bash
# Rodyti projekto būseną ir galinius taškus
azd show

# Rodyti išsamią projekto informaciją JSON formatu
azd show --output json

# Gauti paslaugos galinius taškus
azd show --output json | jq '.services'
```

## 🤖 AI ir plėtinių komandos

### AZD plėtiniai
```bash
# Išvardinti visas galimas plėtinius (įskaitant dirbtinį intelektą)
azd extension list

# Įdiegti Foundry agentų plėtinį
azd extension install azure.ai.agents

# Įdiegti agentų įgūdžių plėtinį (peržiūra)
azd extension install azure.ai.skills

# Įdiegti Foundry jungčių plėtinį (peržiūra)
azd extension install azure.ai.connections

# Įdiegti smulkaus derinimo plėtinį
azd extension install azure.ai.finetune

# Įdiegti pritaikytų modelių plėtinį
azd extension install azure.ai.models

# Atnaujinti visus įdiegtus plėtinius
azd extension upgrade --all
```

### AI agentų komandos
```bash
# Inicializuoti agento projektą iš manifesto
azd ai agent init -m <manifest-path-or-uri>

# Nurodyti konkretų Foundry projektą
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Nurodyti agento šaltinio katalogą
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pasirinkti talpinimo tikslą
azd ai agent init -m agent-manifest.yaml --host containerapp

# Išbandyti diegtą agentą (išveda vėlavimą ir laiką iki pirmojo baito (TTFB))
azd ai agent invoke

# Rodyti aktyvaus galinio taško konfigūraciją
azd ai agent endpoint show

# Sugeneruoti vertinimo duomenų rinkinį, tada optimizuoti agentą
azd ai agent eval generate
azd ai agent optimize

# Atsisiųsti diegtą kodo pagrindu talpinamo agento šaltinį
azd ai agent code download

# Ištrinti talpinamą agentą ir visas jo versijas (--force nutraukia aktyvias sesijas)
azd ai agent delete --force
```

### MCP serveris (Alpha)
```bash
# Paleiskite MCP serverį savo projektui
azd mcp start

# Valdykite įrankio sutikimą MCP operacijoms
azd copilot consent list
```

### Infrastruktūros generavimas
```bash
# Sugeneruoti IaC failus iš jūsų projekto apibrėžimo
azd infra generate

# Sintezuoti infrastruktūrą iš azure.yaml
azd infra synth
```

---

## 🎯 Greitos darbo eigos

### Kūrimo darbo eiga
```bash
# Pradėti naują projektą
azd init --template todo-nodejs-mongo
cd my-project

# Diegti į kūrimo aplinką
azd env new dev
azd up

# Atlikti pakeitimus ir iš naujo diegti
azd deploy

# Atidaryti stebėjimo prietaisų skydelį
azd monitor --live
```

### Kelių aplinkų darbo eiga
```bash
# Paruošti aplinkas
azd env new dev
azd env new staging  
azd env new production

# Diegti į kūrimo aplinką
azd env select dev
azd up

# Išbandyti ir perkelti į parengiamąją (staging) aplinką
azd env select staging
azd up

# Diegti į gamybinę aplinką
azd env select production
azd up
```

### Trikčių šalinimo darbo eiga
```bash
# Įjungti derinimo režimą
export AZD_DEBUG=true

# Patikrinti diegimo būseną
azd show

# Patikrinti konfigūraciją
azd config show

# Atidaryti stebėjimo prietaisų skydelį žurnalams
azd monitor --logs

# Patikrinti išteklių būseną
azd show --output json
```

## 🔍 Derinimo komandos

### Derinimo informacija
```bash
# Įjungti derinimo išvestį
export AZD_DEBUG=true
azd <command> --debug

# Išjungti telemetriją, kad išvestis būtų švaresnė
export AZD_DISABLE_TELEMETRY=true

# Patikrinti esamą konfigūraciją
azd config show

# Patikrinti autentifikacijos būseną
az account show
```

### Šablonų derinimas
```bash
# Išvardyti turimus šablonus su detalėmis
azd template list --output json

# Rodyti šablono informaciją
azd template show <template-name>

# Patikrinti šabloną prieš inicializavimą
azd template validate <template-name>
```

## 📁 Failų ir katalogų komandos

### Projekto struktūra
```bash
# Rodyti esamą katalogo struktūrą
tree /f  # Windows
find . -type f  # Linux/macOS

# Pereiti į azd projekto šaknį
cd $(azd root)

# Rodyti azd konfigūracijos katalogą
echo $AZD_CONFIG_DIR  # Paprastai ~/.azd
```

## 🎨 Išvesties formatavimas

### JSON išvestis
```bash
# Gauti JSON išvestį skriptavimui
azd show --output json
azd env list --output json
azd config show --output json

# Analizuoti su jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Lentelės išvestis
```bash
# Formatuoti kaip lentelę
azd env list --output table

# Peržiūrėti įdiegtas paslaugas
azd show --output json | jq '.services | keys'
```

## 🔧 Dažnai naudojamos komandų kombinacijos

### Sveikatos patikrinimo skriptas
```bash
#!/bin/bash
# Greita sveikatos patikra
azd show
azd env get-values
azd monitor --logs
```

### Diegimo patikra
```bash
#!/bin/bash
# Patikra prieš diegimą
azd show
azd provision --preview  # Peržiūrėkite pakeitimus prieš diegiant
az account show
```

### Aplinkų palyginimas
```bash
#!/bin/bash
# Palyginti aplinkas
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Išteklių šalinimo skriptas
```bash
#!/bin/bash
# Išvalyti senas aplinkas
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Aplinkos kintamieji

### Dažni aplinkos kintamieji
```bash
# Azure konfigūracija
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD konfigūracija
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Programos konfigūracija
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Avarinės komandos

### Greiti pataisymai
```bash
# Iš naujo nustatyti autentifikaciją
az account clear
az login

# Priverstinai atnaujinti aplinką
azd env refresh

# Perdiegti visas paslaugas
azd deploy

# Patikrinti diegimo būseną
azd show --output json
```

### Atkūrimo komandos
```bash
# Atkurti po nesėkmingo diegimo – išvalyti ir įdiegti iš naujo
azd down --force --purge
azd up

# Tik infrastruktūros paruošimas iš naujo
azd provision

# Tik programos diegimas iš naujo
azd deploy
```

## 💡 Naudingi patarimai

### Alias'ai greitesnei darbo eigai
```bash
# Pridėkite į savo .bashrc arba .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funkcijų trumpiniai
```bash
# Greitas aplinkos perjungimas
azd-env() {
    azd env select $1 && azd show
}

# Greitas diegimas su stebėsena
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Aplinkos būsena
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Pagalba ir dokumentacija

### Kaip gauti pagalbą
```bash
# Bendra pagalba
azd --help
azd help

# Komandos specifinė pagalba
azd up --help
azd env --help
azd config --help

# Rodyti versijos ir kūrimo informaciją
azd version
azd version --output json
```

### Nuorodos į dokumentaciją
```bash
# Atidaryti dokumentaciją naršyklėje
azd docs

# Rodyti šablono dokumentaciją
azd template show <template-name> --docs
```

---

**Patarimas**: Pažymėkite šią atmintinę žymėse ir naudokite `Ctrl+F`, kad greitai rastumėte reikiamas komandas!

---

**Navigacija**
- **Ankstesnis skyrius**: [Paruošiamieji patikrinimai](../docs/pre-deployment/preflight-checks.md)
- **Kitas skyrius**: [Sąvokynas](glossary.md)

---

> **💡 Ar norite pagalbos su Azure komandomis savo redaktoriuje?** Įdiekite [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) su `npx skills add microsoft/github-copilot-for-azure` — 37 įgūdžiai AI, Foundry, diegimui, diagnostikai ir kt.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->