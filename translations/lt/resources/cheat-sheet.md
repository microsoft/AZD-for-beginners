# Komandų atmintinė - Pagrindinės AZD komandos

**Greita nuoroda visiems skyriams**
- **📚 Kurso puslapis**: [AZD pradedantiesiems](../README.md)
- **📖 Greita pradžia**: [1 skyrius: Pagrindai ir greita pradžia](../README.md#-chapter-1-foundation--quick-start)
- **🤖 DI komandos**: [2 skyrius: DI pirmasis vystymas](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pažengusiems**: [4 skyrius: Infrastruktūra kaip kodas](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Įvadas

Ši išsami atmintinė suteikia greitą nuorodą dažniausiai naudojamoms Azure Developer CLI (azd) komandoms, suskirstytoms pagal kategorijas su praktiniais pavyzdžiais. Puikiai tinka greitai surasti komandas kūrimo metu, sprendžiant problemas ir kasdienei darbinei veiklai su azd projektais.

## Mokymosi tikslai

Naudodami šią atmintinę, jūs:
- Turėsite greitą prieigą prie svarbiausių Azure Developer CLI komandų ir sintaksės
- Suprasite komandų organizavimą pagal funkcines kategorijas ir naudojimo atvejus
- Galėsite remtis praktiniais pavyzdžiais dažniems kūrimo ir diegimo scenarijams
- Turėsite prieigą prie trikčių šalinimo komandų greitam problemų sprendimui
- Efektyviai rasite išplėstines konfigūracijos ir pritaikymo parinktis
- Rasite aplinkų valdymo ir kelių aplinkų darbo eigos komandas

## Mokymosi rezultatai

Reguliariai naudojant šią atmintinę, jūs galėsite:
- Užtikrintai vykdyti azd komandas neperžiūrint visos dokumentacijos
- Greitai spręsti dažnas problemas naudojant tinkamas diagnostines komandas
- Efektyviai valdyti kelias aplinkas ir diegimo scenarijus
- Prireikus taikyti išplėstines azd funkcijas ir konfigūracijos parinktis
- Trikčių šalinimas diegiant naudojant sistemingas komandų sekas
- Optimizuoti darbo eigą efektyviai naudojant azd trumpinius ir parinktis

## Pradinės komandos

### Autentifikacija
```bash
# Prisijungti prie Azure per AZD
azd auth login

# Prisijungti prie Azure CLI (AZD tai naudoja fone)
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

### Pilna diegimo eiga
```bash
# Diegti viską (resursų paruošimas + diegimas)
azd up

# Diegti išjungus patvirtinimo raginimus
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
# Rodo 'dry-run' vaizdą, kokie ištekliai būtų sukurti, pakeisti arba ištrinti
# Panašu į 'terraform plan' arba 'bicep what-if' — saugu vykdyti, pakeitimai nebus atlikti
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
# Kurti programas
azd package

# Kurti konkrečią paslaugą
azd package --service api
```

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

# Išvardinti visus aplinkos kintamuosius
azd env get-values

# Pašalinti aplinkos kintamąjį
azd env unset DEBUG
```

## ⚙️ Konfigūracijos komandos

### Globali konfigūracija
```bash
# Išvardinti visas konfigūracijas
azd config list

# Nustatyti globalias numatytąsias reikšmes
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

### Stebėjimo skydelis
```bash
# Atidaryti Azure portalo stebėjimo prietaisų skydelį
azd monitor

# Atidaryti Application Insights gyvų metrikų rodinį
azd monitor --live

# Atidaryti Application Insights žurnalų skydelį
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

### Žurnalų analizės užklausos
```bash
# Prieiga prie Log Analytics per Azure portalą
azd monitor --logs

# Vykdykite žurnalų užklausas naudodami Azure CLI
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

# Išvalyti minkštai ištrintus išteklius
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

## 🔧 Išplėstinės komandos

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
# Simuliuoja infrastruktūros paruošimą neįdiegiant
# Analizuoja Bicep/Terraform šablonus ir rodo:
# - Ištekliai, kurie bus pridėti (žalia +)
# - Ištekliai, kurie bus pakeisti (geltona ~)
# - Ištekliai, kurie bus ištrinti (raudona -)
# Saugus vykdyti - Azure aplinkoje nebus atliekami jokie faktiniai pakeitimai

# Sintezuoti infrastruktūrą iš azure.yaml
azd infra synth
```

### Projekto informacija
```bash
# Rodyti projekto būseną ir galinius taškus
azd show

# Rodyti detalią projekto informaciją JSON formatu
azd show --output json

# Gauti paslaugos galinius taškus
azd show --output json | jq '.services'
```

## 🎯 Greitos darbo eigos

### Kūrimo darbo eiga
```bash
# Pradėti naują projektą
azd init --template todo-nodejs-mongo
cd my-project

# Diegti į kūrimo aplinką
azd env new dev
azd up

# Atlikite pakeitimus ir iš naujo įdiekite
azd deploy

# Atidaryti stebėjimo skydelį
azd monitor --live
```

### Kelių aplinkų darbo eiga
```bash
# Nustatyti aplinkas
azd env new dev
azd env new staging  
azd env new production

# Diegti į dev
azd env select dev
azd up

# Išbandyti ir perkelti į staging
azd env select staging
azd up

# Diegti į gamybą
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
azd config list

# Patikrinti autentifikacijos būseną
az account show
```

### Šablonų derinimas
```bash
# Išvardinti prieinamus šablonus su detalėmis
azd template list --output json

# Rodyti šablono informaciją
azd template show <template-name>

# Patikrinti šabloną prieš inicijavimą
azd template validate <template-name>
```

## 📁 Failų ir katalogų komandos

### Projekto struktūra
```bash
# Rodyti dabartinę katalogų struktūrą
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
azd config list --output json

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

## 🔧 Dažnai naudojamų komandų deriniai

### Būklės tikrinimo skriptas
```bash
#!/bin/bash
# Greita sveikatos patikra
azd show
azd env show
azd monitor --logs
```

### Diegimo patikrinimas
```bash
#!/bin/bash
# Patikrinimas prieš diegimą
azd show
azd provision --preview  # Peržiūrėkite pakeitimus prieš diegiant
az account show
```

### Aplinkų palyginimas
```bash
#!/bin/bash
# Palyginkite aplinkas
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

### Greiti taisymai
```bash
# Atstatyti autentifikavimą
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
# Atkurti nepavykusį diegimą - išvalyti ir iš naujo įdiegti
azd down --force --purge
azd up

# Tik iš naujo paruošti infrastruktūrą
azd provision

# Tik iš naujo įdiegti programą
azd deploy
```

## 💡 Naudingi patarimai

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

# Greitas diegimas su stebėjimu
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

# Komandai skirta pagalba
azd up --help
azd env --help
azd config --help

# Rodyti versijos ir kompiliacijos informaciją
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

**Patarimas**: Pridėkite šią atmintinę į žymes ir naudokite `Ctrl+F`, kad greitai rastumėte reikiamas komandas!

---

**Naršymas**
- **Ankstesnė pamoka**: [Priešdiegimo patikrinimai](../docs/pre-deployment/preflight-checks.md)
- **Kita pamoka**: [Žodynas](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojamas profesionalus žmogaus vertimas. Neprisiimame atsakomybės už bet kokius nesusipratimus ar neteisingą aiškinimą, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->