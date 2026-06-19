# Tuo oma sovellus - Lisää azd olemassa olevaan projektiin

**Chapter Navigation:**
- **📚 Course Home**: [AZD Aloittelijoille](../../README.md)
- **📖 Current Chapter**: Luku 1 - Perusta ja pika-aloitus
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Vahvistettu `azd 1.25.6`:llä kesäkuussa 2026.

## Johdanto

[Your First Project](first-project.md) -oppaassa otit sovelluksen käyttöön aloittamalla mallista. Mutta useimmiten sinulla jo on sovellus — Node.js API, Python Flask -palvelu, .NET-verkkosovellus — joka sijaitsee kansiossa koneellasi. Tämä opas näyttää, miten lisäät azd:n olemassa olevaan koodiin, jotta voit ottaa sen käyttöön `azd up` -komennolla, ilman mallia.

## Oppimistavoitteet

Tämän oppitunnin jälkeen osaat:
- Ymmärtää kolme tapaa aloittaa azd-projekti
- Suorittaa `azd init` olemassa olevan koodikannan sisällä
- Ymmärtää, mitä `azure.yaml` ja `infra/`-kansio tekevät sovelluksellesi
- Tietää, milloin antaa azd:n luoda infrastruktuurin ja milloin kirjoittaa oman
- Ottaa olemassa olevan sovelluksesi käyttöön Azureen `azd up` -komennolla

## Oppimistulokset

Oppitunnin suorittamisen jälkeen pystyt:
- Alustamaan azd:n projektissa, joka sinulla jo on
- Lukemaan ja muokkaamaan perus-`azure.yaml`-tiedostoa
- Generoimaan lähtöinfrastruktuurin komennolla `azd infra generate`
- Valitsemaan sopivan Azure-hostin sovelluksellesi
- Ottaamaan oman sovelluksesi käyttöön ja siivoamaan sen jäljet

---

## Kolme tapaa aloittaa azd-projekti

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Oppimiseen tai uuden sovelluksen aloittamiseen valmiista mallista |
| **From your existing code** | `azd init` (in your project folder) | Sinulla on jo sovellus ja haluat ottaa sen käyttöön |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Ota azd käyttöön olemassa olevassa repositoriossa |

Harjoittelit jo ensimmäistä vaihtoehtoa. Tämä oppitunti kattaa toisen—yleisimmän todellisen tilanteen.

---

## Vaihe 1: Suorita `azd init` projektissasi

Avaa terminaali **olemassa olevan projektikansiosi sisällä** ja suorita:

```bash
cd my-existing-app
azd init
```

azd kysyy, miten haluat alustaa. Valitse:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Valitse **"Käytä koodia nykyisestä hakemistosta."** azd skannaa sitten kansiosi, tunnistaa kielen ja kehyksen sekä ehdottaa isäntää.

### Mitä azd tunnistaa

azd etsii merkkejä kuten `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` tai `Dockerfile` ja ehdottaa vastaavaa Azure-isäntää:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service tai Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Vahvista havaitut palvelut, ja azd luo tarvitsemasi tiedostot.

---

## Vaihe 2: Ymmärrä, mitä azd loi

Initin jälkeen projektissasi on kaksi uutta asiaa:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — projektin määritelmä

Tämä on azd-projektin ydin. Minimaalinen versio näyttää tältä:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services`-lohko on avainosa: jokainen merkintä yhdistää koodikansion Azure-isäntään. Jos sovelluksellasi on sekä frontend että API, sinulla on kaksi palvelua.

### `infra/` — Azure-resurssisi koodina

`infra/`-kansio sisältää Bicep-tiedostoja, jotka määrittelevät Azure-resurssit, joita sovelluksesi tarvitsee (App Service, tietokanta jne.). Sinun ei tarvitse kirjoittaa näitä käsin—azd generoi toimivan lähtökohdan. Voit muokata niitä myöhemmin lisätäksesi resursseja tai tiukentaaksesi suojausta (käsitellään [Luvussa 4](../chapter-04-infrastructure/README.md)).

> **Vinkki:** Haluatko tarkastella tai muokata generoituja infrastruktuuritiedostoja ennen käyttöönottoa? Suorita `azd infra generate` (saatavilla myös nimellä `azd infra synth`), jolloin IaC kirjoitetaan levylle, jotta voit tarkistaa ja versiohallita sen.

---

## Vaihe 3: Aseta vaaditut asetukset

Jos sovelluksesi tarvitsee asetuksia tai salaisuuksia (yhteysmerkkijono, API-avain), älä kovakoodaa niitä. Käytä ympäristöarvoja:

```bash
# Luo ympäristö
azd env new dev

# Aseta ei-salainen arvo
azd env set API_VERSION 1.0.0
```

Todellisille salaisuuksille tallenna ne Key Vaultiin ja viittaa niihin infrastruktuuristasi — katso [Luku 3: Konfigurointi & todennus](../chapter-03-configuration/authsecurity.md).

---

## Vaihe 4: Ota käyttöön

Käytä nyt samaa työnkulkua, jonka jo tunnet:

```bash
# Tunnistaudu (vaaditaan azd:lle)
azd auth login

# Esikatsele luotavat resurssit
azd provision --preview

# Määritä infrastruktuuri ja ota koodisi käyttöön
azd up
```

Kun se valmistuu, azd tulostaa sovelluksesi URL-osoitteen. Vahvista se samalla tavalla kuin mitä tahansa azd-sovellusta:

```bash
azd show           # näytä päätepisteet
azd monitor --logs # tarkista lokit tarvittaessa
```

---

## Yleisimmät ensikertalaisten ongelmat

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd ei tunnistanut sovellustani | Puuttuva manifesti (esim. `package.json`) | Lisää manifesti tai valitse isäntä manuaalisesti `azd init` -vaiheessa |
| Build epäonnistuu `azd up`-komennon aikana | Sovellus tarvitsee build-vaiheen | Lisää `buildCommand`/`outputPath` palvelun alle `azure.yaml`-tiedostoon |
| Sovellus käynnistyy mutta palauttaa virheitä | Puuttuva konfiguraatio/salaistus | Aseta arvot `azd env set` -komennolla tai yhdistä Key Vaultiin |
| Väärä isäntä valittu | Automaattinen tunnistus arvasi väärin | Muokkaa `host:`-kenttää `azure.yaml`-tiedostossa ja suorita `azd up` uudelleen |

Lisätietoja on [Luvussa 7: Vianmääritys](../chapter-07-troubleshooting/README.md).

---

## Siivoaminen

```bash
azd down --force --purge
```

---

## Yhteenveto

- `azd init` → **"Käytä koodia nykyisestä hakemistosta"** lisää azd:n sovellukseen, joka sinulla jo on.
- `azure.yaml` yhdistää koodikansiot Azure-isäntöihin; `infra/` määrittelee resurssit Bicep-muodossa.
- `azd infra generate` antaa sinun tarkistaa tai mukauttaa generoitu infrastruktuuri.
- Kun projekti on alustettu, olemassa oleva sovelluksesi käyttää täsmälleen samaa `azd up` / `azd down` -työnkulkua kuin malli-pohjainen sovellus.

---

## 🔗 Navigointi

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Your First Project](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Liittyvät resurssit

- [AZD Basics](azd-basics.md)
- [Luku 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Konfigurointi & todennus](../chapter-03-configuration/authsecurity.md)
- [Komentojen pikaopas](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->