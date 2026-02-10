# Ensimmäinen projektisi - Käytännön opas

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perustiedot & Nopeasti alkuun
- **⬅️ Edellinen**: [Installation & Setup](installation.md)
- **➡️ Seuraava**: [Configuration](configuration.md)
- **🚀 Seuraava luku**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tervetuloa ensimmäiseen Azure Developer CLI -projektiisi! Tämä kattava käytännön opas tarjoaa täydellisen läpikäynnin täyden pinon sovelluksen luomisesta, käyttöönotosta ja hallinnasta Azureen käyttäen azd:ta. Työskentelet oikean todo-sovelluksen kanssa, joka sisältää React-käyttöliittymän, Node.js-API-taustan ja MongoDB-tietokannan.

## Oppimistavoitteet

Tämän oppaan suorittamalla sinä:
- Hallitset azd-projektin aloitusprosessin mallien avulla
- Ymmärrät Azure Developer CLI -projektin rakenteen ja konfiguraatiotiedostot
- Suoritat koko sovelluksen käyttöönoton Azureen infrastruktuurin provisioinnin kanssa
- Toteutat sovelluspäivitykset ja uudelleenkäyttöönoton strategiat
- Hallinnoit useita ympäristöjä kehitystä ja stagingia varten
- Käytät resurssien siivousta ja kustannustenhallintakäytäntöjä

## Oppimistulokset

Suoritettuasi oppaan osaat:
- Alustaa ja konfiguroida azd-projekteja malleista itsenäisesti
- Navigoida ja muokata azd-projektin rakennetta tehokkaasti
- Ota käyttöön täyden pino -sovelluksia Azureen yhdellä komennolla
- Vianetsinnän yleisiä käyttöönotto- ja todennusongelmia
- Hallinnoida useita Azure-ympäristöjä eri käyttöönottoasteille
- Toteuttaa jatkuvan käyttöönoton työnkulkuja sovelluspäivityksille

## Aloittaminen

### Ennen aloittamista - tarkistuslista
- ✅ Azure Developer CLI asennettuna ([Installation Guide](installation.md))
- ✅ Azure CLI asennettuna ja todentuneena
- ✅ Git asennettuna järjestelmääsi
- ✅ Node.js 16+ (tätä opasta varten)
- ✅ Visual Studio Code (suositeltu)

### Varmista asennuksesi
```bash
# Tarkista azd-asennus
azd version
```
### Vahvista Azure-todennus

```bash
az account show
```

### Tarkista Node.js-versio
```bash
node --version
```

## Vaihe 1: Valitse ja alustaa malli

Aloitetaan suositulla todo-sovelluksen mallilla, joka sisältää React-käyttöliittymän ja Node.js-API-taustan.

```bash
# Selaa saatavilla olevia malleja
azd template list

# Alusta todo-sovellusmalli
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Noudata kehotteita:
# - Anna ympäristölle nimi: "dev"
# - Valitse tilaus (jos sinulla on useita)
# - Valitse alue: "East US 2" (tai haluamasi alue)
```

### Mitä juuri tapahtui?
- Latait mallikoodin paikalliseen hakemistoon
- Loit `azure.yaml`-tiedoston palvelumäärittelyineen
- Määrittelit infrastruktuurikoodin `infra/`-hakemistoon
- Loit ympäristökonfiguraation

## Vaihe 2: Tutki projektin rakennetta

Katsotaan, mitä azd loi meille:

```bash
# Näytä projektin rakenne
tree /f   # Windows
# tai
find . -type f | head -20   # macOS/Linux
```

Näet luettelon:
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

### Tärkeät tiedostot ymmärtääksesi

**azure.yaml** - azd-projektisi sydän:
```bash
# Näytä projektin asetukset
cat azure.yaml
```

**infra/main.bicep** - Infrastruktuurin määrittely:
```bash
# Näytä infrastruktuurikoodi
head -30 infra/main.bicep
```

## Vaihe 3: Mukauta projektiasi (valinnainen)

Ennen käyttöönottoa voit mukauttaa sovellusta:

### Muokkaa käyttöliittymää
```bash
# Avaa React-sovelluksen komponentti
code src/web/src/App.tsx
```

Tee yksinkertainen muutos:
```typescript
// Etsi otsikko ja muuta se
<h1>My Awesome Todo App</h1>
```

### Konfiguroi ympäristömuuttujat
```bash
# Aseta mukautetut ympäristömuuttujat
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Näytä kaikki ympäristömuuttujat
azd env get-values
```

