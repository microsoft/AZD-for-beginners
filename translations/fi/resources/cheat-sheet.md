# Command Cheat Sheet - Essential AZD Commands

**Nopeat viitteet kaikille luvuillesi**
- **📚 Kurssin etusivu**: [AZD For Beginners](../README.md)
- **📖 Pika-aloitus**: [Luku 1: Perusteet & Pika-aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-komennot**: [Luku 2: AI-ensimmäinen kehitys](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Edistynyt**: [Luku 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Johdanto

Tämä kattava pikalista tarjoaa nopean viitteen yleisimmin käytetyille Azure Developer CLI -komennoille, järjestettynä kategorioittain käytännön esimerkkien kera. Täydellinen pikaosoitus kehityksen, vianmäärityksen ja päivittäisten toimintojen aikana azd-projektien kanssa.

## Oppimistavoitteet

Tämän pikalistan avulla:
- Saat välittömän pääsyn olennaisiin Azure Developer CLI -komentoihin ja syntaksiin
- Ymmärrät komentojen järjestämisen toiminnallisten kategorioiden ja käyttötapausten mukaan
- Löydät käytännön esimerkkejä yleisille kehitys- ja käyttöönototilanteille
- Pääset käsiksi vianmäärityskomentoihin nopeaa ongelmanratkaisua varten
- Löydät tehokkaasti edistyneet konfigurointi- ja mukautusvaihtoehdot
- Löydät ympäristöhallinnan ja monen ympäristön työnkulut

## Oppimistulokset

Kun viittaat tähän pikalistaan säännöllisesti, pystyt:
- Suorittamaan azd-komentoja luottavaisin mielin ilman täydellistä dokumentaatiota
- Ratkaisemaan nopeasti yleisiä ongelmia sopivilla diagnostiikkakomennoilla
- Hallinnoimaan tehokkaasti useita ympäristöjä ja käyttöönotto-tilanteita
- Soveltamaan tarvittaessa azd:n edistyneitä ominaisuuksia ja konfiguraatioita
- Vianmäärityksessä käyttämään systemaattisia komentojonoja
- Optimoimaan työnkulkuja azd-pikanäppäinten ja vaihtoehtojen avulla

## Aloituskomennot

### Autentikointi
```bash
# Kirjaudu Azureen AZD:n kautta
azd auth login

# Kirjaudu Azure CLI:hin (AZD käyttää tätä taustalla)
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

### Projektin alustus
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

## Keskeiset käyttöönotto-komennot

### Täydellinen käyttöönoton työnkulku
```bash
# Ota kaikki käyttöön (provisiointi + käyttöönotto)
azd up

# Ota käyttöön ilman vahvistuskehotteita
azd up --confirm-with-no-prompt

# Ota käyttöön tiettyyn ympäristöön
azd up --environment production

# Ota käyttöön mukautetuilla parametreilla
azd up --parameter location=westus2
```

### Vain infrastruktuuri
```bash
# Provisionoi Azure-resursseja
azd provision

# 🧪 Esikatsele infrastruktuurin muutoksia
azd provision --preview
# Näyttää simuloidun näkymän siitä, mitä resursseja luotaisiin/muutettaisiin/poistettaisiin
# Vastaava kuin 'terraform plan' tai 'bicep what-if' - turvallinen suorittaa, muutoksia ei tehdä
```

### Vain sovellus
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

# Hae ympäristömuuttuja
azd env get API_KEY

# Listaa kaikki ympäristömuuttujat
azd env get-values

# Poista ympäristömuuttuja
azd env unset DEBUG
```

## ⚙️ Asetuskomennot

### Globaalit asetukset
```bash
# Listaa kaikki asetukset
azd config list

# Aseta globaalit oletusarvot
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Poista asetukset
azd config unset defaults.location

# Nollaa kaikki asetukset
azd config reset
```

### Projektin asetukset
```bash
# Tarkista azure.yaml
azd config validate

# Näytä projektin tiedot
azd show

# Hae palvelun päätepisteet
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
# Näytä lokit Azure CLI:n kautta (Container Appsille)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Seuraa lokeja reaaliajassa
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Näytä lokit Azure-portaalista
azd monitor --logs
```

### Lokianalytiikkakyselyt
```bash
# Käytä Log Analyticsia Azure-portaalin kautta
azd monitor --logs

# Suorita lokikyselyjä Azure CLI:n avulla
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

# Poista pysyvästi pehmeästi poistetut resurssit
azd down --purge

# Täydellinen siivous
azd down --force --purge
```

### Päivitykset
```bash
# Tarkista azd-päivitykset
azd version

# Hae nykyinen versio
azd version

# Näytä nykyinen kokoonpano
azd config list
```

## 🔧 Edistyneet komennot

### CI/CD-putket
```bash
# Määritä GitHub Actions
azd pipeline config

# Määritä Azure DevOps
azd pipeline config --provider azdo

# Näytä putkiasetukset
azd pipeline show
```

### Infrastruktuurin hallinta
```bash
# Luo infrastruktuuripohjia
azd infra generate

# 🧪 Infrastruktuurin esikatselu ja suunnittelu
azd provision --preview
# Simuloi infrastruktuurin provisiointia ilman käyttöönottoa
# Analysoi Bicep/Terraform-malleja ja näyttää:
# - Lisättävät resurssit (vihreä +)
# - Muutettavat resurssit (keltainen ~)
# - Poistettavat resurssit (punainen -)
# Turvallinen ajaa - ei todellisia muutoksia Azure-ympäristöön

# Synteesaa infrastruktuurin tiedostosta azure.yaml
azd infra synth
```

### Projektitiedot
```bash
# Näytä projektin tila ja päätepisteet
azd show

# Näytä yksityiskohtaiset projektitiedot JSON-muodossa
azd show --output json

# Hae palvelun päätepisteet
azd show --output json | jq '.services'
```

## 🤖 AI- ja laajennuskomennot

### AZD-laajennukset
```bash
# Listaa kaikki saatavilla olevat laajennukset (mukaan lukien tekoäly)
azd extension list

# Asenna Foundry Agents -laajennus
azd extension install azure.ai.agents

# Asenna hienosäätölaajennus
azd extension install azure.ai.finetune

# Asenna mukautettujen mallien laajennus
azd extension install azure.ai.models

# Päivitä kaikki asennetut laajennukset
azd extension upgrade --all
```

### AI-agenttikomennot
```bash
# Alusta agenttiprojekti manifestista
azd ai agent init -m <manifest-path-or-uri>

# Kohdista tiettyyn Foundry-projektiin
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Määritä agentin lähdekansio
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Valitse isännöintikohde
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP-palvelin (Alpha)
```bash
# Käynnistä MCP-palvelin projektillesi
azd mcp start

# Hallitse työkalun suostumusta MCP-toimintoja varten
azd mcp consent
```

### Infrastruktuurin generointi
```bash
# Luo IaC-tiedostot projektimääritelmästäsi
azd infra generate

# Syntetisoi infrastruktuuri azure.yaml-tiedostosta
azd infra synth
```

---

## 🎯 Nopeat työnkulut

### Kehitystyönkulku
```bash
# Aloita uusi projekti
azd init --template todo-nodejs-mongo
cd my-project

# Julkaise kehitykseen
azd env new dev
azd up

# Tee muutoksia ja julkaise uudelleen
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

# Julkaise kehitykseen
azd env select dev
azd up

# Testaa ja siirrä staging-ympäristöön
azd env select staging
azd up

# Julkaise tuotantoon
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

# Avaa valvontapaneeli lokeille
azd monitor --logs

# Tarkista resurssien tila
azd show --output json
```

## 🔍 Virheenkorjauskomennot

### Virheenkorjaustiedot
```bash
# Ota virheenkorjaustulostus käyttöön
export AZD_DEBUG=true
azd <command> --debug

# Poista telemetria käytöstä selkeämmän tulostuksen saamiseksi
export AZD_DISABLE_TELEMETRY=true

# Tarkista nykyinen kokoonpano
azd config list

# Tarkista todennuksen tila
az account show
```

### Mallin virheenkorjaus
```bash
# Luettele saatavilla olevat mallipohjat yksityiskohtineen
azd template list --output json

# Näytä mallipohjan tiedot
azd template show <template-name>

# Validoi mallipohja ennen alustusta
azd template validate <template-name>
```

## 📁 Tiedosto- ja hakemistokomennot

### Projektin rakenne
```bash
# Näytä nykyinen hakemistorakenne
tree /f  # Windows
find . -type f  # Linux/macOS

# Siirry azd-projektin juureen
cd $(azd root)

# Näytä azd:n asetuskansio
echo $AZD_CONFIG_DIR  # Yleensä ~/.azd
```

## 🎨 Tulosteen muotoilu

### JSON-tuloste
```bash
# Hanki JSON-ulostulo skriptausta varten
azd show --output json
azd env list --output json
azd config list --output json

# Jäsennä jq:llä
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Taulukkotuloste
```bash
# Muotoile taulukoksi
azd env list --output table

# Näytä käyttöön otetut palvelut
azd show --output json | jq '.services | keys'
```

## 🔧 Yleiset komentoyhdistelmät

### Terveystarkistus-skripti
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
# Ennen käyttöönottoa tehtävä tarkastus
azd show
azd provision --preview  # Esikatsele muutokset ennen käyttöönottoa
az account show
```

### Ympäristövertailu
```bash
#!/bin/bash
# Vertaa ympäristöjä
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resurssien siivousskripti
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

### Pikakorjaukset
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
# Palauta epäonnistuneesta käyttöönotosta - puhdista ja ota uudelleen käyttöön
azd down --force --purge
azd up

# Provisioi vain infrastruktuuri uudelleen
azd provision

# Ota vain sovellus uudelleen käyttöön
azd deploy
```

## 💡 Vinkkejä

### Alias-komennot nopeampaan työnkulkuun
```bash
# Lisää omaan .bashrc- tai .zshrc-tiedostoosi
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktion pikanäppäimet
```bash
# Nopea ympäristöjen vaihtaminen
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

### Apua
```bash
# Yleinen ohje
azd --help
azd help

# Komentokohtainen ohje
azd up --help
azd env --help
azd config --help

# Näytä versio- ja koontitiedot
azd version
azd version --output json
```

### Dokumentaatio-linkit
```bash
# Avaa dokumentaatio selaimessa
azd docs

# Näytä mallin dokumentaatio
azd template show <template-name> --docs
```

---

**Vinkki**: Tallenna tämä pikalista kirjanmerkkeihin ja käytä `Ctrl+F` löytääksesi nopeasti tarvitsemasi komennot!

---

**Navigointi**
- **Edellinen oppitunti**: [Esitarkistukset](../docs/pre-deployment/preflight-checks.md)
- **Seuraava oppitunti**: [Sanasto](glossary.md)

---

> **💡 Haluatko apua Azure-komennoissa editorissasi?** Asenna [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) komennolla `npx skills add microsoft/github-copilot-for-azure` — 37 skilliä AI:ta, Foundrya, käyttöönottoa, diagnostiikkaa ja muuta varten.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen omalla kielellä tulisi pitää auktoritatiivisena lähteenä. Tärkeitä tietoja koskien suositellaan ammattimaista ihmisen tekemää käännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->