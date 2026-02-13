# Muhtasari wa Amri - Amri Muhimu za AZD

**Rejeo ya Haraka kwa Sura Zote**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../README.md)
- **📖 Mwanzoni Haraka**: [Sura 1: Misingi & Mwanzoni Haraka](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Amri za AI**: [Sura 2: Maendeleo ya Kwanza ya AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Kiwango cha Juu**: [Sura 4: Miundombinu kama Msimbo](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Utangulizi

Muhtasari huu kamili unatoa rejea ya haraka kwa amri zinazotumika sana za Azure Developer CLI, zimepangwa kwa makundi pamoja na mifano ya vitendo. Inafaa kwa kutafuta haraka wakati wa maendeleo, utatuzi wa matatizo, na shughuli za kila siku na miradi ya azd.

## Malengo ya Kujifunza

Kwa kutumia muhtasari huu, utakuwa:
- Na upatikanaji wa papo kwa papo wa amri muhimu za Azure Developer CLI na sintaksia
- Kuuelewa muundo wa amri kulingana na makundi ya kazi na matumizi
- Kupata mifano ya vitendo kwa hali za kawaida za maendeleo na uenezaji
- Kupata amri za utatuzi wa matatizo kwa utatuzi wa haraka wa masuala
- Kupata chaguzi za usanidi wa juu na urekebishaji kwa ufanisi
- Kupata amri za usimamizi wa mazingira na mtiririko wa kazi wa mazingira mengi

## Matokeo ya Kujifunza

Kwa kurejea mara kwa mara muhtasari huu, utaweza:
- Kutekeleza amri za azd kwa kujiamini bila kurejea nyaraka kamili
- Kutatua haraka matatizo ya kawaida kwa kutumia amri za uchunguzi zinazofaa
- Kusimamia kwa ufanisi mazingira mengi na hali za uenezaji
- Kutumia vipengele vya juu vya azd na chaguzi za usanidi inapohitajika
- Kutatua matatizo ya uenezaji kwa kutumia mfululizo wa amri wa kimfumo
- Kuboresha mtiririko wa kazi kupitia matumizi madhubuti ya njia za mkato na chaguzi za azd

## Amri za Kuanzia

### Uthibitishaji
```bash
# Ingia kwenye Azure kupitia AZD
azd auth login

# Ingia kwenye Azure CLI (AZD inaitumia hii chini ya kifuniko)
az login

# Angalia akaunti ya sasa
az account show

# Weka usajili wa chaguo-msingi
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Toka kutoka AZD
azd auth logout

# Toka kutoka Azure CLI
az logout
```

### Uanzishaji wa Mradi
```bash
# Tazama violezo vinavyopatikana
azd template list

# Anzisha kutoka kiolezo
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Anzisha katika saraka ya sasa
azd init .

# Anzisha kwa jina maalum
azd init --template todo-nodejs-mongo my-awesome-app
```

## Amri Msingi za Uenezaji

### Mtiririko Kamili wa Uenezaji
```bash
# Weka kila kitu (kuandaa rasilimali + kupeleka programu)
azd up

# Weka bila maombi ya uthibitisho
azd up --confirm-with-no-prompt

# Weka kwa mazingira maalum
azd up --environment production

# Weka kwa vigezo vilivyobinafsishwa
azd up --parameter location=westus2
```

### Miundombinu Pekee
```bash
# Sanidi rasilimali za Azure
azd provision

# 🧪 Hakiki mabadiliko ya miundombinu
azd provision --preview
# Inaonyesha mtazamo wa jaribio (dry-run) wa rasilimali zitakazoundwa/zitakazobadilishwa/zitakazofutwa
# Sawa na 'terraform plan' au 'bicep what-if' - salama kuendesha, hakuna mabadiliko yatakayotekelezwa
```

### Programu Pekee
```bash
# Peleka msimbo wa programu
azd deploy

# Peleka huduma maalum
azd deploy --service web
azd deploy --service api

# Peleka huduma zote
azd deploy --all
```

### Kujenga na Kufunga
```bash
# Jenga programu
azd package

# Jenga huduma maalum
azd package --service api
```

## 🌍 Usimamizi wa Mazingira

### Operesheni za Mazingira
```bash
# Orodhesha mazingira yote
azd env list

# Unda mazingira mapya
azd env new development
azd env new staging --location westus2

# Chagua mazingira
azd env select production

# Onyesha mazingira ya sasa
azd env show

# Sasisha hali ya mazingira
azd env refresh
```

### Vigezo vya Mazingira
```bash
# Weka kigezo cha mazingira
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Pata kigezo cha mazingira
azd env get API_KEY

# Orodhesha vigezo vyote vya mazingira
azd env get-values

# Ondoa kigezo cha mazingira
azd env unset DEBUG
```

## ⚙️ Amri za Usanidi

### Usanidi wa Kimataifa
```bash
# Orodhesha usanidi wote
azd config list

# Weka chaguo-msingi za kimataifa
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Ondoa usanidi
azd config unset defaults.location

# Weka upya usanidi wote
azd config reset
```

### Usanidi wa Mradi
```bash
# Thibitisha azure.yaml
azd config validate

# Onyesha taarifa za mradi
azd show

# Pata endpoints za huduma
azd show --output json
```

## 📊 Ufuatiliaji na Utambuzi wa Matatizo

### Dashibodi ya Ufuatiliaji
```bash
# Fundua dashibodi ya ufuatiliaji ya portal ya Azure
azd monitor

# Fundua vipimo vya wakati halisi vya Application Insights
azd monitor --live

# Fundua blade ya kumbukumbu za Application Insights
azd monitor --logs

# Fundua muhtasari wa Application Insights
azd monitor --overview
```

### Kuangalia Kumbukumbu za Kontena
```bash
# Tazama kumbukumbu za matukio kupitia Azure CLI (kwa Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Fuata kumbukumbu za matukio kwa wakati halisi
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Tazama kumbukumbu kutoka Azure Portal
azd monitor --logs
```

### Maswali ya Uchambuzi wa Kumbukumbu
```bash
# Fikia Log Analytics kupitia Portal ya Azure
azd monitor --logs

# Fanya maswali kwenye logi kwa kutumia Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Amri za Matengenezo

### Usafishaji
```bash
# Ondoa rasilimali zote za Azure
azd down

# Futa kwa nguvu bila uthibitisho
azd down --force

# Futa kabisa rasilimali zilizofutwa kwa muda
azd down --purge

# Usafishaji kamili
azd down --force --purge
```

### Sasisho
```bash
# Angalia sasisho za azd
azd version

# Pata toleo la sasa
azd version

# Tazama usanidi wa sasa
azd config list
```

## 🔧 Amri za Juu

### Pipeline na CI/CD
```bash
# Sanidi GitHub Actions
azd pipeline config

# Sanidi Azure DevOps
azd pipeline config --provider azdo

# Onyesha usanidi wa pipeline
azd pipeline show
```

### Usimamizi wa Miundombinu
```bash
# Tengeneza templeti za miundombinu
azd infra generate

# 🧪 Mapitio na Mipango ya Miundombinu
azd provision --preview
# Inaiga utoaji wa miundombinu bila kuitekeleza
# Inachambua templeti za Bicep/Terraform na kuonyesha:
# - Rasilimali zitakazoongezwa (kijani +)
# - Rasilimali zitakazobadilishwa (manjano ~)
# - Rasilimali zitakazofutwa (nyekundu -)
# Salama kuendesha - hakuna mabadiliko ya kweli yanayofanywa kwenye mazingira ya Azure

# Unda miundombinu kutoka azure.yaml
azd infra synth
```

### Taarifa za Mradi
```bash
# Onyesha hali ya mradi na vituo vya huduma
azd show

# Onyesha taarifa za mradi kwa undani kama JSON
azd show --output json

# Pata vituo vya huduma
azd show --output json | jq '.services'
```

## 🎯 Mtiririko wa Haraka

### Mtiririko wa Maendeleo
```bash
# Anzisha mradi mpya
azd init --template todo-nodejs-mongo
cd my-project

# Sambaza kwenye mazingira ya maendeleo
azd env new dev
azd up

# Fanya mabadiliko na usambaze tena
azd deploy

# Fungua dashibodi ya ufuatiliaji
azd monitor --live
```

### Mtiririko wa Mazingira Nyingi
```bash
# Sanidi mazingira
azd env new dev
azd env new staging  
azd env new production

# Sambaza kwenye mazingira ya maendeleo
azd env select dev
azd up

# Jaribu na kuhamisha kwenye staging
azd env select staging
azd up

# Sambaza kwenye uzalishaji
azd env select production
azd up
```

### Mtiririko wa Utatuzi wa Matatizo
```bash
# Washa modi ya uchambuzi wa hitilafu
export AZD_DEBUG=true

# Angalia hali ya utekelezaji
azd show

# Thibitisha usanidi
azd config list

# Fungua dashibodi ya ufuatiliaji kwa ajili ya rejista za shughuli
azd monitor --logs

# Angalia hali ya rasilimali
azd show --output json
```

## 🔍 Amri za Urekebishaji

### Taarifa za Urekebishaji
```bash
# Washa taarifa za debug
export AZD_DEBUG=true
azd <command> --debug

# Zima telemetri ili pato liwe safi zaidi
export AZD_DISABLE_TELEMETRY=true

# Angalia usanidi wa sasa
azd config list

# Angalia hali ya uthibitisho
az account show
```

### Urekebishaji wa Violezo
```bash
# Orodhesha templeti zinazopatikana pamoja na maelezo
azd template list --output json

# Onyesha taarifa za templeti
azd template show <template-name>

# Thibitisha templeti kabla ya kuanzisha
azd template validate <template-name>
```

## 📁 Amri za Faili na Saraka

### Muundo wa Mradi
```bash
# Onyesha muundo wa saraka ya sasa
tree /f  # Windows
find . -type f  # Linux/macOS

# Nenda kwenye mzizi wa mradi wa azd
cd $(azd root)

# Onyesha saraka ya usanidi ya azd
echo $AZD_CONFIG_DIR  # Kwa kawaida ~/.azd
```

## 🎨 Uundaji wa Matokeo

### Matokeo ya JSON
```bash
# Pata pato la JSON kwa ajili ya kuandika skripti
azd show --output json
azd env list --output json
azd config list --output json

# Changanua kwa kutumia jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Matokeo ya Jedwali
```bash
# Panga kama jedwali
azd env list --output table

# Tazama huduma zilizowekwa
azd show --output json | jq '.services | keys'
```

## 🔧 Mchanganyiko ya Amri Zilizotumika Mara kwa Mara

### Skripti ya Ukaguzi wa Afya
```bash
#!/bin/bash
# Ukaguzi wa afya wa haraka
azd show
azd env show
azd monitor --logs
```

### Uthibitisho wa Uenezaji
```bash
#!/bin/bash
# Uthibitisho kabla ya utoaji
azd show
azd provision --preview  # Tazama mabadiliko kabla ya kuyasambaza
az account show
```

### Ulinganisho wa Mazingira
```bash
#!/bin/bash
# Linganisha mazingira
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skripti ya Usafishaji wa Rasilimali
```bash
#!/bin/bash
# Safisha mazingira ya zamani
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Vigezo vya Mazingira

### Vigezo vya Mazingira Vinavyotumika Kawaida
```bash
# Usanidi wa Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Usanidi wa AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Usanidi wa programu
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Amri za Dharura

### Marekebisho ya Haraka
```bash
# Weka upya uthibitisho
az account clear
az login

# Lazimisha upya mazingira
azd env refresh

# Weka upya huduma zote
azd deploy

# Angalia hali ya uanzishaji
azd show --output json
```

### Amri za Urejeshaji
```bash
# Rejesha kutokana na uanzishaji ulioshindwa - safisha na uanzishe tena
azd down --force --purge
azd up

# Tengeneza upya miundombinu pekee
azd provision

# Anzisha tena programu pekee
azd deploy
```

## 💡 Vidokezo vya Mtaalamu

### Majina Mbadala kwa Mtiririko wa Haraka
```bash
# Ongeza kwenye .bashrc au .zshrc yako
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Njia za Mkato za Kazi
```bash
# Kubadilisha mazingira haraka
azd-env() {
    azd env select $1 && azd show
}

# Uwekaji haraka na ufuatiliaji
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Hali ya mazingira
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Msaada na Nyaraka

### Kupata Msaada
```bash
# Msaada wa jumla
azd --help
azd help

# Msaada maalum kwa amri
azd up --help
azd env --help
azd config --help

# Onyesha toleo na taarifa za ujenzi
azd version
azd version --output json
```

### Viungo vya Nyaraka
```bash
# Fungua nyaraka kwenye kivinjari
azd docs

# Onyesha nyaraka za kiolezo
azd template show <template-name> --docs
```

---

**Kidokezo**: Hifadhi muhtasari huu kama alama (bookmark) na tumia `Ctrl+F` kutafuta haraka amri unazohitaji!

---

**Uvinjari**
- **Somo la Awali**: [Ukaguzi wa Kabla ya Uenezaji](../docs/pre-deployment/preflight-checks.md)
- **Somo Lifuatao**: [Kamusi](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kutolea lawama:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator] (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upotovu. Nyaraka ya awali kwa lugha yake ya asili inapaswa kuzingatiwa kama chanzo chenye mamlaka. Kwa taarifa za muhimu, inapendekezwa kutumia tafsiri ya kitaalamu inayofanywa na mtafsiri wa binadamu. Hatubebei dhamana kwa uelewa au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->