## Vaihe 4: Ota käyttöön Azureen

Nyt jännittävä vaihe - ota kaikki käyttöön Azureen!

```bash
# Ota käyttöön infrastruktuuri ja sovellus
azd up

# Tämä komento suorittaa:
# 1. Luo ja konfiguroi Azure-resursseja (App Service, Cosmos DB jne.)
# 2. Rakenna sovelluksesi
# 3. Julkaise provisionoituihin resursseihin
# 4. Näyttää sovelluksen URL-osoitteen
```

### Mitä tapahtuu käyttöönoton aikana?

`azd up` -komento suorittaa nämä vaiheet:
1. **Provision** (`azd provision`) - Luo Azure-resursseja
2. **Package** - Kääntää ja pakkaa sovelluskoodin
3. **Deploy** (`azd deploy`) - Ota koodi käyttöön Azure-resursseihin

### Odotettu tuloste
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Vaihe 5: Testaa sovellustasi

### Käytä sovellustasi
Klikkaa käyttöönoton tulosteessa annettua URL-osoitetta tai hae se milloin tahansa:
```bash
# Hae sovelluksen päätepisteet
azd show

# Avaa sovellus selaimessasi
azd show --output json | jq -r '.services.web.endpoint'
```

### Testaa Todo-sovellus
1. **Lisää tehtävä** - Napsauta "Lisää tehtävä" ja kirjoita tehtävä
2. **Merkitse valmiiksi** - Rastita valmiiksi merkityt tehtävät
3. **Poista tehtäviä** - Poista tehtävät, joita et enää tarvitse

### Seuraa sovellustasi
```bash
# Avaa Azure-portaali resursseillesi
azd monitor

# Näytä sovelluksen lokit
azd monitor --logs

# Näytä reaaliaikaiset mittarit
azd monitor --live
```

## Vaihe 6: Tee muutoksia ja ota uudelleen käyttöön

Tehdään muutos ja katsotaan, kuinka helppoa päivittäminen on:

### Muokkaa API:ta
```bash
# Muokkaa API-koodia
code src/api/src/routes/lists.js
```

Lisää mukautettu vastauspääte:
```javascript
// Etsi reitinkäsittelijä ja lisää:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Ota käyttöön vain koodimuutokset
```bash
# Ota käyttöön vain sovelluskoodi (ohita infrastruktuuri)
azd deploy

# Tämä on paljon nopeampaa kuin 'azd up', koska infrastruktuuri on jo olemassa.
```

## Vaihe 7: Hallinnoi useita ympäristöjä

Luo staging-ympäristö testataksesi muutoksia ennen tuotantoa:

```bash
# Luo uusi staging-ympäristö
azd env new staging

# Julkaise staging-ympäristöön
azd up

# Vaihda takaisin kehitysympäristöön
azd env select dev

# Listaa kaikki ympäristöt
azd env list
```

### Ympäristöjen vertailu
```bash
# Näytä kehitysympäristö
azd env select dev
azd show

# Näytä testausympäristö
azd env select staging
azd show
```

## Vaihe 8: Siivoa resurssit

Kun olet valmis kokeilujen kanssa, siivoa resurssit välttääksesi jatkuvia kuluja:

```bash
# Poista kaikki Azure-resurssit nykyisestä ympäristöstä
azd down

# Pakota poisto ilman vahvistusta ja poista lopullisesti pehmeästi poistetut resurssit
azd down --force --purge

# Poista tietty ympäristö
azd env select staging
azd down --force --purge
```

## Mitä opit

Onnittelut! Olet onnistuneesti:
- ✅ Alustanut azd-projektin mallista
- ✅ Tutkinut projektin rakennetta ja tärkeitä tiedostoja
- ✅ Ottanut täyden pinon sovelluksen käyttöön Azureen
- ✅ Tehnyt koodimuutoksia ja ottanut ne uudelleen käyttöön
- ✅ Hallinnoinut useita ympäristöjä
- ✅ Siivonnut resurssit

## 🎯 Taitojen varmistustehtävät

### Tehtävä 1: Ota käyttöön eri malli (15 minuuttia)
**Tavoite**: Demonstroi azd init- ja käyttöönoton työnkulun hallintaa

```bash
# Kokeile Pythonin ja MongoDB:n pinoa
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Varmista käyttöönotto
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Siivoa
azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Sovellus otetaan käyttöön ilman virheitä
- [ ] Sovelluksen URL toimii selaimessa
- [ ] Sovellus toimii oikein (lisää/poista tehtäviä)
- [ ] Resurssit on siivottu onnistuneesti

