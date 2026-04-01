# Komentopikaopas - Olennaiset AZD-komennot

**Nopea viite kaikille luvuillesi**
- **📚 Kurssin kotisivu**: [AZD For Beginners](../README.md)
- **📖 Pika-aloitus**: [Luku 1: Perusta & pika-aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-komennot**: [Luku 2: AI-ensimmäinen kehitys](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Edistynyt**: [Luku 4: Infrastruktuuri koodina](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Johdanto

Tämä kattava pikaopas tarjoaa nopean viitteen yleisimmin käytetyistä Azure Developer CLI -komennoista, järjestettynä kategorioittain käytännön esimerkkien kanssa. Täydellinen pikaista hakua varten kehityksen, vianmäärityksen ja päivittäisten azd-projektien operaatioiden aikana.

## Oppimistavoitteet

Tämän pikaoppaan avulla:
- Saat välittömän pääsyn olennaisiin Azure Developer CLI -komentoihin ja syntaksiin
- Ymmärrät komentojen järjestelyn toiminnallisten kategorioiden ja käyttötapausten mukaan
- Löydät käytännön esimerkkejä yleisistä kehitys- ja käyttöönotto-skenaarioista
- Saat käyttöösi vianmäärityskomennot nopeaan ongelmanratkaisuun
- Löydät tehokkaasti edistyneet konfigurointi- ja mukautusvaihtoehdot
- Löydät ympäristöhallinnan ja monen ympäristön työnkulun komennot

## Oppimistulokset

Kun viittaat säännöllisesti tähän pikaoppaaseen, pystyt:
- Suorittamaan azd-komentoja luottavaisesti ilman koko dokumentaation tarkistamista
- Ratkaisemaan nopeasti yleisiä ongelmia asianmukaisilla diagnostiikk komennoilla
- Hallitsemaan tehokkaasti useita ympäristöjä ja käyttöönotto-skenaarioita
- Käyttämään edistyneitä azd-ominaisuuksia ja konfiguraatioasetuksia tarpeen mukaan
- Vianmäärityksessä systemaattisesti käytettävien komentojonojen avulla
- Optimisoimaan työnkulkuja azd-pikanäppäinten ja -asetusten avulla

## Aloituskomennot

### Todennus
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

## Keskeiset käyttöönotto-komennot

### Täydellinen käyttöönoton työnkulku
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
# Näyttää simuloidun näkymän siitä, mitä resursseja luotaisiin, muokattaisiin tai poistettaisiin
# Vastaava kuin 'terraform plan' tai 'bicep what-if' - turvallinen ajaa, ei tee muutoksia
```

### Pelkkä sovellus
```bash
# Ota sovelluksen koodi käyttöön
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

## 🌍 Ympäristön hallinta

### Ympäristötoiminnot
```bash
# Näytä kaikki ympäristöt
azd env list

# Luo uusi ympäristö
azd env new development
azd env new staging --location westus2

# Valitse ympäristö
azd env select production

# Näytä saatavilla olevat ympäristöt
azd env list

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

### Globaali konfigurointi
```bash
# Listaa kaikki konfiguraatiot
azd config show

# Aseta globaalit oletusarvot
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Poista konfiguraatio
azd config unset defaults.location

# Nollaa kaikki konfiguraatiot
azd config reset
```

### Projektin konfigurointi
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

### Säiliölokien katselu
```bash
# Näytä lokit Azure CLI:llä (Container Appsille)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Seuraa lokeja reaaliajassa
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Näytä lokit Azure-portaalista
azd monitor --logs
```

### Lokianalytiikan kyselyt
```bash
# Käytä Log Analyticsia Azure-portaalin kautta
azd monitor --logs

# Suorita lokikyselyt Azure CLI:llä
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

# Poista lopullisesti pehmeästi poistetut resurssit
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

# Näytä nykyinen konfiguraatio
azd config show
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
# Luo infrastruktuurimalleja
azd infra generate

# 🧪 Infrastruktuurin esikatselu ja suunnittelu
azd provision --preview
# Simuloi infrastruktuurin provisiointia ilman käyttöönottoa
# Analysoi Bicep/Terraform-malleja ja näyttää:
# - Lisättävät resurssit (vihreä +)
# - Muokattavat resurssit (keltainen ~)
# - Poistettavat resurssit (punainen -)
# Turvallinen suorittaa - ei tee todellisia muutoksia Azure-ympäristöön

# Syntetisoi infrastruktuuri azure.yaml-tiedostosta
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

### MCP-palvelin (Alfa)
```bash
# Käynnistä projektisi MCP-palvelin
azd mcp start

# Hallitse työkalun suostumusta MCP-toimintoihin
azd copilot consent list
```

### Infrastruktuurin generointi
```bash
# Luo IaC-tiedostot projektisi määritelmästä
azd infra generate

# Luo infrastruktuuri azure.yaml-tiedostosta
azd infra synth
```

---

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

### Moniympäristötyönkulku
```bash
# Määritä ympäristöt
azd env new dev
azd env new staging  
azd env new production

# Ota käyttöön kehitysympäristöön
azd env select dev
azd up

# Testaa ja siirrä staging-ympäristöön
azd env select staging
azd up

# Ota käyttöön tuotantoympäristöön
azd env select production
azd up
```

### Vianmääritystyönkulku
```bash
# Ota virheenkorjaustila käyttöön
export AZD_DEBUG=true

# Tarkista käyttöönoton tila
azd show

# Tarkista kokoonpano
azd config show

# Avaa valvontapaneeli lokien tarkastelua varten
azd monitor --logs

# Tarkista resurssin tila
azd show --output json
```

## 🔍 Debuggauskomennot

### Virheenkorjaustiedot
```bash
# Ota debug-tulostus käyttöön
export AZD_DEBUG=true
azd <command> --debug

# Poista telemetria käytöstä selkeämmän tulosteen saamiseksi
export AZD_DISABLE_TELEMETRY=true

# Tarkista nykyinen konfiguraatio
azd config show

# Tarkista todennuksen tila
az account show
```

### Mallin virheenkorjaus
```bash
# Listaa saatavilla olevat mallit yksityiskohtineen
azd template list --output json

# Näytä mallin tiedot
azd template show <template-name>

# Tarkista malli ennen alustusta
azd template validate <template-name>
```

## 📁 Tiedosto- ja kansiokomennot

### Projektirakenne
```bash
# Näytä nykyinen hakemistorakenne
tree /f  # Windows
find . -type f  # Linux/macOS

# Siirry azd-projektin juureen
cd $(azd root)

# Näytä azd:n konfiguraatiohakemisto
echo $AZD_CONFIG_DIR  # Yleensä ~/.azd
```

## 🎨 Tulosteen muotoilu

### JSON-tulos
```bash
# Hanki JSON-muotoinen tuloste skriptausta varten
azd show --output json
azd env list --output json
azd config show --output json

# Jäsennä jq:lla
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Taulukkomuoto
```bash
# Muotoile taulukoksi
azd env list --output table

# Näytä käyttöönotetut palvelut
azd show --output json | jq '.services | keys'
```

## 🔧 Yleiset komentoyhdistelmät

### Terveystarkastusskripti
```bash
#!/bin/bash
# Nopea kunnon tarkistus
azd show
azd env get-values
azd monitor --logs
```

### Käyttöönoton validointi
```bash
#!/bin/bash
# Ennakkotarkastus ennen käyttöönottoa
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
# Azure-asetukset
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD-asetukset
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Sovelluksen asetukset
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
# Palauta epäonnistuneesta käyttöönotosta - puhdista ja ota uudelleen käyttöön
azd down --force --purge
azd up

# Uudelleenprovisionoi vain infrastruktuuri
azd provision

# Ota vain sovellus uudelleen käyttöön
azd deploy
```

## 💡 Pro-vinkit

### Aliakset nopeampaan työnkulkuun
```bash
# Lisää .bashrc- tai .zshrc-tiedostoosi
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktiopikanäppäimet
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ohje ja dokumentaatio

### Ohjeen saaminen
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

### Dokumentaatiolinkit
```bash
# Avaa dokumentaatio selaimessa
azd docs

# Näytä mallipohjan dokumentaatio
azd template show <template-name> --docs
```

---

**Vinkki**: Lisää tämä pikaopas kirjanmerkkeihin ja käytä `Ctrl+F` löytääksesi nopeasti tarvitsemasi komennot!

---

**Navigointi**
- **Edellinen oppitunti**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Seuraava oppitunti**: [Sanasto](glossary.md)

---

> **💡 Haluatko Azure-komentoapua editorissasi?** Asenna [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) komennolla `npx skills add microsoft/github-copilot-for-azure` — 37 taitoa tekoälyyn, Foundryyn, käyttöönottoon, diagnostiikkaan ja muihin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, on hyvä tiedostaa, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää ensisijaisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->