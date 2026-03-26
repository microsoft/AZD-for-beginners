# Muhtasari wa Amri - Amri Muhimu za AZD

**Rejea ya Haraka kwa Sura Zote**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../README.md)
- **📖 Mwanzoni Haraka**: [Sura 1: Misingi & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Amri za AI**: [Sura 2: Maendeleo ya Kwanza kwa AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Mtaalamu**: [Sura 4: Miundombinu kama Msimbo](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Utangulizi

Hii karatasi ya mbinu kamili inatoa rejea ya haraka kwa amri za Azure Developer CLI zinazotumika mara kwa mara, zilizopangwa kwa kategoria pamoja na mifano ya vitendo. Inafaa kwa kutafuta kwa haraka wakati wa maendeleo, utatuzi wa matatizo, na shughuli za kila siku na miradi ya azd.

## Malengo ya Kujifunza

Kwa kutumia karatasi hii ya mbinu, utakuwa na:
- Upatikanaji wa papo hapo wa amri muhimu za Azure Developer CLI na sintaksia
- Kuelewa jinsi amri zilivyoandaliwa kwa kategoria za kazi na matumizi
- Rejea ya mifano ya vitendo kwa matukio ya kawaida ya maendeleo na uenezaji
- Upatikanaji wa amri za utatuzi wa matatizo kwa azimio la haraka la matatizo
- Kupata chaguzi za juu za usanidi na ubinafsishaji kwa ufanisi
- Kupata amri za usimamizi wa mazingira na mtiririko wa kazi wa mazingira mengi

## Matokeo ya Kujifunza

Kwa kurejea mara kwa mara karatasi hii ya mbinu, utakuwa na uwezo wa:
- Kutekeleza amri za azd kwa kujiamini bila kurejea nyaraka kamili
- Kutatua haraka matatizo ya kawaida kwa kutumia amri sahihi za uchunguzi
- Kusimamia kwa ufanisi mazingira mengi na matukio ya uenezaji
- Kutumia vipengele vya juu vya azd na chaguzi za usanidi inapohitajika
- Kutatua matatizo ya uenezaji kwa kutumia mfuatano wa amri kwa sistematiki
- Kuboresha mitiririko ya kazi kupitia matumizi madhubuti ya vifupisho na chaguzi za azd

## Amri za Kuanzia

### Uthibitishaji
```bash
# Ingia kwenye Azure kupitia AZD
azd auth login

# Ingia kwenye Azure CLI (AZD inaitumia kimsingi)
az login

# Angalia akaunti ya sasa
az account show

# Weka usajili wa chaguo-msingi
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Toka kutoka kwa AZD
azd auth logout

# Toka kutoka kwa Azure CLI
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

## Amri za Msingi za Uenezaji

### Mtiririko Kamili wa Uenezaji
```bash
# Tekeleza kila kitu (kuandaa rasilimali + kusambaza)
azd up

# Tekeleza bila maombi ya uthibitisho
azd up --confirm-with-no-prompt

# Tekeleza kwenye mazingira maalum
azd up --environment production

# Tekeleza kwa vigezo maalum
azd up --parameter location=westus2
```

### Tu Miundombinu
```bash
# Tayarisha rasilimali za Azure
azd provision

# 🧪 Tazama awali mabadiliko ya miundombinu
azd provision --preview
# Inaonyesha mtazamo wa jaribio wa rasilimali ambazo zingeundwa/zibadilishwe/zifutwe
# Imefanana na 'terraform plan' au 'bicep what-if' - salama kuendesha, hakuna mabadiliko yatafanywa
```

### Tu Programu
```bash
# Weka msimbo wa programu
azd deploy

# Weka huduma maalum
azd deploy --service web
azd deploy --service api

# Weka huduma zote
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

### Usanidi Globali
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

# Pata vituo vya huduma
azd show --output json
```

## 📊 Ufuatiliaji na Utambuzi wa Matatizo

### Dashibodi ya Ufuatiliaji
```bash
# Fundua dashibodi ya ufuatiliaji ya portal ya Azure
azd monitor

# Fundua metriki za moja kwa moja za Application Insights
azd monitor --live

# Fundua blade ya logi za Application Insights
azd monitor --logs

# Fundua muhtasari wa Application Insights
azd monitor --overview
```

### Kuangalia Rekodi za Kontena
```bash
# Tazama logi kupitia Azure CLI (kwa Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Fuata logi kwa wakati halisi
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Tazama logi kupitia Portal ya Azure
azd monitor --logs
```

### Maswali ya Uchambuzi wa Logi
```bash
# Fikia Log Analytics kupitia Portal ya Azure
azd monitor --logs

# Chunguza magogo kwa kutumia Azure CLI
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
# Angalia sasisho za azd
azd version

# Pata toleo la sasa
azd version

# Tazama usanidi wa sasa
azd config list
```

## 🔧 Amri za Juu

### Mlolongo na CI/CD
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
# Inaiga utoaji wa miundombinu bila kupeleka
# Inachambua templeti za Bicep/Terraform na kuonyesha:
# - Rasilimali zitakazoongezwa (kijani +)
# - Rasilimali zitakazobadilishwa (manjano ~)
# - Rasilimali zitakazofutwa (nyekundu -)
# Salama kuendesha - hakuna mabadiliko halisi yatakayofanywa kwenye mazingira ya Azure

# Tengeneza miundombinu kutoka kwa azure.yaml
azd infra synth
```

### Taarifa za Mradi
```bash
# Onyesha hali ya mradi na vituo vya huduma
azd show

# Onyesha taarifa za kina za mradi kwa umbo la JSON
azd show --output json

# Pata vituo vya huduma
azd show --output json | jq '.services'
```

## 🤖 Amri za AI & Nyongeza

### Nyongeza za AZD
```bash
# Orodhesha nyongeza zote zinazopatikana (ikiwa ni pamoja na AI)
azd extension list

# Sakinisha nyongeza ya maajenti ya Foundry
azd extension install azure.ai.agents

# Sakinisha nyongeza ya urekebishaji wa kina
azd extension install azure.ai.finetune

# Sakinisha nyongeza ya miundo maalum
azd extension install azure.ai.models

# Sasisha nyongeza zote zilizosakinishwa
azd extension upgrade --all
```

### Amri za Wakala wa AI
```bash
# Anzisha mradi wa wakala kutoka kwenye manifesti
azd ai agent init -m <manifest-path-or-uri>

# Lenga mradi maalum wa Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Taja saraka ya chanzo ya wakala
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Chagua lengo la mwenyeji
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Anzisha seva ya MCP kwa mradi wako
azd mcp start

# Dhibiti idhini ya zana kwa ajili ya operesheni za MCP
azd mcp consent
```

### Uundaji wa Miundombinu
```bash
# Tegeneza faili za IaC kutoka kwenye ufafanuzi wa mradi wako
azd infra generate

# Tegeneza miundombinu kutoka kwa azure.yaml
azd infra synth
```

---

## 🎯 Mtiririko wa Kazi wa Haraka

### Mtiririko wa Maendeleo
```bash
# Anzisha mradi mpya
azd init --template todo-nodejs-mongo
cd my-project

# Peleka kwenye mazingira ya maendeleo
azd env new dev
azd up

# Fanya mabadiliko na upeleke tena
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

# Weka kwenye dev
azd env select dev
azd up

# Jaribu na kuhamisha kwenda staging
azd env select staging
azd up

# Weka kwenye uzalishaji
azd env select production
azd up
```

### Mtiririko wa Utatuzi wa Matatizo
```bash
# Washa hali ya ufuatiliaji (debug)
export AZD_DEBUG=true

# Kagua hali ya uanzishaji
azd show

# Thibitisha usanidi
azd config list

# Fungua dashibodi ya ufuatiliaji kwa ajili ya kumbukumbu
azd monitor --logs

# Kagua hali ya rasilimali
azd show --output json
```

## 🔍 Amri za Urekebishaji

### Taarifa za Urekebishaji
```bash
# Washa utoaji wa debug
export AZD_DEBUG=true
azd <command> --debug

# Zima telemetri kwa ajili ya pato safi
export AZD_DISABLE_TELEMETRY=true

# Angalia usanidi wa sasa
azd config list

# Angalia hali ya uthibitishaji
az account show
```

### Urekebishaji wa Kiolezo
```bash
# Orodhesha templeti zinazopatikana kwa undani
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
echo $AZD_CONFIG_DIR  # Kawaida ~/.azd
```

## 🎨 Uundaji wa Matokeo

### Matokeo ya JSON
```bash
# Pata matokeo ya JSON kwa ajili ya skripti
azd show --output json
azd env list --output json
azd config list --output json

# Changanua kwa jq
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

## 🔧 Mchanganyiko wa Amri Maarufu

### Skripti ya Ukaguzi wa Afya
```bash
#!/bin/bash
# Ukaguzi wa haraka wa afya
azd show
azd env show
azd monitor --logs
```

### Uthibitisho wa Uenezaji
```bash
#!/bin/bash
# Uthibitishaji kabla ya uzinduzi
azd show
azd provision --preview  # Pitia mabadiliko kabla ya kuzindua
az account show
```

### Ulinganishaji wa Mazingira
```bash
#!/bin/bash
# Kulinganisha mazingira
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

### Marekebisho ya Haraka
```bash
# Weka upya uthibitisho
az account clear
az login

# Lazimisha upya mazingira
azd env refresh

# Sambaza tena huduma zote
azd deploy

# Angalia hali ya usambazaji
azd show --output json
```

### Amri za Urejeshaji
```bash
# Rejesha baada ya utekelezaji ulioshindwa - safisha na weka tena
azd down --force --purge
azd up

# Tayarisha upya miundombinu pekee
azd provision

# Weka tena programu pekee
azd deploy
```

## 💡 Vidokezo vya Mtaalamu

### Majina Mbadala kwa Mtiririko wa Kazi wa Haraka
```bash
# Ongeza kwenye .bashrc au .zshrc yako
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Vifupisho vya Kazi
```bash
# Kubadilisha mazingira kwa haraka
azd-env() {
    azd env select $1 && azd show
}

# Uzinduzi wa haraka ukiambatana na ufuatiliaji
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

# Onyesha toleo na taarifa za kujenga
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

**Kidokezo**: Weka alama hii karatasi ya mbinu na tumia `Ctrl+F` ili kutafuta kwa haraka amri unazohitaji!

---

**Uelekeo**
- **Somo lililotangulia**: [Ukaguzi wa Awali](../docs/pre-deployment/preflight-checks.md)
- **Somo linalofuata**: [Kamusi](glossary.md)

---

> **💡 Unataka msaada wa amri za Azure ndani ya mhariri wako?** Sakinisha [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) kwa `npx skills add microsoft/github-copilot-for-azure` — ustadi 37 kwa AI, Foundry, uenezaji, uchunguzi wa matatizo, na mengine.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Wakati tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au zisizo sahihi. Nyaraka ya asili katika lugha yake inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya kitaalamu iliyofanywa na mtafsiri wa kibinadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->