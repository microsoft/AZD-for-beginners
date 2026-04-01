# Ensimmäinen projektisi - Käytännön opas

**Lukujen navigointi:**
- **📚 Kurssin aloitus**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusta ja pika-aloitus
- **⬅️ Edellinen**: [Asennus ja määritys](installation.md)
- **➡️ Seuraava**: [Konfigurointi](configuration.md)
- **🚀 Seuraava luku**: [Luku 2: AI-ensisuuntainen kehitys](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tervetuloa ensimmäiseen Azure Developer CLI -projektiisi! Tämä kattava käytännön opas tarjoaa täydellisen läpikäynnin koko pinon sovelluksen luomisesta, käyttöönotosta ja hallinnasta Azureen azd:llä. Työskentelet oikean todo-sovelluksen kanssa, joka sisältää React-frontendin, Node.js API -backendin ja MongoDB-tietokannan.

## Oppimistavoitteet

Suorittamalla tämän oppaan sinä:
- Hallitset azd-projektin alustamisen työnkulun mallipohjien avulla
- Ymmärrät Azure Developer CLI -projektin rakenteen ja konfiguraatiotiedostot
- Suoritat sovelluksen täydellisen käyttöönoton Azureen infrastruktuurin provisioinnin kera
- Toteutat sovelluspäivityksiä ja uudelleenkäyttöönotto-strategioita
- Hallinnoit useita ympäristöjä kehitystä ja testausvaiheita varten
- Sovellat resurssien siivousta ja kustannusten hallintakäytäntöjä

## Oppimistulokset

Oppaan suorittamisen jälkeen osaat:
- Alustaa ja konfiguroida azd-projekteja mallipohjista itsenäisesti
- Navigoida ja muokata azd-projektin rakennetta tehokkaasti
- Ottaa full-stack-sovelluksia käyttöön Azureen yhdellä komennolla
- Selvittää yleisiä käyttöönotto- ja todennusongelmia
- Hallita useita Azure-ympäristöjä eri käyttöönottoasteille
- Toteuttaa jatkuvan julkaisuputken sovelluspäivityksiä varten

## Aloittaminen

### Esivaatimusten tarkistuslista
- ✅ Azure Developer CLI asennettuna ([Asennusopas](installation.md))
- ✅ AZD-todennus suoritettu komennolla `azd auth login`
- ✅ Git asennettuna järjestelmääsi
- ✅ Node.js 16+ (tätä opasta varten)
- ✅ Visual Studio Code (suositeltu)

Ennen kuin jatkat, suorita asentajatarkistus repositorion juuressa:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Varmista asennuksesi
```bash
# Tarkista azd-asennus
azd version

# Tarkista AZD-todennus
azd auth login --check-status
```

### Varmista valinnainen Azure CLI -todennus

```bash
az account show
```

### Tarkista Node.js-versio
```bash
node --version
```

## Vaihe 1: Valitse ja alusta mallipohja

Aloitetaan suositulla todo-sovelluksen mallipohjalla, joka sisältää React-frontendin ja Node.js API -backendin.

```bash
# Selaa saatavilla olevia malleja
azd template list

# Alusta todo-sovellusmalli
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Seuraa kehotteita:
# - Anna ympäristön nimi: "dev"
# - Valitse tilaus (jos sinulla on useita)
# - Valitse alue: "East US 2" (tai haluamasi alue)
```

### Mitä juuri tapahtui?
- Ladattiin mallipohjan koodi paikalliseen hakemistoon
- Luotiin `azure.yaml`-tiedosto palvelumäärittelyillä
- Asetettiin infrastruktuurikoodi hakemistoon `infra/`
- Luotiin ympäristön määritys

## Vaihe 2: Tutustu projektin rakenteeseen

Tarkastellaan mitä azd loi meille:

```bash
# Näytä projektin rakenne
tree /f   # Windows
# tai
find . -type f | head -20   # macOS/Linux
```

Näet:
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

### Keskeiset tiedostot, jotka on hyvä ymmärtää

**azure.yaml** - azd-projektisi ydin:
```bash
# Näytä projektin määritys
cat azure.yaml
```

**infra/main.bicep** - Infrastruktuurin määrittely:
```bash
# Näytä infrastruktuurikoodi
head -30 infra/main.bicep
```

## Vaihe 3: Mukauta projektiasi (valinnainen)

Ennen käyttöönottoa voit mukauttaa sovellusta:

### Muokkaa frontendia
```bash
# Avaa React-sovelluksen komponentti
code src/web/src/App.tsx
```

Tee yksinkertainen muutos:
```typescript
// Etsi otsikko ja vaihda se
<h1>My Awesome Todo App</h1>
```

### Määritä ympäristömuuttujat
```bash
# Aseta mukautetut ympäristömuuttujat
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Näytä kaikki ympäristömuuttujat
azd env get-values
```

## Vaihe 4: Ota käyttöön Azureen

Nyt jännittävä osuus – ota kaikki käyttöön Azureen!

```bash
# Ota käyttöön infrastruktuuri ja sovellus
azd up

# Tämä komento suorittaa:
# 1. Ota käyttöön Azure-resursseja (App Service, Cosmos DB jne.)
# 2. Rakenna sovelluksesi
# 3. Ota sovellus käyttöön luoduille resursseille
# 4. Näytä sovelluksen URL-osoite
```

### Mitä tapahtuu käyttöönoton aikana?

Komento `azd up` suorittaa nämä vaiheet:
1. **Provision** (`azd provision`) - Luo Azure-resursseja
2. **Package** - Kääntää sovelluskoodisi
3. **Deploy** (`azd deploy`) - Ottaa koodin käyttöön Azure-resursseihin

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

### Pääsy sovellukseesi
Napsauta käyttöönoton tulosteessa annettua URL-osoitetta, tai hae se milloin tahansa:
```bash
# Hae sovelluksen päätepisteet
azd show

# Avaa sovellus selaimessasi
azd show --output json | jq -r '.services.web.endpoint'
```

### Testaa todo-sovellusta
1. **Lisää todo-kohta** - Napsauta "Add Todo" ja kirjoita tehtävä
2. **Merkitse suoritetuksi** - Rastita suoritetut kohteet
3. **Poista kohteita** - Poista tehtävät, joita et enää tarvitse

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

Tehdään muutos ja katsotaan, kuinka helppoa on päivittää:

### Muokkaa APIa
```bash
# Muokkaa API-koodia
code src/api/src/routes/lists.js
```

Lisää mukautettu vastausotsake:
```javascript
// Etsi reittikäsittelijä ja lisää:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Ota vain koodimuutokset käyttöön
```bash
# Ota käyttöön vain sovelluskoodi (ohita infrastruktuuri)
azd deploy

# Tämä on paljon nopeampaa kuin 'azd up', koska infrastruktuuri on jo olemassa
```

## Vaihe 7: Hallinnoi useita ympäristöjä

Luo staging-ympäristö testataksesi muutoksia ennen tuotantoa:

```bash
# Luo uusi staging-ympäristö
azd env new staging

# Julkaise staging-ympäristöön
azd up

# Palaa takaisin kehitysympäristöön
azd env select dev

# Listaa kaikki ympäristöt
azd env list
```

### Ympäristöjen vertailu
```bash
# Näytä kehitysympäristö
azd env select dev
azd show

# Näytä staging-ympäristö
azd env select staging
azd show
```

## Vaihe 8: Siivoa resurssit

Kun olet valmis kokeilujen kanssa, siivoa resurssit välttääksesi jatkuvia kuluja:

```bash
# Poista kaikki Azure-resurssit nykyisestä ympäristöstä
azd down

# Pakota poisto ilman vahvistusta ja poista pysyvästi pehmeästi poistetut resurssit
azd down --force --purge

# Poista tietty ympäristö
azd env select staging
azd down --force --purge
```

## Klassinen sovellus vs. AI-voimalla toimiva sovellus: Sama työnkulku

Osoitit juuri perinteisen web-sovelluksen käyttöönoton. Entä jos haluaisit ottaa käyttöön AI-voimalla toimivan sovelluksen — esimerkiksi chat-sovelluksen, joka hyödyntää Microsoft Foundry -malleja?

Hyvä uutinen: **työnkulku on identtinen.**

| Vaihe | Klassinen todo-sovellus | AI-chat-sovellus |
|------|-------------------------|------------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Ainoa ero on se, mistä **mallipohjasta** aloitat. AI-mallipohja sisältää lisäinfrastruktuuria (kuten Microsoft Foundry Models -resurssin tai AI Search -indeksin), mutta azd hoitaa kaiken puolestasi. Sinun ei tarvitse oppia uusia komentoja, ottaa käyttöön eri työkaluja tai muuttaa suhtautumistasi käyttöönottoon.

Tämä on azd:n ydinsanoma: **yhdenmukainen työnkulku, kaikki kuormitukset.** Taidot, joita harjoittelit tässä oppaassa — alustaminen, käyttöönotto, monitorointi, uudelleenkäyttöönotto ja siivous — pätevät yhtä lailla AI-sovelluksiin ja agenteihin.

---

## Mitä olet oppinut

Onnittelut! Olet onnistuneesti:
- ✅ Alustanut azd-projektin mallipohjasta
- ✅ Tutustunut projektin rakenteeseen ja keskeisiin tiedostoihin
- ✅ Ottanut full-stack-sovelluksen käyttöön Azureen
- ✅ Tehnyt koodimuutoksia ja ottanut ne uudelleen käyttöön
- ✅ Hallinnoinut useita ympäristöjä
- ✅ Siivonnut resurssit

## 🎯 Taitojen varmistusharjoitukset

### Harjoitus 1: Ota käyttöön eri mallipohja (15 minuuttia)
**Tavoite**: Näytä hallitsevasi azd init ja käyttöönoton työnkulku

```bash
# Kokeile Python + MongoDB -pinoa
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
- [ ] Voit avata sovelluksen URL-osoitteen selaimessa
- [ ] Sovellus toimii oikein (lisää/poista todoja)
- [ ] Resurssit siivottiin onnistuneesti

### Harjoitus 2: Mukauta konfiguraatiota (20 minuuttia)
**Tavoite**: Harjoitella ympäristömuuttujien määritystä

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
- [ ] Sovellus otetaan käyttöön mukautetuilla asetuksilla
- [ ] Voit varmistaa mukautetut asetukset käyttöönotetussa sovelluksessa

### Harjoitus 3: Moniympäristöinen työnkulku (25 minuuttia)
**Tavoite**: Hallitse ympäristöjen hallintaa ja käyttöönotto-strategioita

```bash
# Luo kehitysympäristö
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Kirjaa kehitysympäristön URL-osoite
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Luo staging-ympäristö
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Kirjaa staging-ympäristön URL-osoite
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
- [ ] Voit vaihtaa ympäristöjen välillä komennolla `azd env select`
- [ ] Ympäristömuuttujat eroavat ympäristöjen välillä
- [ ] Molemmat ympäristöt siivottiin onnistuneesti

## 📊 Edistymisesi

**Käytetty aika**: ~60-90 minuuttia  
**Hankitut taidot**:
- ✅ Mallipohjainen projektin alustaminen
- ✅ Azure-resurssien provisiointi
- ✅ Sovelluksen käyttöönoton työnkulut
- ✅ Ympäristöjen hallinta
- ✅ Konfiguraation hallinta
- ✅ Resurssien siivous ja kustannusten hallinta

**Seuraava taso**: Olet valmis [Konfigurointioppaaseen](configuration.md) oppimaan edistyneitä konfigurointimalleja!

## Yleisten ongelmien vianmääritys

### Todennusvirheet
```bash
# Kirjaudu uudelleen Azureen
az login

# Tarkista tilaukseen pääsy
az account show
```

### Käyttöönoton epäonnistumiset
```bash
# Ota virheenkorjauslokitus käyttöön
export AZD_DEBUG=true
azd up --debug

# Näytä sovelluksen lokit Azuressa
azd monitor --logs

# Container Apps -sovelluksille käytä Azure CLI:tä:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resurssinimen ristiriidat
```bash
# Käytä yksilöllistä ympäristön nimeä
azd env new dev-$(whoami)-$(date +%s)
```

### Portti-/verkko-ongelmat
```bash
# Tarkista, ovatko portit käytettävissä
netstat -an | grep :3000
netstat -an | grep :3100
```

## Seuraavat askeleet

Nyt kun olet suorittanut ensimmäisen projektisi, tutustu näihin edistyneempiin aiheisiin:

### 1. Mukauta infrastruktuuria
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Ota CI/CD käyttöön
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Täydelliset CI/CD-työnkulut
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Putken konfigurointi

### 3. Tuotannon parhaat käytännöt
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Turvallisuus, suorituskyky ja monitorointi

### 4. Tutustu laajemmin mallipohjiin
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

### Oppimateriaalia
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Yhteisö & tuki
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallipohjat & esimerkit
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Onnittelut ensimmäisen azd-projektisi suorittamisesta!** Olet nyt valmis rakentamaan ja ottamaan käyttöön upeita sovelluksia Azureen luottavaisin mielin.

---

**Lukujen navigointi:**
- **📚 Kurssin aloitus**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusta ja pika-aloitus
- **⬅️ Edellinen**: [Asennus ja määritys](installation.md)
- **➡️ Seuraava**: [Konfigurointi](configuration.md)
- **🚀 Seuraava luku**: [Luku 2: AI-ensisuuntainen kehitys](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Seuraava oppitunti**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää ensisijaisena lähteenä. Tärkeää tietoa varten suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->