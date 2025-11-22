<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-21T16:09:49+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "fi"
}
-->
# Ensimmäinen projektisi - Käytännön opas

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusteet & Nopea aloitus
- **⬅️ Edellinen**: [Asennus & Asetukset](installation.md)
- **➡️ Seuraava**: [Konfigurointi](configuration.md)
- **🚀 Seuraava luku**: [Luku 2: AI-Ensisijainen kehitys](../microsoft-foundry/microsoft-foundry-integration.md)

## Johdanto

Tervetuloa ensimmäiseen Azure Developer CLI -projektiisi! Tämä kattava käytännön opas tarjoaa täydellisen läpikäynnin täysimittaisen sovelluksen luomisesta, käyttöönotosta ja hallinnasta Azuren avulla käyttäen azd-työkalua. Työskentelet todellisen tehtävälistasovelluksen kanssa, joka sisältää React-frontendin, Node.js API-backendin ja MongoDB-tietokannan.

## Oppimistavoitteet

Tämän oppaan suorittamalla opit:
- Hallitsemaan azd-projektin aloitustyönkulun mallien avulla
- Ymmärtämään Azure Developer CLI -projektin rakenteen ja konfigurointitiedostot
- Toteuttamaan sovelluksen täydellisen käyttöönoton Azureen infrastruktuurin provisioinnin kanssa
- Toteuttamaan sovelluspäivityksiä ja uudelleenkäyttöstrategioita
- Hallitsemaan useita ympäristöjä kehitystä ja testausvaiheita varten
- Soveltamaan resurssien siivous- ja kustannustenhallintakäytäntöjä

## Oppimistulokset

Kun olet suorittanut oppaan, osaat:
- Aloittaa ja konfiguroida azd-projekteja itsenäisesti mallien avulla
- Navigoida ja muokata azd-projektirakenteita tehokkaasti
- Ottaa täysimittaisia sovelluksia käyttöön Azureen yksinkertaisilla komennoilla
- Ratkaista yleisiä käyttöönotto- ja autentikointiongelmia
- Hallita useita Azure-ympäristöjä eri käyttöönottoasteille
- Toteuttaa jatkuvan käyttöönoton työnkulkuja sovelluspäivityksille

## Aloittaminen

### Esivaatimusten tarkistuslista
- ✅ Azure Developer CLI asennettuna ([Asennusopas](installation.md))
- ✅ Azure CLI asennettuna ja autentikoituna
- ✅ Git asennettuna järjestelmääsi
- ✅ Node.js 16+ (tätä opasta varten)
- ✅ Visual Studio Code (suositeltu)

### Varmista asennuksesi
```bash
# Tarkista azd-asennus
azd version
```
### Varmista Azure-autentikointi

```bash
az account show
```

### Tarkista Node.js-versio
```bash
node --version
```

## Vaihe 1: Valitse ja aloita malli

Aloitetaan suositulla tehtävälistasovellusmallilla, joka sisältää React-frontendin ja Node.js API-backendin.

```bash
# Selaa saatavilla olevia malleja
azd template list

# Alusta tehtävälistasovelluksen malli
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Seuraa kehotteita:
# - Anna ympäristön nimi: "dev"
# - Valitse tilaus (jos sinulla on useita)
# - Valitse alue: "East US 2" (tai haluamasi alue)
```

### Mitä juuri tapahtui?
- Mallikoodi ladattiin paikalliseen hakemistoosi
- Luotiin `azure.yaml`-tiedosto palvelumääritelmillä
- Infrastruktuurikoodi asetettiin `infra/`-hakemistoon
- Luotiin ympäristön konfiguraatio

## Vaihe 2: Tutki projektin rakennetta

Tutkitaan, mitä azd loi meille:

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

### Tärkeät tiedostot ymmärtää

**azure.yaml** - azd-projektisi ydin:
```bash
# Näytä projektin kokoonpano
cat azure.yaml
```

**infra/main.bicep** - Infrastruktuurin määritelmä:
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
// Etsi otsikko ja muuta sitä
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

