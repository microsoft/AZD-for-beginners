# Command Cheat Sheet - Osnovne AZD naredbe

**Brzi pregled za sve poglavlja**
- **📚 Početna stranica kursa**: [AZD za početnike](../README.md)
- **📖 Brzi početak**: [Poglavlje 1: Osnove i Brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI naredbe**: [Poglavlje 2: AI-prvo razvijanje](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Napredne**: [Poglavlje 4: Infrastruktura kao kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ovaj sveobuhvatni cheat sheet pruža brz pregled najčešće korištenih Azure Developer CLI naredbi, organiziranih po kategorijama s praktičnim primjerima. Idealno za brze preglede tokom razvoja, rješavanja problema i svakodnevnih aktivnosti s azd projektima.

## Ciljevi učenja

Koristeći ovaj cheat sheet, moći ćete:
- Imati trenutni pristup osnovnim Azure Developer CLI naredbama i sintaksi
- Razumjeti organizaciju naredbi po funkcionalnim kategorijama i slučajevima upotrebe
- Referencirati praktične primjere za uobičajene razvojne i deployment scenarije
- Pristupiti naredbama za rješavanje problema za brzo otklanjanje poteškoća
- Pronaći napredne opcije konfiguracije i prilagođavanja učinkovito
- Pronaći naredbe za upravljanje okruženjima i višestruke radne tokove okruženja

## Ishodi učenja

Redovitim korištenjem ovog cheat sheeta, moći ćete:
- Izvoditi azd naredbe samopouzdano bez potrebe za referenciranjem pune dokumentacije
- Brzo rješavati uobičajene probleme koristeći odgovarajuće dijagnostičke naredbe
- Učinkovito upravljati višestrukim okruženjima i scenarijima implementacije
- Primijeniti napredne značajke i opcije konfiguracije azd po potrebi
- Rješavati probleme pri implementaciji koristeći sustavne sekvence naredbi
- Optimizirati radne tokove učinkovitim korištenjem prečaca i opcija azd

## Početne naredbe

### Autentifikacija
```bash
# Prijava u Azure putem AZD-a
azd auth login

# Prijava u Azure CLI (AZD koristi ovo u pozadini)
az login

# Provjerite trenutni račun
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
# Pregledajte dostupne predloške
azd template list

# Inicijaliziraj iz predloška
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicijaliziraj u trenutnom direktoriju
azd init .

# Inicijaliziraj s prilagođenim imenom
azd init --template todo-nodejs-mongo my-awesome-app
```

## Osnovne naredbe za implementaciju

### Potpuni radni tok implementacije
```bash
# Postavi sve (priprema + postavljanje)
azd up

# Postavi s onemogućenim potvrda upita
azd up --confirm-with-no-prompt

# Postavi u određeno okruženje
azd up --environment production

# Postavi s prilagođenim parametrima
azd up --parameter location=westus2
```

### Samo infrastruktura
```bash
# Provisioniranje Azure resursa
azd provision

# 🧪 Pregled promjena infrastrukture
azd provision --preview
# Prikazuje suhi prikaz onoga što bi se resursa kreiralo/izmijenilo/izbrisalo
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
# Izgradnja aplikacija
azd package

# Izgradnja specifične usluge
azd package --service api
```

## 🌍 Upravljanje okruženjem

### Operacije nad okruženjem
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
# Postavi varijablu okruženja
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Dohvati varijablu okruženja
azd env get API_KEY

# Prikaži sve varijable okruženja
azd env get-values

# Ukloni varijablu okruženja
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
# Otvorite nadzornu ploču monitoringa na Azure portalu
azd monitor

# Otvorite live metrike u Application Insights
azd monitor --live

# Otvorite zapisnike Application Insights
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

### Upiti za Log Analytics
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

# Očisti privremeno obrisane resurse
azd down --purge

# Potpuno čišćenje
azd down --force --purge
```

### Ažuriranja
```bash
# Provjeri ima li ažuriranja za azd
azd version

# Dohvati trenutnu verziju
azd version

# Prikaži trenutnu konfiguraciju
azd config list
```

## 🔧 Napredne naredbe

### Cjevovod i CI/CD
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
# Simulira pružanje infrastrukture bez implementacije
# Analizira Bicep/Terraform predloške i prikazuje:
# - Resurse koji će biti dodani (zeleno +)
# - Resurse koji će biti modificirani (žuto ~)
# - Resurse koji će biti izbrisani (crveno -)
# Sigurno za pokretanje - nema stvarnih promjena u Azure okruženju

# Sintetiziraj infrastrukturu iz azure.yaml
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

## 🎯 Brzi radni tokovi

### Radni tok razvoja
```bash
# Zapocni novi projekt
azd init --template todo-nodejs-mongo
cd my-project

# Implementiraj u razvojno okruzenje
azd env new dev
azd up

# Napravi izmjene i ponovo implementiraj
azd deploy

# Otvori nadzornu plocu
azd monitor --live
```

### Radni tok s više okruženja
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

# Implementiraj u produkcijsko okruženje
azd env select production
azd up
```

### Radni tok za rješavanje problema
```bash
# Omogući način rada za ispravljanje pogrešaka
export AZD_DEBUG=true

# Provjeri status implementacije
azd show

# Provjeri valjanost konfiguracije
azd config list

# Otvori nadzornu ploču za praćenje zapisa
azd monitor --logs

# Provjeri status resursa
azd show --output json
```

## 🔍 Naredbe za otklanjanje pogrešaka

### Informacije za otklanjanje pogrešaka
```bash
# Omogući ispis za otklanjanje pogrešaka
export AZD_DEBUG=true
azd <command> --debug

# Onemogući telemetriju za čišći ispis
export AZD_DISABLE_TELEMETRY=true

# Provjeri trenutnu konfiguraciju
azd config list

# Provjeri status autentikacije
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

# Prikaži azd konfiguracijski direktorij
echo $AZD_CONFIG_DIR  # Obično ~/.azd
```

## 🎨 Formatiranje izlaza

### JSON izlaz
```bash
# Dohvati JSON izlaz za skriptiranje
azd show --output json
azd env list --output json
azd config list --output json

# Parsiraj pomoću jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tablični izlaz
```bash
# Formatiraj kao tablicu
azd env list --output table

# Pregledaj implementirane usluge
azd show --output json | jq '.services | keys'
```

## 🔧 Česte kombinacije naredbi

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
# Validacija prije postavljanja
azd show
azd provision --preview  # Pregled promjena prije postavljanja
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
# Poništi autentifikaciju
az account clear
az login

# Prisili osvježavanje okoline
azd env refresh

# Ponovno implementiraj sve servise
azd deploy

# Provjeri status implementacije
azd show --output json
```

### Naredbe za oporavak
```bash
# Oporavak od neuspjele implementacije - očistite i ponovno implementirajte
azd down --force --purge
azd up

# Ponovno provisionirajte samo infrastrukturu
azd provision

# Ponovno implementirajte samo aplikaciju
azd deploy
```

## 💡 Profesionalni savjeti

### Alias naredbe za brži rad
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
- **Prethodna lekcija**: [Provjere prije implementacije](../docs/pre-deployment/preflight-checks.md)
- **Sljedeća lekcija**: [Rječnik pojmova](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden korištenjem AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->