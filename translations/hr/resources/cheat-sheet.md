# Prečac naredbi - Osnovne AZD naredbe

**Brzi Pristup za Sve Poglavlja**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Brzi početak**: [Poglavlje 1: Osnove i Brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI naredbe**: [Poglavlje 2: Razvoj fokusiran na AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Napredno**: [Poglavlje 4: Infrastruktura kao kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ovaj sveobuhvatni prečac pruža brzi pristup najčešće korištenim Azure Developer CLI naredbama, organiziranim po kategorijama s praktičnim primjerima. Savršen je za brze preglede tijekom razvoja, otklanjanja poteškoća i svakodnevnih operacija s azd projektima.

## Ciljevi učenja

Korištenjem ovog prečaca ćete:
- Imati trenutačni pristup ključnim Azure Developer CLI naredbama i sintaksi
- Razumjeti organizaciju naredbi po funkcionalnim kategorijama i slučajevima upotrebe
- Referencirati praktične primjere za česte razvojne i implementacijske scenarije
- Pristupiti naredbama za otklanjanje problema za brzo rješavanje poteškoća
- Pronaći napredne opcije konfiguracije i prilagodbe učinkovito
- Locirati naredbe za upravljanje okruženjima i rad u više okruženja

## Ishodi učenja

Redovitim korištenjem ovog prečaca, moći ćete:
- Izvoditi azd naredbe samopouzdano bez oslanjanja na cjelovitu dokumentaciju
- Brzo rješavati uobičajene probleme koristeći odgovarajuće naredbe za dijagnostiku
- Učinkovito upravljati višestrukim okruženjima i scenarijima implementacije
- Primijeniti napredne značajke i opcije konfiguracije azd-a po potrebi
- Otklanjati probleme implementacije koristeći sustavne nizove naredbi
- Optimizirati tijekove rada kroz učinkovitu uporabu prečaca i opcija azd-a

## Početne naredbe

### Autentikacija
```bash
# Prijava u Azure putem AZD-a
azd auth login

# Prijava u Azure CLI (AZD koristi ovo u pozadini)
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
# Pregledaj dostupne predloške
azd template list

# Inicijaliziraj iz predloška
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicijaliziraj u trenutnom direktoriju
azd init .

# Inicijaliziraj s prilagođenim imenom
azd init --template todo-nodejs-mongo my-awesome-app
```

## Temeljne naredbe za implementaciju

### Potpun tijek implementacije
```bash
# Implementiraj sve (priprema + implementacija)
azd up

# Implementiraj bez potvrde
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

# 🧪 Pregledajte promjene infrastrukture
azd provision --preview
# Prikazuje pregled bez stvarne promjene što bi resursa bilo kreirano/promijenjeno/izbrisano
# Slično kao 'terraform plan' ili 'bicep what-if' - sigurno za pokretanje, bez primjene promjena
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

### Izgradnja i pakiranje
```bash
# Izgradite aplikacije
azd package

# Izgradite određenu uslugu
azd package --service api
```

## 🌍 Upravljanje okruženjem

### Operacije okruženja
```bash
# Prikaži sve okoline
azd env list

# Kreiraj novu okolinu
azd env new development
azd env new staging --location westus2

# Odaberi okolinu
azd env select production

# Prikaži dostupne okoline
azd env list

# Osvježi stanje okoline
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

## ⚙️ Naredbe konfiguracije

### Globalna konfiguracija
```bash
# Prikaži svu konfiguraciju
azd config show

# Postavi globalne zadane vrijednosti
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Ukloni konfiguraciju
azd config unset defaults.location

# Resetiraj svu konfiguraciju
azd config reset
```

### Konfiguracija projekta
```bash
# Provjeri azure.yaml
azd config validate

# Prikaži informacije o projektu
azd show

# Dohvati krajnje točke usluge
azd show --output json
```

## 📊 Praćenje i dijagnostika

### Nadzorna ploča za praćenje
```bash
# Otvorite nadzornu ploču za nadzor Azure portala
azd monitor

# Otvorite žive metrike Application Insights
azd monitor --live

# Otvorite ploču dnevnika Application Insights
azd monitor --logs

# Otvorite pregled Application Insights
azd monitor --overview
```

### Pregled dnevnika kontejnera
```bash
# Pregledajte zapise putem Azure CLI-ja (za Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Pratite zapise u stvarnom vremenu
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Pregledajte zapise iz Azure Portala
azd monitor --logs
```

### Upiti za analitiku zapisa
```bash
# Pristupite Analitici zapisa putem Azure portala
azd monitor --logs

# Upitajte zapise koristeći Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Naredbe održavanja

### Čišćenje
```bash
# Ukloni sve Azure resurse
azd down

# Prisilno brisanje bez potvrde
azd down --force

# Očisti meko obrisane resurse
azd down --purge

# Potpuno čišćenje
azd down --force --purge
```

### Ažuriranja
```bash
# Provjerite ažuriranja za azd
azd version

# Dohvati trenutnu verziju
azd version

# Prikaži trenutnu konfiguraciju
azd config show
```

## 🔧 Napredne naredbe

### Pipeline i CI/CD
```bash
# Konfiguriraj GitHub Actions
azd pipeline config

# Konfiguriraj Azure DevOps
azd pipeline config --provider azdo

# Prikaži konfiguraciju pipelinea
azd pipeline show
```

### Upravljanje infrastrukturom
```bash
# Generiraj predloške infrastrukture
azd infra generate

# 🧪 Pregled i planiranje infrastrukture
azd provision --preview
# Simulira postavljanje infrastrukture bez implementacije
# Analizira Bicep/Terraform predloške i prikazuje:
# - Resurse za dodavanje (zeleno +)
# - Resurse za izmjenu (žuto ~)
# - Resurse za brisanje (crveno -)
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

## 🤖 AI & Ekstenzije naredbe

### AZD ekstenzije
```bash
# Nabrojite sve dostupne ekstenzije (uključujući AI)
azd extension list

# Instalirajte ekstenziju Foundry agenata
azd extension install azure.ai.agents

# Instalirajte ekstenziju za fino podešavanje
azd extension install azure.ai.finetune

# Instalirajte ekstenziju za prilagođene modele
azd extension install azure.ai.models

# Ažurirajte sve instalirane ekstenzije
azd extension upgrade --all
```

### AI agent naredbe
```bash
# Inicijalizirajte agent projekt iz manifesta
azd ai agent init -m <manifest-path-or-uri>

# Ciljajte na određeni Foundry projekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Odredite direktorij izvora agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Odaberite cilj hostinga
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP poslužitelj (Alpha)
```bash
# Pokreni MCP poslužitelj za vaš projekt
azd mcp start

# Upravljaj pristankom alata za MCP operacije
azd copilot consent list
```

### Generiranje infrastrukture
```bash
# Generiraj IaC datoteke iz definicije vašeg projekta
azd infra generate

# Sintetiziraj infrastrukturu iz azure.yaml
azd infra synth
```

---

## 🎯 Brzi tijekovi rada

### Tijek rada za razvoj
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

### Više-okolišni tijek rada
```bash
# Postavi okruženja
azd env new dev
azd env new staging  
azd env new production

# Implementiraj na razvojno okruženje
azd env select dev
azd up

# Testiraj i promoviraj u pripremno okruženje
azd env select staging
azd up

# Implementiraj u produkciju
azd env select production
azd up
```

### Tijek otklanjanja poteškoća
```bash
# Omogući način za otklanjanje pogrešaka
export AZD_DEBUG=true

# Provjeri status raspoređivanja
azd show

# Provjeri ispravnost konfiguracije
azd config show

# Otvori nadzornu ploču za nadzor zapisa
azd monitor --logs

# Provjeri status resursa
azd show --output json
```

## 🔍 Naredbe za otklanjanje pogrešaka

### Informacije za otklanjanje pogrešaka
```bash
# Omogući prikaz otklanjanja pogrešaka
export AZD_DEBUG=true
azd <command> --debug

# Onemogući telemetriju za čišći izlaz
export AZD_DISABLE_TELEMETRY=true

# Provjeri trenutnu konfiguraciju
azd config show

# Provjeri status autentifikacije
az account show
```

### Otklanjanje pogrešaka predložaka
```bash
# Prikaži dostupne predloške s detaljima
azd template list --output json

# Prikaži informacije o predlošku
azd template show <template-name>

# Provjeri valjanost predloška prije inicijalizacije
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

# Prikaži direktorij konfiguracije azd-a
echo $AZD_CONFIG_DIR  # Obično ~/.azd
```

## 🎨 Formatiranje izlaza

### JSON izlaz
```bash
# Dobivanje JSON izlaza za skriptiranje
azd show --output json
azd env list --output json
azd config show --output json

# Parsiraj pomoću jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Izlaz u tablici
```bash
# Formatiraj kao tablicu
azd env list --output table

# Prikaži distribuirane usluge
azd show --output json | jq '.services | keys'
```

## 🔧 Uobičajene kombinacije naredbi

### Skripta za provjeru zdravlja
```bash
#!/bin/bash
# Brza provjera zdravlja
azd show
azd env get-values
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
# Usporedi okruženja
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
# Resetiraj autentifikaciju
az account clear
az login

# Prisilno osvježi okruženje
azd env refresh

# Ponovo rasporedi sve usluge
azd deploy

# Provjeri status raspoređivanja
azd show --output json
```

### Naredbe za oporavak
```bash
# Oporavak od neuspjele implementacije - čišćenje i ponovna implementacija
azd down --force --purge
azd up

# Ponovno postavljanje infrastrukture samo
azd provision

# Ponovna implementacija aplikacije samo
azd deploy
```

## 💡 Profesionalni savjeti

### Aliasovi za brži tijek rada
```bash
# Dodajte u svoj .bashrc ili .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Prečaci funkcija
```bash
# Brzo prebacivanje okruženja
azd-env() {
    azd env select $1 && azd show
}

# Brzo postavljanje s nadzorom
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Status okruženja
azd-status() {
    echo "Current environment:"
    azd env get-values
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

# Pomoć za određenu naredbu
azd up --help
azd env --help
azd config --help

# Prikaži verziju i informacije o izradi
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

**Savjet**: Označite ovaj prečac i koristite `Ctrl+F` za brzo pronalaženje potrebnih naredbi!

---

**Navigacija**
- **Prethodna lekcija**: [Prethodne provjere](../docs/pre-deployment/preflight-checks.md)
- **Sljedeća lekcija**: [Rječnik](glossary.md)

---

> **💡 Želite pomoć za Azure naredbe u svom uređivaču?** Instalirajte [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) s `npx skills add microsoft/github-copilot-for-azure` — 37 vještina za AI, Foundry, implementaciju, dijagnostiku i još mnogo toga.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj je dokument preveden pomoću AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo biti točni, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazuma ili pogrešne interpretacije koje proizađu iz upotrebe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->