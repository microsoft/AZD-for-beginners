# Command Cheat Sheet - Mahahalagang Utos ng AZD

**Mabilisang Sanggunian para sa Lahat ng Kabanata**
- **📚 Course Home**: [AZD Para sa mga Nagsisimula](../README.md)
- **📖 Quick Start**: [Kabanata 1: Pundasyon at Mabilisang Simula](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Kabanata 2: Pag-develop na Nauuna ang AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduksyon

Ang komprehensibong cheat sheet na ito ay nagbibigay ng mabilisang sanggunian para sa mga pinaka-karaniwang ginagamit na Azure Developer CLI na mga utos, inayos ayon sa kategorya na may mga praktikal na halimbawa. Perpekto para sa mabilisang paghahanap habang nagde-develop, nagte-troubleshoot, at sa pang-araw-araw na operasyon ng mga proyektong azd.

## Mga Layunin sa Pagkatuto

Sa paggamit ng cheat sheet na ito, ikaw ay:
- Magkakaroon ng agarang access sa mga mahahalagang Azure Developer CLI na utos at sintaks
- Maaunawaan ang pag-oorganisa ng mga utos ayon sa mga kategoryang pang-funksyon at mga kaso ng paggamit
- Magkakaroon ng sanggunian ng mga praktikal na halimbawa para sa mga karaniwang senaryo ng pag-develop at deployment
- Makaka-access ng mga utos sa pag-troubleshoot para sa mabilisang pag-resolba ng mga isyu
- Mabilis na mahahanap ang mga advanced na opsyon sa konfigurasyon at pag-customize
- Matutukoy ang mga utos para sa pamamahala ng environment at mga workflow para sa maraming environment

## Mga Kakayahang Makakamit

Sa regular na pagsangguni sa cheat sheet na ito, makakaya mong:
- Isagawa ang mga azd na utos nang may kumpiyansa nang hindi na binabanggit ang buong dokumentasyon
- Mabilis na lutasin ang mga karaniwang isyu gamit ang angkop na mga diagnostic na utos
- Epektibong pamahalaan ang maraming environment at mga senaryo ng deployment
- I-apply ang mga advanced na feature ng azd at mga opsyon sa konfigurasyon ayon sa pangangailangan
- I-troubleshoot ang mga isyu sa deployment gamit ang sistematikong pagkakasunod-sunod ng mga utos
- I-optimize ang mga workflow sa pamamagitan ng epektibong paggamit ng mga shortcut at opsyon ng azd

## Mga Utos para Makapagsimula

### Pagpapatunay
```bash
# Mag-log in sa Azure gamit ang AZD
azd auth login

# Mag-log in sa Azure CLI (ginagamit ito ng AZD sa likod ng mga eksena)
az login

# Suriin ang kasalukuyang account
az account show

# Itakda ang default na subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Mag-log out mula sa AZD
azd auth logout

# Mag-log out mula sa Azure CLI
az logout
```

### Pagsisimula ng Proyekto
```bash
# Tingnan ang mga magagamit na template
azd template list

# Simulan mula sa template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Simulan sa kasalukuyang direktoryo
azd init .

# Simulan gamit ang pasadyang pangalan
azd init --template todo-nodejs-mongo my-awesome-app
```

## Pangunahing Mga Utos sa Deployment

### Buong Workflow ng Deployment
```bash
# I-deploy ang lahat (mag-provision at mag-deploy)
azd up

# I-deploy nang hindi nagpapakita ng mga prompt ng kumpirmasyon
azd up --confirm-with-no-prompt

# I-deploy sa tinukoy na environment
azd up --environment production

# I-deploy gamit ang mga pasadyang parameter
azd up --parameter location=westus2
```

### Para sa Infrastructure Lamang
```bash
# Mag-provision ng mga resource sa Azure
azd provision

# 🧪 I-preview ang mga pagbabago sa imprastruktura
azd provision --preview
# Ipinapakita ang dry-run na view kung aling mga resource ang malilikha/mababago/matatanggal
# Katulad ng 'terraform plan' o 'bicep what-if' - ligtas patakbuhin, walang pagbabago na iaaplay.
```

### Para sa Aplikasyon Lamang
```bash
# I-deploy ang code ng aplikasyon
azd deploy

# I-deploy ang partikular na serbisyo
azd deploy --service web
azd deploy --service api

# I-deploy ang lahat ng serbisyo
azd deploy --all
```

### Pagbuo at Pag-package
```bash
# Bumuo ng mga aplikasyon
azd package

# Bumuo ng partikular na serbisyo
azd package --service api
```

## 🌍 Pamamahala ng Environment

### Mga Operasyon ng Environment
```bash
# Ilista ang lahat ng mga kapaligiran
azd env list

# Lumikha ng bagong kapaligiran
azd env new development
azd env new staging --location westus2

# Pumili ng kapaligiran
azd env select production

# Ipakita ang kasalukuyang kapaligiran
azd env show

# I-refresh ang estado ng kapaligiran
azd env refresh
```

### Mga Variable ng Environment
```bash
# Itakda ang variable ng kapaligiran
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Kunin ang variable ng kapaligiran
azd env get API_KEY

# Ilista lahat ng mga variable ng kapaligiran
azd env get-values

# Alisin ang variable ng kapaligiran
azd env unset DEBUG
```

## ⚙️ Mga Utos ng Konfigurasyon

### Global na Konfigurasyon
```bash
# Ilista ang lahat ng konfigurasyon
azd config list

# Itakda ang mga default na pangkalahatan
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Alisin ang konfigurasyon
azd config unset defaults.location

# I-reset ang lahat ng konfigurasyon
azd config reset
```

### Konfigurasyon ng Proyekto
```bash
# I-validate ang azure.yaml
azd config validate

# Ipakita ang impormasyon ng proyekto
azd show

# Kunin ang mga endpoint ng serbisyo
azd show --output json
```

## 📊 Pagmo-monitor at Diagnostiko

### Dashboard ng Monitoring
```bash
# Buksan ang monitoring dashboard ng Azure portal
azd monitor

# Buksan ang live na metrics ng Application Insights
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
# I-access ang Log Analytics sa Azure Portal
azd monitor --logs

# I-query ang mga log gamit ang Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Mga Utos sa Pagpapanatili

### Paglilinis
```bash
# Alisin ang lahat ng resource ng Azure
azd down

# Pilit na tanggalin nang walang kumpirmasyon
azd down --force

# Tuluyang burahin ang mga soft-deleted na resource
azd down --purge

# Kumpletong paglilinis
azd down --force --purge
```

### Mga Pag-update
```bash
# Suriin kung may mga update para sa azd
azd version

# Kunin ang kasalukuyang bersyon
azd version

# Tingnan ang kasalukuyang konfigurasyon
azd config list
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

### Pamamahala ng Infrastructure
```bash
# Gumawa ng mga template ng imprastruktura
azd infra generate

# 🧪 Paunang Pagsusuri at Pagpaplano ng Imprastruktura
azd provision --preview
# Ginagaya ang paglalaan ng imprastruktura nang hindi nagde-deploy
# Sinusuri ang mga template ng Bicep/Terraform at ipinapakita:
# - Mga resource na idadagdag (berde +)
# - Mga resource na babaguhin (dilaw ~)
# - Mga resource na tatanggalin (pula -)
# Ligtas patakbuhin - walang aktwal na pagbabago sa kapaligiran ng Azure

# Buuin ang imprastruktura mula sa azure.yaml
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
# Ilista ang lahat ng magagamit na extension (kasama na ang AI)
azd extension list

# I-install ang extension ng Foundry Agents
azd extension install azure.ai.agents

# I-install ang extension para sa fine-tuning
azd extension install azure.ai.finetune

# I-install ang extension para sa mga custom model
azd extension install azure.ai.models

# I-upgrade ang lahat ng naka-install na extension
azd extension upgrade --all
```

### Mga Utos ng Ahente ng AI
```bash
# I-initialize ang isang proyekto ng agent mula sa manifest
azd ai agent init -m <manifest-path-or-uri>

# Ituon sa isang partikular na proyekto ng Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Tukuyin ang direktoryo ng pinagmulan ng agent
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pumili ng target para sa pagho-host
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Simulan ang MCP server para sa iyong proyekto
azd mcp start

# Pamahalaan ang pahintulot ng tool para sa mga operasyon ng MCP
azd mcp consent
```

### Pagbuo ng Infrastructure
```bash
# Gumawa ng mga file ng IaC mula sa iyong paglalarawan ng proyekto
azd infra generate

# Buuin ang imprastruktura mula sa azure.yaml
azd infra synth
```

---

## 🎯 Mabilis na Workflow

### Workflow ng Pag-develop
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

### Workflow para sa Maramihang Environment
```bash
# Ihanda ang mga kapaligiran
azd env new dev
azd env new staging  
azd env new production

# I-deploy sa dev
azd env select dev
azd up

# Subukan at ilipat sa staging
azd env select staging
azd up

# I-deploy sa produksyon
azd env select production
azd up
```

### Workflow ng Pag-troubleshoot
```bash
# Paganahin ang debug mode
export AZD_DEBUG=true

# Suriin ang katayuan ng deployment
azd show

# Patunayan ang konfigurasyon
azd config list

# Buksan ang dashboard ng pagmamanman para sa mga log
azd monitor --logs

# Suriin ang katayuan ng mga resource
azd show --output json
```

## 🔍 Mga Utos para sa Debugging

### Impormasyon sa Debug
```bash
# Paganahin ang output ng debug
export AZD_DEBUG=true
azd <command> --debug

# Patayin ang telemetry para sa mas malinis na output
export AZD_DISABLE_TELEMETRY=true

# Suriin ang kasalukuyang konfigurasyon
azd config list

# Suriin ang katayuan ng awtentikasyon
az account show
```

### Pag-debug ng Template
```bash
# Ilista ang mga magagamit na template kasama ang mga detalye
azd template list --output json

# Ipakita ang impormasyon ng template
azd template show <template-name>

# I-validate ang template bago i-initialize
azd template validate <template-name>
```

## 📁 Mga Utos sa File at Direktorio

### Estruktura ng Proyekto
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

### Output na JSON
```bash
# Kumuha ng JSON output para sa scripting
azd show --output json
azd env list --output json
azd config list --output json

# I-parse gamit ang jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output na Tabla
```bash
# I-format bilang talahanayan
azd env list --output table

# Tingnan ang mga naka-deploy na serbisyo
azd show --output json | jq '.services | keys'
```

## 🔧 Mga Karaniwang Kombinasyon ng Utos

### Script ng Health Check
```bash
#!/bin/bash
# Mabilis na pagsusuri sa kalusugan
azd show
azd env show
azd monitor --logs
```

### Pagpapatunay ng Deployment
```bash
#!/bin/bash
# Pagpapatunay bago i-deploy
azd show
azd provision --preview  # I-preview ang mga pagbabago bago i-deploy
az account show
```

### Paghahambing ng Mga Environment
```bash
#!/bin/bash
# Ihambing ang mga kapaligiran
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script para sa Paglilinis ng Resource
```bash
#!/bin/bash
# Linisin ang mga lumang kapaligiran
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Mga Variable ng Environment

### Mga Karaniwang Variable ng Environment
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

## 🚨 Mga Utos Pang-emergency

### Mabilisang Pag-aayos
```bash
# I-reset ang awtentikasyon
az account clear
az login

# Ipilit ang pag-refresh ng kapaligiran
azd env refresh

# Muling i-deploy ang lahat ng serbisyo
azd deploy

# Suriin ang katayuan ng pag-deploy
azd show --output json
```

### Mga Utos para sa Pag-recover
```bash
# Mabawi mula sa nabigong deployment - linisin at i-deploy muli
azd down --force --purge
azd up

# Muling mag-provision ng imprastruktura lamang
azd provision

# I-deploy muli ang aplikasyon lamang
azd deploy
```

## 💡 Mga Pro Tips

### Mga Alias para sa Mas Mabilis na Workflow
```bash
# Idagdag sa iyong .bashrc o .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Mga Shortcut ng Function
```bash
# Mabilis na pagpapalit ng kapaligiran
azd-env() {
    azd env select $1 && azd show
}

# Mabilis na pag-deploy na may pagsubaybay
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Katayuan ng kapaligiran
azd-status() {
    echo "Current environment:"
    azd env show
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

**Tip**: I-bookmark ang cheat sheet na ito at gamitin ang `Ctrl+F` para mabilis na hanapin ang mga utos na kailangan mo!

---

**Pag-navigate**
- **Nakaraang Aralin**: [Mga Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Susunod na Aralin**: [Glosaryo](glossary.md)

---

> **💡 Gusto mo ng tulong sa Azure na mga utos sa iyong editor?** I-install ang [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) sa pamamagitan ng `npx skills add microsoft/github-copilot-for-azure` — 37 skills para sa AI, Foundry, deployment, diagnostics, at iba pa.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin na ginawa ng tao. Hindi kami mananagot para sa anumang mga hindi pagkakaintindihan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->