Nyt jännittävä osa - ota kaikki käyttöön Azureen!

```bash
# Ota käyttöön infrastruktuuri ja sovellus
azd up

# Tämä komento:
# 1. Luo Azure-resursseja (App Service, Cosmos DB, jne.)
# 2. Rakentaa sovelluksesi
# 3. Ottaa käyttöön luodut resurssit
# 4. Näyttää sovelluksen URL-osoitteen
```

### Mitä tapahtuu käyttöönoton aikana?

`azd up` -komento suorittaa seuraavat vaiheet:
1. **Provision** (`azd provision`) - Luo Azure-resurssit
2. **Package** - Rakentaa sovelluskoodisi
3. **Deploy** (`azd deploy`) - Ottaa koodin käyttöön Azure-resursseihin

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

### Pääsy sovellukseen
Klikkaa käyttöönoton tuloksena annettua URL-osoitetta tai hae se milloin tahansa:
```bash
# Hae sovelluksen päätepisteet
azd show

# Avaa sovellus selaimessasi
azd show --output json | jq -r '.services.web.endpoint'
```

### Testaa tehtävälistasovellusta
1. **Lisää tehtävä** - Klikkaa "Add Todo" ja syötä tehtävä
2. **Merkitse valmiiksi** - Ruksaa valmiit tehtävät
3. **Poista tehtäviä** - Poista tehtävät, joita et enää tarvitse

### Seuraa sovellustasi
```bash
# Avaa Azure-portaali resursseillesi
azd monitor

# Näytä sovelluksen lokit
azd logs
```

## Vaihe 6: Tee muutoksia ja ota uudelleen käyttöön

Tehdään muutos ja katsotaan, kuinka helppoa on päivittää:

### Muokkaa API:ta
```bash
# Muokkaa API-koodia
code src/api/src/routes/lists.js
```

Lisää mukautettu vastausotsikko:
```javascript
// Etsi reittikäsittelijä ja lisää:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Ota käyttöön vain koodimuutokset
```bash
# Ota käyttöön vain sovelluskoodi (ohita infrastruktuuri)
azd deploy

# Tämä on paljon nopeampaa kuin 'azd up', koska infrastruktuuri on jo olemassa
```

## Vaihe 7: Hallitse useita ympäristöjä

Luo testausympäristö muutosten testaamiseksi ennen tuotantoa:

```bash
# Luo uusi välivaiheen ympäristö
azd env new staging

# Ota käyttöön välivaiheessa
azd up

# Vaihda takaisin kehitysympäristöön
azd env select dev

# Luettele kaikki ympäristöt
azd env list
```

### Ympäristöjen vertailu
```bash
# Näytä kehitysympäristö
azd env select dev
azd show

# Näytä välivaiheen ympäristö
azd env select staging
azd show
```

## Vaihe 8: Siivoa resurssit

Kun olet valmis kokeilujen kanssa, siivoa välttääksesi jatkuvat kulut:

```bash
# Poista kaikki Azure-resurssit nykyisestä ympäristöstä
azd down

# Pakota poisto ilman vahvistusta ja poista pehmeästi poistetut resurssit
azd down --force --purge

# Poista tietty ympäristö
azd env select staging
azd down --force --purge
```

## Mitä olet oppinut

Onnittelut! Olet onnistuneesti:
- ✅ Aloittanut azd-projektin mallista
- ✅ Tutkinut projektin rakennetta ja keskeisiä tiedostoja
- ✅ Ottanut täysimittaisen sovelluksen käyttöön Azureen
- ✅ Tehnyt koodimuutoksia ja ottanut uudelleen käyttöön
- ✅ Hallinnut useita ympäristöjä
- ✅ Siivonnut resurssit

## 🎯 Taitojen validointiharjoitukset

### Harjoitus 1: Ota käyttöön eri malli (15 minuuttia)
**Tavoite**: Osoita azd init- ja käyttöönoton työnkulun hallinta

```bash
# Kokeile Python + MongoDB -pinoa
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Vahvista käyttöönotto
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Siivoa
azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Sovellus otetaan käyttöön ilman virheitä
- [ ] Sovelluksen URL-osoite on käytettävissä selaimessa
- [ ] Sovellus toimii oikein (lisää/poista tehtäviä)
- [ ] Kaikki resurssit siivottu onnistuneesti

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

