# Hitri priročnik ukazov - Ključni AZD ukazi

**Hitri priročnik za vse poglavja**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Hiter začetek**: [Poglavje 1: Osnove in hiter začetek](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ukazi**: [Poglavje 2: Razvoj, osredotočen na AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Napredno**: [Poglavje 4: Infrastruktura kot koda](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ta obsežen hitri priročnik ponuja hiter pregled najpogosteje uporabljenih ukazov Azure Developer CLI, urejenih po kategorijah z praktičnimi primeri. Popoln za hitro iskanje med razvojem, odpravljanjem težav in vsakodnevnimi opravili pri projektih azd.

## Cilji učenja

Z uporabo tega hitrega priročnika boste:
- Imeli takojšen dostop do bistvenih ukazov Azure Developer CLI in njihove sintakse
- Razumeli organizacijo ukazov po funkcionalnih kategorijah in primerih uporabe
- Se sklicevali na praktične primere za običajne scenarije razvoja in nameščanja
- Dostopali do ukazov za odpravljanje težav za hitro rešitev težav
- Našli napredne možnosti konfiguracije in prilagajanja učinkovito
- Lokirali ukaze za upravljanje okolij in delovne tokove z več okolji

## Pričakovani rezultati učenja

Z rednim sklicevanjem na ta hitri priročnik boste lahko:
- Izvajali azd ukaze samozavestno brez sklicevanja na celotno dokumentacijo
- Hitro reševali pogoste težave z uporabo ustreznih diagnostičnih ukazov
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

# Inicializiraj z lastnim imenom
azd init --template todo-nodejs-mongo my-awesome-app
```

## Osnovni ukazi za nameščanje

### Celoten potek nameščanja
```bash
# Razmestitev vsega (zagotovitev virov + namestitev)
azd up

# Razmestitev z onemogočenimi potrditvenimi pozivi
azd up --confirm-with-no-prompt

# Razmestitev v določeno okolje
azd up --environment production

# Razmestitev s prilagojenimi parametri
azd up --parameter location=westus2
```

### Samo infrastruktura
```bash
# Uvedba Azure virov
azd provision

# 🧪 Predogled sprememb infrastrukture
azd provision --preview
# Prikaže pogled v suhem zagonu, kateri viri bi bili ustvarjeni, spremenjeni ali izbrisani
# Podobno kot 'terraform plan' ali 'bicep what-if' - varno za zagon, spremembe se ne izvedejo
```

### Samo aplikacija
```bash
# Razmestiti kodo aplikacije
azd deploy

# Razmestiti določeno storitev
azd deploy --service web
azd deploy --service api

# Razmestiti vse storitve
azd deploy --all
```

### Gradnja in pakiranje
```bash
# Zgradi aplikacije
azd package

# Zgradi določeno storitev
azd package --service api
```

## 🌍 Upravljanje okolij

### Operacije okolij
```bash
# Naštej vsa okolja
azd env list

# Ustvari novo okolje
azd env new development
azd env new staging --location westus2

# Izberi okolje
azd env select production

# Prikaži razpoložljiva okolja
azd env list

# Osveži stanje okolja
azd env refresh
```

### Spremenljivke okolja
```bash
# Nastavi okoljsko spremenljivko
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Pridobi okoljsko spremenljivko
azd env get API_KEY

# Prikaži vse okoljske spremenljivke
azd env get-values

# Odstrani okoljsko spremenljivko
azd env unset DEBUG
```

## ⚙️ Ukazi za konfiguracijo

### Globalna konfiguracija
```bash
# Prikaži vse konfiguracije
azd config show

# Nastavi globalne privzete nastavitve
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Odstrani konfiguracijo
azd config unset defaults.location

# Ponastavi vse konfiguracije
azd config reset
```

### Konfiguracija projekta
```bash
# Preveri azure.yaml
azd config validate

# Prikaži informacije o projektu
azd show

# Pridobi končne točke storitve
azd show --output json
```

## 📊 Nadzor in diagnostika

### Nadzorna plošča
```bash
# Odpri nadzorno ploščo za spremljanje v Azure portalu
azd monitor

# Odpri metrike v realnem času za Application Insights
azd monitor --live

# Odpri okno z dnevniki za Application Insights
azd monitor --logs

# Odpri pregled za Application Insights
azd monitor --overview
```

### Ogled dnevnikov kontejnerjev
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
# Dostop do Log Analytics prek Azure portala
azd monitor --logs

# Poizvedujte po dnevnikih z Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Ukazi za vzdrževanje

### Čiščenje
```bash
# Odstranite vse vire v storitvi Azure
azd down

# Prisilno izbrišite brez potrditve
azd down --force

# Trajno odstranite vire, ki so začasno izbrisani
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
azd config show
```

## 🔧 Napredni ukazi

### Pipeline in CI/CD
```bash
# Konfigurirajte GitHub Actions
azd pipeline config

# Konfigurirajte Azure DevOps
azd pipeline config --provider azdo

# Prikažite konfiguracijo cevovoda
azd pipeline show
```

### Upravljanje infrastrukture
```bash
# Ustvari predloge infrastrukture
azd infra generate

# 🧪 Predogled infrastrukture in načrtovanje
azd provision --preview
# Simulira zagotavljanje infrastrukture brez dejanske razmestitve
# Analizira predloge Bicep/Terraform in prikazuje:
# - Viri, ki bodo dodani (zeleno +)
# - Viri, ki bodo spremenjeni (rumeno ~)
# - Viri, ki bodo izbrisani (rdeče -)
# Varen za izvajanje - v okolju Azure ne bodo narejene nobene dejanske spremembe

# Sintetizira infrastrukturo iz azure.yaml
azd infra synth
```

### Informacije o projektu
```bash
# Prikaži stanje projekta in končne točke
azd show

# Prikaži podrobne informacije o projektu kot JSON
azd show --output json

# Pridobi končne točke storitve
azd show --output json | jq '.services'
```

## 🤖 Ukazi za AI in razširitve

### AZD razširitve
```bash
# Prikaži vse razpoložljive razširitve (vključno z AI)
azd extension list

# Namesti razširitev Foundry agents
azd extension install azure.ai.agents

# Namesti razširitev za fino prilagajanje
azd extension install azure.ai.finetune

# Namesti razširitev za prilagojene modele
azd extension install azure.ai.models

# Posodobi vse nameščene razširitve
azd extension upgrade --all
```

### Ukazi za AI agente
```bash
# Inicializirajte agentni projekt iz manifesta
azd ai agent init -m <manifest-path-or-uri>

# Ciljajte na določen projekt Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Določite izvorno mapo agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Izberite cilj gostovanja
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP strežnik (alfa)
```bash
# Zaženite MCP strežnik za vaš projekt
azd mcp start

# Upravljajte dovoljenja orodij za operacije MCP
azd copilot consent list
```

### Generiranje infrastrukture
```bash
# Ustvari IaC datoteke iz definicije vašega projekta
azd infra generate

# Sinteziraj infrastrukturo iz azure.yaml
azd infra synth
```

---

## 🎯 Hitri delovni tokovi

### Delovni tok za razvoj
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

# Preizkusi in premakni v predprodukcijsko okolje
azd env select staging
azd up

# Razporedi v produkcijsko okolje
azd env select production
azd up
```

### Delovni tok za odpravljanje težav
```bash
# Omogoči način razhroščevanja
export AZD_DEBUG=true

# Preveri stanje uvajanja
azd show

# Preveri konfiguracijo
azd config show

# Odpri nadzorno ploščo za spremljanje dnevnikov
azd monitor --logs

# Preveri stanje virov
azd show --output json
```

## 🔍 Ukazi za odpravljanje napak

### Informacije za odpravljanje napak
```bash
# Omogoči izpis za odpravljanje napak
export AZD_DEBUG=true
azd <command> --debug

# Onemogoči telemetrijo za čistejši izpis
export AZD_DISABLE_TELEMETRY=true

# Preveri trenutno konfiguracijo
azd config show

# Preveri stanje avtentikacije
az account show
```

### Razhroščevanje predlog
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

# Pojdi v koren projekta azd
cd $(azd root)

# Prikaži konfiguracijsko mapo azd
echo $AZD_CONFIG_DIR  # Običajno ~/.azd
```

## 🎨 Oblikovanje izhoda

### Izhod JSON
```bash
# Pridobi JSON-izhod za uporabo v skriptah
azd show --output json
azd env list --output json
azd config show --output json

# Razčleni z jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Izhod v tabeli
```bash
# Prikaži kot tabelo
azd env list --output table

# Prikaži nameščene storitve
azd show --output json | jq '.services | keys'
```

## 🔧 Pogoste kombinacije ukazov

### Skripta za preverjanje zdravja
```bash
#!/bin/bash
# Hitro preverjanje stanja
azd show
azd env get-values
azd monitor --logs
```

### Preverjanje nameščanja
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

## 🚨 Ukazi za nujne primere

### Hitre rešitve
```bash
# Ponastavi avtentikacijo
az account clear
az login

# Prisili osvežitev okolja
azd env refresh

# Ponovno uvedi vse storitve
azd deploy

# Preveri stanje razmestitve
azd show --output json
```

### Ukazi za obnovitev
```bash
# Obnovi po neuspelem uvajanju - očisti in ponovno namesti
azd down --force --purge
azd up

# Ponovno zagotovi samo infrastrukturo
azd provision

# Ponovno namesti samo aplikacijo
azd deploy
```

## 💡 Nasveti strokovnjakov

### Aliasi za hitrejši delovni tok
```bash
# Dodajte v svoj .bashrc ali .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funkcijske bližnjice
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
    azd env get-values
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

### Povezave do dokumentacije
```bash
# Odpri dokumentacijo v brskalniku
azd docs

# Prikaži dokumentacijo predloge
azd template show <template-name> --docs
```

---

**Namig**: Dodajte ta priročnik med zaznamke in uporabite `Ctrl+F` za hitro iskanje potrebnih ukazov!

---

**Navigacija**
- **Prejšnja lekcija**: [Preflight preverjanja](../docs/pre-deployment/preflight-checks.md)
- **Naslednja lekcija**: [Pojmovnik](glossary.md)

---

> **💡 Želite pomoč pri Azure ukazih v vašem urejevalniku?** Namestite [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) z `npx skills add microsoft/github-copilot-for-azure` — 37 veščin za AI, Foundry, uvajanje, diagnostiko in še več.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku se šteje za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->