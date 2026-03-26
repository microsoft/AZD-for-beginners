# AZD Aloittelijoille: Rakenteellinen oppimismatka

![AZD-aloittelijoille](../../translated_images/fi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaattiset käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Haluatko kloonata paikallisesti?**
>
> Tämä repository sisältää yli 50 käännöstä, mikä kasvattaa latauskokoa merkittävästi. Jos haluat kloonata ilman käännöksiä, käytä sparse checkoutia:
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

Azure Developer CLI on kasvanut perinteisten web-sovellusten ja API:en ulkopuolelle. Nykyään azd on yksittäinen työkalu minkä tahansa sovelluksen käyttöönottoon Azureen — mukaan lukien tekoälyllä tehostetut sovellukset ja älykkäät agentit.

Tämä tarkoittaa sinulle:

- **AI-agentit ovat nyt ensiluokkaisia azd-työkuormia.** Voit alustaa, ottaa käyttöön ja hallita AI-agenttiprojekteja käyttäen samaa `azd init` → `azd up` -työnkulkua, jonka jo tunnet.
- **Microsoft Foundry -integraatio** tuo mallien käyttöönoton, agenttien isännöinnin ja AI-palvelujen konfiguroinnin suoraan azd-template-ekosysteemiin.
- **Perustyönkulku ei ole muuttunut.** Olipa kyse todo-sovelluksen, mikropalvelun tai monen agentin AI-ratkaisun käyttöönotosta, komennot ovat samat.

Jos olet käyttänyt azd:ää aiemmin, AI-tuki on luonnollinen laajennus — ei erillinen työkalu tai edistynyt polku. Jos aloitat alusta, opit yhden työnkulun, joka toimii kaikkeen.

---

## 🚀 Mikä on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on kehittäjäystävällinen komentorivityökalu, joka tekee sovellusten käyttöönotosta Azureen yksinkertaista. Sen sijaan, että loisit ja yhdistäisit käsin kymmeniä Azure-resursseja, voit ottaa kokonaiset sovellukset käyttöön yhdellä komennolla.

### `azd up` -komennon taika

```bash
# Tämä yksittäinen komento tekee kaiken:
# ✅ Luo kaikki Azure-resurssit
# ✅ Määrittää verkot ja turvallisuuden
# ✅ Kääntää sovelluskoodisi
# ✅ Julkaisee Azureen
# ✅ Antaa sinulle toimivan URL-osoitteen
azd up
```

**Siinä kaikki!** Ei tarvetta klikkailla Azure-portaalissa, ei monimutkaisia ARM-templaatteja opittavaksi ensin, eikä manuaalista konfigurointia — vain toimivia sovelluksia Azuren päällä.

---

## ❓ Azure Developer CLI vs Azure CLI: Mikä on ero?

Tämä on yleisin kysymys, jonka aloittelijat esittävät. Tässä yksinkertainen vastaus:

| Ominaisuus | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tarkoitus** | Hallita yksittäisiä Azure-resursseja | Ota käyttöön kokonaisia sovelluksia |
| **Ajattelutapa** | Infrastruktuuriin keskittyvä | Sovelluskeskeinen |
| **Esimerkki** | `az webapp create --name myapp...` | `azd up` |
| **Oppimiskäyrä** | Täytyy tuntea Azure-palvelut | Riittää, että tunnet sovelluksesi |
| **Parhaiten sopii** | DevOps, infrastruktuuri | Kehittäjille, prototypointi |

### Yksinkertainen vertaus

- **Azure CLI** on kuin kaikki työkalut talon rakentamiseen — vasarat, sahat, naulat. Voit rakentaa mitä tahansa, mutta sinun täytyy osata rakentaminen.
- **Azure Developer CLI** on kuin urakoitsijan palkkaaminen — kuvailet mitä haluat, ja he hoitavat rakentamisen.

### Milloin käyttää mitäkin

| Tilanne | Käytä tätä |
|----------|----------|
| "Haluan ottaa web-sovellukseni nopeasti käyttöön" | `azd up` |
| "Tarvitsen vain luoda tallennustilin" | `az storage account create` |
| "Rakennan täyttä tekoälysovellusta" | `azd init --template azure-search-openai-demo` |
| "Tarvitsen debugata tiettyä Azure-resurssia" | `az resource show` |
| "Haluan tuotantovalmiin käyttöönoton minuuteissa" | `azd up --environment production` |

### Ne toimivat yhdessä!

AZD käyttää Azure CLI:tä taustalla. Voit käyttää molempia:
```bash
# Ota sovelluksesi käyttöön AZD:llä
azd up

# Säädä sitten tiettyjä resursseja Azure CLI:llä
az webapp config set --name myapp --always-on true
```

---

## 🌟 Löydä mallipohjat Awesome AZD:stä

Älä aloita tyhjästä! **Awesome AZD** on yhteisön kokoelma valmiiksi otettavista mallipohjista:

| Resurssi | Kuvaus |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Selaa 200+ mallipohjaa ja ota käyttöön yhdellä napsautuksella |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Lähetä oma mallipohjasi yhteisölle |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Lisää tähti ja tutki lähdekoodia |

### Suositut AI-mallipohjat Awesome AZD:stä

```bash
# RAG-keskustelu Microsoft Foundry -mallien ja tekoälyhaun kanssa
azd init --template azure-search-openai-demo

# Nopea tekoälykeskustelusovellus
azd init --template openai-chat-app-quickstart

# Tekoälyagentit Foundry-agenttien kanssa
azd init --template get-started-with-ai-agents
```

---

## 🎯 Aloita kolmessa vaiheessa

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

### Vaihe 2: Kirjaudu Azureen

```bash
azd auth login
```

### Vaihe 3: Ota ensimmäinen sovelluksesi käyttöön

```bash
# Alusta mallipohjasta
azd init --template todo-nodejs-mongo

# Ota käyttöön Azureen (luo kaiken!)
azd up
```

**🎉 Valmista!** Sovelluksesi on nyt saatavilla Azuressa.

### Siivous (Älä unohda!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kurssin käyttöohjeet

Tämä kurssi on suunniteltu vaiheittaiseen oppimiseen — aloita siitä, missä olet mukavin, ja etene:

| Kokemuksesi | Aloita tästä |
|-----------------|------------|
| **Täysin uusi Azureen** | [Luku 1: Perusta](#-chapter-1-foundation--quick-start) |
| **Tunnet Azuren, uusi AZD:ssä** | [Luku 1: Perusta](#-chapter-1-foundation--quick-start) |
| **Haluat ottaa käyttöön tekoälysovelluksia** | [Luku 2: AI-ensimmäinen kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Haluat käytännön harjoitusta** | [🎓 Interactive Workshop](workshop/README.md) - 3–4 tunnin ohjattu lab |
| **Tarvitset tuotantokäytäntöjä** | [Luku 8: Produktrionti & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Nopeasti käyttöön

1. **Forkkaa tämä repositorio**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa se**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hanki apua**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Haluatko kloonata paikallisesti?**

> Tämä repository sisältää yli 50 käännöstä, mikä kasvattaa latauskokoa merkittävästi. Jos haluat kloonata ilman käännöksiä, käytä sparse checkoutia:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tämä antaa sinulle kaiken tarvittavan kurssin suorittamiseen huomattavasti nopeammalla latauksella.


## Kurssin yleiskatsaus

Hallitse Azure Developer CLI (azd) rakenteellisten lukujen kautta, jotka on suunniteltu vaiheittaiseen oppimiseen. **Erityinen painotus AI-sovellusten käyttöönottoon Microsoft Foundry -integraation kanssa.**

### Miksi tämä kurssi on välttämätön nykyaikaisille kehittäjille

Microsoft Foundry Discord -yhteisön näkemyksiin perustuen, **45% kehittäjistä haluaa käyttää AZD:tä AI-työkuormiin**, mutta kohtaa haasteita kuten:
- Monimutkaiset monipalveluisten AI-arkkitehtuurien hallinta
- Tuotantovalmiit AI-käyttöönoton parhaat käytännöt  
- Azure AI -palveluiden integrointi ja konfigurointi
- Kustannusten optimointi AI-työkuormille
- AI-spesifisten käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Kurssin suorittamalla:
- **Hallitse AZD:n perusteet**: Peruskäsitteet, asennus ja konfigurointi
- **Ota käyttöön AI-sovelluksia**: Käytä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Toteuta infrastruktuuri koodina**: Hallitse Azure-resursseja Bicep-mallien avulla
- **Vianmääritykset**: Ratkaise yleisiä ongelmia ja debuggaa käyttöönottoja
- **Optimoi tuotantoon**: Turvallisuus, skaalaus, valvonta ja kustannusten hallinta
- **Rakenna monen agentin ratkaisuja**: Ota käyttöön monimutkaisia AI-arkkitehtuureja

## 🗺️ Kurssikartta: Nopea navigointi luvun mukaan

Jokaisella luvulla on oma README, jossa on oppimistavoitteet, pika-aloitukset ja harjoitukset:

| Luku | Aihe | Oppitunnit | Kesto | Vaikeustaso |
|---------|-------|---------|----------|------------|
| **[Luku 1: Perusta](docs/chapter-01-foundation/README.md)** | Aloittaminen | [AZD-perusteet](docs/chapter-01-foundation/azd-basics.md) &#124; [Asennus](docs/chapter-01-foundation/installation.md) &#124; [Ensimmäinen projekti](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Luku 2: AI-kehitys](docs/chapter-02-ai-development/README.md)** | AI-ensisuuntautuneet sovellukset | [Foundryn integrointi](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agentit](docs/chapter-02-ai-development/agents.md) &#124; [Mallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tuntia | ⭐⭐ |
| **[Luku 3: Konfigurointi](docs/chapter-03-configuration/README.md)** | Todennus & turvallisuus | [Konfigurointi](docs/chapter-03-configuration/configuration.md) &#124; [Todennus & turvallisuus](docs/chapter-03-configuration/authsecurity.md) | 45-60 minuuttia | ⭐⭐ |
| **[Luku 4: Infrastruktuuri](docs/chapter-04-infrastructure/README.md)** | IaC & käyttöönotto | [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisiointi](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tuntia | ⭐⭐⭐ |
| **[Luku 5: Moni-agentti](docs/chapter-05-multi-agent/README.md)** | AI-agenttiratkaisut | [Vähittäiskaupan skenaario](examples/retail-scenario.md) &#124; [Koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tuntia | ⭐⭐⭐⭐ |
| **[Luku 6: Ennen käyttöönottoa](docs/chapter-06-pre-deployment/README.md)** | Suunnittelu & validointi | [Esitarkastukset](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasiteettisuunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tunti | ⭐⭐ |
| **[Luku 7: Vianmääritys](docs/chapter-07-troubleshooting/README.md)** | Vianetsintä & korjaus | [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Virheenjäljitys](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-ongelmat](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 tuntia | ⭐⭐ |
| **[Luku 8: Tuotanto](docs/chapter-08-production/README.md)** | Yritysmallit | [Tuotantokäytännöt](docs/chapter-08-production/production-ai-practices.md) | 2-3 tuntia | ⭐⭐⭐⭐ |
| **[🎓 Työpaja](workshop/README.md)** | Käytännön laboratorio | [Johdanto](workshop/docs/instructions/0-Introduction.md) &#124; [Valinta](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Varmistus](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Rakenteen purku](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Mukauttaminen](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Purku](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tuntia | ⭐⭐ |

**Kokonaiskurssin kesto:** ~10-14 tuntia | **Taitojen eteneminen:** Aloittelija → Tuotantovalmis

---

## 📚 Oppimislukukappaleet

*Valitse oppimispolkusi kokemustason ja tavoitteiden mukaan*

### 🚀 Luku 1: Perusta & pika-aloitus
**Esivaatimukset**: Azure-tilaus, perustiedot komentorivistä  
**Kesto**: 30-45 minuuttia  
**Monimutkaisuus**: ⭐

#### Mitä opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimisresurssit
- **🎯 Aloita tästä**: [Mikä on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [AZD Perusteet](docs/chapter-01-foundation/azd-basics.md) - Peruskäsitteet ja termistö
- **⚙️ Asennus**: [Asennus & konfigurointi](docs/chapter-01-foundation/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön**: [Ensimmäinen projektisi](docs/chapter-01-foundation/first-project.md) - Askel askeleelta -opas
- **📋 Pikaopas**: [Komentojen pikatiedosto](resources/cheat-sheet.md)

#### Käytännön harjoitukset
```bash
# Nopea asennustarkistus
azd version

# Ota ensimmäinen sovelluksesi käyttöön
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun lopputulos**: Ota onnistuneesti käyttöön yksinkertainen web-sovellus Azureen käyttäen AZD:ta

**✅ Onnistumisen varmistus:**
```bash
# Luvun 1 suorittamisen jälkeen sinun pitäisi pystyä:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Aikavaatimus:** 30-45 minuuttia  
**📈 Taitotaso lopuksi:** Voi ottaa käyttöön perussovelluksia itsenäisesti
**📈 Taitotaso lopuksi:** Voi ottaa käyttöön perussovelluksia itsenäisesti

---

### 🤖 Luku 2: AI-ensisuuntautunut kehitys (suositeltu AI-kehittäjille)
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 1-2 tuntia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integrointi AZD:n kanssa
- AI-ominaisuuksia hyödyntävien sovellusten käyttöönotto
- AI-palvelukonfiguraatioiden ymmärtäminen

#### Oppimisresurssit
- **🎯 Aloita tästä**: [Microsoft Foundryn integrointi](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agentit**: [AI-agenttien opas](docs/chapter-02-ai-development/agents.md) - Ota älykkäitä agentteja käyttöön AZD:lla
- **📖 Mallit**: [AI-mallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) - Ota AI-malleja käyttöön ja hallinnoi niitä
- **🛠️ Työpaja**: [AI-työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen opas**: [Työpajamateriaalit](workshop/README.md) - Selaimessa tapahtuva oppiminen MkDocsilla * DevContainer-ympäristö
- **📋 Mallipohjat**: [Microsoft Foundryn mallipohjat](#työpajan-resurssit)
- **📝 Esimerkit**: [AZD-käyttöönottoesimerkit](examples/README.md)

#### Käytännön harjoitukset
```bash
# Ota käyttöön ensimmäinen tekoälysovelluksesi
azd init --template azure-search-openai-demo
azd up

# Kokeile lisää tekoälypohjia
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun lopputulos**: Ota käyttöön ja konfiguroi AI-tehostettu chat-sovellus RAG-ominaisuuksilla

**✅ Onnistumisen varmistus:**
```bash
# Luvun 2 jälkeen sinun pitäisi pystyä:
azd init --template azure-search-openai-demo
azd up
# Testata tekoälyn keskustelukäyttöliittymää
# Esittää kysymyksiä ja saada tekoälyn tuottamia vastauksia lähteineen
# Varmistaa, että haun integrointi toimii
azd monitor  # Tarkistaa, että Application Insights näyttää telemetriatiedot
azd down --force --purge
```

**📊 Aikavaatimus:** 1-2 tuntia  
**📈 Taitotaso lopuksi:** Voi ottaa käyttöön ja konfiguroida tuotantovalmiita AI-sovelluksia  
**💰 Kustannustietoisuus:** Arvioi kehityskustannukset $80-150/kk, tuotantokustannukset $300-3500/kk

#### 💰 Kustannukset AI-käyttöönotolle

**Kehitysympäristö (Arvioitu $80-150/kk):**
- Microsoft Foundry -mallit (Pay-as-you-go): $0-50/kk (perustuu token-käyttöön)
- AI Search (Basic-taso): $75/kk
- Container Apps (Consumption): $0-20/kk
- Tallennus (Standard): $1-5/kk

**Tuotantoympäristö (Arvioitu $300-3,500+/kk):**
- Microsoft Foundry -mallit (PTU tasaisen suorituskyvyn varmistamiseksi): $3,000+/kk TAI Pay-as-you-go suurella volyymilla
- AI Search (Standard-taso): $250/kk
- Container Apps (Dedicated): $50-100/kk
- Application Insights: $5-50/kk
- Tallennus (Premium): $10-50/kk

**💡 Kustannusten optimointivinkkejä:**
- Käytä Microsoft Foundryn ilmaistasoa oppimiseen (Azure OpenAI sisältää 50 000 tokenia/kk)
- Suorita `azd down` vapauttaaksesi resursseja kun et aktiivisesti kehitä
- Aloita kulutukseen perustuvalla laskutuksella, siirry PTU:hun vain tuotannossa
- Käytä `azd provision --preview` arvioidaksesi kustannuksia ennen käyttöönottoa
- Ota automaattinen skaalaus käyttöön: maksa vain todellisesta käytöstä

**Kustannusten seuranta:**
```bash
# Tarkista arvioidut kuukausikustannukset
azd provision --preview

# Seuraa todellisia kustannuksia Azure-portaalissa
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Konfigurointi & todennus
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 45-60 minuuttia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Ympäristön konfigurointi ja hallinta
- Todennus ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimisresurssit
- **📖 Konfigurointi**: [Konfigurointiopas](docs/chapter-03-configuration/configuration.md) - Ympäristön asetukset
- **🔐 Turvallisuus**: [Todennuskuviot ja hallittu identiteetti](docs/chapter-03-configuration/authsecurity.md) - Todennuskuviot
- **📝 Esimerkit**: [Tietokantasovellus-esimerkki](examples/database-app/README.md) - AZD-tietokantaesimerkit

#### Käytännön harjoitukset
- Konfiguroi useita ympäristöjä (dev, staging, prod)
- Ota hallittu identiteettitodennus käyttöön
- Toteuta ympäristökohtaiset konfiguraatiot

**💡 Luvun lopputulos**: Hallinnoi useita ympäristöjä asianmukaisella todennuksella ja turvallisuudella

---

### 🏗️ Luku 4: Infrastruktuuri koodina & käyttöönotto
**Esivaatimukset**: Luvut 1-3 suoritettu  
**Kesto**: 1-1.5 tuntia  
**Monimutkaisuus**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönotto-mallit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisiointistrategiat

#### Oppimisresurssit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) - Koko työnkulut
- **🏗️ Provisiointi**: [Resurssien provisiointi](docs/chapter-04-infrastructure/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App -esimerkki](../../examples/container-app) - Konttien käyttöönotot

#### Käytännön harjoitukset
- Luo mukautettuja Bicep-malleja
- Ota monipalvelusovelluksia käyttöön
- Toteuta blue-green -käyttöönotto-strategioita

**💡 Luvun lopputulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia käyttäen mukautettuja infrastruktuurimalleja

---

### 🎯 Luku 5: Moni-agenttiset AI-ratkaisut (Edistynyt)
**Esivaatimukset**: Luvut 1-2 suoritettu  
**Kesto**: 2-3 tuntia  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Moni-agenttiarkkitehtuurimallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit AI-käyttöönotot

#### Oppimisresurssit
- **🤖 Esitelty projekti**: [Vähittäiskaupan moni-agenttiratkaisu](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM-mallipaketti**: [ARM-mallipaketti](../../examples/retail-multiagent-arm-template) - Yhdellä napsautuksella käyttöönotto
- **📖 Arkkitehtuuri**: [Moni-agentin koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mallit

#### Käytännön harjoitukset
```bash
# Ota käyttöön täydellinen vähittäiskaupan moniagenttiratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutki agenttien määrityksiä
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Luvun lopputulos**: Ota käyttöön ja hallinnoi tuotantovalmiita moni-agenttisia AI-ratkaisuja asiakas- ja varastoagenttien kanssa

---

### 🔍 Luku 6: Ennen käyttöönottoa: validointi & suunnittelu
**Esivaatimukset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Esitarkastukset ja automaatio

#### Oppimisresurssit
- **📊 Suunnittelu**: [Kapasiteettisuunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) - Resurssien validointi
- **💰 Valinta**: [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Validointi**: [Esitarkastukset](docs/chapter-06-pre-deployment/preflight-checks.md) - Automaattiset skriptit

#### Käytännön harjoitukset
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten mukaan
- Toteuta automatisoituja esitarkastuksia

**💡 Luvun lopputulos**: Validoi ja optimoi käyttöönotot ennen toteutusta

---

### 🚨 Luku 7: Vianmääritys & virheenjäljitys
**Esivaatimukset**: Mikä tahansa käyttöönotto-luku suoritettu  
**Kesto**: 1-1.5 tuntia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Systemaattiset virheenjäljitysmenetelmät
- Yleiset ongelmat ja ratkaisut
- AI-spesifinen vianmääritys

#### Oppimisresurssit
- **🔧 Yleiset ongelmat**: [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) - UKK ja ratkaisut
- **🕵️ Virheenjäljitys**: [Virheenjäljitysopas](docs/chapter-07-troubleshooting/debugging.md) - Askel askeleelta -strategiat
- **🤖 AI-ongelmat**: [AI-spesifinen vianmääritys](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-palveluiden ongelmat

#### Käytännön harjoitukset
- Diagnosoi käyttöönotto-epäonnistumisia
- Korjaa todennusongelmia
- Virheenjäljitä AI-palvelujen yhteyksiä

**💡 Luvun lopputulos**: Pystyy diagnosoimaan ja ratkaisemaan itsenäisesti yleisiä käyttöönotto-ongelmia

---

### 🏢 Luku 8: Tuotanto & yritysmallit
**Esivaatimukset**: Luvut 1-4 suoritettu  
**Kesto**: 2-3 tuntia  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritystason turvallisuusmallit
- Seuranta ja kustannusten optimointi

#### Oppimisresurssit
- **🏭 Tuotanto**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Yritysmallit
- **📝 Esimerkit**: [Microservices Example](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Valvonta**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Valvonta

#### Käytännön harjoitukset
- Ota käyttöön yritystason tietoturvamallit
- Ota käyttöön kattava valvonta
- Ota käyttöön tuotantoon asianmukaisella hallinnoinnilla

**💡 Lukukatsaus**: Ota käyttöön tuotantovalmiita sovelluksia täydellisillä tuotanto-ominaisuuksilla

---

## 🎓 Työpajan yleiskatsaus: Käytännön oppimiskokemus

> **⚠️ TYÖPAJAN TILA: Kehitteillä**  
> Työpajamateriaaleja kehitetään ja hiotaan parhaillaan. Perusmoduulit toimivat, mutta jotkin edistyneet osiot ovat keskeneräisiä. Työskentelemme aktiivisesti kaikkien sisältöjen saattamiseksi valmiiksi. [Seuraa edistymistä →](workshop/README.md)

### Interaktiivinen työpajamateriaali
**Kattava käytännön opetus selainpohjaisilla työkaluilla ja ohjatuilla harjoituksilla**

Työpajamateriaalimme tarjoavat rakenteellisen, interaktiivisen oppimiskokemuksen, joka täydentää yllä olevaa lukuohjelmaa. Työpaja on suunniteltu sekä itseopiskeluun että opettajajohtoisiin sessioihin.

#### 🛠️ Työpajan ominaisuudet
- **Selainpohjainen käyttöliittymä**: Täydellinen MkDocs-pohjainen työpaja haku-, kopiointi- ja teemaominaisuuksilla
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristön käyttöönotto
- **Rakenteellinen oppimispolku**: 8-moduulinen ohjattu harjoitussarja (3–4 tuntia yhteensä)
- **Progressiivinen metodologia**: Johdanto → Valinta → Varmennus → Purku → Konfigurointi → Mukautus → Resurssien poisto → Yhteenveto
- **Interaktiivinen DevContainer-ympäristö**: Esikonfiguroidut työkalut ja riippuvuudet

#### 📚 Työpajan moduulirakenne
Työpaja noudattaa **8-moduulista progressiivista metodologiaa**, joka vie sinut löytämisestä käyttöönoton hallintaan:

| Moduuli | Aihe | Mitä teet | Kesto |
|--------|-------|----------------|----------|
| **0. Johdanto** | Työpajan yleiskatsaus | Ymmärrä oppimistavoitteet, ennakkoedellytykset ja työpajan rakenne | 15 min |
| **1. Valinta** | Mallipohjan löytäminen | Tutki AZD-malleja ja valitse AI-malli skenaariollesi | 20 min |
| **2. Varmennus** | Ota käyttöön ja varmista | Ota malli käyttöön komennolla `azd up` ja varmista, että infrastruktuuri toimii | 30 min |
| **3. Purku** | Rakenne ymmärtäminen | Käytä GitHub Copilotia tutkiaksesi mallin arkkitehtuuria, Bicep-tiedostoja ja koodin järjestelyä | 30 min |
| **4. Konfigurointi** | azure.yaml -syväluotaus | Hallitse `azure.yaml`-konfiguraatiota, elinkaarikoukkuja ja ympäristömuuttujia | 30 min |
| **5. Mukautus** | Tee siitä omasi | Ota käyttöön AI-haku, jäljitys, arviointi ja mukauta skenaariollesi | 45 min |
| **6. Resurssien poisto** | Puhdistus | Poista turvallisesti resurssit komennolla `azd down --purge` | 15 min |
| **7. Yhteenveto** | Seuraavat askelet | Kertaa saavutukset, keskeiset käsitteet ja jatka oppimismatkaasi | 15 min |

**Työpajan kulku:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Työpajan käynnistäminen
```bash
# Vaihtoehto 1: GitHub Codespaces (Suositeltu)
# Napsauta repositorion "Code" → "Create codespace on main"

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Noudata workshop/README.md-tiedoston asennusohjeita
```

#### 🎯 Työpajan oppimistulokset
Työpajan suorittaneet osallistujat:
- **Ota tuotantokelpoiset AI-sovellukset käyttöön**: Käytä AZD:tä Microsoft Foundryn palveluiden kanssa
- **Hallitse moni-agenttiarkkitehtuurit**: Toteuta koordinoituja AI-agenttiratkaisuja
- **Toteuta turvallisuuden parhaat käytännöt**: Määritä todennus ja käyttöoikeuksien hallinta
- **Optimoi skaalautuvuutta varten**: Suunnittele kustannustehokkaat ja suorituskykyiset käyttöönotot
- **Vianmääritys käyttöönotossa**: Ratkaise yleisiä ongelmia itsenäisesti

#### 📖 Työpajan resurssit
- **🎥 Interaktiivinen opas**: [Workshop Materials](workshop/README.md) - Selainpohjainen oppimisympäristö
- **📋 Moduuli moduulilta -ohjeet**:
  - [0. Johdanto](workshop/docs/instructions/0-Introduction.md) - Työpajan yleiskatsaus ja tavoitteet
  - [1. Valinta](workshop/docs/instructions/1-Select-AI-Template.md) - Etsi ja valitse AI-malleja
  - [2. Varmennus](workshop/docs/instructions/2-Validate-AI-Template.md) - Ota mallit käyttöön ja varmista ne
  - [3. Purku](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tutki mallin arkkitehtuuria
  - [4. Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) - Hallitse azure.yaml-tiedostoa
  - [5. Mukautus](workshop/docs/instructions/5-Customize-AI-Template.md) - Mukauta skenaariollesi
  - [6. Resurssien poisto](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Siivoa resurssit
  - [7. Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) - Kertaus ja seuraavat askelet
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-keskeiset harjoitukset
- **💡 Nopea aloitus**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Sopii erinomaisesti**: Yrityskoulutuksiin, yliopistokursseihin, itseopiskeluun ja kehittäjäbootcampeihin.

---

## 📖 Syväsukellus: AZD:n ominaisuudet

Perusasioiden lisäksi AZD tarjoaa tehokkaita ominaisuuksia tuotantokäyttöönottoihin:

- **Mallipohjaiset käyttöönotot** - Käytä valmiita malleja yleisiin sovelluskuvioihin
- **Infrastruktuuri koodina** - Hallitse Azure-resursseja käyttäen Bicep- tai Terraform-työkaluja  
- **Integroitu työnkulku** - Provisionoi, ota käyttöön ja valvo sovelluksia saumattomasti
- **Kehittäjäystävällinen** - Optimoitu kehittäjän tuottavuuteen ja käyttökokemukseen

### **AZD + Microsoft Foundry: Täydellinen valinta AI-käyttöönottoihin**

**Miksi AZD AI-ratkaisuihin?** AZD vastaa AI-kehittäjien yleisimpiin haasteisiin:

- **AI-valmiit mallipohjat** - Esikonfiguroidut mallit Microsoft Foundry -malleille, Cognitive Servicesille ja ML-työkuormille
- **Turvalliset AI-käyttöönotot** - Sisäänrakennetut tietoturvamallit AI-palveluille, API-avaimille ja mallin päätepisteille  
- **Tuotannon AI-mallit** - Parhaat käytännöt skaalautuviin ja kustannustehokkaisiin AI-sovelluskäyttöönottoihin
- **End-to-End AI-työnkulut** - Mallin kehityksestä tuotantokäyttöön asianmukaisella valvonnalla
- **Kustannusoptimointi** - Älykkäät resurssien kohdennus- ja skaalausstrategiat AI-työkuormille
- **Microsoft Foundry -integraatio** - Saumaton yhteys Microsoft Foundryn mallikatalogiin ja päätepisteisiin

---

## 🎯 Mallit & esimerkkikirjasto

### Esittelyssä: Microsoft Foundry -mallit
**Aloita tästä, jos otat AI-sovelluksia käyttöön!**

> **Huom.:** Nämä mallit demonstroivat erilaisia AI-kuvioita. Osa on ulkoisia Azure Samples -esimerkkejä, toiset paikallisia toteutuksia.

| Malli | Luku | Monimutkaisuus | Palvelut | Tyyppi |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ulkoinen |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esittelyssä: Valmiit oppimistilanteet
**Tuotantovalmiit sovellusmallit, jotka on yhdistetty oppimislukuihin**

| Malli | Oppimisluku | Monimutkaisuus | Keskeinen oppi |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perustason AI-käyttöönoton mallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchin kanssa |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Document Intelligence -integraatio |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja funktiokutsut |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritystason AI-orchestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moni-agenttiarkkitehtuuri Asiakas- ja Varasto-agenttien kanssa |

### Oppiminen esimerkkien kautta

> **📌 Paikalliset vs. Ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Valmiit käytettäväksi heti  
> **Ulkopuoliset esimerkit** (Azure Samples) = Kloonaa linkitetyistä repositorioista

#### Paikalliset esimerkit (valmiit käytettäväksi)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Täydellinen tuotantovalmiiksi toteutus ARM-malleilla
  - Moni-agenttiarkkitehtuuri (Asiakas + Varasto -agentit)
  - Kattava valvonta ja arviointi
  - Yhden klikkauksen käyttöönotto ARM-mallin kautta

#### Paikalliset esimerkit - Container-sovellukset (luvut 2–5)
**Kattavat konttipohjaisten käyttöönottojen esimerkit tässä repossa:**
- [**Container App Examples**](examples/container-app/README.md) - Täydellinen opas konttipohjaisiin käyttöönottoihin
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Perus REST-rajapinta, skaalaus nollaan
  - [Microservices Architecture](../../examples/container-app/microservices) - Tuotantovalmiiksi monipalveluinen käyttöönotto
  - Quick Start, Production, and Advanced deployment patterns
  - Valvonta-, tietoturva- ja kustannusoptimointiohjeet

#### Ulkopuoliset esimerkit - Yksinkertaiset sovellukset (luvut 1–2)
**Kloonaa nämä Azure Samples -repositoriot aloittaaksesi:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Peruskäyttöönoton mallit
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön käyttöönotto
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-rajapinnan käyttöönotto

#### Ulkopuoliset esimerkit - Tietokantaintegraatio (luvut 3–4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantayhteyksien mallit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverittömän datatyönkulun malli

#### Ulkopuoliset esimerkit - Edistyneet kuviot (luvut 4–8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessointi  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit ML-käytännöt

### Ulkoiset mallikokoelmat
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuratoitu kokoelma virallisista ja yhteisön malleista
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Examples Directory**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisine selityksineen

---

## 📚 Oppimisresurssit & viitteet

### Pikaviitteet
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Keskeiset azd-komennot järjestettyinä lukujen mukaan
- [**Glossary**](resources/glossary.md) - Azure- ja azd-terminologia  
- [**FAQ**](resources/faq.md) - Usein kysytyt kysymykset järjestettynä oppimislukujen mukaan
- [**Study Guide**](resources/study-guide.md) - Kattavat harjoitustehtävät

### Käytännön työpajat
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-käyttöön sopivia (2–3 tuntia)
- [**Interactive Workshop**](workshop/README.md) - 8-moduulinen ohjattu harjoitussarja MkDocsilla ja GitHub Codespacesilla
  - Seuraa: Johdanto → Valinta → Varmennus → Purku → Konfigurointi → Mukautus → Resurssien poisto → Yhteenveto

### Ulkopuoliset oppimisresurssit
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure-arkkitehtuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure-hinnoittelulaskin](https://azure.microsoft.com/pricing/calculator/)
- [Azure-palvelun tila](https://status.azure.com/)

### AI-agenttien taidot editorillesi
- [**Microsoft Azure -taidot palvelussa skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 avointa agenttitaitoa Azure AI:lle, Foundrylle, käyttöönottoon, diagnostiikkaan, kustannusoptimointiin ja muuhun. Asenna ne GitHub Copilotiin, Cursoriin, Claude Codeen tai mihin tahansa tuettuun agenttiin:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Nopea vianmääritysohje

**Yleisimmät aloittelijoiden kohtaamat ongelmat ja välittömät ratkaisut:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Asenna AZD ensin
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
# Luettele saatavilla olevat tilaukset
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

# Vaihtoehto 4: Tarkista lokit Azure Monitorista
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Autentikoi uudelleen
az logout
az login

azd auth logout
azd auth login

# Varmista autentikointi
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD luo ainutlaatuisia nimiä, mutta jos nimi on jo käytössä:
azd down --force --purge

# Sitten yritä uudelleen puhtaalla ympäristöllä
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mallin käyttöönotto vie liian kauan</strong></summary>

**Normaalit odotusajat:**
- Yksinkertainen verkkosovellus: 5-10 minuuttia
- Sovellus, jossa on tietokanta: 10-15 minuuttia
- AI-sovellukset: 15-25 minuuttia (OpenAI:n provisiointi on hidasta)

```bash
# Tarkista edistyminen
azd show

# Jos jumissa yli 30 minuuttia, tarkista Azure-portaali:
azd monitor
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
# - User Access Administrator (roolien myöntämiseen)
```
</details>

<details>
<summary><strong>❌ Käyttöönotetun sovelluksen URL-osoitetta ei löydy</strong></summary>

```bash
# Näytä kaikki palveluiden päätepisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```
</details>

### 📚 Täydelliset vianmääritykseen liittyvät resurssit

- **Yleisimpien ongelmien opas:** [Yksityiskohtaiset ratkaisut](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-ongelmat:** [AI-vianmääritys](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vianetsintäopas:** [Vaiheittainen vianetsintä](docs/chapter-07-troubleshooting/debugging.md)
- **Hanki apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suoritus ja sertifiointi

### Edistymisen seuranta
Seuraa oppimisesi edistymistä jokaisen luvun kohdalla:

- [ ] **Luku 1**: Perusteet & Pika-aloitus ✅
- [ ] **Luku 2**: AI-lähtöinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & Todennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & Käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Ennakkovalidointi & Suunnittelu ✅
- [ ] **Luku 7**: Vianmääritys & Virheiden korjaus ✅
- [ ] **Luku 8**: Tuotanto- ja yritysmallit ✅

### Oppimisen varmentaminen
Kun olet suorittanut kunkin luvun, varmista osaamisesi seuraavasti:
1. **Käytännön harjoitus**: Suorita luvun käytännön käyttöönotto
2. **Tietotarkastus**: Käy läpi luvun UKK-osio
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavaan vaativuustasoon

### Kurssin suorittamisen edut
Kun olet suorittanut kaikki luvut, sinulla on:
- **Tuotantokokemus**: Olet ottanut käyttöön todellisia AI-sovelluksia Azureen
- **Ammatilliset taidot**: Yritystason käyttöönotto-osaaminen  
- **Yhteisön tunnustus**: Aktiivinen jäsen Azure-kehittäjäyhteisössä
- **Urapolun edistäminen**: Kysytyt AZD- ja AI-käyttöönotto-osaamiset

---

## 🤝 Yhteisö ja tuki

### Hanki apua ja tukea
- **Tekniset ongelmat**: [Ilmoita virheistä ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord -yhteisö](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-kohtainen apu**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemykset Microsoft Foundry Discordista

**Viimeaikaiset äänestystulokset #Azure-kanavalta:**
- **45%** of developers want to use AZD for AI workloads
- **Top challenges**: Multi-service deployments, credential management, production readiness  
- **Most requested**: AI-specific templates, troubleshooting guides, best practices

**Liity yhteisöömme, jotta voit:**
- Jaa AZD + AI -kokemuksesi ja saa apua
- Pääsy uusien AI-mallien varhaisiin esiversioihin
- Osallistu AI-käyttöönoton parhaiden käytäntöjen kehittämiseen
- Vaikuta tulevien AI + AZD -ominaisuuksien kehitykseen

### Osallistuminen kurssin kehittämiseen
Otamme mielellämme vastaan panoksia! Lue [Contributing Guide](CONTRIBUTING.md) saadaksesi yksityiskohtaiset ohjeet siitä, miten:
- **Sisällön parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uudet esimerkit**: Lisää käytännön tapauksia ja malleja  
- **Käännökset**: Auta monikielisen tuen ylläpidossa
- **Virheilmoitukset**: Paranna tarkkuutta ja selkeyttä
- **Yhteisön säännöt**: Noudata inklusiivisia yhteisöohjeitamme

---

## 📄 Kurssitiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - katso lisätiedot [LICENSE](../../LICENSE) -tiedostosta.

### Aiheeseen liittyvät Microsoftin oppimisresurssit

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
[![Generatiivinen AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Perusopinnot
[![ML aloittelijoille](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data-analytiikka aloittelijoille](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI aloittelijoille](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
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

**🚀 Valmiina aloittamaan oppimisen?**

**Aloittelijoille**: Aloita [Luku 1: Perusta ja pika-aloitus](#-chapter-1-foundation--quick-start)  
**AI-kehittäjille**: Siirry kohtaan [Luku 2: AI-lähtöinen kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kokeneille kehittäjille**: Aloita [Luku 3: Asetukset ja todennus](#️-chapter-3-configuration--authentication)

**Seuraavat askeleet**: [Aloita Luku 1 - AZD-perusteet](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automatisoiduissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaisen ihmiskääntäjän tekemää käännöstä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->