# Vahvista muuttujat
azd env get-values | grep APP_TITLE

# Ota käyttöön mukautetulla kokoonpanolla
azd up
```

**Onnistumiskriteerit:**
- [ ] Mukautettu ympäristö luotu onnistuneesti
- [ ] Ympäristömuuttujat asetettu ja haettavissa
- [ ] Sovellus otettu käyttöön mukautetulla konfiguraatiolla
- [ ] Mukautetut asetukset vahvistettu käyttöön otetussa sovelluksessa

### Harjoitus 3: Moniympäristötyönkulku (25 minuuttia)
**Tavoite**: Hallitse ympäristöjen hallinta- ja käyttöönotto-strategioita

```bash
# Luo kehitysympäristö
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Merkitse kehitysympäristön URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Luo testausympäristö
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Merkitse testausympäristön URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Vertaa ympäristöjä
azd env list

# Testaa molemmat ympäristöt
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Siivoa molemmat
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

**Käytetty aika**: ~60-90 minuuttia  
**Hankitut taidot**:
- ✅ Mallipohjainen projektin aloitus
- ✅ Azuren resurssien provisiointi
- ✅ Sovelluksen käyttöönoton työnkulut
- ✅ Ympäristöjen hallinta
- ✅ Konfiguraation hallinta
- ✅ Resurssien siivous ja kustannusten hallinta

**Seuraava taso**: Olet valmis [Konfiguraatio-oppaaseen](configuration.md) oppimaan edistyneitä konfiguraatiomalleja!

## Yleisten ongelmien vianmääritys

### Autentikointivirheet
```bash
# Uudelleentodennus Azureen
az login

# Vahvista tilauksen käyttöoikeus
az account show
```

### Käyttöönoton epäonnistumiset
```bash
# Ota käyttöön virheenkorjauslokit
export AZD_DEBUG=true
azd up --debug

# Näytä yksityiskohtaiset lokit
azd logs --service api
azd logs --service web
```

### Resurssinimien ristiriidat
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
- [Infrastruktuuri koodina](../deployment/provisioning.md)
- [Lisää tietokantoja, tallennustilaa ja muita palveluita](../deployment/provisioning.md#adding-services)

### 2. Aseta CI/CD
- [GitHub Actions -integraatio](../deployment/cicd-integration.md)
- [Azure DevOps -putket](../deployment/cicd-integration.md#azure-devops)

### 3. Tuotannon parhaat käytännöt
- [Turvallisuusasetukset](../deployment/best-practices.md#security)
- [Suorituskyvyn optimointi](../deployment/best-practices.md#performance)
- [Seuranta ja lokitus](../deployment/best-practices.md#monitoring)

### 4. Tutustu lisää malleihin
```bash
# Selaa malleja kategorian mukaan
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Kokeile eri teknologiakokonaisuuksia
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Lisäresurssit

### Oppimateriaalit
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkkitehtuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Yhteisö & Tuki
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer -yhteisö](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallit & Esimerkit
- [Virallinen malligalleria](https://azure.github.io/awesome-azd/)
- [Yhteisön mallit](https://github.com/Azure-Samples/azd-templates)
- [Yrityskuvioita](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Onnittelut ensimmäisen azd-projektisi suorittamisesta!** Olet nyt valmis rakentamaan ja ottamaan käyttöön upeita sovelluksia Azureen luottavaisin mielin.

---

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusteet & Nopea aloitus
- **⬅️ Edellinen**: [Asennus & Asetukset](installation.md)
- **➡️ Seuraava**: [Konfigurointi](configuration.md)
- **🚀 Seuraava luku**: [Luku 2: AI-Ensisijainen kehitys](../microsoft-foundry/microsoft-foundry-integration.md)
- **Seuraava oppitunti**: [Käyttöönotto-opas](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->