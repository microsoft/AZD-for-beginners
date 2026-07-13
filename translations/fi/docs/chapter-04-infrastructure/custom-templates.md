# Oman azd-mallin luominen

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 4 - Infrastruktuuri koodina & käyttöönotto
- **⬅️ Edellinen**: [Käyttöönotto-opas](deployment-guide.md)
- **🚀 Seuraava luku**: [Luku 5: Moni-agenttiratkaisut](../chapter-05-multi-agent/README.md)

> Vahvistettu `azd 1.27.1` -versiolla heinäkuussa 2026.

## Johdanto

Olet tähän mennessä *käyttänyt* malleja komennolla `azd init --template <nimi>`. Mutta kun sinulla on projektirakenne, josta tiimisi pitää—esimerkiksi Container App Cosmos DB:llä ja sopivalla valvonnalla—haluat muuttaa sen omaksi uudelleenkäytettäväksi malliksi. Malli on vain Git-repositorio, jolla on ennustettava rakenne, jonka azd osaa lukea. Tässä oppitunnissa näytetään, miten sellainen rakennetaan alusta lähtien, testataan ja (valinnaisesti) julkaistaan yhteisön galleriaan.

## Oppimistavoitteet

Tämä oppitunti auttaa sinua:
- Ymmärtämään, mikä tekee kansiosta "azd-mallin"
- Tietämään vaaditut tiedostot ja kansiorakenteen
- Lisäämään `azure.yaml` ja `infra/` uudelleenkäytettäväksi muille
- Testaamaan malli paikallisesti ennen jakamista
- Julkaisemaan sen ja (valinnaisesti) lähettämään Awesome AZD -kokoelmaan

## Oppimistulokset

Oppitunnin jälkeen osaat:
- Luoda uuden mallirepositorion
- Parametrisoida infrastruktuurin toimimaan missä tahansa tilauksessa
- Vahvistaa mallin `azd init` ja `azd up` -komennoilla
- Lisätä metatiedot, joita yhteisön galleria vaatii

---

## Mitä malli oikeastaan on?

azd-malli on **Git-repositorio**, joka sisältää vähintään:

| Tiedosto / kansio | Tarkoitus | Pakollinen? |
|---------------|---------|-----------|
| `azure.yaml` | Kuvaa palvelut, isännät ja infrastruktuuripalveluntarjoajan | ✅ Kyllä |
| `infra/` | Bicep, Terraform tai Pulumi, joka määrittää resurssit | ✅ Kyllä |
| `src/` (tai koodisi) | Sovelluskoodi, jonka azd ottaa käyttöön | ✅ Kyllä |
| `README.md` | Mallin käyttöohje | ✅ Suositellaan vahvasti |
| `.azdo/` tai `.github/` | CI/CD-putkistojen määrittelyt | Valinnainen |
| `.devcontainer/` | Toistettava kehitysympäristö | Valinnainen |
| `azure.yaml` `metadata` | Galleria- ja telemetriatiedot | Valinnainen (pakollinen julkaisemiseen) |

Tässä ei ole mitään taikaa: kun suoritat `azd init --template you/your-repo`, azd kloonaa repositorion ja lukee `azure.yaml`-tiedoston.

---

## Vaihe 1: Luo repositoriorakenne

