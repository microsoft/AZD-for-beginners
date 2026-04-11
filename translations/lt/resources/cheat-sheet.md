# Komandų atmintinė - Pagrindinės AZD komandos

**Greita nuoroda visiems skyriams**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Greitas pradėjimas**: [1 skyrius: Pagrindai ir greitas pradėjimas](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI komandos**: [2 skyrius: AI-pirmasis vystymas](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pažengę**: [4 skyrius: Infrastruktūra kaip kodas](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Įvadas

Ši išsami atmintinė pateikia greitą nuorodą dažniausiai naudojamoms Azure Developer CLI komandoms, suskirstytoms pagal kategorijas su praktiniais pavyzdžiais. Puikiai tinka greitai susirasti komandas kūrimo, trikčių šalinimo ir kasdienės veiklos su azd projektais metu.

## Mokymosi tikslai

Naudodami šią atmintinę, jūs:
- Turėsite greitą prieigą prie esminių Azure Developer CLI komandų ir sintaksės
- Suprasite komandų organizaciją pagal funkcines kategorijas ir naudojimo scenarijus
- Gausite praktinių pavyzdžių įprastoms kūrimo ir diegimo situacijoms
- Turėsite prieigą prie trikčių šalinimo komandų greitam problemų sprendimui
- Efektyviai rasite išplėstines konfigūracijos ir pritaikymo parinktis
- Rasite komandų aplinkų valdymui ir kelių aplinkų darbo eigai

## Mokymosi rezultatai

Reguliariai naudodami šią atmintinę, galėsite:
- Užtikrintai vykdyti azd komandas nebesikreipiant į pilną dokumentaciją
- Greitai išspręsti įprastas problemas naudojant tinkamas diagnostikos komandas
- Efektyviai valdyti kelias aplinkas ir diegimo scenarijus
- Taikyti pažangias azd funkcijas ir konfigūracijos parinktis pagal poreikį
- Trikčių šalinimas diegimo metu naudojant sistemingą komandų seką
- Optimizuoti darbo eigą efektyviai naudojant azd santrumpas ir parinktis

## Pradžios komandos

### Autentifikacija
```bash
# Prisijungti prie Azure naudojant AZD
azd auth login

# Prisijungti prie Azure CLI (AZD tai naudoja užkulisiuose)
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
# Naršyti turimus šablonus
azd template list

# Inicializuoti iš šablono
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializuoti dabartiniame kataloge
azd init .

# Inicializuoti su pasirinktiniu pavadinimu
azd init --template todo-nodejs-mongo my-awesome-app
```

## Pagrindinės diegimo komandos

### Pilna diegimo darbo eiga
```bash
# Diegti viską (paruošimas + diegimas)
azd up

# Diegti su išjungtais patvirtinimo raginimais
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

# 🧪 Infrastruktūros pakeitimų peržiūra
azd provision --preview
# Rodo bandomąją peržiūrą, kokie ištekliai būtų sukurti/modifikuoti/ištrinti
# Panašu į 'terraform plan' arba 'bicep what-if' - saugu vykdyti, jokie pakeitimai nebus taikomi
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

### Kūrimas ir paketavimas
```bash
# Sukurti programas
azd package

# Sukurti konkrečią paslaugą
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

# Išvardyti visus aplinkos kintamuosius
azd env get-values

# Pašalinti aplinkos kintamąjį
azd env unset DEBUG
```

## ⚙️ Konfigūracijos komandos

### Globali konfigūracija
```bash
# Išvardinti visą konfigūraciją
azd config show

# Nustatyti globalius numatytuosius nustatymus
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Pašalinti konfigūraciją
azd config unset defaults.location

# Atstatyti visą konfigūraciją
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

### Stebėjimo panelė
```bash
# Atidarykite Azure portalo stebėjimo skydelį
azd monitor

# Atidarykite Application Insights gyvus rodiklius
azd monitor --live

# Atidarykite Application Insights žurnalų skydelį
azd monitor --logs

# Atidarykite Application Insights apžvalgą
azd monitor --overview
```

### Konteinerių žurnalų peržiūra
```bash
# Peržiūrėti žurnalus per Azure CLI (Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Stebėti žurnalus realiu laiku
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Peržiūrėti žurnalus Azure portale
azd monitor --logs
```

### Log Analytics užklausos
```bash
# Prieiga prie Log Analytics per Azure portalą
azd monitor --logs

# Užklauskite žurnalų naudodami Azure CLI
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
# Patikrinti ar yra azd atnaujinimų
azd version

# Gauti dabartinę versiją
azd version

# Peržiūrėti esamą konfigūraciją
azd config show
```

## 🔧 Pažangios komandos

### Pipelinai ir CI/CD
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
# - Resursai, kurie bus pridėti (žalias +)
# - Resursai, kurie bus pakeisti (geltonas ~)
# - Resursai, kurie bus ištrinti (raudonas -)
# Saugus vykdyti - Azure aplinkoje nebus atliekami jokie realūs pakeitimai

# Sintezuoti infrastruktūrą iš azure.yaml
azd infra synth
```

### Projekto informacija
```bash
# Rodyti projekto būseną ir galutinius taškus
azd show

# Rodyti išsamią projekto informaciją JSON formatu
azd show --output json

# Gauti paslaugų galutinius taškus
azd show --output json | jq '.services'
```

## 🤖 AI ir plėtinių komandos

### AZD plėtiniai
```bash
# Išvardinkite visus prieinamus plėtinius (įskaitant DI)
azd extension list

# Įdiekite Foundry agentų plėtinį
azd extension install azure.ai.agents

# Įdiekite smulkiojo derinimo plėtinį
azd extension install azure.ai.finetune

# Įdiekite pasirinktinių modelių plėtinį
azd extension install azure.ai.models

# Atnaujinkite visus įdiegtus plėtinius
azd extension upgrade --all
```

### AI agentų komandos
```bash
# Inicializuoti agento projektą pagal manifestą
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

# Valdykite įrankių sutikimą MCP operacijoms
azd copilot consent list
```

### Infrastruktūros generavimas
```bash
# Generuoti IaC failus iš jūsų projekto apibrėžimo
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

# Diegti į vystymo aplinką
azd env new dev
azd up

# Atlikti pakeitimus ir diegti iš naujo
azd deploy

# Atidaryti stebėjimo prietaisų skydelį
azd monitor --live
```

### Kelių aplinkų darbo eiga
```bash
# Sukonfigūruoti aplinkas
azd env new dev
azd env new staging  
azd env new production

# Diegti į vystymo aplinką
azd env select dev
azd up

# Testuoti ir perkelti į tarpinę (staging) aplinką
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

# Atidaryti stebėjimo skydelį žurnalams
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
azd config show

# Patikrinti autentifikacijos būseną
az account show
```

### Šablonų derinimas
```bash
# Išvardinti prieinamus šablonus su detalėmis
azd template list --output json

# Rodyti šablono informaciją
azd template show <template-name>

# Patikrinti šabloną prieš inicializavimą
azd template validate <template-name>
```

## 📁 Failų ir katalogų komandos

### Projekto struktūra
```bash
# Rodyti esamą katalogų struktūrą
tree /f  # Windows
find . -type f  # Linux/macOS

# Eikite į azd projekto šaknį
cd $(azd root)

# Rodyti azd konfigūracijos katalogą
echo $AZD_CONFIG_DIR  # Paprastai ~/.azd
```

## 🎨 Išvesties formatavimas

### JSON išvestis
```bash
# Gauk JSON išvestį skriptavimui
azd show --output json
azd env list --output json
azd config show --output json

# Analizuok su jq
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

## 🔧 Bendri komandų deriniai

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

### Resursų valymo skriptas
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

### Dažniausi aplinkos kintamieji
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

## 🚨 Skubios komandos

### Greiti pataisymai
```bash
# Atstatyti autentifikaciją
az account clear
az login

# Priverstinai atnaujinti aplinką
azd env refresh

# Iš naujo diegti visas paslaugas
azd deploy

# Patikrinti diegimo būseną
azd show --output json
```

### Atsigavimo komandos
```bash
# Atkurti po nepavykusio diegimo - išvalyti ir perdiegti
azd down --force --purge
azd up

# Tik pakartotinai paruošti infrastruktūrą
azd provision

# Tik perdiegti programą
azd deploy
```

## 💡 Pro patarimai

### Santrumpos greitesnei darbo eigai
```bash
# Pridėkite prie savo .bashrc arba .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funkcijų nuorodos
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
# Bendroji pagalba
azd --help
azd help

# Konkrečios komandos pagalba
azd up --help
azd env --help
azd config --help

# Rodyti versijos ir kompiliacijos informaciją
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

**Patarimas**: Pažymėkite šią atmintinę ir naudokite `Ctrl+F`, kad greitai rastumėte reikiamas komandas!

---

**Naršymas**
- **Ankstesnė pamoka**: [Parengiamieji patikrinimai](../docs/pre-deployment/preflight-checks.md)
- **Kita pamoka**: [Žodynas](glossary.md)

---

> **💡 Norite Azure komandų pagalbos savo redaktoriuje?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — 37 įgūdžiai AI, Foundry, diegimui, diagnostikai ir dar daugiau.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->