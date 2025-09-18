<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-18T06:34:58+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "fi"
}
-->
# AZD Perusteet - Azure Developer CLI:n Ymmärtäminen

# AZD Perusteet - Keskeiset Käsitteet ja Perusasiat

**Luvun Navigointi:**
- **📚 Kurssin Etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen Luku**: Luku 1 - Perusta & Nopea Aloitus
- **⬅️ Edellinen**: [Kurssin Yleiskatsaus](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Seuraava**: [Asennus & Käyttöönotto](installation.md)
- **🚀 Seuraava Luku**: [Luku 2: AI-Ensisijainen Kehitys](../ai-foundry/azure-ai-foundry-integration.md)

## Johdanto

Tässä osiossa tutustut Azure Developer CLI:hin (azd), tehokkaaseen komentorivityökaluun, joka nopeuttaa siirtymistä paikallisesta kehityksestä Azure-järjestelmään. Opit keskeiset käsitteet, tärkeimmät ominaisuudet ja ymmärrät, kuinka azd yksinkertaistaa pilvinatiivien sovellusten käyttöönottoa.

## Oppimistavoitteet

Tämän osion lopussa:
- Ymmärrät, mitä Azure Developer CLI on ja sen pääasiallisen tarkoituksen
- Opit keskeiset käsitteet, kuten templatet, ympäristöt ja palvelut
- Tutustut tärkeimpiin ominaisuuksiin, kuten template-pohjaiseen kehitykseen ja Infrastructure as Codeen
- Ymmärrät azd-projektin rakenteen ja työnkulun
- Olet valmis asentamaan ja konfiguroimaan azd:n kehitysympäristöäsi varten

## Oppimistulokset

Osion suorittamisen jälkeen pystyt:
- Selittämään azd:n roolin modernissa pilvikehityksen työnkulussa
- Tunnistamaan azd-projektin rakenteen osat
- Kuvailemaan, kuinka templatet, ympäristöt ja palvelut toimivat yhdessä
- Ymmärtämään Infrastructure as Code -lähestymistavan hyödyt azd:n avulla
- Tunnistamaan eri azd-komennot ja niiden tarkoitukset

## Mikä on Azure Developer CLI (azd)?

Azure Developer CLI (azd) on komentorivityökalu, joka on suunniteltu nopeuttamaan siirtymistä paikallisesta kehityksestä Azure-järjestelmään. Se yksinkertaistaa pilvinatiivien sovellusten rakentamista, käyttöönottoa ja hallintaa Azure-alustalla.

## Keskeiset Käsitteet

### Templatet
Templatet ovat azd:n perusta. Ne sisältävät:
- **Sovelluskoodi** - Lähdekoodisi ja riippuvuudet
- **Infrastruktuurin määritelmät** - Azure-resurssit määriteltynä Bicepillä tai Terraformilla
- **Konfiguraatiotiedostot** - Asetukset ja ympäristömuuttujat
- **Käyttöönottoskriptit** - Automatisoidut käyttöönoton työnkulut

### Ympäristöt
Ympäristöt edustavat eri käyttöönoton kohteita:
- **Kehitys** - Testausta ja kehitystä varten
- **Staging** - Esituotantoympäristö
- **Tuotanto** - Käytössä oleva tuotantoympäristö

Jokainen ympäristö ylläpitää omia:
- Azure-resurssiryhmiä
- Konfiguraatioasetuksia
- Käyttöönottotilaa

### Palvelut
Palvelut ovat sovelluksesi rakennuspalikoita:
- **Frontend** - Verkkosovellukset, SPAt
- **Backend** - API:t, mikropalvelut
- **Tietokanta** - Tietojen tallennusratkaisut
- **Tallennus** - Tiedosto- ja blob-tallennus

## Tärkeimmät Ominaisuudet

### 1. Template-Pohjainen Kehitys
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azuren oma domain-spesifinen kieli
- **Terraform** - Monipilvi-infrastruktuurityökalu
- **ARM Templatet** - Azure Resource Manager -templatet

### 3. Integroitu Työnkulku
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Ympäristön Hallinta
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Projektin Rakenne

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
Pääprojektin konfiguraatiotiedosto:
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

## 🎪 Yleiset Työnkulut

### Uuden Projektin Aloittaminen
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

## `azd down --force --purge` -komennon Ymmärtäminen
`azd down --force --purge` -komento on tehokas tapa purkaa kokonaan azd-ympäristösi ja kaikki siihen liittyvät resurssit. Tässä on erittely, mitä kukin lippu tekee:
```
--force
```
- Ohittaa vahvistuskehotteet.
- Kätevä automaatiossa tai skriptauksessa, jossa manuaalinen syöttö ei ole mahdollista.
- Varmistaa, että purku etenee keskeytyksettä, vaikka CLI havaitsee epäjohdonmukaisuuksia.

```
--purge
```
Poistaa **kaiken siihen liittyvän metadatan**, mukaan lukien:
Ympäristön tila
Paikallinen `.azure`-kansio
Välimuistissa olevat käyttöönoton tiedot
Estää azd:tä "muistamasta" aiempia käyttöönottoja, mikä voi aiheuttaa ongelmia, kuten epäyhteensopivia resurssiryhmiä tai vanhentuneita rekisteriviittauksia.

### Miksi käyttää molempia?
Kun `azd up` -komento ei toimi odotetusti johtuen jäljellä olevasta tilasta tai osittaisista käyttöönotosta, tämä yhdistelmä varmistaa **puhtaan aloituksen**.

Se on erityisen hyödyllinen manuaalisten resurssien poistamisen jälkeen Azure-portaalissa tai vaihdettaessa templatet, ympäristöt tai resurssiryhmien nimeämiskäytännöt.

### Useiden Ympäristöjen Hallinta
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

## Parhaat Käytännöt

### 1. Käytä Merkityksellisiä Nimiä
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Hyödynnä Templatet
- Aloita olemassa olevilla templateilla
- Mukauta tarpeidesi mukaan
- Luo organisaatiollesi uudelleenkäytettäviä templateja

### 3. Ympäristöjen Eristäminen
- Käytä erillisiä ympäristöjä kehitykseen/stagingiin/tuotantoon
- Älä koskaan ota käyttöön suoraan tuotantoon paikalliselta koneelta
- Käytä CI/CD-putkia tuotantokäyttöönottoihin

### 4. Konfiguraation Hallinta
- Käytä ympäristömuuttujia arkaluontoisille tiedoille
- Pidä konfiguraatio versionhallinnassa
- Dokumentoi ympäristökohtaiset asetukset

## Oppimisen Eteneminen

### Aloittelija (Viikot 1-2)
1. Asenna azd ja autentikoi
2. Ota käyttöön yksinkertainen template
3. Ymmärrä projektin rakenne
4. Opettele peruskomennot (up, down, deploy)

### Keskitaso (Viikot 3-4)
1. Mukauta templateja
2. Hallitse useita ympäristöjä
3. Ymmärrä infrastruktuurikoodi
4. Määritä CI/CD-putket

### Edistynyt (Viikko 5+)
1. Luo omia templateja
2. Kehittyneet infrastruktuurimallit
3. Monialueiset käyttöönotot
4. Yritystason konfiguraatiot

## Seuraavat Askeleet

**📖 Jatka Luvun 1 Oppimista:**
- [Asennus & Käyttöönotto](installation.md) - Asenna ja konfiguroi azd
- [Ensimmäinen Projektisi](first-project.md) - Käytännön opetusohjelma
- [Konfiguraatio-Opas](configuration.md) - Edistyneet konfiguraatiovaihtoehdot

**🎯 Valmis Seuraavaan Lukuun?**
- [Luku 2: AI-Ensisijainen Kehitys](../ai-foundry/azure-ai-foundry-integration.md) - Aloita AI-sovellusten rakentaminen

## Lisäresurssit

- [Azure Developer CLI Yleiskatsaus](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Template-Galleria](https://azure.github.io/awesome-azd/)
- [Yhteisön Näytteet](https://github.com/Azure-Samples)

---

**Luvun Navigointi:**
- **📚 Kurssin Etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen Luku**: Luku 1 - Perusta & Nopea Aloitus  
- **⬅️ Edellinen**: [Kurssin Yleiskatsaus](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Seuraava**: [Asennus & Käyttöönotto](installation.md)
- **🚀 Seuraava Luku**: [Luku 2: AI-Ensisijainen Kehitys](../ai-foundry/azure-ai-foundry-integration.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.