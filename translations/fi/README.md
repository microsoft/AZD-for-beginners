# AZD Aloittelijoille: Jäsennelty oppimismatka

![AZD-aloittelijoille](../../translated_images/fi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub-seuraajat](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub-forkit](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub-tähdet](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaattiset käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Haluatko kloonata paikallisesti?**
>
> Tämä repositorio sisältää yli 50 käännöstä, mikä lisää latauskokoa merkittävästi. Kloonaa ilman käännöksiä käyttämällä sparse checkout -toimintoa:
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

Azure Developer CLI on laajentunut perinteisistä web-sovelluksista ja API:ista. Nykyään azd on yksi työkalu minkä tahansa sovelluksen käyttöönottoon Azureen—mukaan lukien tekoälyn voimalla varustetut sovellukset ja älykkäät agentit.

Mitä tämä tarkoittaa sinulle:

- **AI-agentit ovat nyt ensimmäisen luokan azd-työkuormia.** Voit alustaa, ottaa käyttöön ja hallita AI-agenttiprojekteja käyttäen samaa `azd init` → `azd up` -työnkulkua, jonka jo tunnet.
- **Microsoft Foundry -integraatio** tuo mallien käyttöönoton, agenteille isännöinnin ja AI-palveluiden konfiguroinnin suoraan azd-mallipohjajärjestelmään.
- **Ydintyönkulku ei ole muuttunut.** Olipa kyseessä todo-sovelluksen, mikropalvelun tai monen agentin AI-ratkaisun käyttöönotto, komennot ovat samat.

Jos olet käyttänyt azd:ää aiemmin, AI-tuki on luonnollinen laajennus—ei erillinen työkalu tai edistynyt polku. Jos aloitat alusta, opit yhden työnkulun, joka toimii kaiken kanssa.

---

## 🚀 Mikä on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on kehittäjäystävällinen komentorivityökalu, joka tekee sovellusten käyttöönotosta Azuren pilveen yksinkertaista. Sen sijaan, että luot ja yhdistäisit käsin kymmeniä Azure-resursseja, voit ottaa käyttöön kokonaisia sovelluksia yhdellä komennolla.

### `azd up` -taika

```bash
# Tämä yksittäinen komento tekee kaiken:
# ✅ Luo kaikki Azure-resurssit
# ✅ Määrittää verkon ja tietoturvan
# ✅ Kokoa sovelluskoodisi
# ✅ Ota käyttöönotto Azureen
# ✅ Antaa toimivan URL-osoitteen
azd up
```

**Siinä se!** Ei Azure-portaaliin klikkailua, ei monimutkaisia ARM-malleja opittavana ensin, ei manuaalista konfigurointia - vain toimivia sovelluksia Azureen.

---

## ❓ Azure Developer CLI vs Azure CLI: Mikä on ero?

Tämä on yleisin kysymys, jonka aloittelijat kysyvät. Tässä yksinkertainen vastaus:

| Ominaisuus | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tarkoitus** | Hallinnoi yksittäisiä Azure-resursseja | Ota käyttöön kokonaisia sovelluksia |
| **Ajattelutapa** | Infrastruktuuriin keskittyvä | Sovelluskeskeinen |
| **Esimerkki** | `az webapp create --name myapp...` | `azd up` |
| **Oppimiskäyrä** | Täytyy tuntea Azure-palvelut | Riittää että tunnet sovelluksesi |
| **Paras kohde** | DevOps, infrastruktuuri | Kehittäjät, prototypointi |

### Yksinkertainen vertaus

- **Azure CLI** on kuin työkalupakki talon rakentamiseen - vasarat, sahat, naulat. Voit rakentaa mitä tahansa, mutta sinun täytyy tuntea rakentaminen.
- **Azure Developer CLI** on kuin urakoitsijan palkkaaminen - kuvailet mitä haluat, ja hän hoitaa rakentamisen.

### Milloin käyttää kutakin

| Tilanne | Käytä tätä |
|----------|----------|
| "Haluan ottaa web-sovellukseni nopeasti käyttöön" | `azd up` |
| "Tarvitsen vain tallennustilin" | `az storage account create` |
| "Rakennan täyden AI-sovelluksen" | `azd init --template azure-search-openai-demo` |
| "Tarvitsen debuggausta tietylle Azure-resurssille" | `az resource show` |
| "Haluan tuotantovalmiin käyttöönoton minuutissa" | `azd up --environment production` |

### Ne toimivat yhdessä!

AZD käyttää Azure CLI:tä taustalla. Voit käyttää molempia:
```bash
# Ota sovelluksesi käyttöön AZD:llä
azd up

# Säädä sitten tiettyjä resursseja Azure CLI:llä
az webapp config set --name myapp --always-on true
```

---

## 🌟 Etsi malleja Awesome AZD:stä

Älä aloita nollasta! **Awesome AZD** on yhteisön kokoelma valmiita otettavaksi käyttöön malleja:

| Resurssi | Kuvaus |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Selaa yli 200 mallia ja ota käyttöön yhdellä napsautuksella |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Lähetä oma mallisi yhteisölle |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Tähditä ja tutki lähdekoodia |

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

**🎉 Siinä se!** Sovelluksesi on nyt käytössä Azure-palvelussa.

### Siivous (Älä unohda!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kurssin käyttö

Tämä kurssi on suunniteltu asteittaiseen oppimiseen - aloita siitä, missä tunnet olosi mukavaksi, ja etene tarvittaessa:

| Kokemuksesi | Aloita tästä |
|-----------------|------------|
| **Uusi Azuren käyttäjä** | [Luku 1: Perusta](#-chapter-1-foundation--quick-start) |
| **Tunnet Azuren, uusi AZD:ssä** | [Luku 1: Perusta](#-chapter-1-foundation--quick-start) |
| **Haluat ottaa AI-sovelluksia käyttöön** | [Luku 2: AI-ensimmäinen kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Haluat käytännön harjoittelua** | [🎓 Interaktiivinen työpaja](workshop/README.md) - 3-4 tunnin ohjattu lab |
| **Tarvitset tuotantomalleja** | [Luku 8: Tuotanto & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Pika-asennus

1. **Tee fork tästä repositoriosta**: [![GitHub-forkit](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa se**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hanki apua**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Haluatko kloonata paikallisesti?**

> Tämä repositorio sisältää yli 50 käännöstä, mikä lisää latauskokoa merkittävästi. Kloonaa ilman käännöksiä käyttämällä sparse checkout -toimintoa:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tämä antaa sinulle kaiken tarvittavan kurssin suorittamiseen huomattavasti nopeammalla latauksella.


## Kurssin yleiskatsaus

Hallinnoi Azure Developer CLI:tä (azd) jäsenneltyjen lukujen kautta, jotka on suunniteltu asteittaiseen oppimiseen. **Erityinen painotus AI-sovellusten käyttöönotossa Microsoft Foundry -integraation avulla.**

### Miksi tämä kurssi on oleellinen nykyaikaisille kehittäjille

Microsoft Foundry Discord -yhteisön havaintojen perusteella **45% kehittäjistä haluaa käyttää AZD:tä AI-työkuormiin**, mutta he kohtaavat haasteita, kuten:
- Monimutkaiset monipalveluiset AI-arkkitehtuurit
- Tuotantoaiheiset AI-käyttöönoton parhaat käytännöt
- Azure AI -palveluiden integrointi ja konfigurointi
- Kustannusten optimointi AI-työkuormille
- AI-spesifisten käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Kurssin suorittamisen jälkeen osaat:
- **Hallita AZD:n perusteet**: Ydinperiaatteet, asennus ja konfigurointi
- **Ottaa AI-sovelluksia käyttöön**: Käytä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Toteuttaa Infrastructure as Code -periaatteet**: Hallinnoi Azure-resursseja Bicep-malleilla
- **Vianmääritys käyttöönotossa**: Ratkaise yleisiä ongelmia ja debuggaa
- **Optimoi tuotantoon**: Turvallisuus, skaalaus, valvonta ja kustannusten hallinta
- **Rakenna monen agentin ratkaisuja**: Ota käyttöön monimutkaisia AI-arkkitehtuureja

## 🗺️ Kurssikartta: Pikatason navigointi luvun mukaan

Jokaisella luvulla on oma README, jossa on oppimistavoitteet, pika-aloitukset ja harjoitukset:

| Luku | Aihe | Oppitunnit | Kesto | Vaativuus |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Aloittaminen | [AZD-perusteet](docs/chapter-01-foundation/azd-basics.md) &#124; [Asennus](docs/chapter-01-foundation/installation.md) &#124; [Ensimmäinen projekti](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Luku 2: AI-kehitys](docs/chapter-02-ai-development/README.md)** | AI-keskeiset sovellukset | [Foundry-integraatio](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agentit](docs/chapter-02-ai-development/agents.md) &#124; [Mallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tuntia | ⭐⭐ |
| **[Luku 3: Konfigurointi](docs/chapter-03-configuration/README.md)** | Todennus ja turvallisuus | [Konfigurointi](docs/chapter-03-configuration/configuration.md) &#124; [Todennus & turvallisuus](docs/chapter-03-configuration/authsecurity.md) | 45-60 minuuttia | ⭐⭐ |
| **[Luku 4: Infrastruktuuri](docs/chapter-04-infrastructure/README.md)** | IaC & Käyttöönotto | [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisiointi](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tuntia | ⭐⭐⭐ |
| **[Luku 5: Moni-agentti](docs/chapter-05-multi-agent/README.md)** | AI-agenttiratkaisut | [Vähittäiskauppa-skenaario](examples/retail-scenario.md) &#124; [Koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tuntia | ⭐⭐⭐⭐ |
| **[Luku 6: Esikartoitus](docs/chapter-06-pre-deployment/README.md)** | Suunnittelu & Validointi | [Preflight-tarkistukset](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasiteettisuunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tunti | ⭐⭐ |
| **[Luku 7: Vianetsintä](docs/chapter-07-troubleshooting/README.md)** | Vianetsintä & Korjaus | [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Virheenkorjaus](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-ongelmat](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 tuntia | ⭐⭐ |
| **[Luku 8: Tuotanto](docs/chapter-08-production/README.md)** | Yritysmallit | [Tuotantokäytännöt](docs/chapter-08-production/production-ai-practices.md) | 2-3 tuntia | ⭐⭐⭐⭐ |
| **[🎓 Työpaja](workshop/README.md)** | Käytännön laboratorio | [Johdanto](workshop/docs/instructions/0-Introduction.md) &#124; [Valinta](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validointi](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Purku](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Räätälöinti](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Purku infrastruktuurista](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tuntia | ⭐⭐ |

**Kokonaiskurssin kesto:** ~10-14 tuntia | **Taitojen kehittyminen:** Aloittelija → Tuotantovalmiiksi

---

## 📚 Oppimiskappaleet

*Valitse oppimispolkusi kokemustason ja tavoitteiden perusteella*

### 🚀 Luku 1: Perusta ja pikakäynnistys
**Esivaatimukset**: Azure-tilaus, perustason komentorivityöskentely  
**Kesto**: 30-45 minuuttia  
**Monimutkaisuus**: ⭐

#### Mitä opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimisresurssit
- **🎯 Aloita tästä**: [Mikä on Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [AZD:n perusteet](docs/chapter-01-foundation/azd-basics.md) - Keskeiset käsitteet ja terminologia
- **⚙️ Asennus**: [Asennus & käyttöönotto](docs/chapter-01-foundation/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön**: [Ensimmäinen projektisi](docs/chapter-01-foundation/first-project.md) - Vaiheittainen opas
- **📋 Pikaopas**: [Komentojen pikaohje](resources/cheat-sheet.md)

#### Käytännön harjoitukset
```bash
# Nopea asennustarkistus
azd version

# Ota ensimmäinen sovelluksesi käyttöön
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun lopputulos**: Ota onnistuneesti käyttöön yksinkertainen web-sovellus Azureen käyttäen AZD:tä

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
**📈 Taitotaso lopuksi:** Pystyy ottamaan käyttöön perussovelluksia itsenäisesti
**📈 Taitotaso lopuksi:** Pystyy ottamaan käyttöön perussovelluksia itsenäisesti

---

### 🤖 Luku 2: AI-keskeinen kehitys (Suositellaan AI-kehittäjille)
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 1-2 tuntia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integrointi AZD:n kanssa
- AI-kykyisten sovellusten käyttöönotto
- AI-palvelukonfiguraatioiden ymmärtäminen

#### Oppimisresurssit
- **🎯 Aloita tästä**: [Microsoft Foundry -integraatio](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agentit**: [AI-agentit](docs/chapter-02-ai-development/agents.md) - Ota käyttöön älykkäitä agentteja AZD:llä
- **📖 Mallit**: [AI-mallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) - Ota käyttöön ja hallitse AI-malleja
- **🛠️ Työpaja**: [AI-työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee AI-ratkaisustasi AZD-valmis
- **🎥 Interaktiivinen opas**: [Työpajamateriaali](workshop/README.md) - Selainpohjaista oppimista MkDocsilla * DevContainer-ympäristö
- **📋 Mallit**: [Microsoft Foundry -mallit](#työpajan-resurssit)
- **📝 Esimerkit**: [AZD-käyttöönottoesimerkit](examples/README.md)

#### Käytännön harjoitukset
```bash
# Ota ensimmäinen tekoälysovelluksesi käyttöön
azd init --template azure-search-openai-demo
azd up

# Kokeile muita tekoälymallipohjia
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun lopputulos**: Ota käyttöön ja konfiguroi AI-kykyinen chat-sovellus, jossa on RAG-ominaisuudet

**✅ Onnistumisen validointi:**
```bash
# Luvun 2 jälkeen sinun pitäisi pystyä:
azd init --template azure-search-openai-demo
azd up
# Testata tekoälychatin käyttöliittymää
# Esittää kysymyksiä ja saada tekoälyn tuottamia vastauksia lähteineen
# Varmistaa, että hakuintegraatio toimii
azd monitor  # Tarkistaa, että Application Insights näyttää telemetrian
azd down --force --purge
```

**📊 Aika-arvio:** 1-2 tuntia  
**📈 Taitotaso lopuksi:** Pystyy ottamaan käyttöön ja konfiguroimaan tuotantovalmiita AI-sovelluksia  
**💰 Kustannustietoisuus:** Ymmärrä $80-150/kk kehityskustannukset, $300-3500/kk tuotantokustannukset

#### 💰 Kustannusnäkökohtia AI-käyttöönottoihin

**Kehitysympäristö (Arvio $80-150/kk):**
- Microsoft Foundry -mallit (Pay-as-you-go): $0-50/kk (perustuu token-käyttöön)
- AI Search (Basic-taso): $75/kk
- Container Apps (Consumption): $0-20/kk
- Tallennus (Standard): $1-5/kk

**Tuotantoympäristö (Arvio $300-3,500+/kk):**
- Microsoft Foundry -mallit (PTU johdonmukaiseen suorituskykyyn): $3,000+/kk TAI Pay-as-you-go suuren volyymin kanssa
- AI Search (Standard-taso): $250/kk
- Container Apps (Dedicated): $50-100/kk
- Application Insights: $5-50/kk
- Tallennus (Premium): $10-50/kk

**💡 Kustannusten optimointivinkkejä:**
- Käytä **Free Tier** Microsoft Foundry -malleja oppimiseen (Azure OpenAI sisältää 50,000 tokenia/kk)
- Suorita `azd down` vapauttaaksesi resurssit, kun et aktiivisesti kehitä
- Aloita kulutusperusteisella laskutuksella, päivitä PTU:hun vain tuotantoon
- Käytä `azd provision --preview` arvoidaksesi kustannuksia ennen käyttöönottoa
- Ota käyttöön automaattinen skaalaus: maksa vain todellisesta käytöstä

**Kustannusseuranta:**
```bash
# Tarkista arvioidut kuukausittaiset kustannukset
azd provision --preview

# Seuraa todellisia kustannuksia Azure-portaalissa
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Konfigurointi ja todennus
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 45-60 minuuttia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Ympäristön konfigurointi ja hallinta
- Todennus ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimisresurssit
- **📖 Konfigurointi**: [Konfigurointiopas](docs/chapter-03-configuration/configuration.md) - Ympäristön asetukset
- **🔐 Turvallisuus**: [Todennusmallit ja hallinnoitu identiteetti](docs/chapter-03-configuration/authsecurity.md) - Todennusmallit
- **📝 Esimerkit**: [Tietokantasovellus-esimerkki](examples/database-app/README.md) - AZD-tietokantaesimerkit

#### Käytännön harjoitukset
- Konfiguroi useita ympäristöjä (dev, staging, prod)
- Ota käyttöön hallinnoitu identiteetin todennus
- Toteuta ympäristökohtaiset konfiguraatiot

**💡 Luvun lopputulos**: Hallitse useita ympäristöjä asianmukaisella todennuksella ja turvallisuudella

---

### 🏗️ Luku 4: Infrastruktuuri koodina ja käyttöönotto
**Esivaatimukset**: Luvut 1-3 suoritettu  
**Kesto**: 1-1.5 tuntia  
**Monimutkaisuus**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönotto-mallit
- Infrastructure as Code Bicepillä
- Resurssien provisiointistrategiat

#### Oppimisresurssit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) - Täydelliset työnkulut
- **🏗️ Provisiointi**: [Provisioi resurssit](docs/chapter-04-infrastructure/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App -esimerkki](../../examples/container-app) - Konttien käyttöönotot

#### Käytännön harjoitukset
- Luo mukautettuja Bicep-malleja
- Ota käyttöön monipalvelusovelluksia
- Toteuta blue-green -käyttöönottoja

**💡 Luvun lopputulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia käyttämällä mukautettuja infrastruktuurimalleja

---

### 🎯 Luku 5: Moniagenttiset AI-ratkaisut (Edistynyt)
**Esivaatimukset**: Luvut 1-2 suoritettu  
**Kesto**: 2-3 tuntia  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Moniagenttiarkkitehtuurin mallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit AI-käyttöönotot

#### Oppimisresurssit
- **🤖 Esitelty projekti**: [Vähittäiskaupan moniagenttiratkaisu](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM-mallit**: [ARM-mallipaketti](../../examples/retail-multiagent-arm-template) - Yhden klikkauksen käyttöönotto
- **📖 Arkkitehtuuri**: [Moniagenttien koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mallit

#### Käytännön harjoitukset
```bash
# Ota käyttöön täydellinen vähittäiskaupan moniagenttinen ratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutki agenttien kokoonpanoja
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Luvun lopputulos**: Ota käyttöön ja hallitse tuotantovalmista moniagenttista AI-ratkaisua Customer- ja Inventory-agenttien kanssa

---

### 🔍 Luku 6: Ennen käyttöönottoa tehtävä validointi ja suunnittelu
**Esivaatimukset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Pre-flight-tarkistukset ja automaatio

#### Oppimisresurssit
- **📊 Suunnittelu**: [Kapasiteettisuunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) - Resurssien validointi
- **💰 Valinta**: [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Validointi**: [Preflight-tarkistukset](docs/chapter-06-pre-deployment/preflight-checks.md) - Automaattiset skriptit

#### Käytännön harjoitukset
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten mukaan
- Toteuta automatisoidut ennen-käyttöönottoa -tarkistukset

**💡 Luvun lopputulos**: Validoi ja optimoi käyttöönotot ennen niiden suorittamista

---

### 🚨 Luku 7: Vianetsintä ja virheenkorjaus
**Esivaatimukset**: Mikä tahansa käyttöönotto-luku suoritettu  
**Kesto**: 1-1.5 tuntia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Järjestelmälliset virheenetsintämenetelmät
- Yleiset ongelmat ja ratkaisut
- AI-spesifinen vianetsintä

#### Oppimisresurssit
- **🔧 Yleiset ongelmat**: [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) - UKK ja ratkaisut
- **🕵️ Virheenkorjaus**: [Virheenkorjausopas](docs/chapter-07-troubleshooting/debugging.md) - Vaiheittaiset strategiat
- **🤖 AI-ongelmat**: [AI-spesifinen vianetsintä](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-palveluongelmat

#### Käytännön harjoitukset
- Diagnosoi käyttöönoton epäonnistumisia
- Ratkaise todennukseen liittyvät ongelmat
- Korjaa AI-palvelun yhteysongelmat

**💡 Luvun lopputulos**: Pystyy itsenäisesti diagnosoimaan ja ratkaisemaan yleisiä käyttöönotto-ongelmia

---

### 🏢 Luku 8: Tuotanto ja yritysmallit
**Esivaatimukset**: Luvut 1-4 suoritettu  
**Kesto**: 2-3 tuntia  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritystason turvallisuusmallit
- Valvonta ja kustannusten optimointi

#### Oppimisresurssit
- **🏭 Tuotanto**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Yritysmallit
- **📝 Esimerkit**: [Microservices Example](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Valvonta**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Valvonta

#### Käytännön harjoitukset
- Toteuta yrityksen turvallisuusmallit
- Ota käyttöön kattava valvonta
- Julkaise tuotantoon asianmukaisella hallinnoinnilla

**💡 Luvun tulos**: Julkaise yritysvalmiita sovelluksia kaikilla tuotantotoiminnoilla

---

## 🎓 Työpajan yleiskatsaus: käytännönläheinen oppimiskokemus

> **⚠️ TYÖPAJAN TILA: Kehitteillä**  
> Työpajan materiaalit ovat parhaillaan kehitteillä ja tarkennettavana. Ydinmoduulit toimivat, mutta jotkin edistyneemmät osiot ovat keskeneräisiä. Työskentelemme aktiivisesti kaikkien sisältöjen saattamiseksi valmiiksi. [Seuraa edistymistä →](workshop/README.md)

### Interaktiiviset työpajamateriaalit
**Kattava käytännön oppiminen selainpohjaisilla työkaluilla ja ohjatuilla harjoituksilla**

Työpajan materiaalit tarjoavat jäsennellyn, interaktiivisen oppimiskokemuksen, joka täydentää yllä olevaa lukuohjelmaa. Työpaja on suunniteltu sekä itsenäiseen opiskeluun että ohjattuihin sessioihin.

#### 🛠️ Työpajan ominaisuudet
- **Selainpohjainen käyttöliittymä**: Täysi MkDocs-pohjainen työpaja hakutoiminnolla, kopioinnilla ja teemavaihtoehdoilla
- **GitHub Codespaces Integration**: Yhden napsautuksen kehitysympäristön asennus
- **Jäsennelty oppimispolku**: 8-moduulinen ohjattu harjoitus (3-4 tuntia yhteensä)
- **Progressive Methodology**: Johdanto → Valinta → Varmennus → Rakenteen purku → Konfigurointi → Räätälöinti → Purku → Yhteenveto
- **Interactive DevContainer Environment**: Esikonfiguroidut työkalut ja riippuvuudet

#### 📚 Työpajamoduulien rakenne
Työpaja seuraa **8-moduulista progressiivista metodologiaa**, joka vie sinut löytämisestä julkaisutaitoon:

| Moduuli | Aihe | Mitä teet | Kesto |
|--------|-------|----------------|----------|
| **0. Johdanto** | Työpajan yleiskatsaus | Ymmärrä oppimistavoitteet, ennakkoedellytykset, ja työpajan rakenne | 15 min |
| **1. Valinta** | Mallin löytäminen | Tutki AZD-malleja ja valitse oikea AI-malli tapaustasi varten | 20 min |
| **2. Varmennus** | Julkaise ja varmista | Julkaise malli komennolla `azd up` ja varmista, että infrastruktuuri toimii | 30 min |
| **3. Rakenteen purku** | Ymmärrä rakenne | Käytä GitHub Copilotia mallin arkkitehtuurin, Bicep-tiedostojen ja koodin järjestelyn tutkimiseen | 30 min |
| **4. Konfigurointi** | azure.yaml -syväluotaus | Hallinnoi `azure.yaml`-konfiguraatiota, elinkaarikoukkuja ja ympäristömuuttujia | 30 min |
| **5. Räätälöinti** | Tee siitä omasi | Ota käyttöön AI-haku, seuranta, arviointi ja räätälöi tapaustasi varten | 45 min |
| **6. Purku** | Siivoaminen | Poista resurssit turvallisesti komennolla `azd down --purge` | 15 min |
| **7. Yhteenveto** | Seuraavat askeleet | Käy läpi saavutukset, keskeiset käsitteet ja jatka oppimismatkaasi | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Työpajan aloittaminen
```bash
# Vaihtoehto 1: GitHub Codespaces (Suositeltu)
# Napsauta arkistossa "Code" → "Create codespace on main"

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Noudata asennusohjeita tiedostossa workshop/README.md
```

#### 🎯 Työpajan oppimistulokset
Työpajan suorittaneet osallistujat:
- **Julkaise tuotanto-AI-sovelluksia**: Käytä AZD:ta Microsoft Foundry -palveluiden kanssa
- **Hallitse moni-agenttisia arkkitehtuureja**: Toteuta koordinoituja AI-agenttiratkaisuja
- **Ota käyttöön turvallisuuden parhaat käytännöt**: Määritä todennus ja pääsynhallinta
- **Optimoi skaalautuvuutta varten**: Suunnittele kustannustehokkaita ja suorituskykyisiä julkaisuja
- **Vianmääritys julkaisuissa**: Ratkaise yleisiä ongelmia itsenäisesti

#### 📖 Työpajan resurssit
- **🎥 Interaktiivinen opas**: [Workshop Materials](workshop/README.md) - Selainpohjainen oppimisympäristö
- **📋 Moduulikohtaiset ohjeet**:
  - [0. Johdanto](workshop/docs/instructions/0-Introduction.md) - Työpajan yleiskatsaus ja tavoitteet
  - [1. Valinta](workshop/docs/instructions/1-Select-AI-Template.md) - Etsi ja valitse AI-malleja
  - [2. Varmennus](workshop/docs/instructions/2-Validate-AI-Template.md) - Julkaise ja varmista mallit
  - [3. Purku](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tutki mallin arkkitehtuuria
  - [4. Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) - Hallitse azure.yaml-tiedosto
  - [5. Räätälöinti](workshop/docs/instructions/5-Customize-AI-Template.md) - Räätälöi tarpeisiisi
  - [6. Purku](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Siivoa resurssit
  - [7. Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) - Kertaus ja seuraavat askeleet
- **🛠️ AI-työpajalaboratorio**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-keskeiset harjoitukset
- **💡 Pika-aloitus**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Täydellinen kohde**: yrityskoulutuksiin, yliopistokursseille, itseopiskeluun ja kehittäjäbootcampeihin.

---

## 📖 Syväluotaus: AZD:n ominaisuudet

Perusasioiden lisäksi AZD tarjoaa tehokkaita ominaisuuksia tuotantojulkaisuja varten:

- **Mallipohjaiset julkaisut** - Käytä valmiita malleja yleisiin sovellusmalleihin
- **Infrastruktuuri koodina** - Hallinnoi Azure-resursseja käyttäen Bicep- tai Terraform-työkaluja  
- **Integroidut työnkulut** - Provisionoi, julkaise ja valvo sovelluksia saumattomasti
- **Kehittäjäystävällinen** - Optimoitu kehittäjän tuottavuuteen ja käyttökokemukseen

### **AZD + Microsoft Foundry: Ihanteellinen AI-julkaisuja varten**

**Miksi AZD AI-ratkaisuille?** AZD ratkaisee AI-kehittäjien yleisimmät haasteet:

- **AI-valmiit mallipohjat** - Esikonfiguroidut mallit Microsoft Foundry Modelsille, Cognitive Servicesille ja ML-kuormituksille
- **Turvalliset AI-julkaisut** - Sisäänrakennetut turvallisuusmallit AI-palveluille, API-avaimille ja mallipäätteille  
- **Tuotannon AI-mallit** - Parhaat käytännöt skaalautuviin, kustannustehokkaisiin AI-sovellusjulkaisuihin
- **End-to-End AI-työnkulut** - Mallikehityksestä tuotantoon julkaisuun asianmukaisella valvonnalla
- **Kustannusten optimointi** - Älykkäät resurssien kohdentamis- ja skaalautumisstrategiat AI-kuormituksille
- **Microsoft Foundry -integraatio** - Saumaton yhteys Microsoft Foundryn malliluetteloon ja päätteisiin

---

## 🎯 Mallit & esimerkkikirjasto

### Esittelyssä: Microsoft Foundry -mallit
**Aloita tästä, jos julkaiset AI-sovelluksia!**

> **Huom:** Nämä mallipohjat demonstroivat erilaisia AI-malleja. Osa on ulkoisia Azure Samples -repositorioita, toiset paikallisia toteutuksia.

| Malli | Luku | Monimutkaisuus | Palvelut | Tyyppi |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ulkoinen |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esittelyssä: Täydelliset oppimisskenaariot
**Tuotantovalmiit sovelluspohjat kartoitettuna oppimislukuihin**

| Malli | Oppimisluku | Monimutkaisuus | Keskeinen oppi |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perus AI-julkaisumallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchin kanssa |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Document Intelligence -integraatio |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja funktion kutsuminen |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritys-AI-orchestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moni-agenttiarkkitehtuuri Customer- ja Inventory-agentteineen |

### Oppiminen esimerkkien kautta

> **📌 Paikalliset vs. ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Valmiina käytettäväksi heti  
> **Ulkoiset esimerkit** (Azure Samples) = Kloonaa linkatuista repositorioista

#### Paikalliset esimerkit (valmiina käytettäväksi)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Täydellinen tuotantovalmiiksi toteutus ARM-malleilla
  - Moni-agenttiarkkitehtuuri (Customer + Inventory -agentit)
  - Kattava valvonta ja arviointi
  - Yhden napsautuksen julkaisu ARM-mallin kautta

#### Paikalliset esimerkit - Container-sovellukset (Luvut 2-5)
**Kattavat konttipohjaiset julkaisu-esimerkit tässä repositoriossa:**
- [**Container App Examples**](examples/container-app/README.md) - Täydellinen opas konttipohjaisiin julkaisuihin
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Perus REST-API scale-to-zero -ominaisuudella
  - [Microservices Architecture](../../examples/container-app/microservices) - Tuotantovalmiit monipalvelujulkaisut
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### Ulkoiset esimerkit - Yksinkertaiset sovellukset (Luvut 1-2)
**Kloonaa nämä Azure Samples -arkistot aloittaaksesi:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Perus julkaisu- ja arkkitehtuurimallit
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön julkaisu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API -julkaisu

#### Ulkoiset esimerkit - Tietokantaintegraatio (Luvut 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantayhteysmallit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless-tietotyönkulku

#### Ulkoiset esimerkit - Edistyneet mallit (Luvut 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessointi  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit ML-mallit

### Ulkoiset mallikokoelmat
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuratoitu kokoelma virallisista ja yhteisön malleista
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Examples Directory**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisilla selityksillä

---

## 📚 Oppimateriaalit & viitteet

### Nopeat viitteet
- [**Komentojen pikaohje**](resources/cheat-sheet.md) - Keskeiset azd-komennot järjestettyinä lukujen mukaan
- [**Sanasto**](resources/glossary.md) - Azure ja azd -terminologia  
- [**UKK**](resources/faq.md) - Yleisimmät kysymykset järjestettyinä oppimislukujen mukaan
- [**Opas opiskeluun**](resources/study-guide.md) - Kattavat harjoitustehtävät

### Käytännön työpajat
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-julkaisukelpoisia (2-3 tuntia)
- [**Interactive Workshop**](workshop/README.md) - 8-moduulinen ohjattu harjoitus MkDocsilla ja GitHub Codespacesilla
  - Seuraa: Johdanto → Valinta → Varmennus → Rakenteen purku → Konfigurointi → Räätälöinti → Purku → Yhteenveto

### Ulkoiset oppimisresurssit
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure-arkkitehtuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure-hinnoittelulaskuri](https://azure.microsoft.com/pricing/calculator/)
- [Azure-palveluiden tila](https://status.azure.com/)

### AI-agenttitaitoja editorillesi
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 avointa agenttitaitoa Azure AI:lle, Foundrylle, käyttöönotolle, diagnostiikalle, kustannusoptimoinnille ja muille. Asenna ne GitHub Copilotiin, Cursoriin, Claude Codeen tai mihin tahansa tuettuun agenttiin:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Nopea vianmääritysohje

**Yleisimmät aloittelijoiden kohtaamat ongelmat ja välittömät ratkaisut:**

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
<summary><strong>❌ "No subscription found" tai "Subscription not set"</strong></summary>

```bash
# Listaa saatavilla olevat tilaukset
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
<summary><strong>❌ "InsufficientQuota" tai "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" epäonnistuu kesken</strong></summary>

```bash
# Vaihtoehto 1: Siivoa ja yritä uudelleen
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
<summary><strong>❌ "Authentication failed" tai "Token expired"</strong></summary>

```bash
# Tunnistaudu uudelleen
az logout
az login

azd auth logout
azd auth login

# Varmista todennus
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" tai nimi-conflictit</strong></summary>

```bash
# AZD luo ainutlaatuisia nimiä, mutta jos syntyy konflikti:
azd down --force --purge

# Sitten yritä uudelleen uudessa ympäristössä
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normaalit odotusajat:**
- Yksinkertainen web-sovellus: 5–10 minuuttia
- Sovellus tietokannalla: 10–15 minuuttia
- AI-sovellukset: 15–25 minuuttia (OpenAI:n provisiointi on hidasta)

```bash
# Tarkista eteneminen
azd show

# Jos jumissa yli 30 minuuttia, tarkista Azure-portaali:
azd monitor
# Etsi epäonnistuneita käyttöönottoja
```
</details>

<details>
<summary><strong>❌ "Permission denied" tai "Forbidden"</strong></summary>

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
# Näytä kaikki palveluiden päätepisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```
</details>

### 📚 Täydelliset vianmääritysresurssit

- **Yleisimmät ongelmat:** [Yksityiskohtaiset ratkaisut](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-kohtaiset ongelmat:** [AI-vianmääritys](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vianetsintäopas:** [Vaiheittainen vianetsintä](docs/chapter-07-troubleshooting/debugging.md)
- **Hae apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suoritus ja sertifiointi

### Edistymisen seuranta
Seuraa oppimisesi edistymistä jokaisen luvun läpi:

- [ ] **Luku 1**: Perusteet & pika-aloitus ✅
- [ ] **Luku 2**: AI-lähtöinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & todennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Ennen käyttöönottoa - validointi & suunnittelu ✅
- [ ] **Luku 7**: Vianmääritys & vianetsintä ✅
- [ ] **Luku 8**: Tuotanto & yritysmallit ✅

### Osaamisen varmistus
Kun olet suorittanut kunkin luvun, varmista osaamisesi:
1. **Käytännön harjoitus**: Suorita luvun hands-on käyttöönotto
2. **Tietotarkistus**: Käy luvun UKK-osio läpi
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavaan vaativuustasoon

### Kurssin suorittamisen edut
Kun olet suorittanut kaikki luvut, sinulla on:
- **Käytännön kokemus**: Olet ottanut käyttöön todellisia AI-sovelluksia Azureen
- **Ammatilliset taidot**: Yritystason käyttöönotto-osaaminen  
- **Yhteisön tunnustus**: Aktiivinen jäsen Azure-kehittäjäyhteisössä
- **Urapolun eteneminen**: Kysyttyä AZD- ja AI-käyttöönotto-osaamista

---

## 🤝 Yhteisö & tuki

### Hanki apua ja tukea
- **Tekniset ongelmat**: [Ilmoita bugeista ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-kohtainen apu**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemyksiä Microsoft Foundry Discord -kanavalta

**Viimeaikaiset äänestystulokset #Azure-kanavalta:**
- **45%** kehittäjistä haluaa käyttää AZD:tä AI-kuormituksiin
- **Suurimmat haasteet**: Monipalveluinen käyttöönotto, valtuustietojen hallinta, tuotantovalmius  
- **Useimmin pyydetyt**: AI-kohtaiset mallit, vianmääritysoppaat, parhaat käytännöt

**Liity yhteisöömme, jotta voit:**
- Jakaa AZD + AI -kokemuksiasi ja saada apua
- Päästä käsiksi uusiin AI-mallien ennakkoversioihin
- Välittää kokemuksia AI-käyttöönoton parhaista käytännöistä
- Vaikuttaa tuleviin AI + AZD -ominaisuuksiin

### Osallistuminen kurssiin
Otamme mielellämme vastaan panoksiasi! Lue [Contributing Guide](CONTRIBUTING.md) saadaksesi lisätietoja:
- **Sisällön parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uudet esimerkit**: Lisää käytännön tilanteita ja malleja  
- **Käännökset**: Auta ylläpitämään monikielistä tukea
- **Virheraportit**: Paranna tarkkuutta ja selkeyttä
- **Yhteisön käytännöt**: Noudata osallistavaa yhteisöpolitiikkaamme

---

## 📄 Kurssin tiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - katso tiedosto [LICENSE](../../LICENSE) lisätietoja varten.

### Aiheeseen liittyvät Microsoftin oppimateriaalit

Tiimimme tuottaa myös muita kattavia oppimiskursseja:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j aloittelijoille](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js aloittelijoille](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain aloittelijoille](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD aloittelijoille](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI aloittelijoille](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP aloittelijoille](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-agentit aloittelijoille](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generatiivinen AI aloittelijoille](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML aloittelijoille](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Datatiede aloittelijoille](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
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

**Aloittelijat**: Aloita luvusta [Luku 1: Perusteet & Pikakäynnistys](#-chapter-1-foundation--quick-start)  
**AI-kehittäjät**: Siirry kohtaan [Luku 2: AI-etusijainen kehitys](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Kokeneet kehittäjät**: Aloita luvusta [Luku 3: Konfigurointi & Autentikointi](#️-chapter-3-configuration--authentication)

**Seuraavat askeleet**: [Aloita luku 1 - AZD-perusteet](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälyä hyödyntävällä käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme täsmällisyyteen, ota huomioon, että automatisoiduissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä on pidettävä auktoritatiivisena lähteenä. Kriittisen tiedon kohdalla suositellaan ammattimaista, ihmisen tekemää käännöstä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai tulkintavirheistä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->