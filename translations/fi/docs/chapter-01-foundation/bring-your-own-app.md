# Tuo oma sovelluksesi - Lisää azd olemassa olevaan projektiin

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 1 - Perusta & nopeat käynnistysohjeet
- **⬅️ Edellinen**: [Ensimmäinen projektisi](first-project.md)
- **➡️ Seuraava**: [Dev Containers & Codespaces](dev-containers.md)

> Komento- ja kokoonpanokatsauksen kohde: `azd 1.37.2` (marraskuu 2026). Luodut tiedostot riippuvat havaittavasta sovelluksesta; Azure-asennusta ei suoritettu tässä katsauksessa.

## Johdanto

Kohteessa [Ensimmäinen projektisi](first-project.md) otit käyttöön sovelluksen aloittamalla mallista. Mutta useimmiten sinulla on jo *valmis* sovellus — Node.js API, Python Flask -palvelu, .NET-verkkosovellus — joka sijaitsee kansiossa koneellasi. Tämä opetusosio näyttää, miten lisäät azd:n olemassa olevaan koodiin, jotta voit ottaa sen käyttöön komennolla `azd up` ilman mallia.

## Oppimistavoitteet

Tämän opetusosion jälkeen sinä:
- Ymmärrät kolme tapaa aloittaa azd-projekti
- Suoritat `azd init` olemassa olevan koodikannan sisällä
- Ymmärrät, mitä `azure.yaml` ja `infra/` -kansio tekevät sovelluksellesi
- Tiedät, milloin anna azd:n generoida infrastruktuuri ja milloin kirjoita itse
- Otat olemassa olevan sovelluksesi käyttöön Azureen komennolla `azd up`

## Oppimistulokset

Opetusosion suoritettuasi osaat:
- Aloittaa azd-projektin olemassa olevaan projektiin
- Lukea ja muokata perus `azure.yaml` -tiedostoa
- Generoida alkuinfrastruktuurin komennolla `azd infra generate`
- Valita sovelluksellesi sopivan Azure-isännän
- Ottaa sovellus käyttöön ja siivota se itse

---

## Kolme tapaa aloittaa azd-projekti

| Aloituskohta | Komento | Milloin käyttää |
|--------------|---------|-----------------|
| **Mallista** | `azd init --template <name> .` (tyhjä hakemisto) | Oppimiseen tai uuden sovelluksen aloittamiseen todistetusta mallista |
| **Olemassa olevasta koodista** | `azd init` (projektikansiossasi) | Sinulla on jo sovellus ja haluat ottaa sen käyttöön |
| **Git-repostosta** | `azd init --from-code` (kloonatussa repossa) | Azd:n käyttöönotto olemassa olevaan versionhallintavarastoon |

Harjoittelit jo ensimmäistä vaihtoehtoa. Tämä opetusosio kattaa toisen—yleisimmän käytännön tilanteen.

---

## Vaihe 1: Suorita `azd init` projektissasi

Avaa terminaali **olemassa olevan projektikansiosi sisällä** ja suorita:

```bash
cd my-existing-app
azd init
```

azd kysyy, miten haluat alustaa projektin. Valitse:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Valitse **"Käytä nykyisen kansion koodia."** azd skannaa kansion, tunnistaa kielesi ja kehyksesi sekä ehdottaa isäntää.

### Mitä azd havaitsee

azd etsii sovelluksen merkkejä kuten `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` tai `Dockerfile`. Koodista lähtien -virtaus ei ole yleinen isännän valinta -velho kaikille tuetuille käyttöönottoalustoille:

| Sovelluksesi | Todennäköisesti havaittu isäntä |
|-------------|-----------------------------|
| Tuettu Node.js / Python / .NET-verkkosovellus | Tyypillisesti Azure Container Apps; tarkista generoitu määritelmä |
| Säilötty sovellus (`Dockerfile`) | Azure Container Apps |
| Function app tai Static Web Apps -projekti | Käytä vastaavaa mallia tai kirjoita `azure.yaml` ja infrastruktuuri, jos koodista lähtien ei tue asettelua |

Vahvista havaitut palvelut, ja azd luo tarvitsemasi tiedostot.

---

## Vaihe 2: Ymmärrä, mitä azd loi

Alustamisen jälkeen tarkastele `azure.yaml`. Generoitu infrastruktuurivaihe voi pitää infrastruktuurin implisiittisenä kunnes suoritat `azd infra generate`; älä oleta, että `infra/` on jo olemassa:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — projektin määritelmä

