# Ensimmäinen projektisi - Käytännön opas

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusta & Nopeasti alkuun
- **⬅️ Edellinen**: [Installation & Setup](installation.md)
- **➡️ Seuraava**: [Configuration](configuration.md)
- **🚀 Seuraava luku**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tervetuloa ensimmäiseen Azure Developer CLI -projektiisi! Tämä kattava käytännön opas tarjoaa täydellisen läpikäynnin koko pinon sovelluksen luomisesta, käyttöönotosta ja hallinnasta Azuren avulla azd:llä. Työskentelet oikean todo-sovelluksen kanssa, joka sisältää React-frontendin, Node.js API -backendin ja MongoDB-tietokannan.

## Oppimistavoitteet

Suorittamalla tämän oppaan:
- Hallitset azd-projektin alustamisprosessin mallipohjien avulla
- Ymmärrät Azure Developer CLI -projektin rakenteen ja kokoonpanotiedostot
- Suoritat sovelluksen täydellisen käyttöönoton Azureen infrastruktuurin provisioinnin yhteydessä
- Toteutat sovelluspäivitys- ja uudelleenkäyttöönotto-strategioita
- Hallitset useita ympäristöjä kehitystä ja testausvaihetta varten
- Sovellat resurssien siivousta ja kustannusten hallintakäytäntöjä

## Oppimistulokset

Kun olet suorittanut oppaan, osaat:
- Alustaa ja konfiguroida azd-projekteja mallipohjista itsenäisesti
- Navigoida ja muokata azd-projektin rakennetta tehokkaasti
- Ottaa full-stack -sovelluksia käyttöön Azureen yhdellä komennolla
- Ratkoa yleisiä käyttöönotto- ja todennusongelmia
- Hallita useita Azure-ympäristöjä eri käyttöönottoasteille
- Toteuttaa jatkuvan toimituksen työnkulkuja sovelluspäivityksiä varten

## Aloittaminen

### Esivaatimukset – tarkistuslista
- ✅ Azure Developer CLI asennettuna ([Installation Guide](installation.md))
- ✅ azd-todennus suoritettu komennolla `azd auth login`
- ✅ Git asennettuna järjestelmääsi
- ✅ Node.js 16+ (tätä opasta varten)
- ✅ Visual Studio Code (suositeltu)

Ennen kuin jatkat, suorita asennustarkistin repositorion juuresta:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Varmista asennuksesi
```bash
# Tarkista azd-asennus
azd version

# Tarkista AZD-todennus
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

## Vaihe 1: Valitse ja alusta mallipohja

Aloitetaan suositulla todo-sovellusmallilla, joka sisältää React-frontendin ja Node.js API -backendin.

```bash
# Selaa saatavilla olevia malleja
azd template list

# Alusta todo-sovelluksen malli
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Noudata kehotteita:
# - Anna ympäristön nimi: "dev"
# - Valitse tilaus (jos sinulla on useita)
# - Valitse alue: "East US 2" (tai haluamasi alue)
```

### Mitä juuri tapahtui?
- Mallikoodi ladattiin paikalliseen hakemistoon
- Luotiin `azure.yaml`-tiedosto palvelumäärittelyillä
- Määriteltiin infrastruktuurikoodi `infra/`-hakemistoon
- Luotiin ympäristön kokoonpano

## Vaihe 2: Tutki projektin rakennetta

Tarkastellaan mitä azd loi meille:

```bash
# Näytä projektin rakenne
tree /f   # Windows
# tai
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

### Tärkeät tiedostot, jotka kannattaa ymmärtää

**azure.yaml** - azd-projektisi ydin:
```bash
# Näytä projektin asetukset
cat azure.yaml
```

**infra/main.bicep** - Infrastruktuurin määrittely:
```bash
# Tarkastele infrastruktuurikoodia
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
// Etsi otsikko ja muuta se
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

Nyt jännittävä osa — ota kaikki käyttöön Azureen!

```bash
# Ota käyttöön infrastruktuuri ja sovellus
azd up

# Tämä komento suorittaa:
# 1. Provisionoi Azure-resursseja (App Service, Cosmos DB jne.)
# 2. Rakenna sovelluksesi
# 3. Ota käyttöön provisionoituihin resursseihin
# 4. Näytä sovelluksen URL-osoite
```

### Mitä tapahtuu käyttöönoton aikana?

`azd up` -komento suorittaa nämä vaiheet:
1. **Provision** (`azd provision`) - Luo Azure-resursseja
2. **Package** - Rakentaa sovelluskoodisi
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
Napsauta käyttöönoton tulosteessa annettua URL-osoitetta tai hae se milloin tahansa:
```bash
# Hae sovelluksen päätepisteet
azd show

