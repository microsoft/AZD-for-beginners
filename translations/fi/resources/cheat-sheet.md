# Komentopikaopas - Oleelliset AZD-komennot

**Nopea viite kaikille luvuille**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../README.md)
- **📖 Pika-aloitus**: [Luku 1: Perusta ja pika-aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-komennot**: [Luku 2: Tekoälykeskeinen kehitys (suositeltu tekoälykehittäjille)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Edistynyt**: [Luku 4: Infrastruktuuri koodina](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Johdanto

Tämä kattava pikaopas tarjoaa nopean viitteen yleisimmin käytetyistä Azure Developer CLI -komennoista, järjestettynä kategorioittain käytännön esimerkkien kanssa. Täydellinen nopeisiin hakuhetkiin kehityksen, vianmäärityksen ja päivittäisten toimintojen aikana azd-projektien kanssa.

## Oppimistavoitteet

Tämän pikaoppaan avulla:
- Saat välittömän pääsyn oleellisiin Azure Developer CLI -komentoihin ja syntaksiin
- Ymmärrät komentojen järjestelyn toiminnallisten kategorioiden ja käyttötapauksien mukaan
- Löydät käytännön esimerkit yleisiin kehitys- ja käyttöönottoihin liittyviin tilanteisiin
- Käytössäsi on vianmäärityskomennot nopeaan ongelmanratkaisuun
- Löydät tehokkaasti edistyneet konfigurointi- ja mukautusvaihtoehdot
- Löydät ympäristöhallinnan ja monen ympäristön työnkulun komennot

## Oppimistulokset

Kun käytät tätä pikaopasta säännöllisesti, pystyt:
- Suorittamaan azd-komentoja luottavaisesti ilman täydellisten ohjeiden hakemista
- Ratkaisemaan nopeasti yleisiä ongelmia käyttämällä sopivia diagnostiikkakomentoja
- Hallitsemaan tehokkaasti useita ympäristöjä ja käyttöönotto-skenaarioita
- Soveltamaan tarvittaessa azd:n edistyneitä ominaisuuksia ja konfiguraatioita
- Vianmäärityksessä käyttämään järjestelmällisiä komentojonoja käyttöönotto-ongelmien ratkaisemiseksi
- Optimoimaan työnkulkuja azd-pikanäppäinten ja optioiden tehokkaalla käytöllä

## Aloituskomennot

### Autentikointi
```bash
# Kirjaudu Azureen AZD:n kautta
azd auth login

# Kirjaudu Azure CLI:iin (AZD käyttää tätä taustalla)
az login

# Tarkista nykyinen tili
az account show

# Aseta oletustilaus
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Kirjaudu ulos AZD:stä
azd auth logout

# Kirjaudu ulos Azure CLI:stä
az logout
```

### Projektin alustaminen
```bash
# Selaa saatavilla olevia malleja
azd template list

# Alusta mallista
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Alusta nykyiseen hakemistoon
azd init .

# Alusta mukautetulla nimellä
azd init --template todo-nodejs-mongo my-awesome-app
```

## Ydinkäyttöönoton komennot

### Koko käyttöönoton työnkulku
```bash
# Ota kaikki käyttöön (provisiointi + käyttöönotto)
azd up

# Ota käyttöön vahvistuskehotukset pois käytöstä
azd up --confirm-with-no-prompt

# Ota käyttöön tiettyyn ympäristöön
azd up --environment production

# Ota käyttöön mukautetuilla parametreilla
azd up --parameter location=westus2
```

### Pelkkä infrastruktuuri
```bash
# Ota Azure-resurssit käyttöön
azd provision

# 🧪 Esikatsele infrastruktuurin muutoksia
azd provision --preview
# Näyttää kuivaharjoituksen näkymän siitä, mitä resursseja luotaisiin/muutettaisiin/poistettaisiin
# Samanlainen kuin 'terraform plan' tai 'bicep what-if' - turvallinen suorittaa, muutoksia ei tehdä
```

### Pelkkä sovellus
```bash
# Ota sovelluskoodi käyttöön
azd deploy

# Ota tietty palvelu käyttöön
azd deploy --service web
azd deploy --service api

# Ota kaikki palvelut käyttöön
azd deploy --all
```

### Rakenna ja pakkaa
```bash
# Rakenna sovelluksia
azd package

# Rakenna tietty palvelu
azd package --service api
```

## 🌍 Ympäristöhallinta

### Ympäristötoiminnot
```bash
# Listaa kaikki ympäristöt
azd env list

# Luo uusi ympäristö
azd env new development
azd env new staging --location westus2

# Valitse ympäristö
azd env select production

# Näytä nykyinen ympäristö
azd env show

# Päivitä ympäristön tila
azd env refresh
```

### Ympäristömuuttujat
```bash
# Aseta ympäristömuuttuja
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Hae ympäristömuuttujan arvo
azd env get API_KEY

# Listaa kaikki ympäristömuuttujat
azd env get-values

# Poista ympäristömuuttuja
azd env unset DEBUG
```

## ⚙️ Konfigurointikomennot

### Globaalit asetukset
```bash
# Listaa kaikki konfiguraatiot
azd config list

# Aseta globaalit oletusarvot
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Poista konfiguraatio
azd config unset defaults.location

# Nollaa kaikki konfiguraatiot
azd config reset
```

### Projektiasetukset
```bash
# Validoi azure.yaml
azd config validate

# Näytä projektin tiedot
azd show

# Hae palveluiden päätepisteet
azd show --output json
```

## 📊 Valvonta ja diagnostiikka

### Valvontapaneeli
```bash
# Avaa Azure-portaalin valvontapaneeli
azd monitor

# Avaa Application Insightsin reaaliaikaiset mittarit
azd monitor --live

# Avaa Application Insightsin lokit-ruutu
azd monitor --logs

# Avaa Application Insightsin yleiskatsaus
azd monitor --overview
```

### Konttien lokien katselu
```bash
# Näytä lokit Azure CLI:llä (Container Appsille)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Seuraa lokkeja reaaliajassa
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Näytä lokit Azure-portaalista
azd monitor --logs
```

### Logianalytiikan kyselyt
```bash
# Käytä Log Analyticsia Azure-portaalin kautta
azd monitor --logs

# Suorita lokikyselyjä Azure CLI:llä
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Ylläpitokomennot

### Siivous
```bash
# Poista kaikki Azure-resurssit
azd down

# Pakota poisto ilman vahvistusta
azd down --force

# Puhdista pehmeästi poistetut resurssit
azd down --purge

# Täydellinen siivous
azd down --force --purge
```

### Päivitykset
```bash
# Tarkista azd:n päivitykset
azd version

# Hae nykyinen versio
azd version

# Näytä nykyinen kokoonpano
azd config list
```

## 🔧 Edistyneet komennot

### Putkisto ja CI/CD
```bash
# Määritä GitHub Actions
azd pipeline config

# Määritä Azure DevOps
azd pipeline config --provider azdo

# Näytä putkiston määritys
azd pipeline show
```

### Infrastruktuurin hallinta
```bash
# Luo infrastruktuurin malleja
azd infra generate

# 🧪 Infrastruktuurin esikatselu ja suunnittelu
azd provision --preview
# Simuloi infrastruktuurin provisiointia ilman käyttöönottoa
# Analysoi Bicep- ja Terraform-malleja ja näyttää:
# - Lisättävät resurssit (vihreä +)
# - Muutettavat resurssit (keltainen ~)
# - Poistettavat resurssit (punainen -)
# Turvallista suorittaa - ei tehdä todellisia muutoksia Azure-ympäristöön

# Luo infrastruktuurin azure.yaml-tiedostosta
azd infra synth
```

### Projektitiedot
```bash
# Näytä projektin tila ja päätepisteet
azd show

# Näytä projektin yksityiskohtaiset tiedot JSON-muodossa
azd show --output json

# Hae palvelun päätepisteet
azd show --output json | jq '.services'
```

## 🎯 Pikatyönkulut

### Kehitystyönkulku
```bash
# Aloita uusi projekti
azd init --template todo-nodejs-mongo
cd my-project

# Ota käyttöön kehitysympäristöön
azd env new dev
azd up

# Tee muutoksia ja ota uudelleen käyttöön
azd deploy

# Avaa valvontapaneeli
azd monitor --live
```

### Moniympäristöinen työnkulku
```bash
# Määritä ympäristöt
azd env new dev
azd env new staging  
azd env new production

# Ota käyttöön deviin
azd env select dev
azd up

# Testaa ja siirrä stagingiin
azd env select staging
azd up

# Ota käyttöön tuotantoon
azd env select production
azd up
```

### Vianetsintätyönkulku
```bash
# Ota virheenkorjaustila käyttöön
export AZD_DEBUG=true

# Tarkista käyttöönoton tila
azd show

# Tarkista kokoonpano
azd config list

# Avaa valvontapaneeli lokien tarkastelua varten
azd monitor --logs

# Tarkista resurssin tila
azd show --output json
```

## 🔍 Debuggauskomennot

### Virheenkorjaustiedot
```bash
# Ota virheenkorjaustulostus käyttöön
export AZD_DEBUG=true
azd <command> --debug

# Poista telemetria käytöstä siistimmän tulosteen saamiseksi
export AZD_DISABLE_TELEMETRY=true

# Tarkista nykyinen kokoonpano
azd config list

# Tarkista todennuksen tila
az account show
```

### Mallien virheenkorjaus
```bash
# Listaa saatavilla olevat mallipohjat yksityiskohtineen
azd template list --output json

# Näytä mallipohjan tiedot
azd template show <template-name>

# Tarkista malli ennen alustamista
azd template validate <template-name>
```

## 📁 Tiedosto- ja hakemistokomennot

### Projektirakenne
```bash
# Näytä nykyinen hakemistorakenne
tree /f  # Windows
find . -type f  # Linux/macOS

# Siirry azd-projektin juurihakemistoon
cd $(azd root)

# Näytä azd:n konfiguraatiohakemisto
echo $AZD_CONFIG_DIR  # Yleensä ~/.azd
```

## 🎨 Tulosteen muotoilu

### JSON-tuloste
```bash
# Hanki JSON-tuloste skriptausta varten
azd show --output json
azd env list --output json
azd config list --output json

# Jäsennä jq:lla
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Taulukkomuoto
```bash
# Muotoile taulukoksi
azd env list --output table

# Näytä käyttöön otetut palvelut
azd show --output json | jq '.services | keys'
```

## 🔧 Yleiset komentoyhdistelmät

### Terveystarkistusskripti
```bash
#!/bin/bash
# Nopea terveystarkastus
azd show
azd env show
azd monitor --logs
```

### Käyttöönoton validointi
```bash
#!/bin/bash
# Käyttöönottoa edeltävä validointi
azd show
azd provision --preview  # Esikatsele muutoksia ennen käyttöönottoa
az account show
```

### Ympäristövertailu
```bash
#!/bin/bash
# Vertaile ympäristöjä
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resurssien puhdistusskripti
```bash
#!/bin/bash
# Siivoa vanhat ympäristöt
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Ympäristömuuttujat

### Yleiset ympäristömuuttujat
```bash
# Azure-konfiguraatio
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD-konfiguraatio
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Sovelluksen konfiguraatio
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Hätäkomennot

### Nopeat korjaukset
```bash
# Nollaa todennus
az account clear
az login

# Pakota ympäristön päivitys
azd env refresh

# Ota kaikki palvelut uudelleen käyttöön
azd deploy

# Tarkista käyttöönoton tila
azd show --output json
```

### Palautuskomennot
```bash
# Palauta epäonnistuneesta käyttöönotosta - siivoa ja ota uudelleen käyttöön
azd down --force --purge
azd up

# Vain infrastruktuurin uudelleenprovisiointi
azd provision

# Vain sovelluksen uudelleenkäyttöönotto
azd deploy
```

## 💡 Asiantuntijavinkkejä

### Lyhenteet nopeampaan työnkulkuun
```bash
# Lisää .bashrc- tai .zshrc-tiedostoosi
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Toimintojen pikavalinnat
```bash
# Nopea ympäristön vaihtaminen
azd-env() {
    azd env select $1 && azd show
}

# Nopea käyttöönotto valvonnalla
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Ympäristön tila
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ohje ja dokumentaatio

### Apu
```bash
# Yleinen ohje
azd --help
azd help

# Komentokohtainen ohje
azd up --help
azd env --help
azd config --help

# Näytä versio- ja rakennustiedot
azd version
azd version --output json
```

### Dokumenttilinkit
```bash
# Avaa dokumentaatio selaimessa
azd docs

# Näytä mallin dokumentaatio
azd template show <template-name> --docs
```

---

**Vinkki**: Lisää tämä pikaopas kirjanmerkkeihisi ja käytä `Ctrl+F` löytääksesi nopeasti tarvitsemasi komennot!

---

**Navigointi**
- **Edellinen oppitunti**: [Esitarkistukset](../docs/pre-deployment/preflight-checks.md)
- **Seuraava oppitunti**: [Sanasto](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttäen tekoälypohjaista käännöspalvelua Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää määräysvaltana/ensisijaisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaisen ihmiskääntäjän tekemää käännöstä. Emme ole vastuussa mistään tämän käännöksen käytöstä johtuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->