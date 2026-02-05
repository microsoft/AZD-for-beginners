# AZD Aloittelijoille: Jäsennelty Oppimismatka

![AZD-for-beginners](../../translated_images/fi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Aloittaminen Tällä Kurssilla

Seuraa näitä askeleita aloittaaksesi AZD-oppimismatkasi:

1. **Tee haarukka (Fork) Repositorysta**: Klikkaa [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa Repositorio**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Liity Yhteisöön**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) asiantuntijatukea varten
4. **Valitse Oppimispolkusi**: Valitse alla oleva luku, joka vastaa kokemustasoasi

### Monikielinen Tuki

#### Automaattiset Käännökset (Aina Päivittyviä)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](./README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Haluatko kloonata paikallisesti?**

> Tämä repositorio sisältää yli 50 käännöstä, mikä lisää merkittävästi latauskokoa. Jos haluat kloonata ilman käännöksiä, käytä sparse checkout -toimintoa:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tämä antaa sinulle kaiken tarvittavan kurssin suorittamiseen paljon nopeammalla latauksella.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurssin Yleiskuvaus

Hallitse Azure Developer CLI (azd) jäsenneltyjen lukujen kautta, jotka on suunniteltu edistyvään oppimiseen. **Erityinen paino AI-sovellusten käyttöönotossa Microsoft Foundryn integraation kanssa.**

### Miksi Tämä Kurssi On Tärkeä Nykyaikaisille Kehittäjille

Microsoft Foundry Discord -yhteisön näkemysten perusteella, **45 % kehittäjistä haluaa käyttää AZD:tä AI-kuormituksiin** mutta kohtaa haasteita:
- Monimutkaiset monipalvelu-AI-arkkitehtuurit
- Tuotantotason AI-käyttöönoton parhaat käytännöt  
- Azure AI -palveluiden integrointi ja konfigurointi
- Kustannusten optimointi AI-kuormituksille
- AI-spesifisten käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Kurssin suorittamalla:
- **Hallitset AZD:n Perusteet**: Keskeiset käsitteet, asennus ja määrittely
- **Käyttöönotat AI-sovelluksia**: Käytä AZD:tä Microsoft Foundry -palveluiden kanssa
- **Toteutat Infrastructure as Code -ratkaisuja**: Hallitse Azure-resursseja Bicep-malleilla
- **Ratkot Käyttöönotto-ongelmia**: Vianmääritys ja ongelmanratkaisu
- **Optimoit Tuotantoon**: Turvallisuus, skaalaus, monitorointi ja kustannusten hallinta
- **Rakennat Moniagenttisia Ratkaisuja**: Monimutkaiset AI-arkkitehtuurit käyttöönotoiksi

## 📚 Oppimislukujen Valinta

*Valitse oppimispolkusi kokemuksen ja tavoitteiden mukaan*

### 🚀 Luku 1: Perusteet & Pikakäynnistys
**Esivaatimukset**: Azure-tilaus, perustason komentorivitaidot  
**Kesto**: 30–45 minuuttia  
**Vaativuus**: ⭐

#### Mitä Opit
- Azure Developer CLI:n perusteet
- AZD:n asennus alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimateriaalit
- **🎯 Aloita Tästä**: [Mikä on Azure Developer CLI?](../..)
- **📖 Teoria**: [AZD:n perusteet](docs/getting-started/azd-basics.md) - Keskeiset käsitteet ja termistö
- **⚙️ Asetus**: [Asennus & Määritys](docs/getting-started/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön Harjoitus**: [Ensimmäinen projektisi](docs/getting-started/first-project.md) - Vaihe vaiheelta opas
- **📋 Pikatukilista**: [Komentojen pikakuvake](resources/cheat-sheet.md)

#### Käytännön Harjoitukset
```bash
# Nopea asennustarkistus
azd version

# Ota käyttöön ensimmäinen sovelluksesi
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun Lopputulos**: Käyttöönotto yksinkertaisen web-sovelluksen Azureen AZD:n avulla

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

**📊 Ajan Käyttö:** 30–45 minuuttia  
**📈 Taitotaso Lopussa:** Pystyy ottamaan perussovelluksia käyttöön itsenäisesti

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

**📊 Ajan Käyttö:** 30–45 minuuttia  
**📈 Taitotaso Lopussa:** Pystyy ottamaan perussovelluksia käyttöön itsenäisesti

---

### 🤖 Luku 2: AI-Ensisijainen Kehitys (Suositeltu AI-kehittäjille)
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 1–2 tuntia  
**Vaativuus**: ⭐⭐

#### Mitä Opit
- Microsoft Foundryn integraatio AZD:n kanssa
- AI-pohjaisten sovellusten käyttöönotto
- AI-palveluiden konfiguraatioiden ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita Tästä**: [Microsoft Foundryn integraatio](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mallit**: [AI-mallien käyttöönotto](docs/microsoft-foundry/ai-model-deployment.md) - AI-mallien käyttöönotto ja hallinta
- **🛠️ Työpaja**: [AI-työpajalaboratorio](docs/microsoft-foundry/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen Opas**: [Työpajamateriaali](workshop/README.md) - Selainpohjainen oppiminen MkDocs * DevContainer -ympäristössä
- **📋 Mallit**: [Microsoft Foundry -mallit](../..)
- **📝 Esimerkit**: [AZD-käyttöönottoesimerkit](examples/README.md)

#### Käytännön Harjoitukset
```bash
# Ota käyttöön ensimmäinen tekoälysovelluksesi
azd init --template azure-search-openai-demo
azd up

# Kokeile lisättyjä tekoälymalleja
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun Lopputulos**: Käyttöönotto ja konfigurointi AI-pohjaiselle chat-sovellukselle, jossa RAG-ominaisuudet

**✅ Onnistumisen Vahvistus:**
```bash
# Luvun 2 jälkeen sinun tulisi osata:
azd init --template azure-search-openai-demo
azd up
# Testata tekoälychat-käyttöliittymää
# Esittää kysymyksiä ja saada tekoälyavusteisia vastauksia lähteineen
# Varmistaa, että hakuintegraatio toimii
azd monitor  # Tarkistaa, että Application Insights näyttää telemetrian
azd down --force --purge
```

**📊 Ajan Käyttö:** 1–2 tuntia  
**📈 Taitotaso Lopussa:** Pystyy ottamaan käyttöön ja konfiguroimaan tuotantovalmiita AI-sovelluksia  
**💰 Kustannustietoisuus:** Ymmärtää kehityskustannukset noin 80-150 $/kk, tuotantokustannukset 300-3500 $/kk

#### 💰 Kustannusnäkökohdat AI-käyttöönotossa

**Kehitysympäristö (arvio noin 80-150 $/kk):**
- Azure OpenAI (Pay-as-you-go): 0-50 $/kk (tokenien käytön mukaan)
- AI Search (Basic-taso): 75 $/kk
- Container Apps (Kulutukseen perustuva): 0-20 $/kk
- Tallennustila (Standard): 1-5 $/kk

**Tuotantoympäristö (arvio noin 300-3 500+ $/kk):**
- Azure OpenAI (PTU tasainen suorituskyky): 3 000+ $/kk TAI Pay-as-you-go suuren volyymin kanssa
- AI Search (Standard-taso): 250 $/kk
- Container Apps (Dedikoitu): 50-100 $/kk
- Application Insights: 5-50 $/kk
- Tallennustila (Premium): 10-50 $/kk

**💡 Kustannusten Optimointivinkit:**
- Käytä **Free Tier** - Azure OpenAI -tasoa oppimiseen (sisältää 50 000 tokenia/kk)
- Suorita `azd down` vapauttaaksesi resursseja, kun et aktiivisesti kehitä
- Aloita kulutukseen perustuvalla laskutuksella, siirry PTU:hun vain tuotantoon
- Käytä `azd provision --preview` arvioidaksesi kustannukset ennen käyttöönottoa
- Ota käyttöön automaattinen skaalaus: maksat vain todellisesta käytöstä

**Kustannusten seuranta:**
```bash
# Tarkista arvioidut kuukausikustannukset
azd provision --preview

# Seuraa todellisia kustannuksia Azure-portaalissa
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Määritys & Todennus
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 45–60 minuuttia  
**Vaativuus**: ⭐⭐

#### Mitä Opit
- Ympäristön määritys ja hallinta
- Todennus- ja turvallisuuskäytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimateriaalit
- **📖 Määritys**: [Määritysohje](docs/getting-started/configuration.md) - Ympäristön perustaminen
- **🔐 Turvallisuus**: [Todennusmallit ja hallittu identiteetti](docs/getting-started/authsecurity.md) - Todennusmallit
- **📝 Esimerkit**: [Tietokantasovellus-esimerkki](examples/database-app/README.md) - AZD:tietokantaesimerkit

#### Käytännön Harjoitukset
- Konfiguroi useita ympäristöjä (dev, staging, prod)
- Määritä hallitun identiteetin todennus
- Toteuta ympäristökohtaiset määritykset

**💡 Luvun Lopputulos**: Hallitse useita ympäristöjä asianmukaisella todennuksella ja turvallisuudella

---

### 🏗️ Luku 4: Infrastructure as Code & Käyttöönotto
**Esivaatimukset**: Luvut 1-3 suoritettu  
**Kesto**: 1–1,5 tuntia  
**Vaativuus**: ⭐⭐⭐

#### Mitä Opit
- Edistyneet käyttöönotto-mallit
- Infrastructure as Code Bicep-kielellä
- Resurssien provisiointistrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Käyttöönotto-opas](docs/deployment/deployment-guide.md) - Kattavat työnkulut
- **🏗️ Provisiointi**: [Resurssien provisiointi](docs/deployment/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App -esimerkki](../../examples/container-app) - Konttien käyttöönotot

#### Käytännön Harjoitukset
- Luo omia Bicep-malleja
- Käyttöönotto monipalvelusovelluksille
- Toteuta sinivihreä käyttöönotto (blue-green)

**💡 Luvun Lopputulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia omilla infrastruktuurimalleilla

---

### 🎯 Luku 5: Moniagenttiset AI-ratkaisut (Edistynyt)
**Esivaatimukset**: Luvut 1-2 suoritettu  
**Kesto**: 2–3 tuntia  
**Vaativuus**: ⭐⭐⭐⭐
#### Mitä opit
- Moniagenttien arkkitehtuurimallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit tekoälyn käyttöönotot

#### Oppimisresurssit
- **🤖 Esittelyprojekti**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM-mallipaketit**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Yhden klikkauksen käyttöönotto
- **📖 Arkkitehtuuri**: [Moniagenttien koordinointimallit](/docs/pre-deployment/coordination-patterns.md) - Mallit

#### Käytännön harjoitukset
```bash
# Ota käyttöön täydellinen vähittäiskaupan moniedustajaratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutustu agenttien kokoonpanoihin
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Lukujen tulos**: Ota käyttöön ja hallinnoi tuotantovalmiita moniagenttisia tekoälyratkaisuja Customer- ja Inventory-agenttien kanssa

---

### 🔍 Luku 6: Esivalmistelun validointi ja suunnittelu
**Edeltävät vaatimukset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Kapasiteetin suunnittelu ja resurssien varmistaminen
- SKU-valintastrategiat
- Esilento-tarkistukset ja automaatio

#### Oppimisresurssit
- **📊 Suunnittelu**: [Kapasiteetin suunnittelu](docs/pre-deployment/capacity-planning.md) - Resurssien validoiminen
- **💰 Valinta**: [SKU-valinta](docs/pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Validointi**: [Esilento-tarkistukset](docs/pre-deployment/preflight-checks.md) - Automaattiset skriptit

#### Käytännön harjoitukset
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten perusteella
- Toteuta automaattiset esivalmistelutarkistukset

**💡 Lukujen tulos**: Varmista ja optimoi käyttöönotot ennen toteutusta

---

### 🚨 Luku 7: Vianmääritys ja virheiden korjaus
**Edeltävät vaatimukset**: Mikä tahansa käyttöönotto-luku suoritettu  
**Kesto**: 1-1,5 tuntia  
**Vaativuus**: ⭐⭐

#### Mitä opit
- Järjestelmälliset vianetsintätavat
- Yleiset ongelmat ja ratkaisut
- Tekoälyyn liittyvä vianmääritys

#### Oppimisresurssit
- **🔧 Yleiset ongelmat**: [Yleiset ongelmat](docs/troubleshooting/common-issues.md) - FAQ ja ratkaisut
- **🕵️ Virheiden korjaus**: [Vianmääritysohje](docs/troubleshooting/debugging.md) - Askel askeleelta -strategiat
- **🤖 Tekoälyongelmat**: [Tekoälyä koskeva vianmääritys](docs/troubleshooting/ai-troubleshooting.md) - Tekoälypalvelujen ongelmat

#### Käytännön harjoitukset
- Diagnosoi käyttöönoton epäonnistumiset
- Korjaa tunnistautumisongelmat
- Vianmääritys tekoälypalvelun yhteyksissä

**💡 Lukujen tulos**: Diagnosoi ja ratkaise yleiset käyttöönotto-ongelmat itsenäisesti

---

### 🏢 Luku 8: Tuotanto- ja yritysmallit
**Edeltävät vaatimukset**: Luvut 1-4 suoritettu  
**Kesto**: 2-3 tuntia  
**Vaativuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantoon soveltuvat käyttöönotto-strategiat
- Yritysturvallisuusmallit
- Valvonta ja kustannusten optimointi

#### Oppimisresurssit
- **🏭 Tuotanto**: [Tuotantotekoälyn parhaat käytännöt](docs/microsoft-foundry/production-ai-practices.md) - Yritysmallit
- **📝 Esimerkit**: [Mikropalveluesimerkki](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Valvonta**: [Application Insights -integraatio](docs/pre-deployment/application-insights.md) - Valvonta

#### Käytännön harjoitukset
- Toteuta yritysturvallisuusmallit
- Ota käyttöön kattava valvonta
- Käyttöönotto tuotantoon asianmukaisella hallinnolla

**💡 Lukujen tulos**: Ota käyttöön yritysvalmiita sovelluksia täysillä tuotantoominaisuuksilla

---

## 🎓 Työpajan yleiskuvaus: Käytännön oppimiskokemus

> **⚠️ TYÖPAJA TILA: Kehityksen alla**  
> Työpajamateriaalit ovat parhaillaan kehityksessä ja tarkennuksessa. Ydinmoduulit toimivat, mutta jotkin edistyneet osiot ovat vielä keskeneräisiä. Työskentelemme aktiivisesti koko sisällön täydentämiseksi. [Seuraa etenemistä →](workshop/README.md)

### Interaktiivinen työpajamateriaali
**Laaja käytännön oppimiskokemus selaimessa, ohjattu harjoittelulla**

Työpajamateriaalimme tarjoavat rakenteellisen ja interaktiivisen oppimiskokemuksen, joka täydentää ylläolevaa lukujaottelua. Työpaja soveltuu sekä itsenäiseen opiskeluun että opettajan ohjaamiin sessioihin.

#### 🛠️ Työpajan ominaisuudet
- **Selaimessa toimiva käyttöliittymä**: Täydellinen MkDocs-pohjainen workshop haku-, kopiointi- ja teematoiminnoilla
- **GitHub Codespaces -integraatio**: Yhden klikkauksen kehitysympäristön käyttöönotto
- **Rakenteellinen oppimispolku**: 7-vaiheinen ohjattu harjoittelu (3,5 tuntia yhteensä)
- **Discovery → Deployment → Customization**: Jatkuva metodologia
- **Interaktiivinen DevContainer-ympäristö**: Esiasennetut työkalut ja riippuvuudet

#### 📚 Työpajan rakenne
Työpaja rakentuu metodologian **Discovery → Deployment → Customization** mukaan:

1. **Discovery-vaihe** (45 min)
   - Tutustu Microsoft Foundry -malleihin ja palveluihin
   - Ymmärrä moniagenttien arkkitehtuurimallit
   - Tarkastele käyttöönoton vaatimuksia ja edellytyksiä

2. **Deployment-vaihe** (2 tuntia)
   - Tehtävään keskittyvä AI-sovellusten käyttöönotto AZD:llä
   - Konfiguroi Azure AI -palvelut ja rajapinnat
   - Toteuta turvallisuus- ja autentikointimallit

3. **Customization-vaihe** (45 min)
   - Muokkaa sovelluksia erityiskäyttötapauksiin
   - Optimoi tuotantokäyttöön
   - Ota käyttöön valvonta ja kustannusten hallinta

#### 🚀 Työpajan aloitus
```bash
# Vaihtoehto 1: GitHub Codespaces (Suositeltu)
# Napsauta "Code" → "Create codespace on main" repositoriossa

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Seuraa asennusohjeita tiedostossa workshop/README.md
```

#### 🎯 Työpajan oppimistavoitteet
Työpajan suorittaneet osallistujat:
- **Ottavat käyttöön tuotantotekoälysovelluksia**: Käytä AZD:tä Microsoft Foundryn palvelujen kanssa
- **Hallinnoivat moniagenttisia arkkitehtuureja**: Toteuta koordinoituja AI-agenttiratkaisuja
- **Toteuttavat turvallisuuden parhaat käytännöt**: Määritä autentikointi ja käyttöoikeudet
- **Optimoivat laajennettavuuden**: Suunnittele kustannustehokkaat ja suorituskykyiset käyttöönotot
- **Vianmääritystä käyttöönotossa**: Ratkaise yleiset ongelmat itsenäisesti

#### 📖 Työpajan resurssit
- **🎥 Interaktiivinen opas**: [Työpajan materiaalit](workshop/README.md) - Selaimessa toimiva oppimisympäristö
- **📋 Vaiheittaiset ohjeet**: [Ohjatut harjoitukset](../../workshop/docs/instructions) - Yksityiskohtaiset läpikäynnit
- **🛠️ AI-työpajalaki**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-keskeiset harjoitukset
- **💡 Käyttöönoton pikaopas**: [Työpajan käyttöönotto-opas](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Täydellinen yrityskoulutuksiin, yliopistokursseille, itsenäiseen oppimiseen ja kehittäjien bootcampeihin.**

---

## 📖 Mikä on Azure Developer CLI?

Azure Developer CLI (azd) on kehittäjäkeskeinen komentorivityökalu, joka nopeuttaa sovellusten rakentamista ja käyttöönottoa Azureen. Se tarjoaa:

- **Malli-pohjaiset käyttöönotot** - Käytä esirakennettuja malleja yleisiin sovellusmalleihin  
- **Infrastruktuuri koodina** - Hallitse Azure-resursseja Bicepillä tai Terraformilla  
- **Integroitu työnkulku** - Tarjoaa saumattoman provisioinnin, käyttöönoton ja valvonnan  
- **Kehittäjäystävällinen** - Optimoitu kehittäjän tuottavuuteen ja käyttökokemukseen

### **AZD + Microsoft Foundry: Täydellinen tekoälyn käyttöönottoon**

**Miksi AZD tekoälyratkaisuille?** AZD ratkaisee tekoälykehittäjien yleisimmät haasteet:

- **Tekoälyvalmiit mallit** - Esikonfiguroidut mallit Azure OpenAI:lle, Cognitive Servicesille ja ML-kuormille  
- **Turvalliset tekoälyn käyttöönotot** - Sisäänrakennetut turvallisuusmallit AI-palveluille, API-avaimille ja mallin rajapinnoille  
- **Tuotannon AI-mallit** - Parhaat käytännöt laajasti skaalautuville, kustannustehokkaille AI-sovelluksille  
- **End-to-End AI-työnkulut** - Mallin kehityksestä tuotantoon asianmukaisella valvonnalla  
- **Kustannusten optimointi** - Älykkäät resurssien allokointistrategiat ja skaalaus AI-kuormille  
- **Microsoft Foundry -integraatio** - Saumaton yhdistettävyys Microsoft Foundryn mallikatalogiin ja rajapintoihin

---

## 🎯 Mallit & esimerkkikirjasto

### Esittelyssä: Microsoft Foundryn mallit
**Aloita täältä, jos otat AI-sovelluksia käyttöön!**

> **Huom:** Nämä mallit esittelevät erilaisia AI-malleja. Osa on ulkoisia Azure-esimerkkejä, osa paikallisia toteutuksia.

| Malli | Luku | Vaativuus | Palvelut | Tyyppi |
|----------|---------|------------|----------|------|
| [**Aloita AI-keskustelulla**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ulkoinen |
| [**Aloita AI-agenttien kanssa**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ulkoinen |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ulkoinen |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ulkoinen |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ulkoinen |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ulkoinen |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esittelyssä: Täydelliset oppimistilanteet
**Tuotantovalmiit sovellusmallit oppimislukuihin sovitettuna**

| Malli | Oppimisluku | Vaativuus | Keskeinen oppiminen |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perustason AI-käyttöönoton mallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchillä |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Dokumenttien älykkyyden integrointi |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agenttikehys ja funktiokutsu |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yrityksen AI-orkestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moniagenttiarkkitehtuuri Customer- ja Inventory-agenttien kanssa |

### Oppiminen esimerkkityypin mukaan

> **📌 Paikalliset vs. Ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Välittömästi käytettävissä  
> **Ulkopuoliset esimerkit** (Azure Samplet) = Kloonattavissa linkatuista repoista

#### Paikalliset esimerkit (valmiit käytettäväksi)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Täydellinen tuotantovalmiiksi toteutus ARM-malleilla
  - Moniagenttiarkkitehtuuri (Customer + Inventory-agentit)
  - Kattava valvonta ja arviointi
  - Yhden klikkauksen käyttöönotto ARM-mallilla

#### Paikalliset esimerkit - Säiliösovellukset (Luvut 2-5)
**Kattavat konttikäyttöönottoesimerkit tässä repossa:**
- [**Container App Examples**](examples/container-app/README.md) - Täydellinen opas säilöitettyihin käyttöönottoihin
  - [Yksinkertainen Flask-API](../../examples/container-app/simple-flask-api) - Perustason REST API, skaalautuu nollaan
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices) - Tuotantovalmiit moni-palveluiden käyttöönotot
  - Nopeaan alkuun, tuotanto- ja edistyneet käyttöönotot
  - Valvonta, tietoturva ja kustannusten optimointi ohjeet

#### Ulkoiset esimerkit - Yksinkertaiset sovellukset (Luvut 1-2)
**Kloonaa nämä Azure Sample repositoriat aloitukseen:**
- [Yksinkertainen Web-sovellus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Perus käyttöönoton mallit
- [Staattinen verkkosivusto - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön käyttöönotto
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API käyttöönotto

#### Ulkoiset esimerkit - Tietokantaintegraatio (Luvut 3-4)  
- [Tietokantasovellus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantayhteysmallit
- [Toiminnot + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless-data työnkulku

#### Ulkoiset esimerkit - Edistyneet mallit (Luvut 4-8)
- [Java-mikropalvelut](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessointi  
- [Yrityksen ML-putki](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit koneoppimismallit

### Ulkoiset mallikokoelmat
- [**Virallinen AZD-malligalleria**](https://azure.github.io/awesome-azd/) - Koottu kokoelma virallisista ja yhteisön malleista
- [**Azure Developer CLI -mallit**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Esimerkkihakemisto**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisine selityksineen

---

## 📚 Oppimisresurssit & Viitteet

### Pikaoppaat
- [**Komentojen pikasivu**](resources/cheat-sheet.md) - Keskeiset azd-komennot järjestettynä lukuihin
- [**Sanasto**](resources/glossary.md) - Azure- ja azd-terminologia  
- [**UKK**](resources/faq.md) - Yleisiä kysymyksiä järjestettynä oppimislukuihin
- [**Opiskeluopas**](resources/study-guide.md) - Kattavat harjoitustehtävät

### Käytännön työpajat
- [**AI-työpajatyöhuone**](docs/microsoft-foundry/ai-workshop-lab.md) - Tee tekoälysovelluksistasi AZD-käyttöönotettavia (2–3 tuntia)
- [**Interaktiivinen työpajaopas**](workshop/README.md) - Selaimessa toimiva työpaja MkDocsilla ja DevContainer-ympäristöllä
- [**Jäsennelty oppimispolku**](../../workshop/docs/instructions) - 7-vaiheiset ohjatut harjoitukset (löytö → käyttöönotto → mukauttaminen)
- [**AZD Aloittelijoille -työpaja**](workshop/README.md) - Täydelliset käytännön työpajamateriaalit GitHub Codespaces -integraatiolla

### Ulkoiset oppimisresurssit
- Azure Developer CLI -dokumentaatio: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure arkkitehtuurikeskus: https://learn.microsoft.com/en-us/azure/architecture/
- Azure-hinnoittelulaskuri: https://azure.microsoft.com/pricing/calculator/
- Azure-palveluiden tila: https://status.azure.com/

---

## 🔧 Pikaongelmanratkaisuopas

**Usein aloittelijoiden kohtaamat ongelmat ja välittömät ratkaisut:**

### ❌ "azd: komentoa ei löydy"

```bash
# Asenna AZD ensin
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Vahvista asennus
azd version
```

### ❌ "Ei tilausta löydetty" tai "Tilausta ei asetettu"

```bash
# Listaa saatavilla olevat tilaukset
az account list --output table

# Aseta oletustilaus
az account set --subscription "<subscription-id-or-name>"

# Aseta AZD-ympäristöä varten
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
# Muokkaa infra/main.parameters.json-tiedostoa:
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

### ❌ "Varmennus epäonnistui" tai "Token vanhentunut"

```bash
# Uudelleentodennus
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

### ❌ Mallin käyttöönotto kestää liian kauan

**Normaali odotusaika:**
- Yksinkertainen verkkosovellus: 5–10 minuuttia
- Sovellus tietokannalla: 10–15 minuuttia
- Tekoälysovellukset: 15–25 minuuttia (OpenAI:n käyttöönotto on hidasta)

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
# - User Access Administrator (roolijärjestelyihin)
```

### ❌ Asennetun sovelluksen URL-osoitetta ei löydy

```bash
# Näytä kaikki palvelupisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```

### 📚 Kattavat vianmääritysresurssit

- **Yleiset ongelmat:** [Yksityiskohtaiset ratkaisut](docs/troubleshooting/common-issues.md)
- **Tekoälykohtaiset ongelmat:** [AI-vianmääritys](docs/troubleshooting/ai-troubleshooting.md)
- **Virheenetsintäopas:** [Vaiheittainen virheenetsintä](docs/troubleshooting/debugging.md)
- **Hanki apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Pikaongelmanratkaisuopas

**Usein aloittelijoiden kohtaamat ongelmat ja välittömät ratkaisut:**

<details>
<summary><strong>❌ "azd: komentoa ei löydy"</strong></summary>

```bash
# Asenna AZD ensin
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
<summary><strong>❌ "Ei tilausta löydetty" tai "Tilausta ei asetettu"</strong></summary>

```bash
# Listaa käytettävissä olevat tilaukset
az account list --output table

# Aseta oletustilaus
az account set --subscription "<subscription-id-or-name>"

# Aseta AZD-ympäristöä varten
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
<summary><strong>❌ "Varmennus epäonnistui" tai "Token vanhentunut"</strong></summary>

```bash
# Uudelleentodennus
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
# AZD generoi ainutlaatuisia nimiä, mutta jos ristiriita:
azd down --force --purge

# Sitten yritä uudelleen uudella ympäristöllä
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mallin käyttöönotto kestää liian kauan</strong></summary>

**Normaali odotusaika:**
- Yksinkertainen verkkosovellus: 5–10 minuuttia
- Sovellus tietokannalla: 10–15 minuuttia
- Tekoälysovellukset: 15–25 minuuttia (OpenAI:n käyttöönotto on hidasta)

```bash
# Tarkista eteneminen
azd show

# Jos jumissa yli 30 minuuttia, tarkista Azure-portaali:
azd monitor
# Etsi epäonnistuneet käyttöönotot
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
# - User Access Administrator (roolien määrityksiin)
```
</details>

<details>
<summary><strong>❌ Asennetun sovelluksen URL-osoitetta ei löydy</strong></summary>

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

### 📚 Kattavat vianmääritysresurssit

- **Yleiset ongelmat:** [Yksityiskohtaiset ratkaisut](docs/troubleshooting/common-issues.md)
- **Tekoälykohtaiset ongelmat:** [AI-vianmääritys](docs/troubleshooting/ai-troubleshooting.md)
- **Virheenetsintäopas:** [Vaiheittainen virheenetsintä](docs/troubleshooting/debugging.md)
- **Hanki apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suorittaminen & Sertifiointi

### Edistymisen seuranta
Seuraa oppimistasi kussakin luvussa:

- [ ] **Luku 1**: Perusteet & Nopea aloitus ✅
- [ ] **Luku 2**: AI-ensimmäinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & Varmennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & Käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Ennakollinen tarkastus & Suunnittelu ✅
- [ ] **Luku 7**: Vianetsintä & Virheenetsintä ✅
- [ ] **Luku 8**: Tuotanto & Yritysmallit ✅

### Oppimisen varmistaminen
Suoritettuasi jokaisen luvun, varmista osaamisesi:
1. **Käytännön harjoitus**: Suorita luvun käytännön käyttöönotto
2. **Tietovisa**: Tarkista luvun UKK-osio
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavalle vaativuustasolle

### Kurssin suorittamisen hyödyt
Kun olet suorittanut kaikki luvut, sinulla on:
- **Tuotantokokemus**: Toteuttanut todellisia AI-sovelluksia Azureen
- **Ammatilliset taidot**: Yrityskäyttöön valmiit käyttöönotto-osaamiset  
- **Yhteisön tunnustus**: Aktiivinen jäsen Azure-kehittäjäyhteisössä
- **Urapolun eteneminen**: Kysytyt AZD- ja AI-käyttöönotto-osaamiset

---

## 🤝 Yhteisö & Tuki

### Hanki apua & tukea
- **Tekniset ongelmat**: [Ilmoita virheistä ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord -yhteisö](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tekoälykohtainen apu**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) -kanavalle
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemyksiä Microsoft Foundry Discordista

**Äskettäiset kyselytulokset #Azure-kanavalta:**
- **45 %** kehittäjistä haluaa käyttää AZD:tä AI-työkuormiin
- **Suurimmat haasteet**: Monipalvelukäyttöönotot, tunnistetietojen hallinta, tuotantovalmius  
- **Suosituimmat pyynnöt**: AI-kohtaiset mallit, vianetsintäoppaat, parhaat käytännöt

**Liity yhteisöömme:**
- Jaa kokemuksesi AZD:n ja AI:n kanssa ja saa apua
- Pääse käsiksi uusiin AI-malleihin ennakkoon
- Osallistu AI-käyttöönoton parhaiden käytäntöjen kehittämiseen
- Vaikuta tuleviin AI + AZD -ominaisuuksiin

### Osallistuminen kurssiin
Toivotamme panokset tervetulleiksi! Lue [Osallistumisopas](CONTRIBUTING.md) saadaksesi tietoa:
- **Sisällön parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uudet esimerkit**: Lisää todellisia skenaarioita ja malleja  
- **Käännös**: Auta monikielisen tuen ylläpidossa
- **Virheraportit**: Paranna tarkkuutta ja selkeyttä
- **Yhteisön säännöt**: Noudata osallistavaa yhteisöohjeistustamme

---

## 📄 Kurssin tiedot

### Lisenssi
Tämä projekti on lisensoitu MIT-lisenssillä - katso [LICENSE](../../LICENSE) tiedosto lisätiedoista.

### Muut Microsoftin oppimisresurssit

Tiimimme tuottaa myös muita kattavia oppimiskursseja:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j Aloittelijoille](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js Aloittelijoille](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain Aloittelijoille](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agentit
[![AZD Aloittelijoille](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI Aloittelijoille](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP Aloittelijoille](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agentit Aloittelijoille](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivinen AI -sarja
[![Generatiivinen AI Aloittelijoille](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Perusopiskelu
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

## 🗺️ Kurssin navigointi

**🚀 Valmis aloittamaan oppiminen?**

**Aloittelijat**: Aloita [Luvusta 1: Perusteet & Pikakäynnistys](../..)  
**AI-kehittäjät**: Siirry kohtaan [Luku 2: AI-ensimmäinen kehitys](../..)  
**Kokeneet kehittäjät**: Aloita [Luvusta 3: Määritys & Autentikointi](../..)

**Seuraavat askeleet**: [Aloita Luku 1 - AZD:n perusteet](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Pyrimme tarkkuuteen, mutta huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää virallisena lähteenä. Tärkeiden tietojen osalta suosittelemme ammattimaisen ihmiskääntäjän käyttöä. Emme ole vastuussa tästä käännöksestä johtuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->