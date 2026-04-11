# Cheti cha Amri - Amri Muhimu za AZD

**Mrejeleo wa Haraka kwa Sura Zote**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../README.md)
- **📖 Anza Haraka**: [Sura 1: Msingi & Kuanzishwa kwa Haraka](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Amri za AI**: [Sura 2: Maendeleo Yanayompa Kipaumbele AI (Inayopendekezwa kwa Waendelezaji wa AI)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Za Juu/Za Kuendelea**: [Sura 4: Miundombinu kama Msimbo](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Utangulizi

Cheti hiki cha amri kinatoa mrejeleo wa haraka kwa amri za Azure Developer CLI zinazotumika mara kwa mara, zilizopangwa kwa makundi kwa mifano ya vitendo. Ni kamili kwa kutafuta haraka wakati wa maendeleo, kutatua matatizo, na shughuli za kila siku na miradi ya azd.

## Malengo ya Kujifunza

Kwa kutumia cheti hiki cha amri, utapata:
- Upatikanaji wa papo hapo kwa amri muhimu za Azure Developer CLI na sintaksia
- Uelewa wa upangaji wa amri kwa makundi ya kazi na matumizi
- Marejeleo ya mifano ya vitendo kwa hali za maendeleo na uenezaji zinazotumika mara kwa mara
- Kupata amri za utambuzi kwa utatuzi wa haraka wa matatizo
- Kupata chaguzi za usanidi na urekebishaji wa juu kwa ufanisi
- Kupata amri za usimamizi wa mazingira na mtiririko wa kazi wa mazingira mengi

## Matokeo ya Kujifunza

Kwa marejeleo ya mara kwa mara ya cheti hiki, utaweza:
- Kutekeleza amri za azd kwa ujasiri bila kurejea kwa nyaraka zote
- Kutatua haraka matatizo ya kawaida kwa kutumia amri sahihi za utambuzi
- Kusimamia kwa ufanisi mazingira mengi na matukio ya uenezaji
- Kutumia vipengele vya juu vya azd na chaguzi za usanidi inapohitajika
- Kutatua matatizo ya uenezaji kwa kutumia mfululizo wa amri ulioandaliwa
- Kuboresha mitiririko ya kazi kupitia matumizi mazuri ya vifupisho na chaguzi za azd

## Amri za Kuanzia

### Uthibitishaji
```bash
# Ingia kwenye Azure kupitia AZD
azd auth login

# Ingia kwenye Azure CLI (AZD inaitumia nyuma ya pazia)
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
# Vinjari templeti zinazopatikana
azd template list

# Anzisha kutoka kwa templeti
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Anzisha katika saraka ya sasa
azd init .

# Anzisha kwa jina maalum
azd init --template todo-nodejs-mongo my-awesome-app
```

## Amri za Msingi za Utekelezaji

### Mtiririko Kamili wa Utekelezaji
```bash
# Sambaza kila kitu (kuandaa + kusambaza)
azd up

# Sambaza bila maombi ya uthibitisho
azd up --confirm-with-no-prompt

# Sambaza kwa mazingira maalum
azd up --environment production

# Sambaza na vigezo maalum
azd up --parameter location=westus2
```

### Miundombinu Pekee
```bash
# Toa rasilimali za Azure
azd provision

# 🧪 Tazama mabadiliko ya miundombinu
azd provision --preview
# Inaonyesha mtazamo wa 'dry-run' wa rasilimali zitakazoundwa/ zitakazobadilishwa/ zitakazofutwa
# Inafanana na 'terraform plan' au 'bicep what-if' - salama kukimbia, hakuna mabadiliko yatakayotekelezwa
```

### Programu Pekee
```bash
# Sambaza msimbo wa programu
azd deploy

# Sambaza huduma maalum
azd deploy --service web
azd deploy --service api

# Sambaza huduma zote
azd deploy --all
```

### Jenga na Kifurushi
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

# Onyesha mazingira yanayopatikana
azd env list

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

## ⚙️ Amri za Mipangilio

### Mipangilio ya Kimataifa
```bash
# Orodhesha usanidi wote
azd config show

# Weka chaguo-msingi za kimataifa
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Ondoa usanidi
azd config unset defaults.location

# Weka upya usanidi wote
azd config reset
```

### Mipangilio ya Mradi
```bash
# Thibitisha azure.yaml
azd config validate

# Onyesha taarifa za mradi
azd show

# Pata miisho ya huduma
azd show --output json
```

## 📊 Ufuatiliaji na Utambuzi

### Dashibodi ya Ufuatiliaji
```bash
# Fungua dashibodi ya ufuatiliaji ya portal ya Azure
azd monitor

# Fungua metiriki za moja kwa moja za Application Insights
azd monitor --live

# Fungua blade ya kumbukumbu za Application Insights
azd monitor --logs

# Fungua muhtasari wa Application Insights
azd monitor --overview
```

### Kuangalia Logi za Kontena
```bash
# Tazama logi kupitia Azure CLI (kwa Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Fuata logi kwa wakati halisi
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Tazama logi kutoka Azure Portal
azd monitor --logs
```

### Maswali ya Uchambuzi wa Logi
```bash
# Fikia Log Analytics kupitia Azure Portal
azd monitor --logs

# Chunguza logi kwa kutumia Azure CLI
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

# Ondoa kabisa rasilimali zilizofutwa kwa muda
azd down --purge

# Usafishaji kamili
azd down --force --purge
```

### Sasisho
```bash
# Angalia masasisho ya azd
azd version

# Pata toleo la sasa
azd version

# Tazama usanidi wa sasa
azd config show
```

## 🔧 Amri Zinazoendelea

### Mifereji na CI/CD
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
# Tengeneza violezo vya miundombinu
azd infra generate

# 🧪 Mapitio na Upangaji wa Miundombinu
azd provision --preview
# Inaiga utoaji wa miundombinu bila kuziweka
# Inachambua templeti za Bicep/Terraform na inaonyesha:
# - Rasilimali zitakazoongezwa (kijani +)
# - Rasilimali zitakazobadilishwa (manjano ~)
# - Rasilimali zitakazofutwa (nyekundu -)
# Salama kukimbia - hakuna mabadiliko halisi yaliyofanywa kwenye mazingira ya Azure

# Tengeneza miundombinu kutoka kwa azure.yaml
azd infra synth
```

### Taarifa za Mradi
```bash
# Onyesha hali ya mradi na anwani za mwisho
azd show

# Onyesha taarifa za kina za mradi kama JSON
azd show --output json

# Pata anwani za mwisho za huduma
azd show --output json | jq '.services'
```

## 🤖 Amri za AI na Nyongeza

### Nyongeza za AZD
```bash
# Orodhesha nyongeza zote zinazopatikana (ikijumuisha AI)
azd extension list

# Sakinisha nyongeza ya mawakala wa Foundry
azd extension install azure.ai.agents

# Sakinisha nyongeza ya kurekebisha kwa undani
azd extension install azure.ai.finetune

# Sakinisha nyongeza ya mifano maalum
azd extension install azure.ai.models

# Sasisha nyongeza zote zilizowekwa
azd extension upgrade --all
```

### Amri za Wakala wa AI
```bash
# Anzisha mradi wa wakala kutoka kwenye manifesti
azd ai agent init -m <manifest-path-or-uri>

# Lenga mradi maalum wa Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Taja saraka ya chanzo cha wakala
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Chagua lengo la kuhosti
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Seva ya MCP (Alpha)
```bash
# Anzisha seva ya MCP kwa mradi wako
azd mcp start

# Dhibiti idhini ya zana kwa shughuli za MCP
azd copilot consent list
```

### Uundaji wa Miundombinu
```bash
# Tengeneza faili za IaC kutoka kwa ufafanuzi wa mradi wako
azd infra generate

# Tengeneza miundombinu kutoka kwa azure.yaml
azd infra synth
```

---

## 🎯 Mitiririko ya Kazi ya Haraka

### Mtiririko wa Maendeleo
```bash
# Anza mradi mpya
azd init --template todo-nodejs-mongo
cd my-project

# Peleka kwenye mazingira ya maendeleo
azd env new dev
azd up

# Fanya mabadiliko na peleka tena
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

# Jaribu na hamisha kwenye mazingira ya maandalizi
azd env select staging
azd up

# Sambaza kwenye mazingira ya uzalishaji
azd env select production
azd up
```

### Mtiririko wa Utatuzi wa Tatizo
```bash
# Washa hali ya kugundua mende
export AZD_DEBUG=true

# Kagua hali ya uanzishaji
azd show

# Thibitisha usanidi
azd config show

# Fungua dashibodi ya ufuatiliaji kwa ajili ya kumbukumbu za mfumo
azd monitor --logs

# Kagua hali ya rasilimali
azd show --output json
```

## 🔍 Amri za Kuondoa Mende

### Taarifa za Kuondoa Mende
```bash
# Washa pato la ufuatiliaji
export AZD_DEBUG=true
azd <command> --debug

# Zima telemetri kwa pato safi zaidi
export AZD_DISABLE_TELEMETRY=true

# Angalia usanidi wa sasa
azd config show

# Kagua hali ya uthibitishaji
az account show
```

### Kuondoa Mende kwa Mfano
```bash
# Orodhesha violezo vinavyopatikana pamoja na maelezo
azd template list --output json

# Onyesha taarifa za kiolezo
azd template show <template-name>

# Thibitisha kiolezo kabla ya kuanzisha
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
echo $AZD_CONFIG_DIR  # Kawaida ~/.azd
```

## 🎨 Uundaji wa Matokeo

### Matokeo ya JSON
```bash
# Pata pato la JSON kwa ajili ya uandishi wa skripti
azd show --output json
azd env list --output json
azd config show --output json

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

## 🔧 Mchanganyiko ya Amri ya Kawaida

### Skripti ya Ukaguzi wa Afya
```bash
#!/bin/bash
# Ukaguzi wa afya wa haraka
azd show
azd env get-values
azd monitor --logs
```

### Uthibitishaji wa Utekelezaji
```bash
#!/bin/bash
# Uthibitishaji kabla ya kupeleka
azd show
azd provision --preview  # Tazama mabadiliko kabla ya kupeleka
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

### Vigezo vya Mazingira Vinavyotumika Mara kwa Mara
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

### Ufumbuzi wa Haraka
```bash
# Weka upya uthibitisho
az account clear
az login

# Lazimisha upya mazingira
azd env refresh

# Sambaza tena huduma zote
azd deploy

# Kagua hali ya usambazaji
azd show --output json
```

### Amri za Urejeshaji
```bash
# Kupona kutokana na uzinduzi ulioshindikana - safisha na uzindue tena
azd down --force --purge
azd up

# Toa tena miundombinu pekee
azd provision

# Uzindue tena programu pekee
azd deploy
```

## 💡 Vidokezo vya Kitaalamu

### Majina Mbadala kwa Mtiririko wa Kasi
```bash
# Ongeza kwenye .bashrc au .zshrc yako
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Njia Fupi za Kazi
```bash
# Kubadili mazingira kwa haraka
azd-env() {
    azd env select $1 && azd show
}

# Uzindishaji wa haraka ukiambatana na ufuatiliaji
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Hali ya mazingira
azd-status() {
    echo "Current environment:"
    azd env get-values
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
# Fungua nyaraka katika kivinjari
azd docs

# Onyesha nyaraka za kiolezo
azd template show <template-name> --docs
```

---

**Kidokezo**: Kagua cheti hiki na tumia `Ctrl+F` kupata kwa haraka amri unazohitaji!

---

**Uvinjari**
- **Somo lililopita**: [Ukaguzi wa Kabla ya Utekelezaji](../docs/pre-deployment/preflight-checks.md)
- **Somo lililofuata**: [Kamusi](glossary.md)

---

> **💡 Unataka msaada wa amri za Azure ndani ya mhariri wako?** Sakinisha [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) kwa `npx skills add microsoft/github-copilot-for-azure` — ustadi 37 kwa AI, Foundry, uenezaji, utambuzi, na zaidi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kutotegemea**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka asilia katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia utafsiri wa kitaalamu unaofanywa na binadamu. Hatuwajibiki kwa uelewa potofu au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->