# Avaa sovellus selaimessasi
azd show --output json | jq -r '.services.web.endpoint'
```

### Testaa todo-sovellusta
1. **Add a todo item** - Napsauta "Add Todo" ja kirjoita tehtävä
2. **Mark as complete** - Rastita suoritetut kohteet
3. **Delete items** - Poista tarpeettomat todo-tehtävät

### Seuraa sovellustasi
```bash
# Avaa Azure-portaali resursseillesi
azd monitor

# Näytä sovelluksen lokit
azd monitor --logs

# Näytä reaaliaikaiset mittarit
azd monitor --live
```

### ✅ Vahvista käyttöönotto

Ennen kuin jatkat, käy tämä nopea tarkistuslista läpi varmistaaksesi, että kaikki todella toimii—älä oleta, että "deploy succeeded" tarkoittaa, että sovellus toimii:

```bash
# 1. Varmista, että päätepiste on olemassa ja saavutettavissa
azd show

# 2. Suorita savutesti päätepisteelle (odottaa HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Tarkista sovelluksesi terveystila-päätepiste, jos sellainen on
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Käyttöönotto on vahvistettu, kun:**
- ✅ `azd show` näyttää saavutettavan endpointin URL-osoitteen
- ✅ URL avautuu selaimessasi ilman virheitä
- ✅ Perustoiminnot toimivat (lisää/merkitse valmiiksi/poista todo)
- ✅ `azd monitor --logs` näyttää saapuvat pyynnöt ilman odottamattomia virheitä

Jos jokin kohta epäonnistuu, siirry kohtaan [Luku 7: Vianmääritys](../chapter-07-troubleshooting/README.md).

## Vaihe 6: Tee muutoksia ja ota uudelleen käyttöön

Tehdään muutos ja katsotaan, kuinka helppoa päivitys on:

### Muokkaa APIa
```bash
# Muokkaa API-koodia
code src/api/src/routes/lists.js
```

Lisää mukautettu vastausotsikko:
```javascript
// Etsi reitin käsittelijä ja lisää:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Ota käyttöön vain koodimuutokset
```bash
# Ota käyttöön vain sovelluksen koodi (ohita infrastruktuuri)
azd deploy

# Tämä on paljon nopeampaa kuin 'azd up', koska infrastruktuuri on jo olemassa
```

## Vaihe 7: Hallitse useita ympäristöjä

Luo staging-ympäristö testataksesi muutokset ennen tuotantoon siirtämistä:

```bash
# Luo uusi esivalmisteluympäristö
azd env new staging

# Julkaise esivalmisteluympäristöön
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

# Näytä esikatseluympäristö
azd env select staging
azd show
```

## Vaihe 8: Siivoa resurssit

Kun olet valmis kokeiluissa, siivoa resurssit välttääksesi jatkuvat kustannukset:

```bash
# Poista kaikki Azure-resurssit nykyisestä ympäristöstä
azd down

# Pakota poisto ilman vahvistusta ja poista pysyvästi pehmeästi poistetut resurssit
azd down --force --purge

