# AZD Aloittelijoille: Jäsennelty Oppimismatka

![AZD-for-beginners](../../translated_images/fi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaattiset käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Haluatko kloonata paikallisesti?**
>
> Tämä arkisto sisältää yli 50 kielikäännöstä, jotka kasvattavat tiedoston latauskokoa merkittävästi. Jos haluat kloonata ilman käännöksiä, käytä sparse checkout -toimintoa:
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
> Tämä antaa sinulle kaiken tarvitsemasi kurssin suorittamiseen huomattavasti nopeammalla latauksella.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mitä uutta azd:ssä tänään

> 📌 Tämä kurssi on validoitu versiolle **`azd 1.27.1`** (heinäkuu 2026). Suorita `azd version` tarkistaaksesi buildin, ja `azd upgrade` saadaksesi uusimman version.

Azure Developer CLI on kehittynyt perinteisistä web-sovelluksista ja API:sta laajemmaksi. Nykyään azd on ainoa työkalu minkä tahansa sovelluksen käyttöönottoon Azureen—mukaan lukien tekoälyä hyödyntävät sovellukset ja älykkäät agentit.

Tässä mitä se tarkoittaa sinulle:

- **Tekoälyagentit ovat nyt täysivaltaisia azd-kuormituksia.** Voit alustaa, ottaa käyttöön ja hallita tekoälyagenttiprojekteja samalla `azd init` → `azd up` -työnkululla, jonka jo tunnet.
- **Täydellinen agentin elinkaaren hallinta komentoriviltä.** Laajennus `azure.ai.agents` kattaa nyt koko matkan—`azd ai agent init` kehykset, `azd ai agent invoke` testaukseen (vastauksen aikavasteella), `azd ai agent eval generate` ja `azd ai agent optimize` laadun mittaamiseen ja parantamiseen sekä `azd ai agent delete` siivoukseen.
- **Lisää tekoälyn rakennuspalikoita.** Uudet esikatselulaajennukset—`azure.ai.skills` ja `azure.ai.connections`—antavat sinun hallita uudelleenkäytettäviä agenttien taitoja ja Foundry-yhteyksiä suoraan azd:llä.
- **Microsoft Foundry -integraatio** tuo mallien käyttöönoton, agenttien isännöinnin ja tekoälypalvelujen konfiguroinnin suoraan azd-mallipohjat ekosysteemiin.
- **Saumattomampi arjen perustoiminnot.** Viimeaikaiset julkaisut tekivät `azd init` idempotentiksi (turvalliseksi suorittaa uudelleen), sai `azd auth login` poistamaan vanhentuneet tunnukset automaattisesti, ja lisäsi ystävällisen `azd tool` ensimmäisen käyttökerran asetuskehotteen.
- **Ydin työnkulku ei ole muuttunut.** Olitpa sitten käyttöönotamassa todo-sovellusta, mikropalvelua tai monitoimijaisen tekoälyratkaisun, komennot ovat samat.

> **Huomautus Aspire-käyttäjille:** Microsoft viittaa tuotteeseen nyt yksinkertaisesti nimellä **Aspire** (entinen ".NET Aspire"). azd:n Aspire-tuki on ennallaan – vain nimi on päivitetty.

Jos olet käyttänyt azd:tä aiemmin, tekoälytuki on luonnollinen laajennus – ei erillinen työkalu tai edistynyt polku. Jos aloitat alusta, opit yhden työnkulun, joka toimii kaikessa.

---

## 🚀 Mitä Azure Developer CLI (azd) on?

**Azure Developer CLI (azd)** on kehittäjäystävällinen komentorivityökalu, joka tekee sovellusten käyttöönotosta Azureen helppoa. Sen sijaan, että luot ja yhdistät manuaalisesti kymmeniä Azure-resursseja, voit ottaa käyttöön kokonaisia sovelluksia yhdellä komennolla.

### Taikavoima `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Juuri näin!** Ei Azure-portaalin klikkailua, ei monimutkaisia ARM-malleja opittavaksi ensin, ei manuaalista määritystä – vain toimivat sovellukset Azurella.

---

## ❓ Azure Developer CLI vs Azure CLI: Mikä on ero?

Tämä on yleisin aloittelijoiden kysymys. Tässä yksinkertainen vastaus:

| Ominaisuus | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tarkoitus** | Yksittäisten Azure-resurssien hallinta | Kokonaisvaltaisten sovellusten käyttöönotto |
| **Ajattelutapa** | Infrastruktuurikeskeinen | Sovelluskeskeinen |
| **Esimerkki** | `az webapp create --name myapp...` | `azd up` |
| **Oppimiskäyrä** | Täytyy tuntea Azure-palvelut | Riittää, että tunne sovelluksesi |
| **Parhaiten sopii** | DevOps, infrastruktuuri | Kehittäjät, prototyyppien teko |

### Yksinkertainen analogia

- **Azure CLI** on kuin olisi kaikki työkalut talon rakentamiseen – vasarat, sahat, naulat. Voit rakentaa mitä tahansa, mutta sinun täytyy osata rakentaminen.
- **Azure Developer CLI** on kuin palkkaisit urakoitsijan – kuvailet mitä haluat, ja he hoitavat rakentamisen.

### Milloin käyttää kumpaakin

| Tilanne | Käytä tätä |
|----------|----------|
| "Haluan ottaa verkkosovellukseni nopeasti käyttöön" | `azd up` |
| "Minun täytyy luoda vain säilytystili" | `az storage account create` |
| "Rakennan täysimittaista tekoälysovellusta" | `azd init --template azure-search-openai-demo` |
| "Minun täytyy virheenkorjata tietty Azure-resurssi" | `az resource show` |
| "Haluan tuotantovalmiin käyttöönoton minuuteissa" | `azd up --environment production` |

### Ne toimivat yhdessä!

AZD käyttää taustalla Azure CLI:tä. Voit käyttää molempia:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Löydä malleja Awesome AZD:stä

Älä aloita tyhjästä! **Awesome AZD** on yhteisön kokoelma käyttöönottovalmiita malleja:

| Resurssi | Kuvaus |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Selaa yli 200 mallia yhdellä klikkauksella |
| 🔗 [**Lähetä malli**](https://github.com/Azure/awesome-azd/issues) | Osallistu yhteisön mallin jakamiseen |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Tähdittäminen ja lähdekoodin selaus |

### Suositut tekoälymallit Awesome AZD:stä

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Aloita kolmessa vaiheessa

Ennen aloittamista varmista, että laitteesi on valmis käyttämään haluamaasi mallia:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jos jokin vaadituista tarkistuksista epäonnistuu, korjaa se ensin ja jatka sitten pika-aloitusta.

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
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Jos et ole varma, kumpaa tarvitset, seuraa koko asennusprosessi kohdassa [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Vaihe 3: Ota ensimmäinen sovelluksesi käyttöön

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Siinä se!** Sovelluksesi on nyt toiminnassa Azuren päällä.

### Siivous (Älä unohda!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kuinka käyttää tätä kurssia

Tämä kurssi on suunniteltu **edistyvään oppimiseen** – aloita siitä, missä tunnet olosi mukavaksi, ja etene askel kerrallaan:

| Kokemuksesi | Aloita tästä |
|-----------------|------------|
| **Täysin uusi Azureen** | [Luku 1: Perusteet](#-chapter-1-foundation--quick-start) |
| **Tunnet Azuren, uusi AZD:hen** | [Luku 1: Perusteet](#-chapter-1-foundation--quick-start) |
| **Haluat ottaa tekoälysovelluksia käyttöön** | [Luku 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Haluat käytännön harjoituksia** | [🎓 Interaktiivinen työpaja](workshop/README.md) - 3-4 tunnin ohjattu laboraatio |
| **Tarvitset tuotantokuvioita** | [Luku 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Nopea käyttöönotto

1. **Forkkaa tämä repositorio**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa se**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hanki apua**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Haluatko kloonata paikallisesti?**

> Tämä arkisto sisältää yli 50 kielen käännökset, mikä lisää huomattavasti latauskokoa. Jotta voit kloonata ilman käännöksiä, käytä sparse checkout -toimintoa:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tämä antaa sinulle kaiken tarvittavan kurssin suorittamiseen huomattavasti nopeammalla latauksella.


## Kurssin yleiskatsaus

Hallitse Azure Developer CLI (azd) rakennebundelien kautta, jotka on suunniteltu asteittaiseen oppimiseen. **Erityinen painotus AI-sovellusten käyttöönotossa Microsoft Foundry -integraation kanssa.**

### Miksi tämä kurssi on välttämätön nykyaikaisille kehittäjille

Microsoft Foundry Discord -yhteisön näkemyksiin perustuen, **45 % kehittäjistä haluaa käyttää AZD:tä AI-työkuormissa**, mutta kohtaa haasteita:
- Monimutkaiset monipalveluisten AI-arkkitehtuurien haasteet
- Parhaat käytännöt AI-tuotantokäyttöönotossa  
- Azure AI -palveluiden integrointi ja konfigurointi
- Kustannusten optimointi AI-työkuormille
- AI-spesifisten käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Suorittamalla tämän rakenteellisen kurssin sinä:
- **Ota AZD-perusteet haltuun**: Peruskäsitteet, asennus ja konfigurointi
- **Ota käyttöön AI-sovelluksia**: Käytä AZD:tä Microsoft Foundryn palveluiden kanssa
- **Ota infrastruktuuri koodina käyttöön**: Hallitse Azure-resursseja Bicep-mallien avulla
- **Vianmääritys**: Ratkaise yleisiä ongelmia ja debuggaa virheitä
- **Optimoi tuotantoon**: Turvallisuus, skaalaus, valvonta ja kustannusten hallinta
- **Rakenna moniagenttisia ratkaisuja**: Ota käyttöön monimutkaisia tekoälyarkkitehtuureja

## Ennen kuin aloitat: Tilit, pääsy ja oletukset

Ennen kuin aloitat luvun 1, varmista että sinulla on seuraavat asiat valmiina. Oppaan myöhemmät asennusvaiheet olettavat, että nämä perusasiat on jo hoidettu.

- **Azure-tilaus**: Voit käyttää olemassa olevaa tilausta työpaikaltasi tai omalta tililtäsi, tai luoda [ilmaisen kokeilun](https://aka.ms/azurefreetrial) aloittaaksesi.
- **Oikeus luoda Azure-resursseja**: Useimmissa harjoituksissa sinulla tulisi olla vähintään **Contributor**-oikeudet kohdetilauksessa tai resurssiryhmässä. Joissain luvuissa oletetaan myös, että voit luoda resurssiryhmiä, hallittuja identiteettejä ja RBAC-määrityksiä.
- [**GitHub-tili**](https://github.com): Tämä on hyödyllinen repositorion haarukoimiseen, omien muutosten seuraamiseen ja GitHub Codespacesin käyttöön työpajassa.
- **Mallien suoritusympäristön vaatimukset**: Jotkut mallit tarvitsevat paikallisia työkaluja kuten Node.js, Python, Java tai Docker. Suorita asennuksen tarkistus ennen aloittamista, jotta huomaat puuttuvat työkalut ajoissa.
- **Perustason komentoriviosaaminen**: Sinun ei tarvitse olla asiantuntija, mutta sinun tulisi olla mukava suorittamaan komentoja kuten `git clone`, `azd auth login` ja `azd up`.

> **Työskenteletkö yritystilausympäristössä?**
> Jos Azure-ympäristöäsi hallinnoi ylläpitäjä, varmista etukäteen, että voit ottaa resurssit käyttöön haluamassasi tilauksessa tai resurssiryhmässä. Jos et voi, pyydä hiekkalaatikkotilausta tai Contributor-oikeuksia ennen aloittamista.

> **Uusi Azureen?**
> Aloita omalla Azure-kokeilu- tai käytön-mukaan-tilauksellasi osoitteessa https://aka.ms/azurefreetrial, jotta voit suorittaa harjoitukset alusta loppuun ilman että odotat vuokratason hyväksyntöjä.

## 🗺️ Kurssikartta: Nopea navigointi lukujen mukaan

Jokaisella luvulla on oma README tiedosto oppimistavoitteineen, pika-aloituksineen ja harjoituksineen:

| Luku | Aihe | Oppitunnit | Kesto | Vaativuus |
|---------|-------|---------|----------|------------|
| **[Luku 1: Perusteet](docs/chapter-01-foundation/README.md)** | Aloittaminen | [AZD Perusteet](docs/chapter-01-foundation/azd-basics.md) &#124; [Asennus](docs/chapter-01-foundation/installation.md) &#124; [Ensimmäinen projekti](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Luku 2: AI-kehitys](docs/chapter-02-ai-development/README.md)** | AI-Ensisijaiset Sovellukset | [Foundry-integraatio](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agentit](docs/chapter-02-ai-development/agents.md) &#124; [Mallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 h | ⭐⭐ |
| **[Luku 3: Konfigurointi](docs/chapter-03-configuration/README.md)** | Tunnistus & Turvallisuus | [Konfigurointi](docs/chapter-03-configuration/configuration.md) &#124; [Tunnistus & Turvallisuus](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Luku 4: Infrastruktuuri](docs/chapter-04-infrastructure/README.md)** | IaC & Käyttöönotto | [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Resurssien tarjoaminen](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 h | ⭐⭐⭐ |
| **[Luku 5: Moniagenttinen](docs/chapter-05-multi-agent/README.md)** | AI-agenttien ratkaisut | [Vähittäiskauppa-skenaario](examples/retail-scenario.md) &#124; [Koordinaatiomallit](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[Luku 6: Ennen käyttöönottoa](docs/chapter-06-pre-deployment/README.md)** | Suunnittelu & Varmistus | [Esilento-tarkastukset](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapsiteettisuunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 h | ⭐⭐ |
| **[Luku 7: Vianmääritys](docs/chapter-07-troubleshooting/README.md)** | Debuggaus & Korjaus | [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debuggaus](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-ongelmat](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 h | ⭐⭐ |
| **[Luku 8: Tuotanto](docs/chapter-08-production/README.md)** | Yritysmallit | [Tuotantokäytännöt](docs/chapter-08-production/production-ai-practices.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[🎓 Työpaja](workshop/README.md)** | Käytännön laboratoriot | [Esittely](workshop/docs/instructions/0-Introduction.md) &#124; [Valinta](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validointi](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Purku](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Mukautus](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Purkaminen](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Lopetus](workshop/docs/instructions/7-Wrap-up.md) | 3-4 h | ⭐⭐ |

**Kurssin kokonaiskesto:** ~10-14 tuntia | **Taitotaso:** Aloittelija → Tuotantovalmius

---

## 📚 Oppimislukujaksot

*Valitse oppimispolkusi kokemustason ja tavoitteiden mukaan*

### 🚀 Luku 1: Perusteet & Pika-aloitus
**Esivaatimukset**: Azure-tilaus, perustason komentoriviosaaminen  
**Kesto**: 30-45 minuuttia  
**Vaativuus**: ⭐

#### Mitä opit
- Ymmärtämään Azure Developer CLI:n perusasioita
- Asentamaan AZD alustallesi
- Ensimmäisen onnistuneen käyttöönoton

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Mikä on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [AZD Perusteet](docs/chapter-01-foundation/azd-basics.md) - Keskeiset käsitteet ja termit
- **⚙️ Asennus**: [Asennus & Määritys](docs/chapter-01-foundation/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön harjoitus**: [Ensimmäinen projektisi](docs/chapter-01-foundation/first-project.md) - vaiheittainen opas
- **📋 Pikaopas**: [Komentojen pikaopas](resources/cheat-sheet.md)

#### Käytännön harjoitukset
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun tulos**: Onnistuneesti otta web-sovellus käyttöön Azureen käyttäen AZD:tä

**✅ Onnistumisen varmistus:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Aika-arvio:** 30-45 minuuttia  
**📈 Taitotaso lopussa:** Pystyy ottamaan perussovelluksia käyttöön itsenäisesti
**📈 Taitotaso lopussa:** Pystyy ottamaan perussovelluksia käyttöön itsenäisesti

---

### 🤖 Luku 2: AI-Ensisijainen kehitys (Suositeltu AI-kehittäjille)
**Esivaatimukset**: Luku 1 suoritettuna  
**Kesto**: 1-2 tuntia  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integrointi AZD:n kanssa
- AI:n voimin toimivien sovellusten käyttöönotto
- AI-palvelujen konfiguroinnin ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Microsoft Foundry -integraatio](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agentit**: [AI-agenttien opas](docs/chapter-02-ai-development/agents.md) - Älykkäiden agenttien käyttöönotto AZD:llä
- **📖 Mallit**: [AI-mallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) - AI-mallien käyttöönotto ja hallinta
- **🛠️ Työpaja**: [AI-työpajalaboratorio](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen opas**: [Työpajamateriaalit](workshop/README.md) - Selaimessa toimiva oppimiskokemus MkDocsilla * DevContainer-ympäristö
- **📋 Mallipohjat**: [Microsoft Foundryn mallit](#featured-microsoft-foundry-templates)
- **📝 Esimerkit**: [AZD-käyttöönottoesimerkit](examples/README.md)

#### Käytännön harjoitukset
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun tulos**: Käyttöönotto ja konfigurointi AI-voimaiselle chat-sovellukselle, jossa on RAG-ominaisuudet

**✅ Onnistumisen varmistus:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Aika-arvio:** 1-2 tuntia  
**📈 Taitotaso lopussa:** Pystyy ottamaan käyttöön ja konfiguroimaan tuotantovalmiita AI-sovelluksia  
**💰 Kustannustietoisuus:** Ymmärtää noin 80-150 $/kk kehityskulut ja 300-3500 $/kk tuotantokulut

#### 💰 Kustannusnäkökohtia AI-käyttöönottoon

**Kehitysympäristö (arviolta 80-150 $/kk):**
- Microsoft Foundry -mallit (pay-as-you-go): 0-50 $/kk (käyttötokenien mukaan)
- AI-haku (perustaso): 75 $/kk
- Container Apps (kulutuksen mukaan): 0-20 $/kk
- Tallennustila (standard): 1-5 $/kk

**Tuotantoympäristö (arviolta 300-3500+ $/kk):**
- Microsoft Foundry -mallit (PTU tasainen suorituskyky): 3000+ $/kk TAI Pay-as-you-go suurella käytöllä
- AI-haku (standardi): 250 $/kk
- Container Apps (omistettu): 50-100 $/kk
- Application Insights: 5-50 $/kk
- Tallennustila (premium): 10-50 $/kk

**💡 Kustannusten optimointivinkkejä:**
- Käytä **Ilmaistasoa** Microsoft Foundryn malleissa oppimiseen (Azure OpenAI sisältää 50 000 tokenia/kk)
- Suorita `azd down` vapauttaaksesi resurssit kun et aktiivisesti kehitä
- Aloita kulutukseen perustuvasta laskutuksesta, päivitys PTU:ksi vain tuotantoon
- Käytä `azd provision --preview` kustannusarvioon ennen käyttöönottoa
- Ota käyttöön automaattinen skaalaus: maksa vain todellisesta käytöstä

**Kustannusten seuranta:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Konfigurointi & Tunnistus
**Esivaatimukset**: Luku 1 suoritettuna  
**Kesto**: 45-60 minuuttia  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Ympäristön konfigurointi ja hallinta
- Tunnistus ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimateriaalit
- **📖 Konfigurointi**: [Konfigurointiopas](docs/chapter-03-configuration/configuration.md) - Ympäristön määritys
- **🔐 Turvallisuus**: [Tunnistusmallit ja hallittu identiteetti](docs/chapter-03-configuration/authsecurity.md) - Tunnistusmallit
- **📝 Esimerkit**: [Tietokantasovellusesimerkki](examples/database-app/README.md) - AZD-tietokantaesimerkkejä

#### Käytännön harjoitukset
- Konfiguroi useita ympäristöjä (dev, staging, prod)
- Ota käyttöön hallittu identiteettitunnistus
- Toteuta ympäristösidonnaiset konfiguraatiot

**💡 Luvun tulos**: Hallitse useita ympäristöjä asianmukaisella tunnistuksella ja turvallisuudella

---

### 🏗️ Luku 4: Infrastruktuuri koodina & Käyttöönotto
**Esivaatimukset**: Luvut 1-3 suoritettuna  
**Kesto**: 1-1.5 tuntia  
**Vaativuus**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönottomallit
- Infrastruktuuri koodina Bicepillä
- Resurssien tarjoamisstrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) - Täydelliset työnkulut
- **🏗️ Resurssien tarjoaminen**: [Resurssien tarjoaminen](docs/chapter-04-infrastructure/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App -esimerkki](../../examples/container-app) - Säilöön pakattujen sovellusten käyttöönotto

#### Käytännön harjoitukset
- Luo omia Bicep-malleja
- Ota käyttöön moni-palvelusovelluksia
- Toteuta sinivihreän käyttöönoton strategioita

**💡 Luvun tulos**: Ota käyttöön monimutkaisia moni-palvelusovelluksia omilla infrastruktuurimalleilla

---

### 🎯 Luku 5: Moniagenttiset AI-ratkaisut (Edistynyt)
**Esivaatimukset**: Luvut 1-2 suoritettuna  
**Kesto**: 2-3 tuntia  
**Vaativuus**: ⭐⭐⭐⭐

#### Mitä opit
- Moniagenttiarkkitehtuurin mallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiiden AI-järjestelmien käyttöönotto

#### Oppimateriaalit
- **🤖 Esittelyprojekti**: [Vähittäiskaupan moniagenttiratkaisu](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM-mallit**: [ARM-mallipaketti](../../examples/retail-multiagent-arm-template) - Yhden klikkauksen käyttöönotto
- **📖 Arkkitehtuuri**: [Moniagenttien koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mallit

#### Käytännön harjoitukset
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Luvun tulos**: Ota käyttöön ja hallitse tuotantovalmiita moniagenttisia AI-ratkaisuja, joissa on Asiakas- ja Varastoagentit

---

### 🔍 Luku 6: Ennen käyttöönottoa - Varmistus & Suunnittelu
**Esivaatimukset**: Luku 4 suoritettuna  
**Kesto**: 1 tunti  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Kapasiteettisuunnittelu ja resurssien varmistus
- SKU-valintastrategiat
- Esitarkastukset ja automaatio

#### Oppimateriaalit
- **📊 Suunnittelu**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resurssien validointi
- **💰 Valinta**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Varmistus**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automaattiset skriptit

#### Käytännön harjoituksia
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten mukaan
- Toteuta automatisoidut esiasennustarkistukset

**💡 Luvun lopputulos**: Varmista ja optimoi käyttöönotot ennen toteutusta

---

### 🚨 Luku 7: Vianmääritys ja debuggaus
**Esivaatimukset**: Mikä tahansa käyttöönottojen luku suoritettu  
**Kesto**: 1-1,5 tuntia  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Järjestelmälliset debuggausmenetelmät
- Yleiset ongelmat ja ratkaisut
- AI-spesifinen vianmääritys

#### Oppimateriaalit
- **🔧 Yleiset ongelmat**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Usein kysytyt kysymykset ja ratkaisut
- **🕵️ Debuggaus**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Vaiheittaiset strategiat
- **🤖 AI-ongelmat**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-palveliongelmat

#### Käytännön harjoituksia
- Diagnosoi käyttöönoton virheet
- Ratkaise todennusongelmat
- Debuggaa AI-palvelun yhteydet

**💡 Luvun lopputulos**: Diagnoosi ja ratkaisu yleisimpiin käyttöönoton ongelmiin itsenäisesti

---

### 🏢 Luku 8: Tuotanto- ja yritysmallit
**Esivaatimukset**: Luvut 1-4 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaativuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantoon liittyvät käyttöönotto strategiat
- Yritysturvallisuusmallit
- Seuranta ja kustannusten optimointi

#### Oppimateriaalit
- **🏭 Tuotanto**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Yritysmallit
- **📝 Esimerkit**: [Microservices Example](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Seuranta**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Seuranta

#### Käytännön harjoituksia
- Toteuta yritysturvallisuusmallit
- Ota käyttöön kattava seuranta
- Käytä tuotantokäyttöön oikealla hallinnalla

**💡 Luvun lopputulos**: Ota käyttöön yritysvalmiit sovellukset täydellä tuotantovalmiudella

---

## 🎓 Työpajan yleiskatsaus: Käytännön oppimiskokemus

> **⚠️ TYÖPAJAN TILA: Kehityksessä**  
> Työpajan materiaalit ovat parhaillaan kehitteillä ja viilattavana. Perusmoduulit toimivat, mutta jotkut edistyneet osiot ovat vielä keskeneräisiä. Teemme aktiivisesti töitä kaikkien sisältöjen saattamiseksi valmiiksi. [Seuraa etenemistä →](workshop/README.md)

### Interaktiiviset työpajamateriaalit
**Kattava käytännön oppiminen selainpohjaisilla työkaluilla ja ohjatulla harjoittelulla**

Työpajamme tarjoaa rakenteellisen, interaktiivisen oppimiskokemuksen, joka täydentää yllä olevaa lukuohjelmaa. Työpaja on suunniteltu sekä itsenäiseen että ohjattuun opiskeluun.

#### 🛠️ Työpajan ominaisuudet
- **Selainpohjainen rajapinta**: Täysin MkDocs-pohjainen työpaja haku-, kopiointi- ja teemaominaisuuksilla
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristön käyttöönotto
- **Rakenteellinen oppimispolku**: 8-moduulinen ohjattu harjoitus (3-4 tuntia yhteensä)
- **Progressiivinen menetelmä**: Johdanto → Valinta → Validointi → Purku → Konfigurointi → Räätälöinti → Purku → Yhteenveto
- **Interaktiivinen DevContainer-ympäristö**: Esikonfiguroidut työkalut ja riippuvuudet

#### 📚 Työpajamoduulien rakenne
Työpaja seuraa **8-moduulista progressiivista menetelmää**, joka vie sinut löytämisestä käyttöönoton hallintaan:

| Moduuli | Aihe | Mitä teet | Kesto |
|--------|-------|-----------|-------|
| **0. Johdanto** | Työpajan yleiskatsaus | Ymmärrä oppimistavoitteet, esivaatimukset ja työpajan rakenne | 15 min |
| **1. Valinta** | Mallipohjien löytö | Tutustu AZD-mallipohjiin ja valitse oikea AI-malli skenaarioosi | 20 min |
| **2. Validointi** | Käyttöönotto ja vahvistus | Ota malli käyttöön `azd up` avulla ja varmista infrastruktuurin toimivuus | 30 min |
| **3. Purku** | Rakenne ymmärrykseen | Käytä GitHub Copilotia mallin arkkitehtuurin, Bicep-tiedostojen ja koodijärjestelyn tutkimiseen | 30 min |
| **4. Konfigurointi** | azure.yaml syväluotaus | Hallitse `azure.yaml`-konfigurointi, elinkaarikoukut ja ympäristömuuttujat | 30 min |
| **5. Räätälöinti** | Tee siitä oma | Ota käyttöön AI-haku, jäljitys, arviointi ja räätälöi skenaarioosi sopivaksi | 45 min |
| **6. Purku** | Siivous | Resurssien turvallinen poisto käyttämällä `azd down --purge` | 15 min |
| **7. Yhteenveto** | Seuraavat askeleet | Tarkastele saavutuksia, keskeisiä käsitteitä ja jatka oppimisprosessia | 15 min |

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
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Työpajan oppimistavoitteet
Työpajan suorittamalla osallistujat:
- **Ota tuotantokäyttöön tekoälysovelluksia**: Käytä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Hallinnoi monitoimistoagenttiratkaisuja**: Toteuta koordinoituja tekoälyagenttien ratkaisuja
- **Toteuta turvallisuuden parhaat käytännöt**: Määritä tunnistus ja pääsynhallinta
- **Optimoi skaalausta varten**: Suunnittele kustannustehokkaita ja suorituskykyisiä käyttöönottoja
- **Ratkaise käyttöönotto-ongelmia**: Korjaa yleisiä ongelmia itsenäisesti

#### 📖 Työpajan materiaalit
- **🎥 Interaktiivinen opas**: [Workshop Materials](workshop/README.md) - Selainpohjainen oppimisympäristö
- **📋 Moduulikohtaiset ohjeet**:
  - [0. Johdanto](workshop/docs/instructions/0-Introduction.md) - Työpajan yleiskatsaus ja tavoitteet
  - [1. Valinta](workshop/docs/instructions/1-Select-AI-Template.md) - Löydä ja valitse tekoälymallipohjia
  - [2. Varmistus](workshop/docs/instructions/2-Validate-AI-Template.md) - Ota mallipohjat käyttöön ja varmista ne
  - [3. Purkaminen](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tutustu mallipohjan arkkitehtuuriin
  - [4. Määritys](workshop/docs/instructions/4-Configure-AI-Template.md) - Hallitse azure.yaml-tiedostoa
  - [5. Mukautus](workshop/docs/instructions/5-Customize-AI-Template.md) - Mukauta omiin tarpeisiisi
  - [6. Purku](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Siivoa resurssit
  - [7. Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) - Tarkista ja seuraavat askeleet
- **🛠️ AI-työpajala**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tekoälyyn keskittyvät harjoitukset
- **💡 Nopea aloitus**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Sopii täydellisesti**: Yrityskoulutukseen, yliopistokursseille, omatoimiseen oppimiseen ja kehittäjäbootcampeihin.

---

## 📖 Syväluotaus: AZD:n ominaisuudet

Perusasioiden lisäksi AZD tarjoaa tehokkaita ominaisuuksia tuotantokäyttöön:

- **Mallipohjaiset käyttöönotot** - Käytä valmiita malleja yleisiin sovelluskuvioihin
- **Infrastruktuuri koodina** - Hallitse Azure-resursseja Bicep- tai Terraform-työkaluilla  
- **Integroitu työnkulku** - Ota sovellukset käyttöön ja valvo niitä saumattomasti
- **Kehittäjäystävällinen** - Optimoitu kehittäjien tuottavuutta ja käyttökokemusta varten

### **AZD + Microsoft Foundry: Täydellinen AI-käyttöönottoihin**

**Miksi AZD AI-ratkaisuille?** AZD vastaa tekoälykehittäjien tärkeimpiin haasteisiin:

- **Tekoälyvalmiit mallipohjat** - Esikonfiguroidut mallit Microsoft Foundry -malleille, Azure AI -palveluille ja ML-kuormille
- **Turvalliset tekoälykäyttöönotot** - Sisäänrakennetut turvallisuuskuviot AI-palveluille, API-avaimille ja mallipäätteille  
- **Tuotantokäyttöön sopivat AI-kuviot** - Parhaat käytännöt skaalautuville ja kustannustehokkaille tekoälysovelluksille
- **End-to-End AI työnkulut** - Mallin kehityksestä tuotantoon asianmukaisella valvonnalla
- **Kustannusten optimointi** - Älykkäät resurssien kohdistus- ja skaalausstrategiat tekoälykuormalle
- **Microsoft Foundryn integraatio** - Saumaton yhteys Microsoft Foundryn malliluetteloon ja päätepisteisiin

---

## 🎯 Mallipohjat ja esimerkkikirjasto

### Esittelyssä: Microsoft Foundryn mallipohjat
**Aloita tästä, jos otat AI-sovelluksia käyttöön!**

> **Huom:** Nämä mallit demonstroivat erilaisia AI-kuvioita. Jotkut ovat ulkoisia Azure Sample -malleja, toiset paikallisia toteutuksia.

| Mallipohja | Luku | Vaativuus | Palvelut | Tyyppi |
|----------|---------|------------|----------|------|
| [**Aloita AI-chatin kanssa**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Aloita AI-agenttien kanssa**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esittelyssä: Täydelliset oppimistilanteet
**Tuotantovalmiit sovellusmallit oppimislukujen mukaan**

| Mallipohja | Oppimisosa | Vaativuus | Keskeinen oppi |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perustason AI-käyttöönoton kuviot |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchillä |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Dokumenttiteknologian integraatio |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja funktiokutsut |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritystason AI-orchestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moniagenttinen arkkitehtuuri asiakas- ja varastoagenteilla |

### Oppiminen esimerkkityypin mukaan

> **📌 Paikalliset vs. ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Valmiita heti käytettäväksi  
> **Ulkopuoliset esimerkit** (Azure Samplet) = Kloonaa linkitetyistä arkistoista

#### Paikalliset esimerkit (valmiina käytettäväksi)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Täydellinen tuotantovalmiiksi toteutus ARM-malleilla
  - Moniagenttiarkkitehtuuri (Customer + Inventory agentit)
  - Kattava valvonta ja arviointi
  - Yhden klikkauksen käyttöönotto ARM-mallin kautta

#### Paikalliset esimerkit - Säiliösovellukset (luvut 2-5)
**Kattavat esimerkit säiliöön pakatuista käyttöönotosta tässä repossa:**
- [**Container App Examples**](examples/container-app/README.md) - Täydellinen opas säiliöityihin käyttöönottoihin
  - [Yksinkertainen Flask API](../../examples/container-app/simple-flask-api) - Perus REST API, skaalaus nollaan
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices) - Tuotantovalmiit monitason käyttöönotot
  - Nopea aloitus, tuotanto ja kehittyneet käyttöönoton kuviot
  - Valvonta, suojaus ja kustannusten optimointi

#### Ulkoiset esimerkit - Yksinkertaiset sovellukset (luvut 1-2)
**Kloonaa nämä Azure Sample -arkistot aloittaaksesi:**
- [Yksinkertainen verkkosovellus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Perus käyttöönoton kuviot
- [Staattinen sivusto - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön käyttöönotto
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API -käyttöönotto

#### Ulkoiset esimerkit - Tietokanta-integraatio (luvut 3-4)  
- [Tietokantasovellus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantayhteyskuviot
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverittömät tietotyönkulut

#### Ulkoiset esimerkit - Kehittyneet kuviot (luvut 4-8)
- [Java Mikropalvelut](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessointi  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit ML-kuviot

### Ulkoiset mallipohjakokoelmat
- [**Virallinen AZD-malligalleria**](https://azure.github.io/awesome-azd/) - Virallisten ja yhteisön mallien kokoelma
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn mallidokumentaatio
- [**Esimerkkihakemisto**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisilla selityksillä

---

## 📚 Oppimateriaalit ja lähteet

### Nopeat viitteet
- [**Komentojen muistilista**](resources/cheat-sheet.md) - Keskeiset azd-komennot luvun mukaan järjestettyinä
- [**Sanasto**](resources/glossary.md) - Azure- ja azd-termit  
- [**UKK**](resources/faq.md) - Yleisiä kysymyksiä oppimisluvuille järjestettyinä
- [**Opas**](resources/study-guide.md) - Laajat harjoitustehtävät

### Käytännön työpajat
- [**AI-työpajatyöpaja**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD:n käyttöön sopivia (2-3 tuntia)
- [**Vuorovaikutteinen työpaja**](workshop/README.md) - 8 moduulin ohjatut harjoitukset MkDocsilla ja GitHub Codespacesilla
  - Seuraa: Johdanto → Valinta → Vahvistus → Purku → Konfigurointi → Mukautus → Lopetus → Yhteenveto

### Ulkoiset oppimateriaalit
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure-hinnoittelulaskuri](https://azure.microsoft.com/pricing/calculator/)
- [Azure-tila](https://status.azure.com/)

### AI-agenttien taidot editorillesi
- [**Microsoft Azure Skills skills.sh-sivustolla**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 avointa agenttiosaamista Azure AI:lle, Foundryl­le, käyttöönotolle, diagnostiikalle, kustannusoptimoinnille ja muille. Asenna ne GitHub Copilotiin, Cursoriin, Claude Codeen tai mihin tahansa tuettuun agenttiin:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Nopea vianetsintäopas

**Yleisiä aloittelijoiden kohtaamia ongelmia ja välittömiä ratkaisuja:**

<details>
<summary><strong>❌ "azd: komentoa ei löydy"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Ei tilausta löytynyt" tai "Tilausta ei asetettu"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" tai "Kiintiö ylitetty"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" epäonnistuu puolivälissä</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Todennus epäonnistui" tai "Token vanhentunut"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Resurssi on jo olemassa" tai nimeämiskonfliktit</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mallin käyttöönotto kestää liian kauan</strong></summary>

**Normaalit odotusajat:**
- Yksinkertainen web-sovellus: 5-10 minuuttia
- Sovellus tietokannalla: 10-15 minuuttia
- AI-sovellukset: 15-25 minuuttia (OpenAI:n käyttöönottaminen on hidasta)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Lupa evätty" tai "Kielletty"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Käytössä olevan sovelluksen URL-osoitetta ei löydy</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Täydelliset vianetsintäresurssit

- **Yleiset ongelmat -opas:** [Yksityiskohtaiset ratkaisut](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-kohtaiset ongelmat:** [AI-vianetsintä](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Virheenetsintäopas:** [Askel askeleelta virheenetsintä](docs/chapter-07-troubleshooting/debugging.md)
- **Apua saatavilla:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suoritus & todistus

### Edistymisen seuranta
Seuraa oppimisesi edistymistä jokaisessa luvussa:

- [ ] **Luku 1**: Perusteet & nopea aloitus ✅
- [ ] **Luku 2**: AI-ensimmäinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & todennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & käyttöönotto ✅
- [ ] **Luku 5**: Moni-agenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Ennen käyttöönottoa tapahtuva validointi & suunnittelu ✅
- [ ] **Luku 7**: Vianetsintä & virheenetsintä ✅
- [ ] **Luku 8**: Tuotanto & yritysmallit ✅

### Oppimisen varmistus
Jokaisen luvun jälkeen varmista osaamisesi:
1. **Käytännön harjoitus**: Suorita luvun käytännön käyttöönotto
2. **Tietotesti**: Käy läpi luvun UKK-osio
3. **Yhteisön keskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavaan vaikeustasoon

### Kurssin suorittamisen edut
Kun kaikki luvut on suoritettu, sinulla on:
- **Tuotantokokemus**: Julkaistu oikeita AI-sovelluksia Azureen
- **Ammatilliset taidot**: Yrityskäyttöön valmiit käyttöönotto-osaamiset  
- **Yhteisön tunnustus**: Aktiivinen Azure-kehittäjäyhteisön jäsen
- **Urapolun edistys**: Kysytyt AZD- ja AI-käyttöönotto-osaamiset

---

## 🤝 Yhteisö & tuki

### Apua ja tukea
- **Tekniset ongelmat**: [Ilmoita virheistä ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord -yhteisö](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-kohtainen apu**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemyksiä Microsoft Foundry Discordista

**Viimeisimmät äänestystulokset #Azure-kanavalta:**
- **45%** kehittäjistä haluaa käyttää AZD:tä AI-kuormiin
- **Suuret haasteet**: Monipalveluiden käyttöönotot, tunnistetietojen hallinta, tuotantovalmius  
- **Eniten pyydetyt**: AI-kohtaiset mallit, vianetsintäoppaat, parhaat käytännöt

**Liity yhteisöömme, jos haluat:**
- Jakaa AZD + AI -kokemuksiasi ja saada apua
- Saada ennakkoesikatseluita uusista AI-malleista
- Osallistua AI-käyttöönoton parhaiden käytäntöjen kehittämiseen
- Vaikuttaa tulevien AI + AZD -ominaisuuksien kehitykseen

### Kurssiin osallistuminen
Otamme mielellämme vastaan panoksia! Lue [Osallistumisopas](CONTRIBUTING.md) saadaksesi lisätietoja:
- **Sisällön parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uudet esimerkit**: Lisää käytännön tilanteita ja malleja  
- **Käännökset**: Auta ylläpitämään monikielistä tukea
- **Virheraportit**: Paranna tarkkuutta ja selkeyttä
- **Yhteisöstandardeja**: Noudata osallistavaa yhteisöpolitiikkaamme

---

## 📄 Kurssitiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - lisätiedot löytyvät [LICENSE](../../LICENSE)-tiedostosta.

### Liittyvät Microsoftin oppimisresurssit

Tiimimme tuottaa myös muita laajoja oppimiskursseja:

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
[![Generative AI aloittelijoille](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Perusopetus
[![ML aloittelijoille](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science aloittelijoille](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI aloittelijoille](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberturvallisuus aloittelijoille](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web-kehitys aloittelijoille](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT aloittelijoille](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-kehitys aloittelijoille](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-sarja
[![Copilot AI-yhdessä ohjelmoinnissa](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET:lle](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-seikkailu](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurssin navigointi

**🚀 Valmiina oppimaan?**

**Aloittelijat**: Aloita [Luvusta 1: Perusasiat & nopea aloitus](#-chapter-1-foundation--quick-start)  
**AI-kehittäjät**: Siirry [Luku 2: AI-ensimmäinen kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kokeneet kehittäjät**: Aloita [Luvusta 3: Konfigurointi & todennus](#️-chapter-3-configuration--authentication)

**Seuraavat askeleet**: [Aloita Luku 1 - AZD:n perusteet](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->