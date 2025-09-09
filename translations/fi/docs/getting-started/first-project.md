<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "483bc6a036553e531b9af4d1d9dec31e",
  "translation_date": "2025-09-09T21:23:39+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "fi"
}
-->
# Ensimmäinen projektisi - Käytännön opas

## Johdanto

Tervetuloa ensimmäiseen Azure Developer CLI -projektiisi! Tämä kattava käytännön opas tarjoaa täydellisen läpikäynnin täysimittaisen sovelluksen luomisesta, käyttöönotosta ja hallinnasta Azuren avulla käyttäen azd-työkalua. Työskentelet todellisen tehtävälistasovelluksen kanssa, joka sisältää React-frontendin, Node.js API-backendin ja MongoDB-tietokannan.

## Oppimistavoitteet

Tämän oppaan suorittamalla opit:
- Hallitsemaan azd-projektin aloitustyönkulun mallien avulla
- Ymmärtämään Azure Developer CLI -projektin rakenteen ja konfiguraatiotiedostot
- Toteuttamaan sovelluksen täydellisen käyttöönoton Azureen infrastruktuurin provisioinnilla
- Toteuttamaan sovelluspäivityksiä ja uudelleenkäyttöstrategioita
- Hallitsemaan useita ympäristöjä kehitystä ja testausvaiheita varten
- Soveltamaan resurssien siivous- ja kustannustenhallintakäytäntöjä

## Oppimistulokset

Oppaan suorittamisen jälkeen osaat:
- Aloittaa ja konfiguroida azd-projekteja itsenäisesti mallien avulla
- Navigoida ja muokata azd-projektirakenteita tehokkaasti
- Ottaa täysimittaisia sovelluksia käyttöön Azureen yksinkertaisilla komennoilla
- Ratkaista yleisiä käyttöönotto- ja autentikointiongelmia
- Hallita useita Azure-ympäristöjä eri käyttöönoton vaiheisiin
- Toteuttaa jatkuvan käyttöönoton työnkulkuja sovelluspäivityksiä varten

## Aloittaminen

### Esivaatimusten tarkistuslista
- ✅ Azure Developer CLI asennettuna ([Asennusohje](installation.md))
- ✅ Azure CLI asennettuna ja autentikoituna
- ✅ Git asennettuna järjestelmääsi
- ✅ Node.js 16+ (tätä opasta varten)
- ✅ Visual Studio Code (suositeltu)

### Varmista asennuksesi
```bash
# Check azd installation
azd version

# Verify Azure authentication
az account show

# Check Node.js version
node --version
```

## Vaihe 1: Valitse ja aloita malli

Aloitetaan suositulla tehtävälistasovellusmallilla, joka sisältää React-frontendin ja Node.js API-backendin.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Mitä juuri tapahtui?
- Mallikoodi ladattiin paikalliseen hakemistoosi
- Luotiin `azure.yaml`-tiedosto palvelumäärittelyillä
- Infrastruktuurikoodi asetettiin `infra/`-hakemistoon
- Luotiin ympäristön konfiguraatio

## Vaihe 2: Tutki projektin rakennetta

Tutkitaan, mitä azd loi meille:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Sinun pitäisi nähdä:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Keskeiset tiedostot, jotka kannattaa ymmärtää

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

Ennen käyttöönottoa voit mukauttaa sovellusta:

### Muokkaa frontendiä
```bash
# Open the React app component
code src/web/src/App.tsx
```

Tee yksinkertainen muutos:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfiguroi ympäristömuuttujat
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.0.0"

# View all environment variables
azd env get-values
```

## Vaihe 4: Ota käyttöön Azureen

Nyt jännittävä osuus - otetaan kaikki käyttöön Azureen!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Mitä tapahtuu käyttöönoton aikana?

`azd up` -komento suorittaa seuraavat vaiheet:
1. **Provisiointi** (`azd provision`) - Luo Azure-resurssit
2. **Paketointi** - Rakentaa sovelluskoodin
3. **Käyttöönotto** (`azd deploy`) - Ottaa koodin käyttöön Azure-resursseihin

### Odotettu tulos
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Vaihe 5: Testaa sovelluksesi

### Pääsy sovellukseen
Klikkaa käyttöönoton tulosteessa annettua URL-osoitetta tai hae se milloin tahansa:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testaa tehtävälistasovellus
1. **Lisää tehtävä** - Klikkaa "Add Todo" ja syötä tehtävä
2. **Merkitse valmiiksi** - Ruksaa valmiit tehtävät
3. **Poista tehtäviä** - Poista tehtävät, joita et enää tarvitse

### Seuraa sovellustasi
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Vaihe 6: Tee muutoksia ja ota uudelleen käyttöön

Tehdään muutos ja katsotaan, kuinka helppoa on päivittää:

### Muokkaa API:a
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Lisää mukautettu vastausotsikko:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Ota käyttöön vain koodimuutokset
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Vaihe 7: Hallitse useita ympäristöjä

Luo testausympäristö, jossa voit testata muutoksia ennen tuotantoa:

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

Kun olet valmis kokeilujen kanssa, siivoa resurssit välttääksesi jatkuvat kulut:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Mitä olet oppinut

Onnittelut! Olet onnistuneesti:
- Aloittanut azd-projektin mallista
- Tutkinut projektin rakennetta ja keskeisiä tiedostoja
- Ottanut täysimittaisen sovelluksen käyttöön Azureen
- Tehnyt koodimuutoksia ja ottanut ne uudelleen käyttöön
- Hallinnut useita ympäristöjä
- Siivonnut resurssit

## Yleisten ongelmien vianmääritys

### Autentikointivirheet
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Käyttöönoton epäonnistumiset
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Resurssinimien ristiriidat
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Portti-/verkko-ongelmat
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Seuraavat askeleet

Nyt kun olet suorittanut ensimmäisen projektisi, tutustu näihin edistyneisiin aiheisiin:

### 1. Mukauta infrastruktuuria
- [Infrastructure as Code](../deployment/provisioning.md)
- [Lisää tietokantoja, tallennustilaa ja muita palveluita](../deployment/provisioning.md#adding-services)

### 2. Määritä CI/CD
- [GitHub Actions -integraatio](../deployment/cicd-integration.md)
- [Azure DevOps -putket](../deployment/cicd-integration.md#azure-devops)

### 3. Tuotannon parhaat käytännöt
- [Turvallisuusasetukset](../deployment/best-practices.md#security)
- [Suorituskyvyn optimointi](../deployment/best-practices.md#performance)
- [Seuranta ja lokitus](../deployment/best-practices.md#monitoring)

### 4. Tutustu lisää malleihin
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Lisäresurssit

### Oppimateriaalit
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Yhteisö ja tuki
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallit ja esimerkit
- [Virallinen malligalleria](https://azure.github.io/awesome-azd/)
- [Yhteisön mallit](https://github.com/Azure-Samples/azd-templates)
- [Yrityskäytännöt](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Onnittelut ensimmäisen azd-projektisi suorittamisesta!** Olet nyt valmis rakentamaan ja ottamaan käyttöön upeita sovelluksia Azureen luottavaisin mielin.

---

**Navigointi**
- **Edellinen oppitunti**: [Konfiguraatio](configuration.md)
- **Seuraava oppitunti**: [Käyttöönotto-opas](../deployment/deployment-guide.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.