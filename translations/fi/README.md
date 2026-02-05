<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T12:34:07+00:00",
  "source_file": "README.md",
  "language_code": "fi"
}
-->
# AZD Aloittelijoille: Rakenteellinen Oppimismatka

![AZD-for-beginners](../../../../translated_images/fi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Kurssin Aloitus

Seuraa näitä vaiheita aloittaaksesi AZD-oppimismatkasi:

1. **Forkkaa Repositorio**: Klikkaa [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonaa Repositorio**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Liity Yhteisöön**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) asiantuntijatukea varten
4. **Valitse Oppimispolkusi**: Valitse alla oleva luku, joka vastaa kokemustasoasi

### Monikielinen Tuki

#### Automaattiset Käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Haluatko mieluummin kloonata paikallisesti?**

> Tämä repositorio sisältää yli 50 käännöstä, mikä lisää merkittävästi lataustiedoston kokoa. Jos haluat kloonata ilman käännöksiä, käytä sparse checkoutia:  
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Saat kaiken tarvitsemasi kurssin suorittamiseen paljon nopeammalla latauksella.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurssin Yleiskatsaus

Hallinnoi Azure Developer CLI:tä (azd) rakenteellisten lukujen avulla, jotka on suunniteltu asteittaiseen oppimiseen. **Erityinen painotus AI-sovellusten käyttöönottoon Microsoft Foundry -integraation kanssa.**

### Miksi Tämä Kurssi On Tärkeä Nykyaikaisille Kehittäjille

Microsoft Foundry Discord -yhteisön näkemyksiin perustuen, **45 % kehittäjistä haluaa käyttää AZD:tä AI-työkuormissa** mutta kohtaa haasteita:
- Monimutkaiset moni-palvelu AI-arkkitehtuurit
- Parhaat käytännöt AI-tuotantokäyttöönotossa  
- Azure AI -palveluiden integraatio ja konfigurointi
- AI-työkuormien kustannusten optimointi
- AI-spesifisten käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Suorittamalla tämän rakenteisen kurssin opit:
- **Hallitse AZD:n Perusteet**: Peruskäsitteet, asennus ja konfigurointi
- **Ota AI-sovellukset käyttöön**: Käytä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Toteuta infrastruktuuri koodina**: Hallitse Azuren resursseja Bicep-mallien avulla
- **Vianmääritys käyttöönotossa**: Ratkaise yleiset ongelmat ja debuggaa
- **Optimoi tuotantoon**: Turvallisuus, skaalaus, valvonta ja kustannusten hallinta
- **Rakenna moni-agenttisia ratkaisuja**: Ota käyttöön monimutkaisia AI-arkkitehtuureja

## 📚 Oppimislukujen Sisältö

*Valitse oppimispolkusi kokemustason ja tavoitteiden mukaan*

### 🚀 Luku 1: Perusteet & Nopea Aloitus  
**Esivaatimukset**: Azure-tilaus, perustiedot komentorivistä  
**Kesto**: 30-45 minuuttia  
**Vaativuus**: ⭐

#### Mitä Opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Mikä on Azure Developer CLI?](../..)
- **📖 Teoria**: [AZD:n perusteet](docs/getting-started/azd-basics.md) - Keskeiset käsitteet ja termit
- **⚙️ Asennus**: [Asennus & Konfigurointi](docs/getting-started/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön harjoitus**: [Ensimmäinen projekti](docs/getting-started/first-project.md) - Vaiheittainen opas
- **📋 Pikatiedot**: [Komentojen pikaopas](resources/cheat-sheet.md)

#### Käytännön Harjoitukset
```bash
# Nopeustarkastus
azd version

# Ota käyttöön ensimmäinen sovelluksesi
azd init --template todo-nodejs-mongo
azd up
```

**💡 Lukujen Tulos**: Onnistuneesti ota käyttöön yksinkertainen web-sovellus Azureen AZD:llä

**✅ Onnistumistodistus:**
```bash
# Luvun 1 suorittamisen jälkeen sinun tulisi osata:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projekti
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Puhdistaa resurssit
```

**📊 Aika-arvio:** 30-45 minuuttia  
**📈 Taitotaso suorituksen jälkeen:** Pystyy ottamaan käyttöön perussovelluksia itsenäisesti

**✅ Onnistumistodistus:**
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
**📈 Taitotaso suorituksen jälkeen:** Pystyy ottamaan käyttöön perussovelluksia itsenäisesti

---

### 🤖 Luku 2: AI-Ensisijainen Kehitys (suositellaan AI-kehittäjille)  
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 1-2 tuntia  
**Vaativuus**: ⭐⭐

#### Mitä Opit
- Microsoft Foundryn integraatio AZD:n kanssa
- AI-vetoisten sovellusten käyttöönotto
- AI-palvelujen konfiguroinnin ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Microsoft Foundry -integraatio](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mallit**: [AI-mallien käyttöönotto](docs/microsoft-foundry/ai-model-deployment.md) - AI-mallien käyttöönotto ja hallinta
- **🛠️ Työpaja**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen opas**: [Työpajan materiaalit](workshop/README.md) - Selainpohjainen oppiminen MkDocs * DevContainer -ympäristössä
- **📋 Mallipohjat**: [Microsoft Foundryn mallit](../..)
- **📝 Esimerkit**: [AZD käyttöönottoesimerkit](examples/README.md)

#### Käytännön Harjoitukset
```bash
# Ota käyttöösi ensimmäinen tekoälysovelluksesi
azd init --template azure-search-openai-demo
azd up

# Kokeile lisätekoälytemplaatteja
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Lukujen Tulos**: Ota käyttöön ja konfiguroi AI-vetoinen chat-sovellus RAG-ominaisuuksilla

**✅ Onnistumistodistus:**
```bash
# Luvun 2 jälkeen sinun pitäisi pystyä:
azd init --template azure-search-openai-demo
azd up
# Testaamaan tekoälykeskustelukäyttöliittymää
# Kysymään kysymyksiä ja saamaan tekoälypohjaisia vastauksia lähteineen
# Varmistamaan, että hakutoiminto toimii
azd monitor  # Tarkistamaan, että Application Insights näyttää telemetrian
azd down --force --purge
```

**📊 Aika-arvio:** 1-2 tuntia  
**📈 Taitotaso suorituksen jälkeen:** Pystyy ottamaan käyttöön ja konfiguroimaan tuotantovalmiit AI-sovellukset  
**💰 Kustannustietoisuus:** Ymmärtää $80-150/kk kehityskustannukset, $300-3500/kk tuotantokustannukset

#### 💰 AI-käyttöönoton kustannusnäkökohdat

**Kehitysympäristö (Arvio $80-150/kk):**
- Azure OpenAI (Pay-as-you-go): $0-50/kk (token-käytön mukaan)
- AI-haku (perustaso): $75/kk
- Container Apps (kulutuksen mukaan): $0-20/kk
- Tallennustila (standardi): $1-5/kk

**Tuotantoympäristö (Arvio $300-3,500+/kk):**
- Azure OpenAI (PTU vakaan suorituskyvyn takaamiseksi): $3,000+/kk TAI Maksu käytön mukaan suurissa volyymeissä
- AI-haku (standarditaso): $250/kk
- Container Apps (omistettu): $50-100/kk
- Application Insights: $5-50/kk
- Tallennustila (premium): $10-50/kk

**💡 Kustannusten optimointivinkit:**
- Käytä **Free Tier** Azure OpenAI -palvelua oppimiseen (sisältää 50 000 tokenia/kk)
- Suorita `azd down` vapauttaaksesi resursseja, kun et aktiivisesti kehitä
- Aloita kulutusperusteisella laskutuksella, nosta PTU:hun vain tuotantoon
- Käytä `azd provision --preview` kustannusten arviointiin ennen käyttöönottoa
- Ota käyttöön automaattinen skaalaus: maksa vain käytöstä

**Kustannusten Seuranta:**
```bash
# Tarkista arvioidut kuukausittaiset kustannukset
azd provision --preview

# Seuraa todellisia kustannuksia Azure-portaalissa
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Konfigurointi & Autentikointi  
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 45-60 minuuttia  
**Vaativuus**: ⭐⭐

#### Mitä Opit
- Ympäristön konfigurointi ja hallinta
- Autentikointi ja turvallisuuden parhaat käytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimateriaalit
- **📖 Konfigurointi**: [Konfigurointiopas](docs/getting-started/configuration.md) - Ympäristön asetus
- **🔐 Turvallisuus**: [Autentikointimallit ja hallittu identiteetti](docs/getting-started/authsecurity.md) - Autentikointimallit
- **📝 Esimerkit**: [Tietokantasovellus](examples/database-app/README.md) - AZD-tietokantaesimerkit

#### Käytännön harjoitukset
- Konfiguroi useita ympäristöjä (dev, staging, prod)
- Ota käyttöön hallittu identiteetin autentikointi
- Toteuta ympäristökohtaiset konfiguraatiot

**💡 Lukujen Tulos**: Hallitse useita ympäristöjä asianmukaisella autentikoinnilla ja turvallisuudella

---

### 🏗️ Luku 4: Infrastruktuuri Koodina & Käyttöönotto  
**Esivaatimukset**: Luvut 1-3 suoritettu  
**Kesto**: 1-1.5 tuntia  
**Vaativuus**: ⭐⭐⭐

#### Mitä Opit
- Edistyneet käyttöönotto-mallit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisiointistrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/deployment/deployment-guide.md) - Koko työnkulut
- **🏗️ Provisiointi**: [Resurssien provisiointi](docs/deployment/provisioning.md) - Azuren resurssien hallinta
- **📝 Esimerkit**: [Container App -esimerkki](../../examples/container-app) - Kontitettujen sovellusten käyttöönotto

#### Käytännön harjoitukset
- Luo omia Bicep-malleja
- Ota käyttöön moni-palvelu-sovelluksia
- Toteuta blue-green deploy -strategioita

**💡 Lukujen Tulos**: Ota käyttöön monimutkaisia moni-palvelusovelluksia omilla infrastruktuurimalleilla

---

### 🎯 Luku 5: Moni-Agenttiset AI-Ratkaisut (Edistynyt)  
**Esivaatimukset**: Luvut 1-2 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaativuus**: ⭐⭐⭐⭐

#### Mitä Opit
- Moni-agenttien arkkitehtuurimallit
- Agenttien orkestrointi ja koordinointi  
- Tuotantokäyttövalmiit tekoälyn käyttöönotot

#### Oppimateriaalit  
- **🤖 Esitelty projekti**: [Retail Multi-Agent Solution](examples/retail-scenario.md) – Täydellinen toteutus  
- **🛠️ ARM-mallit**: [ARM Template Package](../../examples/retail-multiagent-arm-template) – Yhden klikkauksen käyttöönotto  
- **📖 Arkkitehtuuri**: [Moni-agentin koordinointimallit](/docs/pre-deployment/coordination-patterns.md) – Mallit

#### Käytännön harjoitukset  
```bash
# Ota käyttöön täydellinen vähittäiskaupan moniedustajaratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutki edustajien kokoonpanoja
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Luvun tavoite**: Ota käyttöön ja hallitse tuotantovalmiita moni-agentin tekoälyratkaisuja Customer- ja Inventory-agenttien kanssa

---

### 🔍 Luku 6: Esikäyttöönoton validointi ja suunnittelu  
**Esivaatimukset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Vaativuus**: ⭐⭐

#### Mitä opit  
- Kapasiteettisuunnittelu ja resurssien validointi  
- SKU-valintastrategiat  
- Esilento-tarkastukset ja automaatio  

#### Oppimateriaalit  
- **📊 Suunnittelu**: [Kapasiteettisuunnittelu](docs/pre-deployment/capacity-planning.md) – Resurssien validointi  
- **💰 Valinta**: [SKU-valinta](docs/pre-deployment/sku-selection.md) – Kustannustehokkaat valinnat  
- **✅ Validointi**: [Esilento-tarkistukset](docs/pre-deployment/preflight-checks.md) – Automaattiset skriptit

#### Käytännön harjoitukset  
- Suorita kapasiteetin validointiskriptit  
- Optimoi SKU-valinnat kustannusten mukaan  
- Ota käyttöön automaattiset esikäyttöönoton tarkastukset

**💡 Luvun tavoite**: Varmista ja optimoi käyttöönotot ennen toteutusta

---

### 🚨 Luku 7: Vianmääritys ja virheenkorjaus  
**Esivaatimukset**: Minkä tahansa käyttöönotto-luvun suoritus  
**Kesto**: 1-1,5 tuntia  
**Vaativuus**: ⭐⭐

#### Mitä opit  
- Järjestelmälliset virheenkorjausmenetelmät  
- Yleiset ongelmat ja ratkaisut  
- Tekoälyyn liittyvä vianmääritys  

#### Oppimateriaalit  
- **🔧 Yleiset ongelmat**: [Yleiset ongelmat](docs/troubleshooting/common-issues.md) – Usein kysytyt kysymykset ja ratkaisut  
- **🕵️ Virheenkorjaus**: [Virheenkorjauksen opas](docs/troubleshooting/debugging.md) – Vaiheittaiset strategiat  
- **🤖 Tekoälyn ongelmat**: [Tekoälykohtainen vianmääritys](docs/troubleshooting/ai-troubleshooting.md) – AI-palvelujen ongelmat

#### Käytännön harjoitukset  
- Diagnosoi käyttöönoton epäonnistumiset  
- Ratkaise autentikointiongelmat  
- Virheenkorjaa AI-palvelujen yhteydet

**💡 Luvun tavoite**: Diagnoosi ja ratkaisu yleisiin käyttöönotto-ongelmiin itsenäisesti

---

### 🏢 Luku 8: Tuotanto- ja yritysmallit  
**Esivaatimukset**: Luvut 1-4 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaativuus**: ⭐⭐⭐⭐

#### Mitä opit  
- Tuotantokäyttöönoton strategiat  
- Yritystason tietoturvamallit  
- Valvonta ja kustannusoptimointi  

#### Oppimateriaalit  
- **🏭 Tuotanto**: [Tuotannon AI parhaat käytännöt](docs/microsoft-foundry/production-ai-practices.md) – Yritysmallit  
- **📝 Esimerkit**: [Mikropalvelu-esimerkki](../../examples/microservices) – Monimutkaiset arkkitehtuurit  
- **📊 Valvonta**: [Application Insights -integraatio](docs/pre-deployment/application-insights.md) – Valvonta  

#### Käytännön harjoitukset  
- Toteuta yritystason tietoturvamallit  
- Ota käyttöön kattava valvonta  
- Ota käyttöön tuotantoon asianmukaisella hallinnalla

**💡 Luvun tavoite**: Ota käyttöön yritystason sovelluksia täysillä tuotantoominaisuuksilla

---

## 🎓 Työpajan yleiskuvaus: Käytännön oppimiskokemus

> **⚠️ TYÖPAJAN TILA: Käynnissä oleva kehitys**  
> Työpajamateriaalit ovat tällä hetkellä kehityksen ja viimeistelyn alla. Ydinmoduulit ovat toiminnassa, mutta osa kehittyneemmistä osioista on keskeneräisiä. Työskentelemme aktiivisesti saadaksemme kaiken valmiiksi. [Seuraa edistymistä →](workshop/README.md)

### Interaktiiviset työpajamateriaalit  
**Laaja käytännön oppiminen selainpohjaisten työkalujen ja ohjattujen harjoitusten avulla**

Työpaja tarjoaa rakenteellisen, interaktiivisen oppimiskokemuksen, joka täydentää yllä mainittua luku- tai moduuliperusteista opetussuunnitelmaa. Työpaja on suunniteltu sekä itsenäiseen opiskeluun että ohjattuun opetukseen.

#### 🛠️ Työpajan ominaisuuksia  
- **Selainpohjainen käyttöliittymä**: Täydellinen MkDocs-pohjainen työpaja, jossa haku, kopiointi ja teemaominaisuudet  
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristön asetukset  
- **Rakenteinen oppimispolku**: 7 vaiheen ohjatut harjoitukset (3,5 tuntia yhteensä)  
- **Tutkimus → Käyttöönotto → Mukautus**: Progressiivinen toimintamalli  
- **Interaktiivinen DevContainer-ympäristö**: Ennakkoon konfiguroidut työkalut ja riippuvuudet  

#### 📚 Työpajan rakenne  
Työpaja seuraa **Tutkimus → Käyttöönotto → Mukautus** -menetelmää:

1. **Tutkimusvaihe** (45 min)  
   - Tutustu Microsoft Foundry -malleihin ja -palveluihin  
   - Ymmärrä moni-agentin arkkitehtuurimallit  
   - Tarkastele käyttöönoton vaatimuksia ja esivaatimuksia  

2. **Käyttöönotto vaihe** (2 tuntia)  
   - Käytännön AI-sovellusten käyttöönotto AZD-työkalulla  
   - Konfiguroi Azure AI -palvelut ja päätelaitteiden päätepisteet  
   - Toteuta tietoturva- ja autentikointimallit  

3. **Mukautusvaihe** (45 min)  
   - Muokkaa sovelluksia erityistapauksiin  
   - Optimoi tuotantokäyttöönotto  
   - Toteuta valvonta ja kustannusten hallinta  

#### 🚀 Aloita työpaja  
```bash
# Vaihtoehto 1: GitHub Codespaces (suositeltu)
# Napsauta "Code" → "Create codespace on main" repositoriossa

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Seuraa asennusohjeita tiedostossa workshop/README.md
```
  
#### 🎯 Työpajan oppimistavoitteet  
Työpajan suorittamalla osallistujat:  
- **Ottavat käyttöön tuotantovalmiita AI-sovelluksia**: Käytä AZD-plust Microsoft Foundryn palveluja  
- **Hallitsevat moni-agentin arkkitehtuurit**: Toteuta koordinoituja tekoälyagenttiratkaisuja  
- **Toteuttavat tietoturvan parhaat käytännöt**: Konfiguroi autentikointi ja käyttöoikeudet  
- **Optimoi laajennettavuudelle**: Suunnittele kustannustehokkaita ja suorituskykyisiä käyttöönottoja  
- **Ratkaisevat käyttöönotto-ongelmia**: Korjaa yleisiä ongelmia itsenäisesti  

#### 📖 Työpajan materiaalit  
- **🎥 Interaktiivinen opas**: [Workshop Materials](workshop/README.md) – Selainpohjainen oppimisympäristö  
- **📋 Vaiheittaiset ohjeet**: [Guided Exercises](../../workshop/docs/instructions) – Yksityiskohtaiset läpikäynnit  
- **🛠️ AI-työpaja laboratorio**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) – AI-kohdistetut harjoitukset  
- **💡 Pikakäynnistys**: [Workshop Setup Guide](workshop/README.md#quick-start) – Ympäristön konfigurointi  

**Täydellinen**: Yrityskoulutukseen, yliopistokursseille, itsenäiseen oppimiseen ja kehittäjäbootcampeihin.

---

## 📖 Mikä on Azure Developer CLI?

Azure Developer CLI (azd) on kehittäjäkeskeinen komentorivityökalu, joka nopeuttaa sovellusten rakentamista ja käyttöönottoa Azureen. Se tarjoaa:

- **Mallipohjaiset käyttöönotot** – Käytä valmiita malleja yleisiin sovellusmalleihin  
- **Infrastruktuuri koodina** – Hallitse Azure-resursseja Bicep- tai Terraform-työkaluilla  
- **Integroitu työnkulku** – Joustava provisiointi, käyttöönotto ja sovellusten seuranta  
- **Kehittäjäystävällinen** – Optimoitu kehittäjän tuottavuudelle ja käyttökokemukselle  

### **AZD + Microsoft Foundry: Täydelliset tekoälyn käyttöönotot**

**Miksi AZD AI-ratkaisuille?** AZD vastaa tekoälykehittäjien tärkeimpiin haasteisiin:

- **Tekoälyvalmiit mallit** – Valmiiksi konfiguroidut mallit Azure OpenAI:lle, Cognitive Servicesille ja koneoppimiskuormille  
- **Turvalliset tekoälyn käyttöönotot** – Sisäänrakennetut tietoturvamallit AI-palveluille, API-avaimille ja mallipäätepisteille  
- **Tuotantokäyttömallit AI:lle** – Parhaat käytännöt skaalautuviin, kustannustehokkaisiin AI-sovellusprojekteihin  
- **End-to-end AI-työnkulut** – Mallin kehityksestä tuotantoon asianmukaisella valvonnalla  
- **Kustannusoptimointi** – Älykkäät resurssien jakamis- ja skaalausstrategiat AI-kuormille  
- **Microsoft Foundry -integraatio** – Saumaton yhteys Microsoft Foundryn mallikatalogiin ja päätepisteisiin  

---

## 🎯 Mallipohjat ja esimerkkikirjasto

### Esillä: Microsoft Foundry -mallipohjat  
**Aloita tästä, jos otat AI-sovelluksia käyttöön!**

> **Huom:** Nämä mallit esittelevät erilaisia AI-malleja. Osa on ulkoisia Azure Sampleja, osa paikallisia toteutuksia.

| Malli | Luku | Vaativuus | Palvelut | Tyyppi |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esillä: Täydelliset oppimisskenaariot  
**Tuotantovalmiit sovellusmallit, jotka on linkitetty oppimislukuihin**

| Malli | Oppimisalue | Vaativuus | Keskeinen oppi |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perus AI-käyttöönoton mallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchilla |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Dokumentti-integraatio |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja funktiokutsut |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritystason AI-orkestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moni-agentin arkkitehtuuri Customer- ja Inventory-agenteilla |

### Oppiminen esimerkkityypin mukaan

> **📌 Paikalliset vs. Ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Käyttövalmiita heti  
> **Ulkoiset esimerkit** (Azure Samples) = Kloonaa linkatusta repoista  

#### Paikalliset esimerkit (Valmiita käyttää)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) – Täydellinen tuotantovalmiiksi toteutus ARM-malleilla  
  - Moni-agentin arkkitehtuuri (Customer + Inventory-agentit)  
  - Laaja valvonta ja arviointi  
  - Yhden klikkauksen käyttöönotto ARM-mallilla  

#### Paikalliset esimerkit – Container-sovellukset (luvut 2–5)  
**Laaja konttipohjaisten käyttöönottoesimerkkien kokoelma tässä repossa:**  
- [**Container App Examples**](examples/container-app/README.md) – Täydellinen opas konttikäyttöönottoihin  
  - [Yksinkertainen Flask API](../../examples/container-app/simple-flask-api) – Perus REST API skaalaus-nollaan  
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices) – Tuotantovalmiit moni-palvelukäyttöönotot  
  - Pikakäynnistys, tuotanto ja edistyneet käyttöönotot  
  - Valvonta, tietoturva ja kustannusohjeistus  

#### Ulkoiset esimerkit – Yksinkertaiset sovellukset (luvut 1–2)  
**Kloonaa nämä Azure Sample -repositoriot aloitusta varten:**  
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) – Peruskäyttöönoton mallit  
- [Staattinen verkkosivusto - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) – Staattisen sisällön käyttöönotto  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) – REST API käyttöönotto  

#### Ulkoiset esimerkit – Tietokantaintegraatio (luvut 3–4)  
- [Tietokantasovellus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) – Tietokantayhteysmallit  
- [Funktiot + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) – Serverless-tietojenkäsittely

#### Ulkoiset esimerkit – Edistyneet mallit (luvut 4–8)  
- [Java-mikropalvelut](https://github.com/Azure-Samples/java-microservices-aca-lab) – Monipalveluarkkitehtuurit  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) – Taustaprosessointi  
- [Yritystason ML-putki](https://github.com/Azure-Samples/mlops-v2) – Tuotantovalmiit ML-mallit  

### Ulkoiset mallikokoelmat  
- [**Virallinen AZD Malligalleria**](https://azure.github.io/awesome-azd/) – Kokoelma virallisia ja yhteisön malleja  
- [**Azure Developer CLI Mallit**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) – Microsoft Learn -mallidokumentaatio  
- [**Esimerkkikansio**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisilla selityksillä

---

## 📚 Oppimateriaalit & Viitteet

### Nopeat Viitteet
- [**Komentokooste**](resources/cheat-sheet.md) - Tärkeimmät azd-komennot järjestettyinä lukuihin
- [**Sanasto**](resources/glossary.md) - Azure- ja azd-termiikka  
- [**Usein Kysytyt Kysymykset**](resources/faq.md) - Yleiset kysymykset järjestettynä oppimislukuihin
- [**Opas Harjoitteluun**](resources/study-guide.md) - Kattavat harjoitustehtävät

### Käytännön Työpajat
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-jakelukelpoisia (2-3 tuntia)
- [**Interaktiivinen Työpajaopas**](workshop/README.md) - Selainpohjainen työpaja MkDocs- ja DevContainer-ympäristössä
- [**Rakenteellinen Oppimispolku**](../../workshop/docs/instructions) - 7-vaiheiset ohjatut harjoitukset (Tutkiminen → Julkaisu → Räätälöinti)
- [**AZD Aloittelijoille -työpaja**](workshop/README.md) - Täydelliset käytännön materiaalit GitHub Codespaces -integraatiolla

### Ulkoiset Oppimateriaalit
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Hinnoittelulaskin](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Nopea Vianmääritysopas

**Aloittelijoiden yleiset ongelmat ja välittömät ratkaisut:**

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

### ❌ "Tilausta ei löytynyt" tai "Tilausta ei asetettu"

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

### ❌ "Riittämätön kiintiö" tai "Kiintiö ylittynyt"

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
# Uudelleenautentikoi
az logout
az login

azd auth logout
azd auth login

# Vahvista todennus
az account show
```

### ❌ "Resurssi on jo olemassa" tai nimikonfliktit

```bash
# AZD luo uniikkeja nimiä, mutta jos tulee ristiriita:
azd down --force --purge

# Yritä sitten uudelleen uudella ympäristöllä
azd env new dev-v2
azd up
```

### ❌ Mallipohjan käyttöönotto kestää liian kauan

**Normaalit odotusajat:**
- Yksinkertainen web-sovellus: 5-10 minuuttia
- Sovellus tietokannalla: 10-15 minuuttia
- AI-sovellukset: 15-25 minuuttia (OpenAI:n käyttöönotto on hidasta)

```bash
# Tarkista eteneminen
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
# - User Access Administrator (rooliasetuksille)
```

### ❌ Julkaistun sovelluksen URL-osoitetta ei löydy

```bash
# Näytä kaikki palvelupisteet
azd show

# Tai avaa Azure Portal
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```

### 📚 Täydelliset vianmääritysresurssit

- **Yleiset Ongelmat:** [Yksityiskohtaiset ratkaisut](docs/troubleshooting/common-issues.md)
- **AI-spesifiset ongelmat:** [AI-vianmääritys](docs/troubleshooting/ai-troubleshooting.md)
- **Debuggausopas:** [Vaiheittainen debuggaus](docs/troubleshooting/debugging.md)
- **Apua saat:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Nopea Vianmääritysopas

**Aloittelijoiden yleiset ongelmat ja välittömät ratkaisut:**

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
<summary><strong>❌ "Tilausta ei löytynyt" tai "Tilausta ei asetettu"</strong></summary>

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
<summary><strong>❌ "Riittämätön kiintiö" tai "Kiintiö ylittynyt"</strong></summary>

```bash
# Kokeile eri Azure-aluetta
azd env set AZURE_LOCATION "westus2"
azd up

# Tai käytä pienempiä SKU:ja kehityksessä
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
# Vahvista uudelleen
az logout
az login

azd auth logout
azd auth login

# Tarkista todennus
az account show
```
</details>

<details>
<summary><strong>❌ "Resurssi on jo olemassa" tai nimikonfliktit</strong></summary>

```bash
# AZD luo ainutlaatuisia nimiä, mutta jos syntyy ristiriita:
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
- AI-sovellukset: 15-25 minuuttia (OpenAI:n käyttöönotto on hidasta)

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
<summary><strong>❌ Julkaistun sovelluksen URL-osoitetta ei löydy</strong></summary>

```bash
# Näytä kaikki palvelun päätepisteet
azd show

# Tai avaa Azure Portal
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```
</details>

### 📚 Täydelliset vianmääritysresurssit

- **Yleiset Ongelmat:** [Yksityiskohtaiset ratkaisut](docs/troubleshooting/common-issues.md)
- **AI-spesifiset ongelmat:** [AI-vianmääritys](docs/troubleshooting/ai-troubleshooting.md)
- **Debuggausopas:** [Vaiheittainen debuggaus](docs/troubleshooting/debugging.md)
- **Apua saat:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin Suoritus & Sertifiointi

### Edistymisen Seuranta
Seuraa oppimisesi edistymistä jokaisen luvun kohdalla:

- [ ] **Luku 1**: Perusteet & Pika-aloitus ✅
- [ ] **Luku 2**: AI-Ensimmäinen Kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & Todennus ✅
- [ ] **Luku 4**: Infrastruktuuri Koodina & Julkaisu ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Esijulkaisuvalidointi & Suunnittelu ✅
- [ ] **Luku 7**: Vianmääritys & Debuggaus ✅
- [ ] **Luku 8**: Tuotanto & Yritysmallit ✅

### Oppimisen Varmistus
Jokaisen luvun jälkeen varmista tietosi seuraavasti:
1. **Käytännön Harjoitus**: Suorita luvun käytännön julkaisu
2. **Tietotarkistus**: Käy läpi luvun UKK-osio
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava Luku**: Siirry seuraavalle vaikeustasolle

### Kurssin Suoritusetuja
Kun olet suorittanut kaikki luvut, sinulla on:
- **Tuotantokokemus**: Olet julkaissut oikeita AI-sovelluksia Azureen
- **Ammatilliset Taidot**: Yrityskäyttöön valmiit julkaisutaidot  
- **Yhteisön Tunnustus**: Aktiivinen jäsen Azure-kehittäjäyhteisössä
- **Uraedistys**: Kysyntää oleva AZD- ja AI-julkaisuosaaminen

---

## 🤝 Yhteisö & Tuki

### Hae Apua & Tukea
- **Tekniset Ongelmat**: [Ilmoita virheistä ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord -yhteisö](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spesifinen Apua**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön Näkemyksiä Microsoft Foundry Discordista

**Äskettäiset Kyselytulokset #Azure-kanavalta:**
- **45%** kehittäjistä haluaa käyttää AZD:tä AI-kuormituksiin
- **Suurimmat haasteet**: Monipalvelujulkaisut, tunnistetietojen hallinta, tuotantovalmius  
- **Eniten pyydetyt**: AI-spesifiset mallipohjat, vianmääritysoppaat, parhaat käytännöt

**Liity yhteisöömme saadaksesi:**
- Jaa kokemuksiasi AZD + AI:sta ja saa apua
- Pääsyn uusiin AI-mallipohjien esiversioihin
- Mahdollisuuden vaikuttaa AI-julkaisun parhaisiin käytäntöihin
- Vaikutusmahdollisuuksia tulevien AI + AZD -ominaisuuksien kehitykseen

### Osallistuminen Kurssin Kehitykseen
Otamme mielellämme vastaan osallistumisia! Lue [Osallistumisopas](CONTRIBUTING.md) tiedot:
- **Sisällön Parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uudet Esimerkit**: Lisää käytännön skenaarioita ja mallipohjia  
- **Käännökset**: Auta ylläpitämään monikielistä tukea
- **Virheraportit**: Paranna täsmällisyyttä ja selkeyttä
- **Yhteisön Normit**: Noudata osallistavaa yhteisöpolitiikkaamme

---

## 📄 Kurssin Tiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - katso [LICENSE](../../LICENSE) tiedosto saadaksesi lisätietoja.

### Linkitetyt Microsoftin Oppimateriaalit

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

**🚀 Valmis aloittamaan oppimisen?**

**Aloittelijat**: Aloita [Luvusta 1: Perusteet & Nopeasti käyntiin](../..)  
**AI-kehittäjät**: Siirry suoraan [Lukuun 2: AI-Ensisijainen kehitys](../..)  
**Kokeneet kehittäjät**: Aloita [Luvusta 3: Konfigurointi & Todentaminen](../..)

**Seuraavat vaiheet**: [Aloita luku 1 - AZD perusteet](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattikäännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäinen asiakirja omalla kielellään on virallinen lähde. Tärkeiden tietojen osalta suositellaan ammattimaista ihmis käännöstä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->