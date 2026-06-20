# Cheat Sheet ng Mga Utos - Mahahalagang Utos ng AZD

**Mabilisang Sanggunian para sa Lahat ng Kabanata**
- **📚 Home ng Kurso**: [AZD Para sa Mga Nagsisimula](../README.md)
- **📖 Mabilis na Pagsisimula**: [Kabanata 1: Pundasyon at Mabilis na Pagsisimula](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Mga Utos ng AI**: [Kabanata 2: Pag-develop na Nauuna ang AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Kabanata 4: Imprastruktura bilang Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Panimula

Ang komprehensibong cheat sheet na ito ay nagbibigay ng mabilisang sanggunian para sa mga pinaka-karaniwang ginagamit na Azure Developer CLI na mga utos, inayos ayon sa kategorya na may praktikal na mga halimbawa. Perpekto para sa mabilisang paghahanap habang nagde-develop, nag-troubleshoot, at sa pang-araw-araw na operasyon ng mga proyektong azd.

## Mga Layunin sa Pagkatuto

Sa paggamit ng cheat sheet na ito, makakamit mo:
- Agarang pag-access sa mahahalagang Azure Developer CLI na mga utos at sintaks
- Pag-unawa sa organisasyon ng mga utos ayon sa mga functional na kategorya at mga kaso ng paggamit
- Pagsangguni sa praktikal na mga halimbawa para sa karaniwang mga senaryo ng pag-develop at pag-deploy
- Pag-access sa mga utos sa pag-troubleshoot para sa mabilisang paglutas ng isyu
- Paghahanap ng advanced na mga opsyon sa konfigurasyon at pag-customize nang epektibo
- Lokasyon ng pamamahala ng kapaligiran at mga utos para sa multi-environment na workflow

## Mga Kinalabasan ng Pagkatuto

Sa regular na pagsangguni sa cheat sheet na ito, magagawa mong:
- Patakbuhin ang mga utos ng azd nang may kumpiyansa nang hindi bumabalik sa buong dokumentasyon
- Mabilis na lutasin ang mga karaniwang isyu gamit ang mga angkop na diagnostic na utos
- Epektibong pamahalaan ang maramihang kapaligiran at mga senaryo ng pag-deploy
- Ilapat ang mga advanced na tampok ng azd at mga opsyon sa konfigurasyon ayon sa kailangan
- Mag-troubleshoot ng mga isyu sa pag-deploy gamit ang sistematikong pagkakasunod-sunod ng mga utos
- I-optimize ang mga workflow sa pamamagitan ng epektibong paggamit ng mga shortcut at opsyon ng azd

## Mga Utos para Magsimula

### Autentikasyon
```bash
# Mag-login sa Azure gamit ang AZD
azd auth login

# Mag-login sa Azure CLI (ginagamit ito ng AZD sa likod ng eksena)
az login

# Suriin ang kasalukuyang account
az account show

# Itakda ang default na subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Mag-logout mula sa AZD
azd auth logout

# Mag-logout mula sa Azure CLI
az logout
```

### Inisyal na Pag-setup ng Proyekto
```bash
# Mag-browse ng mga magagamit na template
azd template list

# I-initialize mula sa template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# I-initialize sa kasalukuyang direktoryo
azd init .

# I-initialize gamit ang pasadyang pangalan
azd init --template todo-nodejs-mongo my-awesome-app
```

## Pangunahing Mga Utos sa Pag-deploy

### Kumpletong Daloy ng Pag-deploy
```bash
# I-deploy ang lahat (mag-provision + mag-deploy)
azd up

# I-deploy na walang mga prompt ng kumpirmasyon
azd up --confirm-with-no-prompt

# I-deploy sa tinukoy na kapaligiran
azd up --environment production

# I-deploy gamit ang pasadyang mga parameter
azd up --parameter location=westus2
```

### Imprastruktura Lamang
```bash
# Mag-provision ng mga resource ng Azure
azd provision

# 🧪 I-preview ang mga pagbabago sa imprastruktura
azd provision --preview
# Ipinapakita ang dry-run na pananaw kung alin sa mga resource ang malilikha, mababago, o matatanggal
# Katulad ng 'terraform plan' o 'bicep what-if' - ligtas patakbuhin, walang pagbabago ang iaaplay
```

### Aplikasyon Lamang
```bash
# I-deploy ang kodigo ng aplikasyon
azd deploy

# I-deploy ang partikular na serbisyo
azd deploy --service web
azd deploy --service api

# I-deploy ang lahat ng serbisyo
azd deploy --all
```

### Itayo at I-package
```bash
# I-restore (i-download) ang mga dependency ng aplikasyon
azd restore

# I-restore ang isang partikular na serbisyo
azd restore --service api

# Bumuo ng isang deployable na artifact nang hindi nagde-deploy
azd package

# Bumuo ng isang partikular na serbisyo
azd package --service api
```

> **`azd restore`** nagda-download ng mga dependency ng iyong app (npm, pip, NuGet, Maven, atbp.). Ito ay tumatakbo nang awtomatiko sa panahon ng `azd package` at `azd deploy`, kaya bihira mo itong tawagin nang direkta—patakbuhin ito nang manu-mano upang ma-pre-fetch ang mga dependency (halimbawa, upang painitin ang cache ng CI o magtrabaho nang offline pagkatapos).

> **`azd package`** bumubuo ng deployable na artifact (isang container image o zip) **nang hindi** ipinapadala ito sa Azure. Gamitin ito nang hiwalay upang suriin na matagumpay ang build, inspeksyunin ang output, o gumawa ng artifact na isang hiwalay na proseso ang magde-deploy mamaya. Ang `azd deploy` ay nagpa-package nang awtomatiko, kaya kailangan mo lamang ng `azd package` kapag gusto mo ang artifact nang hindi nagde-deploy.


## 🌍 Pamamahala ng Kapaligiran

### Mga Operasyon ng Kapaligiran
```bash
# Ilista ang lahat ng kapaligiran
azd env list

# Gumawa ng bagong kapaligiran
azd env new development
azd env new staging --location westus2

# Piliin ang kapaligiran
azd env select production

# Ipakita ang mga magagamit na kapaligiran
azd env list

# I-refresh ang estado ng kapaligiran
azd env refresh
```

### Mga Variable ng Kapaligiran
```bash
# Itakda ang variable ng kapaligiran
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Kunin ang variable ng kapaligiran
azd env get API_KEY

# Ilista ang lahat ng mga variable ng kapaligiran
azd env get-values

# Alisin ang variable ng kapaligiran
azd env unset DEBUG
```

## ⚙️ Mga Utos ng Konfigurasyon

### Pandaigdigang Konfigurasyon
```bash
# Ilista ang lahat ng konfigurasyon
azd config show

# Itakda ang mga pandaigdigang default
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Alisin ang konfigurasyon
azd config unset defaults.location

# I-reset ang lahat ng konfigurasyon
azd config reset
```

### Konfigurasyon ng Proyekto
```bash
# Suriin ang azure.yaml
azd config validate

# Ipakita ang impormasyon ng proyekto
azd show

# Kunin ang mga endpoint ng serbisyo
azd show --output json
```

## 📊 Pagmo-monitor at Diagnostika

### Dashboard ng Pagmo-monitor
```bash
# Buksan ang dashboard ng pagmamanman sa Azure portal
azd monitor

# Buksan ang mga live na metrics ng Application Insights
azd monitor --live

# Buksan ang blade ng mga log ng Application Insights
azd monitor --logs

# Buksan ang pangkalahatang-ideya ng Application Insights
azd monitor --overview
```

### Pagtingin sa Mga Log ng Container
```bash
# Tingnan ang mga log gamit ang Azure CLI (para sa Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Sundan ang mga log nang real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Tingnan ang mga log sa Azure Portal
azd monitor --logs
```

### Mga Query sa Log Analytics
```bash
# Mag-access ng Log Analytics sa pamamagitan ng Azure Portal
azd monitor --logs

# Mag-query ng mga log gamit ang Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Mga Utos para sa Pagpapanatili

### Paglilinis
```bash
# Tanggalin ang lahat ng mga resource ng Azure
azd down

# Puwersahang tanggalin nang walang kumpirmasyon
azd down --force

# Tuluyang burahin ang mga soft-deleted na resource
azd down --purge

# Kumpletong paglilinis
azd down --force --purge
```

### Mga Update
```bash
# Suriin ang mga pag-update ng azd
azd version

# Kunin ang kasalukuyang bersyon
azd version

# Tingnan ang kasalukuyang konfigurasyon
azd config show
```

## 🔧 Mga Advanced na Utos

### Pipeline at CI/CD
```bash
# I-configure ang GitHub Actions
azd pipeline config

# I-configure ang Azure DevOps
azd pipeline config --provider azdo

# Ipakita ang konfigurasyon ng pipeline
azd pipeline show
```

### Pamamahala ng Imprastruktura
```bash
# Gumawa ng mga template ng imprastruktura
azd infra generate

# 🧪 Paunang-tingin at Pagpaplano ng Imprastruktura
azd provision --preview
# Gumagawa ng simulasyon ng pag-provision ng imprastruktura nang hindi nagde-deploy
# Sinusuri ang mga template ng Bicep/Terraform at ipinapakita:
# - Mga resource na idadagdag (berde +)
# - Mga resource na babaguhin (dilaw ~)
# - Mga resource na tatanggalin (pula -)
# Ligtas patakbuhin - walang aktwal na pagbabago na gagawin sa kapaligiran ng Azure

# Buoin ang imprastruktura mula sa azure.yaml
azd infra synth
```

### Impormasyon ng Proyekto
```bash
# Ipakita ang katayuan ng proyekto at mga endpoint
azd show

# Ipakita ang detalyadong impormasyon ng proyekto bilang JSON
azd show --output json

# Kunin ang mga endpoint ng serbisyo
azd show --output json | jq '.services'
```

## 🤖 Mga Utos para sa AI at Extensions

### Mga Extension ng AZD
```bash
# Ilista ang lahat ng magagamit na extension (kasama ang AI)
azd extension list

# I-install ang Foundry agents extension
azd extension install azure.ai.agents

# I-install ang agent skills extension (paunang bersyon)
azd extension install azure.ai.skills

# I-install ang Foundry connections extension (paunang bersyon)
azd extension install azure.ai.connections

# I-install ang extension para sa fine-tuning
azd extension install azure.ai.finetune

# I-install ang extension para sa mga pasadyang modelo
azd extension install azure.ai.models

# I-upgrade ang lahat ng naka-install na extension
azd extension upgrade --all
```

### Mga Utos ng AI Agent
```bash
# I-initialize ang proyekto ng ahente mula sa manifest
azd ai agent init -m <manifest-path-or-uri>

# I-target ang isang partikular na Foundry na proyekto
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Tukuyin ang direktoryo ng pinagmulan ng ahente
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pumili ng target na hosting
azd ai agent init -m agent-manifest.yaml --host containerapp

# Subukan ang naka-deploy na ahente (ipinapakita ang latency at time-to-first-byte)
azd ai agent invoke

# Ipakita ang live na konfigurasyon ng endpoint
azd ai agent endpoint show

# Gumawa ng dataset para sa ebalwasyon, pagkatapos i-optimize ang ahente
azd ai agent eval generate
azd ai agent optimize

# I-download ang naka-deploy na source ng hosted na ahenteng batay sa code
azd ai agent code download

# Tanggalin ang hosted na ahente at lahat ng bersyon nito (--force tinatapos ang aktibong mga sesyon)
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# Simulan ang MCP server para sa iyong proyekto
azd mcp start

# Pamahalaan ang pahintulot ng tool para sa mga operasyon ng MCP
azd copilot consent list
```

### Pagbuo ng Imprastruktura
```bash
# Gumawa ng mga file ng IaC mula sa depinisyon ng iyong proyekto
azd infra generate

# Ibuo ang imprastruktura mula sa azure.yaml
azd infra synth
```

---

## 🎯 Mabilis na Daloy ng Trabaho

### Daloy ng Pag-develop
```bash
# Magsimula ng bagong proyekto
azd init --template todo-nodejs-mongo
cd my-project

# I-deploy sa development
azd env new dev
azd up

# Gumawa ng mga pagbabago at i-deploy muli
azd deploy

# Buksan ang dashboard ng pagmamanman
azd monitor --live
```

### Daloy ng Maramihang Kapaligiran
```bash
# Ihanda ang mga kapaligiran
azd env new dev
azd env new staging  
azd env new production

# I-deploy sa dev
azd env select dev
azd up

# Subukan at i-promote sa staging
azd env select staging
azd up

# I-deploy sa produksyon
azd env select production
azd up
```

### Daloy ng Pag-troubleshoot
```bash
# Paganahin ang debug mode
export AZD_DEBUG=true

# Suriin ang katayuan ng deployment
azd show

# Patunayan ang konfigurasyon
azd config show

# Buksan ang monitoring dashboard para sa mga log
azd monitor --logs

# Suriin ang katayuan ng mga resource
azd show --output json
```

## 🔍 Mga Utos sa Pag-debug

### Impormasyon sa Debug
```bash
# Paganahin ang debug output
export AZD_DEBUG=true
azd <command> --debug

# I-disable ang telemetry para sa mas malinis na output
export AZD_DISABLE_TELEMETRY=true

# Suriin ang kasalukuyang konfigurasyon
azd config show

# Suriin ang katayuan ng pagpapatunay
az account show
```

### Pag-debug ng Template
```bash
# Ilista ang mga magagamit na template kasama ang mga detalye
azd template list --output json

# Ipakita ang impormasyon ng template
azd template show <template-name>

# Suriin ang template bago i-initialize
azd template validate <template-name>
```

## 📁 Mga Utos ng File at Direktoryo

### Istruktura ng Proyekto
```bash
# Ipakita ang kasalukuyang istruktura ng direktoryo
tree /f  # Windows
find . -type f  # Linux/macOS

# Pumunta sa ugat ng proyekto ng azd
cd $(azd root)

# Ipakita ang direktoryo ng konfigurasyon ng azd
echo $AZD_CONFIG_DIR  # Karaniwan ~/.azd
```

## 🎨 Pag-format ng Output

### JSON na Output
```bash
# Kunin ang JSON na output para sa scripting
azd show --output json
azd env list --output json
azd config show --output json

# I-parse gamit ang jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output na Table
```bash
# I-format bilang talahanayan
azd env list --output table

# Tingnan ang mga naka-deploy na serbisyo
azd show --output json | jq '.services | keys'
```

## 🔧 Karaniwang Kombinasyon ng Utos

### Script para sa Health Check
```bash
#!/bin/bash
# Mabilis na pagsusuri ng kalusugan
azd show
azd env get-values
azd monitor --logs
```

### Pag-validate ng Pag-deploy
```bash
#!/bin/bash
# Pagpapatunay bago i-deploy
azd show
azd provision --preview  # Suriin ang mga pagbabago bago i-deploy
az account show
```

### Paghahambing ng Kapaligiran
```bash
#!/bin/bash
# Ihambing ang mga kapaligiran
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script para sa Paglilinis ng Mga Resource
```bash
#!/bin/bash
# Linisin ang mga lumang kapaligiran
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Mga Variable ng Kapaligiran

### Karaniwang Mga Variable ng Kapaligiran
```bash
# Konfigurasyon ng Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Konfigurasyon ng AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Konfigurasyon ng aplikasyon
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Mga Pang-emergency na Utos

### Mabilisang Pag-aayos
```bash
# I-reset ang awtentikasyon
az account clear
az login

# Pilitin ang pag-refresh ng kapaligiran
azd env refresh

# I-deploy muli ang lahat ng serbisyo
azd deploy

# Suriin ang katayuan ng pag-deploy
azd show --output json
```

### Mga Utos sa Pag-recover
```bash
# Bumawi mula sa nabigong deployment - linisin at i-deploy muli
azd down --force --purge
azd up

# Muling i-provision ang imprastruktura lamang
azd provision

# I-deploy muli ang aplikasyon lamang
azd deploy
```

## 💡 Mga Pro Tip

### Mga Alias para sa Mas Mabilis na Daloy ng Trabaho
```bash
# Idagdag sa iyong .bashrc o .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Mga Shortcut ng Function
```bash
# Mabilis na paglipat ng kapaligiran
azd-env() {
    azd env select $1 && azd show
}

# Mabilis na pag-deploy na may pagmamanman
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Katayuan ng kapaligiran
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Tulong at Dokumentasyon

### Pagkuha ng Tulong
```bash
# Pangkalahatang tulong
azd --help
azd help

# Tulong para sa partikular na utos
azd up --help
azd env --help
azd config --help

# Ipakita ang bersyon at impormasyon ng build
azd version
azd version --output json
```

### Mga Link sa Dokumentasyon
```bash
# Buksan ang dokumentasyon sa browser
azd docs

# Ipakita ang dokumentasyon ng template
azd template show <template-name> --docs
```

---

**Tip**: I-bookmark ang cheat sheet na ito at gamitin ang `Ctrl+F` upang mabilis na hanapin ang mga utos na kailangan mo!

---

**Navigasyon**
- **Nakaraang Aralin**: [Mga Preflight na Pagsusuri](../docs/pre-deployment/preflight-checks.md)
- **Susunod na Aralin**: [Glosaryo](glossary.md)

---

> **💡 Gusto mo ng tulong sa mga Azure command sa iyong editor?** I-install ang [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — 37 skills para sa AI, Foundry, deployment, diagnostics, atbp.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->