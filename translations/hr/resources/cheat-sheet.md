# Command Cheat Sheet - Osnovni AZD Naredbe

**Brzi pregled za sve poglavlja**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Brzi početak**: [Poglavlje 1: Osnove i brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI naredbe**: [Poglavlje 2: AI-prvi razvoj](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Napredno**: [Poglavlje 4: Infrastruktura kao kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ovaj sveobuhvatni cheat sheet pruža brz referentni pregled najčešće korištenih Azure Developer CLI naredbi, organiziranih po kategorijama s praktičnim primjerima. Savršen za brze provjere tijekom razvoja, rješavanja problema i svakodnevnog rada s azd projektima.

## Ciljevi učenja

Korištenjem ovog cheat sheeta, moći ćete:
- Imati trenutni pristup osnovnim Azure Developer CLI naredbama i sintaksi
- Razumjeti organizaciju naredbi prema funkcionalnim kategorijama i slučajevima uporabe
- Referencirati praktične primjere za uobičajene scenarije razvoja i implementacije
- Pristupiti naredbama za rješavanje problema radi brzog otklanjanja kvarova
- Pronaći napredne opcije konfiguracije i prilagodbe učinkovito
- Pronaći naredbe za upravljanje okolinama i radne tokove s više okolina

## Ishodi učenja

Redovitim korištenjem ovog cheat sheeta moći ćete:
- Izvršavati azd naredbe samouvjereno bez potrebe za kompletnom dokumentacijom
- Brzo rješavati uobičajene probleme koristeći odgovarajuće naredbe za dijagnostiku
- Učinkovito upravljati višestrukim okolinama i scenarijima implementacije
- Primjenjivati napredne azd značajke i opcije konfiguracije po potrebi
- Rješavati probleme implementacije koristeći sustavne sekvence naredbi
- Optimizirati radne tokove učinkovitim korištenjem azd prečaca i opcija

## Početne naredbe

### Autentikacija
```bash
# Prijava u Azure putem AZD-a
azd auth login

# Prijava u Azure CLI (AZD ovo koristi u pozadini)
az login

# Provjera trenutnog računa
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

### Cjelokupni tijek implementacije
```bash
# Postavi sve (pripremi + implementiraj)
azd up

# Postavi s onemogućenim upitima za potvrdu
azd up --confirm-with-no-prompt

# Postavi u određeno okruženje
azd up --environment production

# Postavi s prilagođenim parametrima
azd up --parameter location=westus2
```

### Samo infrastruktura
```bash
# Osigurajte Azure resurse
azd provision

# 🧪 Pregled promjena infrastrukture
azd provision --preview
# Prikazuje prikaz suhog rada koji pokazuje koje bi se resurse kreiralo/izmijenilo/izbrisalo
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
# Vratiti (preuzeti) ovisnosti aplikacije
azd restore

# Vratiti određenu uslugu
azd restore --service api

# Izgraditi distribuirani artefakt bez implementacije
azd package

# Izgraditi određenu uslugu
azd package --service api
```

> **`azd restore`** preuzima ovisnosti vaše aplikacije (npm, pip, NuGet, Maven itd.). Automatski se pokreće tijekom `azd package` i `azd deploy`, pa ga rijetko pozivate izravno—pokrenite ga ručno da biste unaprijed dohvatili ovisnosti (na primjer, za zagrijavanje CI cachea ili rad u offline načinu rada kasnije).

> **`azd package`** gradi artefakt za implementaciju (container image ili zip) **bez** da ga gura u Azure. Koristite ga samostalno da provjerite da izgradnja uspijeva, pregledate izlaz ili proizvedete artefakt za kasniju implementaciju zasebnim procesom. `azd deploy` automatski pakuje, pa trebate `azd package` samo kada želite artefakt bez implementacije.


## 🌍 Upravljanje okolinama

### Operacije nad okolinama
```bash
# Nabrojite sve okoline
azd env list

# Stvorite novu okolinu
azd env new development
azd env new staging --location westus2

# Odaberite okolinu
azd env select production

# Prikaži dostupne okoline
azd env list

# Osvježi stanje okoline
azd env refresh
```

### Varijable okoline
```bash
# Postavi varijablu okoliša
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Dohvati varijablu okoliša
azd env get API_KEY

# Nabroji sve varijable okoliša
azd env get-values

# Ukloni varijablu okoliša
azd env unset DEBUG
```

## ⚙️ Konfiguracijske naredbe

### Globalna konfiguracija
```bash
# Prikaži sve konfiguracije
azd config show

# Postavi globalne zadane vrijednosti
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Ukloni konfiguraciju
azd config unset defaults.location

# Resetiraj sve konfiguracije
azd config reset
```

### Konfiguracija projekta
```bash
# Provjerite azure.yaml
azd config validate

# Prikaži informacije o projektu
azd show

# Dohvati krajnje točke usluge
azd show --output json
```

## 📊 Praćenje i dijagnostika

### Nadzorna ploča praćenja
```bash
# Otvorite nadzornu ploču za praćenje Azure portala
azd monitor

# Otvorite statistiku uživo u Application Insights
azd monitor --live

# Otvorite ploču zapisa Application Insights
azd monitor --logs

# Otvorite pregled Application Insights
azd monitor --overview
```

### Pregled dnevnika kontejnera
```bash
# Pregledajte zapise putem Azure CLI (za Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Pratite zapise u stvarnom vremenu
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Pregledajte zapise iz Azure Portala
azd monitor --logs
```

### Upiti za Log Analytics
```bash
# Pristupite Log Analyticsu putem Azure portala
azd monitor --logs

# Upitajte dnevnike pomoću Azure CLI-ja
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Održavanje

### Čišćenje
```bash
# Ukloni sve Azure resurse
azd down

# Prisilno brisanje bez potvrde
azd down --force

# Izbriši privremeno izbrisane resurse
azd down --purge

# Potpuno čišćenje
azd down --force --purge
```

### Ažuriranja
```bash
# Provjeri za azd ažuriranja
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

# Prikaži konfiguraciju pipeline-a
azd pipeline show
```

### Upravljanje infrastrukturom
```bash
# Generiraj predloške infrastrukture
azd infra generate

# 🧪 Pregled i planiranje infrastrukture
azd provision --preview
# Simulira postavljanje infrastrukture bez stvarnog implementiranja
# Analizira Bicep/Terraform predloške i prikazuje:
# - Resurse koji će biti dodani (zeleno +)
# - Resurse koji će biti izmijenjeni (žuto ~)
# - Resurse koji će biti izbrisani (crveno -)
# Sigurno za pokretanje - bez stvarnih promjena u Azure okruženju

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
# Popis svih dostupnih proširenja (uključujući AI)
azd extension list

# Instaliraj proširenje Foundry agenata
azd extension install azure.ai.agents

# Instaliraj proširenje vještina agenata (pregled)
azd extension install azure.ai.skills

# Instaliraj proširenje Foundry veza (pregled)
azd extension install azure.ai.connections

# Instaliraj proširenje za fino podešavanje
azd extension install azure.ai.finetune

# Instaliraj proširenje za prilagođene modele
azd extension install azure.ai.models

# Nadogradi sva instalirana proširenja
azd extension upgrade --all
```

### AI agent naredbe
```bash
# Inicijaliziraj agent projekt iz manifesta
azd ai agent init -m <manifest-path-or-uri>

# Ciljaj na određeni Foundry projekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Navedite direktorij izvora agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Odaberite cilj hostinga
azd ai agent init -m agent-manifest.yaml --host containerapp

# Testiraj implementiranog agenta (prikazuje latenciju + vrijeme do prvog bajta)
azd ai agent invoke

# Pokaži konfiguraciju aktivne točke pristupa
azd ai agent endpoint show

# Generiraj skup podataka za evaluaciju, zatim optimiziraj agenta
azd ai agent eval generate
azd ai agent optimize

# Preuzmi implementirani izvor kod agenta koji se temelji na kodu
azd ai agent code download

# Izbriši hostanog agenta i sve njegove verzije (--force prekida aktivne sesije)
azd ai agent delete --force
```

### MCP poslužitelj (Alfa)
```bash
# Pokrenite MCP poslužitelj za vaš projekt
azd mcp start

# Upravljajte suglasnošću alata za MCP operacije
azd copilot consent list
```

### Generiranje infrastrukture
```bash
# Generirajte IaC datoteke iz definicije vašeg projekta
azd infra generate

# Sintetizirajte infrastrukturu iz azure.yaml
azd infra synth
```

---

## 🎯 Brzi tijekovi rada

### Tijek rada razvoja
```bash
# Pokreni novi projekt
azd init --template todo-nodejs-mongo
cd my-project

# Postavi na razvoj
azd env new dev
azd up

# Napravi izmjene i ponovno postavi
azd deploy

# Otvori nadzornu ploču
azd monitor --live
```

### Tijek rada s više okolina
```bash
# Postavi okruženja
azd env new dev
azd env new staging  
azd env new production

# Postavi u razvojno okruženje
azd env select dev
azd up

# Testiraj i promoviraj u staging
azd env select staging
azd up

# Postavi u produkciju
azd env select production
azd up
```

### Tijek rada za rješavanje problema
```bash
# Omogući način rada za otklanjanje pogrešaka
export AZD_DEBUG=true

# Provjeri status implementacije
azd show

# Provjeri valjanost konfiguracije
azd config show

# Otvori nadzornu ploču za praćenje dnevnika
azd monitor --logs

# Provjeri status resursa
azd show --output json
```

## 🔍 Naredbe za otklanjanje pogrešaka

### Informacije za debug
```bash
# Omogući ispis za otklanjanje pogrešaka
export AZD_DEBUG=true
azd <command> --debug

# Onemogući telemetriju za čišći ispis
export AZD_DISABLE_TELEMETRY=true

# Provjeri trenutnu konfiguraciju
azd config show

# Provjeri status autentifikacije
az account show
```

### Debug predložaka
```bash
# Nabroji dostupne predloške s detaljima
azd template list --output json

# Prikaži informacije o predlošku
azd template show <template-name>

# Provjeri ispravnost predloška prije inicijalizacije
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
azd config show --output json

# Parsiraj pomoću jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Izlaz u tablici
```bash
# Formatiraj kao tablicu
azd env list --output table

# Pregledaj raspoređene usluge
azd show --output json | jq '.services | keys'
```

## 🔧 Uobičajene kombinacije naredbi

### Skripta za provjeru zdravlja
```bash
#!/bin/bash
# Brza provjera statusa zdravlja
azd show
azd env get-values
azd monitor --logs
```

### Validacija implementacije
```bash
#!/bin/bash
# Provjera prije postavljanja
azd show
azd provision --preview  # Pregledaj promjene prije postavljanja
az account show
```

### Usporedba okolina
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
# Očisti stare okoline
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Varijable okoline

### Uobičajene varijable okoline
```bash
# Konfiguracija Azure
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

# Prisili osvježavanje okoline
azd env refresh

# Ponovno postavi sve usluge
azd deploy

# Provjeri status objave
azd show --output json
```

### Naredbe za oporavak
```bash
# Oporavak od neuspjele implementacije - očistite i ponovo implementirajte
azd down --force --purge
azd up

# Samo ponovno osiguranje infrastrukture
azd provision

# Samo ponovna implementacija aplikacije
azd deploy
```

## 💡 Profesionalni savjeti

### Alias naredbe za brži tijek rada
```bash
# Dodajte u svoj .bashrc ili .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Prečaci za funkcije
```bash
# Brzo prebacivanje okruženja
azd-env() {
    azd env select $1 && azd show
}

# Brza implementacija s nadzorom
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

# Pomoć specifična za naredbu
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

# Pokaži dokumentaciju predloška
azd template show <template-name> --docs
```

---

**Savjet**: Označite ovu tablicu naredbi i koristite `Ctrl+F` za brzo pronalaženje potrebnih naredbi!

---

**Navigacija**
- **Prethodna lekcija**: [Preflight provjere](../docs/pre-deployment/preflight-checks.md)
- **Sljedeća lekcija**: [Rječnik](glossary.md)

---

> **💡 Želite pomoć za Azure naredbe u vašem editoru?** Instalirajte [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) s `npx skills add microsoft/github-copilot-for-azure` — 37 vještina za AI, Foundry, implementaciju, dijagnostiku i više.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->