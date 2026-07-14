# AZD Aloittelijoille: Jäsennelty oppimismatka

![AZD-for-beginners](../../translated_images/fi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaattiset käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Haluatko mieluummin kloonata paikallisesti?**
>
> Tämä repositorio sisältää yli 50 käännöstä, mikä kasvattaa latauskoon merkittävästi. Kloonaa ilman käännöksiä käyttämällä harvaa checkoutia:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Tämä antaa sinulle kaiken kurssin suorittamiseen tarvitun huomattavasti nopeammalla latauksella.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mitä uutta azd:ssä tänään

> 📌 Tämä kurssi on validoitu versiolla **`azd 1.27.1`** (heinäkuu 2026). Suorita `azd version` tarkistaaksesi version, ja `azd upgrade` saadaksesi uusimman.

Azure Developer CLI on laajentunut perinteisistä web-sovelluksista ja API:sta. Nykyään azd on ainoa työkalu minkä tahansa sovelluksen Azureen käyttöönottoon — mukaan lukien tekoälypohjaiset sovellukset ja älykkäät agentit.

Tässä mitä se tarkoittaa sinulle:

- **Tekoälyagentit ovat nyt tasavertaisia azd-kuormituksia.** Voit alustaa, ottaa käyttöön ja hallita tekoälyagenttiprojekteja käyttäen samaa `azd init` → `azd up` -työnkulkuasi kuin ennenkin.
- **Täysi agentin elinkaaren hallinta komentoriviltä.** `azure.ai.agents` -laajennus kattaa nyt koko matkan—`azd ai agent init` pohjustaa projektin, `azd ai agent invoke` testaa (vastausajan tulostuksella), `azd ai agent eval generate` ja `azd ai agent optimize` mittaavat ja parantavat laatua, ja `azd ai agent delete` puhdistaa.
- **Lisää tekoälyrakenteita.** Uudet esikatselulaajennukset — `azure.ai.skills` ja `azure.ai.connections` — mahdollistavat uudelleenkäytettävien agenttitaitojen ja Foundryn yhteyksien hallinnan suoraan azd:llä.
- **Microsoft Foundry -integraatio** tuo mallien käyttöönoton, agenttien isännöinnin ja tekoälypalveluiden konfiguroinnin suoraan azd-mallipohjajärjestelmään.
- **Sujuvammat päivittäiset perustoiminnot.** Viimeisimmät julkaisut tekivät `azd init` idempotentiksi (turvallinen ajaa uudelleen), selkeyttivät `azd auth login` -komentoa poistamaan vanhentuneet tokenit automaattisesti ja lisäsivät ystävällisen `azd tool` ensimmäisen käynnistyksen asennuskehotteen.
- **Ydin työnkulku ei ole muuttunut.** Riippumatta siitä, julkaisetko todo-sovelluksen, mikropalvelun tai monen agentin tekoälyratkaisun, komennot ovat samat.

> **Huomio Aspire-käyttäjille:** Microsoft viittaa tuotteeseen nyt yksinkertaisesti nimellä **Aspire** (entinen ".NET Aspire"). azd:n Aspire-tuki on ennallaan — ainoastaan nimi on päivitetty.

Jos olet käyttänyt azd:tä aiemmin, tekoälytuki on luonnollinen laajennus — ei erillinen työkalu tai edistynyt kurssi. Jos aloitat uutena, opit yhden työnkulun, joka toimii kaikessa.

---

## 🚀 Mikä on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on kehittäjäystävällinen komentorivityökalu, joka tekee sovellusten käyttöönotosta Azureen yksinkertaista. Perinteisen monien Azure-resurssien manuaalisen luomisen ja yhdistämisen sijaan voit ottaa käyttöön kokonaisia sovelluksia yhdellä komennolla.

### `azd up` -komennon taika

```bash
# Tämä yksittäinen komento tekee kaiken:
# ✅ Luo kaikki Azure-resurssit
# ✅ Määrittää verkot ja tietoturvan
# ✅ Kokoa sovelluskoodisi
# ✅ Ota käyttöön Azuren palvelussa
# ✅ Antaa sinulle toimivan URL-osoitteen
azd up
```

**Siinä se!** Ei Azure-portaalin klikkailua, ei monimutkaisia ARM-malleja opittavaksi ensin, eikä manuaalista konfigurointia – vain toimivat sovellukset Azurella.

---

## ❓ Azure Developer CLI vs Azure CLI: Mikä on ero?

Tämä on yleisin aloittelijoiden kysymys. Tässä yksinkertainen vastaus:

| Ominaisuus | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tarkoitus** | Hallita yksittäisiä Azure-resursseja | Ota käyttöön kokonaisia sovelluksia |
| **Ajattelutapa** | Infrastruktuuriin keskittyvä | Sovelluksiin keskittyvä |
| **Esimerkki** | `az webapp create --name myapp...` | `azd up` |
| **Oppimiskäyrä** | Täytyy tuntea Azure-palvelut | Riittää tuntea sovelluksesi |
| **Parhaiten sopii** | DevOps, infrastruktuuri | Kehittäjät, prototypointi |

### Yksinkertainen vertauskuva

- **Azure CLI** on kuin sinulla olisi kaikki työkalut talon rakentamiseen – vasarat, sahat, naulat. Voit rakentaa mitä tahansa, mutta sinun täytyy tuntea rakentaminen.
- **Azure Developer CLI** on kuin palkkaisit urakoitsijan – kuvailet, mitä haluat, ja he hoitavat rakentamisen.

### Milloin käyttää kumpaakin

| Tilanne | Käytä tätä |
|----------|----------|
| "Haluan ottaa web-sovellukseni käyttöön nopeasti" | `azd up` |
| "Tarvitsen vain tallennustilin" | `az storage account create` |
| "Rakennan täyden tekoälysovelluksen" | `azd init --template azure-search-openai-demo` |
| "Tarvitsen virheenkorjausta tietylle Azure-resurssille" | `az resource show` |
| "Haluan tuotantovalmiin käyttöönoton minuuteissa" | `azd up --environment production` |

### Ne toimivat yhdessä!

AZD käyttää Azure CLI:tä taustalla. Voit käyttää molempia:
```bash
# Ota sovelluksesi käyttöön AZD:n avulla
azd up

# Säädä sitten tiettyjä resursseja Azure CLI:llä
az webapp config set --name myapp --always-on true
```

---

## 🌟 Löydä mallipohjat Awesome AZD:stä

Älä aloita tyhjästä! **Awesome AZD** on yhteisön kokoelma käyttövalmiita mallipohjia:

| Resurssi | Kuvaus |
|----------|-------------|
| 🔗 [**Awesome AZD -galleria**](https://azure.github.io/awesome-azd/) | Selaa yli 200 mallipohjaa yhdellä klikkauksella käyttöönotettavaksi |
| 🔗 [**Lähetä oma mallipohja**](https://github.com/Azure/awesome-azd/issues) | Osallistu omalla mallipohjallasi yhteisöön |
| 🔗 [**GitHub-repositorio**](https://github.com/Azure/awesome-azd) | Tähditä ja tutki lähdekoodia |

### Suosittuja tekoälymalleja Awesome AZD:stä

```bash
# RAG-chat Microsoft Foundryn mallien ja tekoälyhaun kanssa
azd init --template azure-search-openai-demo

# Nopea tekoälychat-sovellus
azd init --template openai-chat-app-quickstart

# Tekoälyagentit Foundryn agenttien kanssa
azd init --template get-started-with-ai-agents
```

---

## 🎯 Aloita kolmessa vaiheessa

Ennen aloittamista varmista, että koneesi on valmis haluamallesi mallipohjalle:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jos jokin tarvittava tarkistus epäonnistuu, korjaa se ensin ja jatka sitten pika-aloitukseen.

### Vaihe 1: Asenna AZD (2 minuuttia)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Vaihe 2: Todennus AZD:lle

```bash
# Valinnainen, jos aiot käyttää Azure CLI -komentoja suoraan tässä kurssissa
az login

# Pakollinen AZD-työnkuluille
azd auth login
```

Jos et ole varma siitä, mitä tarvitset, noudata koko asennusprosessia kohdassa [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Vaihe 3: Ota ensimmäinen sovellus käyttöön

```bash
# Alusta mallipohjasta
azd init --template todo-nodejs-mongo

# Ota käyttöön Azureen (luo kaiken!)
azd up
```

**🎉 Siinä se!** Sovelluksesi on nyt käytössä Azurella.

### Siivoa (älä unohda!)

```bash
# Poista kaikki resurssit kokeilun lopuksi
azd down --force --purge
```

---

## 📚 Kuinka käyttää tätä kurssia

Tämä kurssi on suunniteltu **etenevään oppimiseen** – aloita sieltä missä olet mukava ja etene vaiheittain:

| Kokemustasosi | Aloita täältä |
|-----------------|------------|
| **Täysin uusi Azuren parissa** | [Luku 1: Perusta](#-chapter-1-foundation--quick-start) |
| **Tunnet Azurea, uusi azd:lle** | [Luku 1: Perusta](#-chapter-1-foundation--quick-start) |
| **Haluat ottaa tekoälysovelluksia käyttöön** | [Luku 2: AI-ensi-kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Haluat käytännön harjoitusta** | [🎓 Interaktiivinen työpaja](workshop/README.md) - 3-4 tunnin ohjattu harjoitus |
| **Tarvitset tuotantokuvioita** | [Luku 8: Tuotanto & yritys](#-chapter-8-production--enterprise-patterns) |

### Pikainen asennus

1. **Forkkaa tämä repositorio**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa se**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Saat apua**: [Azure Discord -yhteisö](https://discord.com/invite/ByRwuEEgH4)

> **Haluatko mieluummin kloonata paikallisesti?**

> Tämä repositorio sisältää yli 50 käännöstä, mikä kasvattaa latauskoon merkittävästi. Kloonaa ilman käännöksiä käyttämällä harvaa checkoutia:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tämä antaa sinulle kaiken kurssin suorittamiseen tarvitun huomattavasti nopeammalla latauksella.


## Kurssin yleiskuvaus

Hallitse Azure Developer CLI (azd) jäsenneltyjen lukujen kautta, jotka on suunniteltu etenevään oppimiseen. **Erityinen painotus tekoälysovellusten käyttöönottoon Microsoft Foundry -integraation kanssa.**


### Miksi tämä kurssi on olennaisen tärkeä nykyaikaisille kehittäjille

Microsoft Foundry -Discord-yhteisön tietojen perusteella **45 % kehittäjistä haluaa käyttää AZD:tä tekoälykuormituksissa** mutta kohtaa haasteita liittyen:
- Monimutkaisiin monipalveluisiin tekoälyarkkitehtuureihin
- Parhaisiin käytäntöihin tuotantotekoälyn käyttöönotossa  
- Azure AI -palvelujen integrointiin ja konfigurointiin
- Kustannusten optimointiin tekoälykuormituksille
- Tekoälyyn liittyvien käyttöönotto-ongelmien vianmääritykseen

### Oppimistavoitteet

Tämän jäsennellyn kurssin suorittamalla:
- **Hallinnoit AZD:n perusteet**: Keskeiset käsitteet, asennus ja konfiguraatio
- **Ota tekoälysovellukset käyttöön**: Käytä AZD:tä Microsoft Foundry -palvelujen kanssa
- **Toteuta infrastruktuuri koodina**: Hallinnoi Azure-resursseja Bicep-mallipohjilla
- **Vianmääritys käyttöönotossa**: Ratkaise yleisiä ongelmia ja debuggaa vikoja
- **Optimoi tuotantokäyttöön**: Turvallisuus, skaalaus, seuranta ja kustannusten hallinta
- **Rakenna monitoimijaratkaisuja**: Ota käyttöön monimutkaisia tekoälyarkkitehtuureja

## Ennen aloittamista: Tilit, pääsy ja oletukset

Ennen kuin aloitat luvusta 1, varmista että sinulla on seuraavat asiat kunnossa. Tässä oppaassa myöhemmissä asennusvaiheissa oletetaan, että nämä perustukset on jo hoidettu.

- **Azure-tilaus**: Voit käyttää olemassa olevaa työpaikan tai oman tilisi tilausta tai luoda [ilmaisen kokeilutilauksen](https://aka.ms/azurefreetrial) aloittaaksesi.
- **Oikeus luoda Azure-resursseja**: Useimmissa harjoituksissa sinulla tulisi olla vähintään **Contributor**-käyttöoikeus kohdetilauksessa tai resurssiryhmässä. Joissakin luvuissa voi myös olettaa, että pystyt luomaan resurssiryhmiä, hallittuja identiteettejä ja RBAC-määrityksiä.
- [**GitHub-tili**](https://github.com): Hyödyllinen repositorion haarukoimiseen, oman muutosten seuraamiseen ja GitHub Codespacesin käyttöön työpajassa.
- **Mallipohjien ajo-ympäristön ennakkoedellytykset**: Joissakin malleissa tarvitaan paikallisia työkaluja kuten Node.js, Python, Java tai Docker. Suorita asennustarkistin ennen aloittamista, jotta huomaat mahdolliset puutteet ajoissa.
- **Perustason komentorivin tuntemus**: Et tarvitse olla asiantuntija, mutta sinun pitäisi olla mukava ajamaan komentoja kuten `git clone`, `azd auth login` ja `azd up`.

> **Työskenteletkö yritystilikäytössä?**
> Jos Azure-ympäristösi on ylläpitäjäsi hallinnoima, varmista etukäteen, että voit ottaa resursseja käyttöön tilausta tai resurssiryhmää kohti, jota aiot käyttää. Jos et voi, pyydä hiekkalaatikkotilaus tai Contributor-oikeudet ennen aloittamista.

> **Uusi Azureen?**
> Aloita omalla Azure-kokeilutilauksella tai maksa käytön mukaan -tilauksella osoitteessa https://aka.ms/azurefreetrial, niin pystyt suorittamaan harjoitukset alusta loppuun ilman vuokraaja-tason odotuksia.

## 🗺️ Kurssikartta: Nopea navigointi lukujen mukaan

Jokaisella luvulla on oma README-tiedosto, jossa on oppimistavoitteet, pika-aloitukset ja harjoitukset:

| Luku | Aihe | Oppitunnit | Kesto | Vaikeustaso |
|---------|-------|---------|----------|------------|
| **[Luku 1: Perusta](docs/chapter-01-foundation/README.md)** | Aloittaminen | [AZD Perusteet](docs/chapter-01-foundation/azd-basics.md) &#124; [Asennus](docs/chapter-01-foundation/installation.md) &#124; [Ensimmäinen projekti](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Luku 2: Tekoälykehitys](docs/chapter-02-ai-development/README.md)** | Tekoäly ensin -sovellukset | [Foundryn integrointi](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agentit](docs/chapter-02-ai-development/agents.md) &#124; [Mallin käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tuntia | ⭐⭐ |
| **[Luku 3: Konfiguraatio](docs/chapter-03-configuration/README.md)** | Tunnistus ja turvallisuus | [Konfiguraatio](docs/chapter-03-configuration/configuration.md) &#124; [Tunnistus & turvallisuus](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Luku 4: Infrastruktuuri](docs/chapter-04-infrastructure/README.md)** | IaC ja käyttöönotto | [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionointi](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tuntia | ⭐⭐⭐ |
| **[Luku 5: Monitoimija](docs/chapter-05-multi-agent/README.md)** | AI-agenttiratkaisut | [Vähittäiskauppaskenaario](examples/retail-scenario.md) &#124; [Koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tuntia | ⭐⭐⭐⭐ |
| **[Luku 6: Ennen käyttöönottoa](docs/chapter-06-pre-deployment/README.md)** | Suunnittelu & validointi | [Preflight-tarkistukset](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasiteettisuunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tunti | ⭐⭐ |
| **[Luku 7: Vianmääritys](docs/chapter-07-troubleshooting/README.md)** | Debuggaus & korjaus | [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debuggaus](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-ongelmat](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 tuntia | ⭐⭐ |
| **[Luku 8: Tuotanto](docs/chapter-08-production/README.md)** | Yritysmallit | [Tuotantokäytännöt](docs/chapter-08-production/production-ai-practices.md) | 2-3 tuntia | ⭐⭐⭐⭐ |
| **[🎓 Työpaja](workshop/README.md)** | Käytännön harjoituksia | [Johdanto](workshop/docs/instructions/0-Introduction.md) &#124; [Valinta](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validointi](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Purku](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Mukauttaminen](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Purkutoimet](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tuntia | ⭐⭐ |

**Kokonaiskurssin kesto:** ~10-14 tuntia | **Taitotaso kehittyy:** Aloittelija → Tuotantovalmiiksi

---

## 📚 Oppimislukusarjat

*Valitse oppimispolkusi kokemustason ja tavoitteiden mukaan*

### 🚀 Luku 1: Perusta & Pika-aloitus
**Esivaatimukset**: Azure-tilaus, perustason komentorivin tuntemus  
**Kesto**: 30-45 minuuttia  
**Vaikeustaso**: ⭐

#### Mitä opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Mikä on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [AZD Perusteet](docs/chapter-01-foundation/azd-basics.md) - Keskeiset käsitteet ja terminologia
- **⚙️ Asennus**: [Asennus & määritys](docs/chapter-01-foundation/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön harjoitus**: [Ensimmäinen projektisi](docs/chapter-01-foundation/first-project.md) - Askeltainen opastus
- **📋 Pikaviite**: [Komentojen tiivistelmä](resources/cheat-sheet.md)

#### Käytännön harjoitukset
```bash
# Nopea asennustarkistus
azd version

# Ota ensimmäinen sovelluksesi käyttöön
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun tulos**: Onnistuneesti ota käyttöön yksinkertainen web-sovellus Azureen käyttämällä AZD:tä

**✅ Menestyksen validointi:** 
```bash
# Kun olet suorittanut luvun 1, sinun tulisi osata:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projekti
azd up                  # Ottaa käyttöön Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Ajan sijoitus:** 30-45 minuuttia  
**📈 Taitotaso suorituksen jälkeen:** Pystyy ottamaan perusteellisia sovelluksia käyttöön itsenäisesti  
**📈 Taitotaso suorituksen jälkeen:** Pystyy ottamaan perusteellisia sovelluksia käyttöön itsenäisesti

---

### 🤖 Luku 2: Tekoälykeskeinen kehitys (Suositellaan AI-kehittäjille)
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 1-2 tuntia  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integraatio AZD:n kanssa
- Tekoälyllä varustettujen sovellusten käyttöönotto
- Tekoälypalvelujen konfiguroinnin ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Microsoft Foundryn integraatio](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agentit**: [AI-agenttien opas](docs/chapter-02-ai-development/agents.md) - Ota älykkäitä agentteja käyttöön AZD:n avulla
- **📖 Mallit**: [AI-mallin käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) - Ota AI-malleja käyttöön ja hallitse niitä
- **🛠️ Työpaja**: [AI-työpajaluokka](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee tekoälyratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen opas**: [Työpajan materiaalit](workshop/README.md) - Selainpohjainen oppiminen MkDocsin * DevContainer-ympäristössä
- **📋 Mallipohjat**: [Microsoft Foundryn mallipohjat](#työpajan-materiaalit)
- **📝 Esimerkit**: [AZD-käyttöönottoesimerkit](examples/README.md)

#### Käytännön harjoitukset
```bash
# Ota ensimmäinen tekoälysovelluksesi käyttöön
azd init --template azure-search-openai-demo
azd up

# Kokeile lisää tekoälymalleja
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun tulos**: Ota käyttöön ja konfiguroi tekoälyllä varustettu chat-sovellus, jolla on RAG-ominaisuudet

**✅ Menestyksen validointi:** 
```bash
# Luvun 2 jälkeen sinun tulisi pystyä:
azd init --template azure-search-openai-demo
azd up
# Testaamaan tekoälychat-käyttöliittymää
# Kysymään kysymyksiä ja saamaan tekoälyn tukemia vastauksia lähteineen
# Varmistamaan hakutoiminnon integroinnin toimivuus
azd monitor  # Tarkistamaan, että Application Insights näyttää telemetriatiedot
azd down --force --purge
```

**📊 Ajan sijoitus:** 1-2 tuntia  
**📈 Taitotaso suorituksen jälkeen:** Pystyy ottamaan käyttöön ja konfiguroimaan tuotantovalmiita tekoälysovelluksia  
**💰 Kustannusymmärrys:** Ymmärtää 80-150 $/kk kehityskustannukset, 300-3500 $/kk tuotantokustannukset

#### 💰 Kustannusnäkökulmat tekoälyn käyttöönotossa

**Kehitysympäristö (arvio 80-150 $/kk):**
- Microsoft Foundryn mallit (Pay-as-you-go): 0-50 $/kk (tokenien käytön mukaan)
- AI-haku (Basic-taso): 75 $/kk
- Container Apps (kulutuksen mukaan): 0-20 $/kk
- Tallennustila (Standard): 1-5 $/kk

**Tuotantoympäristö (arvio 300-3 500+ $/kk):**
- Microsoft Foundryn mallit (PTU vakaan suorituskyvyn takia): 3 000+ $/kk TAI Pay-as-you-go suurella volyymilla
- AI-haku (Standard-taso): 250 $/kk
- Container Apps (varattu): 50-100 $/kk
- Application Insights: 5-50 $/kk
- Tallennustila (Premium): 10-50 $/kk

**💡 Kustannusten optimointivinkkejä:**
- Käytä **Free Tier** Microsoft Foundryn malleja oppimiseen (Azure OpenAI sisältää 50 000 tokenia/kk)
- Käynnistä `azd down` vapauttaaksesi resursseja, kun et aktiivisesti kehitä
- Aloita kulutukseen perustuvalla laskutuksella, päivitä PTU:ksi vain tuotannossa
- Käytä `azd provision --preview` kustannusarvioiden tekemiseen ennen käyttöönottoa
- Ota käyttöön automaattinen skaalaus: maksa vain todellisesta käytöstä

**Kustannusten seuranta:**
```bash
# Tarkista arvioidut kuukausikustannukset
azd provision --preview

# Seuraa todellisia kustannuksia Azure-portaalissa
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Konfiguraatio & Tunnistus
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 45-60 minuuttia  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Ympäristön konfigurointi ja hallinta
- Tunnistus- ja turvallisuusparhaat käytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimateriaalit
- **📖 Konfiguraatio**: [Konfiguraatio-opas](docs/chapter-03-configuration/configuration.md) - Ympäristön perustaminen
- **🔐 Turvallisuus**: [Tunnistusskenaariot ja hallinnoitu identiteetti](docs/chapter-03-configuration/authsecurity.md) - Tunnistuskäytännöt
- **📝 Esimerkit**: [Tietokantasovellus](examples/database-app/README.md) - AZD-tietokantaesimerkit

#### Käytännön harjoitukset
- Määritä useita ympäristöjä (kehityksen, testauksen, tuotannon)
- Ota käyttöön hallittu identiteetti tunnistukseen
- Toteuta ympäristökohtaiset konfiguraatiot

**💡 Luvun tulos**: Hallitse useita ympäristöjä asianmukaisella tunnistuksella ja turvallisuudella

---

### 🏗️ Luku 4: Infrastruktuuri koodina & käyttöönotto
**Esivaatimukset**: Luput 1-3 suoritettu  
**Kesto**: 1-1.5 tuntia  
**Vaikeustaso**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönoton mallit
- Infrastruktuuri koodimuodossa Bicepillä
- Resurssien provisiointistrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) - Kattavat työnkulut
- **🏗️ Provisionointi**: [Provisionointiopas](docs/chapter-04-infrastructure/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App -esimerkki](../../examples/container-app) - Konttien käyttöönotot

#### Käytännön harjoitukset
- Luo mukautettuja Bicep-mallipohjia
- Ota käyttöön monipalvelusovelluksia
- Toteuta sinivihreän käyttöönoton strategioita

**💡 Luvun tulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia käyttäen mukautettuja infrastruktuurimalleja

---


### 🎯 Luku 5: Moniagenttiset tekoälyratkaisut (Edistynyt)
**Esivaatimukset**: Luvut 1-2 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaativuus**: ⭐⭐⭐⭐

#### Mitä opit
- Moniagenttiset arkkitehtuurimallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit tekoälyasennukset

#### Oppimateriaalit
- **🤖 Esittelyprojekti**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM-mallit**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Yhden klikkauksen käyttöönotto
- **📖 Arkkitehtuuri**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mallit

#### Käytännön harjoitukset
```bash
# Ota käyttöön täydellinen vähittäiskaupan moniedustajaratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutki agenttien kokoonpanoja
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Lukujen lopputulos**: Ota käyttöön ja hallinnoi tuotantovalmista moniagenttista tekoälyratkaisua asiakas- ja inventaarioagenttien kanssa

---

### 🔍 Luku 6: Ennen käyttöönottoa tapahtuva validointi ja suunnittelu
**Esivaatimukset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Kapasiteetin suunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Esikatselutarkastukset ja automatisointi

#### Oppimateriaalit
- **📊 Suunnittelu**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resurssien validointi
- **💰 Valinta**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Validointi**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatisoidut skriptit

#### Käytännön harjoitukset
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten mukaan
- Toteuta automatisoidut tarkastukset ennen käyttöönottoa

**💡 Lukujen lopputulos**: Vahvista ja optimoi käyttöönotot ennen toteutusta

---

### 🚨 Luku 7: Vianetsintä ja virheiden korjaus
**Esivaatimukset**: Mikä tahansa käyttöönotto-luku suoritettu  
**Kesto**: 1-1,5 tuntia  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Systemaattiset virheenkorjausmenetelmät
- Yleiset ongelmat ja ratkaisut
- Tekoälyyn liittyvä vianetsintä

#### Oppimateriaalit
- **🔧 Yleiset ongelmat**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ ja ratkaisut
- **🕵️ Virheenkorjaus**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Vaiheittaiset strategiat
- **🤖 Tekoälyongelmat**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-palveluiden ongelmat

#### Käytännön harjoitukset
- Diagnosoi käyttöönoton epäonnistumiset
- Ratkaise todennusongelmat
- Korjaa AI-palvelun yhteysongelmat

**💡 Lukujen lopputulos**: Diagnosoi ja korjaa yleisimmät käyttöönottoon liittyvät ongelmat itsenäisesti

---

### 🏢 Luku 8: Tuotanto- ja yritysmallit
**Esivaatimukset**: Luvut 1-4 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaativuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöön tähtäävät käyttöönotto-strategiat
- Yritysturvallisuusmallit
- Valvonta ja kustannusten optimointi

#### Oppimateriaalit
- **🏭 Tuotanto**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Yritysmallit
- **📝 Esimerkit**: [Microservices Example](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Valvonta**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Valvonta

#### Käytännön harjoitukset
- Toteuta yritysturvallisuusmallit
- Ota käyttöön kattava valvonta
- Ota tuotantokäyttöön hallitusti

**💡 Lukujen lopputulos**: Ota käyttöön yrityskäyttöön soveltuvat sovellukset täysillä tuotantoominaisuuksilla

---

## 🎓 Työpajayhteenveto: Käytännön oppimiskokemus

> **⚠️ TYÖPAJAN TILA: Kehitteillä**  
> Työpajan materiaalit ovat parhaillaan kehityksessä ja viimeistelyssä. Ydinmoduulit toimivat, mutta jotkut edistyneet osat ovat keskeneräisiä. Työstämme aktiivisesti kokonaisuuden valmiiksi. [Seuraa etenemistä →](workshop/README.md)

### Interaktiiviset työpajamateriaalit
**Kattava käytännön oppimiskokemus selaimessa toimivilla työkaluilla ja ohjatuilla harjoituksilla**

Työpajamateriaalimme tarjoavat rakenteellisen, interaktiivisen oppimiskokemuksen, joka täydentää yllä olevaa luku- ja sisältöjärjestystä. Työpaja on tarkoitettu sekä itsenäiseen opiskeluun että opettajan ohjaamiin sessioihin.

#### 🛠️ Työpajan ominaisuudet
- **Selaimessa toimiva käyttöliittymä**: Täydellinen MkDocs-pohjainen työpaja, jossa haku, kopiointi ja teemaominaisuudet
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristön käyttöönotto
- **Rakenteellinen oppimispolku**: 8 moduulin ohjatut harjoitukset (yhteensä 3-4 tuntia)
- **Jatkuva menetelmä**: Johdanto → Valinta → Validointi → Purku → Konfigurointi → Räätälöinti → Loppusiivous → Yhteenveto
- **Interaktiivinen DevContainer-ympäristö**: Esikonfiguroidut työkalut ja riippuvuudet

#### 📚 Työpajamoduulien rakenne
Työpaja noudattaa **8 moduulin jatkuvaa menetelmää**, joka vie sinut löytämisestä käyttöönoton hallintaan:

| Moduuli | Aihe | Mitä teet | Kesto |
|--------|-------|-----------|-------|
| **0. Johdanto** | Työpajan yleiskatsaus | Ymmärrä oppimistavoitteet, esivaatimukset ja työpajan rakenne | 15 min |
| **1. Valinta** | Mallipohjien löytäminen | Tutustu AZD-malleihin ja valitse oikea tekoälymalli tilanteeseesi | 20 min |
| **2. Validointi** | Ota käyttöön & varmista | Ota malli käyttöön `azd up` komennolla ja varmista infrastruktuurin toimivuus | 30 min |
| **3. Purku** | Ymmärrä rakenne | Käytä GitHub Copilotia tutkiaksesi mallin arkkitehtuuria, Bicep-tiedostoja ja koodin organisointia | 30 min |
| **4. Konfigurointi** | Syväluotaus azure.yaml:iin | Hallitse `azure.yaml`-konfiguraatiota, elinkaarikoukkuja ja ympäristömuuttujia | 30 min |
| **5. Räätälöinti** | Tee siitä oma | Ota käyttöön AI-haku, jäljitys, arviointi ja räätälöi mallisi tilanteeseen | 45 min |
| **6. Loppusiivous** | Poista käyttöönotto | Poista resurssit turvallisesti komennolla `azd down --purge` | 15 min |
| **7. Yhteenveto** | Jatkot | Tarkastele saavutuksia, keskeisiä käsitteitä ja jatka oppimispolkua | 15 min |

**Työpajan kulku:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Työpajan aloitus
```bash
# Vaihtoehto 1: GitHub Codespaces (Suositeltu)
# Klikkaa "Code" → "Create codespace on main" repositoriossa

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Seuraa asennusohjeita tiedostossa workshop/README.md
```

#### 🎯 Työpajan oppimistulokset
Työpajan suorittaneiden odotetaan:
- **Ottavan tuotantokäyttöön tekoälysovelluksia**: Käyttämällä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Hallitsevan moniagenttisia arkkitehtuureja**: Toteuttavan koordinoituja tekoälyagenttiratkaisuja
- **Toteuttavan turvallisuusparhaat käytännöt**: Konfiguroivan todennuksen ja pääsynhallinnan
- **Optimoivan skaalausta**: Suunnittelevan kustannustehokkaita ja suorituskykyisiä käyttöönottoja
- **Vian etsivän käyttöönottoja**: Ratkaisevan yleisiä ongelmia itsenäisesti

#### 📖 Työpajan materiaalit
- **🎥 Interaktiivinen opas**: [Workshop Materials](workshop/README.md) - Selaimessa toimiva oppimisympäristö
- **📋 Moduuli kerrallaan ohjeet**:
  - [0. Johdanto](workshop/docs/instructions/0-Introduction.md) - Työpajan yleiskatsaus ja tavoitteet
  - [1. Valinta](workshop/docs/instructions/1-Select-AI-Template.md) - Löydä ja valitse tekoälymalleja
  - [2. Validointi](workshop/docs/instructions/2-Validate-AI-Template.md) - Ota mallit käyttöön ja varmista toimivuus
  - [3. Purku](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tutki mallin arkkitehtuuria
  - [4. Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) - Hallitse azure.yaml-konfiguraatiota
  - [5. Räätälöinti](workshop/docs/instructions/5-Customize-AI-Template.md) - Räätälöi tilanteeseesi
  - [6. Loppusiivous](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Poista resurssit
  - [7. Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) - Tarkastele ja seuraavat askeleet
- **🛠️ AI-työpajan laboratorio**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tekoälyyn keskittyvät harjoitukset
- **💡 Pika-aloitus**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ympäristön määrittäminen

**Sopii täydellisesti**: Yrityskoulutuksiin, yliopistokursseille, itsenäiseen opiskeluun ja kehittäjäbootcampeihin.

---

## 📖 Syväluotaus: AZD:n ominaisuudet

Perustason ominaisuuksien lisäksi AZD tarjoaa tehokkaita tuotantokäyttöön suunnattuja toimintoja:

- **Mallipohjaiset käyttöönotot** - Käytä valmiita malleja yleisiin sovellusmalleihin
- **Infrastruktuuri koodina** - Hallitse Azure-resursseja Bicepillä tai Terraformilla  
- **Integroitu työnkulku** - Ota sovellukset käyttöön, ota käyttöön ja valvo saumattomasti
- **Kehittäjäystävällinen** - Optimoitu kehittäjätehokkuuteen ja käyttökokemukseen

### **AZD + Microsoft Foundry: Täydellinen tekoälyn käyttöönottoon**

**Miksi AZD tekoälyratkaisuihin?** AZD vastaa tekoälykehittäjien suurimpiin haasteisiin:

- **Tekoälyvalmiit mallit** - Esikonfiguroidut mallit Microsoft Foundry -malleille, Azure AI -palveluille ja ML-kuormille
- **Turvalliset tekoälyasennukset** - Sisäänrakennetut turvallisuusmallit AI-palveluille, API-avaimille ja mallin päätepisteille  
- **Tuotannon AI-mallit** - Parhaat käytännöt skaalautuviin, kustannustehokkaisiin tekoälysovelluksiin
- **Päätä päähän -tekoälytyönkulut** - Mallin kehityksestä tuotantoon valvonnan kanssa
- **Kustannusten optimointi** - Älykkäät resurssien allokointi- ja skaalausstrategiat AI-kuormille
- **Microsoft Foundry -integraatio** - Saumaton yhteys Microsoft Foundryn mallikatalogiin ja päätepisteisiin

---

## 🎯 Mallit ja esimerkkikirjasto

### Suosittu: Microsoft Foundry -mallit
**Aloita tästä, kun otat tekoälysovelluksia käyttöön!**

> **Huom:** Nämä mallit demonstroivat erilaisia tekoälymalleja. Osa on ulkoisia Azure-esimerkkejä, osa paikallisia toteutuksia.

| Malli | Luku | Vaativuus | Palvelut | Tyyppi |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ulkoinen |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Suosittu: Valmiit oppimistilanteet
**Tuotantovalmiit sovellusmallit oppimislukujen mukaan**

| Malli | Oppimisluku | Vaativuus | Keskeinen oppi |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perustason tekoälyasennusmallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchilla |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Dokumenttien tekoälyintegraatio |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja funktiokutsut |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritystason tekoälyn orkestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moniagenttinen arkkitehtuuri asiakas- ja varastoagenttien kanssa |

### Oppiminen esimerkkityypin mukaan

> **📌 Paikalliset vs. ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Käyttövalmiita heti  
> **Ulkopuoliset esimerkit** (Azure Samples) = Kopioitavissa linkatuista repovarastoista

#### Paikalliset esimerkit (käyttövalmiit)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Täydellinen tuotantovalmiin toteutus ARM-malleilla
  - Moniagenttinen arkkitehtuuri (Asiakas- + Inventaarioagentit)
  - Kattava valvonta ja arviointi
  - Yhden klikkauksen käyttöönotto ARM-mallilla

#### Paikalliset esimerkit - Konttisovellukset (luvut 2-5)
**Kattavat konttisovellusten käyttöönottiesimerkit tässä repossa:**

- [**Container App Esimerkkejä**](examples/container-app/README.md) - Täydellinen opas konttiteknologisiin käyttöönottoihin
  - [Yksinkertainen Flask API](../../examples/container-app/simple-flask-api) - Perus REST API skaalaus nollaan asti
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices) - Tuotantovalmiit monipalvelukäyttöönotot
  - Nopean aloituksen, tuotannon ja edistyneiden käyttöönottojen mallit
  - Monitorointi, tietoturva ja kustannusten optimoinnin ohjeet

#### Ulkoiset esimerkit - Yksinkertaiset sovellukset (luvut 1-2)
**Kloonaa nämä Azure Samples -varastot aloittaaksesi:**
- [Yksinkertainen Web-sovellus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Peruskäyttöönoton mallit
- [Staattinen Verkkosivusto - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön käyttöönotto
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API käyttöönotto

#### Ulkoiset esimerkit - Tietokantaintegraatio (luvut 3-4)  
- [Tietokantasovellus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantayhteysmallit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverittömät tietotyöprosessit

#### Ulkoiset esimerkit - Edistyneet mallit (luvut 4-8)
- [Java Mikropalvelut](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessointi  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit ML-mallit

### Ulkoiset mallikokoelmat
- [**Virallinen AZD-malligalleria**](https://azure.github.io/awesome-azd/) - Huolellisesti valikoidut viralliset ja yhteisön mallit
- [**Azure Developer CLI -mallit**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Esimerkkihakemisto**](examples/README.md) - Paikallisia harjoituskohtaisia esimerkkejä yksityiskohtaisilla selityksillä

---

## 📚 Oppimateriaalit & Viitteet

### Pikaviitteet
- [**Komentojen pikaseloste**](resources/cheat-sheet.md) - Tärkeimmät azd-komennot järjestettyinä lukujen mukaan
- [**Sanasto**](resources/glossary.md) - Azure- ja azd-termistö  
- [**UKK**](resources/faq.md) - Usein kysytyt kysymykset oppimisluvuille
- [**Opas harjoituksiin**](resources/study-guide.md) - Laajat harjoitustehtävät

### Käytännön työpajat
- [**AI-työpajojen laboratorio**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee AI-ratkaisusi AZD-käyttöön sopiviksi (2-3 tuntia)
- [**Interaktiivinen työpaja**](workshop/README.md) - 8-moduulinen ohjattu harjoittelu MkDocsilla ja GitHub Codespacesilla
  - Etenee: Johdanto → Valinta → Vahvistus → Hajautus → Konfigurointi → Mukauttaminen → Purku → Yhteenveto

### Ulkoiset oppimateriaalit
- [Azure Developer CLI Dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Hintalaskuri](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI-agenttien taidot editorillesi
- [**Microsoft Azure Skills at skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 avointa agenttitaitoa Azure AI:lle, Foundrylle, käyttöönotolle, diagnostiikalle, kustannusoptimoinnille ja muille. Asenna ne GitHub Copilotiin, Cursoriin, Claude Codeen tai mihin tahansa tuettuun agenttiin:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Nopea vianmääritysohje

**Yleisimpiä aloittelijoiden kohtaamia ongelmia ja välittömät ratkaisut:**

<details>
<summary><strong>❌ "azd: komentoa ei löydy"</strong></summary>

```bash
# Asenna ensin AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Vahvista asennus
azd version
```
</details>

<details>
<summary><strong>❌ "Ei tilausta löytynyt" tai "Tilaus ei ole asetettu"</strong></summary>

```bash
# Lista käytettävissä olevista tilauksista
az account list --output table

# Aseta oletustilaus
az account set --subscription "<subscription-id-or-name>"

# Aseta AZD-ympäristölle
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Vahvista
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" tai "Kiintiö ylittynyt"</strong></summary>

```bash
# Kokeile eri Azure-aluetta
azd env set AZURE_LOCATION "westus2"
azd up

# Tai käytä pienempiä SKUja kehityksessä
# Muokkaa infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" epäonnistuu puolessa välissä</strong></summary>

```bash
# Vaihtoehto 1: Puhdista ja yritä uudelleen
azd down --force --purge
azd up

# Vaihtoehto 2: Korjaa vain infrastruktuuri
azd provision

# Vaihtoehto 3: Tarkista tarkka tila
azd show

# Vaihtoehto 4: Tarkista lokit Azure Monitorissa
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentikointi epäonnistui" tai "Token on vanhentunut"</strong></summary>

```bash
# Todennettu uudelleen AZD:lle
azd auth logout
azd auth login

# Valinnainen: päivitä myös Azure CLI, jos käytät az-komentoja
az logout
az login

# Vahvista todennus
az account show
```
</details>

<details>
<summary><strong>❌ "Resurssi on jo olemassa" tai nimeämiskonfliktit</strong></summary>

```bash
# AZD luo ainutlaatuisia nimiä, mutta jos ristiriita ilmenee:
azd down --force --purge

# Yritä sitten uudelleen uudella ympäristöllä
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mallin käyttöönotto kestää liian kauan</strong></summary>

**Normaalit odotusajat:**
- Yksinkertainen web-sovellus: 5-10 minuuttia
- Sovellus tietokantoineen: 10-15 minuuttia
- AI-sovellukset: 15-25 minuuttia (OpenAI:n provisiointi on hidasta)

```bash
# Tarkista edistyminen
azd show

# Jos jumissa yli 30 minuuttia, tarkista Azure Portal:
azd monitor --overview
# Etsi epäonnistuneita käyttöönottoja
```
</details>

<details>
<summary><strong>❌ "Lupa evätty" tai "Kielletty"</strong></summary>

```bash
# Tarkista Azure-roolisi
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Tarvitset vähintään "Contributor"-roolin
# Pyydä Azure-järjestelmänvalvojaasi myöntämään:
# - Contributor (resursseille)
# - User Access Administrator (roolimäärityksiä varten)
```
</details>

<details>
<summary><strong>❌ Käyttöönotettua sovelluksen URL-osoitetta ei löydy</strong></summary>

```bash
# Näytä kaikki palvelun päätepisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujat
```
</details>

### 📚 Täydelliset vianmääritysvälineet

- **Yleiset ongelmat -opas:** [Yksityiskohtaiset ratkaisut](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spesifiset ongelmat:** [AI:n vianmääritys](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debuggausopas:** [Askeltainen debuggaus](docs/chapter-07-troubleshooting/debugging.md)
- **Hanki apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suoritus & sertifiointi

### Edistymisen seuranta
Seuraa oppimisesi edistystä jokaisessa luvussa:

- [ ] **Luku 1**: Perusteet & nopea aloitus ✅
- [ ] **Luku 2**: AI-ensimmäinen kehitys ✅  
- [ ] **Luku 3**: Konfiguraatio & autentikointi ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & käyttöönotto ✅
- [ ] **Luku 5**: Moni-agenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Esikatselu & suunnittelu ✅
- [ ] **Luku 7**: Vianmääritys & debuggaus ✅
- [ ] **Luku 8**: Tuotanto & yritysmallit ✅

### Oppimisen varmistus
Suoritettuasi kunkin luvun varmista tietosi:
1. **Käytännön harjoitus**: Suorita luvun käytännön käyttöönotto
2. **Tietotarkistus**: Tarkista lukusi FAQ-osa  
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavalle vaativuustasolle

### Kurssin suorittamisen edut
Kun kaikki luvut on suoritettu, sinulla on:
- **Tuotantokokemus**: Todelliset AI-sovellukset otettu käyttöön Azurella
- **Ammattitaidot**: Yritysvalmiit käyttöönoton taidot  
- **Yhteisön tunnustus**: Aktiivinen Azure-kehittäjäyhteisön jäsen
- **Uran edistäminen**: Kysytyt AZD- ja AI-käyttöönoton asiantuntijuudet

---

## 🤝 Yhteisö & Tuki

### Hanki apua & tukea
- **Tekniset ongelmat**: [Raportoi bugit ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimista koskevat kysymykset**: [Microsoft Azure Discord -yhteisö](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spesifinen apu**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemyksiä Microsoft Foundry Discordista

**Äskettäin tehdyn #Azure-kanavan äänestyksen tuloksia:**
- **45%** kehittäjistä haluaa käyttää AZD:tä AI-kuormituksiin
- **Suurimmat haasteet**: Monipalvelukäyttöönotot, tunnistetietojen hallinta, tuotantovalmius  
- **Eniten pyydettyjä**: AI-spesifiset mallit, vianmääritysohjeet, parhaat käytännöt

**Liity yhteisöömme:**
- Jaa AZD- ja AI-kokemuksiasi ja saa apua
- Pääse käsiksi uusien AI-mallien varhaisiin esiversioihin
- Osallistu AI-käyttöönoton parhaiden käytäntöjen kehitykseen
- Vaikuta AI- ja AZD-ominaisuuksien tulevaan kehitykseen

### Kurssin kehittämiseen osallistuminen
Otamme mielellämme vastaan panostuksia! Lue [Panostusopas](CONTRIBUTING.md) yksityiskohtia varten:
- **Sisältöparannukset**: Paranna olemassaolevia lukuja ja esimerkkejä
- **Uudet esimerkit**: Lisää aitoja käyttötapauksia ja malleja  
- **Käännös**: Auta monikielisen tuen ylläpidossa
- **Virheraportit**: Paranna tarkkuutta ja selkeyttä
- **Yhteisön säännöt**: Noudata yhteisön inklusiivisia ohjeita

---

## 📄 Kurssitiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - katso [LICENSE](../../LICENSE) tiedosto lisätietoja varten.

### Microsoftin muut oppimateriaalit

Tiimimme tuottaa myös muita kattavia oppimiskursseja:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j aloittelijoille](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js aloittelijoille](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain aloittelijoille](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agentit
[![AZD aloittelijoille](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI aloittelijoille](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP aloittelijoille](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agentit aloittelijoille](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivisen AI:n sarja
[![Generatiivinen AI aloittelijoille](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Ydinoppiminen
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-sarja
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurssinavigointi

**🚀 Valmiina aloittamaan oppimisen?**

**Aloittelijat**: Aloita [Luvuasta 1: Perusta & Nopea aloitus](#-chapter-1-foundation--quick-start)  
**AI-kehittäjät**: Siirry kohtaan [Luku 2: AI-Ensimmäinen kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kokeneet kehittäjät**: Aloita [Luvusta 3: Määritys & Todennus](#️-chapter-3-configuration--authentication)

**Seuraavat vaiheet**: [Aloita Luku 1 - AZD-perusteet](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->