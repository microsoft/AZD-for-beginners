# Hitri pregled ukazov - Osnovni AZD ukazi

**Hiter pregled za vse poglavja**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Hitri začetek**: [Poglavje 1: Osnove in hitri začetek](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ukazi**: [Poglavje 2: Razvoj, usmerjen na AI (priporočeno za AI razvijalce)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Napredno**: [Poglavje 4: Infrastruktura kot koda](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ta obsežen hiter pregled nudi hitro referenco za najpogosteje uporabljene ukaze Azure Developer CLI, organizirane po kategorijah z uporabnimi primeri. Popolno za hitro iskanje med razvojem, odpravljanjem težav in vsakodnevnimi opravili z azd projekti.

## Cilji učenja

Z uporabo tega hitrega pregleda boste:
- Imeli takojšen dostop do osnovnih Azure Developer CLI ukazov in sintakse
- Razumeli organizacijo ukazov po funkcionalnih kategorijah in primerih uporabe
- Imeli referenco praktičnih primerov za pogoste razvojne in razmestitvene scenarije
- Dostopali do ukazov za odpravljanje težav za hitro razrešitev težav
- Našli napredne možnosti konfiguracije in prilagoditve učinkovito
- Locirali upravljanje okolij in delovne tokove za več okolij

## Pričakovani rezultati učenja

Redno uporabljanje tega hitrega pregleda vam bo omogočilo:
- Zaupno izvajanje azd ukazov brez nenehnega sklicevanja na polno dokumentacijo
- Hitro reševanje pogostih težav z ustreznimi diagnostičnimi ukazi
- Učinkovito upravljanje več okolij in razmestitvenih scenarijev
- Uporabo naprednih azd funkcij in možnosti konfiguracije po potrebi
- Odpravljanje težav z razmestitvijo z uporabo sistematičnih zaporedij ukazov
- Optimizacijo potekov dela z učinkovito uporabo azd bližnjic in možnosti

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

# Inicializiraj z imenom po meri
azd init --template todo-nodejs-mongo my-awesome-app
```

## Osnovni ukazi za razmestitev

### Celoten potek razmestitve
```bash
# Izvedi vse (pripravi in razporedi)
azd up

# Razporedi z onemogočenimi potrditvenimi pozivi
azd up --confirm-with-no-prompt

# Razporedi v določeno okolje
azd up --environment production

# Razporedi z uporabniško določenimi parametri
azd up --parameter location=westus2
```

### Samo infrastruktura
```bash
# Vzpostavi Azure vire
azd provision

# 🧪 Predogled sprememb infrastrukture
azd provision --preview
# Prikaže poskusni pregled, kateri viri bi bili ustvarjeni, spremenjeni ali izbrisani
# Podobno kot 'terraform plan' ali 'bicep what-if' - varno za zagon, spremembe se ne izvedejo
```

### Samo aplikacija
```bash
# Razporedi kodo aplikacije
azd deploy

# Razporedi določeno storitev
azd deploy --service web
azd deploy --service api

# Razporedi vse storitve
azd deploy --all
```

### Sestavljanje in pakiranje
```bash
# Obnovi (prenesi) odvisnosti aplikacije
azd restore

# Obnovi izbrano storitev
azd restore --service api

# Zgradi razmestljiv artefakt brez razmestitve
azd package

# Zgradi izbrano storitev
azd package --service api
```

> **`azd restore`** prenese odvisnosti vaše aplikacije (npm, pip, NuGet, Maven itd.). Samodejno se zažene med `azd package` in `azd deploy`, zato ga redko kličete neposredno — zaženite ga ročno, da prednaložite odvisnosti (na primer za ogrevanje predpomnilnika CI ali za delo brez povezave kasneje).

> **`azd package`** zgradi razmestitveni artefakt (sliko kontejnerja ali zip) **brez** potiska v Azure. Uporabite ga samostojno, da preverite, ali se gradnja uspe, pregledate izhod ali ustvarite artefakt, ki ga bo kasneje razmestil ločen postopek. `azd deploy` samodejno pakira, zato potrebujete `azd package` le, ko želite artefakt brez razmestitve.


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

# Prikaži razpoložljiva okolja
azd env list

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

# Naštej vse spremenljivke okolja
azd env get-values

# Odstrani spremenljivko okolja
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

# Pridobi končne točke storitev
azd show --output json
```

## 📊 Nadzor in diagnostika

### Nadzorna plošča
```bash
# Odpri nadzorno ploščo za spremljanje v portalu Azure
azd monitor

# Odpri metrike v realnem času v Application Insights
azd monitor --live

# Odpri okno dnevnikov v Application Insights
azd monitor --logs

# Odpri pregled v Application Insights
azd monitor --overview
```

### Ogled dnevnikov kontejnerjev
```bash
# Oglejte si dnevnike prek Azure CLI (za Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Spremljajte dnevnike v realnem času
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Oglejte si dnevnike v Azure portalu
azd monitor --logs
```

### Poizvedbe Log Analytics
```bash
# Dostop do Log Analytics prek Azure portala
azd monitor --logs

# Poizvedovanje dnevnikov z uporabo Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Vzdrževalni ukazi

### Čiščenje
```bash
# Odstrani vse Azure vire
azd down

# Prisili brisanje brez potrditve
azd down --force

# Trajno odstrani mehko izbrisane vire
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
# Konfiguriraj GitHub Actions
azd pipeline config

# Konfiguriraj Azure DevOps
azd pipeline config --provider azdo

# Prikaži konfiguracijo cevovoda
azd pipeline show
```

### Upravljanje infrastrukture
```bash
# Ustvari predloge infrastrukture
azd infra generate

# 🧪 Predogled in načrtovanje infrastrukture
azd provision --preview
# Simulira pripravo infrastrukture brez uvajanja
# Analizira predloge Bicep/Terraform in prikaže:
# - Viri, ki bodo dodani (zeleno +)
# - Viri, ki bodo spremenjeni (rumeno ~)
# - Viri, ki bodo izbrisani (rdeče -)
# Varno za zagon - brez dejanskih sprememb v okolju Azure

# Sinteziraj infrastrukturo iz azure.yaml
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
# Naštej vse razpoložljive razširitve (vključno z AI)
azd extension list

# Namesti razširitev Foundry agents
azd extension install azure.ai.agents

# Namesti razširitev agent skills (predogled)
azd extension install azure.ai.skills

# Namesti razširitev Foundry connections (predogled)
azd extension install azure.ai.connections

# Namesti razširitev za fino prilagajanje
azd extension install azure.ai.finetune

# Namesti razširitev za prilagojene modele
azd extension install azure.ai.models

# Posodobi vse nameščene razširitve
azd extension upgrade --all
```

### Ukazi za AI agente
```bash
# Inicializiraj projekt agenta iz manifesta
azd ai agent init -m <manifest-path-or-uri>

# Nastavi določen projekt Foundry kot cilj
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Določi izvorno mapo agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Izberi cilj gostovanja
azd ai agent init -m agent-manifest.yaml --host containerapp

# Preizkusi nameščenega agenta (izpiše zakasnitev in čas do prvega bajta)
azd ai agent invoke

# Pokaži konfiguracijo žive končne točke
azd ai agent endpoint show

# Ustvari ocenjevalni nabor podatkov, nato optimiziraj agenta
azd ai agent eval generate
azd ai agent optimize

# Prenesi nameščeno izvorno kodo gostovanega agenta, ki temelji na kodi
azd ai agent code download

# Izbriši gostovanega agenta in vse njegove različice (--force konča aktivne seje)
azd ai agent delete --force
```

### MCP strežnik (alfa)
```bash
# Zaženite MCP strežnik za vaš projekt
azd mcp start

# Upravljajte privolitve orodja za operacije MCP
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

## 🎯 Hitri delovni poteki

### Razvojni potek dela
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

### Potek dela za več okolij
```bash
# Nastavi okolja
azd env new dev
azd env new staging  
azd env new production

# Razporedi v dev
azd env select dev
azd up

# Preizkusi in premakni v staging
azd env select staging
azd up

# Razporedi v produkcijo
azd env select production
azd up
```

### Potek odpravljanja težav
```bash
# Omogoči način odpravljanja napak
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

## 🔍 Ukazi za razhroščevanje

### Informacije za razhroščevanje
```bash
# Omogoči izpis za odpravljanje napak
export AZD_DEBUG=true
azd <command> --debug

# Onemogoči telemetrijo za čistejši izpis
export AZD_DISABLE_TELEMETRY=true

# Preveri trenutno konfiguracijo
azd config show

# Preveri stanje overjanja
az account show
```

### Razhroščevanje predloge
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
# Pokaži trenutno strukturo imenikov
tree /f  # Windows
find . -type f  # Linux/macOS

# Pojdi v korenski imenik projekta azd
cd $(azd root)

# Pokaži konfiguracijski imenik azd
echo $AZD_CONFIG_DIR  # Običajno ~/.azd
```

## 🎨 Oblikovanje izhoda

### Izhod v JSON
```bash
# Pridobi JSON izhod za skriptiranje
azd show --output json
azd env list --output json
azd config show --output json

# Razčleni z jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Izhod v tabeli
```bash
# Formatiraj kot tabelo
azd env list --output table

# Prikaži nameščene storitve
azd show --output json | jq '.services | keys'
```

## 🔧 Pogoste kombinacije ukazov

### Skript za preverjanje stanja
```bash
#!/bin/bash
# Hiter pregled stanja
azd show
azd env get-values
azd monitor --logs
```

### Preverjanje razmestitve
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

### Skript za čiščenje virov
```bash
#!/bin/bash
# Počistite stara okolja
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

### Hitre rešitve
```bash
# Ponastavi overjanje
az account clear
az login

# Prisili osvežitev okolja
azd env refresh

# Ponovno razporedi vse storitve
azd deploy

# Preveri stanje razmestitve
azd show --output json
```

### Ukazi za obnovitev
```bash
# Obnovi po neuspešni namestitvi - očisti in ponovno namesti
azd down --force --purge
azd up

# Samo ponovna priprava infrastrukture
azd provision

# Samo ponovna namestitev aplikacije
azd deploy
```

## 💡 Nasveti strokovnjakov

### Vzdevki za hitrejši potek dela
```bash
# Dodajte v datoteko .bashrc ali .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Bližnjice funkcij
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

# Prikaži različico in informacije o gradnji
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

**Namig**: Dodajte ta hiter pregled v zaznamke in uporabite `Ctrl+F`, da hitro poiščete ukaze, ki jih potrebujete!

---

**Navigacija**
- **Prejšnja lekcija**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Naslednja lekcija**: [Glosar](glossary.md)

---

> **💡 Želite pomoč pri Azure ukazih v vašem urejevalniku?** Namestite [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) z `npx skills add microsoft/github-copilot-for-azure` — 37 spretnosti za AI, Foundry, razmestitev, diagnostiko in še več.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->