# Poista tietty ympäristö
azd env select staging
azd down --force --purge
```

## Perinteinen sovellus vs. tekoälypohjainen sovellus: sama työnkulku

Juuri otit käyttöön perinteisen web-sovelluksen. Entä jos haluaisit sen sijaan ottaa käyttöön tekoälypohjaisen sovelluksen — esimerkiksi chat-sovelluksen, jonka taustalla on Microsoft Foundry Models?

Hyvä uutinen: **työnkulku on identtinen.**

| Vaihe | Perinteinen Todo-sovellus | Tekoäly-chat-sovellus |
|------|-------------------------|------------------------|
| Alusta | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Todennus | `azd auth login` | `azd auth login` |
| Ota käyttöön | `azd up` | `azd up` |
| Valvo | `azd monitor` | `azd monitor` |
| Siivoa | `azd down --force --purge` | `azd down --force --purge` |

Ainoa ero on se **mallipohja**, josta aloitat. AI-mallipohja sisältää lisäinfrastruktuuria (esim. Microsoft Foundry Models -resurssi tai AI Search -indeksi), mutta azd hoitaa kaiken puolestasi. Sinun ei tarvitse oppia uusia komentoja, ottaa käyttöön eri työkalua tai muuttaa tapaa, jolla ajattelet käyttöönottoa.

Tämä on azd:n keskeinen periaate: **yksi työnkulku, mikä tahansa työnkuorma.** Taidot, joita harjoittelit tässä oppaassa — alustaminen, käyttöönotto, valvonta, uudelleenkäyttöönotto ja siivous — pätevät yhtä lailla AI-sovelluksiin ja agenteihin.

---

## Mitä opit

Onnittelut! Olet onnistuneesti:
- ✅ Alustanut azd-projektin mallipohjasta
- ✅ Tutkinut projektin rakennetta ja keskeisiä tiedostoja
- ✅ Ottanut full-stack -sovelluksen käyttöön Azureen
- ✅ Tehnyt koodimuutoksia ja ottanut uudelleen käyttöön
- ✅ Hallinnoinut useita ympäristöjä
- ✅ Siivonnut resurssit

## 🎯 Taitojen varmistamistehtävät

### Harjoitus 1: Ota käyttöön eri mallipohja (15 minuuttia)
**Tavoite**: Näytä hallitsevasi azd init ja käyttöönoton työnkulku

```bash
# Kokeile Python- ja MongoDB-pinoa
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Varmista käyttöönotto
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Siivoa
azd down --force --purge
```

**Onnistumisen kriteerit:**
- [ ] Sovellus otetaan käyttöön ilman virheitä
- [ ] Pääset käsiksi sovelluksen URL-osoitteeseen selaimessa
- [ ] Sovellus toimii oikein (lisää/poista to-dolista)
- [ ] Resurssit puhdistettiin onnistuneesti

### Harjoitus 2: Mukauta kokoonpanoa (20 minuuttia)
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

# Ota käyttöön mukautetulla kokoonpanolla
azd up
```

**Onnistumisen kriteerit:**
- [ ] Mukautettu ympäristö luotu onnistuneesti
- [ ] Ympäristömuuttujat asetettu ja haettavissa
- [ ] Sovellus otetaan käyttöön mukautetuilla asetuksilla
- [ ] Voit vahvistaa mukautetut asetukset otetussa sovelluksessa

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

# Luo esituotantoympäristö
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Kirjaa esituotantoympäristön URL-osoite
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

**Onnistumisen kriteerit:**
- [ ] Kaksi ympäristöä luotu eri kokoonpanoilla
- [ ] Molemmat ympäristöt otettu käyttöön onnistuneesti
- [ ] Voit vaihtaa ympäristöjen välillä komennolla `azd env select`
- [ ] Ympäristömuuttujat poikkeavat ympäristöittäin
- [ ] Molemmat ympäristöt siivottu onnistuneesti

## 📊 Edistymisesi

**Käytetty aika**: ~60-90 minuuttia  
**Hankitut taidot**:
- ✅ Mallipohjainen projektin alustaminen
- ✅ Azure-resurssien provisiointi
- ✅ Sovelluksen käyttöönoton työnkulut
- ✅ Ympäristöjen hallinta
- ✅ Kokoonpanon hallinta
- ✅ Resurssien siivous ja kustannusten hallinta

**Seuraava askel**: Olet valmis [Konfigurointiopas](configuration.md) -osion pariin oppiaksesi edistyneitä konfiguraatiomalleja!

## Yleiset vianmääritysongelmat

### Todennusvirheet
```bash
# Tunnistaudu uudelleen Azureen
az login

# Varmista tilauksen käyttöoikeudet
az account show
```

### Käyttöönoton epäonnistumiset
```bash
# Ota virheenkorjauslokitus käyttöön
export AZD_DEBUG=true
azd up --debug

# Näytä sovelluksen lokit Azure-palvelussa
azd monitor --logs

# Container Apps -sovelluksille käytä Azure CLI:tä:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resurssin nimen ristiriidat
```bash
# Käytä ainutlaatuista ympäristön nimeä
azd env new dev-$(whoami)-$(date +%s)
```

### Portti-/verkkongelmat
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

### 2. Ota käyttöön CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Täydelliset CI/CD-työnkulut
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Putkiston konfigurointi

### 3. Tuotannon parhaat käytännöt
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Turvallisuus, suorituskyky ja valvonta

### 4. Tutustu lisää mallipohjiin
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

### Oppimateriaalit
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
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
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusta & Nopeasti alkuun
- **⬅️ Edellinen**: [Installation & Setup](installation.md)
- **➡️ Seuraava**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Seuraava luku**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->