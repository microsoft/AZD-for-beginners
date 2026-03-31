# Command Cheat Sheet - Mahahalagang Utos ng AZD

**Maikling Sanggunian para sa Lahat ng Kabanata**
- **📚 Home ng Kurso**: [AZD Para sa Mga Nagsisimula](../README.md)
- **📖 Mabilis na Pagsisimula**: [Kabanata 1: Pundasyon at Mabilis na Pagsisimula](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Mga Utos ng AI**: [Kabanata 2: Pag-unlad na Prayoridad ang AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Kabanata 4: Imprastruktura bilang Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduksyon

Ang komprehensibong cheat sheet na ito ay nagbibigay ng mabilisang sanggunian para sa mga pinaka-karaniwang ginagamit na Azure Developer CLI na mga utos, inayos ayon sa kategorya na may mga praktikal na halimbawa. Perpekto para sa mabilisang paghahanap habang nagde-develop, nag-troubleshoot, at sa pang-araw-araw na operasyon ng mga proyekto ng azd.

## Mga Layunin sa Pagkatuto

Sa paggamit ng cheat sheet na ito, ikaw ay:
- Magkakaroon ng agarang access sa mga mahalagang Azure Developer CLI na utos at syntax
- Mauunawaan ang organisasyon ng mga utos ayon sa mga kategorya at kaso ng paggamit
- Makakakita ng mga praktikal na halimbawa para sa mga karaniwang senaryo ng pag-develop at pag-deploy
- Makaka-access ng mga utos para sa pag-troubleshoot para sa mabilisang paglutas ng isyu
- Madadaliang makikita ang mga advanced na opsyon sa konfigurasyon at pag-customize
- Mahahanap ang mga utos para sa pamamahala ng environment at multi-environment na workflow

## Mga Kinalabasan ng Pagkatuto

Sa regular na paggamit ng cheat sheet na ito, magagawa mong:
- Isagawa ang mga utos ng azd nang may kumpiyansa nang hindi laging tumitingin sa buong dokumentasyon
- Mabilisang lutasin ang mga karaniwang problema gamit ang naaangkop na diagnostic na mga utos
- Mahusay na pamahalaan ang maramihang mga environment at mga senaryo ng pag-deploy
- I-apply ang mga advanced na tampok ng azd at mga opsyon sa konfigurasyon kapag kailangan
- I-troubleshoot ang mga isyu sa pag-deploy gamit ang sistematikong mga sunod-sunod na utos
- I-optimize ang mga workflow sa pamamagitan ng epektibong paggamit ng mga shortcut at opsyon ng azd

## Mga Utos para Makapagsimula

### Pagpapatunay
```bash
# Mag-login sa Azure gamit ang AZD
azd auth login

# Mag-login sa Azure CLI (ginagamit ito ng AZD sa likod ng mga eksena)
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

### Pag-inisyalisa ng Proyekto
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

## Pangunahing Mga Utos ng Pag-deploy

### Kumpletong Daloy ng Pag-deploy
```bash
# I-deploy ang lahat (mag-provision + mag-deploy)
azd up

# I-deploy nang hindi nagpapakita ng mga prompt ng kumpirmasyon
azd up --confirm-with-no-prompt

# I-deploy sa partikular na kapaligiran
azd up --environment production

# I-deploy na may mga pasadyang parameter
azd up --parameter location=westus2
```

### Imprastruktura Lamang
```bash
# Mag-provision ng mga Azure na resource
azd provision

# 🧪 I-preview ang mga pagbabago sa imprastruktura
azd provision --preview
# Ipinapakita ang dry-run na tanaw kung aling mga resource ang malilikha, mababago, o matatanggal
# Katulad ng 'terraform plan' o 'bicep what-if' - ligtas patakbuhin, walang pagbabago ang ilalapat
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

### Build at Package
```bash
# Bumuo ng mga aplikasyon
azd package

# Bumuo ng partikular na serbisyo
azd package --service api
```

## 🌍 Pamamahala ng Kapaligiran

### Mga Operasyon ng Kapaligiran
```bash
# Ilista ang lahat ng mga kapaligiran
azd env list

# Lumikha ng bagong kapaligiran
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

# Ilista ang lahat ng variable ng kapaligiran
azd env get-values

# Alisin ang variable ng kapaligiran
azd env unset DEBUG
```

## ⚙️ Mga Utos ng Konfigurasyon

### Global na Konfigurasyon
```bash
# Ilista ang lahat ng konfigurasyon
azd config show

# Itakda ang mga global na default
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

## 📊 Pagsubaybay at Diagnostiko

### Dashboard ng Pagsubaybay
```bash
# Buksan ang monitoring dashboard ng Azure portal
azd monitor

# Buksan ang live na sukatan ng Application Insights
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

# Tingnan ang mga log mula sa Azure Portal
azd monitor --logs
```

### Mga Query sa Log Analytics
```bash
# I-access ang Log Analytics sa Azure Portal
azd monitor --logs

# Mag-query ng mga log gamit ang Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Mga Utos sa Pagpapanatili

### Paglilinis
```bash
# Alisin ang lahat ng mga resource ng Azure
azd down

# Pilitin ang pagtanggal nang walang kumpirmasyon
azd down --force

# Tanggalin nang tuluyan ang mga soft-deleted na resource
azd down --purge

# Kumpletong paglilinis
azd down --force --purge
```

### Mga Pag-update
```bash
# Suriin para sa mga update ng azd
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

# 🧪 Paunang Tanaw at Pagpaplano ng Imprastruktura
azd provision --preview
# Gina-simulate ang pag-provision ng imprastruktura nang hindi ito dine-deploy
# Sinusuri ang mga template ng Bicep/Terraform at ipinapakita:
# - Mga resource na idadagdag (berde +)
# - Mga resource na babaguhin (dilaw ~)
# - Mga resource na tatanggalin (pula -)
# Ligtas patakbuhin - walang aktwal na pagbabago sa Azure environment

# Isintesis ang imprastruktura mula sa azure.yaml
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
# Ilista ang lahat ng magagamit na ekstensyon (kabilang ang AI)
azd extension list

# I-install ang ekstensyon ng Foundry agents
azd extension install azure.ai.agents

# I-install ang ekstensyon para sa fine-tuning
azd extension install azure.ai.finetune

# I-install ang ekstensyon para sa mga pasadyang modelo
azd extension install azure.ai.models

# I-upgrade ang lahat ng naka-install na ekstensyon
azd extension upgrade --all
```

### Mga Utos ng AI Agent
```bash
# Simulan ang proyekto ng ahente mula sa isang manipesto
azd ai agent init -m <manifest-path-or-uri>

# I-target ang isang partikular na proyekto ng Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Tukuyin ang direktoryo ng pinagmulan ng ahente
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pumili ng target para sa pagho-host
azd ai agent init -m agent-manifest.yaml --host containerapp
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
# Gumawa ng mga file ng IaC mula sa paglalarawan ng iyong proyekto
azd infra generate

# Buuin ang imprastruktura mula sa azure.yaml
azd infra synth
```

---

## 🎯 Mabilis na Daloy ng Trabaho

### Daloy ng Pag-unlad
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

### Daloy ng Multi-Kapaligiran
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

# I-deploy sa production
azd env select production
azd up
```

### Daloy ng Pag-troubleshoot
```bash
# Paganahin ang debug mode
export AZD_DEBUG=true

# Suriin ang katayuan ng deployment
azd show

# I-validate ang konfigurasyon
azd config show

# Buksan ang dashboard ng pagmamanman para sa mga log
azd monitor --logs

# Suriin ang katayuan ng mga mapagkukunan
azd show --output json
```

## 🔍 Mga Utos sa Pag-debug

### Impormasyon sa Debug
```bash
# Paganahin ang output ng debug
export AZD_DEBUG=true
azd <command> --debug

# Huwag paganahin ang telemetry para sa mas malinis na output
export AZD_DISABLE_TELEMETRY=true

# Suriin ang kasalukuyang konfigurasyon
azd config show

# Suriin ang katayuan ng awtentikasyon
az account show
```

### Pag-debug ng Template
```bash
# Ilista ang mga magagamit na template kasama ang mga detalye
azd template list --output json

# Ipakita ang impormasyon ng template
azd template show <template-name>

# Patunayan ang template bago mag-init
azd template validate <template-name>
```

## 📁 Mga Utos ng File at Direktoryo

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
# Kumuha ng JSON na output para sa scripting
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

## 🔧 Mga Karaniwang Kombinasyon ng Utos

### Script para sa Health Check
```bash
#!/bin/bash
# Mabilis na pagsusuri ng kalusugan
azd show
azd env get-values
azd monitor --logs
```

### Pagpapatunay ng Pag-deploy
```bash
#!/bin/bash
# Pagpapatunay bago i-deploy
azd show
azd provision --preview  # Suriin muna ang mga pagbabago bago i-deploy
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

### Mga Karaniwang Variable ng Kapaligiran
```bash
# Kumpigurasyon ng Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Kumpigurasyon ng AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Kumpigurasyon ng aplikasyon
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Mga Utos Pang-emergency

### Mabilis na Pag-aayos
```bash
# I-reset ang awtentikasyon
az account clear
az login

# Piliting i-refresh ang kapaligiran
azd env refresh

# I-deploy muli ang lahat ng serbisyo
azd deploy

# Suriin ang katayuan ng pag-deploy
azd show --output json
```

### Mga Utos sa Pagbawi
```bash
# Bumawi mula sa nabigong deployment - linisin at muling i-deploy
azd down --force --purge
azd up

# Muling i-provision lamang ang imprastruktura
azd provision

# Muling i-deploy lamang ang aplikasyon
azd deploy
```

## 💡 Mga Pro Tips

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
# Mabilis na pagpapalit ng kapaligiran
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

# Ipakita ang impormasyon ng bersyon at build
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

**Navigasyon**
- **Nakaraang Aralin**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Susunod na Aralin**: [Talaan ng Terminolohiya](glossary.md)

---

> **💡 Gusto ng tulong sa Azure commands sa iyong editor?** I-install ang [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) gamit ang `npx skills add microsoft/github-copilot-for-azure` — 37 skills para sa AI, Foundry, deployment, diagnostics, at iba pa.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI para sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman sinisikap naming maging tumpak ang pagsasalin, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di‑tumpak na bahagi. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa kritikal na impormasyon, inirerekomenda ang propesyunal na pagsasaling‑tao. Hindi kami mananagutan para sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->