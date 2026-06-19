# AZD aloittelijoille: Jäsennelty oppimispolku

![AZD-aloittelijoille](../../translated_images/fi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub-seuraajat](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub-forkit](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub-tähdet](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry -Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaattiset käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Haluatko kloonata paikallisesti?**
>
> Tämä repositorio sisältää yli 50 kielikäännöstä, mikä kasvattaa latauskokoa merkittävästi. Jos haluat kloonata ilman käännöksiä, käytä sparse checkoutia:
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
> Tämä antaa sinulle kaiken tarvittavan kurssin suorittamiseen huomattavasti nopeammalla latauksella.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mitä uutta azd:ssä tänään

> 📌 Tämä kurssi on validoitu versiolle **`azd 1.25.6`** (kesäkuu 2026). Suorita `azd version` tarkistaaksesi buildisi ja `azd upgrade` saadaksesi uusimman version.

Azure Developer CLI on kasvanut perinteisistä web-sovelluksista ja API:ista laajemmaksi. Nykyään azd on yksittäinen työkalu minkä tahansa sovelluksen käyttöönottoon Azureen—mukaan lukien tekoälyä hyödyntävät sovellukset ja älykkäät agentit.

Mitä tämä tarkoittaa sinulle:

- **AI-agentit ovat nyt ensiluokkaisia azd-työkuormia.** Voit alustaa, ottaa käyttöön ja hallita AI-agenttiprojekteja samalla `azd init` → `azd up` -työnkululla, jonka jo tunnet.
- **Täydellinen agentin elinkaaren hallinta CLI:stä.** `azure.ai.agents` -laajennus kattaa nyt koko matkan—`azd ai agent init` rungon luomiseksi, `azd ai agent invoke` testaamiseen (vastausaikailmoituksella), `azd ai agent eval generate` ja `azd ai agent optimize` laadun mittaamiseen ja parantamiseen sekä `azd ai agent delete` siivoukseen.
- **Lisää AI-rakennuspalikoita.** Uudet preview-laajennukset—`azure.ai.skills` ja `azure.ai.connections`—antavat sinun hallita uudelleenkäytettäviä agenttien skillsejä ja Foundry-yhteyksiä suoraan azd:llä.
- **Microsoft Foundry -integraatio** tuo mallien käyttöönoton, agenttien isännöinnin ja AI-palveluiden konfiguroinnin suoraan azd-mallipohjien ekosysteemiin.
- **Sujuvammat päivittäiset perusasiat.** Viimeaikaiset julkaisukorjaukset tekivät `azd init` -komennosta idempotentin (turvallinen suorittaa uudelleen), saivat `azd auth login` -komennon puhdistamaan vanhentuneet tokenit automaattisesti ja lisäsivät ystävällisen `azd tool` -ensiasennuskyselyn.
- **Ydin työnkulku ei ole muuttunut.** Olitpa ottamassa käyttöön todo-sovellusta, mikroserviceä tai monen agentin AI-ratkaisua, komennot ovat samat.

> **Huomautus Aspire-käyttäjille:** Microsoft kutsuu tuotetta nyt yksinkertaisesti **Aspire** (entinen ".NET Aspire"). azd:n Aspire-tuki on ennallaan—vain nimi päivitettiin.

Jos olet käyttänyt azd:tä aiemmin, AI-tuen lisääminen on luonnollinen laajennus—ei erillinen työkalu tai edistynyt polku. Jos aloitat alusta, opit yhden työnkulun, joka toimii kaikkeen.

---

## 🚀 Mikä on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on kehittäjäystävällinen komentorivityökalu, joka tekee sovellusten käyttöönotosta Azureen yksinkertaista. Sen sijaan, että loisit ja yhdistäisit kymmeniä Azure-resursseja manuaalisesti, voit ottaa käyttöön koko sovelluksia yhdellä komennolla.

### `azd up`-komennon taika

```bash
# Tämä yksittäinen komento tekee kaiken:
# ✅ Luo kaikki Azuren resurssit
# ✅ Määrittää verkottumisen ja tietoturvan
# ✅ Kokoaa sovelluskoodisi
# ✅ Julkaisee Azureen
# ✅ Antaa sinulle toimivan URL-osoitteen
azd up
```

**Siinä se!** Ei Azure-portaalin klikkailua, ei monimutkaisia ARM-malleja opittavaksi ensin, ei manuaalista konfigurointia—vain toimivia sovelluksia Azurella.

---

## ❓ Azure Developer CLI vs Azure CLI: Mikä on ero?

Tämä on yleisin kysymys, jonka aloittelijat esittävät. Tässä yksinkertainen vastaus:

| Ominaisuus | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tarkoitus** | Hallitse yksittäisiä Azure-resursseja | Ota käyttöön kokonaisia sovelluksia |
| **Ajattelutapa** | Infrastruktuuriin keskittyvä | Sovelluskeskeinen |
| **Esimerkki** | `az webapp create --name myapp...` | `azd up` |
| **Oppimiskäyrä** | Täytyy tuntea Azure-palvelut | Riittää että tunnet sovelluksesi |
| **Paras kohderyhmä** | DevOps, infrastruktuuri | Kehittäjät, prototypointi |

### Yksinkertainen vertauskuva

- **Azure CLI** on kuin kaikki työkalut talon rakentamiseen—vasarat, sahat, naulat. Voit rakentaa mitä tahansa, mutta sinun täytyy tuntea rakentaminen.
- **Azure Developer CLI** on kuin urakoitsijan palkkaaminen—kuvailet mitä haluat, ja he hoitavat rakentamisen.

### Milloin käyttää kumpaakin

| Tilanne | Käytä tätä |
|----------|----------|
| "Haluan ottaa web-sovellukseni käyttöön nopeasti" | `azd up` |
| "Tarvitsen vain storage accountin" | `az storage account create` |
| "Rakennan kokonaisen AI-sovelluksen" | `azd init --template azure-search-openai-demo` |
| "Minun täytyy debugata tiettyä Azure-resurssia" | `az resource show` |
| "Haluan tuotantovalmiin käyttöönoton minuuteissa" | `azd up --environment production` |

### Ne toimivat yhdessä!

AZD käyttää Azure CLI:tä taustalla. Voit käyttää molempia:
```bash
# Julkaise sovelluksesi AZD:llä
azd up

# Sitten hienosäädä tiettyjä resursseja Azure CLI:llä
az webapp config set --name myapp --always-on true
```

---

## 🌟 Löydä malleja Awesome AZD:stä

Älä aloita tyhjästä! **Awesome AZD** on yhteisön kokoelma valmiita käyttöönotettavia malleja:

| Resurssi | Kuvaus |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Selaa yli 200 mallia ja ota käyttöön yhdellä napsautuksella |
| 🔗 [**Lähetä malli**](https://github.com/Azure/awesome-azd/issues) | Osallistu lähettämällä oma mallisi yhteisölle |
| 🔗 [**GitHub-repositorio**](https://github.com/Azure/awesome-azd) | Tähditä ja tutki lähdekoodia |

### Suositut AI-mallit Awesome AZD:stä

```bash
# RAG Chat Microsoft Foundry -malleilla + AI-haku
azd init --template azure-search-openai-demo

# Nopea tekoälykeskustelusovellus
azd init --template openai-chat-app-quickstart

# Tekoälyagentteja Foundry-agenttien kanssa
azd init --template get-started-with-ai-agents
```

---

## 🎯 Aloittaminen kolmessa vaiheessa

Ennen kuin aloitat, varmista että koneesi on valmis sille mallille, jonka haluat ottaa käyttöön:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jos jokin vaadituista tarkistuksista epäonnistuu, korjaa se ensin ja jatka sitten pika-asennukseen.

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

# Vaaditaan AZD-työnkuluille
azd auth login
```

Jos et ole varma, mitä tarvitset, seuraa täydellistä asennus- ja käyttöönotto-ohjeistusta kohdassa [Asennus ja käyttöönotto](docs/chapter-01-foundation/installation.md#authentication-setup).

### Vaihe 3: Ota ensimmäinen sovelluksesi käyttöön

```bash
# Alusta mallipohjasta
azd init --template todo-nodejs-mongo

# Ota käyttöön Azureen (luo kaiken!)
azd up
```

**🎉 Valmista!** Sovelluksesi on nyt käytössä Azurella.

### Siivous (älä unohda!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kuinka käyttää tätä kurssia

Tämä kurssi on suunniteltu **asteittaiseen oppimiseen**—aloita kohtaa, jossa tunnet olosi mukavaksi, ja etene:

| Kokemuksesi | Aloita tästä |
|-----------------|------------|
| **Täysin uusi Azurelle** | [Luku 1: Perusta](#-chapter-1-foundation--quick-start) |
| **Tunnet Azurea, uusi AZD:lle** | [Luku 1: Perusta](#-chapter-1-foundation--quick-start) |
| **Haluat ottaa AI-sovelluksia käyttöön** | [Luku 2: AI-ensimmäinen kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Haluat käytännön harjoitusta** | [🎓 Interaktiivinen työpaja](workshop/README.md) - 3–4 tunnin ohjattu lab |
| **Tarvitset tuotantomalleja** | [Luku 8: Tuotanto & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Pika-asennus

1. **Forkkaa tämä repositorio**: [![GitHub-forkit](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa se**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hanki apua**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Haluatko kloonata paikallisesti?**
>
> Tämä repositorio sisältää yli 50 kielikäännöstä, mikä kasvattaa latauskokoa merkittävästi. Jos haluat kloonata ilman käännöksiä, käytä sparse checkoutia:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tämä antaa sinulle kaiken tarvittavan kurssin suorittamiseen huomattavasti nopeammalla latauksella.


## Kurssin yleiskatsaus

Hallitse Azure Developer CLI (azd) rakenteellisten lukujen avulla, jotka on suunniteltu etenevään oppimiseen. **Erityinen painotus AI-sovellusten käyttöönottoon Microsoft Foundryn integroinnin kanssa.**
### Miksi tämä kurssi on olennainen nykyaikaisille kehittäjille

Microsoft Foundryn Discord-yhteisön näkemyksiin perustuen **45 % kehittäjistä haluaa käyttää AZD:tä tekoälykuormiin** mutta kohtaa haasteita:
- Monimutkaiset monipalveluiset tekoälyarkkitehtuurit
- Tuotantovalmiuden käyttöönoton parhaat käytännöt  
- Azure AI -palveluiden integrointi ja konfigurointi
- Kustannusten optimointi tekoälykuormille
- Tekoälyyn liittyvien käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Suorittamalla tämän rakenteistetun kurssin:
- **Hallitse AZD:n perusteet**: Keskeiset käsitteet, asennus ja konfigurointi
- **Ota käyttöön tekoälysovelluksia**: Käytä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Toteuta Infrastructure as Code**: Hallinnoi Azure-resursseja Bicep-malleilla
- **Vianmääritys käyttöönotossa**: Ratkaise yleisiä ongelmia ja debuggaa virheitä
- **Optimoi tuotantoon**: Turvallisuus, skaalaus, seuranta ja kustannusten hallinta
- **Rakenna moni-agenttiratkaisuja**: Ota käyttöön monimutkaisia tekoälyarkkitehtuureja

## Ennen aloittamista: tilit, käyttöoikeudet ja oletukset

Ennen kuin aloitat luvun 1, varmista, että seuraavat asiat ovat kunnossa. Tämän oppaan myöhemmät asennusvaiheet olettavat, että nämä perusasiat on jo hoidettu.

- **Azure-tilaus**: Voit käyttää olemassa olevaa tilausta työpaikalta tai omalta tililtäsi, tai luoda a [ilmaisen kokeilun](https://aka.ms/azurefreetrial) aloittaaksesi.
- **Oikeudet Azure-resurssien luomiseen**: Useimpiin harjoituksiin tarvitset vähintään **Contributor**-oikeudet kohdetilaukseen tai resurssiryhmään. Joissakin luvuissa oletetaan myös, että voit luoda resurssiryhmiä, hallittuja identiteettejä ja RBAC-määrityksiä.
- [**GitHub-tili**](https://github.com): Tämä on hyödyllinen repoon forkkaamiseen, omien muutosten seuraamiseen ja GitHub Codespacesin käyttämiseen työpajassa.
- **Mallin suoritusedellytykset**: Jotkin mallipohjat tarvitsevat paikallisia työkaluja kuten Node.js, Python, Java tai Docker. Suorita asetusten tarkistin ennen aloittamista, jotta havaitsisit puuttuvat työkalut ajoissa.
- **Perustuntemus komentorivistä**: Sinun ei tarvitse olla asiantuntija, mutta sinun tulisi olla tuttu suorittamaan komentoja kuten `git clone`, `azd auth login`, ja `azd up`.

> **Työskenteletkö yritystilin alla?**
> Jos Azure-ympäristöäsi hallinnoi järjestelmänvalvoja, varmistu etukäteen, että voit ottaa resursseja käyttöön siinä tilauksessa tai resurssiryhmässä, jota aiot käyttää. Jos et voi, pyydä sandbox-tilausta tai Contributor-oikeuksia ennen aloittamista.

> **Uusi Azuren käyttäjä?**
> Aloita omalla Azure-kokeilu- tai pay-as-you-go -tilauksella osoitteessa https://aka.ms/azurefreetrial, jotta voit suorittaa harjoitukset alusta loppuun ilman vuokratason hyväksyntöjä.

## 🗺️ Kurssikartta: nopea navigointi luvuittain

Jokaisella luvulla on oma README, jossa oppimistavoitteet, pika-aloitukset ja harjoitukset:

| Luku | Aihe | Oppitunnit | Kesto | Monimutkaisuus |
|---------|-------|---------|----------|------------|
| **[Luku 1: Perusta](docs/chapter-01-foundation/README.md)** | Aloittaminen | [AZD:n perusteet](docs/chapter-01-foundation/azd-basics.md) &#124; [Asennus](docs/chapter-01-foundation/installation.md) &#124; [Ensimmäinen projekti](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Luku 2: Tekoälykehitys](docs/chapter-02-ai-development/README.md)** | Tekoälylähtöiset sovellukset | [Microsoft Foundryn integraatio](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Tekoälyagentit](docs/chapter-02-ai-development/agents.md) &#124; [Mallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 h | ⭐⭐ |
| **[Luku 3: Konfigurointi](docs/chapter-03-configuration/README.md)** | Todennus ja turvallisuus | [Konfigurointi](docs/chapter-03-configuration/configuration.md) &#124; [Todennus ja turvallisuus](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Luku 4: Infrastruktuuri](docs/chapter-04-infrastructure/README.md)** | IaC ja käyttöönotto | [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionointi](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 h | ⭐⭐⭐ |
| **[Luku 5: Moni-agentti](docs/chapter-05-multi-agent/README.md)** | Tekoälyagenttiratkaisut | [Vähittäiskauppaskenaario](examples/retail-scenario.md) &#124; [Koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Luku 6: Ennen käyttöönottoa](docs/chapter-06-pre-deployment/README.md)** | Suunnittelu ja validointi | [Preflight-tarkistukset](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapassiteetin suunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Luku 7: Vianetsintä](docs/chapter-07-troubleshooting/README.md)** | Debuggaus ja korjaus | [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debuggaus](docs/chapter-07-troubleshooting/debugging.md) &#124; [Tekoälyongelmat](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Luku 8: Tuotanto](docs/chapter-08-production/README.md)** | Yritystason mallit | [Tuotantokäytännöt](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Käytännön labra | [Johdanto](workshop/docs/instructions/0-Introduction.md) &#124; [Valinta](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validointi](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Purkamisvaihe](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Mukauttaminen](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Purkutoimet](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Kokonaiskesto:** ~10-14 tuntia | **Taidon eteneminen:** Aloittelija → Tuotantovalmius

---

## 📚 Oppimisluvut

*Valitse oppimispolku kokemustason ja tavoitteiden mukaan*

### 🚀 Luku 1: Perusta ja pika-aloitus
**Ennakkovaatimukset**: Azure-tilaus, perustason komentoriviosaaminen  
**Kesto**: 30–45 minuuttia  
**Monimutkaisuus**: ⭐

#### Mitä opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Mikä on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [AZD:n perusteet](docs/chapter-01-foundation/azd-basics.md) - Keskeiset käsitteet ja terminologia
- **⚙️ Asennus**: [Asennus ja asetukset](docs/chapter-01-foundation/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön harjoitus**: [Ensimmäinen projektisi](docs/chapter-01-foundation/first-project.md) - Vaiheittainen opas
- **📋 Pikaviite**: [Komentojen pikalista](resources/cheat-sheet.md)

#### Käytännön harjoitukset
```bash
# Nopea asennustarkistus
azd version

# Ota ensimmäinen sovelluksesi käyttöön
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun lopputulos**: Pystyt ottamaan yksinkertaisen verkkosovelluksen käyttöön Azureen AZD:n avulla

**✅ Onnistumisen todennus:**
```bash
# Luvun 1 suorittamisen jälkeen sinun pitäisi pystyä:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Aika-arvio:** 30–45 minuuttia  
**📈 Taitotaso lopuksi:** Pystyy itsenäisesti ottamaan käyttöön perussovelluksia
**📈 Taitotaso lopuksi:** Pystyy itsenäisesti ottamaan käyttöön perussovelluksia

---

### 🤖 Luku 2: Tekoälylähtöinen kehitys (suositellaan tekoälykehittäjille)
**Ennakkovaatimukset**: Luku 1 suoritettuna  
**Kesto**: 1–2 tuntia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integrointi AZD:n kanssa
- Tekoälyllä varustettujen sovellusten käyttöönotto
- Tekoälypalveluiden konfiguraatioiden ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Microsoft Foundryn integraatio](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Tekoälyagentit**: [Tekoälyagenttien opas](docs/chapter-02-ai-development/agents.md) - Ota älykkäät agentit käyttöön AZD:llä
- **📖 Mallit**: [Tekoälymallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) - Ota mallit käyttöön ja hallinnoi niitä
- **🛠️ Työpaja**: [AI-työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee tekoälyratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen opas**: [Työpajamateriaali](workshop/README.md) - Selainpohjaista oppimista MkDocs * DevContainer -ympäristössä
- **📋 Mallit**: [Microsoft Foundry -mallit](#työpajan-resurssit)
- **📝 Esimerkit**: [AZD-käyttöönottoesimerkit](examples/README.md)

#### Käytännön harjoitukset
```bash
# Ota käyttöön ensimmäinen tekoälysovelluksesi
azd init --template azure-search-openai-demo
azd up

# Kokeile lisää tekoälymallipohjia
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun lopputulos**: Ota käyttöön ja konfiguroi tekoälyllä varustettu chat-sovellus, jolla on RAG-ominaisuudet

**✅ Onnistumisen todennus:**
```bash
# Luvun 2 jälkeen sinun pitäisi pystyä:
azd init --template azure-search-openai-demo
azd up
# Testata tekoälychatin käyttöliittymää
# Esittää kysymyksiä ja saada tekoälyn tuottamia vastauksia lähteineen
# Varmistaa haun integroinnin toimivuus
azd monitor  # Tarkistaa, että Application Insights näyttää telemetriatiedot
azd down --force --purge
```

**📊 Aika-arvio:** 1–2 tuntia  
**📈 Taitotaso lopuksi:** Pystyy ottamaan käyttöön ja konfiguroimaan tuotantovalmiita tekoälysovelluksia  
**💰 Kustannustietoisuus:** Ymmärrä kehityskustannukset noin $80–150/kk, tuotantokustannukset $300–3500/kk

#### 💰 Kustannusnäkökohdat tekoälyn käyttöönotossa

**Kehitysympäristö (arvio $80–150/kk):**
- Microsoft Foundry -mallit (Pay-as-you-go): $0–50/kk (perustuu token-käyttöön)
- AI Search (Basic-taso): $75/kk
- Container Apps (Consumption): $0–20/kk
- Tallennus (Standard): $1–5/kk

**Tuotantoympäristö (arvio $300–3,500+/kk):**
- Microsoft Foundry -mallit (PTU johdonmukaiseen suorituskykyyn): $3,000+/kk TAI Pay-as-you-go korkean volyymin tapauksessa
- AI Search (Standard-taso): $250/kk
- Container Apps (Dedicated): $50–100/kk
- Application Insights: $5–50/kk
- Tallennus (Premium): $10–50/kk

**💡 Kustannusten optimointivinkit:**
- Käytä **Free Tier** -tasoa Microsoft Foundry -malleista oppimiseen (Azure OpenAI 50,000 tokenia/kk sisältyy)
- Suorita `azd down` vapauttaaksesi resursseja, kun et aktiivisesti kehitä
- Aloita kulutusperusteisella laskutuksella, nosta PTU:hun vain tuotantoa varten
- Käytä `azd provision --preview` arvioidaksesi kustannuksia ennen käyttöönottoa
- Ota automaattinen skaalautuminen käyttöön: maksa vain todellisesta käytöstä

**Kustannusten seuranta:**
```bash
# Tarkista arvioidut kuukausikustannukset
azd provision --preview

# Seuraa todellisia kustannuksia Azure-portaalissa
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Konfigurointi ja todennus
**Ennakkovaatimukset**: Luku 1 suoritettuna  
**Kesto**: 45–60 minuuttia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Ympäristön konfigurointi ja hallinta
- Todennus ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimateriaalit
- **📖 Konfigurointi**: [Konfigurointiopas](docs/chapter-03-configuration/configuration.md) - Ympäristön asetukset
- **🔐 Turvallisuus**: [Todennusmallit ja hallitut identiteetit](docs/chapter-03-configuration/authsecurity.md) - Todennusmallit
- **📝 Esimerkit**: [Tietokantasovellus-esimerkki](examples/database-app/README.md) - AZD-tietokantaesimerkit

#### Käytännön harjoitukset
- Konfiguroi useita ympäristöjä (dev, staging, prod)
- Ota käyttöön hallittuun identiteettiin perustuva todennus
- Toteuta ympäristökohtaiset konfiguraatiot

**💡 Luvun lopputulos**: Hallitse useita ympäristöjä asianmukaisella todennuksella ja turvallisuudella

---

### 🏗️ Luku 4: Infrastruktuuri koodina ja käyttöönotto
**Ennakkovaatimukset**: Luvut 1–3 suoritettuna  
**Kesto**: 1–1,5 tuntia  
**Monimutkaisuus**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönoton mallit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisiointistrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) - Täydelliset työnkulut
- **🏗️ Provisionointi**: [Resurssien provisionointi](docs/chapter-04-infrastructure/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App -esimerkki](../../examples/container-app) - Kontitettujen sovellusten käyttöönotot

#### Käytännön harjoitukset
- Luo omia Bicep-malleja
- Ota käyttöön monipalvelusovelluksia
- Toteuta blue-green-käyttöönotto-strategioita

**💡 Luvun lopputulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia käyttäen mukautettuja infrastruktuurimalleja
### 🎯 Luku 5: Moni-agenttiset tekoälyratkaisut (Edistynyt)
**Esivaatimukset**: Luvut 1-2 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä opit
- Moni-agenttiarkkitehtuurin mallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit tekoälyn käyttöönotot

#### Oppimisresurssit
- **🤖 Esittelyprojekti**: [Vähittäiskaupan moni-agenttiratkaisu](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM-mallit**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Yhden klikkauksen käyttöönotto
- **📖 Arkkitehtuuri**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mallit

#### Käytännön harjoitukset
```bash
# Ota käyttöön koko vähittäiskaupan moniagenttinen ratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutki agenttien kokoonpanoja
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Luvun lopputulos**: Ota käyttöön ja hallinnoi tuotantovalmiita moni-agenttisia tekoälyratkaisuja Customer- ja Inventory-agenteilla

---

### 🔍 Luku 6: Esikartoitus ja suunnittelu ennen käyttöönottoa
**Esivaatimukset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Kapasiteetin suunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Esitarkastukset ja automaatio

#### Oppimisresurssit
- **📊 Suunnittelu**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resurssien validointi
- **💰 Valinta**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Validointi**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automaattiset skriptit

#### Käytännön harjoitukset
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten kannalta
- Toteuta automaattiset esikartoitustarkastukset

**💡 Luvun lopputulos**: Validoi ja optimoi käyttöönotot ennen toteutusta

---

### 🚨 Luku 7: Vianmääritys ja debuggaus
**Esivaatimukset**: Mikä tahansa käyttöönottoa käsittelevä luku suoritettu  
**Kesto**: 1-1.5 tuntia  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Systemaattiset debuggauslähestymistavat
- Yleiset ongelmat ja niiden ratkaisut
- Tekoälyspesifinen vianmääritys

#### Oppimisresurssit
- **🔧 Yleiset ongelmat**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Usein kysytyt kysymykset ja ratkaisut
- **🕵️ Debuggaus**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Askeltavat strategiat
- **🤖 Tekoälyongelmat**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Tekoälypalvelujen ongelmat

#### Käytännön harjoitukset
- Diagnosoi käyttöönoton epäonnistumisia
- Ratkaise todennusongelmia
- Debuggaa tekoälypalvelun yhteyksiä

**💡 Luvun lopputulos**: Diagnosoi ja ratkaise itsenäisesti yleisiä käyttöönotto-ongelmia

---

### 🏢 Luku 8: Tuotanto- ja yritysarkkitehtuurin mallit
**Esivaatimukset**: Luvut 1-4 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritystason turvallisuusmallit
- Monitorointi ja kustannusten optimointi

#### Oppimisresurssit
- **🏭 Tuotanto**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Yritysarkkitehtuurin mallit
- **📝 Esimerkit**: [Microservices Example](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Monitorointi**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitorointi

#### Käytännön harjoitukset
- Toteuta yritystason turvallisuusmalleja
- Ota käyttöön kattava monitorointi
- Ota tuotantoon asianmukaisella hallinnalla

**💡 Luvun lopputulos**: Ota käyttöön yritysvalmiita sovelluksia täydellisillä tuotanto-ominaisuuksilla

---

## 🎓 Työpajan yleiskatsaus: Käytännön oppimiskokemus

> **⚠️ TYÖPAJAN TILA: Kehitteillä**  
> Työpajamateriaalit ovat parhaillaan kehitteillä ja viimeisteltävänä. Ydinmoduulit toimivat, mutta jotkin edistyneet osiot ovat keskeneräisiä. Työskentelemme aktiivisesti sisällön täydentämiseksi. [Seuraa edistymistä →](workshop/README.md)

### Interaktiiviset työpajamateriaalit
**Kattava käytännön oppimiskokemus selainpohjaisilla työkaluilla ja ohjatuilla harjoituksilla**

Työpajamateriaalimme tarjoavat jäsennellyn, interaktiivisen oppimiskokemuksen, joka täydentää yllä olevaa lukuohjelmaa. Työpaja on suunniteltu sekä itsenäiseen opiskeluun että ohjattuihin sessioihin.

#### 🛠️ Työpajan ominaisuudet
- **Selainpohjainen käyttöliittymä**: Täydellinen MkDocs-pohjainen työpaja hakutoiminnolla, kopioinnilla ja teemoilla
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristön asennus
- **Jäsennelty oppimispolku**: 8-moduulinen ohjattu harjoituspolku (3-4 tuntia yhteensä)
- **Progressiivinen metodologia**: Johdanto → Valinta → Validointi → Purku → Konfigurointi → Räätälöinti → Purku → Yhteenveto
- **Interaktiivinen DevContainer-ympäristö**: Esikonfiguroidut työkalut ja riippuvuudet

#### 📚 Työpajan moduulirakenne
Työpaja noudattaa **8-moduulista progressiivista metodologiaa**, joka vie sinut löytämisestä käyttöönoton hallintaan:

| Moduuli | Aihe | Mitä teet | Kesto |
|--------|-------|----------------|----------|
| **0. Introduction** | Työpajan yleiskatsaus | Ymmärrä oppimistavoitteet, esivaatimukset ja työpajan rakenne | 15 min |
| **1. Selection** | Mallien löytäminen | Tutki AZD-malleja ja valitse oikea AI-malli tilanteeseesi | 20 min |
| **2. Validation** | Ota käyttöön & varmista | Ota malli käyttöön komennolla `azd up` ja varmista infrastruktuurin toimivuus | 30 min |
| **3. Deconstruction** | Rakenne haltuun | Käytä GitHub Copilotia tutkiaksesi mallin arkkitehtuuria, Bicep-tiedostoja ja koodin järjestelyä | 30 min |
| **4. Configuration** | azure.yaml syväsukellus | Hallitse `azure.yaml`-konfiguraatiota, lifecycle-hookeja ja ympäristömuuttujia | 30 min |
| **5. Customization** | Tee siitä oma | Ota käyttöön AI-haku, jäljitys, arviointi ja räätälöi skenaariollesi | 45 min |
| **6. Teardown** | Siivous | Pura resurssit turvallisesti komennolla `azd down --purge` | 15 min |
| **7. Wrap-up** | Seuraavat askeleet | Käy läpi saavutukset, keskeiset käsitteet ja jatka oppimispolkua | 15 min |

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
# Napsauta repositorion "Code" → "Create codespace on main"

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Noudata workshop/README.md-tiedoston asennusohjeita
```

#### 🎯 Työpajan oppimistavoitteet
Työpajan suorittamalla osallistujat:
- **Ota käyttöön tuotantotason tekoälysovelluksia**: Käytä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Hallitse moni-agenttiarkkitehtuureja**: Toteuta koordinoituja tekoälyagenttiratkaisuja
- **Ota käyttöön turvallisuuden parhaat käytännöt**: Konfiguroi todennus ja käyttöoikeuksien hallinta
- **Optimoi skaalautuvuutta varten**: Suunnittele kustannustehokkaita ja suorituskykyisiä käyttöönottoja
- **Debuggaa käyttöönottoja**: Ratkaise yleisiä ongelmia itsenäisesti

#### 📖 Työpajan resurssit
- **🎥 Interaktiivinen opas**: [Workshop Materials](workshop/README.md) - Selainpohjainen oppimisympäristö
- **📋 Moduuli kerrallaan -ohjeet**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Työpajan yleiskatsaus ja tavoitteet
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Etsi ja valitse AI-mallit
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Ota mallit käyttöön ja varmista ne
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tutki mallin arkkitehtuuria
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Hallitse azure.yaml-tiedostoa
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Räätälöi skenaariollesi
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Siivoa resurssit
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Yhteenveto ja seuraavat askeleet
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tekoälyyn keskityviä harjoituksia
- **💡 Pikakäynnistys**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Täydellinen**: Yrityskoulutuksiin, yliopistokursseille, itsenäiseen opiskeluun ja kehittäjäbootcampeihin.

---

## 📖 Syventävä tarkastelu: AZD:n ominaisuudet

Perusasioiden lisäksi AZD tarjoaa tehokkaita ominaisuuksia tuotantokäyttöönottoihin:

- **Mallipohjaiset käyttöönotot** - Käytä valmiita malleja yleisiin sovellusmalleihin
- **Infrastructure as Code** - Hallitse Azure-resursseja Bicepillä tai Terraformilla  
- **Integroidut työnkulut** - Provisionoi, ota käyttöön ja seuraa sovelluksia saumattomasti
- **Kehittäjäystävällinen** - Optimoitu kehittäjän tuottavuutta ja käyttökokemusta varten

### **AZD + Microsoft Foundry: Täydellinen tekoälykäyttöönottoihin**

**Miksi AZD tekoälyratkaisuille?** AZD vastaa tärkeimpiin haasteisiin, joita tekoälykehittäjät kohtaavat:

- **AI-valmiit mallit** - Esikonfiguroidut mallit Microsoft Foundry -malleille, Azure AI -palveluille ja ML-kuormituksille
- **Turvalliset tekoälykäyttöönotot** - Sisäänrakennetut turvallisuusmallit tekoälypalveluille, API-avaimille ja mallien päätepisteille  
- **Tuotannon AI-mallit** - Parhaat käytännöt skaalautuviin, kustannustehokkaisiin tekoälysovelluksiin
- **End-to-End AI-työnkulut** - Mallikehityksestä tuotantokäyttöön asianmukaisella monitoroinnilla
- **Kustannusoptimointi** - Älykkäät resurssien jakamisen ja skaalaamisen strategiat tekoälykuormille
- **Microsoft Foundry -integraatio** - Saumaton yhteys Microsoft Foundryn mallikatalogiin ja päätepisteisiin

---

## 🎯 Malli- ja esimerkkikirjasto

### Esittelyssä: Microsoft Foundry -mallit
**Aloita täältä, jos otat käyttöön tekoälysovelluksia!**

> **Huom:** Nämä mallit demonstroivat erilaisia tekoälymalleja. Osa on ulkoisia Azure Samples -esimerkkejä, osa paikallisia toteutuksia.

| Malli | Luku | Vaikeustaso | Palvelut | Tyyppi |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ulkoinen |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esittelyssä: Täydelliset oppimisskenaariot
**Tuotantovalmiit sovellusmallit, jotka on kohdistettu oppimislukuihin**

| Malli | Oppimisluku | Vaikeustaso | Keskeinen oppi |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perus tekoälykäyttöönoton mallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchilla |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Document Intelligence -integraatio |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritystason tekoälyorkestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moni-agenttiarkkitehtuuri Customer- ja Inventory-agenteilla |

### Oppiminen esimerkkien kautta

> **📌 Paikalliset vs. ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Valmiita käytettäväksi heti  
> **Ulkopuoliset esimerkit** (Azure Samples) = Kloonaa linkatuista reposta

#### Paikalliset esimerkit (valmiit käytettäväksi)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Täydellinen tuotantovalmiilla toteutuksella ja ARM-malleilla
  - Moni-agenttinen arkkitehtuuri (Customer + Inventory -agentit)
  - Kattava monitorointi ja arviointi
  - Yhden klikkauksen käyttöönotto ARM-mallin kautta

#### Paikalliset esimerkit - Konttisovellukset (luvut 2-5)
**Kattavat konttipohjaiset käyttöönottoesimerkit tässä repossa:**
- [**Container App -esimerkit**](examples/container-app/README.md) - Täydellinen opas konttien käyttöönottoon
  - [Yksinkertainen Flask-API](../../examples/container-app/simple-flask-api) - Perus-REST-API, joka skaalaa nollaan
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices) - Tuotantovalmiiksi monipalveluinen käyttöönotto
  - Pika-aloitus, tuotanto- ja edistyneet käyttöönotto-mallit
  - Valvonta-, turvallisuus- ja kustannusten optimointiohjeet

#### Ulkoiset esimerkit - Yksinkertaiset sovellukset (luvut 1-2)
**Kloonaa nämä Azure Samples -repositoriot aloittaaksesi:**
- [Yksinkertainen verkkosovellus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Peruskäyttöönotto-mallit
- [Staattinen verkkosivusto - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön käyttöönotto
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API-käyttöönotto

#### Ulkoiset esimerkit - Tietokantaintegraatio (luvut 3-4)  
- [Tietokantasovellus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantayhteysmallit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Palvelimettomat tietotyövirrat

#### Ulkoiset esimerkit - Edistyneet mallit (luvut 4-8)
- [Java-mikropalvelut](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps - taustatehtävät](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessointi  
- [Yritys-ML-putki](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit ML-mallit

### Ulkoiset mallikokoelmat
- [**Virallinen AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Valikoitu kokoelma virallisista ja yhteisön malleista
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Examples Directory**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisilla selityksillä

---

## 📚 Oppimisresurssit & Viitteet

### Pikaviitteet
- [**Komentojen pikaopas**](resources/cheat-sheet.md) - Välttämättömät azd-komennot järjestettyinä luvuittain
- [**Sanasto**](resources/glossary.md) - Azure- ja azd-terminologia  
- [**UKK**](resources/faq.md) - Yleisimmät kysymykset järjestettyinä luvuittain
- [**Opintosuunnitelma**](resources/study-guide.md) - Kattavat harjoitustehtävät

### Käytännön työpajat
- [**AI-työpajalaboratorio**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-asennettavia (2-3 tuntia)
- [**Interaktiivinen työpaja**](workshop/README.md) - 8-moduulinen opastettu harjoitussarja MkDocsilla ja GitHub Codespacesilla
  - Seuraa: Johdanto → Valinta → Validointi → Purkaminen → Konfigurointi → Mukauttaminen → Teardown → Yhteenveto

### Ulkoiset oppimisresurssit
- Azure Developer CLI -dokumentaatio: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### AI-agenttitaitoja editorillesi
- [**Microsoft Azure -taidot skills.shissä**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 avointa agenttitaitoa Azure AI:lle, Foundrylle, käyttöönotolle, diagnostiikalle, kustannusoptimoinnille ja muille. Asenna ne GitHub Copilotiin, Cursoriin, Claude Codeen tai mihin tahansa tuettuun agenttiin:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Pikavianetsintäopas

**Aloittelijoiden yleiset ongelmat ja välittömät ratkaisut:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Asenna ensin AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Tarkista asennus
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Luettele käytettävissä olevat tilaukset
az account list --output table

# Aseta oletustilaus
az account set --subscription "<subscription-id-or-name>"

# Aseta AZD-ympäristölle
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Tarkista
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Kokeile eri Azure-aluetta
azd env set AZURE_LOCATION "westus2"
azd up

# Tai käytä kehityksessä pienempiä SKUja
# Muokkaa infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Vaihtoehto 1: Puhdista ja yritä uudelleen
azd down --force --purge
azd up

# Vaihtoehto 2: Korjaa vain infrastruktuuri
azd provision

# Vaihtoehto 3: Tarkista yksityiskohtainen tila
azd show

# Vaihtoehto 4: Tarkista lokit Azure Monitorissa
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Autentikoi uudelleen AZD:lle
azd auth logout
azd auth login

# Valinnainen: päivitä myös Azure CLI, jos suoritat az-komentoja
az logout
az login

# Tarkista autentikointi
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD luo ainutlaatuisia nimiä, mutta jos syntyy ristiriita:
azd down --force --purge

# Sitten yritä uudelleen uudella ympäristöllä
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ "Template deployment taking too long"</strong></summary>

**Normaali odotusaika:**
- Yksinkertainen verkkosovellus: 5-10 minuuttia
- Sovellus, jossa on tietokanta: 10-15 minuuttia
- AI-sovellukset: 15-25 minuuttia (OpenAI:n provisiointi on hidasta)

```bash
# Tarkista edistyminen
azd show

# Jos jumitut yli 30 minuuttia, tarkista Azure-portaali:
azd monitor --overview
# Etsi epäonnistuneita käyttöönottoja
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Tarkista Azure-roolisi
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Tarvitset vähintään "Contributor"-roolin
# Pyydä Azure-järjestelmänvalvojaasi myöntämään:
# - Contributor (resursseille)
# - User Access Administrator (roolien myöntämistä varten)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Näytä kaikki palvelun päätepisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```
</details>

### 📚 Kattavat vianmääritysresurssit

- **Yleiset ongelmat -opas:** [Yksityiskohtaiset ratkaisut](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-kohtaiset ongelmat:** [AI-vianmääritys](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Virheenkorjausopas:** [Vaiheittainen virheenkorjaus](docs/chapter-07-troubleshooting/debugging.md)
- **Hanki apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suoritus & sertifiointi

### Edistymisen seuranta
Seuraa oppimisprosessiasi läpi jokaisen luvun:

- [ ] **Luku 1**: Perusta & Pika-aloitus ✅
- [ ] **Luku 2**: AI-keskeinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & Todennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & Käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Esikäyttöönoton validointi & Suunnittelu ✅
- [ ] **Luku 7**: Vianmääritys & Virheenkorjaus ✅
- [ ] **Luku 8**: Tuotanto & Yritystason mallit ✅

### Oppimisen varmistus
Kun olet suorittanut luvun, varmista osaamisesi seuraavasti:
1. **Käytännön harjoitus**: Suorita luvun käytännön käyttöönotto
2. **Tiedon tarkistus**: Tarkista luvun UKK-osio
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavaan vaativuustasoon

### Kurssin suorittamisen edut
Kun olet suorittanut kaikki luvut, sinulla on:
- **Käytännön tuotantokokemus**: Olet ottanut tuotantoon todellisia AI-sovelluksia Azureen
- **Ammatilliset taidot**: Yrityskäyttöön soveltuvat käyttöönotto-ominaisuudet  
- **Yhteisön tunnustus**: Aktiivinen jäsen Azure-kehittäjäyhteisössä
- **Uraedistys**: Kysyttyä AZD- ja AI-käyttöönotto-osaamista

---

## 🤝 Yhteisö & Tuki

### Hanki apua & tuki
- **Tekniset ongelmat**: [Ilmoita bugeista ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord -yhteisö](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-kohtainen apu**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemyksiä Microsoft Foundry Discordista

**Viimeaikaiset äänestystulokset #Azure-kanavalta:**
- **45%** kehittäjistä haluaa käyttää AZD:tä AI-työkuormiin
- **Suurimmat haasteet**: Monipalvelukäyttöönotot, tunnusten hallinta, tuotantovalmius  
- **Useimmin pyydetyt**: AI-kohtaiset mallipohjat, vianmääritysoppaat, parhaat käytännöt

**Liity yhteisöömme, jotta voit:**
- Jaa AZD + AI -kokemuksesi ja saa apua
- Pääsy uusien AI-mallien varhais-previewihin
- Osallistu AI-käyttöönoton parhaiden käytäntöjen kehittämiseen
- Vaikuta tuleviin AI- ja AZD-ominaisuuksiin

### Kurssiin osallistuminen
Otamme mielellämme vastaan kontribuutioita! Lue [Osallistumisohjeet](CONTRIBUTING.md) saadaksesi lisätietoja:
- **Sisällön parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uudet esimerkit**: Lisää oikean elämän skenaarioita ja malleja  
- **Kääntäminen**: Auta ylläpitämään monikielistä tukea
- **Virheraportit**: Paranna tarkkuutta ja selkeyttä
- **Yhteisön käytännöt**: Noudata osallistavia yhteisöohjeitamme

---

## 📄 Kurssitiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - katso yksityiskohdat [LICENSE](../../LICENSE)-tiedostosta.

### Liittyvät Microsoftin oppimisresurssit

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
[![AI-agentit aloittelijoille](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivinen AI -sarja
[![Generatiivinen AI aloittelijoille](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen tekoäly (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Keskeiset opinnot
[![Koneoppiminen aloittelijoille](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data-analytiikka aloittelijoille](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Tekoäly aloittelijoille](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberturvallisuus aloittelijoille](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web-kehitys aloittelijoille](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT aloittelijoille](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-kehitys aloittelijoille](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-sarja
[![Copilot AI-pariohjelmointiin](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET:lle](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-seikkailu](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurssin navigointi

**🚀 Valmis aloittamaan?**

**Aloittelijat**: Aloita [Luku 1: Perusta & Pikakäynnistys](#-chapter-1-foundation--quick-start)  
**AI-kehittäjät**: Siirry kohtaan [Luku 2: Tekoälykeskeinen kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kokeneet kehittäjät**: Aloita kohdasta [Luku 3: Konfigurointi & Todennus](#️-chapter-3-configuration--authentication)

**Seuraavat askeleet**: [Aloita Luku 1 - AZD-perusteet](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->