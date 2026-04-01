# AZD Aloittelijoille: Rakenteellinen oppimispolku

![AZD-aloittelijoille](../../translated_images/fi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub seuraajat](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forkit](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub tähdet](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaattiset käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Haluatko kloonata paikallisesti?**
>
> Tämä repositorio sisältää yli 50 käännöstä, mikä kasvattaa latauskokoa merkittävästi. Jos haluat kloonata ilman käännöstiedostoja, käytä sparseta checkoutia:
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
> Tämä antaa sinulle kaiken tarvittavan kurssin suorittamiseen paljon nopeammalla latauksella.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Mitä uutta azd:ssä tänään

Azure Developer CLI on laajentunut perinteisistä web-sovelluksista ja API:ista. Nykyään azd on ainoa työkalu, jolla voit ottaa käyttöön minkä tahansa sovelluksen Azureen — mukaan lukien tekoälyä hyödyntävät sovellukset ja älykkäät agentit.

Tämä tarkoittaa sinulle:

- **AI-agentit ovat nyt ensiluokkaisia azd-työkuormia.** Voit alustaa, ottaa käyttöön ja hallita AI-agenttiprojekteja samalla `azd init` → `azd up` -työnkululla, jonka jo tunnet.
- **Microsoft Foundry -integraatio** tuo mallien käyttöönoton, agenttien isännöinnin ja AI-palveluiden määrityksen suoraan azd-mallit-ekosysteemiin.
- **Ydintyönkulku ei ole muuttunut.** Olipa kyse todo-sovelluksesta, mikropalvelusta tai moniagenttisesta AI-ratkaisusta, komennot ovat samat.

Jos olet käyttänyt azd:tä aiemmin, AI-tuki on luonnollinen laajennus — ei erillinen työkalu tai edistyksellinen polku. Jos aloitat alusta, opit yhden työnkulun, joka toimii kaikkeen.

---

## 🚀 Mikä on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on kehittäjäystävällinen komentorivityökalu, joka tekee sovellusten käyttöönotosta Azureen helppoa. Sen sijaan, että loisit ja yhdistäisit manuaalisesti kymmeniä Azure-resursseja, voit ottaa käyttöön kokonaisia sovelluksia yhdellä komennolla.

### `azd up` -toiminnon taika

```bash
# Tämä yksittäinen komento tekee kaiken:
# ✅ Luo kaikki Azure-resurssit
# ✅ Määrää verkot ja tietoturvan
# ✅ Kääntää sovelluskoodisi
# ✅ Julkaisee Azureen
# ✅ Antaa sinulle toimivan URL-osoitteen
azd up
```

**Siinä se!** Ei Azure-portaalissa klikkailua, ei monimutkaisten ARM-mallien opettelua ensin, ei manuaalista konfigurointia — vain toimivia sovelluksia Azureen.

---

## ❓ Azure Developer CLI vs Azure CLI: Mikä on ero?

Tämä on yleisin kysymys, jonka aloittelijat esittävät. Tässä yksinkertainen vastaus:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Hallitse yksittäisiä Azure-resursseja | Ota käyttöön kokonaisia sovelluksia |
| **Mindset** | Infrastruktuuriin keskittyvä | Sovellukseen keskittyvä |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Vaatii Azure-palvelujen tuntemusta | Tarvitsee vain sovelluksen tuntemuksen |
| **Best For** | DevOps, infrastruktuuri | Kehittäjät, prototypointi |

### Yksinkertainen vertauskuva

- **Azure CLI** on kuin kaikki työkalut talon rakentamiseen — vasarat, sahat, naulat. Voit rakentaa mitä tahansa, mutta sinun täytyy ymmärtää rakentaminen.
- **Azure Developer CLI** on kuin urakoitsijan palkkaaminen — kuvailet mitä haluat, ja he hoitavat rakentamisen.

### Milloin käyttää kumpaakin

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Ne toimivat yhdessä!

AZD käyttää Azure CLI:tä taustalla. Voit käyttää molempia:
```bash
# Ota sovelluksesi käyttöön AZD:n avulla
azd up

# Säädä sitten tiettyjä resursseja Azure CLI:llä
az webapp config set --name myapp --always-on true
```

---

## 🌟 Löydä malleja Awesome AZD:stä

Älä aloita alusta! **Awesome AZD** on yhteisön kokoelma valmiita malleja, jotka ovat heti käyttövalmiita:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Selaa yli 200 mallia ja ota ne käyttöön yhdellä napsautuksella |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Lähetä oma mallisi yhteisölle |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Tähtää ja tutki lähdekoodia |

### Suositut AI-mallit Awesome AZD:stä

```bash
# RAG-chat Microsoft Foundry -malleilla + AI-haku
azd init --template azure-search-openai-demo

# Nopea AI-chat-sovellus
azd init --template openai-chat-app-quickstart

# AI-agentit Foundry-agenttien kanssa
azd init --template get-started-with-ai-agents
```

---

## 🎯 Aloittaminen kolmessa vaiheessa

Ennen kuin aloitat, varmista että koneesi on valmis käyttämään mallia, jonka haluat ottaa käyttöön:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jos jokin vaadituista tarkistuksista epäonnistuu, korjaa se ensin ja jatka sitten pika-askeleesta.

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

# Vaaditaan AZD-työnkuluissa
azd auth login
```

Jos et ole varma, mitä tarvitset, seuraa koko asennus- ja määritysprosessia kohdassa [Asennus ja määritys](docs/chapter-01-foundation/installation.md#authentication-setup).

### Vaihe 3: Ota ensimmäinen sovellus käyttöön

```bash
# Alusta mallipohjasta
azd init --template todo-nodejs-mongo

# Ota käyttöön Azureen (luo kaiken!)
azd up
```

**🎉 Siinä se!** Sovelluksesi on nyt käytössä Azuren palveluissa.

### Siivoaminen (älä unohda!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kuinka käyttää tätä kurssia

Tämä kurssi on suunniteltu **portaittaiseksi oppimiseksi** — aloita siltä tasolta, jossa olet mukavin, ja etene siitä eteenpäin:

| Your Experience | Start Here |
|-----------------|------------|
| **Brand new to Azure** | [Luku 1: Perusteet](#-chapter-1-foundation--quick-start) |
| **Know Azure, new to AZD** | [Luku 1: Perusteet](#-chapter-1-foundation--quick-start) |
| **Want to deploy AI apps** | [Luku 2: AI-ensimmäinen kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Want hands-on practice** | [🎓 Interaktiivinen työpaja](workshop/README.md) - 3–4 tunnin ohjattu laboratorio |
| **Need production patterns** | [Luku 8: Tuotanto & yritysratkaisut](#-chapter-8-production--enterprise-patterns) |

### Pikainen asennus

1. **Forkkaa tämä repository**: [![GitHub forkit](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa se**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hanki apua**: [Azure Discord -yhteisö](https://discord.com/invite/ByRwuEEgH4)

> **Haluatko kloonata paikallisesti?**
>
> Tämä repositorio sisältää yli 50 käännöstä, mikä kasvattaa latauskokoa merkittävästi. Jos haluat kloonata ilman käännöstiedostoja, käytä sparseta checkoutia:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tämä antaa sinulle kaiken tarvittavan kurssin suorittamiseen paljon nopeammalla latauksella.


## Kurssin yleiskatsaus

Hallitse Azure Developer CLI (azd) rakenteellisten lukujen kautta, jotka on suunniteltu portaittaista oppimista varten. **Erityinen painotus AI-sovellusten käyttöönotossa Microsoft Foundry -integraation kanssa.**

### Miksi tämä kurssi on oleellinen nykyaikaisille kehittäjille

Microsoft Foundry Discord -yhteisön näkemyksiin perustuen **45 % kehittäjistä haluaa käyttää AZD:tä AI-työkuormiin**, mutta he kohtaavat haasteita:
- Monimutkaiset monipalveluiset AI-arkkitehtuurit
- Tuotantovalmiiden AI-järjestelmien käyttöönoton parhaat käytännöt
- Azure AI -palvelujen integrointi ja määritys
- Kustannusten optimointi AI-työkuormille
- AI-spesifisten käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Suorittamalla tämän rakenteellisen kurssin:
- **Hallinnoi AZD:n perusteet**: ydinajatusmallit, asennus ja konfigurointi
- **Ota AI-sovelluksia käyttöön**: käytä AZD:tä Microsoft Foundry -palvelujen kanssa
- **Ota käyttöön Infrastructure as Code**: hallitse Azure-resursseja Bicep-mallien avulla
- **Vianmääritys käyttöönotossa**: ratkaise yleisiä ongelmia ja debuggaa virheitä
- **Optimoi tuotantokäyttöön**: turvallisuus, skaalaus, valvonta ja kustannusten hallinta
- **Rakenna moniagenttisia ratkaisuja**: ota käyttöön monimutkaisia AI-arkkitehtuureja

## Ennen kuin aloitat: tilit, käyttöoikeudet ja oletukset

Ennen kuin aloitat luvun 1, varmista että sinulla on seuraavat asiat kunnan. Tämän oppaan myöhemmät asennusvaiheet olettavat, että nämä perusasiat on jo hoidettu.
- **Azure-tilaus**: Voit käyttää olemassa olevaa tilausta työpaikalta tai omalta tililtäsi, tai luoda [free trial](https://aka.ms/azurefreetrial) aloittaaksesi.
- **Oikeudet Azure-resurssien luomiseen**: Useimpiin harjoituksiin tarvitset vähintään **Contributor**-käyttöoikeuden kohdetilaukseen tai resurssiryhmään. Joissakin luvuissa saatetaan myös olettaa, että voit luoda resurssiryhmiä, hallittuja identiteettejä ja RBAC-tehtäviä.
- [**GitHub-tili**](https://github.com): Tämä on hyödyllinen repositorion forkkaamiseen, omien muutosten seuraamiseen ja GitHub Codespacesin käyttämiseen työpajassa.
- **Mallipohjan ajonaikaiset vaatimukset**: Jotkin mallipohjat tarvitsevat paikallisia työkaluja, kuten Node.js, Python, Java tai Docker. Suorita asennuksen tarkistus ennen aloittamista, jotta havaitset puuttuvat työkalut ajoissa.
- **Perustason komentorivin tuntemus**: Et tarvitse asiantuntijan tasoa, mutta sinun tulisi osata ajaa komentoja kuten `git clone`, `azd auth login` ja `azd up`.

> **Työskenteletkö yritystilin alla?**
> Jos Azure-ympäristöäsi hallinnoi järjestelmänvalvoja, varmista etukäteen, että voit ottaa resursseja käyttöön siinä tilauksessa tai resurssiryhmässä, jota aiot käyttää. Jos et voi, pyydä sandbox-tilausta tai Contributor-oikeuksia ennen aloittamista.

> **Uusi Azureen?**
> Aloita omalla Azure-kokeilutilauksellasi tai pay-as-you-go -tilauksella osoitteessa https://aka.ms/azurefreetrial, jotta voit suorittaa harjoitukset kokonaisuudessaan ilman vuokraaja-tason hyväksyntöjä.

## 🗺️ Kurssikartta: Pikainen navigointi lukujen mukaan

Jokaisella luvulla on oma README, jossa on oppimistavoitteet, pikapikaohjeet ja harjoitukset:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Luku 1: Perusta](docs/chapter-01-foundation/README.md)** | Aloittaminen | [AZD-perusteet](docs/chapter-01-foundation/azd-basics.md) &#124; [Asennus](docs/chapter-01-foundation/installation.md) &#124; [Ensimmäinen projektisi](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Luku 2: AI-kehitys](docs/chapter-02-ai-development/README.md)** | AI-ensisijaiset sovellukset | [Foundry-integrointi](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agentit](docs/chapter-02-ai-development/agents.md) &#124; [AI-mallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Luku 3: Konfigurointi](docs/chapter-03-configuration/README.md)** | Autentikointi ja turvallisuus | [Konfigurointi](docs/chapter-03-configuration/configuration.md) &#124; [Autentikointi ja turvallisuus](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Luku 4: Infrastruktuuri](docs/chapter-04-infrastructure/README.md)** | IaC ja käyttöönotto | [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisiointi](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Luku 5: Moni-agentti](docs/chapter-05-multi-agent/README.md)** | AI-agenttiratkaisut | [Vähittäiskaupan skenaario](examples/retail-scenario.md) &#124; [Koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Luku 6: Ennen käyttöönottoa](docs/chapter-06-pre-deployment/README.md)** | Suunnittelu ja validointi | [Esitarkastukset](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasiteettisuunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Luku 7: Vianetsintä](docs/chapter-07-troubleshooting/README.md)** | Debuggaus & korjaus | [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debuggaus](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-ongelmat](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Luku 8: Tuotanto](docs/chapter-08-production/README.md)** | Yrityskäytännöt | [Tuotantokäytännöt](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Työpaja](workshop/README.md)** | Käytännön harjoitus | [Johdanto](workshop/docs/instructions/0-Introduction.md) &#124; [Valinta](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validointi](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Purku](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Muokkaus](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Infrastruktuurin purku](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Kurssin kokonaiskesto:** ~10-14 tuntia | **Taitojen eteneminen:** Aloittelija → Tuotantovalmius

---

## 📚 Oppimislukujen sisältö

*Valitse oppimispolku kokemustason ja tavoitteiden mukaan*

### 🚀 Luku 1: Perusta & Pikakäynnistys
**Esivaatimukset**: Azure-tilaus, perustason komentorivin tuntemus  
**Kesto**: 30-45 minuuttia  
**Monimutkaisuus**: ⭐

#### Mitä opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen omalle alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Mikä on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [AZD-perusteet](docs/chapter-01-foundation/azd-basics.md) - Peruskäsitteet ja terminologia
- **⚙️ Asennus**: [Asennus & käyttöönotto](docs/chapter-01-foundation/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön harjoitus**: [Ensimmäinen projektisi](docs/chapter-01-foundation/first-project.md) - Askel askeleelta -opas
- **📋 Pikaviite**: [Komentojen pikalista](resources/cheat-sheet.md)

#### Käytännön harjoitukset
```bash
# Nopea asennustarkistus
azd version

# Ota ensimmäinen sovelluksesi käyttöön
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun lopputulos**: Ota onnistuneesti käyttöön yksinkertainen web-sovellus Azureen käyttäen AZD:ta

**✅ Onnistumisen validointi:**
```bash
# Luvun 1 suorittamisen jälkeen sinun pitäisi osata:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Aika-arvio:** 30-45 minuuttia  
**📈 Taitotaso tämän jälkeen:** Pystyy ottamaan käyttöön perustason sovelluksia itsenäisesti  
**📈 Taitotaso tämän jälkeen:** Pystyy ottamaan käyttöön perustason sovelluksia itsenäisesti

---

### 🤖 Luku 2: AI-ensisuuntautunut kehitys (Suositellaan AI-kehittäjille)
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 1-2 tuntia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integrointi AZD:hen
- AI-ominaisuuksilla varustettujen sovellusten käyttöönotto
- AI-palvelukonfiguraatioiden ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Microsoft Foundry -integrointi](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agentit**: [AI-agenttien opas](docs/chapter-02-ai-development/agents.md) - Ota käyttöön älykkäitä agenteja AZD:llä
- **📖 Mallit**: [AI-mallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) - Ota käyttöön ja hallinnoi AI-malleja
- **🛠️ Työpaja**: [AI-työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen opas**: [Työpajamateriaali](workshop/README.md) - Selainpohjaista oppimista MkDocsilla * DevContainer -ympäristö
- **📋 Mallipohjat**: [Microsoft Foundry -mallit](#työpajaresurssit)
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

**💡 Luvun lopputulos**: Ota käyttöön ja konfiguroi AI-voimainen chat-sovellus RAG-ominaisuuksilla

**✅ Onnistumisen validointi:**
```bash
# Luvun 2 jälkeen sinun pitäisi osata:
azd init --template azure-search-openai-demo
azd up
# Testata tekoälychatin käyttöliittymää
# Esittää kysymyksiä ja saada tekoälypohjaisia vastauksia lähteineen
# Varmistaa, että hakuintegraatio toimii
azd monitor  # Tarkistaa, että Application Insights näyttää telemetriatiedot
azd down --force --purge
```

**📊 Aika-arvio:** 1-2 tuntia  
**📈 Taitotaso tämän jälkeen:** Pystyy ottamaan käyttöön ja konfiguroimaan tuotantovalmiita AI-sovelluksia  
**💰 Kustannustietoisuus:** Ymmärrä $80-150/month kehityskustannukset, $300-3500/month tuotantokustannukset

#### 💰 Kustannusnäkökohdat AI-käyttöönotossa

**Kehitysympäristö (arvio $80-150/kk):**
- Microsoft Foundry -mallit (Pay-as-you-go): $0-50/kk (perustuu token-käyttöön)
- AI Search (Basic-taso): $75/kk
- Container Apps (Consumption): $0-20/kk
- Tallennustila (Standard): $1-5/kk

**Tuotantoympäristö (arvio $300-3,500+/kk):**
- Microsoft Foundry -mallit (PTU tasaisen suorituskyvyn takaamiseksi): $3,000+/kk TAI Pay-as-you-go kovalla volyymilla
- AI Search (Standard-taso): $250/kk
- Container Apps (Dedicated): $50-100/kk
- Application Insights: $5-50/kk
- Tallennustila (Premium): $10-50/kk

**💡 Kustannusten optimointivinkit:**
- Käytä **Free Tier** Microsoft Foundry -malleja oppimiseen (Azure OpenAI 50,000 tokens/month included)
- Suorita `azd down` vapauttaaksesi resursseja, kun et aktiivisesti kehitä
- Aloita kulutukseen perustuvalla laskutuksella, nosta PTU:hun vain tuotannossa
- Käytä `azd provision --preview` arvioidaksesi kustannuksia ennen käyttöönottoa
- Ota käyttöön automaattinen skaalaus: maksa vain todellisesta käytöstä

**Kustannusten seuranta:**
```bash
# Tarkista arvioidut kuukausikustannukset
azd provision --preview

# Seuraa todellisia kustannuksia Azure-portaalissa
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Konfigurointi ja autentikointi
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 45-60 minuuttia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Ympäristön konfigurointi ja hallinta
- Autentikointi ja tietoturvan parhaat käytännöt
- Resurssien nimeäminen ja jäsentely

#### Oppimateriaalit
- **📖 Konfigurointi**: [Konfigurointiopas](docs/chapter-03-configuration/configuration.md) - Ympäristön asetukset
- **🔐 Turvallisuus**: [Autentikointimallit ja hallinnoitu identiteetti](docs/chapter-03-configuration/authsecurity.md) - Autentikointimallit
- **📝 Esimerkit**: [Tietokantasovellus-esimerkki](examples/database-app/README.md) - AZD-tietokantaesimerkit

#### Käytännön harjoitukset
- Konfiguroi useita ympäristöjä (dev, staging, prod)
- Ota käyttöön hallinnoitu identiteetin autentikointi
- Toteuta ympäristökohtaiset konfiguraatiot

**💡 Luvun lopputulos**: Hallitse useita ympäristöjä asianmukaisella autentikoinnilla ja tietoturvalla

---

### 🏗️ Luku 4: Infrastruktuuri koodina & käyttöönotto
**Esivaatimukset**: Luvut 1-3 suoritettu  
**Kesto**: 1-1.5 tuntia  
**Monimutkaisuus**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönotto-mallit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisiointistrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) - Täydelliset työnkulut
- **🏗️ Provisiointi**: [Resurssien provisiointi](docs/chapter-04-infrastructure/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App -esimerkki](../../examples/container-app) - Konttipohjaiset käyttöönotot

