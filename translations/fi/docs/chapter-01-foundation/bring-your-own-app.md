# Tuo oma sovellus - Lisää azd olemassa olevaan projektiin

**Luku Navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Tämänhetkinen luku**: Luku 1 - Perusta & Nopeasti alkuun
- **⬅️ Edellinen**: [Ensimmäinen projektisi](first-project.md)
- **➡️ Seuraava**: [Dev Containers & Codespaces](dev-containers.md)

> Tarkistettu `azd 1.27.1` version avulla heinäkuussa 2026.

## Johdanto

[Ensimmäisessä projektissasi](first-project.md) otit käyttöön sovelluksen aloittamalla mallipohjasta. Mutta useimmiten sinulla on jo olemassa *oma* sovellus—Node.js API, Python Flask -palvelu, .NET-verkkosovellus—kansiossa omalla koneellasi. Tässä oppitunnissa näytetään, miten lisäät azd:n olemassa olevaan koodiin, jotta voit ottaa sen käyttöön komennolla `azd up` ilman mallipohjaa.

## Oppimistavoitteet

Oppitunnin lopuksi osaat:
- Ymmärtää kolme tapaa aloittaa azd-projekti
- Suorittaa `azd init` olemassa olevan koodin sisällä
- Ymmärtää mitä `azure.yaml` ja `infra/` -kansio tekevät sovelluksellesi
- Tietää milloin antaa azd:n luoda infrastruktuuri ja milloin kirjoittaa itse
- Ottaessa olemassa oleva sovellus käyttöön Azureen komennolla `azd up`

## Oppimistulokset

Oppitunnin jälkeen osaat:
- Alustaa azd olemassa olevaan projektiin
- Lukea ja muokata perus `azure.yaml` -tiedostoa
- Luoda aloitusinfrastruktuurin komennolla `azd infra generate`
- Valita sopivan Azure-isännän sovelluksellesi
- Otta oman sovelluksesi käyttöön ja siivota ympäristön

---

## Kolme tapaa aloittaa azd-projekti

| Aloituskohta | Komento | Milloin käyttää |
|-------------|---------|-------------------|
| **Mallipohjasta** | `azd init --template <nimi>` | Oppimiseen tai uuden sovelluksen aloittamiseen todistetusta mallista |
| **Olemassa olevasta koodista** | `azd init` (projektikansiossa) | Sinulla on jo sovellus ja haluat ottaa sen käyttöön |
| **Git-reposta** | `azd init --from-code` (klonatussa repossa) | Azd:n käyttöönotto olemassa olevassa koodivarastossa |

Olet jo harjoitellut ensimmäistä vaihtoehtoa. Tässä oppitunnissa käsitellään toista vaihtoehtoa—useimmiten käytettyä todellista tilannetta.

---

## Vaihe 1: Suorita `azd init` projektissasi

Avaa terminaali **olemassa olevan projektikansion sisällä** ja aja:

```bash
cd my-existing-app
azd init
```

Azd kysyy, miten haluat alustaa. Valitse:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Valitse **"Use code in the current directory."** Azd skannaa kansiosi, tunnistaa kielesi ja kehysrakenteesi, ja ehdottaa isäntää.

### Mitä azd tunnistaa

Azd etsii merkkejä, kuten `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` tai `Dockerfile`, ja ehdottaa sopivaa Azure-isäntää:

