<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c5d2bb409800e22e74f34ee0ed12bed",
  "translation_date": "2025-12-17T14:29:20+00:00",
  "source_file": "README.md",
  "language_code": "fi"
}
-->
# AZD Aloittelijoille: Jäsennelty Oppimismatka

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.fi.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Kurssin Aloittaminen

Seuraa näitä vaiheita aloittaaksesi AZD-opintomatkasi:

1. **Forkkaa Repositorio**: Klikkaa [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa Repositorio**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Liity Yhteisöön**: [Azure Discord -yhteisöt](https://discord.com/invite/ByRwuEEgH4) asiantuntijatukea varten
4. **Valitse Oppimispolku**: Valitse alla oleva luku, joka vastaa kokemustasoasi

### Monikielinen Tuki

#### Automaattiset Käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurssin Yleiskatsaus

Hallitse Azure Developer CLI (azd) jäsenneltyjen lukujen kautta, jotka on suunniteltu asteittaiseen oppimiseen. **Erityinen painotus AI-sovellusten käyttöönotossa Microsoft Foundryn integraation kanssa.**

### Miksi Tämä Kurssi On Välttämätön Nykykehittäjille

Microsoft Foundry Discord -yhteisön näkemyksiin perustuen, **45 % kehittäjistä haluaa käyttää AZD:tä AI-työkuormiin** mutta kohtaa haasteita:
- Monimutkaiset monipalveluisten AI-arkkitehtuurien hallinta
- Tuotantotason AI-käyttöönoton parhaat käytännöt  
- Azure AI -palveluiden integrointi ja konfigurointi
- AI-työkuormien kustannusten optimointi
- AI-spesifisten käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Suorittamalla tämän jäsennellyn kurssin, opit:
- **Hallitse AZD:n Perusteet**: Keskeiset käsitteet, asennus ja konfigurointi
- **Ota Käyttöön AI-sovelluksia**: Käytä AZD:tä Microsoft Foundryn palveluiden kanssa
- **Toteuta Infrastruktuuri Koodina**: Hallitse Azure-resursseja Bicep-mallien avulla
- **Vianmääritys Käyttöönotossa**: Ratkaise yleisiä ongelmia ja debuggaa
- **Optimoi Tuotantoon**: Turvallisuus, skaalaus, valvonta ja kustannusten hallinta
- **Rakenna Moniagenttisia Ratkaisuja**: Ota käyttöön monimutkaisia AI-arkkitehtuureja

## 📚 Oppimislukujen Valinta

*Valitse oppimispolkusi kokemustason ja tavoitteiden mukaan*

### 🚀 Luku 1: Perusta & Pikakäynnistys
**Esivaatimukset**: Azure-tilaus, perustiedot komentorivistä  
**Kesto**: 30-45 minuuttia  
**Vaativuus**: ⭐

#### Mitä Opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimateriaalit
- **🎯 Aloita Tästä**: [Mikä on Azure Developer CLI?](../..)
- **📖 Teoria**: [AZD:n Perusteet](docs/getting-started/azd-basics.md) - Keskeiset käsitteet ja termit
- **⚙️ Asennus**: [Asennus & Konfigurointi](docs/getting-started/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön Harjoitus**: [Ensimmäinen Projektisi](docs/getting-started/first-project.md) - Vaiheittainen opas
- **📋 Pikaviite**: [Komentojen Pikaopas](resources/cheat-sheet.md)

#### Käytännön Harjoitukset
```bash
# Nopea asennustarkistus
azd version

# Ota käyttöön ensimmäinen sovelluksesi
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun Tulos**: Ota käyttöön yksinkertainen web-sovellus Azureen AZD:n avulla

**✅ Onnistumisen Vahvistus:**
```bash
# Luvun 1 suorittamisen jälkeen sinun pitäisi osata:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Aikavaatimus:** 30-45 minuuttia  
**📈 Taitotaso Lopuksi:** Osaa ottaa käyttöön perussovelluksia itsenäisesti

**✅ Onnistumisen Vahvistus:**
```bash
# Luvun 1 suorittamisen jälkeen sinun pitäisi osata:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Aikavaatimus:** 30-45 minuuttia  
**📈 Taitotaso Lopuksi:** Osaa ottaa käyttöön perussovelluksia itsenäisesti

---

### 🤖 Luku 2: AI-Ensimmäinen Kehitys (Suositeltu AI-kehittäjille)
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 1-2 tuntia  
**Vaativuus**: ⭐⭐

#### Mitä Opit
- Microsoft Foundryn integraatio AZD:n kanssa
- AI-pohjaisten sovellusten käyttöönotto
- AI-palveluiden konfiguroinnin ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita Tästä**: [Microsoft Foundryn Integraatio](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mallit**: [AI-mallien Käyttöönotto](docs/microsoft-foundry/ai-model-deployment.md) - AI-mallien käyttöönotto ja hallinta
- **🛠️ Työpaja**: [AI-työpajatyötila](docs/microsoft-foundry/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen Opas**: [Työpajamateriaalit](workshop/README.md) - Selaimessa toimiva oppiminen MkDocs * DevContainer -ympäristössä
- **📋 Mallipohjat**: [Microsoft Foundryn Mallipohjat](../..)
- **📝 Esimerkit**: [AZD Käyttöönottoesimerkit](examples/README.md)

#### Käytännön Harjoitukset
```bash
# Ota käyttöön ensimmäinen tekoälysovelluksesi
azd init --template azure-search-openai-demo
azd up

# Kokeile lisätekoälymalleja
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun Tulos**: Ota käyttöön ja konfiguroi AI-pohjainen chat-sovellus RAG-ominaisuuksilla

**✅ Onnistumisen Vahvistus:**
```bash
# Luvun 2 jälkeen sinun pitäisi pystyä:
azd init --template azure-search-openai-demo
azd up
# Testaamaan tekoälychat-käyttöliittymää
# Kysymään kysymyksiä ja saamaan tekoälyn tuottamia vastauksia lähteineen
# Varmistamaan, että hakutoiminto toimii
azd monitor  # Tarkistamaan, että Application Insights näyttää telemetrian
azd down --force --purge
```

**📊 Aikavaatimus:** 1-2 tuntia  
**📈 Taitotaso Lopuksi:** Osaa ottaa käyttöön ja konfiguroida tuotantovalmiita AI-sovelluksia  
**💰 Kustannustietoisuus:** Ymmärtää 80-150 $/kk kehityskustannukset, 300-3500 $/kk tuotantokustannukset

#### 💰 Kustannusnäkökohdat AI-käyttöönotossa

**Kehitysympäristö (Arvioitu 80-150 $/kk):**
- Azure OpenAI (Pay-as-you-go): 0-50 $/kk (token-käytön mukaan)
- AI Search (Perustaso): 75 $/kk
- Container Apps (Kulutuksen mukaan): 0-20 $/kk
- Tallennustila (Standard): 1-5 $/kk

**Tuotantoympäristö (Arvioitu 300-3 500+ $/kk):**
- Azure OpenAI (PTU tasainen suorituskyky): 3 000+ $/kk TAI Pay-as-you-go suurilla volyymeillä
- AI Search (Standard-taso): 250 $/kk
- Container Apps (Oma kapasiteetti): 50-100 $/kk
- Application Insights: 5-50 $/kk
- Tallennustila (Premium): 10-50 $/kk

**💡 Kustannusten Optimointivinkit:**
- Käytä **Free Tier** Azure OpenAI -palvelua oppimiseen (sisältää 50 000 tokenia/kk)
- Suorita `azd down` vapauttaaksesi resursseja, kun et kehitä aktiivisesti
- Aloita kulutukseen perustuvalla laskutuksella, siirry PTU:hun vain tuotannossa
- Käytä `azd provision --preview` arvioidaksesi kustannuksia ennen käyttöönottoa
- Ota käyttöön automaattinen skaalaus: maksa vain todellisesta käytöstä

**Kustannusten Seuranta:**
```bash
# Tarkista arvioidut kuukausikustannukset
azd provision --preview

# Seuraa todellisia kustannuksia Azure-portaalissa
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Konfigurointi & Todennus
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 45-60 minuuttia  
**Vaativuus**: ⭐⭐

#### Mitä Opit
- Ympäristön konfigurointi ja hallinta
- Todennus ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimateriaalit
- **📖 Konfigurointi**: [Konfigurointiohje](docs/getting-started/configuration.md) - Ympäristön asetukset
- **🔐 Turvallisuus**: [Todennusmallit ja hallittu identiteetti](docs/getting-started/authsecurity.md) - Todennusmallit
- **📝 Esimerkit**: [Tietokantasovellus](examples/database-app/README.md) - AZD-tietokantaesimerkit

#### Käytännön Harjoitukset
- Konfiguroi useita ympäristöjä (kehitys, testaus, tuotanto)
- Ota käyttöön hallittu identiteetti todennukseen
- Toteuta ympäristökohtaiset konfiguraatiot

**💡 Luvun Tulos**: Hallitse useita ympäristöjä asianmukaisella todennuksella ja turvallisuudella

---

### 🏗️ Luku 4: Infrastruktuuri Koodina & Käyttöönotto
**Esivaatimukset**: Luvut 1-3 suoritettu  
**Kesto**: 1-1,5 tuntia  
**Vaativuus**: ⭐⭐⭐

#### Mitä Opit
- Edistyneet käyttöönoton mallit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisiointistrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/deployment/deployment-guide.md) - Täydelliset työnkulut
- **🏗️ Provisiointi**: [Resurssien provisiointi](docs/deployment/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App -esimerkki](../../examples/container-app) - Konttien käyttöönotot

#### Käytännön Harjoitukset
- Luo omia Bicep-malleja
- Ota käyttöön monipalvelusovelluksia
- Toteuta blue-green -käyttöönotto strategioita

**💡 Luvun Tulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia käyttäen omia infrastruktuurimalleja

---

### 🎯 Luku 5: Moniagenttiset AI-ratkaisut (Edistynyt)
**Esivaatimukset**: Luvut 1-2 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaativuus**: ⭐⭐⭐⭐

#### Mitä Opit
- Moniagenttiarkkitehtuurin mallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit AI-käyttöönotot

#### Oppimateriaalit
- **🤖 Esittelyprojekti**: [Vähittäiskaupan moniagenttiratkaisu](examples/retail-scenario.md) - Täydellinen toteutus

- **🛠️ ARM-mallit**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Yhden klikkauksen käyttöönotto
- **📖 Arkkitehtuuri**: [Moni-agentin koordinointimallit](/docs/pre-deployment/coordination-patterns.md) - Mallit

#### Käytännön harjoitukset
```bash
# Ota käyttöön täydellinen vähittäiskaupan moniedustajaratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutki agenttien kokoonpanoja
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Luvun tavoite**: Ota käyttöön ja hallitse tuotantovalmiita moni-agenttisia tekoälyratkaisuja, joissa on Asiakas- ja Varastoagentit

---

### 🔍 Luku 6: Ennakko-tarkastus ja suunnittelu
**Esivaatimukset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Kapasiteetin suunnittelu ja resurssien tarkastus
- SKU-valintastrategiat
- Ennakko-tarkastukset ja automaatio

#### Oppimateriaalit
- **📊 Suunnittelu**: [Kapasiteetin suunnittelu](docs/pre-deployment/capacity-planning.md) - Resurssien tarkastus
- **💰 Valinta**: [SKU-valinta](docs/pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Tarkastus**: [Ennakko-tarkastukset](docs/pre-deployment/preflight-checks.md) - Automaattiset skriptit

#### Käytännön harjoitukset
- Suorita kapasiteetin tarkastusskriptit
- Optimoi SKU-valinnat kustannusten mukaan
- Toteuta automatisoidut ennakko-tarkastukset

**💡 Luvun tavoite**: Tarkasta ja optimoi käyttöönotot ennen toteutusta

---

### 🚨 Luku 7: Vianetsintä ja virheenkorjaus
**Esivaatimukset**: Mikä tahansa käyttöönotto-luku suoritettu  
**Kesto**: 1-1,5 tuntia  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Järjestelmälliset virheenkorjausmenetelmät
- Yleiset ongelmat ja ratkaisut
- Tekoälyyn liittyvä vianetsintä

#### Oppimateriaalit
- **🔧 Yleiset ongelmat**: [Yleiset ongelmat](docs/troubleshooting/common-issues.md) - Usein kysytyt kysymykset ja ratkaisut
- **🕵️ Virheenkorjaus**: [Virheenkorjausopas](docs/troubleshooting/debugging.md) - Vaiheittaiset strategiat
- **🤖 Tekoälyongelmat**: [Tekoälyyn liittyvä vianetsintä](docs/troubleshooting/ai-troubleshooting.md) - Tekoälypalveluiden ongelmat

#### Käytännön harjoitukset
- Diagnosoi käyttöönoton epäonnistumiset
- Ratkaise todennusongelmat
- Virheenkorjaa tekoälypalvelun yhteysongelmat

**💡 Luvun tavoite**: Diagnosoi ja ratkaise yleiset käyttöönotto-ongelmat itsenäisesti

---

### 🏢 Luku 8: Tuotanto- ja yritysmallit
**Esivaatimukset**: Luvut 1-4 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaativuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritysturvallisuusmallit
- Valvonta ja kustannusten optimointi

#### Oppimateriaalit
- **🏭 Tuotanto**: [Tuotannon tekoälyn parhaat käytännöt](docs/microsoft-foundry/production-ai-practices.md) - Yritysmallit
- **📝 Esimerkit**: [Mikropalveluesimerkki](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Valvonta**: [Application Insights -integraatio](docs/pre-deployment/application-insights.md) - Valvonta

#### Käytännön harjoitukset
- Toteuta yritysturvallisuusmallit
- Ota käyttöön kattava valvonta
- Käyttöönotto tuotantoon asianmukaisella hallinnalla

**💡 Luvun tavoite**: Ota käyttöön yritysvalmiita sovelluksia täysillä tuotantotoiminnoilla

---

## 🎓 Työpajan yleiskatsaus: Käytännön oppimiskokemus

> **⚠️ TYÖPAJAN TILA: Kehitteillä**  
> Työpajan materiaalit ovat parhaillaan kehityksessä ja viimeistelyssä. Ydinmoduulit toimivat, mutta jotkin edistyneet osiot ovat keskeneräisiä. Työskentelemme aktiivisesti kaikkien sisältöjen valmiiksi saattamiseksi. [Seuraa edistymistä →](workshop/README.md)

### Interaktiiviset työpajamateriaalit
**Kattava käytännön oppiminen selaimessa toimivilla työkaluilla ja ohjatuilla harjoituksilla**

Työpajan materiaalit tarjoavat rakenteellisen, interaktiivisen oppimiskokemuksen, joka täydentää yllä olevaa lukuopetusta. Työpaja on suunniteltu sekä itsenäiseen opiskeluun että ohjattuihin sessioihin.

#### 🛠️ Työpajan ominaisuudet
- **Selaimessa toimiva käyttöliittymä**: Täydellinen MkDocs-pohjainen työpaja, jossa haku, kopiointi ja teemat
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristön pystytys
- **Rakenteellinen oppimispolku**: 7-vaiheiset ohjatut harjoitukset (yhteensä 3,5 tuntia)
- **Löytö → Käyttöönotto → Mukautus**: Jatkuva menetelmä
- **Interaktiivinen DevContainer-ympäristö**: Esikonfiguroidut työkalut ja riippuvuudet

#### 📚 Työpajan rakenne
Työpaja noudattaa **Löytö → Käyttöönotto → Mukautus** -menetelmää:

1. **Löytövaihe** (45 min)
   - Tutustu Microsoft Foundryn malleihin ja palveluihin
   - Ymmärrä moni-agenttien arkkitehtuurimallit
   - Tarkastele käyttöönoton vaatimuksia ja esivaatimuksia

2. **Käyttöönotto-vaihe** (2 tuntia)
   - Käytännön tekoälysovellusten käyttöönotto AZD:llä
   - Azure AI -palveluiden ja päätepisteiden konfigurointi
   - Turvallisuus- ja todennusmallien toteutus

3. **Mukautusvaihe** (45 min)
   - Sovellusten muokkaus erityistapauksiin
   - Optimointi tuotantokäyttöön
   - Valvonnan ja kustannusten hallinnan toteutus

#### 🚀 Työpajan aloitus
```bash
# Vaihtoehto 1: GitHub Codespaces (Suositeltu)
# Napsauta "Code" → "Create codespace on main" arkistossa

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Seuraa asennusohjeita tiedostossa workshop/README.md
```

#### 🎯 Työpajan oppimistavoitteet
Työpajan suorittamalla osallistujat:
- **Ottavat käyttöön tuotantovalmiita tekoälysovelluksia**: Käyttävät AZD:tä Microsoft Foundryn palveluiden kanssa
- **Hallitsevat moni-agenttiset arkkitehtuurit**: Toteuttavat koordinoituja tekoälyagenttiratkaisuja
- **Toteuttavat turvallisuuden parhaat käytännöt**: Konfiguroivat todennuksen ja käyttöoikeudet
- **Optimoivat skaalautuvuuden**: Suunnittelevat kustannustehokkaita ja suorituskykyisiä käyttöönottoja
- **Vianetsivät käyttöönottoja**: Ratkaisevat yleiset ongelmat itsenäisesti

#### 📖 Työpajan resurssit
- **🎥 Interaktiivinen opas**: [Työpajan materiaalit](workshop/README.md) - Selaimessa toimiva oppimisympäristö
- **📋 Vaiheittaiset ohjeet**: [Ohjatut harjoitukset](../../workshop/docs/instructions) - Yksityiskohtaiset läpikäynnit
- **🛠️ Tekoälytyöpaja-lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Tekoälyyn keskittyvät harjoitukset
- **💡 Nopean aloituksen opas**: [Työpajan asennusopas](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Täydellinen**: Yrityskoulutuksiin, yliopistokursseille, itsenäiseen opiskeluun ja kehittäjäbootcampeihin.

---

## 📖 Mikä on Azure Developer CLI?

Azure Developer CLI (azd) on kehittäjäkeskeinen komentorivityökalu, joka nopeuttaa sovellusten rakentamista ja käyttöönottoa Azureen. Se tarjoaa:

- **Mallipohjaiset käyttöönotot** - Käytä valmiita malleja yleisiin sovellusmalleihin
- **Infrastruktuuri koodina** - Hallitse Azure-resursseja Bicepillä tai Terraformilla  
- **Integroitu työnkulku** - Tarjoaa saumattoman provisioinnin, käyttöönoton ja valvonnan
- **Kehittäjäystävällinen** - Optimoitu kehittäjän tuottavuuteen ja käyttökokemukseen

### **AZD + Microsoft Foundry: Täydellinen tekoälyn käyttöönottoon**

**Miksi AZD tekoälyratkaisuihin?** AZD vastaa tekoälykehittäjien tärkeimpiin haasteisiin:

- **Tekoälyvalmiit mallit** - Esikonfiguroidut mallit Azure OpenAI:lle, Cognitive Servicesille ja ML-kuormille
- **Turvalliset tekoälyn käyttöönotot** - Sisäänrakennetut turvallisuusmallit tekoälypalveluille, API-avaimille ja mallipäätepisteille  
- **Tuotannon tekoälymallit** - Parhaat käytännöt skaalautuviin ja kustannustehokkaisiin tekoälysovelluksiin
- **End-to-End tekoälytyönkulut** - Mallin kehityksestä tuotantoon asianmukaisella valvonnalla
- **Kustannusten optimointi** - Älykkäät resurssien allokointi- ja skaalausstrategiat tekoälykuormille
- **Microsoft Foundry -integraatio** - Saumaton yhteys Microsoft Foundryn mallikatalogiin ja päätepisteisiin

---

## 🎯 Mallit ja esimerkkikirjasto

### Esittelyssä: Microsoft Foundryn mallit
**Aloita tästä, jos otat käyttöön tekoälysovelluksia!**

> **Huom:** Nämä mallit demonstroivat erilaisia tekoälymalleja. Osa on ulkoisia Azure-esimerkkejä, osa paikallisia toteutuksia.

| Malli | Luku | Vaativuus | Palvelut | Tyyppi |
|----------|---------|------------|----------|------|
| [**Aloita tekoälychatilla**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Aloita tekoälyagenteilla**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ulkoinen |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esittelyssä: Täydelliset oppimisskenaariot
**Tuotantovalmiit sovellusmallit oppimislukuihin sidottuna**

| Malli | Oppimisluku | Vaativuus | Keskeinen oppi |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perus tekoälyn käyttöönoton mallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchilla |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Dokumenttien älykkyyden integrointi |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja funktiokutsut |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritystason tekoälyorkestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moni-agenttinen arkkitehtuuri Asiakas- ja Varastoagenteilla |

### Oppiminen esimerkkityypin mukaan

> **📌 Paikalliset vs. ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Valmiita heti käytettäväksi  
> **Ulkopuoliset esimerkit** (Azure Samples) = Kloonaa linkatuista repositorioista

#### Paikalliset esimerkit (valmiita käytettäväksi)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Täydellinen tuotantovalmiiksi toteutettu ARM-malleilla
  - Moni-agenttinen arkkitehtuuri (Asiakas + Varastoagentit)
  - Kattava valvonta ja arviointi
  - Yhden klikkauksen käyttöönotto ARM-mallilla

#### Paikalliset esimerkit - Konttisovellukset (luvut 2-5)
**Kattavat konttikäyttöönottoesimerkit tässä repossa:**
- [**Container App Examples**](examples/container-app/README.md) - Täydellinen opas konttikäyttöönottoon
  - [Yksinkertainen Flask API](../../examples/container-app/simple-flask-api) - Perus REST API skaalaus nollaan
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices) - Tuotantovalmiit monipalvelukäyttöönotot
  - Nopean aloituksen, tuotannon ja edistyneet käyttöönotot
  - Valvonta, turvallisuus ja kustannusten optimointi

#### Ulkoiset esimerkit - Yksinkertaiset sovellukset (luvut 1-2)
**Kloonaa nämä Azure Samples -repositoriot aloittaaksesi:**
- [Yksinkertainen web-sovellus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Peruskäyttöönoton mallit
- [Staattinen verkkosivusto - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön käyttöönotto
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API:n käyttöönotto

#### Ulkoiset esimerkit - Tietokantaintegraatio (luvut 3-4)  
- [Tietokantasovellus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantayhteysmallit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless-tietotyönkulku

#### Ulkoiset esimerkit - Edistyneet mallit (luvut 4-8)
- [Java-mikropalvelut](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessointi  
- [Yrityksen ML-putki](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit ML-mallit

### Ulkoiset mallikokoelmat
- [**Virallinen AZD-malligalleria**](https://azure.github.io/awesome-azd/) - Virallisten ja yhteisön mallien kuratoitu kokoelma
- [**Azure Developer CLI -mallit**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Esimerkkihakemisto**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisilla selityksillä

---

## 📚 Oppimateriaalit ja viitteet

### Pikaviitteet
- [**Komenttien pikaopas**](resources/cheat-sheet.md) - Tärkeimmät azd-komennot järjestettyinä lukujen mukaan
- [**Sanasto**](resources/glossary.md) - Azure- ja azd-termit  
- [**UKK**](resources/faq.md) - Yleisiä kysymyksiä järjestettynä oppimislukujen mukaan
- [**Opas**](resources/study-guide.md) - Kattavat harjoitustehtävät

### Käytännön työpajat
- [**AI-työpajatyötila**](docs/microsoft-foundry/ai-workshop-lab.md) - Tee tekoälyratkaisuistasi AZD-jakelukelpoisia (2-3 tuntia)
- [**Interaktiivinen työpajaopas**](workshop/README.md) - Selaimessa toimiva työpaja MkDocsilla ja DevContainer-ympäristöllä
- [**Rakenteellinen oppimispolku**](../../workshop/docs/instructions) - 7-vaiheiset ohjatut harjoitukset (Tutkimus → Julkaisu → Mukauttaminen)
- [**AZD aloittelijoille -työpaja**](workshop/README.md) - Täydelliset käytännön työpajamateriaalit GitHub Codespaces -integraatiolla

### Ulkoiset oppimateriaalit
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure-hinnoittelulaskuri](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Pikavianetsintäopas

**Yleisiä aloittelijoiden kohtaamia ongelmia ja välittömiä ratkaisuja:**

### ❌ "azd: komentoa ei löydy"

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

### ❌ "Ei tilausta löytynyt" tai "Tilausta ei asetettu"

```bash
# Listaa käytettävissä olevat tilaukset
az account list --output table

# Aseta oletustilaus
az account set --subscription "<subscription-id-or-name>"

# Aseta AZD-ympäristölle
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Vahvista
az account show
```

### ❌ "InsufficientQuota" tai "Kiintiö ylittynyt"

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

### ❌ "azd up" epäonnistuu puolivälissä

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

### ❌ "Todennus epäonnistui" tai "Token vanhentunut"

```bash
# Todistaudu uudelleen
az logout
az login

azd auth logout
azd auth login

# Vahvista todennus
az account show
```

### ❌ "Resurssi on jo olemassa" tai nimeämiskonfliktit

```bash
# AZD luo ainutlaatuisia nimiä, mutta jos tulee ristiriita:
azd down --force --purge

# Yritä sitten uudelleen uudella ympäristöllä
azd env new dev-v2
azd up
```

### ❌ Mallipohjan käyttöönotto kestää liian kauan

**Normaalit odotusajat:**
- Yksinkertainen web-sovellus: 5-10 minuuttia
- Sovellus tietokannalla: 10-15 minuuttia
- Tekoälysovellukset: 15-25 minuuttia (OpenAI:n käyttöönotto on hidasta)

```bash
# Tarkista edistyminen
azd show

# Jos jumissa yli 30 minuuttia, tarkista Azure-portaali:
azd monitor
# Etsi epäonnistuneita käyttöönottoja
```

### ❌ "Lupa evätty" tai "Kielletty"

```bash
# Tarkista Azure-roolisi
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Tarvitset vähintään "Contributor"-roolin
# Pyydä Azure-järjestelmänvalvojaasi myöntämään:
# - Contributor (resursseille)
# - User Access Administrator (roolien määrittämiseen)
```

### ❌ Julkaistua sovelluksen URL-osoitetta ei löydy

```bash
# Näytä kaikki palvelupisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```

### 📚 Kattavat vianetsintäresurssit

- **Yleiset ongelmat:** [Yksityiskohtaiset ratkaisut](docs/troubleshooting/common-issues.md)
- **Tekoälyyn liittyvät ongelmat:** [AI-vianetsintä](docs/troubleshooting/ai-troubleshooting.md)
- **Virheenkorjausopas:** [Vaiheittainen virheenkorjaus](docs/troubleshooting/debugging.md)
- **Apua saatavilla:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Pikavianetsintäopas

**Yleisiä aloittelijoiden kohtaamia ongelmia ja välittömiä ratkaisuja:**

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
<summary><strong>❌ "Ei tilausta löytynyt" tai "Tilausta ei asetettu"</strong></summary>

```bash
# Listaa käytettävissä olevat tilaukset
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
<summary><strong>❌ "azd up" epäonnistuu puolivälissä</strong></summary>

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
<summary><strong>❌ "Todennus epäonnistui" tai "Token vanhentunut"</strong></summary>

```bash
# Todistaudu uudelleen
az logout
az login

azd auth logout
azd auth login

# Vahvista todennus
az account show
```
</details>

<details>
<summary><strong>❌ "Resurssi on jo olemassa" tai nimeämiskonfliktit</strong></summary>

```bash
# AZD luo ainutlaatuisia nimiä, mutta jos tulee ristiriita:
azd down --force --purge

# Yritä sitten uudelleen uudella ympäristöllä
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mallipohjan käyttöönotto kestää liian kauan</strong></summary>

**Normaalit odotusajat:**
- Yksinkertainen web-sovellus: 5-10 minuuttia
- Sovellus tietokannalla: 10-15 minuuttia
- Tekoälysovellukset: 15-25 minuuttia (OpenAI:n käyttöönotto on hidasta)

```bash
# Tarkista edistyminen
azd show

# Jos jumissa yli 30 minuuttia, tarkista Azure-portaali:
azd monitor
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
# - User Access Administrator (roolien määrittämiseen)
```
</details>

<details>
<summary><strong>❌ Julkaistua sovelluksen URL-osoitetta ei löydy</strong></summary>

```bash
# Näytä kaikki palvelupisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```
</details>

### 📚 Kattavat vianetsintäresurssit

- **Yleiset ongelmat:** [Yksityiskohtaiset ratkaisut](docs/troubleshooting/common-issues.md)
- **Tekoälyyn liittyvät ongelmat:** [AI-vianetsintä](docs/troubleshooting/ai-troubleshooting.md)
- **Virheenkorjausopas:** [Vaiheittainen virheenkorjaus](docs/troubleshooting/debugging.md)
- **Apua saatavilla:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suoritus ja sertifiointi

### Edistymisen seuranta
Seuraa oppimisesi edistymistä jokaisen luvun kohdalla:

- [ ] **Luku 1**: Perusteet & pika-aloitus ✅
- [ ] **Luku 2**: AI-ensimmäinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & todennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & julkaisu ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Ennen julkaisua - validointi & suunnittelu ✅
- [ ] **Luku 7**: Vianetsintä & virheenkorjaus ✅
- [ ] **Luku 8**: Tuotanto & yritysmallit ✅

### Oppimisen varmistus
Jokaisen luvun jälkeen varmista osaamisesi:
1. **Käytännön harjoitus**: Suorita luvun käytännön julkaisu
2. **Tietotesti**: Tarkista luvun UKK-osio
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavaan vaativuustasoon

### Kurssin suorittamisen edut
Kun olet suorittanut kaikki luvut, sinulla on:
- **Tuotantokokemus**: Julkaissut oikeita tekoälysovelluksia Azureen
- **Ammatilliset taidot**: Yrityskäyttöön valmiit julkaisut  
- **Yhteisön tunnustus**: Aktiivinen Azure-kehittäjäyhteisön jäsen
- **Urapolun edistys**: Kysytyt AZD- ja AI-julkaisutaitoja

---

## 🤝 Yhteisö & tuki

### Hanki apua ja tukea
- **Tekniset ongelmat**: [Ilmoita virheistä ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord -yhteisö](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spesifinen apu**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemyksiä Microsoft Foundry Discordista

**Viimeaikaiset äänestystulokset #Azure-kanavalta:**
- **45 %** kehittäjistä haluaa käyttää AZD:tä AI-työkuormissa
- **Suurimmat haasteet**: Monipalvelujulkaisut, tunnistetietojen hallinta, tuotantovalmius  
- **Eniten toivottua**: AI-spesifiset mallipohjat, vianetsintäoppaat, parhaat käytännöt

**Liity yhteisöömme, jotta voit:**
- Jakaa AZD + AI -kokemuksiasi ja saada apua
- Saada varhaisia esikatseluja uusista AI-mallipohjista
- Osallistua AI-julkaisun parhaiden käytäntöjen kehittämiseen
- Vaikuttaa tulevien AI + AZD -ominaisuuksien kehitykseen

### Osallistuminen kurssiin
Otamme mielellämme vastaan panoksia! Lue [Osallistumisopas](CONTRIBUTING.md) saadaksesi lisätietoja:
- **Sisällön parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uudet esimerkit**: Lisää käytännön tilanteita ja mallipohjia  
- **Käännökset**: Auta ylläpitämään monikielistä tukea
- **Virheraportit**: Paranna tarkkuutta ja selkeyttä
- **Yhteisön säännöt**: Noudata osallistavaa yhteisöohjeistustamme

---

## 📄 Kurssin tiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - katso [LICENSE](../../LICENSE) tiedosto lisätietoja varten.

### Liittyvät Microsoftin oppimateriaalit

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
 
### Generatiivinen AI -sarja
[![Generatiivinen AI aloittelijoille](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Perusoppiminen
[![ML aloittelijoille](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science aloittelijoille](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
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

## 🗺️ Kurssin navigointi

**🚀 Valmis aloittamaan oppiminen?**

**Aloittelijat**: Aloita [Luku 1: Perusteet & Pikakäynnistys](../..)  
**AI-kehittäjät**: Siirry kohtaan [Luku 2: AI-ensimmäinen kehitys](../..)  
**Kokeneet kehittäjät**: Aloita [Luku 3: Konfigurointi & Todennus](../..)

**Seuraavat askeleet**: [Aloita luku 1 - AZD:n perusteet](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattikäännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->