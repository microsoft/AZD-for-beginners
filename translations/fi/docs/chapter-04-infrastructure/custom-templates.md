# Oman azd-mallin luominen

**Chapter Navigation:**
- **📚 Course Home**: [AZD Aloittelijoille](../../README.md)
- **📖 Current Chapter**: Luku 4 - Infrastruktuuri koodina & Deployment
- **⬅️ Previous**: [Deployment-opas](deployment-guide.md)
- **🚀 Next Chapter**: [Luku 5: Moni-agenttiset ratkaisut](../chapter-05-multi-agent/README.md)

> Vahvistettu `azd 1.25.6` kesäkuussa 2026.

## Johdanto

Tähän mennessä olet *kuluttanut* malleja komennolla `azd init --template <name>`. Kun tiimilläsi on kuitenkin projektirakenne, josta pidätte — esimerkiksi Container App, Cosmos DB ja oikea seuranta — haluat todennäköisesti muuttaa sen uudelleenkäytettäväksi malliksi. Malli on käytännössä Git-repositorio, jolla on ennakoitava rakenne, jonka azd osaa lukea. Tämä oppitunti näyttää, miten rakennat sellaisen alusta alkaen, testaat sitä ja (valinnaisesti) julkaiset sen yhteisön galleriaan.

## Oppimistavoitteet

Oppitunnin lopussa osaat:
- Ymmärtää, mikä tekee kansiosta "azd-mallin"
- Tietää tarvittavat tiedostot ja kansiorakenteen
- Lisätä `azure.yaml`-tiedoston ja `infra/`-kansion, joita muut voivat käyttää
- Testata mallisi paikallisesti ennen jakamista
- Julkaista sen ja (valinnaisesti) lähettää sen Awesome AZD:hen

## Oppimistulokset

Oppitunnin suorittamisen jälkeen pystyt:
- Luomaan uuden mallirepositorion
- Parametrisoimaan infrastruktuurin niin, että se toimii missä tahansa tilauksessa
- Validioimaan mallin `azd init`- ja `azd up` -komennoilla
- Lisäämään metatiedot, joita yhteisön galleria vaatii

---

## Mitä malli oikeastaan on?

azd-malli on **Git-repositorio**, joka sisältää vähintään:

| Tiedosto / kansio | Tarkoitus | Pakollinen? |
|---------------|---------|-----------|
| `azure.yaml` | Kuvaa palveluita, isäntiä ja infrastruktuuritoimittajaa | ✅ Kyllä |
| `infra/` | Bicep, Terraform tai Pulumi, joka provisioi resurssit | ✅ Kyllä |
| `src/` (tai koodisi) | Sovelluskoodi, jonka azd ottaa käyttöön | ✅ Kyllä |
| `README.md` | Kuinka käyttää mallia | ✅ Erittäin suositeltava |
| `.azdo/` tai `.github/` | CI/CD-putkistojen määrittelyt | Valinnainen |
| `.devcontainer/` | Toistettavissa oleva kehitysympäristö | Valinnainen |
| `azure.yaml` `metadata` | Gallerian ja telemetrian tiedot | Valinnainen (vaaditaan julkaisemiseen) |

Tässä ei ole mitään taikaa: kun ajat `azd init --template you/your-repo`, azd kloonaa repoon ja lukee `azure.yaml`-tiedoston.

---

## Vaihe 1: Luo repositorion rakenne

