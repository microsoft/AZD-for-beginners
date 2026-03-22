# Ukazni priročnik - Osnovni AZD ukazi

**Hitra referenca za vse poglavja**
- **📚 Course Home**: [AZD za začetnike](../README.md)
- **📖 Quick Start**: [Poglavje 1: Temelj in hiter začetek](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Poglavje 2: AI-prvi razvoj](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Poglavje 4: Infrastruktura kot koda](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ta obsežen priročnik ponuja hitro referenco za najpogosteje uporabljene ukaze Azure Developer CLI, urejene po kategorijah z uporabnimi primeri. Idealno za hitro iskanje med razvojem, odpravljanjem napak in vsakodnevnimi opravili pri projektih azd.

## Cilji učenja

Z uporabo tega priročnika boste:
- Imeli takojšen dostop do ključnih ukazov in sintakse Azure Developer CLI
- Razumeli organizacijo ukazov po funkcionalnih kategorijah in primerih uporabe
- Se sklicevali na praktične primere za pogoste scenarije razvoja in nameščanja
- Dostopali do ukazov za odpravljanje težav za hitro reševanje težav
- Učinkovito našli napredne možnosti konfiguracije in prilagajanja
- Našli ukaze za upravljanje okolij in delovne tokove z več okolji

## Pričakovani rezultati učenja

S pogostim sklicevanjem na ta priročnik boste lahko:
- Zanesljivo izvajali azd ukaze brez nenehnega sklicevanja na celotno dokumentacijo
- Hitro reševali pogoste težave s primernimi diagnostičnimi ukazi
- Učinkovito upravljali več okolij in scenarijev nameščanja
- Po potrebi uporabljali napredne funkcije azd in možnosti konfiguracije
- Odpravljali težave pri nameščanju z uporabo sistematičnih zaporedij ukazov
- Optimizirali delovne tokove z učinkovito uporabo bližnjic in možnosti azd

## Ukazi za začetek

### Avtentikacija
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

### Inicializacija projekta
```bash
# Brskaj po razpoložljivih predlogah
azd template list

# Inicializiraj iz predloge
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializiraj v trenutni mapi
azd init .

# Inicializiraj s prilagojenim imenom
azd init --template todo-nodejs-mongo my-awesome-app
```

## Osnovni ukazi za nameščanje

### Celoten delovni tok nameščanja
```bash
# Namesti vse (priprava + namestitev)
azd up

# Namesti z onemogočenimi potrditvenimi pozivi
azd up --confirm-with-no-prompt

# Namesti v določeno okolje
azd up --environment production

# Namesti s prilagojenimi parametri
azd up --parameter location=westus2
```

### Samo infrastruktura
```bash
# Priskrbi vire v Azure
azd provision

# 🧪 Predogled sprememb infrastrukture
azd provision --preview
# Prikaže poskusni predogled, kateri viri bi bili ustvarjeni, spremenjeni ali izbrisani
# Podobno kot 'terraform plan' ali 'bicep what-if' - varno za zagon, spremembe ne bodo izvedene
```

### Samo aplikacija
```bash
# Namestite kodo aplikacije
azd deploy

# Namestite določeno storitev
azd deploy --service web
azd deploy --service api

# Namestite vse storitve
azd deploy --all
```

### Sestavljanje in pakiranje
```bash
# Sestavi aplikacije
azd package

# Sestavi določeno storitev
azd package --service api
```

## 🌍 Upravljanje okolij

### Operacije okolij
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

### Spremenljivke okolja
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

## ⚙️ Ukazi za konfiguracijo

### Globalna konfiguracija
```bash
# Prikaži vso konfiguracijo
azd config list

# Nastavi globalne privzete vrednosti
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Odstrani konfiguracijo
azd config unset defaults.location

# Ponastavi vso konfiguracijo
azd config reset
```

### Konfiguracija projekta
```bash
# Preveri azure.yaml
azd config validate

# Prikaži informacije o projektu
azd show

# Pridobi končne točke storitev
azd show --output json
```

## 📊 Nadzor in diagnostika

### Nadzorna plošča
```bash
# Odpri nadzorno ploščo za spremljanje v Azure portalu
azd monitor

# Odpri žive meritve Application Insights
azd monitor --live

# Odpri panel z dnevniki Application Insights
azd monitor --logs

# Odpri pregled Application Insights
azd monitor --overview
```

### Ogled dnevnikov vsebnikov
```bash
# Ogled dnevnikov prek Azure CLI (za Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Spremljanje dnevnikov v realnem času
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Ogled dnevnikov v portalu Azure
azd monitor --logs
```

### Poizvedbe Log Analytics
```bash
# Dostopajte do Log Analytics prek Azure portala
azd monitor --logs

# Poizvedujte v dnevnikih z uporabo Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Ukazi za vzdrževanje

### Čiščenje
```bash
# Odstranite vse vire v Azure
azd down

# Prisili brisanje brez potrditve
azd down --force

# Trajno izbrišite mehko izbrisane vire
azd down --purge

# Popolno čiščenje
azd down --force --purge
```

### Posodobitve
```bash
# Preveri posodobitve za azd
azd version

# Pridobi trenutno različico
azd version

# Prikaži trenutno konfiguracijo
azd config list
```

## 🔧 Napredni ukazi

### Pipeline in CI/CD
```bash
# Konfiguriraj GitHub Actions
azd pipeline config

# Konfiguriraj Azure DevOps
azd pipeline config --provider azdo

# Prikaži konfiguracijo cevovoda
azd pipeline show
```

### Upravljanje infrastrukture
```bash
# Ustvari predloge za infrastrukturo
azd infra generate

# 🧪 Predogled in načrtovanje infrastrukture
azd provision --preview
# Simulira vzpostavitev infrastrukture brez uvajanja
# Analizira Bicep/Terraform predloge in prikaže:
# - Viri, ki bodo dodani (zeleno +)
# - Viri, ki bodo spremenjeni (rumeno ~)
# - Viri, ki bodo izbrisani (rdeče -)
# Varen za izvajanje - v Azure okolju ne pride do dejanskih sprememb

# Sinteziraj infrastrukturo iz azure.yaml
azd infra synth
```

### Informacije o projektu
```bash
# Prikaži stanje projekta in končne točke
azd show

# Prikaži podrobne informacije o projektu v formatu JSON
azd show --output json

# Pridobi končne točke storitve
azd show --output json | jq '.services'
```

## 🤖 Ukazi za AI in razširitve

### Razširitve AZD
```bash
# Našteti vse razpoložljive razširitve (vključno z AI)
azd extension list

# Namesti razširitev Foundry Agents
azd extension install azure.ai.agents

# Namesti razširitev za fino prilagajanje
azd extension install azure.ai.finetune

# Namesti razširitev za prilagojene modele
azd extension install azure.ai.models

# Posodobi vse nameščene razširitve
azd extension upgrade --all
```

### Ukazi AI agentov
```bash
# Inicializiraj projekt agenta iz manifesta
azd ai agent init -m <manifest-path-or-uri>

# Usmeri na določen Foundry projekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Določi izvorni imenik agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Izberi ciljno gostovanje
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP strežnik (alfa)
```bash
# Zaženi MCP strežnik za vaš projekt
azd mcp start

# Upravljaj soglasje orodja za operacije MCP
azd mcp consent
```

### Generiranje infrastrukture
```bash
# Ustvari datoteke IaC iz definicije vašega projekta
azd infra generate

# Sestavi infrastrukturo iz datoteke azure.yaml
azd infra synth
```

---

## 🎯 Hitri delovni tokovi

### Razvojni delovni tok
```bash
# Začni nov projekt
azd init --template todo-nodejs-mongo
cd my-project

# Razporedi v razvojno okolje
azd env new dev
azd up

# Naredi spremembe in ponovno razporedi
azd deploy

# Odpri nadzorno ploščo za spremljanje
azd monitor --live
```

### Delovni tok z več okolji
```bash
# Nastavi okolja
azd env new dev
azd env new staging  
azd env new production

# Razporedi v razvojno okolje
azd env select dev
azd up

# Preizkusi in promoviraj v pripravno okolje
azd env select staging
azd up

# Razporedi v produkcijsko okolje
azd env select production
azd up
```

### Delovni tok za odpravljanje težav
```bash
# Omogoči način odpravljanja napak
export AZD_DEBUG=true

# Preveri stanje nameščanja
azd show

# Preveri veljavnost konfiguracije
azd config list

# Odpri nadzorno ploščo za spremljanje dnevnikov
azd monitor --logs

# Preveri stanje virov
azd show --output json
```

## 🔍 Ukazi za odpravljanje napak

### Informacije za odpravljanje napak
```bash
# Omogoči razhroščevalni izpis
export AZD_DEBUG=true
azd <command> --debug

# Onemogoči telemetrijo za čistejši izpis
export AZD_DISABLE_TELEMETRY=true

# Preveri trenutno konfiguracijo
azd config list

# Preveri stanje avtentikacije
az account show
```

### Odpravljanje napak predlog
```bash
# Prikaži razpoložljive predloge s podrobnostmi
azd template list --output json

# Prikaži informacije o predlogi
azd template show <template-name>

# Preveri predlogo pred inicializacijo
azd template validate <template-name>
```

## 📁 Ukazi za datoteke in imenike

### Struktura projekta
```bash
# Prikaži trenutno strukturo imenikov
tree /f  # Windows
find . -type f  # Linux/macOS

# Pojdi v korensko mapo projekta azd
cd $(azd root)

# Prikaži imenik konfiguracije azd
echo $AZD_CONFIG_DIR  # Običajno ~/.azd
```

## 🎨 Oblikovanje izhoda

### JSON izhod
```bash
# Pridobi izhod v formatu JSON za skriptiranje
azd show --output json
azd env list --output json
azd config list --output json

# Razčleni z jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Izhod v tabeli
```bash
# Oblikuj kot tabelo
azd env list --output table

# Prikaži nameščene storitve
azd show --output json | jq '.services | keys'
```

## 🔧 Pogoste kombinacije ukazov

### Skripta za preverjanje stanja
```bash
#!/bin/bash
# Hitro preverjanje stanja
azd show
azd env show
azd monitor --logs
```

### Validacija nameščanja
```bash
#!/bin/bash
# Preverjanje pred uvajanjem
azd show
azd provision --preview  # Predogled sprememb pred uvajanjem
az account show
```

### Primerjava okolij
```bash
#!/bin/bash
# Primerjaj okolja
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skripta za čiščenje virov
```bash
#!/bin/bash
# Počisti stara okolja
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Spremenljivke okolja

### Pogoste spremenljivke okolja
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

## 🚨 Nujni ukazi

### Hitre popravke
```bash
# Ponastavi avtentikacijo
az account clear
az login

# Prisili osvežitev okolja
azd env refresh

# Ponovno razporedi vse storitve
azd deploy

# Preveri stanje nameščanja
azd show --output json
```

### Ukazi za obnovitev
```bash
# Obnovite po neuspelem uvajanju - očistite in ponovno uvedite
azd down --force --purge
azd up

# Ponovno zagotovite samo infrastrukturo
azd provision

# Ponovno namestite samo aplikacijo
azd deploy
```

## 💡 Profesionalni nasveti

### Alias-i za hitrejši delovni tok
```bash
# Dodajte v svojo .bashrc ali .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Bližnjice funkcij
```bash
# Hitro preklapljanje med okolji
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

## 📖 Pomoč in dokumentacija

### Pridobivanje pomoči
```bash
# Splošna pomoč
azd --help
azd help

# Pomoč za posamezen ukaz
azd up --help
azd env --help
azd config --help

# Prikaži informacije o različici in gradnji
azd version
azd version --output json
```

### Povezave na dokumentacijo
```bash
# Odpri dokumentacijo v brskalniku
azd docs

# Prikaži dokumentacijo predloge
azd template show <template-name> --docs
```

---

**Nasvet**: Dodajte ta priročnik med zaznamke in uporabite `Ctrl+F` za hitro iskanje ukazov, ki jih potrebujete!

---

**Navigacija**
- **Prejšnja lekcija**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Naslednja lekcija**: [Slovar](glossary.md)

---

> **💡 Bi radi pomoč pri Azure ukazih v vašem urejevalniku?** Namestite [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) z `npx skills add microsoft/github-copilot-for-azure` — 37 spretnosti za AI, Foundry, nameščanje, diagnostiko in drugo.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za verodostojen vir. Za kritične informacije priporočamo strokovni prevod, opravljen s strani človeškega prevajalca. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->