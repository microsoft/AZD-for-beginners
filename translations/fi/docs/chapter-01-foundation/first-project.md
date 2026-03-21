# Ensimmäinen projektisi - Käytännön opas

**Chapter Navigation:**
- **📚 Kurssin aloitus**: [AZD aloittelijoille](../../README.md)
- **📖 Current Chapter**: Luku 1 - Perusta & Pikakäynnistys
- **⬅️ Previous**: [Asennus ja asetukset](installation.md)
- **➡️ Next**: [Konfigurointi](configuration.md)
- **🚀 Next Chapter**: [Luku 2: AI-ensisuuntautunut kehitys](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tervetuloa ensimmäiseen Azure Developer CLI -projektiisi! Tämä kattava käytännön opas tarjoaa täydellisen läpikäynnin täyden pinon sovelluksen luomisesta, julkaisemisesta ja hallinnasta Azureen käyttäen azd:ta. Työskentelet oikean todo-sovelluksen kanssa, joka sisältää React-frontendin, Node.js API -backendin ja MongoDB-tietokannan.

## Oppimistavoitteet

Suoritettuasi tämän opastehtävän:
- Hallitset azd-projektin alustamisen työnkulun mallien avulla
- Ymmärrät Azure Developer CLI -projektin rakenteen ja konfiguraatiotiedostot
- Suoritat sovelluksen täydellisen julkaisun Azureen infrastruktuurin provisioinnin kanssa
- Toteutat sovelluspäivitykset ja uudelleenjulkaisustrategiat
- Hallitset useita ympäristöjä kehitystä ja stagingia varten
- Sovellat resurssien siivousta ja kustannustenhallintakäytäntöjä

## Oppimistulokset

Suoritettuasi tehtävän osaat:
- Alustaa ja konfiguroida azd-projekteja malleista itsenäisesti
- Navigoida ja muokata azd-projektirakenteita tehokkaasti
- Julkaista täyden pinon sovelluksia Azureen yhdellä komennolla
- Vianetsintä yleisissä julkaisu- ja todennusongelmissa
- Hallita useita Azure-ympäristöjä eri julkaisuvaiheita varten
- Toteuttaa jatkuvan julkaisun työnkulkuja sovelluspäivityksiä varten

## Aloittaminen

### Esivaatimusten tarkistuslista
- ✅ Azure Developer CLI asennettuna ([Asennusopas](installation.md))
- ✅ Azure CLI asennettuna ja todennettuna
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

## Vaihe 1: Valitse ja alusta malli

Aloitetaan suositulla todo-sovellusmallilla, joka sisältää React-käyttöliittymän ja Node.js API -taustapalvelimen.

```bash
# Selaa saatavilla olevia malleja
azd template list

# Alusta todo-sovellusmalli
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Noudata kehotteita:
# - Anna ympäristön nimi: "dev"
# - Valitse tilaus (jos sinulla on useita)
# - Valitse alue: "East US 2" (tai haluamasi alue)
```

### Mitä juuri tapahtui?
- Ladattiin mallin koodi paikalliseen hakemistoosi
- Luotiin `azure.yaml`-tiedosto palvelumäärittelyillä
- Määritettiin infrastruktuurikoodi `infra/`-hakemistoon
- Luotiin ympäristökonfiguraatio

## Vaihe 2: Tutki projektin rakennetta

Katsotaan, mitä azd loi meille:

```bash
# Näytä projektin rakenne
tree /f   # Windows
# tai
find . -type f | head -20   # macOS/Linux
```

You should see:
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

**infra/main.bicep** - Infrastruktuurin määritelmä:
```bash
# Tarkastele infrastruktuurikoodia
head -30 infra/main.bicep
```

## Vaihe 3: Mukauta projektiasi (valinnainen)

Ennen käyttöönottoa voit muokata sovellusta:

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

### Määritä ympäristömuuttujat
```bash
# Aseta mukautetut ympäristömuuttujat
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Näytä kaikki ympäristömuuttujat
azd env get-values
```

## Vaihe 4: Julkaise Azureen

Nyt jännittävä osa — julkaise kaikki Azureen!

```bash
# Ota käyttöön infrastruktuuri ja sovellus
azd up

# Tämä komento suorittaa:
# 1. Luo Azure-resursseja (App Service, Cosmos DB jne.)
# 2. Rakenna sovelluksesi
# 3. Julkaise provisioituihin resursseihin
# 4. Näytä sovelluksen URL-osoite
```

### Mitä tapahtuu julkaisun aikana?

Komento `azd up` suorittaa nämä vaiheet:
1. **Provision** (`azd provision`) - Luo Azure-resursseja
2. **Package** - Kokoa/rakentaa sovelluskoodisi
3. **Deploy** (`azd deploy`) - Julkaisee koodin Azure-resursseille

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
Klikkaa deployment-tilanteessa annettua URL-osoitetta tai hae se milloin tahansa:
```bash
# Hae sovelluksen päätepisteet
azd show

# Avaa sovellus selaimessasi
azd show --output json | jq -r '.services.web.endpoint'
```

### Testaa Todo-sovellusta
1. **Lisää todo-merkintä** - Klikkaa "Add Todo" ja syötä tehtävä
2. **Merkitse valmiiksi** - Ruksaa valmiit kohteet
3. **Poista kohteita** - Poista tarpeettomat todo-merkinnät

### Seuraa sovellustasi
```bash
# Avaa Azure-portaali resursseillesi
azd monitor

# Näytä sovelluksen lokit
azd monitor --logs

# Näytä reaaliaikaiset mittarit
azd monitor --live
```

## Vaihe 6: Tee muutoksia ja julkaise uudelleen

Tehdään muutos ja katsotaan, kuinka helppoa päivitys on:

### Muokkaa API:a
```bash
# Muokkaa API-koodia
code src/api/src/routes/lists.js
```

Lisää mukautettu vastausotsikko:
```javascript
// Etsi reitinkäsittelijä ja lisää:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Julkaise vain koodimuutokset
```bash
# Ota käyttöön vain sovelluskoodi (ohita infrastruktuuri)
azd deploy

# Tämä on paljon nopeampaa kuin 'azd up', koska infrastruktuuri on jo olemassa
```

## Vaihe 7: Hallitse useita ympäristöjä

Luo staging-ympäristö testataksesi muutoksia ennen tuotantoon siirtoa:

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

# Näytä esituotanto-ympäristö
azd env select staging
azd show
```

## Vaihe 8: Siivoa resurssit

Kun olet valmis kokeilujen kanssa, siivoa resurssit välttääksesi jatkuvat kustannukset:

```bash
# Poista kaikki Azure-resurssit nykyisestä ympäristöstä
azd down

# Pakota poisto ilman vahvistusta ja lopullisesti poista pehmeästi poistetut resurssit
azd down --force --purge

# Poista tietty ympäristö
azd env select staging
azd down --force --purge
```

## Perinteinen sovellus vs. AI-pohjainen sovellus: sama työnkulku

Juuri julkaisit perinteisen web-sovelluksen. Mutta entä jos haluaisit julkaista AI-pohjaisen sovelluksen sen sijaan — esimerkiksi keskustelusovelluksen, jota tukevat Microsoft Foundry Models?

Hyvät uutiset: **työnkulku on identtinen.**

| Vaihe | Perinteinen Todo-sovellus | AI-keskustelusovellus |
|------|-------------------------|-----------------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Ainoa ero on se **malli**, josta aloitat. AI-malli sisältää lisäinfrastruktuuria (kuten Microsoft Foundry Models -resurssin tai AI Search -indeksin), mutta azd hoitaa kaiken puolestasi. Sinun ei tarvitse oppia uusia komentoja, ottaa käyttöön eri työkalua tai muuttaa tapaa, jolla ajattelet julkaisua.

Tämä on azd:n ydinteesi: **yksi työnkulku, mikä tahansa työkuorma.** Tämän oppaan harjoituksissa harjoittelemasi taidot — alustaminen, julkaisu, seuranta, uudelleenjulkaisu ja siivous — pätevät yhtä lailla AI-sovelluksiin ja agentteihin.

---

## Mitä opit

Onnittelut! Olet onnistuneesti:
- ✅ Alustanut azd-projektin mallista
- ✅ Tutkinut projektirakennetta ja keskeisiä tiedostoja
- ✅ Julkaissut täyden pinon sovelluksen Azureen
- ✅ Tehnyt koodimuutoksia ja julkaissut uudelleen
- ✅ Hallinnoinut useita ympäristöjä
- ✅ Siivonnut resurssit

## 🎯 Taitojen vahvistusharjoitukset

### Harjoitus 1: Ota käyttöön eri malli (15 minuuttia)
**Tavoite**: Näytä hallitsevasi azd init- ja julkaisutyönkulku

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
- [ ] Sovellus julkaistaan ilman virheitä
- [ ] Saatavilla oleva sovellus-URL toimii selaimessa
- [ ] Sovellus toimii oikein (lisää/poista todoja)
- [ ] Kaikki resurssit on onnistuneesti siivottu

### Harjoitus 2: Mukauta konfiguraatiota (20 minuuttia)
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

**Onnistumiskriteerit:**
- [ ] Mukautettu ympäristö luotu onnistuneesti
- [ ] Ympäristömuuttujat asetettu ja haettavissa
- [ ] Sovellus julkaistaan mukautetulla konfiguraatiolla
- [ ] Voit varmistaa mukautetut asetukset julkaistussa sovelluksessa

### Harjoitus 3: Moniympäristöinen työnkulku (25 minuuttia)
**Tavoite**: Hallitse ympäristöjen hallinta ja julkaisustrategiat

```bash
# Luo kehitysympäristö
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Merkitse kehitysympäristön URL-osoite
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Luo staging-ympäristö
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Merkitse staging-ympäristön URL-osoite
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Vertaile ympäristöjä
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
- [ ] Molemmat ympäristöt julkaistu onnistuneesti
- [ ] Voit vaihtaa ympäristöjen välillä käyttäen `azd env select`
- [ ] Ympäristömuuttujat poikkeavat ympäristöjen välillä
- [ ] Molemmat ympäristöt on siivottu onnistuneesti

## 📊 Edistymisesi

**Käytetty aika**: ~60-90 minuuttia  
**Hankitut taidot**:
- ✅ Mallipohjainen projektin alustaminen
- ✅ Azure-resurssien provisiointi
- ✅ Sovelluksen julkaisu-työnkulut
- ✅ Ympäristöjen hallinta
- ✅ Konfiguraation hallinta
- ✅ Resurssien siivous ja kustannusten hallinta

**Seuraava taso**: Olet valmis [Konfigurointiopas](configuration.md) oppimaan kehittyneitä konfigurointimalleja!

## Yleisten ongelmien vianmääritys

### Todentamisvirheet
```bash
# Tunnistaudu uudelleen Azureen
az login

# Tarkista tilauksen käyttöoikeudet
az account show
```

### Julkaisun epäonnistumiset
```bash
# Ota debug-lokin kirjaus käyttöön
export AZD_DEBUG=true
azd up --debug

# Näytä sovelluksen lokit Azure-palvelussa
azd monitor --logs

# Container Apps -sovelluksille käytä Azure CLI:tä:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resurssinimen ristiriidat
```bash
# Käytä ainutlaatuista ympäristön nimeä
azd env new dev-$(whoami)-$(date +%s)
```

### Portti- ja verkkongelmat
```bash
# Tarkista, ovatko portit käytettävissä
netstat -an | grep :3000
netstat -an | grep :3100
```

## Seuraavat askeleet

Nyt kun olet suorittanut ensimmäisen projektisi, tutustu näihin edistyneempiin aiheisiin:

### 1. Mukauta infrastruktuuria
- [Infrastruktuuri koodina](../chapter-04-infrastructure/provisioning.md)
- [Lisää tietokantoja, tallennustilaa ja muita palveluita](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Ota CI/CD käyttöön
- [Julkaisuopas](../chapter-04-infrastructure/deployment-guide.md) - Täydelliset CI/CD-työnkulut
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Putkiston konfigurointi

### 3. Tuotannon parhaat käytännöt
- [Julkaisuopas](../chapter-04-infrastructure/deployment-guide.md) - Turvallisuus, suorituskyky ja seuranta

### 4. Tutustu lisää malleihin
```bash
# Selaa malleja kategorian mukaan
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Kokeile erilaisia teknologiapinoja
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Lisäresurssit

### Oppimateriaali
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure-arkkitehtuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected -viitekehys](https://learn.microsoft.com/en-us/azure/well-architected/)

### Yhteisö ja tuki
- [Azure Developer CLI -GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer -yhteisö](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallit ja esimerkit
- [Virallinen malligalleria](https://azure.github.io/awesome-azd/)
- [Yhteisön mallit](https://github.com/Azure-Samples/azd-templates)
- [Yritysmallit](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Onnittelut ensimmäisen azd-projektisi suorittamisesta!** Olet nyt valmis rakentamaan ja julkaisemaan upeita sovelluksia Azureen itsevarmasti.

---

**Chapter Navigation:**
- **📚 Kurssin aloitus**: [AZD aloittelijoille](../../README.md)
- **📖 Current Chapter**: Luku 1 - Perusta & Pikakäynnistys
- **⬅️ Previous**: [Asennus ja asetukset](installation.md)
- **➡️ Next**: [Konfigurointi](configuration.md)
- **🚀 Next Chapter**: [Luku 2: AI-ensisuuntautunut kehitys](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Julkaisuopas](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulisi pitää määräävänä lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista käännöstä. Emme ole vastuussa mistään väärinymmärryksistä tai virhetulkinnasta, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->