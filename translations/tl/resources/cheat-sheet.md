# Command Cheat Sheet - Mahalagang Mga Utos ng AZD

**Mabilis na Sanggunian para sa Lahat ng Kabanata**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../README.md)
- **📖 Mabilis na Pagsisimula**: [Kabanata 1: Pundasyon at Mabilis na Pagsisimula](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Mga Utos ng AI**: [Kabanata 2: Pag-unlad na Unahin ang AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Kabanata 4: Imprastruktura bilang Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Panimula

Ang komprehensibong cheat sheet na ito ay nagbibigay ng mabilisang sanggunian para sa mga pinaka-karaniwang ginagamit na Azure Developer CLI na mga utos, inayos ayon sa kategorya na may praktikal na mga halimbawa. Perpekto para sa mabilisang paghahanap habang nagde-develop, nag-troubleshoot, at sa pang-araw-araw na operasyon ng mga azd na proyekto.

## Mga Layunin sa Pagkatuto

Sa paggamit ng cheat sheet na ito, ikaw ay:
- Magkakaroon ng agarang akses sa mahahalagang Azure Developer CLI na mga utos at sintaks
- Mauunawaan ang pag-aayos ng mga utos ayon sa mga kategoryang pang-funksyon at mga gamit
- Makakakuha ng mga praktikal na halimbawa para sa mga karaniwang senaryo ng pag-develop at pag-deploy
- Makakakuha ng akses sa mga utos para sa troubleshooting para sa mabilisang pagresolba ng mga isyu
- Mabilis na mahahanap ang mga advanced na opsyon sa konfigurasyon at pag-customize
- Matutunton ang pamamahala ng environment at mga utos para sa multi-environment workflow

## Mga Kinalabasan ng Pagkatuto

Sa regular na paggamit ng cheat sheet na ito, ikaw ay magagawang:
- Isakatuparan ang mga azd na utos nang may kumpiyansa nang hindi na kumukunsulta sa buong dokumentasyon
- Mabilis na lutasin ang mga karaniwang isyu gamit ang angkop na mga diagnostic na utos
- Epektibong pamahalaan ang maramihang environment at mga senaryo ng pag-deploy
- Ipatupad ang mga advanced na tampok ng azd at mga opsyon sa konfigurasyon ayon sa kailangan
- I-troubleshoot ang mga isyu sa pag-deploy gamit ang sistematikong pagkakasunod ng mga utos
- I-optimize ang mga workflow sa pamamagitan ng mabisang paggamit ng mga shortcut at opsyon ng azd

## Mga Utos para sa Pagsisimula

### Awentikasyon
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
# I-deploy ang lahat (provision + deploy)
azd up

# I-deploy na naka-disable ang mga prompt ng kumpirmasyon
azd up --confirm-with-no-prompt

# I-deploy sa partikular na kapaligiran
azd up --environment production

# I-deploy gamit ang pasadyang mga parameter
azd up --parameter location=westus2
```

### Imprastruktura Lamang
```bash
# Mag-provision ng mga resource sa Azure
azd provision

# 🧪 I-preview ang mga pagbabago sa imprastruktura
azd provision --preview
# Ipinapakita ang dry-run na tanawin kung anong mga resource ang malilikha, mababago, o matatanggal
# Kahawig ng 'terraform plan' o 'bicep what-if' — ligtas patakbuhin, walang pagbabago ang ilalapat
```

### Aplikasyon Lamang
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

# Bumuo ng tiyak na serbisyo
azd package --service api
```

## 🌍 Pamamahala ng Environment

### Mga Operasyon ng Environment
```bash
# Ilista ang lahat ng kapaligiran
azd env list

# Gumawa ng bagong kapaligiran
azd env new development
azd env new staging --location westus2

# Piliin ang kapaligiran
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

# Ilista ang lahat ng mga variable ng kapaligiran
azd env get-values

# Alisin ang variable ng kapaligiran
azd env unset DEBUG
```

## ⚙️ Mga Utos ng Konfigurasyon

### Global na Konfigurasyon
```bash
# Ilista ang lahat ng mga konfigurasyon
azd config list

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

## 📊 Pagmo-monitor at Diagnostiko

### Dashboard ng Pagmo-monitor
```bash
# Buksan ang dashboard ng pagsubaybay sa Azure portal
azd monitor

# Buksan ang live na metrics ng Application Insights
azd monitor --live

# Buksan ang blade ng mga log ng Application Insights
azd monitor --logs

# Buksan ang pangkalahatang-ideya ng Application Insights
azd monitor --overview
```

### Pagtingin sa Mga Logs ng Container
```bash
# Tingnan ang mga log gamit ang Azure CLI (para sa Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Sundan ang mga log nang real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Tingnan ang mga log mula sa Azure Portal
azd monitor --logs
```

### Mga Query ng Log Analytics
```bash
# I-access ang Log Analytics sa Azure Portal
azd monitor --logs

# Mag-query ng mga log gamit ang Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Mga Utos para sa Pangangalaga

### Paglilinis
```bash
# Tanggalin ang lahat ng mga resource ng Azure
azd down

# Puwersahang tanggalin nang walang kumpirmasyon
azd down --force

# Permanenteng tanggalin ang mga soft-deleted na resource
azd down --purge

# Ganap na paglilinis
azd down --force --purge
```

### Mga Update
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

### Pamamahala ng Imprastruktura
```bash
# Gumawa ng mga template ng imprastruktura
azd infra generate

# 🧪 Paunang Pagtingin at Pagpaplano ng Imprastruktura
azd provision --preview
# Gina-gaya ang pag-provision ng imprastruktura nang hindi ito ide-deploy
# Sinusuri ang mga template ng Bicep/Terraform at ipinapakita:
# - Mga resource na idaragdag (berde +)
# - Mga resource na babaguhin (dilaw ~)
# - Mga resource na tatanggalin (pula -)
# Ligtas patakbuhin - walang aktwal na pagbabago na gagawin sa kapaligiran ng Azure

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

## 🎯 Mabilis na Mga Workflow

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

# Subukan at i-promote sa staging
azd env select staging
azd up

# I-deploy sa produksyon
azd env select production
azd up
```

### Workflow para sa Troubleshooting
```bash
# Paganahin ang debug mode
export AZD_DEBUG=true

# Suriin ang katayuan ng deployment
azd show

# I-validate ang konfigurasyon
azd config list

# Buksan ang dashboard ng pagmamanman para sa mga log
azd monitor --logs

# Suriin ang katayuan ng mga resource
azd show --output json
```

## 🔍 Mga Utos para sa Debugging

### Impormasyon para sa Debug
```bash
# Paganahin ang output ng debug
export AZD_DEBUG=true
azd <command> --debug

# I-disable ang telemetry para sa mas malinis na output
export AZD_DISABLE_TELEMETRY=true

# Suriin ang kasalukuyang konfigurasyon
azd config list

# Suriin ang katayuan ng pagpapatunay
az account show
```

### Debugging ng Template
```bash
# Ilista ang mga magagamit na template kasama ang mga detalye
azd template list --output json

# Ipakita ang impormasyon ng template
azd template show <template-name>

# Beripikahin ang template bago i-init
azd template validate <template-name>
```

## 📁 Mga Utos para sa File at Directory

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
azd config list --output json

# I-parse gamit ang jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output sa Talahanayan
```bash
# I-format bilang talahanayan
azd env list --output table

# Tingnan ang mga naka-deploy na serbisyo
azd show --output json | jq '.services | keys'
```

## 🔧 Karaniwang Kombinasyon ng Mga Utos

### Script para sa Health Check
```bash
#!/bin/bash
# Mabilis na pagsusuri sa kalusugan
azd show
azd env show
azd monitor --logs
```

### Pagpapatunay ng Pag-deploy
```bash
#!/bin/bash
# Pagpapatunay bago i-deploy
azd show
azd provision --preview  # I-preview ang mga pagbabago bago i-deploy
az account show
```

### Paghahambing ng Environment
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

### Mga Utos para sa Pagbawi
```bash
# Mabawi mula sa nabigong deployment - linisin at muling i-deploy
azd down --force --purge
azd up

# Muling i-provision ang imprastruktura lamang
azd provision

# Muling i-deploy ang aplikasyon lamang
azd deploy
```

## 💡 Mga Pro Tip

### Mga Alias para sa Mas Mabilis na Workflow
```bash
# Idagdag sa iyong .bashrc o .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Mga Shortcut para sa Mga Function
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

# Tulong na tukoy sa utos
azd up --help
azd env --help
azd config --help

# Ipakita ang impormasyon tungkol sa bersyon at pagbuo
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
- **Nakaraang Aralin**: [Mga Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Susunod na Aralin**: [Glosaryo](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong salin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na impormasyon. Ang orihinal na dokumento sa katutubong wika nito ang dapat ituring na awtoritatibong pinagkukunan. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling‑tao. Hindi kami mananagot sa anumang hindi pagkakaintindihan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->