Luo kansiorakenne käsin tai aloita minimimallista ja muokkaa sitä:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Luo vakioasettelu
mkdir -p src infra
```

Tyypillinen valmiin mallin rakenne näyttää tältä:

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

Tämä on mallin sydän. Se kertoo azd:lle, mitä ottaa käyttöön ja miten:

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

> `metadata.template` -kenttää gallerian telemetria käyttää käyttökertojen laskemiseen. Käytä muotoa `nimi@versio`.

---

## Vaihe 3: Parametrisoi infrastruktuuri

Yksi tärkeimmistä säännöistä *uudelleenkäytettävälle* mallille: **älä koskaan kovakoodaa nimiä, alueita tai tilaukseen kohdistuvia arvoja.** Käytä parametreja ja resurssien tunnusmallia, jotta sama malli toimii kenen tahansa tilauksessa.

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

Kaksi asiaa tekevät tästä mallista mallille sopivan:

1. **`azd-env-name`-tunniste** — azd käyttää sitä seuraamaan ja puhdistamaan resursseja ympäristöittäin.
2. **`uniqueString(...)` resurssitunnus** — tuottaa vakaasti globaalisti ainutlaatuisen takaliitteen, jotta nimet eivät törmää.

Lisää vastaava parametritiedosto, joka lukee arvot, jotka azd täyttää ympäristöstä:

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

azd korvaa automaattisesti `${AZURE_ENV_NAME}` ja `${AZURE_LOCATION}` nykyisestä ympäristöstä.

---

## Vaihe 4: Testaa mallisi paikallisesti

Ennen jakamista osoita, että malli toimii puhtaasta tilasta.

**Testaa paikallisesta kansiosta** (ei tarvitse pushata Git:iin):

```bash
# Tyhjästä hakemistosta alustetaan paikallisen mallipolun avulla
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Käyttöönotto + käyttöönotto kokonaisuudessaan
azd auth login
azd up
```

**Sitten testaa purku**—hyvä malli siivoaa kaiken kokonaan:

```bash
azd down --force --purge
```

Jos `azd down` jättää resursseja jäljelle, olet todennäköisesti unohtanut `azd-env-name`-tunnisteen jostakin resurssista.

> **Vinkki:** suorita ensin `azd provision --preview`. Se tekee mitä-jos -simuloinnin ja näyttää mallin virheet ennen resurssien luontia.

---

## Vaihe 5: Julkaise malli

Puske repositorio GitHubiin (julkinen, jos haluat muiden käyttävän sitä):

```bash
gh repo create my-azd-template --public --source=. --push
```

Nyt kuka tahansa voi käyttää sitä:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Vaihe 6 (valinnainen): Lähetä Awesome AZD:lle

[Awesome AZD -galleria](https://azure.github.io/awesome-azd/) listaa yhteisön malleja. Jotta malli voi tulla listatuksi, repossasi tulisi olla mukana:

- ✅ Selkeä `README.md`, jossa on vaatimukset, arkkitehtuurikaavio ja kustannustiedot
- ✅ Toimiva `azure.yaml`, jossa on `metadata.template`
- ✅ Infrastruktuuri, joka ottaa käyttöön puhtaasti uudessa tilauksessa
- ✅ `LICENSE`-tiedosto
- ✅ (Suositeltu) `.devcontainer/` yhdellä klikkauksella Codespacesiin

Lähetä mallisi avaamalla pull request, joka lisää mallisi gallerian datatiedostoon noudattaen ohjeita [Awesome AZD -repositoriossa](https://github.com/Azure/awesome-azd).

---

## Yleisiä sudenkuoppia

| Sudenkuoppa | Korjaus |
|---------|-----|
| Kovakoodatut resurssinimet | Käytä `uniqueString()` resurssitunnusta |
| `azd down` jättää resursseja | Merkitse jokainen resurssi (tai resurssiryhmä) `azd-env-name` -tunnisteella |
| Malleja toimii sinulla, ei muilla | Poista tilaus- ja vuokralais-ID:t sekä alue-olettamukset |
| Tulosteet eivät ole kytketty sovellukseen | Vie `SERVICE_<NIMI>_ENDPOINT_URL` ja muut `AZURE_*` tulosteet |
| Gallerian hyväksyntä evätty | Lisää `README.md`, `LICENSE` ja `metadata.template` |

---

## Yhteenveto

- Malli on vain Git-repositorio, jossa on `azure.yaml`, `infra/` ja koodisi.
- Parametrisoi kaikki—nimet, alueet ja tunnukset—jotta malli toimii missä vain.
- Merkitse aina resurssit `azd-env-name`-tunnisteella, jotta `azd down` toimii.
- Testaa paikallisesti komennolla `azd init --template <local-path>` ennen julkaisua.
- Lisää metatiedot ja README lähettämistä varten Awesome AZD:lle.

---

## 🔗 Navigointi

| Suunta | Resurssi |
|-----------|----------|
| **Edellinen** | [Käyttöönotto-opas](deployment-guide.md) |
| **Luvun etusivu** | [Luku 4: Infrastruktuuri koodina](README.md) |
| **Seuraava luku** | [Luku 5: Moni-agenttiratkaisut](../chapter-05-multi-agent/README.md) |

## 📖 Aiheeseen liittyvät resurssit

- [Resurssien käyttöönotto](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Virallinen azd-mallin dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->