#### Käytännön harjoitukset
- Luo mukautettuja Bicep-malleja
- Ota käyttöön monipalvelu-sovelluksia
- Ota käyttöön blue-green -käyttöönotto-strategioita

**💡 Luvun lopputulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia käyttämällä mukautettuja infrastruktuurimalleja

---

### 🎯 Luku 5: Moni-agenttiset AI-ratkaisut (Edistynyt)
**Esivaatimukset**: Luvut 1-2 suoritettu  
**Kesto**: 2-3 tuntia  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Moni-agentti-arkkitehtuurimallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit AI-käyttöönotot

#### Oppimateriaalit
- **🤖 Esitelty projekti**: [Vähittäiskaupan moni-agenttiratkaisu](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM-mallit**: [ARM-mallipaketti](../../examples/retail-multiagent-arm-template) - Yhdellä klikkauksella käyttöönotto
- **📖 Arkkitehtuuri**: [Moni-agentin koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mallit

#### Käytännön harjoitukset
```bash
# Ota käyttöön täydellinen vähittäiskaupan moniagenttinen ratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutki agenttien kokoonpanoja
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Luvun lopputulos**: Ota käyttöön ja hallinnoi tuotantovalmista moni-agenttista AI-ratkaisua Customer- ja Inventory-agenteilla

---

### 🔍 Luku 6: Ennen käyttöönottoa – validointi ja suunnittelu
**Esivaatimukset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Monimutkaisuus**: ⭐⭐
#### Mitä opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Ennakkotarkistukset ja automaatio

#### Oppimateriaalit
- **📊 Suunnittelu**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resurssien validointi
- **💰 Valinta**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Validointi**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automaattiset skriptit

#### Käytännön harjoitukset
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten mukaan
- Toteuta automatisoituja ennakkokäyttöönoton tarkistuksia

**💡 Luvun tulos**: Varmista ja optimoi käyttöönotot ennen toteutusta

---

### 🚨 Luku 7: Vianmääritys ja virheiden etsintä
**Esivaatimukset**: Mikä tahansa käyttöönottoa käsittelevä luku suoritettu  
**Kesto**: 1–1,5 tuntia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Järjestelmälliset virheiden etsintämenetelmät
- Yleisimmät ongelmat ja ratkaisut
- Tekoälyyn liittyvä vianmääritys

#### Oppimateriaalit
- **🔧 Yleiset ongelmat**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - UKK ja ratkaisut
- **🕵️ Virheiden etsintä**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Vaiheittaiset strategiat
- **🤖 Tekoälyongelmat**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Tekoälypalveluiden ongelmat

#### Käytännön harjoitukset
- Diagnosoi käyttöönoton epäonnistumiset
- Ratkaise todennusongelmat
- Etsi ja korjaa tekoälypalvelun yhteysongelmat

**💡 Luvun tulos**: Pystyt itsenäisesti diagnosoimaan ja ratkaisemaan yleiset käyttöönottoon liittyvät ongelmat

---

### 🏢 Luku 8: Tuotanto- ja yritysmallit
**Esivaatimukset**: Luvut 1–4 suoritetut  
**Kesto**: 2–3 tuntia  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritystason suojausmallit
- Valvonta ja kustannusten optimointi

#### Oppimateriaalit
- **🏭 Tuotanto**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Yritysmallit
- **📝 Esimerkit**: [Microservices Example](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Valvonta**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Valvonta

#### Käytännön harjoitukset
- Toteuta yritystason suojausmalleja
- Ota käyttöön kattava valvonta
- Ota käyttöönotto tuotantoon asianmukaisen hallinnon puitteissa

**💡 Luvun tulos**: Ota käyttöön yritysvalmiita sovelluksia, joilla on täysi tuotantokapasiteetti

---

## 🎓 Workshopin yleiskatsaus: Käytännön oppimiskokemus

> **⚠️ WORKSHOP STATUS: Kehitteillä**  
> Työpajan materiaalit ovat tällä hetkellä kehitteillä ja viimeistelyvaiheessa. Ydinmoduulit toimivat, mutta jotkin edistyneemmät osiot ovat keskeneräisiä. Työskentelemme aktiivisesti kaikkien sisältöjen täydentämiseksi. [Seuraa edistymistä →](workshop/README.md)

### Interaktiiviset työpajamateriaalit
**Kattava käytännön oppimiskokemus selainpohjaisilla työkaluilla ja ohjatuilla harjoituksilla**

Työpajan materiaalit tarjoavat rakenteellisen, interaktiivisen oppimiskokemuksen, joka täydentää yllä olevia lukuja. Työpaja on suunniteltu sekä itsenäiseen opiskeluun että ohjattuihin sessioihin.

#### 🛠️ Työpajan ominaisuudet
- **Selaimessa toimiva käyttöliittymä**: Täydellinen MkDocs-pohjainen työpaja hakutoiminnolla, kopioinnilla ja teemavalinnoilla
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristön käyttöönotto
- **Rakenettu oppimispolku**: 8-moduulinen ohjattu harjoitus (yhteensä 3–4 tuntia)
- **Johdonmukainen metodologia**: Johdanto → Valinta → Validointi → Pureminen → Konfigurointi → Räätälöinti → Purku → Yhteenveto
- **Interaktiivinen DevContainer-ympäristö**: Esikonfiguroidut työkalut ja riippuvuudet

#### 📚 Työpajan moduulirakenne
Työpaja noudattaa **8-moduulista johdonmukaista metodologiaa**, joka vie sinut löytämisestä käyttöönoton hallintaan:

| Moduuli | Aihe | Mitä teet | Kesto |
|--------|-------|----------------|----------|
| **0. Johdanto** | Työpajan yleiskatsaus | Ymmärrä oppimistavoitteet, esivaatimukset ja työpajan rakenne | 15 min |
| **1. Valinta** | Mallin löytäminen | Tutki AZD-malleja ja valitse oikea AI-malli tilanteeseesi | 20 min |
| **2. Validointi** | Ota käyttöön ja varmista | Ota malli käyttöön komennolla `azd up` ja varmista infrastruktuurin toimivuus | 30 min |
| **3. Rakenneanalyysi** | Ymmärrä rakenne | Käytä GitHub Copilotia tutkiaksesi mallin arkkitehtuuria, Bicep-tiedostoja ja koodin järjestelyä | 30 min |
| **4. Konfigurointi** | azure.yaml syväluotaus | Hallitse `azure.yaml`-konfiguraatio, elinkaarikoukut ja ympäristömuuttujat | 30 min |
| **5. Räätälöinti** | Tee siitä oma | Ota käyttöön AI-haku, jäljitys, arviointi ja räätälöi tilanteeseesi | 45 min |
| **6. Purku** | Siivous | Poista resurssit turvallisesti komennolla `azd down --purge` | 15 min |
| **7. Yhteenveto** | Seuraavat askeleet | Käy läpi saavutukset, keskeiset käsitteet ja jatka oppimismatkaa | 15 min |

**Työpajan kulku:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Aloittaminen työpajan kanssa
```bash
# Vaihtoehto 1: GitHub Codespaces (suositeltu)
# Napsauta arkistossa "Code" → "Create codespace on main"

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Noudata asennusohjeita tiedostossa workshop/README.md
```

#### 🎯 Työpajan oppimistulokset
Työpajan suorittamalla osallistujat:
- **Ota käyttöön tuotannon AI-sovelluksia**: Käytä AZD:tä Microsoft Foundryn palveluiden kanssa
- **Hallitse moni-agenttiarkkitehtuurit**: Toteuta koordinoituja tekoälyagenttiratkaisuja
- **Ota käyttöön tietoturvan parhaat käytännöt**: Konfiguroi todennus ja käyttöoikeuksien hallinta
- **Optimoi skaalautuvuutta varten**: Suunnittele kustannustehokkaita ja suorituskykyisiä käyttöönottoja
- **Vianmääritys käyttöönottoihin**: Ratkaise yleiset ongelmat itsenäisesti

#### 📖 Työpajaresurssit
- **🎥 Interaktiivinen opas**: [Workshop Materials](workshop/README.md) - Selainpohjainen oppimisympäristö
- **📋 Moduuli-kohtaiset ohjeet**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Työpajan yleiskatsaus ja tavoitteet
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Etsi ja valitse AI-mallit
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Ota mallit käyttöön ja varmista toimivuus
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tutki mallin arkkitehtuuria
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Hallitse `azure.yaml`
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Räätälöi tilanteeseesi sopivaksi
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Siivoa resurssit
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Kertaus ja seuraavat askeleet
- **🛠️ AI-työpajalaboratorio**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tekoälyyn keskittyvät harjoitukset
- **💡 Pika-aloitus**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Täydellinen kohderyhmälle**: Yrityskoulutus, yliopistokurssit, itsenäinen opiskelu ja kehittäjäbootcampit.

---

## 📖 Syventävä katsaus: AZD:n ominaisuudet

Perusasioiden lisäksi AZD tarjoaa tehokkaita ominaisuuksia tuotantokäyttöönottoihin:

- **Mallipohjaiset käyttöönotot** - Käytä valmiiksi rakennettuja malleja yleisiin sovelluskuvioihin
- **Infrastructure as Code** - Hallitse Azure-resursseja Bicepillä tai Terraformilla  
- **Integroitu työnkulku** - Provisionoi, ota käyttöön ja valvo sovelluksia saumattomasti
- **Kehittäjäystävällinen** - Optimoitu kehittäjätuottavuuteen ja käyttökokemukseen

### **AZD + Microsoft Foundry: Täydellinen tekoälykäyttöönottoihin**

**Miksi AZD tekoälyratkaisuihin?** AZD vastaa tekoälykehittäjien yleisimpiin haasteisiin:

- **AI-valmiit mallit** - Esikonfiguroidut mallit Microsoft Foundry -malleille, Cognitive Servicesille ja ML-kuormille
- **Turvalliset AI-käyttöönotot** - Sisäänrakennetut suojausmallit AI-palveluille, API-avaimille ja mallipäätteille  
- **Tuotannon AI-mallit** - Parhaat käytännöt skaalautuviin, kustannustehokkaisiin AI-sovelluksiin
- **End-to-End AI-työnkulut** - Mallikehityksestä tuotantoon seurantaan saakka
- **Kustannusoptimointi** - Älykkäät resurssien allokointi- ja skaalausstrategiat AI-kuormille
- **Microsoft Foundry -integraatio** - Saumaton yhteys Microsoft Foundryn mallikatalogiin ja päätepisteisiin

---

## 🎯 Mallien & esimerkkien kirjasto

### Esittelyssä: Microsoft Foundry -mallit
**Aloita tästä, jos olet ottamassa käyttöön tekoälysovelluksia!**

> **Huom:** Nämä mallit esittelevät erilaisia AI-kuvioita. Osa on Azure Samples -ulkoisia, toiset paikallisia toteutuksia.

| Malli | Luku | Monimutkaisuus | Palvelut | Tyyppi |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ulkoinen |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esittelyssä: Valmiit oppimistapaukset
**Tuotantovalmiit sovellusmallit yhdistettynä lukuihin**

| Malli | Oppiluku | Monimutkaisuus | Keskeinen oppi |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perus AI-käyttöönottojen mallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchin kanssa |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Document Intelligence -integraatio |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agent-kehys ja function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritystason AI-orchestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moni-agenttiarkkitehtuuri Customer- ja Inventory-agenteilla |

### Oppiminen esimerkkien avulla

> **📌 Paikalliset vs. ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Valmiit käytettäväksi heti  
> **Ulkoiset esimerkit** (Azure Samples) = Kloonaa linkatuista reposta

#### Paikalliset esimerkit (Valmiit käytettäväksi)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Täydellinen tuotantovalmiin toteutus ARM-malleilla
  - Moni-agenttiarkkitehtuuri (Customer + Inventory -agentit)
  - Kattava valvonta ja arviointi
  - Yhden klikkauksen käyttöönotto ARM-mallin kautta

#### Paikalliset esimerkit - Container-sovellukset (Luvut 2–5)
**Kattavat konttikäyttöönottoesimerkit tässä repossa:**
- [**Container App Examples**](examples/container-app/README.md) - Täydellinen opas konttipohjaisiin käyttöönottoihin
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Perus REST-API scale-to-zero -ominaisuudella
  - [Microservices Architecture](../../examples/container-app/microservices) - Tuotantovalmiiksi monipalveluinen käyttöönotto
  - Quick Start, Production ja Advanced -käyttöönottojen mallit
  - Valvonta, turvallisuus ja kustannusoptimoinnin ohjeet

#### Ulkoiset esimerkit - Yksinkertaiset sovellukset (Luvut 1–2)
**Kloonaa nämä Azure Samples -repot päästäksesi alkuun:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Peruskäyttöönoton mallit
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön käyttöönotto
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API-käyttöönotto

#### Ulkoiset esimerkit - Tietokantaintegraatio (Luku 3-4)  
- [Tietokantasovellus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantayhteysmallit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serveriton datan työnkulku

#### Ulkoiset esimerkit - Kehittyneet mallit (luvut 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessointi  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit ML-mallit

### Ulkoiset mallikokoelmat
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuratoitu kokoelma virallisia ja yhteisön malleja
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Examples Directory**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisine selityksineen

---

## 📚 Oppimateriaalit ja viitteet

### Pikaviitteet
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Keskeiset azd-komennot järjestettyinä luvuittain
- [**Glossary**](resources/glossary.md) - Azure- ja azd-terminologia  
- [**FAQ**](resources/faq.md) - Yleisimmät kysymykset järjestettynä oppimislukuittain
- [**Study Guide**](resources/study-guide.md) - Kattavat harjoitustehtävät

### Käytännön työpajat
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee tekoälyratkaisuistasi AZD:n avulla otettavissa käyttöön (2-3 hours)
- [**Interactive Workshop**](workshop/README.md) - 8-moduulinen opastettu harjoitussarja MkDocsilla ja GitHub Codespacesilla
  - Sisältää: Johdanto → Valinta → Vahvistus → Rakenteen purku → Konfigurointi → Mukauttaminen → Purkutoimet → Yhteenveto

### Ulkoiset oppimisresurssit
- Azure Developer CLI -dokumentaatio: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure-arkkitehtuurikeskus: https://learn.microsoft.com/en-us/azure/architecture/
- Azure-hinnoittelulaskuri: https://azure.microsoft.com/pricing/calculator/
- Azure-palveluiden tila: https://status.azure.com/

### AI-agenttien taidot editorillesi
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 avointa agenttitaitoa Azure AI:lle, Foundrylle, käyttöönotolle, diagnostiikalle, kustannusoptimoinnille ja muille. Asenna ne GitHub Copilotiin, Cursoriin, Claude Codeen tai mihin tahansa tuettuun agenttiin:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Pikainen vianetsintäopas

**Yleisimmät aloittelijoiden kohtaamat ongelmat ja nopeita ratkaisuja:**

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

# Varmista asennus
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Listaa saatavilla olevat tilaukset
az account list --output table

# Aseta oletustilaus
az account set --subscription "<subscription-id-or-name>"

# Aseta AZD-ympäristöä varten
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

# Vaihtoehto 4: Tarkista lokit Azure Monitorista
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Kirjaudu uudelleen AZD:lle
azd auth logout
azd auth login

# Valinnainen: päivitä myös Azure CLI, jos suoritat az-komentoja
az logout
az login

# Tarkista todennus
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD luo yksilöllisiä nimiä, mutta jos syntyy ristiriita:
azd down --force --purge

# Sitten yritä uudelleen uudessa ympäristössä
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normaalit odotusajat:**
- Yksinkertainen web-sovellus: 5-10 minuuttia
- Sovellus tietokannalla: 10-15 minuuttia
- AI-sovellukset: 15-25 minuuttia (OpenAI:n provisiointi on hidasta)

```bash
# Tarkista edistyminen
azd show

# Jos jumissa yli 30 minuuttia, tarkista Azure-portaali:
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
# - User Access Administrator (roolimäärityksiä varten)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Näytä kaikkien palveluiden päätepisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```
</details>

### 📚 Kattavat vianetsintäresurssit

- **Yleisimmät ongelmat – opas:** [Yksityiskohtaiset ratkaisut](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spesifiset ongelmat:** [AI-vianetsintä](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debuggausopas:** [Vaiheittainen virheenkorjaus](docs/chapter-07-troubleshooting/debugging.md)
- **Hae apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suoritus ja sertifiointi

### Edistymisen seuranta
Seuraa oppimisesi edistymistä kunkin luvun kohdalla:

- [ ] **Luku 1**: Perusteet & nopea aloitus ✅
- [ ] **Luku 2**: AI-lähtöinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & todennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Ennakkovalidointi & suunnittelu ennen käyttöönottoa ✅
- [ ] **Luku 7**: Vianetsintä & virheenkorjaus ✅
- [ ] **Luku 8**: Tuotanto- ja yritysmallit ✅

### Oppimisen varmistus
Kun olet suorittanut kunkin luvun, varmista osaamisesi seuraavasti:
1. **Käytännön harjoitus**: Suorita luvun käytännön käyttöönotto
2. **Tiedon tarkistus**: Käy läpi luvun UKK-osio
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavalle vaikeustasolle

### Kurssin suorittamisen hyödyt
Kun olet suorittanut kaikki luvut, sinulla on:
- **Tuotantokokemus**: Olet ottanut käyttöön todellisia AI-sovelluksia Azureen
- **Ammatilliset taidot**: Yritysvalmiit käyttöönotto‑taidot  
- **Yhteisön tunnustus**: Aktiivinen jäsen Azure-kehittäjäyhteisössä
- **Uraedut**: Kysytyt AZD- ja AI-käyttöönotto-osaamiset

---

## 🤝 Yhteisö & tuki

### Hanki apua & tukea
- **Tekniset ongelmat**: [Ilmoita bugeista ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spesifinen apu**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Virallinen Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemyksiä Microsoft Foundry Discordista

**Viimeaikaiset äänestystulokset #Azure-kanavalta:**
- **45%** kehittäjistä haluaa käyttää AZD:tä AI-työkuormiin
- **Suurimmat haasteet**: Monipalveluiden käyttöönotot, tunnistetietojen hallinta, tuotantovalmius  
- **Eniten pyydetyt**: AI-spesifiset mallit, vianetsintäoppaat, parhaat käytännöt

**Liity yhteisöömme saadaksesi:**
- Jaa AZD + AI -kokemuksiasi ja saa apua
- Pääsy uusien AI-mallien varhaisiin esikatseluihin
- Osallistu AI-käyttöönoton parhaiden käytäntöjen kehittämiseen
- Vaikuta tulevaan AI + AZD -ominaisuuksien kehitykseen

### Osallistuminen kurssin kehittämiseen
Olemme iloisia panoksestasi! Lue [Osallistumisohjeet](CONTRIBUTING.md) saadaksesi lisätietoja:
- **Sisällön parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uudet esimerkit**: Lisää reaalimaailman tilanteita ja malleja  
- **Käännökset**: Auta ylläpitämään monikielistä tukea
- **Bugiraportit**: Paranna tarkkuutta ja selkeyttä
- **Yhteisön käytännöt**: Noudata inklusiivisia yhteisöohjeitamme

---

## 📄 Kurssin tiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - katso lisätiedot tiedostosta [LICENSE](../../LICENSE).

### Muut Microsoftin oppimateriaalit

Tiimimme tuottaa muita kattavia oppimiskursseja:

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
 
### Generatiivinen AI -sarja
[![Generatiivinen AI aloittelijoille](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Perusopinnot
[![Koneoppiminen aloittelijoille](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data-analytiikka aloittelijoille](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Tekoäly aloittelijoille](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberturvallisuus aloittelijoille](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Verkkokehitys aloittelijoille](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT aloittelijoille](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-kehitys aloittelijoille](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-sarja
[![Copilot tekoälypariohjelmointiin](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET:lle](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-seikkailu](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurssin navigointi

**🚀 Valmiina aloittamaan oppimisen?**

**Aloittelijat**: Aloita [Luku 1: Perusta & Pika-aloitus](#-chapter-1-foundation--quick-start)  
**Tekoälykehittäjät**: Siirry kohtaan [Luku 2: Tekoälylähtöinen kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kokeneet kehittäjät**: Aloita [Luku 3: Konfigurointi & Autentikointi](#️-chapter-3-configuration--authentication)

**Seuraavat vaiheet**: [Aloita luku 1 - AZD-perusteet](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tämä asiakirja on käännetty käyttäen tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattisissa käännöksissä saattaa olla virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää virallisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinkäsityksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->