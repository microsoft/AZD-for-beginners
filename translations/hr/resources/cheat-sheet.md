# Cheat Sheet naredbi - Osnovne AZD naredbe

**Brzi pregled za sve poglavlja**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Brzi početak**: [Poglavlje 1: Osnove i Brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI naredbe**: [Poglavlje 2: AI-prvi razvoj](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Napredno**: [Poglavlje 4: Infrastruktura kao kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ovaj opsežni cheat sheet pruža brz pristup najčešće korištenim Azure Developer CLI naredbama, organiziranim po kategorijama s praktičnim primjerima. Savršen za brzo pretraživanje tijekom razvoja, otklanjanja pogrešaka i svakodnevnih operacija s azd projektima.

## Ciljevi učenja

Korištenjem ovog cheat sheeta:
- Imat ćete trenutni pristup osnovnim Azure Developer CLI naredbama i sintaksi
- Razumjet ćete organizaciju naredbi po funkcionalnim kategorijama i slučajevima korištenja
- Moći ćete referencirati praktične primjere za uobičajene razvojne i implementacijske scenarije
- Pristupiti ćete naredbama za otklanjanje pogrešaka za brzo rješavanje problema
- Pronaći ćete napredne opcije konfiguracije i prilagodbe učinkovito
- Pronaći ćete naredbe za upravljanje okruženjima i višestruke radne tokove okruženja

## Ishodi učenja

Redovitim korištenjem ovog cheat sheeta moći ćete:
- Izvoditi azd naredbe samouvjereno bez potrebe za referencom pune dokumentacije
- Brzo rješavati uobičajene probleme korištenjem odgovarajućih dijagnostičkih naredbi
- Učinkovito upravljati višestrukim okruženjima i scenarijima implementacije
- Primjenjivati napredne azd značajke i opcije konfiguracije prema potrebi
- Otklanjati probleme implementacije koristeći sustavne slijedove naredbi
- Optimizirati radne tokove učinkovitim korištenjem azd prečaca i opcija

## Početne naredbe

### Autentikacija
```bash
# Prijava u Azure putem AZD-a
azd auth login

# Prijava u Azure CLI (AZD to koristi u pozadini)
az login

# Provjeri trenutni račun
az account show

# Postavi zadanu pretplatu
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Odjava iz AZD-a
azd auth logout

# Odjava iz Azure CLI-ja
az logout
```

### Inicijalizacija projekta
```bash
# Pregled dostupnih predložaka
azd template list

# Inicijaliziraj iz predloška
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicijaliziraj u trenutačnom direktoriju
azd init .

# Inicijaliziraj s prilagođenim imenom
azd init --template todo-nodejs-mongo my-awesome-app
```

## Osnovne naredbe za implementaciju

### Kompletan radni tok implementacije
```bash
# Implementiraj sve (priprema + implementacija)
azd up

# Implementiraj bez potvrde korisnika
azd up --confirm-with-no-prompt

# Implementiraj u određeno okruženje
azd up --environment production

# Implementiraj s prilagođenim parametrima
azd up --parameter location=westus2
```

### Samo infrastruktura
```bash
# Osigurajte Azure resurse
azd provision

# 🧪 Pregled promjena infrastrukture
azd provision --preview
# Prikazuje pregled bez izvršenja što bi se resursa stvorilo/izmijenilo/izbrisalo
# Slično 'terraform plan' ili 'bicep what-if' - sigurno za pokretanje, nema primijenjenih promjena
```

### Samo aplikacija
```bash
# Postavi kod aplikacije
azd deploy

# Postavi određenu uslugu
azd deploy --service web
azd deploy --service api

# Postavi sve usluge
azd deploy --all
```

### Izrada i pakiranje
```bash
# Izgradite aplikacije
azd package

# Izgradite određenu uslugu
azd package --service api
```

## 🌍 Upravljanje okruženjem

### Operacije s okruženjem
```bash
# Popis svih okruženja
azd env list

# Kreiraj novo okruženje
azd env new development
azd env new staging --location westus2

# Odaberi okruženje
azd env select production

# Prikaži trenutno okruženje
azd env show

# Osvježi stanje okruženja
azd env refresh
```

### Varijable okruženja
```bash
# Postavi varijablu okoline
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Dohvati varijablu okoline
azd env get API_KEY

# Nabroji sve varijable okoline
azd env get-values

# Ukloni varijablu okoline
azd env unset DEBUG
```

## ⚙️ Konfiguracijske naredbe

### Globalna konfiguracija
```bash
# Prikaži sve konfiguracije
azd config list

# Postavi globalne zadane postavke
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Ukloni konfiguraciju
azd config unset defaults.location

# Resetiraj sve konfiguracije
azd config reset
```

### Konfiguracija projekta
```bash
# Validiraj azure.yaml
azd config validate

# Prikaži informacije o projektu
azd show

# Dohvati krajnje točke usluge
azd show --output json
```

## 📊 Praćenje i dijagnostika

### Nadzorna ploča za praćenje
```bash
# Otvori Azure portal nadzorne ploče
azd monitor

# Otvori Application Insights statistiku u stvarnom vremenu
azd monitor --live

# Otvori Application Insights zapisnike
azd monitor --logs

# Otvori Application Insights pregled
azd monitor --overview
```

### Pregled dnevnika kontejnera
```bash
# Prikaz dnevnika putem Azure CLI-ja (za Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Praćenje dnevnika u stvarnom vremenu
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Prikaz dnevnika iz Azure Portala
azd monitor --logs
```

### Upiti Log Analyticsa
```bash
# Pristupite Log Analytics putem Azure portala
azd monitor --logs

# Upitajte dnevnike koristeći Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Održavanje

### Čišćenje
```bash
# Ukloni sve Azure resurse
azd down

# Primoraj brisanje bez potvrde
azd down --force

# Očisti privremeno izbrisane resurse
azd down --purge

# Potpuno čišćenje
azd down --force --purge
```

### Ažuriranja
```bash
# Provjerite ima li ažuriranja za azd
azd version

# Dohvati trenutnu verziju
azd version

# Prikaži trenutne postavke
azd config list
```

## 🔧 Napredne naredbe

### Pipeline i CI/CD
```bash
# Konfigurirajte GitHub Actions
azd pipeline config

# Konfigurirajte Azure DevOps
azd pipeline config --provider azdo

# Prikaži konfiguraciju pipeline-a
azd pipeline show
```

### Upravljanje infrastrukturom
```bash
# Generiraj predloške infrastrukture
azd infra generate

# 🧪 Pregled i planiranje infrastrukture
azd provision --preview
# Simulira pripremu infrastrukture bez implementacije
# Analizira Bicep/Terraform predloške i prikazuje:
# - Resurse koji će biti dodani (zeleno +)
# - Resurse koji će biti izmijenjeni (žuto ~)
# - Resurse koji će biti izbrisani (crveno -)
# Sigurno za pokretanje - nisu napravljene stvarne promjene u Azure okruženju

# Sintetizira infrastrukturu iz azure.yaml
azd infra synth
```

### Informacije o projektu
```bash
# Prikaži status projekta i krajnje točke
azd show

# Prikaži detaljne informacije o projektu kao JSON
azd show --output json

# Dohvati krajnje točke usluge
azd show --output json | jq '.services'
```

## 🤖 AI i proširenja

### AZD proširenja
```bash
# Nabrojite sve dostupne ekstenzije (uključujući AI)
azd extension list

# Instalirajte ekstenziju Foundry agenata
azd extension install azure.ai.agents

# Instalirajte ekstenziju za fino podešavanje
azd extension install azure.ai.finetune

# Instalirajte ekstenziju za prilagođene modele
azd extension install azure.ai.models

# Nadogradite sve instalirane ekstenzije
azd extension upgrade --all
```

### AI agent naredbe
```bash
# Inicijalizirajte projekt agenta iz manifesta
azd ai agent init -m <manifest-path-or-uri>

# Ciljajte određeni Foundry projekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Navedite direktorij izvora agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Odaberite ciljni hostinger
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP poslužitelj (Alpha)
```bash
# Pokrenite MCP poslužitelj za vaš projekt
azd mcp start

# Upravljajte pristankom na alate za MCP operacije
azd mcp consent
```

### Generiranje infrastrukture
```bash
# Generirajte IaC datoteke iz definicije vašeg projekta
azd infra generate

# Sintetizirajte infrastrukturu iz azure.yaml
azd infra synth
```

---

## 🎯 Brzi radni tokovi

### Radni tok razvoja
```bash
# Pokreni novi projekt
azd init --template todo-nodejs-mongo
cd my-project

# Postavi na razvojno okruženje
azd env new dev
azd up

# Napravi promjene i ponovno postavi
azd deploy

# Otvori nadzornu ploču
azd monitor --live
```

### Radni tok za više okruženja
```bash
# Postavi okruženja
azd env new dev
azd env new staging  
azd env new production

# Implementiraj u razvojno okruženje
azd env select dev
azd up

# Testiraj i promoviraj u pripremno okruženje
azd env select staging
azd up

# Implementiraj u produkciju
azd env select production
azd up
```

### Radni tok za otklanjanje problema
```bash
# Omogući način za ispravljanje pogrešaka
export AZD_DEBUG=true

# Provjeri status implementacije
azd show

# Provjeri valjanost konfiguracije
azd config list

# Otvori nadzornu ploču za praćenje dnevnika
azd monitor --logs

# Provjeri status resursa
azd show --output json
```

## 🔍 Naredbe za otklanjanje pogrešaka

### Informacije za debagiranje
```bash
# Omogući ispis za otklanjanje pogrešaka
export AZD_DEBUG=true
azd <command> --debug

# Onemogući telemetriju za čišći ispis
export AZD_DISABLE_TELEMETRY=true

# Provjeri trenutačnu konfiguraciju
azd config list

# Provjeri status autentikacije
az account show
```

### Debagiranje predložaka
```bash
# Prikaži dostupne predloške s detaljima
azd template list --output json

# Prikaži informacije o predlošku
azd template show <template-name>

# Provjeri predložak prije inicijalizacije
azd template validate <template-name>
```

## 📁 Naredbe za datoteke i direktorije

### Struktura projekta
```bash
# Prikaži trenutnu strukturu direktorija
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigiraj do korijena azd projekta
cd $(azd root)

# Prikaži azd konfiguracijski direktorij
echo $AZD_CONFIG_DIR  # Obično ~/.azd
```

## 🎨 Formatiranje izlaza

### JSON izlaz
```bash
# Nabavi JSON izlaz za skriptiranje
azd show --output json
azd env list --output json
azd config list --output json

# Parsiraj s jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Izlaz u tablici
```bash
# Formatiraj kao tablicu
azd env list --output table

# Prikaži implementirane usluge
azd show --output json | jq '.services | keys'
```

## 🔧 Uobičajene kombinacije naredbi

### Skripta za provjeru zdravlja
```bash
#!/bin/bash
# Brza provjera zdravlja
azd show
azd env show
azd monitor --logs
```

### Validacija implementacije
```bash
#!/bin/bash
# Provjera prije implementacije
azd show
azd provision --preview  # Pregledajte promjene prije implementacije
az account show
```

### Usporedba okruženja
```bash
#!/bin/bash
# Usporedi okoline
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skripta za čišćenje resursa
```bash
#!/bin/bash
# Očistite stare okoline
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Varijable okruženja

### Uobičajene varijable okruženja
```bash
# Azure konfiguracija
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD konfiguracija
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Konfiguracija aplikacije
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Naredbe za hitne slučajeve

### Brza rješenja
```bash
# Poništi autentifikaciju
az account clear
az login

# Prisilno osvježi okruženje
azd env refresh

# Ponovno rasporedi sve usluge
azd deploy

# Provjeri status raspoređivanja
azd show --output json
```

### Naredbe za oporavak
```bash
# Oporavak od neuspjele implementacije - očistite i ponovno implementirajte
azd down --force --purge
azd up

# Obnovi infrastrukturu samo
azd provision

# Ponovno implementiraj samo aplikaciju
azd deploy
```

## 💡 Savjeti stručnjaka

### Alias naredbe za brži radni tok
```bash
# Dodajte u svoj .bashrc ili .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Prečaci funkcija
```bash
# Brzo prebacivanje okoline
azd-env() {
    azd env select $1 && azd show
}

# Brza implementacija s nadzorom
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Status okoline
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Pomoć i dokumentacija

### Dobivanje pomoći
```bash
# Opća pomoć
azd --help
azd help

# Pomoć specifična za naredbu
azd up --help
azd env --help
azd config --help

# Prikaži verziju i informacije o izgradnji
azd version
azd version --output json
```

### Linkovi na dokumentaciju
```bash
# Otvori dokumentaciju u pregledniku
azd docs

# Prikaži dokumentaciju predloška
azd template show <template-name> --docs
```

---

**Savjet**: Dodajte ovaj cheat sheet u favorite i koristite `Ctrl+F` za brzo pronalaženje potrebnih naredbi!

---

**Navigacija**
- **Prethodna lekcija**: [Preflight provjere](../docs/pre-deployment/preflight-checks.md)
- **Sljedeća lekcija**: [Rječnik](glossary.md)

---

> **💡 Želite pomoć s Azure naredbama u svom uređivaču?** Instalirajte [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) s `npx skills add microsoft/github-copilot-for-azure` — 37 vještina za AI, Foundry, implementaciju, dijagnostiku i još mnogo toga.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj je dokument preveden koristeći AI uslugu prevođenja [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati glavnim i službenim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja proizašla iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->