### Tehtävä 2: Mukauta konfiguraatiota (20 minuuttia)
**Tavoite**: Harjoittele ympäristömuuttujien konfigurointia

```bash
cd my-first-azd-app

# Luo mukautettu ympäristö
azd env new custom-config

# Aseta mukautetut muuttujat
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Tarkista muuttujat
azd env get-values | grep APP_TITLE

# Ota käyttöön mukautetulla konfiguraatiolla
azd up
```

**Onnistumiskriteerit:**
- [ ] Mukautettu ympäristö luotu onnistuneesti
- [ ] Ympäristömuuttujat asetettu ja haettavissa
- [ ] Sovellus otettu käyttöön mukautetulla konfiguraatiolla
- [ ] Voidaan varmistaa mukautetut asetukset käyttöönottosovelluksessa

### Tehtävä 3: Moniympäristöinen työnkulku (25 minuuttia)
**Tavoite**: Hallitse ympäristöjen hallintaa ja käyttöönotto-strategioita

```bash
# Luo kehitysympäristö
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Merkitse kehitys-URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Luo staging-ympäristö
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Merkitse staging-URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Vertaa ympäristöjä
azd env list

# Testaa molempia ympäristöjä
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Siivoa molemmat ympäristöt
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Kaksi ympäristöä luotu eri konfiguraatioilla
- [ ] Molemmat ympäristöt otettu käyttöön onnistuneesti
- [ ] Voidaan vaihtaa ympäristöjen välillä käyttämällä `azd env select`
- [ ] Ympäristömuuttujat eroavat ympäristöjen välillä
- [ ] Molemmat ympäristöt siivottu onnistuneesti

## 📊 Edistymisesi

**Käytetty aika**: ~60–90 minuuttia  
**Hankitut taidot**:
- ✅ Mallipohjainen projektin alustus
- ✅ Azure-resurssien provisiointi
- ✅ Sovelluksen käyttöönoton työnkulut
- ✅ Ympäristöjen hallinta
- ✅ Konfiguraation hallinta
- ✅ Resurssien siivous ja kustannustenhallinta

**Seuraava taso**: Olet valmis [Configuration Guide](configuration.md) - oppimaan edistyneitä konfiguraatiokuvioita!

## Yleisimpiä ongelmia ja ratkaisut

### Todennusvirheet
```bash
# Kirjaudu uudelleen Azureen
az login

# Varmista pääsy tilaukseen
az account show
```

### Käyttöönoton epäonnistumiset
```bash
# Ota virheenkorjauslokitus käyttöön
export AZD_DEBUG=true
azd up --debug

# Näytä sovelluksen lokit Azure-palvelussa
azd monitor --logs

# Container Apps -sovelluksille, käytä Azure CLI:tä:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resurssin nimen ristiriidat
```bash
# Käytä ainutlaatuista ympäristön nimeä
azd env new dev-$(whoami)-$(date +%s)
```

### Portti-/verkko-ongelmat
```bash
# Tarkista, ovatko portit käytettävissä
netstat -an | grep :3000
netstat -an | grep :3100
```

## Seuraavat askeleet

Nyt kun olet suorittanut ensimmäisen projektisi, tutustu näihin edistyneisiin aiheisiin:

### 1. Mukauta infrastruktuuria
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Lisää tietokantoja, tallennustilaa ja muita palveluja](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Määritä CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Täydelliset CI/CD-työnkulut
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Putken konfigurointi

### 3. Tuotannon parhaat käytännöt
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Turvallisuus, suorituskyky ja monitorointi

### 4. Tutki lisää malleja
```bash
# Selaa malleja kategorian mukaan
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Kokeile eri teknologiapinoja
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Lisäresurssit

### Oppimateriaali
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Yhteisö & tuki
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallit & esimerkit
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Onnittelut ensimmäisen azd-projektisi suorittamisesta!** Olet nyt valmis rakentamaan ja ottamaan käyttöön upeita sovelluksia Azureen luottavaisin mielin.

---

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perustiedot & Nopeasti alkuun
- **⬅️ Edellinen**: [Installation & Setup](installation.md)
- **➡️ Seuraava**: [Configuration](configuration.md)
- **🚀 Seuraava luku**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Seuraava oppitunti**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattisissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää määräävänä lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaisen ihmiskääntäjän tekemää käännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->