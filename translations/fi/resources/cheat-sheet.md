# Komentojen pikaopas - Olennaiset AZD-komennot

**Pikaviite kaikille luvuillesi**
- **📚 Kurssin etusivu**: [AZD For Beginners](../README.md)
- **📖 Nopea aloitus**: [Luku 1: Perusteet & Aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-komennot**: [Luku 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Edistynyt**: [Luku 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Johdanto

Tämä kattava pikaopas tarjoaa nopean viitteen yleisimmin käytetyistä Azure Developer CLI -komennoista, järjestettynä kategorioittain käytännön esimerkkien kanssa. Täydellinen nopeisiin hakuhetkiin kehityksen, vianmäärityksen ja päivittäisten azd-projektien toimintojen aikana.

## Oppimistavoitteet

Tämän pikaoppaan avulla:
- Saat välittömän pääsyn olennaisiin Azure Developer CLI -komentoihin ja syntaksiin
- Ymmärrät komentojen järjestelyn toiminnallisten kategorioiden ja käyttötapausten mukaan
- Löydät käytännön esimerkkejä yleisistä kehitys- ja käyttöönottilanteista
- Pääset vianmäärityskomentoihin nopeaa ongelmanratkaisua varten
- Löydät edistyneet konfigurointi- ja mukautusvaihtoehdot tehokkaasti
- Löydät ympäristönhallinta- ja moniympäristötyönkulkujen komennot

## Oppimistulokset

Säännöllisesti tätä pikaopasta käyttämällä pystyt:
- Suorittamaan azd-komentoja luottavaisesti ilman täydellistä dokumentaatiota
- Ratkaisemaan nopeasti yleisiä ongelmia sopivilla diagnostiikkakomennoilla
- Hallitsemaan tehokkaasti useita ympäristöjä ja käyttöönotto-skenaarioita
- Käyttämään tarvittaessa azd:n edistyneitä ominaisuuksia ja konfiguraatioita
- Vianmäärityksessä käyttämään järjestelmällisiä komentojonoja käyttöönotto-ongelmien ratkaisemiseksi
- Optimoimaan työnkulkuja azd:n pikavalintojen ja asetusten avulla

## Aloituskomennot

### Tunnistautuminen
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

### Projektin alustaminen
```bash
# Selaa saatavilla olevia malleja
azd template list

# Alusta mallipohjasta
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
# Ota kaikki käyttöön (provisionointi + käyttöönotto)
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
# Ota käyttöön Azure-resursseja
azd provision

# 🧪 Esikatsele infrastruktuurin muutoksia
azd provision --preview
# Näyttää esikatselun siitä, mitä resursseja luotaisiin/muokattaisiin/poistettaisiin
# Vastaava kuin 'terraform plan' tai 'bicep what-if' - turvallinen suorittaa, muutoksia ei sovelleta
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

### Kokoa ja pakkaa
```bash
# Palauta (lataa) sovelluksen riippuvuudet
azd restore

# Palauta tietty palvelu
azd restore --service api

# Rakenna käyttöönotettava artefakti ilman käyttöönottoa
azd package

# Rakenna tietty palvelu
azd package --service api
```

> **`azd restore`** lataa sovelluksesi riippuvuudet (npm, pip, NuGet, Maven jne.). Se suoritetaan automaattisesti `azd package`- ja `azd deploy`-komentojen aikana, joten sitä harvoin kutsutaan suoraan — aja se manuaalisesti esilataamaan riippuvuuksia (esimerkiksi CI-välimuistin lämmittämiseksi tai työskennelläksesi offline-tilassa myöhemmin).

> **`azd package`** rakentaa käyttöönottokelpoisen artefaktin (konttikuvan tai zipin) **ilman** sen työntämistä Azureen. Käytä sitä erikseen varmistaaksesi, että build onnistuu, tarkastellaksesi tuotosta tai tuottaaksesi artefaktin, jonka erillinen prosessi ottaa käyttöön myöhemmin. `azd deploy` pakkaa automaattisesti, joten tarvitset `azd package`-komentoa vain kun haluat artefaktin ilman käyttöönottoa.


## 🌍 Ympäristön hallinta

### Ympäristötoiminnot
```bash
# Listaa kaikki ympäristöt
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
azd config show

# Aseta globaalit oletusarvot
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Poista konfiguraatio
azd config unset defaults.location

# Nollaa kaikki asetukset
azd config reset
```

### Projektin asetukset
```bash
# Validoi azure.yaml
azd config validate

# Näytä projektin tiedot
azd show

# Hae palvelun päätepisteet
azd show --output json
```

## 📊 Valvonta ja diagnostiikka

### Valvontapaneeli
```bash
# Avaa Azure-portaalin monitorointinäkymä
azd monitor

# Avaa Application Insightsin reaaliaikaiset mittarit
azd monitor --live

# Avaa Application Insightsin lokkipaneeli
azd monitor --logs

# Avaa Application Insightsin yleiskatsaus
azd monitor --overview
```

### Konttilokien tarkastelu
```bash
# Näytä lokit Azure CLI:llä (Container Appsille)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Seuraa lokeja reaaliajassa
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Näytä lokit Azure-portaalista
azd monitor --logs
```

### Logianalytiikan kyselyt
```bash
# Käytä Log Analyticsia Azure-portaalin kautta
azd monitor --logs

# Tee lokikyselyjä Azure CLI:llä
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

### Putki ja CI/CD
```bash
# Määritä GitHub Actions
azd pipeline config

# Määritä Azure DevOps
azd pipeline config --provider azdo

# Näytä putken kokoonpano
azd pipeline show
```

### Infrastruktuurin hallinta
```bash
# Generoi infrastruktuurimalleja
azd infra generate

# 🧪 Infrastruktuurin esikatselu ja suunnittelu
azd provision --preview
# Simuloi infrastruktuurin provisiointia ilman varsinaista käyttöönottoa
# Analysoi Bicep/Terraform-malleja ja näyttää:
# - Lisättävät resurssit (vihreä +)
# - Muokattavat resurssit (keltainen ~)
# - Poistettavat resurssit (punainen -)
# Turvallista suorittaa — ei todellisia muutoksia Azure-ympäristöön

# Syntetisoi infrastruktuuri tiedostosta azure.yaml
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
# Luettele kaikki saatavilla olevat laajennukset (mukaan lukien tekoäly)
azd extension list

# Asenna Foundry Agents -laajennus
azd extension install azure.ai.agents

# Asenna Agent Skills -laajennus (esikatselu)
azd extension install azure.ai.skills

# Asenna Foundry Connections -laajennus (esikatselu)
azd extension install azure.ai.connections

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

# Testaa otettu käyttöön oleva agentti (tulostaa latenssin ja ensimmäisen tavun vastaanottoajan)
azd ai agent invoke

# Näytä aktiivisen päätepisteen määritykset
azd ai agent endpoint show

# Luo arviointiaineisto ja optimoi sitten agentti
azd ai agent eval generate
azd ai agent optimize

# Lataa koodipohjaisen isännöidyn agentin käytössä oleva lähdekoodi
azd ai agent code download

# Poista isännöity agentti ja kaikki sen versiot (--force lopettaa aktiiviset istunnot)
azd ai agent delete --force
```

### MCP-palvelin (Alpha)
```bash
# Käynnistä MCP-palvelin projektiasi varten
azd mcp start

# Hallitse työkalujen suostumuksia MCP-toimintoja varten
azd copilot consent list
```

### Infrastruktuurin generointi
```bash
# Luo IaC-tiedostot projektimäärityksestäsi
azd infra generate

# Luo infrastruktuurin azure.yaml-tiedostosta
azd infra synth
```

---

## 🎯 Nopeat työnkulut

### Kehitystyönkulku
```bash
# Aloita uusi projekti
azd init --template todo-nodejs-mongo
cd my-project

# Julkaise kehitysympäristöön
azd env new dev
azd up

# Tee muutoksia ja julkaise uudelleen
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

# Julkaise kehitykseen
azd env select dev
azd up

# Testaa ja siirrä esituotantoon
azd env select staging
azd up

# Julkaise tuotantoon
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

# Avaa lokien valvontapaneeli
azd monitor --logs

# Tarkista resurssin tila
azd show --output json
```

## 🔍 Debuggauskomennot

### Debug-tiedot
```bash
# Ota virheenkorjaustulostus käyttöön
export AZD_DEBUG=true
azd <command> --debug

# Poista telemetria käytöstä puhtaampaa tulostusta varten
export AZD_DISABLE_TELEMETRY=true

# Tarkista nykyinen kokoonpano
azd config show

# Tarkista todennuksen tila
az account show
```

### Mallien debuggaus
```bash
# Listaa saatavilla olevat mallit yksityiskohtineen
azd template list --output json

# Näytä mallin tiedot
azd template show <template-name>

# Validoi malli ennen alustusta
azd template validate <template-name>
```

## 📁 Tiedosto- ja hakemistokomennot

### Projektin rakenne
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

### JSON-tulos
```bash
# Hae JSON-ulostulo skriptien käyttöä varten
azd show --output json
azd env list --output json
azd config show --output json

# Jäsennä jq:llä
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Taulukkoesitys
```bash
# Muotoile taulukoksi
azd env list --output table

# Näytä käyttöönotetut palvelut
azd show --output json | jq '.services | keys'
```

## 🔧 Yleiset komentoyhdistelmät

### Terveystarkastus-skripti
```bash
#!/bin/bash
# Nopea terveystarkastus
azd show
azd env get-values
azd monitor --logs
```

### Käyttöönoton validointi
```bash
#!/bin/bash
# Ennen käyttöönottoa tehtävä validointi
azd show
azd provision --preview  # Esikatsele muutoksia ennen käyttöönottoa
az account show
```

### Ympäristöjen vertailu
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
# Siivoa vanhoja ympäristöjä
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
# Palauta epäonnistuneesta käyttöönotosta - puhdista ja ota uudelleen käyttöön
azd down --force --purge
azd up

# Provisioi vain infrastruktuuri uudelleen
azd provision

# Ota vain sovellus uudelleen käyttöön
azd deploy
```

## 💡 Ammattilaisvinkkejä

### Alias-komennot nopeampaan työnkulkuun
```bash
# Lisää .bashrc- tai .zshrc-tiedostoosi
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Toimintojen pikakomennot
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

### Avun saanti
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

### Dokumenttilinkit
```bash
# Avaa dokumentaatio selaimessa
azd docs

# Näytä mallin dokumentaatio
azd template show <template-name> --docs
```

---

**Vinkki**: Tallenna tämä pikaopas kirjanmerkkeihin ja käytä `Ctrl+F` löytääksesi nopeasti tarvitsemiasi komentoja!

---

**Navigointi**
- **Edellinen oppitunti**: [Ennakko-tarkistukset](../docs/pre-deployment/preflight-checks.md)
- **Seuraava oppitunti**: [Sanasto](glossary.md)

---

> **💡 Haluatko Azure-komentoapua editoriisi?** Asenna [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) komennolla `npx skills add microsoft/github-copilot-for-azure` — 37 taitoa AI:ta, Foundryä, käyttöönottoa, diagnostiikkaa ja muuta varten.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->