| Sovelluksesi | Todennäköisesti tunnistettu isäntä |
|-------------|-----------------------------|
| Node.js / Python / .NET-verkkosovellus | Azure App Service tai Container Apps |
| Konttisoitu sovellus (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Staattinen sivusto (React/Vue rakennustulos) | Azure Static Web Apps |

Vahvista tunnistetut palvelut, ja azd luo tarvitsemasi tiedostot.

---

## Vaihe 2: Ymmärrä mitä azd loi

Initoinnin jälkeen projektissasi on kaksi uutta asiaa:

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

Tämä on azd-projektin sydän. Minimaalinen versio näyttää tältä:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services`-lohko on keskeinen: jokainen kohde yhdistää koodin kansion Azure-isäntään. Jos sovelluksessasi on frontend ja API, sinulla on kaksi palvelua.

### `infra/` — Azure-resurssisi koodina

`infra/`-kansiossa ovat Bicep-tiedostot, jotka määrittelevät Azure-resurssit, joita sovelluksesi tarvitsee (App Service, tietokanta, jne.). Näitä ei tarvitse kirjoittaa käsin—azd generoi toimivan lähtökohdan. Voit *muokata* näitä myöhemmin lisätäksesi resursseja tai kiristääksesi tietoturvaa (käsitellään [luvussa 4](../chapter-04-infrastructure/README.md)).

> **Vinkki:** Haluatko nähdä tai muokata generoitua infrastruktuuria ennen käyttöönottoa? Suorita `azd infra generate` (tai `azd infra synth`) kirjoittaaksesi infrastruktuurina koodin levytilaan, jotta voit tarkistaa sen ja hallita versionhallinnassa.

---

## Vaihe 3: Aseta vaaditut asetukset

Jos sovelluksesi tarvitsee asetuksia tai salaisuuksia (yhteysmerkkijono, API-avain), älä kovakoodaa niitä. Käytä ympäristöarvoja:

```bash
# Luo ympäristö
azd env new dev

# Aseta ei-salainen arvo
azd env set API_VERSION 1.0.0
```

Todellisille salaisuuksille tallenna ne Key Vaultiin ja viittaa niihin infrastruktuuristasi—katso [luku 3: Asetukset & Todennus](../chapter-03-configuration/authsecurity.md).

---

## Vaihe 4: Käyttöönotto

Käytä nyt samaa työskentelytapaa, jonka jo osaat:

```bash
# Todennus (vaaditaan azd:lle)
azd auth login

# Esikatsele luotavat resurssit
azd provision --preview

# Määritä infrastruktuuri ja ota koodisi käyttöön
azd up
```

Kun se on valmis, azd tulostaa sovelluksesi URL-osoitteen. Varmista toimivuus samalla tavalla kuin muiden azd-sovellusten kanssa:

```bash
azd show           # näytä päätepisteet
azd monitor --logs # tarkista lokit tarvittaessa
```

---

## Yleisimpiä aloittelevan ongelmia

| Oire | Todennäköinen syy | Korjaus |
|------|-----------------|---------|
| azd ei tunnistanut sovellustani | Puuttuva manifesti (esim. `package.json`) | Lisää manifesti tai valitse isäntä manuaalisesti `azd init`-komennolla |
| Käännös epäonnistuu `azd up` aikana | Sovellus tarvitsee rakennusvaiheen | Lisää `buildCommand`/`outputPath` `azure.yaml`-palvelun alle |
| Sovellus käynnistyy mutta palauttaa virheitä | Puuttuva asetukset/salaisuudet | Aseta arvot `azd env set` komennolla tai yhdistä Key Vault |
| Väärä isäntä valittu | Automaattinen tunnistus arvasi väärin | Muokkaa `host:`-arvoa `azure.yaml` tiedostossa ja suorita `azd up` uudelleen |

Lisätietoja on [luvussa 7: Ongelmien ratkaisu](../chapter-07-troubleshooting/README.md).

---

## Puhdista

```bash
azd down --force --purge
```

---

## Yhteenveto

- `azd init` → **"Use code in the current directory"** lisää azd:n sovellukseen, joka sinulla jo on.
- `azure.yaml` yhdistää koodikansiot Azure-isäntiin; `infra/` määrittelee resurssit Bicep-koodina.
- `azd infra generate` antaa sinun tarkistaa tai muokata luotua infrastruktuuria.
- Kun azd on alustettu, olemassa oleva sovelluksesi käyttää samaa `azd up` / `azd down` -työnkulkua kuin mallipohjainen sovellus.

---

## 🔗 Navigointi

| Suunta | Oppitunti |
|--------|----------|
| **Edellinen** | [Ensimmäinen projektisi](first-project.md) |
| **Seuraava** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Aiheeseen liittyvät materiaalit

- [AZD Perusteet](azd-basics.md)
- [Luku 4: Infrastruktuuri koodina](../chapter-04-infrastructure/README.md)
- [Asetukset & Todennus](../chapter-03-configuration/authsecurity.md)
- [Komentojen pikaohje](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->