Tämä on azd-projektin ydin. Seuraava **kuvitteellinen App Service -määritelmä** vaatii vastaavan App Service -infrastruktuurin; se ei ole syy muuttaa generoitu Container Apps -isäntää ilman infrastruktuurin muutosta:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` -lohko on keskeinen osa: jokainen merkintä yhdistää kansion koodistasi Azure-isäntään. Jos sovelluksessasi on sekä käyttöliittymä että API, sinulla on kaksi palvelua.

### `infra/` — Azure-resurssisi koodina

Kansion `infra/` sisältää Bicep-tiedostot, jotka määrittelevät sovelluksellesi tarvittavat Azure-resurssit (App Service, tietokanta jne.). Sinun ei tarvitse kirjoittaa näitä käsin—azd luo toimivan lähtökohdan. Voit *muokata* niitä myöhemmin lisätäksesi resursseja tai tiivistääksesi tietoturvaa (käsitellään luvussa [Luku 4](../chapter-04-infrastructure/README.md)).

> **Vinkki:** Haluatko nähdä tai mukauttaa luotua infrastruktuuria ennen käyttöönottoa? Suorita `azd infra generate` (saatavilla myös nimellä `azd infra synth`) kirjoittaaksesi IaC:n levyjärjestelmään, jotta voit tarkistaa ja hallita versiota.

---

## Vaihe 3: Määritä vaaditut asetukset

Jos sovelluksesi tarvitsee asetuksia tai salaisuuksia (yhteysmerkkijono, API-avain), älä kovakoodaa niitä. Käytä ympäristöarvoja:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Tämä tallentaa arvon vain paikallisesti. Jotta se vaikuttaisi sovellukseen, käytä arvoa eksplisiittisesti infrastruktuurin parametreissa, tuetussa palvelun asetuksessa tai hookissa; mielivaltaisen muuttujan asettaminen ei konfiguroi käyttöön otettua ajonaikaista ympäristöä.

Todellisia salaisuuksia varten tallenna ne Key Vaultiin ja viittaa niihin infrastruktuuristasi—katso [Luku 3: Määritys ja todentaminen](../chapter-03-configuration/authsecurity.md).

---

## Vaihe 4: Ota käyttöön

Käytä nyt samaa työnkulkua, jonka tunnet:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Kun se on valmis, azd näyttää sovelluksesi URL-osoitteen. Tarkista se kuten minkä tahansa azd-sovelluksen kohdalla:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Yleisiä ensikertalaisen ongelmia

| Oire | Todennäköinen syy | Korjaus |
|---------|--------------|-----|
| azd ei tunnistanut sovellustani | Puuttuva manifesti (esim. `package.json`) | Lisää manifesti tai valitse isäntä manuaalisesti käynnistyksen aikana `azd init` |
| Kokoaminen epäonnistuu aikana `azd up` | Sovellus tarvitsee käännösvaiheen | Määritä sovelluksen pakettiskriptit tai palvelun `prepackage` koukku; käytä `dist` käyttöönottolähtötiedoille, ei `buildCommand`/`outputPath` |
| Sovellus käynnistyy mutta palauttaa virheitä | Puuttuva konfiguraatio/salaisuus | Kytke arvot suoritusaikaisen sovellusasetuksiin tai Key Vault -viitteeseen; pelkkä `azd env set` ei riitä |
| Väärä isäntä valittu | Automaattinen tunnistus ei vastaa tarpeitasi | Vaihda sekä `host:` että vastaava infrastruktuuri, tai valitse vastaava malli |

Lisätietoja on luvussa [Luku 7: Vianmääritys](../chapter-07-troubleshooting/README.md).

---

## Siivous

```bash
azd down --force --purge
```

---

## Yhteenveto

- `azd init` → **"Käytä koodia nykyisessä hakemistossa"** lisää azd:n sovellukseen, joka sinulla jo on.
- `azure.yaml` liittää koodikansiosi Azure-isäntäpalvelimiin; `infra/` määrittelee resurssit Bicepillä.
- `azd infra generate` antaa sinun tarkastella tai muokata luotua infrastruktuuria.
- Kun alustaminen on tehty, olemassa oleva sovelluksesi käyttää täsmälleen samaa `azd up` / `azd down` työnkulkua kuin mallipohjainen sovellus.

---

## 🔗 Navigointi

| Suunta | Oppitunti |
|-----------|--------|
| **Edellinen** | [Ensimmäinen projektisi](first-project.md) |
| **Seuraava** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Aiheeseen liittyvät resurssit

- [AZD Perusteet](azd-basics.md)
- [Luku 4: Infrastruktuuri koodina](../chapter-04-infrastructure/README.md)
- [Konfigurointi & Todennus](../chapter-03-configuration/authsecurity.md)
- [Komentojen pikasanakirja](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->