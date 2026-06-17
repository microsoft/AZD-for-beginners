# Karatasi ya Marejeleo ya Amri - Amri Muhimu za AZD

**Marejeleo ya Haraka kwa Sura Zote**
- **📚 Nyumbani ya Kozi**: [AZD Kwa Waanzilishi](../README.md)
- **📖 Anza Haraka**: [Sura 1: Msingi & Mwongozo wa Kuanzia](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Amri za AI**: [Sura 2: Maendeleo ya AI Kwanza](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Za Juu**: [Sura 4: Miundombinu kama Msimbo](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Utangulizi

Hii karatasi ya marejeleo ya kina inatoa rejea ya haraka kwa amri za Azure Developer CLI zinazotumika sana, zilizopangwa kwa kategoria na mifano ya vitendo. Inafaa kwa kutafuta haraka wakati wa maendeleo, kutatua matatizo, na shughuli za kila siku na miradi ya azd.

## Malengo ya Kujifunza

Kwa kutumia karatasi hii ya marejeleo, utapata:
- Ufikiaji wa papo hapo kwa amri muhimu za Azure Developer CLI na sintaksia
- Uelewa wa upangaji wa amri kwa kategoria za kiutendaji na matumizi
- Mifano ya vitendo kwa hali za kawaida za maendeleo na utoaji
- Amri za utatuzi kwa utatuzi wa matatizo kwa haraka
- Kupata chaguzi za usanidi wa juu na kubinafsisha kwa ufanisi
- Kupata amri za usimamizi wa mazingira na mtiririko wa kazi wa mazingira mengi

## Matokeo ya Kujifunza

Kwa kurejea mara kwa mara karatasi hii ya marejeleo, utaweza:
- Kutekeleza amri za azd kwa kujiamini bila kurejea nyaraka kamili
- Kutatua haraka matatizo ya kawaida kwa kutumia amri sahihi za uchunguzi
- Kusimamia kwa ufanisi mazingira mengi na hali za utoaji
- Kutumia vipengele vya juu vya azd na chaguzi za usanidi inapohitajika
- Kutatua matatizo ya utekelezaji kwa kutumia mfululizo wa amri kwa mfumo
- Kuongeza ufanisi wa mtiririko wa kazi kupitia matumizi madhubuti ya njia mfupi na chaguzi za azd

## Amri za Kuanzia

### Uthibitisho
```bash
# Ingia kwenye Azure kupitia AZD
azd auth login

# Ingia kwenye Azure CLI (AZD inaitumia hii nyuma ya pazia)
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

### Kuanza Mradi
```bash
# Pitia tempeleti zinazopatikana
azd template list

# Anzisha kutoka kwenye tempeleti
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Anzisha katika saraka ya sasa
azd init .

# Anzisha kwa jina maalum
azd init --template todo-nodejs-mongo my-awesome-app
```

## Amri za Msingi za Utekelezaji

### Mchakato Kamili wa Utekelezaji
```bash
# Weka yote (kuandaa rasilimali + kuweka)
azd up

# Weka bila kuomba uthibitisho
azd up --confirm-with-no-prompt

# Weka kwenye mazingira maalum
azd up --environment production

# Weka kwa vigezo vilivyobinafsishwa
azd up --parameter location=westus2
```

### Miundombinu Pekee
```bash
# Tayarishe rasilimali za Azure
azd provision

# 🧪 Tazama mapema mabadiliko ya miundombinu
azd provision --preview
# Inaonyesha mtazamo wa jaribio la kufanya bila kutekeleza wa rasilimali ambazo zingeundwa/zingebadilishwa/zingefutwa
# Inafanana na 'terraform plan' au 'bicep what-if' - salama kuendesha, hakuna mabadiliko yatafanywa
```

### Programu Pekee
```bash
# Weka msimbo wa programu
azd deploy

# Weka huduma maalum
azd deploy --service web
azd deploy --service api

# Weka huduma zote
azd deploy --all
```

### Jenga na Kutengeneza Kifurushi
```bash
# Rejesha (pakua) utegemezi wa programu
azd restore

# Rejesha huduma maalum
azd restore --service api

# Jenga artifakti inayoweza kupelekwa bila kupeleka
azd package

# Jenga huduma maalum
azd package --service api
```

> **`azd restore`** inapakua utegemezi wa programu yako (npm, pip, NuGet, Maven, n.k.). Inaendesha moja kwa moja wakati wa `azd package` na `azd deploy`, hivyo huwa hawezi kuitwa mara nyingi moja kwa moja—idaiendeshe kwa mkono ili kupakua utegemezi mapema (kwa mfano, kuwasilisha cache ya CI au kufanya kazi bila mtandao baadaye).

> **`azd package`** hujenga kifurushi kinachoweza kutumwa (picha ya kontena au zipu) **bila** kukisukuma kwenda Azure. Tumia pekee yake ili kuthibitisha jengo limefanikiwa, kukagua matokeo, au kutengeneza kifurushi ambacho mchakato tofauti utaweka baadaye. `azd deploy` hufanya paketishaji kiatomati, kwa hivyo unahitaji `azd package` tu unapotaka kifurushi bila kuutekeleza.

## 🌍 Usimamizi wa Mazingira

### Operesheni za Mazingira
```bash
# Orodhesha mazingira yote
azd env list

# Tengeneza mazingira mapya
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

# Pata viunganishi vya huduma
azd show --output json
```

## 📊 Ufuatiliaji na Utambuzi

### Dashibodi ya Ufuatiliaji
```bash
# Fungua dashibodi ya ufuatiliaji kwenye portal ya Azure
azd monitor

# Fungua vipimo vya wakati halisi vya Application Insights
azd monitor --live

# Fungua blade ya logi za Application Insights
azd monitor --logs

# Fungua muhtasari wa Application Insights
azd monitor --overview
```

### Kuangalia Rekodi za Kontena
```bash
# Tazama kumbukumbu za matukio kupitia Azure CLI (kwa Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Fuata kumbukumbu za matukio kwa wakati halisi
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Tazama kumbukumbu za matukio kupitia Azure Portal
azd monitor --logs
```

### Maswali ya Uchambuzi wa Rekodi
```bash
# Fikia Log Analytics kupitia Portal ya Azure
azd monitor --logs

# Chunguza rejista kwa kutumia CLI ya Azure
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
# Angalia masasisho ya azd
azd version

# Pata toleo la sasa
azd version

# Tazama usanidi wa sasa
azd config show
```

## 🔧 Amri za Juu

### Mstari wa Pipeline na CI/CD
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
# Inafananisha utoaji wa miundombinu bila kuitekeleza
# Inachambua templeti za Bicep/Terraform na inaonyesha:
# - Rasilimali zitakazoongezwa (kijani +)
# - Rasilimali zitakazobadilishwa (manjano ~)
# - Rasilimali zitakazofutwa (nyekundu -)
# Salama kuendesha - hakuna mabadiliko halisi yaliyofanywa kwenye mazingira ya Azure

# Unda miundombinu kutoka azure.yaml
azd infra synth
```

### Taarifa za Mradi
```bash
# Onyesha hali ya mradi na vituo vya huduma
azd show

# Onyesha taarifa za kina za mradi kwa muundo wa JSON
azd show --output json

# Pata vituo vya huduma
azd show --output json | jq '.services'
```

## 🤖 Amri za AI & Upanuzi

### Upanuzi za AZD
```bash
# Orodhesha viendelezi vyote vinavyopatikana (ikiwa ni pamoja na AI)
azd extension list

# Sakinisha kiendelezi cha Foundry agents
azd extension install azure.ai.agents

# Sakinisha kiendelezi cha agent skills (toleo la awali)
azd extension install azure.ai.skills

# Sakinisha kiendelezi cha Foundry connections (toleo la awali)
azd extension install azure.ai.connections

# Sakinisha kiendelezi cha kurekebisha kwa kina
azd extension install azure.ai.finetune

# Sakinisha kiendelezi cha modeli zilizobinafsishwa
azd extension install azure.ai.models

# Sasisha viendelezi vyote vilivyowekwa
azd extension upgrade --all
```

### Amri za Wakala wa AI
```bash
# Anzisha mradi wa wakala kutoka kwenye manifesti
azd ai agent init -m <manifest-path-or-uri>

# Lenga mradi maalum wa Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ainisha saraka ya chanzo ya wakala
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Chagua lengo la kuhosti
azd ai agent init -m agent-manifest.yaml --host containerapp

# Jaribu wakala uliowekwa (huonyesha ucheleweshaji na muda hadi baiti ya kwanza)
azd ai agent invoke

# Onyesha usanidi wa kiunganisho hai
azd ai agent endpoint show

# Zalisha seti ya data ya tathmini, kisha boresha wakala
azd ai agent eval generate
azd ai agent optimize

# Pakua chanzo kilichowekwa cha wakala aliyehostiwa anayetegemea msimbo
azd ai agent code download

# Futa wakala aliyehostiwa na toleo zake zote (--force inamaliza vikao vinavyoendelea)
azd ai agent delete --force
```

### Seva ya MCP (Alpha)
```bash
# Anzisha seva ya MCP kwa mradi wako
azd mcp start

# Simamia idhini ya zana kwa shughuli za MCP
azd copilot consent list
```

### Uundaji wa Miundombinu
```bash
# Tengeneza faili za IaC kutoka kwa ufafanuzi wa mradi wako
azd infra generate

# Sinteza miundombinu kutoka kwa azure.yaml
azd infra synth
```

---

## 🎯 Mtiririko wa Kazi wa Haraka

### Mtiririko wa Maendeleo
```bash
# Anza mradi mpya
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

### Mtiririko wa Mazingira Mengi
```bash
# Sanidi mazingira
azd env new dev
azd env new staging  
azd env new production

# Sambaza kwenye mazingira ya maendeleo
azd env select dev
azd up

# Jaribu na kuhamisha kwenda mazingira ya majaribio
azd env select staging
azd up

# Sambaza kwenye uzalishaji
azd env select production
azd up
```

### Mtiririko wa Utatuzi wa Matatizo
```bash
# Washa modi ya kutatua hitilafu
export AZD_DEBUG=true

# Angalia hali ya utekelezaji
azd show

# Thibitisha usanidi
azd config show

# Fungua dashibodi ya ufuatiliaji kwa maandishi ya kumbukumbu
azd monitor --logs

# Angalia hali ya rasilimali
azd show --output json
```

## 🔍 Amri za Utafutaji Hitilafu

### Taarifa za Utafutaji
```bash
# Wezesha utoaji wa debug
export AZD_DEBUG=true
azd <command> --debug

# Zima telemetry kwa matokeo safi
export AZD_DISABLE_TELEMETRY=true

# Angalia usanidi wa sasa
azd config show

# Angalia hali ya uthibitishaji
az account show
```

### Kukanushwa kwa Kiolezo
```bash
# Orodhesha templeti zinazopatikana pamoja na maelezo
azd template list --output json

# Onyesha taarifa za templeti
azd template show <template-name>

# Thibitisha templeti kabla ya kuanzishwa
azd template validate <template-name>
```

## 📁 Amri za Faili na Saraka

### Muundo wa Mradi
```bash
# Onyesha muundo wa saraka ya sasa
tree /f  # Windows
find . -type f  # Linux/macOS

# Nenda hadi mzizi wa mradi wa azd
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

# Chambua kwa jq
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

## 🔧 Mchanganyiko ya Amri za Kawaida

### Skripti ya Ukaguzi wa Afya
```bash
#!/bin/bash
# Ukaguzi wa haraka wa afya
azd show
azd env get-values
azd monitor --logs
```

### Uthibitisho wa Utekelezaji
```bash
#!/bin/bash
# Uthibitisho kabla ya kupeleka
azd show
azd provision --preview  # Tazama mabadiliko kabla ya kupeleka
az account show
```

### Ulinganisho wa Mazingira
```bash
#!/bin/bash
# Linganishe mazingira
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

### Vigezo vya Mazingira vya Kawaida
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
# Rejesha kutokana na utekelezaji ulioshindikana - safisha na utekeleze tena
azd down --force --purge
azd up

# Toa tena miundombinu tu
azd provision

# Sakinisha tena programu tu
azd deploy
```

## 💡 Vidokezo vya Wataalamu

### Majina Mbadala kwa Mtiririko wa Kasi
```bash
# Ongeza kwenye .bashrc yako au .zshrc yako
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Mifupisho ya Kazi
```bash
# Kubadilisha mazingira kwa haraka
azd-env() {
    azd env select $1 && azd show
}

# Uwekaji wa haraka pamoja na ufuatiliaji
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

# Msaada maalumu kwa amri
azd up --help
azd env --help
azd config --help

# Onyesha toleo na maelezo ya ujenzi
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

**Dokezo**: Hifadhi karatasi hii ya marejeleo kwa alama (bookmark) na tumia `Ctrl+F` kupata haraka amri unazozihitaji!

---

**Uvinjari**
- **Somo Lililopita**: [Ukaguzi wa Kabla ya Utekelezaji](../docs/pre-deployment/preflight-checks.md)
- **Somo Linalofuata**: [Kamusi](glossary.md)

---

> **💡 Unataka msaada wa amri za Azure katika mhariri wako?** Sakinisha [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) kwa `npx skills add microsoft/github-copilot-for-azure` — ujuzi 37 kwa AI, Foundry, utekelezaji, utambuzi, na zaidi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->