Luo kansiorakenne käsin tai aloita minimalistisesta mallista ja muokkaa sitä:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Luo vakioasettelu
mkdir -p src infra
```

Tyypillinen valmis rakenne näyttää tältä:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Vaihe 2: Kirjoita `azure.yaml`

Tämä on mallin ydin. Se kertoo azd:lle, mitä ottaa käyttöön ja miten:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Kenttää `metadata.template` käytetään gallerian telemetriassa käytön laskemiseen. Käytä `name@version`-käytäntöä.

---

## Vaihe 3: Parametrisoi infrastruktuuri

Yksi tärkeimmistä säännöistä *uudelleenkäytettävälle* mallille: **älä koskaan kovakoodaa nimiä, alueita tai tilauskohtaisia arvoja.** Käytä parametreja ja resurssitunnuskuviota, jotta sama malli toimii kenen tahansa tilauksessa.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Kaksi asiaa tekevät mallista malliin sopivan:

1. **`azd-env-name`-tunniste** — azd käyttää sitä ympäristökohtaiseen resurssien seurantaan ja siivoukseen.
2. **`uniqueString(...)`-resurssitunnus** — tuottaa vakaan, globaali-uniikin jälkiliitteen, jotta nimet eivät törmää.

Toimita vastaava parametrien tiedosto, joka lukee azd:n ympäristöstä injektoimat arvot:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd korvaa `${AZURE_ENV_NAME}` ja `${AZURE_LOCATION}` nykyisestä ympäristöstä automaattisesti.

---

## Vaihe 4: Testaa malliasi paikallisesti

Ennen jakamista varmista, että malli toimii puhtaalta tilalta.

**Testaa paikallisesta kansiosta** (ei vaadi Git-pushia):

```bash
# Tyhjästä hakemistosta alusta käyttäen paikallista mallipolkua
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisiointi + käyttöönotto päästä päähän
azd auth login
azd up
```

**Testaa sitten siivous**—hyvä malli siivoaa kokonaan:

```bash
azd down --force --purge
```

Jos `azd down` jättää resursseja jälkeensä, olet todennäköisesti unohtanut lisätä `azd-env-name`-tunnisteen johonkin resurssiin.

> **Vinkki:** suorita ensin `azd provision --preview`. Se tekee what-if-tarkistuksen ja tuo esiin mallivirheet ennen kuin mitään resurssia luodaan.

---

## Vaihe 5: Julkaise malli

Työnnä repositorio GitHubiin (julkiseksi, jos haluat muiden käyttävän sitä):

```bash
gh repo create my-azd-template --public --source=. --push
```

Kuka tahansa voi nyt käyttää sitä:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Vaihe 6 (valinnainen): Lähetä Awesome AZD -galleriaan

[Awesome AZD -galleria](https://azure.github.io/awesome-azd/) listaa yhteisön malleja. Jotta repositoriosi listattaisiin, sen tulisi sisältää:

- ✅ Selkeä `README.md`, jossa on vaatimukset, arkkitehtuurikaavio ja kustannustiedot
- ✅ Toimiva `azure.yaml`, jossa on `metadata.template`
- ✅ Infrastruktuuri, joka provisioituu puhtaasti uudessa tilauksessa
- ✅ `LICENSE`-tiedosto
- ✅ (Suositeltavaa) `.devcontainer/` yhden napsautuksen Codespacesia varten

Lähetä avaamalla pull request, joka lisää mallisi gallerian data-tiedostoon, noudattaen kontribuutio-opasta osoitteessa [Awesome AZD -repositorio](https://github.com/Azure/awesome-azd).

---

## Yleiset sudenkuopat

| Ongelma | Korjaus |
|---------|-----|
| Kovakoodatut resurssinimet | Käytä `uniqueString()`-resurssitunnusta |
| `azd down` jättää resursseja | Merkitse jokainen resurssi (tai resurssiryhmä) `azd-env-name`-tunnisteella |
| Malli toimii sinulla, mutta epäonnistuu muilla | Poista tilaus-ID:t, vuokralais-ID:t ja alueoletukset |
| Ulostulot eivät ole kytketty sovellukseen | Vie `SERVICE_<NAME>_ENDPOINT_URL` ja muut `AZURE_*`-ulostulot |
| Gallerian lähetys hylätty | Lisää `README.md`, `LICENSE` ja `metadata.template` |

---

## Yhteenveto

- Malli on vain Git-repositorio, jossa on `azure.yaml`, `infra/` ja koodisi.
- Parametrisoi kaikki—nimet, alueet ja tunnukset—jotta se toimii missä tahansa.
- Merkitse aina resurssit `azd-env-name`-tunnisteella, jotta `azd down` toimii.
- Testaa paikallisesti `azd init --template <local-path>` ennen julkaisemista.
- Lisää metatiedot ja README, jotta voit lähettää mallin Awesome AZD:hen.

---

## 🔗 Navigointi

| Suunta | Resurssi |
|-----------|----------|
| **Edellinen** | [Deployment-opas](deployment-guide.md) |
| **Luvun etusivu** | [Luku 4: Infrastruktuuri koodina](README.md) |
| **Seuraava luku** | [Luku 5: Moni-agenttiset ratkaisut](../chapter-05-multi-agent/README.md) |

## 📖 Aiheeseen liittyvät resurssit

- [Resurssien provisiointi](provisioning.md)
- [Awesome AZD -galleria](https://azure.github.io/awesome-azd/)
- [Virallinen azd-mallien dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->