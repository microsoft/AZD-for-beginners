<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:24:01+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "fi"
}
-->
# AZD-perusteet - Ymmärrä Azure Developer CLI

## Johdanto

Tässä oppitunnissa tutustut Azure Developer CLI:hin (azd), tehokkaaseen komentorivityökaluun, joka nopeuttaa siirtymistä paikallisesta kehityksestä Azure-julkaisuun. Opit peruskäsitteet, keskeiset ominaisuudet ja ymmärrät, miten azd yksinkertaistaa pilvinatiivien sovellusten käyttöönottoa.

## Oppimistavoitteet

Tämän oppitunnin lopussa osaat:
- Ymmärtää, mikä Azure Developer CLI on ja sen ensisijaisen tarkoituksen
- Oppia keskeiset käsitteet, kuten templatet, ympäristöt ja palvelut
- Tutustua tärkeimpiin ominaisuuksiin, kuten template-pohjaiseen kehitykseen ja Infrastructure as Codeen
- Ymmärtää azd-projektin rakenteen ja työnkulun
- Olla valmis asentamaan ja konfiguroimaan azd kehitysympäristöäsi varten

## Oppimistulokset

Oppitunnin suoritettuasi pystyt:
- Selittämään azd:n roolin modernissa pilvikehityksen työnkulussa
- Tunnistamaan azd-projektin rakenteen osat
- Kuvailemaan, miten templatet, ympäristöt ja palvelut toimivat yhdessä
- Ymmärtämään Infrastructure as Coden hyödyt azd:n avulla
- Tunnistamaan erilaisia azd-komentoja ja niiden tarkoitukset

## Mikä on Azure Developer CLI (azd)?

Azure Developer CLI (azd) on komentorivityökalu, joka on suunniteltu nopeuttamaan siirtymistä paikallisesta kehityksestä Azure-julkaisuun. Se yksinkertaistaa pilvinatiivien sovellusten rakentamista, käyttöönottoa ja hallintaa Azure-alustalla.

## Keskeiset käsitteet

### Templatet
Templatet ovat azd:n perusta. Ne sisältävät:
- **Sovelluskoodi** - Lähdekoodisi ja riippuvuudet
- **Infrastruktuurin määrittelyt** - Azure-resurssit määriteltynä Bicepillä tai Terraformilla
- **Konfiguraatiotiedostot** - Asetukset ja ympäristömuuttujat
- **Julkaisuskriptit** - Automatisoidut julkaisutyönkulut

### Ympäristöt
Ympäristöt edustavat eri julkaisukohteita:
- **Kehitys** - Testausta ja kehitystä varten
- **Staging** - Esituotantoympäristö
- **Tuotanto** - Käytössä oleva tuotantoympäristö

Jokaisella ympäristöllä on omat:
- Azure-resurssiryhmät
- Konfiguraatioasetukset
- Julkaisutila

### Palvelut
Palvelut ovat sovelluksesi rakennuspalikoita:
- **Frontend** - Verkkosovellukset, yksisivuiset sovellukset (SPA)
- **Backend** - API:t, mikropalvelut
- **Tietokanta** - Tiedon tallennusratkaisut
- **Tallennus** - Tiedosto- ja blob-tallennus

## Keskeiset ominaisuudet

### 1. Template-pohjainen kehitys
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azuren oma domain-spesifinen kieli
- **Terraform** - Monipilvi-infrastruktuurityökalu
- **ARM-templatet** - Azure Resource Manager -templatet

### 3. Integroitu työnkulku
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Ympäristön hallinta
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Projektin rakenne

Tyypillinen azd-projektin rakenne:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Konfiguraatiotiedostot

### azure.yaml
Projektin pääkonfiguraatiotiedosto:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Ympäristökohtainen konfiguraatio:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Yleiset työnkulut

### Uuden projektin aloittaminen
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Kehityssykli
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Ymmärrä `azd down --force --purge`
Komento `azd down --force --purge` on tehokas tapa purkaa kokonaan azd-ympäristö ja kaikki siihen liittyvät resurssit. Tässä on erittely, mitä kukin lippu tekee:
```
--force
```
- Ohittaa vahvistuskehotteet.
- Hyödyllinen automaatiossa tai skriptauksessa, jossa manuaalinen syöte ei ole mahdollista.
- Varmistaa, että purku etenee keskeytyksettä, vaikka CLI havaitsee epäjohdonmukaisuuksia.

```
--purge
```
Poistaa **kaiken siihen liittyvän metadatan**, mukaan lukien:
Ympäristön tila  
Paikallinen `.azure`-kansio  
Välimuistissa oleva julkaisun tieto  
Estää azd:tä "muistamasta" aiempia julkaisuja, mikä voi aiheuttaa ongelmia, kuten resurssiryhmien ristiriitoja tai vanhentuneita rekisteriviittauksia.

### Miksi käyttää molempia?
Kun kohtaat ongelmia `azd up` -komennon kanssa johtuen jäljelle jääneestä tilasta tai osittaisista julkaisuista, tämä yhdistelmä varmistaa **puhtaan aloituspisteen**.

Se on erityisen hyödyllinen manuaalisten resurssien poistojen jälkeen Azure-portaalissa tai vaihdettaessa templatet, ympäristöt tai resurssiryhmien nimeämiskäytännöt.

### Useiden ympäristöjen hallinta
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Navigointikomennot

### Löytäminen
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Projektinhallinta
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Seuranta
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Parhaat käytännöt

### 1. Käytä merkityksellisiä nimiä
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Hyödynnä templatet
- Aloita olemassa olevista templateista
- Mukauta tarpeidesi mukaan
- Luo uudelleenkäytettäviä templatet organisaatiollesi

### 3. Ympäristöjen eristäminen
- Käytä erillisiä ympäristöjä kehitykseen, stagingiin ja tuotantoon
- Älä koskaan julkaise suoraan tuotantoon paikalliselta koneelta
- Käytä CI/CD-putkia tuotantojulkaisuihin

### 4. Konfiguraation hallinta
- Käytä ympäristömuuttujia arkaluontoisille tiedoille
- Pidä konfiguraatio versionhallinnassa
- Dokumentoi ympäristökohtaiset asetukset

## Oppimispolku

### Aloittelija (Viikot 1-2)
1. Asenna azd ja todenna
2. Julkaise yksinkertainen template
3. Ymmärrä projektin rakenne
4. Opettele peruskomennot (up, down, deploy)

### Keskitaso (Viikot 3-4)
1. Mukauta templatet
2. Hallitse useita ympäristöjä
3. Ymmärrä infrastruktuurikoodi
4. Määritä CI/CD-putket

### Edistynyt (Viikko 5+)
1. Luo omia templatet
2. Kehittyneet infrastruktuurimallit
3. Monialueiset julkaisut
4. Yritystason konfiguraatiot

## Seuraavat askeleet

- [Asennus ja määritys](installation.md) - Asenna ja konfiguroi azd
- [Ensimmäinen projektisi](first-project.md) - Käytännön opas
- [Konfiguraatio-opas](configuration.md) - Edistyneet konfigurointivaihtoehdot

## Lisäresurssit

- [Azure Developer CLI -yleiskatsaus](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Template-galleria](https://azure.github.io/awesome-azd/)
- [Yhteisön esimerkit](https://github.com/Azure-Samples)

---

**Navigointi**
- **Edellinen oppitunti**: [README](../../README.md)
- **Seuraava oppitunti**: [Asennus ja määritys](installation.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Pyrimme tarkkuuteen, mutta huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskääntämistä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinkäsityksistä tai virhetulkinnoista.