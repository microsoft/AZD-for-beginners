<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1caf5e63f84a4cdffbeb8d0fe5fa3fa8",
  "translation_date": "2025-12-21T17:05:03+00:00",
  "source_file": "README.md",
  "language_code": "fi"
}
-->
# AZD Aloittelijoille: Rakenteellinen oppimispolku

![AZD-aloittelijoille](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.fi.png) 

[![GitHub-seuraajat](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub-forkit](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub-tähdet](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Aloittaminen tällä kurssilla

Seuraa näitä vaiheita aloittaaksesi AZD-opintosi:

1. **Forkkaa repositorio**: Click [![GitHub-forkit](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa repositorio**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Liity yhteisöön**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) saadaksesi asiantuntijatukea
4. **Valitse oppimispolkusi**: Valitse alla oleva luku, joka vastaa kokemustasoasi ja tavoitteitasi

### Monikielinen tuki

#### Automaattiset käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurssin yleiskatsaus

Hallitse Azure Developer CLI (azd) rakenteellisten lukujen kautta, jotka on suunniteltu asteittaiseen oppimiseen. **Erityinen painotus AI-sovellusten käyttöönotossa Microsoft Foundry -integraation kanssa.**

### Miksi tämä kurssi on olennainen nykyaikaisille kehittäjille

Microsoft Foundry Discord -yhteisön näkemyksiin perustuen, **45 % kehittäjistä haluaa käyttää AZD:ta AI-työkuormiin**, mutta kohtaa haasteita:
- Monimutkaiset monipalveluisten AI-arkkitehtuurit
- AI:n käyttöönoton tuotantokäytännöt  
- Azure AI -palveluiden integrointi ja konfigurointi
- Kustannusoptimointi AI-työkuormille
- AI-spesifisten käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Suorittamalla tämän rakenteellisen kurssin, sinä:
- **Hallitse AZD:n perusteet**: Peruskäsitteet, asennus ja määritys
- **Ota käyttöön AI-sovelluksia**: Käytä AZD:ta yhdessä Microsoft Foundry -palveluiden kanssa
- **Toteuta infrastruktuuri koodina**: Hallinnoi Azuren resursseja Bicep-malleilla
- **Vianmääritys käyttöönotossa**: Ratkaise yleisiä ongelmia ja debuggaa virheitä
- **Optimoi tuotantokäyttöön**: Tietoturva, skaalaus, monitorointi ja kustannusten hallinta
- **Rakenna moniagenttiratkaisuja**: Ota käyttöön monimutkaisia AI-arkkitehtuureja

## 📚 Oppimiskappaleet

*Valitse oppimispolkusi kokemustasonsi ja tavoitteidesi perusteella*

### 🚀 Luku 1: Perusteet & Pikakäynnistys
**Esivaatimukset**: Azure-tilaus, perusosaaminen komentorivistä  
**Kesto**: 30–45 minuuttia  
**Vaikeustaso**: ⭐

#### Mitä opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Mikä on Azure Developer CLI?](../..)
- **📖 Teoria**: [AZD Basics](docs/getting-started/azd-basics.md) - Keskeiset käsitteet ja terminologia
- **⚙️ Asennus ja määritys**: [Installation & Setup](docs/getting-started/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön**: [Your First Project](docs/getting-started/first-project.md) - Askelsammalta-opas
- **📋 Pikaviite**: [Command Cheat Sheet](resources/cheat-sheet.md)

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
# Luvun 1 suorittamisen jälkeen sinun pitäisi osata:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Aikainvestointi:** 30–45 minuuttia  
**📈 Taito tason jälkeen:** Pystyt ottamaan perussovelluksia käyttöön itsenäisesti

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

**📊 Aikainvestointi:** 30–45 minuuttia  
**📈 Taito tason jälkeen:** Pystyt ottamaan perussovelluksia käyttöön itsenäisesti

---

### 🤖 Luku 2: AI-lähtöinen kehitys (suositus AI-kehittäjille)
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 1–2 tuntia  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integrointi AZD:n kanssa
- AI-voimalla toimivien sovellusten käyttöönotto
- AI-palvelukonfiguraatioiden ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mallit**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - AI-mallien käyttöönotto ja hallinta
- **🛠️ Työpaja**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen opas**: [Workshop Materials](workshop/README.md) - Selaimessa suoritettava oppiminen MkDocs * DevContainer -ympäristössä
- **📋 Mallit**: [Microsoft Foundry Templates](../..)
- **📝 Esimerkit**: [AZD Deployment Examples](examples/README.md)

#### Käytännön harjoitukset
```bash
# Ota ensimmäinen tekoälysovelluksesi käyttöön
azd init --template azure-search-openai-demo
azd up

# Kokeile lisää tekoälypohjia
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun lopputulos**: Ota käyttöön ja konfiguroi AI-voimalla toimiva chat-sovellus RAG-ominaisuuksilla

**✅ Onnistumisen varmistus:**
```bash
# Luvun 2 jälkeen sinun pitäisi pystyä:
azd init --template azure-search-openai-demo
azd up
# Testata tekoälychat-käyttöliittymää
# Esittää kysymyksiä ja saada tekoälyn tuottamia vastauksia lähteineen
# Varmistaa, että hakujen integraatio toimii
azd monitor  # Tarkistaa, että Application Insights näyttää telemetriatiedot
azd down --force --purge
```

**📊 Aikainvestointi:** 1–2 tuntia  
**📈 Taito tason jälkeen:** Pystyt ottamaan ja konfiguroimaan tuotantovalmiita AI-sovelluksia  
**💰 Kustannustietoisuus:** Ymmärrä $80–150/kk kehityskustannukset, $300–3500/kk tuotantokustannukset

#### 💰 Kustannusnäkökohdat AI-käyttöönotossa

**Kehitysympäristö (arvio $80–150/kk):**
- Azure OpenAI (Pay-as-you-go): $0–50/kk (perustuu token-käyttöön)
- AI Search (Basic-taso): $75/kk
- Container Apps (Consumption): $0–20/kk
- Tallennustila (Standard): $1–5/kk

**Tuotantoympäristö (arvio $300–3,500+/kk):**
- Azure OpenAI (PTU taso tasaisen suorituskyvyn varmistamiseksi): $3,000+/kk TAI Pay-as-you-go suurilla volyymeilla
- AI Search (Standard-taso): $250/kk
- Container Apps (Dedicated): $50–100/kk
- Application Insights: $5–50/kk
- Tallennustila (Premium): $10–50/kk

**💡 Vinkkejä kustannusten optimointiin:**
- Käytä **Free Tier** Azure OpenAI -tasoa oppimiseen (sisältää 50 000 tokenia/kk)
- Suorita `azd down` vapauttaaksesi resursseja, kun et kehitä aktiivisesti
- Aloita kulutusperusteisella laskutuksella, nosta PTU-tasolle vasta tuotannossa
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

### ⚙️ Luku 3: Konfigurointi & Todennus
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 45–60 minuuttia  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Ympäristöjen konfigurointi ja hallinta
- Todennus ja tietoturvan parhaat käytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimateriaalit
- **📖 Konfigurointi**: [Configuration Guide](docs/getting-started/configuration.md) - Ympäristön asennus
- **🔐 Turvallisuus**: [Authentication patterns and managed identity](docs/getting-started/authsecurity.md) - Todennusmallit
- **📝 Esimerkit**: [Database App Example](examples/database-app/README.md) - AZD-tietokantaesimerkit

#### Käytännön harjoitukset
- Konfiguroi useita ympäristöjä (dev, staging, prod)
- Ota käyttöön managed identity -todennus
- Toteuta ympäristökohtaiset konfiguraatiot

**💡 Luvun lopputulos**: Hallinnoi useita ympäristöjä asianmukaisella todennuksella ja tietoturvalla

---

### 🏗️ Luku 4: Infrastruktuuri koodina & Käyttöönotto
**Esivaatimukset**: Luvut 1–3 suoritettu  
**Kesto**: 1–1,5 tuntia  
**Vaikeustaso**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönotto- ja arkkitehtuurimallit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisiointistrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Deployment Guide](docs/deployment/deployment-guide.md) - Kattavat työnkulut
- **🏗️ Provisiointi**: [Provisioning Resources](docs/deployment/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App Example](../../examples/container-app) - Konttien käyttöönotot

#### Käytännön harjoitukset
- Luo mukautettuja Bicep-malleja
- Ota käyttöön monipalvelusovelluksia
- Toteuta blue-green -käyttöönotto-strategioita

**💡 Luvun lopputulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia käyttämällä mukautettuja infrastruktuurimalleja

---

### 🎯 Luku 5: Moniagenttiset AI-ratkaisut (edistynyt)
**Esivaatimukset**: Luvut 1–2 suoritettu  
**Kesto**: 2–3 tuntia  
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä opit
- Moniagenttinen arkkitehtuurimallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit AI-käyttöönotot

#### Oppimateriaalit
- **🤖 Esitelty projekti**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM-mallit**: [ARM-mallipaketti](../../examples/retail-multiagent-arm-template) - Yhden klikkauksen käyttöönotto
- **📖 Arkkitehtuuri**: [Moni-agenttien koordinointimallit](/docs/pre-deployment/coordination-patterns.md) - Mallit

#### Käytännön harjoitukset
```bash
# Ota käyttöön täydellinen vähittäiskaupan moniagenttinen ratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutki agenttien määrityksiä
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Luvun tulos**: Ota käyttöön ja hallinnoi tuotantovalmista moni-agenttista tekoälyratkaisua, jossa on Asiakas- ja Varasto-agentit

---

### 🔍 Luku 6: Ennen käyttöönottoa tehtävä validointi ja suunnittelu
**Edellytykset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Esitarkastukset ja automaatio

#### Oppimateriaalit
- **📊 Suunnittelu**: [Kapasiteettisuunnittelu](docs/pre-deployment/capacity-planning.md) - Resurssien validointi
- **💰 Valinta**: [SKU-valinta](docs/pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Validointi**: [Esitarkastukset](docs/pre-deployment/preflight-checks.md) - Automaattiset skriptit

#### Käytännön harjoitukset
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten mukaan
- Ota käyttöön automatisoidut esitarkistukset

**💡 Luvun tulos**: Vahvista ja optimoi käyttöönotot ennen toteutusta

---

### 🚨 Luku 7: Vianetsintä ja virheenkorjaus
**Edellytykset**: Mikä tahansa käyttöönottoa käsittelevä luku suoritettuna  
**Kesto**: 1–1,5 tuntia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Järjestelmälliset virheenkorjausmenetelmät
- Yleiset ongelmat ja ratkaisut
- Tekoälykohtainen vianetsintä

#### Oppimateriaalit
- **🔧 Yleiset ongelmat**: [Yleiset ongelmat](docs/troubleshooting/common-issues.md) - UKK ja ratkaisut
- **🕵️ Virheenkorjaus**: [Virheenkorjausopas](docs/troubleshooting/debugging.md) - Vaiheittaiset strategiat
- **🤖 Tekoälyongelmat**: [Tekoälykohtainen vianetsintä](docs/troubleshooting/ai-troubleshooting.md) - Tekoälypalveluihin liittyvät ongelmat

#### Käytännön harjoitukset
- Diagnosoi käyttöönoton epäonnistumiset
- Ratkaise todennusongelmat
- Etsi ja korjaa tekoälypalvelun yhteysongelmia

**💡 Luvun tulos**: Diagnosoi ja ratkaise itsenäisesti yleisiä käyttöönottoon liittyviä ongelmia

---

### 🏢 Luku 8: Tuotanto- ja yritysarkkitehtuurimallit
**Edellytykset**: Luvut 1–4 suoritettu  
**Kesto**: 2–3 tuntia  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yrityksen turvallisuusmallit
- Valvonta ja kustannusoptimointi

#### Oppimateriaalit
- **🏭 Tuotanto**: [Tuotannon tekoälyn parhaat käytännöt](docs/microsoft-foundry/production-ai-practices.md) - Yritysmallit
- **📝 Esimerkit**: [Mikropalveluesimerkki](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Valvonta**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Valvonta

#### Käytännön harjoitukset
- Ota käyttöön yrityksen turvallisuusmallit
- Ota käyttöön kattava valvonta
- Ota käyttöön tuotantoympäristö asianmukaisella hallinnalla

**💡 Luvun tulos**: Ota käyttöön yrityskäyttöön valmiita sovelluksia, joissa on täysi tuotantotoiminnallisuus

---

## 🎓 Työpajan yleiskatsaus: Käytännön oppimiskokemus

> **⚠️ TYÖPAAJAN TILA: Kehitteillä**  
> Työpajan materiaalit ovat parhaillaan kehitteillä ja hiottavana. Ydinmoduulit toimivat, mutta jotkin edistyneemmät osiot ovat keskeneräisiä. Työskentelemme aktiivisesti saadaksemme kaiken sisällön valmiiksi. [Seuraa edistystä →](workshop/README.md)

### Interaktiiviset työpajamateriaalit
**Kattava käytännön oppiminen selaimeen perustuvilla työkaluilla ja ohjatuilla harjoituksilla**

Työpajan materiaalit tarjoavat jäsennellyn, interaktiivisen oppimiskokemuksen, joka täydentää yllä olevaa lukupohjaista opetussuunnitelmaa. Työpaja on suunniteltu sekä itseopiskeluun että ohjatuille kursseille.

#### 🛠️ Työpajan ominaisuudet
- **Selaimeen perustuva käyttöliittymä**: Täydellinen MkDocs-pohjainen työpaja, jossa on haku, kopiointi ja teemaominaisuudet
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristön asennus
- **Rakenteellinen oppimispolku**: 7-vaiheiset ohjatut harjoitukset (yhteensä 3,5 tuntia)
- **Tutkiminen → Käyttöönotto → Mukauttaminen**: Progressiivinen metodologia
- **Interaktiivinen DevContainer-ympäristö**: Esikonfiguroidut työkalut ja riippuvuudet

#### 📚 Työpajan rakenne
Työpaja noudattaa **Tutkiminen → Käyttöönotto → Mukauttaminen** -metodologiaa:

1. **Tutkimusvaihe** (45 min)
   - Tutustu Microsoft Foundry -malleihin ja -palveluihin
   - Ymmärrä moni-agenttiarkkitehtuurin mallit
   - Käy läpi käyttöönoton vaatimukset ja edellytykset

2. **Käyttöönotto** (2 tuntia)
   - Käytännön käyttöönotto AI-sovelluksille AZD:llä
   - Konfiguroi Azure AI -palvelut ja päätepisteet
   - Ota käyttöön turvallisuus- ja autentikointimalleja

3. **Mukauttamisvaihe** (45 min)
   - Muokkaa sovelluksia erityistapauksia varten
   - Optimoi tuotantokäyttöä varten
   - Ota käyttöön valvonta ja kustannusten hallinta

#### 🚀 Työpajan aloittaminen
```bash
# Vaihtoehto 1: GitHub Codespaces (suositeltu)
# Napsauta repositoriossa "Code" → "Create codespace on main"

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Noudata asennusohjeita tiedostossa workshop/README.md
```

#### 🎯 Työpajan oppimistulokset
Työpajan suorittamalla osallistujat:
- **Ota tuotantokäyttöön AI-sovelluksia**: Käytä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Hallitse moni-agenttiarkkitehtuurit**: Toteuta koordinoituja tekoälyagenttiratkaisuja
- **Ota käyttöön turvallisuuden parhaat käytännöt**: Konfiguroi autentikointi ja käyttöoikeuksien hallinta
- **Optimoi skaalausta varten**: Suunnittele kustannustehokkaita, suorituskykyisiä käyttöönottoja
- **Vianetsintä käyttöönotossa**: Ratkaise yleisiä ongelmia itsenäisesti

#### 📖 Työpajan materiaalit
- **🎥 Interaktiivinen opas**: [Työpajamateriaalit](workshop/README.md) - Selaimeen perustuva oppimisympäristö
- **📋 Vaiheittaiset ohjeet**: [Ohjatut harjoitukset](../../workshop/docs/instructions) - Yksityiskohtaiset läpikäynnit
- **🛠️ AI-työpajalaboratorio**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Tekoälyyn keskittyvät harjoitukset
- **💡 Nopea alustus**: [Työpajan asennusopas](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Täydellinen**: Yrityskoulutuksiin, yliopistokursseille, itsenäiseen opiskeluun ja kehittäjäbootcampeihin.

---

## 📖 Mikä on Azure Developer CLI?

Azure Developer CLI (azd) on kehittäjäkeskeinen komentorivityökalu, joka nopeuttaa sovellusten rakentamisen ja käyttöönoton prosessia Azureen. Se tarjoaa:

- **Mallipohjaiset käyttöönotot** - Käytä valmiiksi rakennettuja malleja yleisiin sovellusmalleihin
- **Infrastruktuuri koodina** - Hallitse Azure-resursseja käyttämällä Bicep- tai Terraform-työkaluja  
- **Integroitu työnkulku** - Provisionoi, ota käyttöön ja valvo sovelluksia saumattomasti
- **Kehittäjäystävällinen** - Optimoitu kehittäjän tuottavuuteen ja käyttökokemukseen

### **AZD + Microsoft Foundry: Täydellinen tekoälyn käyttöönottoihin**

**Miksi AZD tekoälyratkaisuihin?** AZD vastaa tekoälykehittäjien kohtaamiin keskeisiin haasteisiin:

- **AI-valmiit mallit** - Esikonfiguroidut mallit Azure OpenAI:lle, Cognitive Servicesille ja ML-kuormituksille
- **Turvalliset AI-käyttöönotot** - Sisäänrakennetut turvallisuusmallit AI-palveluille, API-avaimille ja mallipäätepisteille  
- **Tuotantotason AI-mallit** - Parhaat käytännöt skaalautuviin, kustannustehokkaisiin AI-sovellusten käyttöönottoihin
- **End-to-End AI -työnkulut** - Mallin kehityksestä tuotantokäyttöönottoon asianmukaisella valvonnalla
- **Kustannusoptimointi** - Älykäs resurssien kohdistus ja skaalausstrategiat AI-kuormituksille
- **Microsoft Foundry -integraatio** - Saumaton yhteys Microsoft Foundryn malliluetteloon ja päätepisteisiin

---

## 🎯 Mallit ja esimerkkikirjasto

### Esittelyssä: Microsoft Foundry -mallit
**Aloita täältä, jos otat käyttöön tekoälysovelluksia!**

> **Huom:** Nämä mallit osoittavat erilaisia tekoälymalleja. Jotkut ovat ulkoisia Azure Samples -esimerkkejä, toiset paikallisia toteutuksia.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Aloita AI-chatin kanssa**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Aloita AI-agenttien kanssa**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ulkoinen |
| [**Azure Search + OpenAI -demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Vähittäiskaupan moni-agenttiratkaisu**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esittelyssä: Täydelliset oppimisskenaariot
**Tuotantovalmiit sovellusmallit, jotka on yhdistetty oppimislukuihin**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perus tekoälyn käyttöönoton mallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchin kanssa |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Document Intelligence -integraatio |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja funktion kutsuminen |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritystason AI-orkestraatio |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moni-agenttiarkkitehtuuri Asiakas- ja Varasto-agenteilla |

### Oppiminen esimerkkien kautta

> **📌 Paikalliset vs. ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Valmiita käytettäväksi välittömästi  
> **Ulkoiset esimerkit** (Azure Samples) = Kloonaa linkitetyistä reposta

#### Paikalliset esimerkit (valmiit käytettäväksi)
- [**Vähittäiskaupan moni-agenttiratkaisu**](examples/retail-scenario.md) - Täydellinen tuotantovalmis toteutus ARM-malleilla
  - Moni-agenttiarkkitehtuuri (Asiakas + Varasto -agentit)
  - Kattava valvonta ja arviointi
  - Yhden klikkauksen käyttöönotto ARM-mallin kautta

#### Paikalliset esimerkit - Container-sovellukset (luvut 2–5)
**Kattavat säiliöasennusesimerkit tässä repossa:**
- [**Container App Examples**](examples/container-app/README.md) - Täydellinen opas säilöistettyihin käyttöönottoihin
  - [Yksinkertainen Flask-API](../../examples/container-app/simple-flask-api) - Perus REST-API, joka tukee skaalausta nollaan
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices) - Tuotantovalmis monipalveluinen käyttöönotto
  - Pika-aloitus-, tuotanto- ja edistyneet käyttöönotto‑mallit
  - Ohjeet valvontaan, turvallisuuteen ja kustannusoptimointiin

#### Ulkoiset esimerkit - Yksinkertaiset sovellukset (luvut 1-2)
**Kloonaa nämä Azure Samples -repositoriot aloittaaksesi:**
- [Yksinkertainen Web-sovellus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Perus käyttöönottojen mallit
- [Staattinen verkkosivusto - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön käyttöönotto
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API:n käyttöönotto

#### Ulkoiset esimerkit - Tietokantaintegraatio (luvut 3-4)  
- [Tietokantasovellus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantayhteyksien mallit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serveriton datatyönkulku

#### Ulkoiset esimerkit - Edistyneet mallit (luvut 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessit  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit ML-mallit

### Ulkoiset mallikokoelmat
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuratoitu kokoelma virallisista ja yhteisön malleista
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Examples Directory**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisilla selityksillä

---

## 📚 Oppimateriaalit ja lähteet

### Pikaviitteet
- [**Komentojen pikalista**](resources/cheat-sheet.md) - Keskeiset azd-komennot järjestettyinä lukujen mukaan
- [**Sanasto**](resources/glossary.md) - Azure- ja azd-terminologia  
- [**UKK**](resources/faq.md) - Yleisiä kysymyksiä järjestettynä oppimisjaksoittain
- [**Opiskelijan opas**](resources/study-guide.md) - Kattavat käytännön harjoitustehtävät

### Käytännön työpajat
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Tee tekoälyratkaisusi AZD:n avulla otettaviksi käyttöön (2–3 tuntia)
- [**Interaktiivinen työpajaopas**](workshop/README.md) - Selainpohjainen työpaja MkDocsilla ja DevContainer-ympäristöllä
- [**Rakenteinen oppimispolku**](../../workshop/docs/instructions) -7-vaiheiset ohjatut harjoitukset (Tutkimus → Käyttöönotto → Mukauttaminen)
- [**AZD For Beginners Workshop**](workshop/README.md) - Täydelliset käytännön työpajamateriaalit GitHub Codespaces -integraatiolla

### Ulkoiset oppimisresurssit
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Nopea vianetsintäopas

**Yleiset aloittelijoiden kohtaamat ongelmat ja välittömät ratkaisut:**

### ❌ "azd: command not found"

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

### ❌ "No subscription found" or "Subscription not set"

```bash
# Listaa saatavilla olevat tilaukset
az account list --output table

# Aseta oletustilaus
az account set --subscription "<subscription-id-or-name>"

# Aseta AZD-ympäristölle
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Vahvista
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# Kokeile eri Azure-aluetta
azd env set AZURE_LOCATION "westus2"
azd up

# Tai käytä kehityksessä pienempiä SKU:ja
# Muokkaa infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# Vaihtoehto 1: Puhdista ja yritä uudelleen
azd down --force --purge
azd up

# Vaihtoehto 2: Korjaa vain infrastruktuuri
azd provision

# Vaihtoehto 3: Tarkista yksityiskohtaiset lokit
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Tunnistaudu uudelleen
az logout
az login

azd auth logout
azd auth login

# Vahvista todennus
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD luo yksilöllisiä nimiä, mutta jos syntyy ristiriita:
azd down --force --purge

# Yritä sitten uudelleen uudella ympäristöllä
azd env new dev-v2
azd up
```

### ❌ Mallin käyttöönotto vie liikaa aikaa

```bash
# Tarkista edistyminen
azd show

# Jos jumissa yli 30 minuuttia, tarkista Azure-portaali:
azd monitor
# Etsi epäonnistuneita käyttöönottoja
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Tarkista Azure-roolisi
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Tarvitset vähintään "Contributor"-roolin
# Pyydä Azure-järjestelmänvalvojaasi myöntämään:
# - Contributor (resursseille)
# - User Access Administrator (roolimäärityksiin)
```

### ❌ Asennetun sovelluksen URL-osoitetta ei löydy

```bash
# Näytä kaikki palvelun päätepisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```

### 📚 Täydelliset vianetsintäresurssit

- **Yleisongelmien opas:** [Yksityiskohtaiset ratkaisut](docs/troubleshooting/common-issues.md)
- **Tekoälykohtaiset ongelmat:** [Tekoäly-vianetsintä](docs/troubleshooting/ai-troubleshooting.md)
- **Virheenkorjausopas:** [Vaiheittainen virheenkorjaus](docs/troubleshooting/debugging.md)
- **Hanki apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Nopea vianetsintäopas

**Yleiset aloittelijoiden kohtaamat ongelmat ja välittömät ratkaisut:**

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

# Varmista
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Kokeile eri Azure-aluetta
azd env set AZURE_LOCATION "westus2"
azd up

# Tai käytä kehityksessä pienempiä SKU:ja
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

# Vaihtoehto 3: Tarkista yksityiskohtaiset lokit
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Todenna uudelleen
az logout
az login

azd auth logout
azd auth login

# Tarkista todennus
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD luo yksilöllisiä nimiä, mutta jos tulee konflikti:
azd down --force --purge

# Sitten yritä uudelleen uudella ympäristöllä
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mallin käyttöönotto vie liikaa aikaa</strong></summary>

**Tavalliset odotusajat:**
- Yksinkertainen web-sovellus: 5–10 minuuttia
- Sovellus, jossa tietokanta: 10–15 minuuttia
- Tekoälysovellukset: 15–25 minuuttia (OpenAI:n käyttöönotto on hidasta)

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
# - User Access Administrator (roolien myöntämistä varten)
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

### 📚 Täydelliset vianetsintäresurssit

- **Yleisongelmien opas:** [Yksityiskohtaiset ratkaisut](docs/troubleshooting/common-issues.md)
- **Tekoälykohtaiset ongelmat:** [Tekoäly-vianetsintä](docs/troubleshooting/ai-troubleshooting.md)
- **Virheenkorjausopas:** [Vaiheittainen virheenkorjaus](docs/troubleshooting/debugging.md)
- **Hanki apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suoritus ja sertifiointi

### Edistymisen seuranta
Seuraa edistymistäsi jokaisen luvun kohdalla:

- [ ] **Luku 1**: Perusta & pika-aloitus ✅
- [ ] **Luku 2**: Tekoälykeskeinen kehitys ✅  
- [ ] **Luku 3**: Määritys & todennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & käyttöönotto ✅
- [ ] **Luku 5**: Moni-agenttiset tekoälyratkaisut ✅
- [ ] **Luku 6**: Esivalidointi ja suunnittelu ennen käyttöönottoa ✅
- [ ] **Luku 7**: Vianetsintä & virheenkorjaus ✅
- [ ] **Luku 8**: Tuotanto & yritystason mallit ✅

### Oppimisen varmentaminen
Luvun suorittamisen jälkeen varmista osaamisesi seuraavasti:
1. **Käytännön harjoitus**: Suorita luvun käytännön käyttöönotto
2. **Osaamisen tarkistus**: Kertaa luvun UKK-osio
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavaan vaativuustasoon

### Kurssin suorittamisen hyödyt
Kun olet suorittanut kaikki luvut, sinulla on:
- **Käytännön tuotantokokemus**: Olet ottanut tuotantoon todellisia tekoälysovelluksia Azureen
- **Ammattitaidot**: Yritystason käyttöönottovalmiudet  
- **Yhteisön tunnustus**: Aktiivinen jäsen Azure-kehittäjäyhteisössä
- **Uran edistyminen**: Kysytyt AZD- ja tekoälyn käyttöönotto-osaamiset

---

## 🤝 Yhteisö & tuki

### Hanki apua ja tukea
- **Tekniset ongelmat**: [Ilmoita bugeista ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord -yhteisö](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tekoälykohtainen apu**: Liity the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemyksiä Microsoft Foundry Discordista

**Äskettäiset äänestystulokset #Azure-kanavalta:**
- **45%** kehittäjistä haluaa käyttää AZD:ta tekoälykuormiin
- **Suurimmat haasteet**: Monipalveluinen käyttöönotto, tunnusten hallinta, tuotantovalmius  
- **Eniten pyydetyt**: Tekoälykohtaiset mallipohjat, vianetsintäoppaat, parhaat käytännöt

**Liity yhteisöömme, jotta voit:**
- Jaa kokemuksesi AZD:stä ja tekoälystä ja saa apua
- Pääsy uusien tekoälymallien varhaisiin ennakkoversioihin
- Osallistu tekoälyn käyttöönoton parhaiden käytäntöjen laatimiseen
- Vaikuta tulevien AI + AZD -ominaisuuksien kehitykseen

### Osallistuminen kurssin kehittämiseen
Otamme mielellämme vastaan panoksia! Lue [Osallistumisohjeet](CONTRIBUTING.md) saadaksesi lisätietoja:
- **Sisällön parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uudet esimerkit**: Lisää tosielämän skenaarioita ja mallipohjia  
- **Käännökset**: Auta ylläpitämään monikielistä tukea
- **Virheraportit**: Paranna tarkkuutta ja selkeyttä
- **Yhteisön pelisäännöt**: Noudata inklusiivisia yhteisöohjeitamme

---

## 📄 Kurssitiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - katso [LICENSE](../../LICENSE) tiedosto lisätiedoista.

### Aiheeseen liittyvät Microsoftin oppimisresurssit

Tiimimme tuottaa myös muita kattavia oppimiskursseja:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j aloittelijoille](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js aloittelijoille](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agentit
[![AZD aloittelijoille](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI aloittelijoille](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP aloittelijoille](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-agentit aloittelijoille](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivinen tekoäly -sarja
[![Generatiivinen tekoäly aloittelijoille](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen tekoäly (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen tekoäly (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen tekoäly (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Perusopinnot
[![Koneoppiminen aloittelijoille](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Tietotiede aloittelijoille](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Tekoäly aloittelijoille](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberturvallisuus aloittelijoille](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web-kehitys aloittelijoille](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT-aloittelijoille](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-kehitys aloittelijoille](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-sarja
[![Copilot AI-pariohjelmointiin](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET-kehittäjille](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-seikkailu](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurssin navigointi

**🚀 Valmiina aloittamaan oppimisen?**

**Aloittelijat**: Aloita [Luku 1: Perusta & pika-aloitus](../..)  
**AI-kehittäjät**: Siirry kohtaan [Luku 2: AI-ensipainotteinen kehitys](../..)  
**Kokeneet kehittäjät**: Aloita [Luku 3: Konfigurointi & todennus](../..)

**Seuraavat vaiheet**: [Aloita Luku 1 - AZD-perusteet](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä on pidettävä ensisijaisena lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->