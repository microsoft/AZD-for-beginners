# Komandų suvestinė - Pagrindinės AZD komandos

**Greitos nuorodos visiems skyriams**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Greitas startas**: [1 skyrius: Pagrindai ir greitas startas](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI komandos**: [2 skyrius: AI-pirmasis vystymas](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pažengusiems**: [4 skyrius: Infrastruktūra kaip kodas](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Įvadas

Ši išsami suvestinė suteikia greitą nuorodą dažniausiai naudojamoms Azure Developer CLI komandoms, suskirstytoms pagal kategorijas su praktiniais pavyzdžiais. Puikiai tinka greitam komandų paieškai kūrimo, trikčių šalinimo ir kasdienių operacijų su azd projektais metu.

## Mokymosi tikslai

Naudodami šią suvestinę, jūs:
- Turėsite greitą prieigą prie pagrindinių Azure Developer CLI komandų ir sintaksės
- Suprasite komandų organizavimą pagal funkcines kategorijas ir naudojimo atvejus
- Naudosite praktinius pavyzdžius dažniems kūrimo ir diegimo scenarijams
- Turėsite prieigą prie trikčių šalinimo komandų greitam problemų sprendimui
- Efektyviai rasite pažangias konfigūracijos ir pritaikymo parinktis
- Surasite aplinkų valdymo ir daugiaaplinkių darbo eigos komandas

## Mokymosi rezultatai

Reguliariai naudodamiesi šia suvestine, jūs galėsite:
- Vykdyti azd komandas užtikrintai be būtinybės nuolat tikrinti visą dokumentaciją
- Greitai išspręsti dažnas problemas naudojant tinkamas diagnostines komandas
- Efektyviai valdyti kelias aplinkas ir diegimo scenarijus
- Taikyti pažangias azd funkcijas ir konfigūracijos parinktis pagal poreikį
- Trikčių šalinimą diegimo problemoms spręsti naudojant sistemingas komandų sekas
- Optimizuoti darbo eigas efektyviai naudojant azd trumpinius ir parinktis

## Pradžios komandos

### Autentifikacija
```bash
# Prisijungti prie Azure per AZD
azd auth login

# Prisijungti prie Azure CLI (AZD tai naudoja po gaubtu)
az login

# Patikrinti dabartinę paskyrą
az account show

# Nustatyti numatytąją prenumeratą
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Atsijungti iš AZD
azd auth logout

# Atsijungti iš Azure CLI
az logout
```

### Projekto inicijavimas
```bash
# Peržiūrėti prieinamus šablonus
azd template list

# Inicializuoti iš šablono
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializuoti dabartiniame aplanke
azd init .

# Inicializuoti su pasirinktu pavadinimu
azd init --template todo-nodejs-mongo my-awesome-app
```

## Pagrindinės diegimo komandos

### Pilna diegimo darbo eiga
```bash
# Įdiegti viską (paruošimas + diegimas)
azd up

# Diegti be patvirtinimo užklausų
azd up --confirm-with-no-prompt

# Diegti į konkrečią aplinką
azd up --environment production

# Diegti su pasirinktiniais parametrais
azd up --parameter location=westus2
```

### Tik infrastruktūra
```bash
# Paruošti Azure išteklius
azd provision

# 🧪 Peržiūrėti infrastruktūros pakeitimus
azd provision --preview
# Rodo bandomąją peržiūrą, kokie ištekliai būtų sukurti/pakeisti/ištrinti
# Panašu į 'terraform plan' arba 'bicep what-if' - saugu paleisti, jokie pakeitimai nebus pritaikyti.
```

### Tik programa
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
# Kurti programas
azd package

# Kurti konkrečią paslaugą
azd package --service api
```

## 🌍 Aplinkų valdymas

### Aplinkos operacijos
```bash
# Išvardinti visas aplinkas
azd env list

# Sukurti naują aplinką
azd env new development
azd env new staging --location westus2

# Pasirinkti aplinką
azd env select production

# Rodyti dabartinę aplinką
azd env show

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

# Išvardyti visus aplinkos kintamuosius
azd env get-values

# Pašalinti aplinkos kintamąjį
azd env unset DEBUG
```

## ⚙️ Konfigūracijos komandos

### Globali konfigūracija
```bash
# Išvardinti visas konfigūracijas
azd config list

# Nustatyti globalius numatytuosius nustatymus
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

## 📊 Stebėjimas ir diagnostika

### Stebėjimo prietaisų skydelis
```bash
# Atidaryti Azure portalo stebėjimo skydelį
azd monitor

# Atidaryti Application Insights tiesioginius rodiklius
azd monitor --live

# Atidaryti Application Insights žurnalų skydelį
azd monitor --logs

# Atidaryti Application Insights apžvalgą
azd monitor --overview
```

### Konteinerių žurnalų peržiūra
```bash
# Peržiūrėti žurnalus naudojant Azure CLI (Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Stebėti žurnalus realiu laiku
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Peržiūrėti žurnalus Azure portale
azd monitor --logs
```

### Žurnalų analizės užklausos
```bash
# Prieiga prie Log Analytics per Azure portalą
azd monitor --logs

# Vykdykite užklausas žurnaluose naudodami Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Priežiūros komandos

### Išvalymas
```bash
# Pašalinti visus Azure išteklius
azd down

# Priverstinai ištrinti be patvirtinimo
azd down --force

# Galutinai pašalinti minkštai ištrintus išteklius
azd down --purge

# Pilnas valymas
azd down --force --purge
```

### Atnaujinimai
```bash
# Patikrinti, ar yra azd atnaujinimų
azd version

# Gauti dabartinę versiją
azd version

# Peržiūrėti dabartinę konfigūraciją
azd config list
```

## 🔧 Pažangios komandos

### Pipeline ir CI/CD
```bash
# Konfigūruoti GitHub Actions
azd pipeline config

# Konfigūruoti Azure DevOps
azd pipeline config --provider azdo

# Rodyti pipeline konfigūraciją
azd pipeline show
```

### Infrastruktūros valdymas
```bash
# Generuoti infrastruktūros šablonus
azd infra generate

# 🧪 Infrastruktūros peržiūra ir planavimas
azd provision --preview
# Simuliuoja infrastruktūros paruošimą be diegimo
# Analizuoja Bicep/Terraform šablonus ir rodo:
# - Resursai, kurie bus pridėti (žalia +)
# - Resursai, kurie bus pakeisti (geltona ~)
# - Resursai, kurie bus ištrinti (raudona -)
# Saugus vykdyti - Azure aplinkoje nebus atlikti jokie faktiniai pakeitimai

# Sintezuoti infrastruktūrą iš azure.yaml
azd infra synth
```

### Informacija apie projektą
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
# Išvardykite visus prieinamus plėtinius (įskaitant DI)
azd extension list

# Įdiekite Foundry agents plėtinį
azd extension install azure.ai.agents

# Įdiekite fine-tuning plėtinį
azd extension install azure.ai.finetune

# Įdiekite custom models plėtinį
azd extension install azure.ai.models

# Atnaujinkite visus įdiegtus plėtinius
azd extension upgrade --all
```

### AI agentų komandos
```bash
# Inicializuoti agento projektą iš manifesto
azd ai agent init -m <manifest-path-or-uri>

# Nustatyti konkretų Foundry projektą
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Nurodyti agento šaltinio katalogą
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pasirinkti talpinimo tikslą
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP serveris (Alpha)
```bash
# Paleiskite MCP serverį savo projektui
azd mcp start

# Valdykite įrankio sutikimą MCP operacijoms
azd mcp consent
```

### Infrastruktūros generavimas
```bash
# Generuoti IaC failus iš jūsų projekto apibrėžimo
azd infra generate

# Sugeneruoti infrastruktūrą iš azure.yaml
azd infra synth
```

---

## 🎯 Greitos darbo eigos

### Kūrimo darbo eiga
```bash
# Pradėti naują projektą
azd init --template todo-nodejs-mongo
cd my-project

# Diegti į vystymo aplinką
azd env new dev
azd up

# Atlikti pakeitimus ir įdiegti iš naujo
azd deploy

# Atidaryti stebėjimo prietaisų skydelį
azd monitor --live
```

### Daugiaaplinkė darbo eiga
```bash
# Paruošti aplinkas
azd env new dev
azd env new staging  
azd env new production

# Diegti į kūrimo aplinką
azd env select dev
azd up

# Testuoti ir perkelti į tarpinę aplinką
azd env select staging
azd up

# Diegti į gamybos aplinką
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
azd config list

# Atidaryti stebėjimo skydelį, skirtą žurnalams
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

# Patikrinti dabartinę konfigūraciją
azd config list

# Patikrinti autentifikacijos būseną
az account show
```

### Šablonų derinimas
```bash
# Išvardinti prieinamus šablonus su išsamia informacija
azd template list --output json

# Rodyti šablono informaciją
azd template show <template-name>

# Patikrinti šabloną prieš inicializavimą
azd template validate <template-name>
```

## 📁 Failų ir katalogų komandos

### Projekto struktūra
```bash
# Rodyti dabartinę katalogo struktūrą
tree /f  # Windows
find . -type f  # Linux/macOS

# Nukeliauti į azd projekto šaknį
cd $(azd root)

# Rodyti azd konfigūracijos katalogą
echo $AZD_CONFIG_DIR  # Dažniausiai ~/.azd
```

## 🎨 Išvesties formatavimas

### JSON išvestis
```bash
# Gauti JSON išvestį skriptavimui
azd show --output json
azd env list --output json
azd config list --output json

# Analizuoti su jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Lentelės išvestis
```bash
# Rodyti kaip lentelę
azd env list --output table

# Peržiūrėti įdiegtas paslaugas
azd show --output json | jq '.services | keys'
```

## 🔧 Dažniausiai naudojamos komandų kombinacijos

### Sveikatos patikrinimo skriptas
```bash
#!/bin/bash
# Greita būklės patikra
azd show
azd env show
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

### Išteklių išvalymo skriptas
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

### Greiti sprendimai
```bash
# Atstatyti autentifikaciją
az account clear
az login

# Priversti atnaujinti aplinką
azd env refresh

# Perdiegti visas paslaugas
azd deploy

# Patikrinti diegimo būseną
azd show --output json
```

### Atkūrimo komandos
```bash
# Atstatyti po nepavykusio diegimo – išvalyti ir perdiegti
azd down --force --purge
azd up

# Tik infrastruktūros perkūrimas
azd provision

# Tik programos perdiegimas
azd deploy
```

## 💡 Pro patarimai

### Santrumpos greitesnei darbo eigai
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
    azd env show
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

# Pagalba konkrečiai komandai
azd up --help
azd env --help
azd config --help

# Rodyti informaciją apie versiją ir sudarymą
azd version
azd version --output json
```

### Dokumentacijos nuorodos
```bash
# Atidaryti dokumentaciją naršyklėje
azd docs

# Rodyti šablono dokumentaciją
azd template show <template-name> --docs
```

---

**Patarimas**: Įsidėkite šią suvestinę į žymes ir naudokite `Ctrl+F`, kad greitai rastumėte reikiamas komandas!

---

**Navigacija**
- **Ankstesnė pamoka**: [Preflight patikros](../docs/pre-deployment/preflight-checks.md)
- **Kita pamoka**: [Žodynas](glossary.md)

---

> **💡 Norite Azure komandų pagalbos savo redaktoriuje?** Įdiekite [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) naudodami `npx skills add microsoft/github-copilot-for-azure` — 37 įgūdžiai AI, Foundry, diegimui, diagnostikai ir dar daugiau.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas pasitelkus dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus, žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar klaidingus aiškinimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->