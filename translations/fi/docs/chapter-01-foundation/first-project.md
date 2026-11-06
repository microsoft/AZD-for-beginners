# Ensimmäinen projektisi - Käytännön opas

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusta & Nopeasti alkuun
- **⬅️ Edellinen**: [Asennus & määritys](installation.md)
- **➡️ Seuraava**: [Oma sovellus mukaan](bring-your-own-app.md)
- **🚀 Seuraava luku**: [Luku 2: AI-Ensisijainen kehitys](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tervetuloa ensimmäiseen Azure Developer CLI -projektiisi! Julkaiset todo-sovelluksen, jossa on React-käyttöliittymä, Node.js API ja Azure Cosmos DB. Malli säilyttää historiallisen nimen `todo-nodejs-mongo`; sen nykyinen infrastruktuuri käyttää Cosmos DB:tä NoSQL-tietokantana, joten tarkista ladattu README ja `infra/` äläkä päättele tietokanta-API:a nimen perusteella.

> Tarkistettu `azd 1.37.2` ja julkisen mallin mukaan marraskuussa 2026. Alla olevat esimerkit käyttävät Bashia; JSON-poiminta vaatii myös `jq`. Azure-julkaisuista aiheutuu kustannuksia eikä niitä ajettu tämän tarkistuksen aikana.

## Oppimistavoitteet

Tämän opastuksen suorittamalla:
- Hallitset azd-projektin aloitustyönkulun käyttäen malleja
- Ymmärrät Azure Developer CLI -projektin rakenteen ja määritystiedostot
- Suoritat täydellisen sovellusjulkaisun Azureen infrastruktuurin provisioinnilla
- Toteutat sovelluspäivitykset ja uudelleenjulkaisustrategiat
- Hallitset useita kehitys- ja staging-ympäristöjä
- Käytät resurssien siivous- ja kustannusten hallintakäytänteitä

## Oppimistulokset

Suoritettuasi osaat:
- Itsenäisesti alustaa ja konfiguroida azd-projekteja malleista
- Navigoida ja muokata azd-projektin rakennetta tehokkaasti
- Julkaista täystekniset sovellukset Azureen yhdellä komennolla
- Ratkaista yleisiä julkaisun ongelmia ja todennusongelmia
- Hallita useita Azure-ympäristöjä eri julkaisuvaiheisiin
- Toteuttaa jatkuvan julkaisun työnkulkuja sovelluspäivityksille

## Aloittaminen

### Esivaatimusten tarkistuslista
- ✅ Azure Developer CLI asennettuna ([Asennusopas](installation.md))
- ✅ AZD-todennus suoritettu `azd auth login`
- ✅ Git asennettuna järjestelmääsi
- ✅ Node.js 22 LTS (tai ladatun mallin vaatima tuettu versio)
- ✅ Visual Studio Code (suositus)

Ennen jatkamista suorita määrityksen tarkistaja repositorion juuresta:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Tarkista määrityksesi
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Tarkista valinnainen Azure CLI -todennus

```bash
az account show
```

### Tarkista Node.js-versio
```bash
node --version
```

## Vaihe 1: Valitse ja alusta malli

Aloitetaan suosituilla todo-sovelluksen mallilla, joka sisältää React-käyttöliittymän ja Node.js API-backendin.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Mitä juuri tapahtui?
- Mallikoodi ladattiin paikalliseen hakemistoosi
- Luotiin `azure.yaml`-tiedosto palvelumääritelmillä
- Määritykset infrastruktuurikoodille `infra/` -hakemistossa
- Luotiin ympäristön määritys

## Vaihe 2: Tutki projektirakennetta

Tarkastellaan, mitä azd loi:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Näet seuraavat:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Ymmärrettävät keskeiset tiedostot

**azure.yaml** - azd-projektisi ydin:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastruktuurin määrittely:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Vaihe 3: Mukauta projektiasi (valinnainen)

Ennen julkaisua voit mukauttaa sovellusta:

### Muokkaa käyttöliittymää
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Tee yksinkertainen muutos:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Määritä ympäristömuuttujat
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Nämä kaksi mukautettua arvoa näyttävät paikallisesti tallennetun sisällön. Malli ei käytä `WEBSITE_TITLE` tai `API_VERSION`, joten ne eivät vaikuta sovellukseen. Yllä oleva suora muutos muuttaa näytettävää otsikkoa.

## Vaihe 4: Julkaise Azureen

Nyt jännittävä osa – julkaise kaikki Azureen!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Mitä julkaisun aikana tapahtuu?

Työnkulku provisioi infrastruktuurin ja pakkaa/julkaisee koodin. Tarkka järjestys voidaan mukauttaa `workflows.up` avulla `azure.yaml`; tässä mallissa provisiointi tapahtuu ennen julkaisua. Älä luota yhteen universaaliin vaihejärjestykseen kaikille malleille.

### Odotettu tulos
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Vaihe 5: Testaa sovellustasi

### Pääsy sovellukseesi
Klikkaa julkaisun lopussa annettua URL-osoitetta tai hae sitä milloin tahansa:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Testaa Todo-sovellus
1. **Lisää todo-kohta** - Klikkaa "Add Todo" ja syötä tehtävä
2. **Merkitse valmiiksi** - Ruksaa suoritetut kohteet
3. **Poista kohteita** - Poista ei enää tarpeelliset todo:t

### Seuraa sovellustasi
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Vahvista julkaisusi

Ennen jatkamista käy tämä pikainen tarkistuslista läpi varmistaaksesi, että kaikki todella toimii–älä oleta "julkaisu onnistui" tarkoittavan "sovellus toimii":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Julkaisu on vahvistettu, kun:**
- ✅ `azd show` listaa saavutettavan päätepisteen URL-osoitteen
- ✅ URL aukeaa selaimessa ilman virheitä
- ✅ Perustoiminnot toimivat (lisää/merkitse valmis/poista todo)
- ✅ `azd monitor --logs` näyttää saapuvat pyynnöt ilman odottamattomia virheitä

Jos joku tarkistus epäonnistuu, siirry [Luku 7: Vianmääritys](../chapter-07-troubleshooting/README.md).

## Vaihe 6: Tee muutoksia ja julkaise uudelleen

Tehdään muutos ja katsotaan, kuinka helppoa päivitys on:

### Muokkaa API:a
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Lisää mukautettu vastausotsake:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Julkaise vain koodimuutokset
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Vaihe 7: Hallitse useita ympäristöjä

Luo staging-ympäristö testataksesi muutoksia ennen tuotantoon vientiä:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Ympäristöjen vertailu
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Vaihe 8: Siivoa resurssit

Kun olet valmis kokeilujen kanssa, siivoa resurssit välttääksesi jatkuvat kustannukset:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klassinen sovellus vs. AI-pohjainen sovellus: Sama työnkulku

Julkaisit juuri perinteisen web-sovelluksen. Mutta entä jos haluaisit julkaista AI-pohjaisen sovelluksen, esimerkiksi Microsoft Foundry -mallien tukeman chat-sovelluksen?

Hyvä uutinen: **työnkulku on identtinen.**

| Vaihe | Klassinen Todo-sovellus | AI Chat -sovellus |
|------|-----------------|-------------|
| Alusta (tyhjä hakemisto) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Todennus | `azd auth login` | `azd auth login` |
| Julkaisu | `azd up` | `azd up` |
| Seuranta | `azd monitor` | `azd monitor` |
| Siivous | `azd down --force --purge` | `azd down --force --purge` |

Elinkaaren komennot ovat samat, mutta esivaatimukset eroavat. AI-malli voi vaatia mallin käyttöoikeutta, alueellista kiintiötä, tietojen syöttöä ja lisämäärityksiä. Lue sen README ennen julkaisua; `azd up` ei voi toimittaa puuttuvia oikeuksia tai kiintiötä.

Tämä on azd:n keskeinen periaate: **yksi työnkulku, kaikki kuormitukset.** Tämän opastuksen opit – alustus, julkaisu, seuranta, uudelleenjulkaisu ja siivous – pätevät yhtä lailla AI-sovelluksiin ja -agentteihin.

---

## Mitä opit

Onnittelut! Olet onnistuneesti:
- ✅ Aloittanut azd-projektin mallista
- ✅ Tutkinut projektirakennetta ja keskeisiä tiedostoja
- ✅ Julkaissut täysteknisen sovelluksen Azureen
- ✅ Tehnyt koodimuutoksia ja julkaissut uudelleen
- ✅ Hallinnut useita ympäristöjä
- ✅ Siivonnut resurssit

## 🎯 Taitojen vahvistamisharjoitukset

### Harjoitus 1: Julkaise eri malli (15 minuuttia)
**Tavoite**: Näytä hallitsevasi azd init ja julkaisun työnkulku

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Sovellus julkaistaan ilman virheitä
- [ ] Sovelluksen URL-osoitteeseen pääsee selaimella
- [ ] Sovellus toimii oikein (lisää/poista todoja)
- [ ] Kaikki resurssit siivottu onnistuneesti

### Harjoitus 2: Mukauta määritystä (20 minuuttia)
**Tavoite**: Harjoittele paikallista ympäristöarvojen tallennusta ilman virheellistä tulkintaa suoritusajan määritykseksi

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Onnistumiskriteerit:**
- [ ] Mukautettu ympäristö luotu onnistuneesti
- [ ] Ympäristömuuttujat asetettu ja haettavissa
- [ ] `azd env get-value APP_TITLE` tulostaa `My Custom Todo App`
- [ ] Osaat selittää, miksi nämä arvot eivät muuta mallisovellusta, ellei koodi/infrastruktuuri ota niitä käyttöön

### Harjoitus 3: Moniympäristöinen työnkulku (25 minuuttia)
**Tavoite**: Hallitse ympäristöjen hallintaa ja julkaisustrategioita

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Kaksi eri konfiguraatioilla varustettua ympäristöä luotu
- [ ] Molemmat ympäristöt julkaistu onnistuneesti
- [ ] Voit vaihtaa ympäristöjen välillä käyttäen `azd env select`
- [ ] Ympäristömuuttujat eroavat ympäristöittäin
- [ ] Puhdistus onnistui molemmissa ympäristöissä

## 📊 Edistymisesi

**Käytetty aika**: ~60-90 minuuttia  
**Hankitut taidot**:
- ✅ Mallipohjainen projektin alustus
- ✅ Azuren resurssien provisiointi
- ✅ Sovellusten käyttöönoton työnkulut
- ✅ Ympäristön hallinta
- ✅ Konfiguraation hallinta
- ✅ Resurssien puhdistus ja kustannusten hallinta

**Seuraava taso**: Olet valmis [Konfiguraatio-oppaaseen](../chapter-03-configuration/configuration.md) oppimaan edistyneitä konfiguraatiokuvioita!

## Yleiset ongelmat ja niiden ratkaisut

### Todennusvirheet
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Käyttöönoton epäonnistumiset
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resurssien nimikonfliktit
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Portti/verkkovirheet
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Seuraavat askeleet

Nyt kun olet suorittanut ensimmäisen projektisi, tutustu näihin edistyneisiin aiheisiin:

### 1. Räätälöi infrastruktuuri
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Lisää tietokantainfrastruktuuri](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Ota käyttöön CI/CD
- [Käyttöönoton opas](../chapter-04-infrastructure/deployment-guide.md) - Täydelliset CI/CD-työnkulut
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Putken konfigurointi

### 3. Tuotannon parhaat käytännöt
- [Käyttöönoton opas](../chapter-04-infrastructure/deployment-guide.md) - Turvallisuus, suorituskyky ja seuranta

### 4. Tutustu lisää malleja
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Lisäresurssit

### Oppimateriaalit
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Yhteisö ja tuki
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallit ja esimerkit
- [Virallinen malligalleria](https://azure.github.io/awesome-azd/)
- [Yhteisön mallipanos](https://github.com/Azure/awesome-azd)
- [Todo-mallin lähde](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Onnittelut ensimmäisen azd-projektisi suorittamisesta!** Olet nyt valmis rakentamaan ja ottamaan käyttöön upeita sovelluksia Azurella luottavaisin mielin.

---

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusteet ja pikakäynnistys
- **⬅️ Edellinen**: [Asennus ja käyttöönotto](installation.md)
- **➡️ Seuraava**: [Oma sovellus mukaan](bring-your-own-app.md)
- **🚀 Seuraava luku**: [Luku 2: AI-ensimmäinen kehitys](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->