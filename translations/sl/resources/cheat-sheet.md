# Command Cheat Sheet - Essential AZD Commands

**Quick Reference for All Chapters**
- **📚 Course Home**: [Domača stran tečaja](../README.md)
- **📖 Quick Start**: [Poglavje 1: Osnove in hiter začetek](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Poglavje 2: Razvoj, osredotočen na AI (priporočeno za AI razvijalce)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Poglavje 4: Infrastruktura kot koda](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Ta celovita priročnica z bližnjicami nudi hiter pregled najpogosteje uporabljenih ukazov Azure Developer CLI, organiziranih po kategorijah z praktičnimi primeri. Odlično za hitro iskanje med razvojem, odpravljanjem težav in vsakodnevnim delom z azd projekti.

## Learning Goals

Z uporabo te priročnice boste:
- Imeli takojšen dostop do osnovnih ukazov in sintakse Azure Developer CLI
- Razumeli organizacijo ukazov po funkcionalnih kategorijah in primerih uporabe
- Imeli reference praktičnih primerov za običajne razvojne in razmestitvene scenarije
- Dostopali do ukazov za odpravljanje težav za hitro reševanje težav
- Hitro našli napredne možnosti konfiguracije in prilagoditve
- Locirali ukaze za upravljanje okolij in poteke dela z več okolji

## Learning Outcomes

Z rednim sklicevanjem na to priročnico boste sposobni:
- Zaupanja vredno izvajati azd ukaze brez sklicevanja na popolno dokumentacijo
- Hitro rešiti pogoste težave z uporabo ustreznih diagnostičnih ukazov
- Učinkovito upravljati več okolij in scenarijev razmestitve
- Po potrebi uporabiti napredne funkcije azd in možnosti konfiguracije
- Odpravljati težave z razmestitvijo z uporabo sistematičnih zaporedij ukazov
- Optimizirati poteke dela z učinkovito uporabo azd bližnjic in možnosti

## Getting Started Commands

### Authentication
```bash
# Prijava v Azure prek AZD
azd auth login

# Prijava v Azure CLI (AZD to uporablja v ozadju)
az login

# Preveri trenutni račun
az account show

# Nastavi privzeto naročnino
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Odjava iz AZD
azd auth logout

# Odjava iz Azure CLI
az logout
```

### Project Initialization
```bash
# Brskaj med razpoložljivimi predlogami
azd template list

# Inicializiraj iz predloge
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializiraj v trenutni mapi
azd init .

# Inicializiraj z lastnim imenom
azd init --template todo-nodejs-mongo my-awesome-app
```

## Core Deployment Commands

### Complete Deployment Workflow
```bash
# Razmestite vse (zagotovitev virov + razmestitev)
azd up

# Razmestite z onemogočenimi pozivi za potrditev
azd up --confirm-with-no-prompt

# Razmestite v določeno okolje
azd up --environment production

# Razmestite s prilagojenimi parametri
azd up --parameter location=westus2
```

### Infrastructure Only
```bash
# Vzpostavi Azure vire
azd provision

# 🧪 Predogled sprememb infrastrukture
azd provision --preview
# Prikaže predogled brez izvedbe, kateri viri bi bili ustvarjeni/spremenjeni/izbrisani
# Podobno kot 'terraform plan' ali 'bicep what-if' - varno za zagon, spremembe se ne izvedejo
```

### Application Only
```bash
# Razmestite kodo aplikacije
azd deploy

# Razmestite določeno storitev
azd deploy --service web
azd deploy --service api

# Razmestite vse storitve
azd deploy --all
```

### Build and Package
```bash
# Sestavi aplikacije
azd package

# Sestavi določeno storitev
azd package --service api
```

## 🌍 Environment Management

### Environment Operations
```bash
# Prikaži vsa okolja
azd env list

# Ustvari novo okolje
azd env new development
azd env new staging --location westus2

# Izberi okolje
azd env select production

# Prikaži trenutno okolje
azd env show

# Osveži stanje okolja
azd env refresh
```

### Environment Variables
```bash
# Nastavi spremenljivko okolja
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Pridobi spremenljivko okolja
azd env get API_KEY

# Prikaži vse spremenljivke okolja
azd env get-values

# Odstrani spremenljivko okolja
azd env unset DEBUG
```

## ⚙️ Configuration Commands

### Global Configuration
```bash
# Prikaži vso konfiguracijo
azd config list

# Nastavi globalne privzete nastavitve
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Odstrani konfiguracijo
azd config unset defaults.location

# Ponastavi vso konfiguracijo
azd config reset
```

### Project Configuration
```bash
# Preveri azure.yaml
azd config validate

# Prikaži informacije o projektu
azd show

# Pridobi končne točke storitve
azd show --output json
```

## 📊 Monitoring and Diagnostics

### Monitoring Dashboard
```bash
# Odpri nadzorno ploščo za spremljanje v portalu Azure
azd monitor

# Odpri žive metrike Application Insights
azd monitor --live

# Odpri okno dnevnikov Application Insights
azd monitor --logs

# Odpri pregled Application Insights
azd monitor --overview
```

### Viewing Container Logs
```bash
# Ogled dnevnikov prek Azure CLI (za Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Spremljanje dnevnikov v realnem času
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Ogled dnevnikov v Azure portalu
azd monitor --logs
```

### Log Analytics Queries
```bash
# Dostop do Log Analytics prek Azure Portala
azd monitor --logs

# Poizvedovanje dnevnikov z uporabo Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Maintenance Commands

### Cleanup
```bash
# Odstrani vse Azure vire
azd down

# Prisili brisanje brez potrditve
azd down --force

# Trajno izbriši mehko izbrisane vire
azd down --purge

# Zaključi čiščenje
azd down --force --purge
```

### Updates
```bash
# Preveri posodobitve azd
azd version

# Pridobi trenutno različico
azd version

# Prikaži trenutno konfiguracijo
azd config list
```

## 🔧 Advanced Commands

### Pipeline and CI/CD
```bash
# Konfigurirajte GitHub Actions
azd pipeline config

# Konfigurirajte Azure DevOps
azd pipeline config --provider azdo

# Prikažite konfiguracijo cevovoda
azd pipeline show
```

### Infrastructure Management
```bash
# Ustvari predloge za infrastrukturo
azd infra generate

# 🧪 Predogled in načrtovanje infrastrukture
azd provision --preview
# Simulira zagotavljanje infrastrukture brez dejanske razmestitve
# Analizira Bicep/Terraform predloge in prikaže:
# - Viri, ki bodo dodani (zeleni +)
# - Viri, ki bodo spremenjeni (rumeni ~)
# - Viri, ki bodo izbrisani (rdeči -)
# Varno za zagon – v okolju Azure niso bile izvedene nobene dejanske spremembe

# Sinteziraj infrastrukturo iz azure.yaml
azd infra synth
```

### Project Information
```bash
# Pokaži stanje projekta in končne točke
azd show

# Pokaži podrobne informacije o projektu kot JSON
azd show --output json

# Pridobi končne točke storitve
azd show --output json | jq '.services'
```

## 🎯 Quick Workflows

### Development Workflow
```bash
# Začni nov projekt
azd init --template todo-nodejs-mongo
cd my-project

# Namesti v razvojno okolje
azd env new dev
azd up

# Naredi spremembe in ponovno namesti
azd deploy

# Odpri nadzorno ploščo za spremljanje
azd monitor --live
```

### Multi-Environment Workflow
```bash
# Nastavi okolja
azd env new dev
azd env new staging  
azd env new production

# Razporedi v razvojno okolje
azd env select dev
azd up

# Testiraj in promoviraj v predprodukcijsko okolje
azd env select staging
azd up

# Razporedi v produkcijsko okolje
azd env select production
azd up
```

### Troubleshooting Workflow
```bash
# Vklopi način za odpravljanje napak
export AZD_DEBUG=true

# Preveri stanje namestitve
azd show

# Preveri konfiguracijo
azd config list

# Odpri nadzorno ploščo za spremljanje dnevnikov
azd monitor --logs

# Preveri stanje virov
azd show --output json
```

## 🔍 Debugging Commands

### Debug Information
```bash
# Omogoči izpis za odpravljanje napak
export AZD_DEBUG=true
azd <command> --debug

# Onemogoči telemetrijo za čistejši izpis
export AZD_DISABLE_TELEMETRY=true

# Preveri trenutno konfiguracijo
azd config list

# Preveri stanje prijave
az account show
```

### Template Debugging
```bash
# Prikaži razpoložljive predloge s podrobnostmi
azd template list --output json

# Prikaži informacije o predlogi
azd template show <template-name>

# Preveri predlogo pred inicializacijo
azd template validate <template-name>
```

## 📁 File and Directory Commands

### Project Structure
```bash
# Prikaži trenutno strukturo imenikov
tree /f  # Windows
find . -type f  # Linux/macOS

# Pomaknite se v korenski imenik projekta azd
cd $(azd root)

# Prikaži imenik konfiguracije azd
echo $AZD_CONFIG_DIR  # Običajno ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# Pridobi izhod v JSON za skriptiranje
azd show --output json
azd env list --output json
azd config list --output json

# Razčleni z jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# Oblikuj kot tabelo
azd env list --output table

# Prikaži nameščene storitve
azd show --output json | jq '.services | keys'
```

## 🔧 Common Command Combinations

### Health Check Script
```bash
#!/bin/bash
# Hitro preverjanje stanja
azd show
azd env show
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# Preverjanje pred uvedbo
azd show
azd provision --preview  # Predogled sprememb pred uvajanjem
az account show
```

### Environment Comparison
```bash
#!/bin/bash
# Primerjaj okolja
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource Cleanup Script
```bash
#!/bin/bash
# Počisti stara okolja
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Environment Variables

### Common Environment Variables
```bash
# Konfiguracija Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Konfiguracija AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Konfiguracija aplikacije
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Emergency Commands

### Quick Fixes
```bash
# Ponastavi avtentikacijo
az account clear
az login

# Prisili osvežitev okolja
azd env refresh

# Ponovno razporedi vse storitve
azd deploy

# Preveri stanje razporeditve
azd show --output json
```

### Recovery Commands
```bash
# Obnovi po neuspešni uvedbi - očišči in ponovno uvedi
azd down --force --purge
azd up

# Ponovno zagotovi samo infrastrukturo
azd provision

# Ponovno uvedi samo aplikacijo
azd deploy
```

## 💡 Pro Tips

### Aliases for Faster Workflow
```bash
# Dodajte v svoj .bashrc ali .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcuts
```bash
# Hitro preklapljanje okolij
azd-env() {
    azd env select $1 && azd show
}

# Hitro uvajanje s spremljanjem
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Stanje okolja
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Help and Documentation

### Getting Help
```bash
# Splošna pomoč
azd --help
azd help

# Pomoč za določen ukaz
azd up --help
azd env --help
azd config --help

# Prikaži informacije o različici in gradnji
azd version
azd version --output json
```

### Documentation Links
```bash
# Odpri dokumentacijo v brskalniku
azd docs

# Prikaži dokumentacijo predloge
azd template show <template-name> --docs
```

---

**Nasvet**: Dodajte to priročnico med zaznamke in uporabite `Ctrl+F` za hitro iskanje ukazov, ki jih potrebujete!

---

**Navigation**
- **Previous Lesson**: [Preflight preverjanja](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Slovar](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za merodajen vir. Za ključne informacije priporočamo strokovni, človeški prevod. Nismo odgovorni za morebitne nesporazume ali napačne interpretacije, ki bi izhajale iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->